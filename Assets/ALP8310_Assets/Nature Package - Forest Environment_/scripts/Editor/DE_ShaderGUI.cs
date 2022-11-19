/*  
    10/13/2021
    support: David Olshefski - http://deenvironment.com/
    support: Cristian Pop - https://boxophobic.com/
*/
using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

public class DE_ShaderGUI : ShaderGUI
{
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
    {
        var material0 = materialEditor.target as Material;
        //var materials = materialEditor.targets;

        //if (materials.Length > 1)
        //    multiSelection = true;

        DrawDynamicInspector(material0, materialEditor, props);

        //foreach (Material material in materials)
        //{

        //}
    }

    void DrawDynamicInspector(Material material, MaterialEditor materialEditor, MaterialProperty[] props)
    {
        var customPropsList = new List<MaterialProperty>();

        for (int i = 0; i < props.Length; i++)
        {
            var prop = props[i];

            if (prop.flags == MaterialProperty.PropFlags.HideInInspector)
                continue;

            // Hide properties with more drawers
            if (prop.name == "unity_Lightmaps")
                continue;

            if (prop.name == "unity_LightmapsInd")
                continue;

            if (prop.name == "unity_ShadowMasks")
                continue;

            customPropsList.Add(prop);
        }

        //Draw Custom GUI
        for (int i = 0; i < customPropsList.Count; i++)
        {
            var prop = customPropsList[i];

            materialEditor.ShaderProperty(prop, prop.displayName);

        }

        GUILayout.Space(10);

        GUILayout.Label("ADVANCED", new GUIStyle(EditorStyles.boldLabel));

        if (material.HasProperty("_QueueControl") && material.HasProperty("_QueueOffset"))
        {
            var control = material.GetInt("_QueueControl");
            var offset = material.GetInt("_QueueOffset");

            // Initial fix because it is -1
            if (control < 0)
            {
                control = 0;
            }

            control = EditorGUILayout.Popup("Queue Control", control, new string[] { "Auto", "User Defined"} );

            if (control == 0)
            {
                offset = EditorGUILayout.IntSlider("Sorting Priority", offset, -50, 50);

                if (material.GetTag("RenderType", false) == "Transparent")
                {
                    material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent + offset;
                }
                else
                {
                    material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.AlphaTest + offset;
                }
            }
            else
            {
                materialEditor.RenderQueueField();
            }

            material.SetInt("_QueueControl", control);
            material.SetInt("_QueueOffset", offset);
        }

        if (!material.HasProperty("_QueueControl") && material.HasProperty("_QueueOffset"))
        {
            var offset = material.GetInt("_QueueOffset");

            offset = EditorGUILayout.IntSlider("Sorting Priority", offset, -50, 50);

            if (material.GetTag("RenderType", false) == "Transparent")
            {
                material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent + offset;
            }
            else
            {
                material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.AlphaTest + offset;
            }

            material.SetInt("_QueueOffset", offset);
        }

        if (!material.HasProperty("_QueueControl") && !material.HasProperty("_QueueOffset"))
        {
            materialEditor.RenderQueueField();
        }

        materialEditor.EnableInstancingField();
        materialEditor.DoubleSidedGIField();

    }
}

