Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D767D3BEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 18:13:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XzA9rfZ/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDgGL5xtzz3cWF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 03:13:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XzA9rfZ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDgFR65jyz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 03:12:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 23B88CE2653;
	Mon, 23 Oct 2023 16:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03081C433C7;
	Mon, 23 Oct 2023 16:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698077544;
	bh=qAfQfnASOwEw2I1gSh1b9F780q6nwNnSsTKiLZYyBng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzA9rfZ/HTWtxZjcRBdJNKOSmh83i3j8GjdkLLwpKO0H0+KVvubOCuu+yXp1q2JfG
	 OGjMVjykfulsDO8fMaaVx9FUXu6Nu3/VvFMggrO9hqGdZ+xaL0IIYd8ltX5UMEPFvQ
	 il+Wr8irRSLnuXdHD9OhO4M2f9QxXgeDgUVM0M9eJnVwlzisnooQHfOHhe52seCUBg
	 GiVKIaTeweS00NGn7PW6BZyDjFs41Q4SJ0pgHfyc2Xyn+LLFgBC6Ou8KOGW0bfELDN
	 f3zeAvuMDoqa6I2R+LtuRQyBBVtvQLLog2Onai3b2/bTJmtHOi+eQQkk99hIpbyCmi
	 Ur02VlSxeGaWQ==
Date: Mon, 23 Oct 2023 17:12:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] kexec: fix KEXEC_FILE dependencies
Message-ID: <20231023-grower-riches-76ab00195002@spud>
References: <20231023110308.1202042-1-arnd@kernel.org>
 <20231023-thievish-imitation-c7c4b36d76f1@spud>
 <67ddd260-d424-4229-a815-e3fcfb864a77@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RprDvLMNxjsipoGk"
Content-Disposition: inline
In-Reply-To: <67ddd260-d424-4229-a815-e3fcfb864a77@app.fastmail.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Ard Biesheuvel <ardb@kernel.org>, linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--RprDvLMNxjsipoGk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 06:04:06PM +0200, Arnd Bergmann wrote:
> On Mon, Oct 23, 2023, at 17:37, Conor Dooley wrote:
> > On Mon, Oct 23, 2023 at 01:01:54PM +0200, Arnd Bergmann wrote:
>=20
> >> index 25474f8c12b79..f571bad2d22d0 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -687,9 +687,7 @@ config ARCH_SELECTS_KEXEC_FILE
> >>  	select KEXEC_ELF
> >> =20
> >>  config ARCH_SUPPORTS_KEXEC_PURGATORY
> >> -	def_bool KEXEC_FILE
> >> -	depends on CRYPTO=3Dy
> >> -	depends on CRYPTO_SHA256=3Dy
> >> +	def_bool y
> >
> > This being the problem, KEXEC_FILE is 64-bit only.
> >
> > IIRC I commented on this same thing during the original conversion
> > patches.
>=20
> Does it work with this patch on top?

Yah, that modification builds.

rv32 being the redheaded stepchild strikes again :!

Cheers,
Conor.

>=20
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -687,7 +687,7 @@ config ARCH_SELECTS_KEXEC_FILE
>         select KEXEC_ELF
> =20
>  config ARCH_SUPPORTS_KEXEC_PURGATORY
> -       def_bool y
> +       def_bool ARCH_SUPPORTS_KEXEC_FILE
> =20
>  config ARCH_SUPPORTS_CRASH_DUMP
>         def_bool y
>=20
>=20
>      Arnd

--RprDvLMNxjsipoGk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTabYAAKCRB4tDGHoIJi
0ur9AQCKjo1eyI56rDJ+wq7ei6/ptwM4nKPVMtMwxDG4buP1AgD+MNiwYiopmEpR
Rg5VQw4r6QSCMkhYM0xu5fYVvRE9qQE=
=mhv+
-----END PGP SIGNATURE-----

--RprDvLMNxjsipoGk--
