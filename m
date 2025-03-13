Return-Path: <linuxppc-dev+bounces-6980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B229A5FC09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 17:39:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDCs73NbPz3c9k;
	Fri, 14 Mar 2025 03:39:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741883995;
	cv=none; b=Sff6jHlKmFnwWBXeCIdf40jwUeKt+1s4EOvozvf4Dc6xYQwEWV4km8A/0CJnFPIQsuhHXQyAkBTYYol7DyZIJ6mc9gyJKmqH3rNDGGAaW+bX/pvflTdJV8dZnPqtzbsVha3CCfXWtyPAVd/az4iDLJ7FZeCcwll0LpxElLLUCLHpAinRNRwOku4WpFaSEMHc6F0/dBXKnu1T03j2uXWE0fWHkVI0iaOE/zbWTBJsEt/khilCadekiyMwPCksiMssKQRHlbB4rDdCQj1r9W4Yks6GxjYeug2vLeAoyVdcW1KytYXNuztv0Cdy0Ebc+4GAOaNYn09ndZp6Ekmt2GuDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741883995; c=relaxed/relaxed;
	bh=YjZuUOKad4oLE7VP3wASgx1tPQhtMbl52kcretJsJWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+y2yt/5h0aezZvktiZ5cg98XQlRmPSZcPgJKGauVG/8CIJ555R+el15qJPriWXbnS2CrQXD4N1Y/R2Mlkij8zC1BlQtI9N60+qjb0vRMwD/qPG1bINqUCK97duw0Jn01TJspxNufjUUa+dAQzi4X0R/qZF5faoRbGxI/Yt2PiU80b0ALr9qKIh80YDRJQm4UbLTeyQY04t1PQb+CVnlsl5NCDLIiB7dslqm6HCgZ+Sn9dP5XecFvyYo/+uo+NvEnKv7YnRt24OFoMT9dMczYEAonGG7IZhcGgw0dPed1JMX0EggNvthHDSQu4Aw22zmbasTnuWKdZ2TaUNRRNdgzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jXsvsd/l; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jXsvsd/l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDCs63Pjcz3c98
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 03:39:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF76BA477BB;
	Thu, 13 Mar 2025 16:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112F0C4CEDD;
	Thu, 13 Mar 2025 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741883990;
	bh=SJIh4TOyAnLQgRaND+z2LtBYQ5hvnSYhcxMltVARNHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXsvsd/lxGJNEoAX6HtYBN5kSEz6YHB6jkvfmSGlAYkaC6zejLPn/jhjOGbnxowV9
	 G4ObNvl3IBz4OwYO2TlZ/bLh8DZduHi5CkgzYMn1CVOppgH6xx0HzA9IMhHkCryYCY
	 ZnelQtcYuqYVLCo8RDAfcA5wrN0rilAxNY4bxJB3K1CqJlX1tG+a3qgJkkTCsPFO7h
	 mIMi9CWIvAGiys0Idmh6XXVvAFEOzxC+aoae1uw6WzZghXN98gnejmZ33szJK51KlP
	 WWbGYBsBTpQxs6TW4o+VUbqyqW8YHpq93CdsecoGwYUTU6EUH46GDnnPb9iVFpOFP+
	 OQMV0Bj8JCyMQ==
Date: Thu, 13 Mar 2025 16:39:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
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
Subject: Re: [PATCH v2 00/13] arch, mm: reduce code duplication in mem_init()
Message-ID: <5de71a98-d87f-4bfd-83a1-3f6e11c84d7d@sirena.org.uk>
Mail-Followup-To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
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
References: <20250313135003.836600-1-rppt@kernel.org>
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
	protocol="application/pgp-signature"; boundary="2QbfUHTxTDOlgUSw"
Content-Disposition: inline
In-Reply-To: <20250313135003.836600-1-rppt@kernel.org>
X-Cookie: A beer delayed is a beer denied.
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--2QbfUHTxTDOlgUSw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 13, 2025 at 03:49:50PM +0200, Mike Rapoport wrote:

> v2 changes:
> * don't use generic version for setting high_memory on architectures
>   that use that varialble earlier than free_area_init()
> * use memblock_alloc_or_panig() to allocate zero pages on MIPS and s390
> * fix alignment in allocation of zero pages on s390
> * add Acked-by

This resolves the issues for 32 bit arm, at least the v7 boards:

Tested-by: Mark Brown <broonie@kernel.org>

My v5 and v6 boards are having issues but I think that's unrelated
infrastructure (in one case definitely so).

--2QbfUHTxTDOlgUSw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfTCkgACgkQJNaLcl1U
h9BPbAf/SDBWCt481g26uw69KoHpeH2cGq0Z5NH3zUIIBiu3gpRrex/BeLXVuY79
d57+lsymFEsgnNbhXNvzjAzmaRTSMBu9C1S5o4Jo3+sz8kEnBS/myycnCrbU+lVy
9R4LmwA4hhMZw2+UhgRPVFMTjd7fsFFLAsxmHyCheEOGfLGKMTKleusqFbK2phbu
IrDc/IU6mCxqGrgZ3lO0fV7w2SfpkBANi9bXJz7aeAbqsOBeVyLCKgAL/gsbZxDZ
g6Y0lOdm1gfigEHb8d5DiireqslCdgHnoH90rRI+3YBQiT8QOJLd/3W3G7YrKPNy
/ufJa9n1CuXbfkYbynfJxmTOHNUPHw==
=M7tK
-----END PGP SIGNATURE-----

--2QbfUHTxTDOlgUSw--

