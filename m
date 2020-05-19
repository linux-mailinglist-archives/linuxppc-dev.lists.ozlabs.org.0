Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FC41D90AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 09:09:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R6St55H7zDqQK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 17:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R4hT02ptzDqRJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 15:49:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49R4hN4V6cz9txm2;
 Tue, 19 May 2020 07:49:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oI3KC40Uh4Ce; Tue, 19 May 2020 07:49:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49R4hN3kc1z9txlx;
 Tue, 19 May 2020 07:49:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A0FA38B767;
 Tue, 19 May 2020 07:49:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id M3iiONmzHn-o; Tue, 19 May 2020 07:49:25 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 638E68B7A8;
 Tue, 19 May 2020 07:49:25 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3C08865A4A; Tue, 19 May 2020 05:49:25 +0000 (UTC)
Message-Id: <c535fc97bf0dd8693192e25feeed8088701e00c6.1589866984.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589866984.git.christophe.leroy@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 41/45] powerpc/8xx: Allow STRICT_KERNEL_RwX with pinned TLB
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 19 May 2020 05:49:25 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pinned TLB are 8M. Now that there is no strict boundary anymore
between text and RO data, it is possible to use 8M pinned executable
TLB that covers both text and RO data.

When PIN_TLB_DATA or PIN_TLB_TEXT is selected, enforce 8M RW data
alignment and allow STRICT_KERNEL_RWX.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Use the new function that sets all pinned TLBs at once.
---
 arch/powerpc/Kconfig               | 8 +++++---
 arch/powerpc/mm/nohash/8xx.c       | 9 +++++++--
 arch/powerpc/platforms/8xx/Kconfig | 2 +-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d147d379b1b9..f5e82629e2cd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -779,9 +779,10 @@ config THREAD_SHIFT
 	  want. Only change this if you know what you are doing.
 
 config DATA_SHIFT_BOOL
-	bool "Set custom data alignment" if STRICT_KERNEL_RWX && \
-					    (PPC_BOOK3S_32 || PPC_8xx)
+	bool "Set custom data alignment"
 	depends on ADVANCED_OPTIONS
+	depends on STRICT_KERNEL_RWX
+	depends on PPC_BOOK3S_32 || (PPC_8xx && !PIN_TLB_DATA && !PIN_TLB_TEXT)
 	help
 	  This option allows you to set the kernel data alignment. When
 	  RAM is mapped by blocks, the alignment needs to fit the size and
@@ -803,7 +804,8 @@ config DATA_SHIFT
 
 	  On 8xx, large pages (512kb or 8M) are used to map kernel linear
 	  memory. Aligning to 8M reduces TLB misses as only 8M pages are used
-	  in that case.
+	  in that case. If PIN_TLB is selected, it must be aligned to 8M as
+	  8M pages will be pinned.
 
 config FORCE_MAX_ZONEORDER
 	int "Maximum zone order"
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index ec3ef75895d8..d8697f535c3e 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -127,8 +127,8 @@ void __init mmu_mapin_immr(void)
 				    PAGE_KERNEL_NCG, MMU_PAGE_512K, true);
 }
 
-static void __init mmu_mapin_ram_chunk(unsigned long offset, unsigned long top,
-				       pgprot_t prot, bool new)
+static void mmu_mapin_ram_chunk(unsigned long offset, unsigned long top,
+				pgprot_t prot, bool new)
 {
 	unsigned long v = PAGE_OFFSET + offset;
 	unsigned long p = offset;
@@ -181,6 +181,9 @@ void mmu_mark_initmem_nx(void)
 
 	mmu_mapin_ram_chunk(0, boundary, PAGE_KERNEL_TEXT, false);
 	mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL, false);
+
+	if (IS_ENABLED(CONFIG_PIN_TLB_TEXT))
+		mmu_pin_tlb(block_mapped_ram, false);
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
@@ -189,6 +192,8 @@ void mmu_mark_rodata_ro(void)
 	unsigned long sinittext = __pa(_sinittext);
 
 	mmu_mapin_ram_chunk(0, sinittext, PAGE_KERNEL_ROX, false);
+	if (IS_ENABLED(CONFIG_PIN_TLB_DATA))
+		mmu_pin_tlb(block_mapped_ram, true);
 }
 #endif
 
diff --git a/arch/powerpc/platforms/8xx/Kconfig b/arch/powerpc/platforms/8xx/Kconfig
index 04ea1a8a0bdc..05669f2fadce 100644
--- a/arch/powerpc/platforms/8xx/Kconfig
+++ b/arch/powerpc/platforms/8xx/Kconfig
@@ -167,7 +167,7 @@ menu "8xx advanced setup"
 
 config PIN_TLB
 	bool "Pinned Kernel TLBs"
-	depends on ADVANCED_OPTIONS && !DEBUG_PAGEALLOC && !STRICT_KERNEL_RWX
+	depends on ADVANCED_OPTIONS && !DEBUG_PAGEALLOC
 	help
 	  On the 8xx, we have 32 instruction TLBs and 32 data TLBs. In each
 	  table 4 TLBs can be pinned.
-- 
2.25.0

