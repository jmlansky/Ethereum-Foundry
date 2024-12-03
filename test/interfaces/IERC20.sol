// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IERC20 Interface
/// @dev Interface del estándar ERC-20 actualizado para Solidity 0.8.20
interface IERC20 {
    /// @notice Emitted cuando `value` tokens son transferidos de `from` a `to`.
    event Transfer(address indexed from, address indexed to, uint256 value);

    /// @notice Emitted cuando el permiso de un `spender` para un `owner` se establece en `value`.
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /// @notice Devuelve el suministro total de tokens en circulación.
    function totalSupply() external view returns (uint256);

    /// @notice Devuelve el balance de tokens de una cuenta específica.
    function balanceOf(address account) external view returns (uint256);

    /// @notice Transfiere `amount` tokens a la dirección `to`.
    /// @return Devuelve true si la transferencia fue exitosa.
    function transfer(address to, uint256 amount) external returns (bool);

    /// @notice Devuelve la cantidad que un `spender` puede gastar en nombre de un `owner`.
    function allowance(address owner, address spender) external view returns (uint256);

    /// @notice Establece la cantidad `amount` como el gasto permitido para `spender` en nombre del llamador.
    /// @return Devuelve true si la operación fue exitosa.
    function approve(address spender, uint256 amount) external returns (bool);

    /// @notice Transfiere `amount` tokens desde `from` hacia `to` utilizando la asignación permitida.
    /// @return Devuelve true si la operación fue exitosa.
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}
