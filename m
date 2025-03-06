Return-Path: <linuxppc-dev+bounces-6777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1426A555B2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 19:53:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7z8Y4qBmz3cBW;
	Fri,  7 Mar 2025 05:53:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741287213;
	cv=none; b=LPk2ovdLg5OpfBq6Bbx1oyX/egBRubkTrCJSnam0kXlwFmd9AhQRpzyRIGmUzaOCA3IC3DFHy3FrLfxvGtSIsgxt1eFl9k8IxyZc+D/Nv+b1y10yKCkzDSJf/NoX/UM/mHWSVb9T4eK+pBpgVcnX5/u0yo64twz5P0bn8QNK3isWezM3fFhVrtgZNghCFNb1XUlqU8W+lGkp3G8xCdhSiiLdhzM1dJlk2nBiqAhYj03OEKRk+Q+qXxZx8R6szNALR3TuI1MJkm+rrAUY1195aWsJocasRRGdniK6XtWCVv+dG5ueGPDFohLFUGEO8gTJiHC1qQS4wYYzqqVPESadGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741287213; c=relaxed/relaxed;
	bh=EqEJoM4rgtKrOS/V5SDQTOhmiMYuUlj1yWrv5iY9ngQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jerIHehryohmOd2+paJNEKY33yuulghiCZFfCvjB2eo7zg5nQjS0Ud08sYqv1mVNpk5nBNqVzGXFSGfZzAZwHSAKSEJeLkFdNbl0QfWpheV7RHgo4SVbZoW+jO1mYW1YftqnNYG27DXWTFcjfS0ReSynGEQkscd1mh26LuqZI7I+3fIaCI/cF+7CJbNcnVBkbhQJizHz6BKtHExhgtLZXY7US0/RIl31yeh+cFJRy85NzctYjwbQXKynuCshFJ3AcMjCBMPBLMWLgXByFZ7zTEuEsD5lKYXS5nq4UYmXjGIiuFcBg/gJ+p+robvXdDI1qJRwviC4jhu/pOxOqdVfhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ACHI6rfL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ACHI6rfL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7z8X5hYPz3c81
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 05:53:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 02A25A44F0F;
	Thu,  6 Mar 2025 18:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2766C4CEE4;
	Thu,  6 Mar 2025 18:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741287210;
	bh=Af9gKlZIDExjo3NK0sfX49tiYlvs18loCfa3z4qCS4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ACHI6rfL1CccB57sU6MHDnuoRg3jMkyFyeeJlXxk8uRHYT/lbOYh1q5kA3v8+SoBx
	 /rcC9SXjhDCUt02EMaLZCrUKfOk4h0oLxAT+jnDZad4CATtsjvmD8EjF6oqwbdQeEY
	 lec4vL01J8O4/qZP9ogTuxjIICQ/nPBl4pvJ44MoLU18PCfW1pW/JGbUMlIRkJlmQt
	 6fBGVqdQnog5dPeP0hV9MmrP+bGVIxIvFvQUgN6hZKnvRwCNYzS1uButYr6dHJ9Qv2
	 LukeOxx9dFnYJScdzXYrIbXP+iFHUqdhlT2i8EDd+xbfsULozwofW4yz7qQY5SvlsQ
	 dE7dgY38/JZiw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH 08/13] xtensa: split out printing of virtual memory layout to a function
Date: Thu,  6 Mar 2025 20:51:18 +0200
Message-ID: <20250306185124.3147510-9-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250306185124.3147510-1-rppt@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

This will help with pulling out memblock_free_all() to the generic
code and reducing code duplication in arch::mem_init().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/xtensa/mm/init.c | 97 ++++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 47 deletions(-)

diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index b2587a1a7c46..01577d33e602 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -66,6 +66,55 @@ void __init bootmem_init(void)
 	memblock_dump_all();
 }
 
