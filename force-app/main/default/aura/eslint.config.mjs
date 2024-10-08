import salesforceEslintPluginAura from "@salesforce/eslint-plugin-aura";
import path from "node:path";
import { fileURLToPath } from "node:url";
import js from "@eslint/js";
import { FlatCompat } from "@eslint/eslintrc";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const compat = new FlatCompat({
    baseDirectory: __dirname,
    recommendedConfig: js.configs.recommended,
    allConfig: js.configs.all
});

export default [...compat.extends("plugin:@salesforce/eslint-plugin-aura/recommended"), {
    plugins: {
        "@salesforce/aura": salesforceEslintPluginAura,
    },

    rules: {
        "vars-on-top": "off",
        "no-unused-expressions": "off",
    },
}];