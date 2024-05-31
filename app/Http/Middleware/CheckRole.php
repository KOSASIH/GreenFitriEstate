// app/Http/Middleware/CheckRole.php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class CheckRole
{
    public function handle(Request $request, Closure $next,...$roles)
    {
        if (!Auth::user()->hasRole($roles)) {
            abort(403);
        }

        return $next($request);
    }
}
