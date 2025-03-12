Return-Path: <linuxppc-dev+bounces-6935-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F62A5E052
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 16:26:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCZGm0hBDz3bwL;
	Thu, 13 Mar 2025 02:26:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741793184;
	cv=none; b=l/7r4hDyLhA3bplikLRKMT27/zQFnJFmgOhCMIkxBUJg6YQi/vMYRFh6Wnswp4oNwNVjAy+wlex+B01kfoObT2sRVAqppi+YvSfP4d5AGFSorXpBF8Ufn6uzDRmYspBUIT1eBUbKbFmR/u9mrH1TGSx/Qu/WmyAB/og2yOmVGSw9oVsHtgk/AJDxxKH+lx04UJyvEQAHBLPyRHFWFrgkHMXUQzTAIKsXJBPM8lSyX7JmbExVJiNQIWU1T2RbRQ6xxYmWWqXDelsv5/8hOKMImAx8IPxr0PcwU10wUrUl8fjk3IvQ+zF4zofVNMoZFAfqCV2bqorTx6+Ewj4i/3UGGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741793184; c=relaxed/relaxed;
	bh=gPKo082yYXn8UUzxXlH3asgsU6wE3IkGu0gkxnGj20w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FxvAHtgj31WHYyJC25NC2Qv2YvqdlJOeU/zNViMJUTMPJ5WuQDYkx5BOtrC1vnRpnfVF7NIjQBE7stKQkuBCdIkWDlxVc01+WHrTxZCicaAXxXtvo+cDUGqyvFVFAsY/wCKKAPpRKY5PZCEj931Q0Vt70pPcr8X4qLbpJrj2DiI7vCTctcTTsOvgdqcQgDHQOAPRYheZUfFaMjMNn+r5GIASp/8uascpB/ze8/uTpMEDMOPtXoxs8FzqINIMyKcFNlV3MTwWb72BrE028y+etxV1ekffhjYQ7kLyK8gt39DDG9MaXa/JEmFx3CXKi+y3SEMz3ko+G1DoBHtMpoPQIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ky/BCax3; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ky/BCax3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCZGl1PRgz30W7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 02:26:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D5E355C5AEC;
	Wed, 12 Mar 2025 15:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2A9C4CEDD;
	Wed, 12 Mar 2025 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741793179;
	bh=Q7awIL7HKUND4G5BgT8sxgfvPYxZ5dldw9MgDhs69ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ky/BCax3DFeowvZEZBaSvHz/FRjz1Ff2w3mZvorveefBQ9QItq7spH+9lPk04kMHc
	 XFcWV+q8BLDxTsMg3kWEEMrJvLlM02Ov9qT4y5J6eushhPAVsWOV5ed7v5on6xpI5H
	 t1Jida96hvmMXnQmaaYU62DS/XhHnkqgw1xy5aAbcXTY7h92ihBZ7RpuPzMnvvZIID
	 4Llux6n6amMPvoDVic/J1BHmAr19Dq0COPgBWULz9Gberd6x0wlqoRfavURfSg5lJv
	 0Xm3eB6wpryKJveHw8pu/I7JXnt8N5CGgjBp/ANgLyo/AFa/GXs+sbZv0RiHoWV9rf
	 Q6NAbrOOruTNw==
Date: Wed, 12 Mar 2025 15:26:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
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
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 10/13] arch, mm: set high_memory in free_area_init()
Message-ID: <6d3be692-3dc3-400c-8eeb-3d378adc8dbe@sirena.org.uk>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
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
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	Mike Rapoport <rppt@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
 <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk>
 <Z9Cl8JKkRGhaRrgM@kernel.org>
 <5e40219b-f149-4e0f-aa10-c09fa183945e@sirena.org.uk>
 <CAMuHMdUGnBeo69NkYsv35YHp6H9GJSu-hoES2A8_0WhpX1zFhQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="auPMsTU3HApbt9PI"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUGnBeo69NkYsv35YHp6H9GJSu-hoES2A8_0WhpX1zFhQ@mail.gmail.com>
X-Cookie: You will outgrow your usefulness.
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--auPMsTU3HApbt9PI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2025 at 10:41:28PM +0100, Geert Uytterhoeven wrote:
> On Tue, 11 Mar 2025 at 22:33, Mark Brown <broonie@kernel.org> wrote:

> > [    0.000000] efi: UEFI not found.
> > [    0.000000] cma: Reserved 64 MiB at 0x00000000

> > - I'd only been sampling the logs for the physical platforms, none of
> > which had shown anything.

> Hangs that early need "earlycon", which the qemu boot above does have.

Indeed, the physical platforms either don't support earlycon or I just
don't wire it up as standard in my CI.  I see a fix should already be on
the way, but FWIW the physical platforms do seem to have bisected to the
same commit.

--auPMsTU3HApbt9PI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfRp40ACgkQJNaLcl1U
h9ClrAf9FHrCQNmJXN4iyTK9lTj/btaMWsS34HTwQo5atjLix3MlaM4Oe1X8wWdQ
rSJgppPAE2cv7YjUDvJGyXeNJEiBsMtnourIYIcXwHIlSknwUTW93aLuOShlc+KF
iC2gJoynMVm1M0mcCvUSxVXjQXN1rxY3pcXLx99UJqFnR+uWkHqfKq18AdWJzzrD
MwKz6EmBguL6eE0EstxjYPLlpJ3iYWORVdj2/2h3DYrRMLDlV+dm/xW9xGlq5sxJ
c/3bxdgHyKWQqTxjQsPQKSz99U2Amjx1VloV+6yG9htGbdo+yNQv+tUP20dHw9c8
ECZ91Jtf4LTcMPjk/IfIVIr0Hu3V3w==
=0Ulf
-----END PGP SIGNATURE-----

--auPMsTU3HApbt9PI--

