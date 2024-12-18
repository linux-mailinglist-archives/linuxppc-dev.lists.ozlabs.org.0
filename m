Return-Path: <linuxppc-dev+bounces-4333-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6A9F6970
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 16:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCxs94yN9z30Ty;
	Thu, 19 Dec 2024 02:08:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734534525;
	cv=none; b=YDl+MYjYxnrzFXgID6OJWWopqhvZF3ESpKCekCEA0fMc2UObUVO89FNla2/WtDHiqttpMN+j8vQel5WzxCJj33Tn1ZRTBKoFxBP9CI1Ne+8N20QjfcZO/Pu8BxnxjOQl3kmGzZZS28gaefKxXVh1L8DfNHBnsi6WVopBQLXSX96cOFFY8C7gPsfgGBveINXuD9dtxIs1l7GcOnNsuiap2CFaXei2yM43LUJrkJU1kZS7+7VM5G/2p2ERnnrdeK0dsJC3gABVO8FYdRSH+rYQgwOPUI8c+OGWX3Q0PeUG4kvIUnHzG/erby2iN/JntZwf2OWgU38Frj6++r/HLJGdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734534525; c=relaxed/relaxed;
	bh=P0GSSGcRnHe8FFQURExf5BxgkwKsXJkD6Pr778L4WMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMacMlwgvUmEFwtcDTV5DGtjQhpAuw7w/RZmkGfSj05QEOJihwE77JKoEBG5dFNiBjRaYBAzz/NT3iQFarPs8VBQex3nUw3cIHo1CzlrEde8bR/eMvM0tm/BDUZhJEfooin2q30ikMR6d2Q+Z5ox8abHQpwmhxf2mUyEBsD7rnb5eSEHNRDluGnz3LSnbPwoc8ZKkdD11TSShWdlsd4vdYYNh1bib9q0cj4U34xbiEO50IPw71rgBZnrZTCaJxkA6ziuziDePPEr6oolWjATJrshlLB5mKDBkMAsI9uI+0LxrDbd+vf0wXs48RGPyQGEosN/vfn53dKGZLkGK8szPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DOFYmV/O; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DOFYmV/O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCxs81qXbz30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 02:08:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37A0F5C61EC;
	Wed, 18 Dec 2024 15:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A23C4CECE;
	Wed, 18 Dec 2024 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734534519;
	bh=dsz8257D+6as1uUtKCRNXMXuyupbAqskFTKy5dqOl5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DOFYmV/OC+pxzzSN2F3KRoWuPa3RBYPTcC/zoOH2NCKjp1MeXanV999doe0z17HZ9
	 kZeRFu9n52HpxIYfDvjY68cwj2dFjby7xXYHkkhE6r1WCfyp9XvKDBOdii0weYJCm+
	 9xKCOdfjiu4YgHKWSLJx0oNXIh9y/gozVqQ4FgrGJap66A/Q1lO5Vt/tWoIGECJlWH
	 Rp7OGHr4sDQ+63bPykzZvg4/ERY2JHbLdJSx7PfB1jdfh7ai0OGgoE0GCVZHUb6g+l
	 lHS+ibQI7IPTVeyzL3d/9mjIO74XkR3qFvTP3HJ4GhKXpeqZidOrYIhtpJAdAEabhd
	 m0OkMY0OfPMpw==
Date: Wed, 18 Dec 2024 15:08:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <20241218-action-matchbook-571b597b7f55@spud>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fu8z2+BbmIxUgToy"
Content-Disposition: inline
In-Reply-To: <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--fu8z2+BbmIxUgToy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 03:10:03PM +0100, Thomas Wei=DFschuh wrote:
> The generic storage implementation provides the same features as the
> custom one. However it can be shared between architectures, making
> maintenance easier.
>=20
> Co-developed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/riscv/Kconfig                                 |  3 +-
>  arch/riscv/include/asm/vdso.h                      |  2 +-
>  .../include/asm/vdso/{time_data.h =3D> arch_data.h}  |  8 +-
>  arch/riscv/include/asm/vdso/gettimeofday.h         | 14 +---
>  arch/riscv/include/asm/vdso/vsyscall.h             |  9 ---
>  arch/riscv/kernel/sys_hwprobe.c                    |  3 +-
>  arch/riscv/kernel/vdso.c                           | 90 +---------------=
------
>  arch/riscv/kernel/vdso/hwprobe.c                   |  6 +-
>  arch/riscv/kernel/vdso/vdso.lds.S                  |  7 +-
>  9 files changed, 18 insertions(+), 124 deletions(-)

Fails to build:
Patch 7/17: Test 1/12: .github/scripts/patches/tests/build_rv32_defconfig.sh
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:11:33: warning: de=
claration of 'struct riscv_hwprobe' will not be visible outside of this fun=
ction [-Wvisibility]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:15:41: warning: de=
claration of 'struct riscv_hwprobe' will not be visible outside of this fun=
ction [-Wvisibility]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:19:37: error: call=
 to undeclared function '__arch_get_vdso_u_arch_data'; ISO C99 and later do=
 not support implicit function declarations [-Wimplicit-function-declaratio=
n]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:19:31: error: inco=
mpatible integer to pointer conversion initializing 'const struct vdso_arch=
_data *' with an expression of type 'int' [-Wint-conversion]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:22:36: error: arit=
hmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:30:40: error: inco=
mplete definition of type 'const struct vdso_arch_data'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:31:24: error: inco=
mpatible pointer types passing 'struct riscv_hwprobe *' to parameter of typ=
e 'struct riscv_hwprobe *' [-Werror,-Wincompatible-pointer-types]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:35:7: error: call =
to undeclared function 'riscv_hwprobe_key_is_valid'; ISO C99 and later do n=
ot support implicit function declarations [-Wimplicit-function-declaration]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:35:35: error: inco=
mplete definition of type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:5: error: incom=
plete definition of type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:18: error: inco=
mplete definition of type 'const struct vdso_arch_data'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:44: error: inco=
mplete definition of type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:39:5: error: incom=
plete definition of type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:40:5: error: incom=
plete definition of type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:43:4: error: arith=
metic on a pointer to an incomplete type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:49:39: warning: de=
claration of 'struct riscv_hwprobe' will not be visible outside of this fun=
ction [-Wvisibility]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:53:37: error: call=
 to undeclared function '__arch_get_vdso_u_arch_data'; ISO C99 and later do=
 not support implicit function declarations [-Wimplicit-function-declaratio=
n]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:53:31: error: inco=
mpatible integer to pointer conversion initializing 'const struct vdso_arch=
_data *' with an expression of type 'int' [-Wint-conversion]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:55:36: error: arit=
hmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:71:61: error: inco=
mplete definition of type 'const struct vdso_arch_data'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:71:29: error: use =
of undeclared identifier 'RISCV_HWPROBE_WHICH_CPUS'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:72:24: error: inco=
mpatible pointer types passing 'struct riscv_hwprobe *' to parameter of typ=
e 'struct riscv_hwprobe *' [-Werror,-Wincompatible-pointer-types]
  fatal error: too many errors emitted, stopping now [-ferror-limit=3D]

Might be a clang thing, allmodconfig with clang doesn't build either.

--fu8z2+BbmIxUgToy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2LlbAAKCRB4tDGHoIJi
0n2PAQDyBQBbIhWl4PuPh0Arh+dY5o5V02LpT/vyZTOInKNMcgEAqZD+a5hkxJEH
lFXI4u2esepSVEUEOeQQYFauBervVQc=
=gqd2
-----END PGP SIGNATURE-----

--fu8z2+BbmIxUgToy--

