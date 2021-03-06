<?php

namespace App\Http\Requests\Front;

use App\Foundation\Regexp;
use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'email' => [
                'required',
                'regex:/' . Regexp::EMAIL . '/',
            ],
            'password' => 'required',
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'email.required' => 'Email不能为空',
            'email.regex' => 'Email格式有误',
            'password.required' => '密码不能为空',
        ];
    }
}
