Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89228854D70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 16:55:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lvqkGmDf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZjTX3PyZz3fQH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 02:55:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lvqkGmDf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZjSp0M0Bz3c55
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 02:55:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F7B261A6D;
	Wed, 14 Feb 2024 15:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00213C43399;
	Wed, 14 Feb 2024 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707926102;
	bh=I5QmVlSxsPE/Gk4+HnD06ucKGeusZCkAT0pMy1rJFdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvqkGmDfiWK0/udDnfCBRaDRe2kArttC6QTkDsM1BxGHPZTBnbzWYTP4veP3ZargP
	 aa80u28eGTmb3HYZ6oGtKR65HcpjxycM1VMzPS4fYFTC0EbeI+rblhYH5Pxe8kkoTk
	 piWqBbRlZ3WUN8Ur08uVW+pleZvBCYBuFxtDvJH0kTxKRxdrLHSaweAq9p/Ya8HFOM
	 sD0nomU3aUbzp3g/hO/j9ABxNQ+PevDhv8jT7tFPC+GjPBI0HImRZV6jPzw3axLIAC
	 CzUwM/eHkXlHKHd9XW1i4L3SQ30mWBeGeaEFgIOQeI9Ks+AjSmvK9B5bf7NlwGMfJr
	 fmbaBGfW564vw==
Date: Wed, 14 Feb 2024 15:54:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] tty: hvc: Don't enable the RISC-V SBI console by default
Message-ID: <20240214-impound-gumdrop-230d0725f5ce@spud>
References: <20240214153429.16484-2-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZpSavjsIcxHJ5llO"
Content-Disposition: inline
In-Reply-To: <20240214153429.16484-2-palmer@rivosinc.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: apatel@ventanamicro.com, Emil Renner Berthing <kernel@esmil.dk>, Greg KH <gregkh@linuxfoundation.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ZpSavjsIcxHJ5llO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 07:34:30AM -0800, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> The new SBI console has the same problem as the old one: there's only
> one shared backing hardware and no synchronization, so the two drivers
> end up stepping on each other.  This was the same issue the old SBI-0.1
> console drivers had, but that was disabled by default when SBI-0.1 was.
>=20
> So just mark the new driver as nonportable.
>=20
> Reported-by: Emil Renner Berthing <kernel@esmil.dk>
> Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI drive=
r")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

As was brought up when we covered this earlier today, if you're going to
probe a driver based on an ecall, the same hardware should not remain
enabled in the DT passed to the kernel.
If you want to enable this driver in a multiplatform kernel alongside
"real" drivers, then the solution is simple, firmware needs implementation
needs to patch the DT and, at least, mark the uart as reserved if it is
using it to provide the debug console. Marking this nonportable so that
people only walk into this with their eyes open seems like a reasonable
action to me.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  drivers/tty/hvc/Kconfig | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
> index 6e05c5c7bca1..c2a4e88b328f 100644
> --- a/drivers/tty/hvc/Kconfig
> +++ b/drivers/tty/hvc/Kconfig
> @@ -108,13 +108,15 @@ config HVC_DCC_SERIALIZE_SMP
> =20
>  config HVC_RISCV_SBI
>  	bool "RISC-V SBI console support"
> -	depends on RISCV_SBI
> +	depends on RISCV_SBI && NONPORTABLE
>  	select HVC_DRIVER
>  	help
>  	  This enables support for console output via RISC-V SBI calls, which
> -	  is normally used only during boot to output printk.
> +	  is normally used only during boot to output printk.  This driver
> +	  conflicts with real console drivers and should not be enabled on
> +	  systems that directly access the console.
> =20
> -	  If you don't know what do to here, say Y.
> +	  If you don't know what do to here, say N.
> =20
>  config HVCS
>  	tristate "IBM Hypervisor Virtual Console Server support"
> --=20
> 2.43.0
>=20
>=20

--ZpSavjsIcxHJ5llO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcziUQAKCRB4tDGHoIJi
0ha2AP4h37dfZJEi2Ma4Nfwx6PGVD0xADFSNtFYCxflzdgLW7AD+OawAfKCLrXnJ
5fR1lKUHo+712HP3zmc1aJ6D2m0LTg8=
=3+DZ
-----END PGP SIGNATURE-----

--ZpSavjsIcxHJ5llO--
