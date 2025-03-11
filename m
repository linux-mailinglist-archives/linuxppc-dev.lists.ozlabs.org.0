Return-Path: <linuxppc-dev+bounces-6863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F9A5B8BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:56:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjgZ4Tdrz3bmQ;
	Tue, 11 Mar 2025 16:56:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672586;
	cv=none; b=fdfiXXpD5xeD+aP9eV/eR8ilDpnQSzvJiE4tX00K4+O9X2UzVWTCqOeuy3hnJVxXZc+SvSYrVZ4T9QMvhfd+zKDy5+wUYYUETbexVN8Kh6yFz7m/CC3SC7X2HZdxWN/qcUiY1dKzvRdG+rKosaIsWDnFxAzNhfzzbANjmuKnoUdPQxk6tETisJvfkfDl1Efc9yvkTy3OVamX9HeCvihlVYaD9ku1CPSx1xz/4xcTLGcN9JhbWhmBnmbyky2vvXPbApO1uNx/n0w3zOmTrSy8LCBZrzh2/jCoTm+ADNRwW4uW238XzM+ba8kVjpWe7boNI5hwOnaSVY+n5PqQVy0FpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672586; c=relaxed/relaxed;
	bh=qfQ8fQV+HqU0Qyc/Dri7YXItrVPHcO+rnRFfjqJQ+Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAS7LfzFaOJoRDIXdEQhgWdCssO/rFmP/Fa+08lFnIj6N6AnYiVmM+2DyZNJDn6ACpjBMjwaMVlkqRvP+8KwQLcKREpuID+8pmidR+l2Xuv4BAen9871flmNQO4c7O6yA+hLBwOTqog7KKyHWLpQyffkeRF58e2ng8Ngc3TFP0uMNxceU8ZGWhRER4JtXaGnvFVJVv0dVx/tAfQhGkPU88EXBWeM549FH7hA0ElcWk6/WxWkH8PpFESzEr+TLa3FqG1SyObZQ/L9JRCo/Sp/ZJ150PXAGSaa5OyJEQDbmIx+9VgKhpsNo/LgjiTtSdGqI3LjZf3ITDhWkFQVvnK+8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f48a7jPd; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f48a7jPd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjgY4F2Qz3bmf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:56:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3DBF5C4D94;
	Tue, 11 Mar 2025 05:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D93EC4CEED;
	Tue, 11 Mar 2025 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741672582;
	bh=JR5aE1/6W9bEsH29C5z708XdvBh3y3whu03ldRN1cT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f48a7jPdRs+4CFxnOQTPCHsm75344xXl4kGcXGjsNF7CXHD6rakA6cXBClsJrVEtn
	 WMcp4MDOS6ujAbPjNce+g3L+xfZC5vi4RqizMWw2e621BlT1F9Ay/Loxsxa26BilyR
	 V3RuJvI1gFKwfV3U+Q95PUC/u4Gy4+xVTdXkrb9dHTeavvebfTfgzz2yhmQ89ydU2G
	 kiwkfL2BapKmKWzCToyXgMHRmDr7W8auvyr26g/1+MWMbdjrYYGY9Pgy3JpC8H5B/G
	 ocFRu6iz+c47Alu4XK27RyF2DFlSe0JprTDW9yyHuXhbUMDy3L4Bzl+ZBGVJfIovu1
	 qQCLqsddFmhPA==
Date: Tue, 11 Mar 2025 07:55:55 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
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
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
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
Subject: Re: [PATCH 07/13] s390: make setup_zero_pages() use memblock
Message-ID: <Z8_Qawg0dGtZdys7@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
 <20250306185124.3147510-8-rppt@kernel.org>
 <20250307152815.9880Gbd-hca@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307152815.9880Gbd-hca@linux.ibm.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 07, 2025 at 04:28:15PM +0100, Heiko Carstens wrote:
> On Thu, Mar 06, 2025 at 08:51:17PM +0200, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Allocating the zero pages from memblock is simpler because the memory is
> > already reserved.
> > 
> > This will also help with pulling out memblock_free_all() to the generic
> > code and reducing code duplication in arch::mem_init().
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/s390/mm/init.c | 14 +++-----------
> >  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> Acked-by: Heiko Carstens <hca@linux.ibm.com>
> 
> > -	empty_zero_page = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
> > +	empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
> >  	if (!empty_zero_page)
> >  		panic("Out of memory in setup_zero_pages");
> 
> This could have been converted to memblock_alloc_or_panic(), but I
> guess this can also be done at a later point in time.

Duh, I should have remembered about memblock_alloc_or_panic() :)

@Andrew, can you please pick this as a fixup?

From 344fec8519e5152c25809c9277b54a68f9cde0e9 Mon Sep 17 00:00:00 2001
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 11 Mar 2025 07:51:27 +0200
Subject: [PATCH] s390: use memblock_alloc_or_panic() in setup_zero_page()

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/s390/mm/init.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index ab8ece3c41f1..c6a97329d7e7 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -81,9 +81,7 @@ static void __init setup_zero_pages(void)
 	while (order > 2 && (total_pages >> 10) < (1UL << order))
 		order--;
 
-	empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
-	if (!empty_zero_page)
-		panic("Out of memory in setup_zero_pages");
+	empty_zero_page = (unsigned long)memblock_alloc_or_panic(PAGE_SIZE << order, order);
 
 	zero_page_mask = ((PAGE_SIZE << order) - 1) & PAGE_MASK;
 }
-- 
2.47.2


-- 
Sincerely yours,
Mike.

