Return-Path: <linuxppc-dev+bounces-6774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F06A55591
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 19:52:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7z7p2wGxz3cBH;
	Fri,  7 Mar 2025 05:52:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741287174;
	cv=none; b=dmKaT8j6IVnLoGKNGX7FrvP3iscY85WyHAL4pob6GvEzZFcOwFcvUB1rFhlt2/TkF2ac8QNdW2RWTGQO+Og6WLSbDJuNy7awoj0N9VsaRy3sQgWG+JowaU21QwwYP5MOud3OlKX8Sr9f6k5LY8C4+GSer/h91c2b92J2jTibUoTeGYdXA8hQALRixuIklSl7CNRbGswEkeLHgodmnmI7Vavzb7AANaxtWJvI2IEWDJbi+pi971X+jhJxK+WwdVc58DniyepzMaYR1/iqTSRibGSMzntip6ZMF+j127kRpxyKa3NJ84zbOur+KtN+ERpYKIuRKTDNde2NCDt92yKGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741287174; c=relaxed/relaxed;
	bh=muwizWukvEQXWCdPpr52z13tn84CGBwjdggEEowg38M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnuWoRnKzte8m+nMq0aGPUJOsnE1pAIXguljLFZDbtE40UCZQ8rLPACc0bsp4Vx/+/voRQQVdedmDOkCK9S01OsWG0+ruQftTBhpRp3tDcYeCed+u2tCRagk+QuTGSsiblt74C/9vTpJauSiLKYxcfAISZyC2H3AWBbY3+jjMxQwN51bGWc4t5rtHgSt+9wxCyUAc5Rn2sy0YQEUzhL+uygNIa8pR4Hzo4FrtUWzieHzc3Ym2j08lXViDJV02upr7C2HMyPlpqcWZNOg8qfflkVf8Vm3x1p7ibpB6mrCZ9WpW/3Ty8uuMZF5VZWbS64jWHkhEoxzDxqysNlRUJmfhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sU7/prHN; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sU7/prHN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7z7n40m4z3cB5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 05:52:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8CE09A45015;
	Thu,  6 Mar 2025 18:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3777BC4CEE4;
	Thu,  6 Mar 2025 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741287170;
	bh=zHkXxvTCym0KhjWbRn9ukBtTCkXKX0nK77Ga6+2Q1YQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sU7/prHNQYg50lA7Hgqj0K1JV1oudrxegE/7Yx9axrVAFFToyFBUGUG74ycwlXmZO
	 aq0XBTYCBQmpUJCkwEU/Dntqz+qE3P71BesMhHmp+sBEjPmFo7vSnZ1AiTchdUe70i
	 DuW4Y+bWiYoNGCgn5z3IrutQmgNDmAGNn+R5Q7kZGJZMIg21W1EcBEi7sD7/iGD9UL
	 Ke2xqsg+DakqZUrIVCcLXoVSSNTU6Qc9K22RHZSnsQwI+wRQEE/KhepO8LXgXyv5ig
	 o7R10Dqr4mttjq4pi8tkEwtM4iS1U3Oolo7BJkl6KzqCiWI4vyw/wcu4aZDHmjHKeg
	 JTD2x/pwRnwNg==
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
Subject: [PATCH 05/13] MIPS: make setup_zero_pages() use memblock
Date: Thu,  6 Mar 2025 20:51:15 +0200
Message-ID: <20250306185124.3147510-6-rppt@kernel.org>
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Allocating the zero pages from memblock is simpler because the memory is
already reserved.

This will also help with pulling out memblock_free_all() to the generic
code and reducing code duplication in arch::mem_init().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/mips/include/asm/mmzone.h |  2 --
 arch/mips/mm/init.c            | 16 +++++-----------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/mips/include/asm/mmzone.h b/arch/mips/include/asm/mmzone.h
index 14226ea42036..602a21aee9d4 100644
--- a/arch/mips/include/asm/mmzone.h
+++ b/arch/mips/include/asm/mmzone.h
@@ -20,6 +20,4 @@
 #define nid_to_addrbase(nid) 0
 #endif
 
-extern void setup_zero_pages(void);
-
 #endif /* _ASM_MMZONE_H_ */
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 3db6082c611e..f51cd97376df 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -59,25 +59,19 @@ EXPORT_SYMBOL(zero_page_mask);
 /*
  * Not static inline because used by IP27 special magic initialization code
  */
-void setup_zero_pages(void)
+static void __init setup_zero_pages(void)
 {
-	unsigned int order, i;
-	struct page *page;
+	unsigned int order;
 
 	if (cpu_has_vce)
 		order = 3;
 	else
 		order = 0;
 
-	empty_zero_page = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
+	empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, PAGE_SIZE);
 	if (!empty_zero_page)
 		panic("Oh boy, that early out of memory?");
 
-	page = virt_to_page((void *)empty_zero_page);
-	split_page(page, order);
-	for (i = 0; i < (1 << order); i++, page++)
-		mark_page_reserved(page);
-
 	zero_page_mask = ((PAGE_SIZE << order) - 1) & PAGE_MASK;
 }
 
@@ -470,9 +464,9 @@ void __init mem_init(void)
 	BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT));
 
 	maar_init();
-	memblock_free_all();
 	setup_zero_pages();	/* Setup zeroed pages.  */
 	mem_init_free_highmem();
+	memblock_free_all();
 
 #ifdef CONFIG_64BIT
 	if ((unsigned long) &_text > (unsigned long) CKSEG0)
@@ -486,8 +480,8 @@ void __init mem_init(void)
 void __init mem_init(void)
 {
 	high_memory = (void *) __va(get_num_physpages() << PAGE_SHIFT);
-	memblock_free_all();
 	setup_zero_pages();	/* This comes from node 0 */
+	memblock_free_all();
 }
 #endif /* !CONFIG_NUMA */
 
-- 
2.47.2


