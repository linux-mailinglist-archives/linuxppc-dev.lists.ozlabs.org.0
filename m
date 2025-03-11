Return-Path: <linuxppc-dev+bounces-6876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F36A5B8DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:58:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjjB6VqNz3bqy;
	Tue, 11 Mar 2025 16:57:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672670;
	cv=none; b=Jap9nNPKnPJCtKIgd6EnqMwdfc+qe4wiC0aYUBQ2mB7pQepeeATxIlxEflX76AvcZ75igjDbW0Eh431rTYhbqH3M1ZV2qdKiyFsogDqyO6PGmXV8u9FeSiePgLvz4BJOZGkkJgR6dB039mwVYSmDX6HkT7gyIgDPIPsNYvat6VQrFxNebbi7vF2QsMkzxh3tXZyf6VEEPBqSj/sxkZ2QoFYnK8j5YW4bVYfm7NcgnArpyvfJE02gD8EygaQ3dS/3hFd6t2JlpS19MCQAh1pp1eRDSDlKnU7qcWFOW7fvZuCUQJq6VBWMy0/dZQMn4fCD6Z1rXOl+KSOhzgncKOaDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672670; c=relaxed/relaxed;
	bh=4roWiPw03UI2aivRO5WHWmI1ZzqHNPPBcsULnHPQ8VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpGe0yWEDUGeZ6mbJXeTu1jp7T7mGUXslEVsCFxakm8L5l7eIYjyHsDO6I3B3qVZq5uxOJOb2E4qXekSYlg5bo+19qVxP1g1XjksLqmecK10so4wA66g/BvgX+jsqny/1lBO0Jxf98ZpEThOjhlNNUFo7iZA31iKJiIsXaOQVHAbVKZZoBjyw2F5T5KxJIneYL4cSEWo/QKMUd+dLzoNIa4XJdlCJUH/xViPoJF375iQu7Abtk0muYWo+AYIkQj1759rzaX2GNUdiiOIhdiz4dceyWmm7Mh+pcKYT0X/AP2B9MecexXeR+QKZct/1DncMTPxM/nG900ODvGqsCtJpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dmTErZmr; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dmTErZmr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjjB05XXz3bqP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:57:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E7E7A45DE8;
	Tue, 11 Mar 2025 05:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78FCC4CEE9;
	Tue, 11 Mar 2025 05:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741672666;
	bh=BYwU/E93/QHnTs75zXL/K5KaaL59dt5dqcEKsspSbzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dmTErZmrStaJuWPq1Y2KiGUlkJyWnCTthhB4B91JAVbdcH9I2nMKyf/7Fd4sug/pB
	 N7nEu2kNBk1O0Ul+w/IBo19oXH5glyY2bbtD6tCtn0BJHbkHTd1iWoNnx2w3T9m+7H
	 IxxQVA4Y4Lv0jGi6PXT0q9QqF5s7ZqRI2g89QBdwAFMPmOQwhOa9TxU3xtlxsqpRqF
	 lYy7nKRBTlEc1vamVRBquPAmfL9PiTgEWIBb6xcf97y28M06V5hY0PpqPM3HaTZw4K
	 HfU+XsvU0VemNSiwuoybyIXmF+A+kWMDABoLN29HvFjqUrPbxMBmNFc1zs7FVelcPG
	 fJ1v7DiVKuKeg==
Date: Tue, 11 Mar 2025 07:57:23 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
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
Subject: Re: [PATCH 05/13] MIPS: make setup_zero_pages() use memblock
Message-ID: <Z8_Qw9Soe5bzWJ44@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
 <20250306185124.3147510-6-rppt@kernel.org>
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
In-Reply-To: <20250306185124.3147510-6-rppt@kernel.org>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 06, 2025 at 08:51:15PM +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Allocating the zero pages from memblock is simpler because the memory is
> already reserved.
> 
> This will also help with pulling out memblock_free_all() to the generic
> code and reducing code duplication in arch::mem_init().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/mips/include/asm/mmzone.h |  2 --
>  arch/mips/mm/init.c            | 16 +++++-----------
>  2 files changed, 5 insertions(+), 13 deletions(-)
 
Andrew can you please pick this as a fixup?

From 148713d17cbdf7a3ad08f18ba203185b70c0e7c2 Mon Sep 17 00:00:00 2001
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 11 Mar 2025 07:51:27 +0200
Subject: [PATCH] MIPS: use memblock_alloc_or_panic() in setup_zero_page()

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/mips/mm/init.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 6ea27bbd387e..a673d3d68254 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -68,9 +68,7 @@ static void __init setup_zero_pages(void)
 	else
 		order = 0;
 
-	empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, PAGE_SIZE);
-	if (!empty_zero_page)
-		panic("Oh boy, that early out of memory?");
+	empty_zero_page = (unsigned long)memblock_alloc_or_panic(PAGE_SIZE << order, PAGE_SIZE);
 
 	zero_page_mask = ((PAGE_SIZE << order) - 1) & PAGE_MASK;
 }
-- 
2.47.2

-- 
Sincerely yours,
Mike.

