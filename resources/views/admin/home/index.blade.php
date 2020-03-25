@extends('admin.base')

@section('title', '首页')

@section('content')
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-header"><h2>Environment</h2></div>
                <div class="layui-card-body">
                    <div>Server: {{ request()->server('SERVER_SOFTWARE') }}</div>
                    <div>PHP: {{ phpversion() }}</div>
                    <div>GD Library: {{ gd_info()['GD Version'] }}</div>
                    <div>OPCache: {{ $opcache }}</div>
                    <div>Memory Limit: {{ ini_get('memory_limit') }}</div>
                    <div>Laravel: {{ \App::version() }}</div>
                    <div>Database: {{ \DB::connection()->getPdo()->getAttribute(\PDO::ATTR_SERVER_VERSION) }}</div>
                </div>
            </div>
        </div>
@endsection

@section('js')
    <script>
    </script>
@endsection
