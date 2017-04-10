import riot from 'rollup-plugin-riot'
import buble from 'rollup-plugin-buble'
import cjs from 'rollup-plugin-commonjs'
import globals from 'rollup-plugin-node-globals'
import replace from 'rollup-plugin-replace'
import resolve from 'rollup-plugin-node-resolve'
import filesize from 'rollup-plugin-filesize'
import uglify from 'rollup-plugin-uglify';
import progress from 'rollup-plugin-progress';


const plugins = [
    riot(),
    buble(),
    cjs({
        exclude: 'node_modules/process-es6/**',
        include: []
    }),
    globals(),
    replace({ 'process.env.NODE_ENV': JSON.stringify('development') }),
    resolve({
        browser: true,
        main: true
    }),
    progress(),    
    uglify(),
    filesize(),
];

export default {
  dest: 'dist/guru.min.js',
  entry: 'src/entry.js',
  format: 'iife',
  plugins,
}