+static void __init print_vm_layout(void)
+{
+	pr_info("virtual kernel memory layout:\n"
+#ifdef CONFIG_KASAN
+		"    kasan   : 0x%08lx - 0x%08lx  (%5lu MB)\n"
+#endif
+#ifdef CONFIG_MMU
+		"    vmalloc : 0x%08lx - 0x%08lx  (%5lu MB)\n"
+#endif
+#ifdef CONFIG_HIGHMEM
+		"    pkmap   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+		"    fixmap  : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+#endif
+		"    lowmem  : 0x%08lx - 0x%08lx  (%5lu MB)\n"
+		"    .text   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+		"    .rodata : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+		"    .data   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+		"    .init   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+		"    .bss    : 0x%08lx - 0x%08lx  (%5lu kB)\n",
+#ifdef CONFIG_KASAN
+		KASAN_SHADOW_START, KASAN_SHADOW_START + KASAN_SHADOW_SIZE,
+		KASAN_SHADOW_SIZE >> 20,
+#endif
+#ifdef CONFIG_MMU
+		VMALLOC_START, VMALLOC_END,
+		(VMALLOC_END - VMALLOC_START) >> 20,
+#ifdef CONFIG_HIGHMEM
+		PKMAP_BASE, PKMAP_BASE + LAST_PKMAP * PAGE_SIZE,
+		(LAST_PKMAP*PAGE_SIZE) >> 10,
+		FIXADDR_START, FIXADDR_END,
+		(FIXADDR_END - FIXADDR_START) >> 10,
+#endif
+		PAGE_OFFSET, PAGE_OFFSET +
+		(max_low_pfn - min_low_pfn) * PAGE_SIZE,
+#else
+		min_low_pfn * PAGE_SIZE, max_low_pfn * PAGE_SIZE,
+#endif
+		((max_low_pfn - min_low_pfn) * PAGE_SIZE) >> 20,
+		(unsigned long)_text, (unsigned long)_etext,
+		(unsigned long)(_etext - _text) >> 10,
+		(unsigned long)__start_rodata, (unsigned long)__end_rodata,
+		(unsigned long)(__end_rodata - __start_rodata) >> 10,
+		(unsigned long)_sdata, (unsigned long)_edata,
+		(unsigned long)(_edata - _sdata) >> 10,
+		(unsigned long)__init_begin, (unsigned long)__init_end,
+		(unsigned long)(__init_end - __init_begin) >> 10,
+		(unsigned long)__bss_start, (unsigned long)__bss_stop,
+		(unsigned long)(__bss_stop - __bss_start) >> 10);
+}
 
 void __init zones_init(void)
 {
@@ -77,6 +126,7 @@ void __init zones_init(void)
 #endif
 	};
 	free_area_init(max_zone_pfn);
+	print_vm_layout();
 }
 
 static void __init free_highpages(void)
@@ -118,53 +168,6 @@ void __init mem_init(void)
 	high_memory = (void *)__va(max_low_pfn << PAGE_SHIFT);
 
 	memblock_free_all();
-
-	pr_info("virtual kernel memory layout:\n"
-#ifdef CONFIG_KASAN
-		"    kasan   : 0x%08lx - 0x%08lx  (%5lu MB)\n"
-#endif
-#ifdef CONFIG_MMU
-		"    vmalloc : 0x%08lx - 0x%08lx  (%5lu MB)\n"
-#endif
-#ifdef CONFIG_HIGHMEM
-		"    pkmap   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-		"    fixmap  : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-#endif
-		"    lowmem  : 0x%08lx - 0x%08lx  (%5lu MB)\n"
-		"    .text   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-		"    .rodata : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-		"    .data   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-		"    .init   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-		"    .bss    : 0x%08lx - 0x%08lx  (%5lu kB)\n",
-#ifdef CONFIG_KASAN
-		KASAN_SHADOW_START, KASAN_SHADOW_START + KASAN_SHADOW_SIZE,
-		KASAN_SHADOW_SIZE >> 20,
-#endif
-#ifdef CONFIG_MMU
-		VMALLOC_START, VMALLOC_END,
-		(VMALLOC_END - VMALLOC_START) >> 20,
-#ifdef CONFIG_HIGHMEM
-		PKMAP_BASE, PKMAP_BASE + LAST_PKMAP * PAGE_SIZE,
-		(LAST_PKMAP*PAGE_SIZE) >> 10,
-		FIXADDR_START, FIXADDR_END,
-		(FIXADDR_END - FIXADDR_START) >> 10,
-#endif
-		PAGE_OFFSET, PAGE_OFFSET +
-		(max_low_pfn - min_low_pfn) * PAGE_SIZE,
-#else
-		min_low_pfn * PAGE_SIZE, max_low_pfn * PAGE_SIZE,
-#endif
-		((max_low_pfn - min_low_pfn) * PAGE_SIZE) >> 20,
-		(unsigned long)_text, (unsigned long)_etext,
-		(unsigned long)(_etext - _text) >> 10,
-		(unsigned long)__start_rodata, (unsigned long)__end_rodata,
-		(unsigned long)(__end_rodata - __start_rodata) >> 10,
-		(unsigned long)_sdata, (unsigned long)_edata,
-		(unsigned long)(_edata - _sdata) >> 10,
-		(unsigned long)__init_begin, (unsigned long)__init_end,
-		(unsigned long)(__init_end - __init_begin) >> 10,
-		(unsigned long)__bss_start, (unsigned long)__bss_stop,
-		(unsigned long)(__bss_stop - __bss_start) >> 10);
 }
 
 static void __init parse_memmap_one(char *p)
-- 
2.47.2


