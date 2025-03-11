Return-Path: <linuxppc-dev+bounces-6910-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C07A5D1CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 22:33:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC6T657yrz3024;
	Wed, 12 Mar 2025 08:33:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741728826;
	cv=none; b=iXJlMpRsDiI7sCJ9IxfyqXY9lg1OK2z5Ul+UDkKBy7ayiahHN9SWZ1vWuovg57uGIlGXA8q8Y7ZdqJZ5LFBT0yJiSjaZCuVW6m70d8EaAqrXNajObLbX5MnZvZqsUeOdJJaDo8nhh9n9OFL/y7/6VgTRou7ubJVP7nqF1pmCGi9KN/ol5H/6GJO/kSHvrk/TLvH0lvxdq+buuXfOCtgr35dnjyGOEhmiHTMjsmiXm2VsCKvBr9DAm85WjwbX8w6xo3+rmlSyJTibBZ2S12ZVTU9SjZxiqsCkLQc1LePN11lyXgjH1LAV9Gken0A4t/bZtZ+sGDVagC9lx5ZIz0sS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741728826; c=relaxed/relaxed;
	bh=nQTxgWE3KGcdRWmI+5JNsQ9ibE4osNgMg/3Or1CwiwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeUze3HOIRPRv1wF01DkkCuCV/prFI1DFXBXCQ9zALkRUbRmmANacq9xc6MEbficw/CqPS4ryB/h5tELuOw8h50D/UNx9SbpjqzS27t4by4bi2g503rS3tZZ4Gf6GruP9Oyb0AwSuHrUs/5z2orsOAi8j8s8LfM+Zyo09bG0cdN5BE9zakHA+1Q5h3MfzaD3C14sMh/oX1icSAtcJAwHWOnAcukMqkuKAFW4KjKvCVALwy1Ox2pv+UC2vvgMbVJ1rpaY+u7f5wSlWUMMNJAeLcTpCXhWe8PY50TOfqC9g6F/eBzjNvCxXKFnWfqSzX0NWKVK4eWf/2pesNPq6DhJyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vLCyIQJD; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vLCyIQJD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZC6T554pRz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 08:33:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6A00A46573;
	Tue, 11 Mar 2025 21:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040B9C4CEE9;
	Tue, 11 Mar 2025 21:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741728822;
	bh=CmQW/T4z277siKf35pb3ufsM8TGho2hqx+eDDO0HDws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vLCyIQJDWFuh5ztYOOYeWCEhiRhvpZcl92RbGikAE7KwUbCe2uq4bfhOrao1ZNvcj
	 bwAW+0Rwi4xQLLzAy/w/Y/7g3G4kSnZLCM6joo4q71LSHr/bOH9ESHVSj4U79RkDbh
	 3gY+xNDCPLiM9EAKTFg1qNLyNNZ1djyvSyC+VoEaZiXsjoThLIT3zy4u2kziTU7ERI
	 J68mR5HXhsacNqXEnBs5lHzPD7Hm61yKsNzCPeeKfgdpU8hTzDjHgXMP9PhM8vMAte
	 3WJ7PhQP12NqN5k0OO8Rf1bytRXjCsH4K0l7vv3HtwVztb53ay03HDlFllqDG5VPpH
	 ahk/9X+RQ1jPg==
Date: Tue, 11 Mar 2025 21:33:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 10/13] arch, mm: set high_memory in free_area_init()
Message-ID: <5e40219b-f149-4e0f-aa10-c09fa183945e@sirena.org.uk>
Mail-Followup-To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
References: <20250306185124.3147510-1-rppt@kernel.org>
 <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk>
 <Z9Cl8JKkRGhaRrgM@kernel.org>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kSKa7AdYHWDvxt4+"
Content-Disposition: inline
In-Reply-To: <Z9Cl8JKkRGhaRrgM@kernel.org>
X-Cookie: This report is filled with omissions.
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--kSKa7AdYHWDvxt4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2025 at 11:06:56PM +0200, Mike Rapoport wrote:
> On Tue, Mar 11, 2025 at 05:51:06PM +0000, Mark Brown wrote:

> > This patch appears to be causing breakage on a number of 32 bit arm
> > platforms, including qemu's virt-2.11,gic-version=3.  Affected platforms
> > die on boot with no output, a bisect with qemu points at this commit and
> > those for physical platforms appear to be converging on the same place.

> Can you share how this can be reproduced with qemu?

https://lava.sirena.org.uk/scheduler/job/1184953

Turns out it's actually producing output on qemu:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.14.0-rc6-next-20250311 (tuxmake@tuxmake) (arm-linux-gnueabihf-gcc (Debian 13.3.0-5) 13.3.0, GNU ld (GNU Binutils for Debian) 2.43.1) #1 SMP @1741691801
[    0.000000] CPU: ARMv7 Processor [414fc0f0] revision 0 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] OF: fdt: Machine model: linux,dummy-virt
[    0.000000] random: crng init done
[    0.000000] earlycon: pl11 at MMIO 0x09000000 (options '')
[    0.000000] printk: legacy bootconsole [pl11] enabled
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 64 MiB at 0x00000000

- I'd only been sampling the logs for the physical platforms, none of
which had shown anything.

(you dropped me from the CCs BTW!)

--kSKa7AdYHWDvxt4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfQrCgACgkQJNaLcl1U
h9Cq1Af/adGmMv7dmqx2eBRJpvAPwHDA9kp/dbxIzrFhLkh4nCTOKPvEBHoRMm8l
njRIpqHujhgnO4pVO+GhyLhLW3z+IQ+SJv2aD6GjoDfRmFH+GvdpuMHR9rvMtKIl
ZC62+J7E7+kF77JCtkWs+u4q16i+uXL9uH9EHhS0qgPW7ie5TRGt9LlBpgYfXIDu
FRz10cse8/VG/txtKUro2xDUofpy3EbyRp14M1bN9HCPO76XfdUuQlayf8eQ+jie
IvbcXFTCm7tHM/DDnaYe2CtvOOfILKkdcJWhUckNZ5bFgkv6cCd3KD8tbsIV/YLI
gIwCZaARgCPBoVAfG4mRjI82TcgYMw==
=6gzY
-----END PGP SIGNATURE-----

--kSKa7AdYHWDvxt4+--

