// app/Http/Kernel.php

protected $routeMiddleware = [
    //...
    'role' => \App\Http\Middleware\CheckRole::class,
];
