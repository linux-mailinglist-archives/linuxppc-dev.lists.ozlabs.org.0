Return-Path: <linuxppc-dev+bounces-4427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E226C9FAAF9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 08:16:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGq7j5nc6z2xJT;
	Mon, 23 Dec 2024 18:16:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=89.208.246.23
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734938177;
	cv=none; b=PkQ8NIIOyF8hcPHLaUTC9HWg93UYcTocZI8YLCY89q98GCRebJ/o8iTXQYK3i40vEor7yQNaTaGUkTr155oxqVN2TZxdhNDBYqslhc4jgkOkJ6XTGP1On+VWkG0c4Eu83ZbSBu/JhUOPv+qBoAAmegWBnLQJ8yufeW3vAUTbVxaYohpwVrqzsF/wqpEKoJQFcLVI6thcFRUP+RqqNSMr6SLSF7meeRrnHHeyxiUDIh8e6hFqeWztLNNp8lTSK5R6W4B5f4r24WXhSlfY4S73wqN5sw7ur1WaB8ZR5wP48TUk2V19NzNiscKjyMksHT0OSYULOTtbrBlSTMmU5MVAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734938177; c=relaxed/relaxed;
	bh=ecGpjQJ+dPTMtl9IS6T8Zx3DPG9sUHrYzmuZ6ugsSWw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CWAexUBUtutw1mXVpMkIpbG7dQJq0FrPKmz+Bj2nYDfEI17uto3czAJl47KVWac9uJZouYaiSHDd/NdeAoclekUIlosCZ3DnJfYM5een5ilP6atbkjUlGZ7j4UvNGSc629ZIEAPYinm1DWyuMZGMIkEVO6r47akh1ISMjbQY+Pje9fspXsxgmfrPJalNdDyOYEJnBmtQRYH6p2sR4zNPTe1CLj/gfBebjLBkKGtn8T64oiQsHSSm+2dS6fSWnwVfkeIZ1HV2iWxE70yvWIZV6ZjqRZCiVCtMmihXyH1xNvVHQQDIWiVSVQXyVwBadO650goqCRcMWqnEB/Wz+SDPEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=dYLhBand; dkim-atps=neutral; spf=pass (client-ip=89.208.246.23; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=lists.ozlabs.org) smtp.mailfrom=xry111.site
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=dYLhBand;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xry111.site (client-ip=89.208.246.23; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=lists.ozlabs.org)
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGq7f33M8z2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 18:16:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1734938153;
	bh=ecGpjQJ+dPTMtl9IS6T8Zx3DPG9sUHrYzmuZ6ugsSWw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=dYLhBandMXiOWoijdab1gHiwxN4eR/VOe1BsVjVz9qXmRVOFQ3esRLy431bdS1dZk
	 XfvgNo/mfzBUiJSkzYWjXUz9VNZqGIoxmAEmuMRQld4Umwy3a2m4Fwo8gIpR4U1JmC
	 QNQagNSSgXTyOhRij3RWOWxKAWCl+3mSvRV2S1v8=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 1944F67671;
	Mon, 23 Dec 2024 02:15:35 -0500 (EST)
Message-ID: <6ac0e0f71990e5a8dc52f00c737cdf56916e0d4e.camel@xry111.site>
Subject: Re: [PATCH v7] mm/memblock: Add memblock_alloc_or_panic interface
From: Xi Ruoyao <xry111@xry111.site>
To: Mike Rapoport <rppt@kernel.org>, Guo Weikang
 <guoweikang.kernel@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo
 <tj@kernel.org>,  Christoph Lameter	 <cl@linux.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Sam Creasey	 <sammy@sammy.net>, Huacai Chen
 <chenhuacai@kernel.org>, Will Deacon	 <will@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
 rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>,  Hanjun
 Guo <guohanjun@huawei.com>, Easwar Hariharan
 <eahariha@linux.microsoft.com>, Johannes Berg	 <johannes.berg@intel.com>,
 Ingo Molnar <mingo@kernel.org>, Dave Hansen	 <dave.hansen@intel.com>,
 Christian Brauner <brauner@kernel.org>, KP Singh	 <kpsingh@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Matt Turner
 <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, WANG Xuerui
 <kernel@xen0n.name>,  Michael Ellerman <mpe@ellerman.id.au>, Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne	
 <shorne@gmail.com>, Helge Deller <deller@gmx.de>, Nicholas Piggin	
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen
 N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff
 Levand	 <geoff@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin	 <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vincenzo Frascino	 <vincenzo.frascino@arm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik	 <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Yoshinori
 Sato	 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson
 <andreas@gaisler.com>, Richard Weinberger	 <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg	
 <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar	 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen	
 <dave.hansen@linux.intel.com>, x86@kernel.org, linux-alpha@vger.kernel.org,
 	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, 	linux-um@lists.infradead.org,
 linux-acpi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 linux-omap@vger.kernel.org, 	linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org, 	linux-pm@vger.kernel.org
Date: Mon, 23 Dec 2024 15:15:34 +0800
In-Reply-To: <Z2kNTjO8hXzN66bX@kernel.org>
References: <20241222111537.2720303-1-guoweikang.kernel@gmail.com>
	 <Z2kNTjO8hXzN66bX@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 2024-12-23 at 09:12 +0200, Mike Rapoport wrote:
> On Sun, Dec 22, 2024 at 07:15:37PM +0800, Guo Weikang wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immedi=
ate
> > panic is required. To simplify this behavior and reduce repetitive chec=
ks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavio=
r.
> >=20
> > Changelog:
> > ----------
> > v1: initial version
> > v2: add __memblock_alloc_or_panic support panic output caller
> > v3: panic output phys_addr_t use printk's %pap
> > v4: make __memblock_alloc_or_panic out-of-line, move to memblock.c
> > v6: Fix CI compile error
> > Links to CI: https://lore.kernel.org/oe-kbuild-all/202412221000.r1NzXJU=
O-lkp@intel.com/
> > v6: Fix CI compile warinigs
> > Links to CI: https://lore.kernel.org/oe-kbuild-all/202412221259.JuGNAUC=
q-lkp@intel.com/
> > v7: add chagelog and adjust function declaration alignment format
> > ----------
> >=20
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> > Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Acked-by: Xi Ruoyao <xry111@xry111.site>
>=20
> If people commented on your patch it does not mean you should add
> Reviewed-by or Acked-by tags for them. Wait for explicit tags from the
> reviewers.

And:

 - Acked-by: indicates an agreement by another developer (often a
   maintainer of the relevant code) that the patch is appropriate for
   inclusion into the kernel.=20

I'm not a maintainer so I even don't have the right to use Acked-by :).

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

