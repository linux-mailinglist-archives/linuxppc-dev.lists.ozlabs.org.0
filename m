Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC27939DA50
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 12:56:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz9KZ1JZdz2yQy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 20:56:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz9K91NsNz2y6C
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 20:56:08 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4Fz9K123zmzB9WT;
 Mon,  7 Jun 2021 12:56:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w-jZenenHobH; Mon,  7 Jun 2021 12:56:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Fz9K107HHzB9Tv;
 Mon,  7 Jun 2021 12:56:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E9C0E8B78F;
 Mon,  7 Jun 2021 12:56:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NRm7cJxx93_e; Mon,  7 Jun 2021 12:56:04 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B86398B78D;
 Mon,  7 Jun 2021 12:56:04 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A0C1C64C69; Mon,  7 Jun 2021 10:56:04 +0000 (UTC)
Message-Id: <5838caffa269e0957c5a50cc85477876220298b0.1623063174.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/3] powerpc: Define empty_zero_page[] in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  7 Jun 2021 10:56:04 +0000 (UTC)
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

At the time being, empty_zero_page[] is defined in each
platform head.S.

Define it in mm/mem.c instead, and put it in BSS section instead
of the DATA section. Commit 5227cfa71f9e ("arm64: mm: place
empty_zero_page in bss") explains why it is interesting to have
it in BSS.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Applies on top of powerpc next-test with the Fixup for v3 "powerpc/nohash: Refactor update of BDI2000 pointers in switch_mmu_context()".
The last patch of this small series can be applied independently at the cost of a trivial conflict in asm-offsets.c

 arch/powerpc/kernel/head_40x.S       | 4 ----
 arch/powerpc/kernel/head_44x.S       | 4 ----
 arch/powerpc/kernel/head_64.S        | 5 -----
 arch/powerpc/kernel/head_8xx.S       | 6 ------
 arch/powerpc/kernel/head_book3s_32.S | 5 -----
 arch/powerpc/kernel/head_fsl_booke.S | 4 ----
 arch/powerpc/mm/mem.c                | 3 +++
 7 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 2717aa860cae..92b6c7356161 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -709,10 +709,6 @@ _GLOBAL(abort)
 	.align	12
 	.globl	sdata
 sdata:
-	.globl	empty_zero_page
-empty_zero_page:
-	.space	4096
-EXPORT_SYMBOL(empty_zero_page)
 	.globl	swapper_pg_dir
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index 2c4ffec027a2..e037eb615757 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -1241,10 +1241,6 @@ head_start_common:
 	.align	PAGE_SHIFT
 	.globl	sdata
 sdata:
-	.globl	empty_zero_page
-empty_zero_page:
-	.space	PAGE_SIZE
-EXPORT_SYMBOL(empty_zero_page)
 
 /*
  * To support >32-bit physical addresses, we use an 8KB pgdir.
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index ece7f97bafff..730838c7ca39 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -1012,8 +1012,3 @@ start_here_common:
 	.globl	swapper_pg_dir
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE
-
-	.globl	empty_zero_page
-empty_zero_page:
-	.space	PAGE_SIZE
-EXPORT_SYMBOL(empty_zero_page)
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 817df9fe7fb3..5ce42dfac061 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -795,12 +795,6 @@ _GLOBAL(mmu_pin_tlb)
 	.data
 	.globl	sdata
 sdata:
-	.globl	empty_zero_page
-	.align	PAGE_SHIFT
-empty_zero_page:
-	.space	PAGE_SIZE
-EXPORT_SYMBOL(empty_zero_page)
-
 	.globl	swapper_pg_dir
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 326262030279..79c744afc6b6 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -1274,11 +1274,6 @@ setup_usbgecko_bat:
 	.data
 	.globl	sdata
 sdata:
-	.globl	empty_zero_page
-empty_zero_page:
-	.space	4096
-EXPORT_SYMBOL(empty_zero_page)
-
 	.globl	swapper_pg_dir
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index ab718fd5e2a2..f33bc5a8e73e 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -1221,10 +1221,6 @@ _GLOBAL(restore_to_as0)
 	.align	12
 	.globl	sdata
 sdata:
-	.globl	empty_zero_page
-empty_zero_page:
-	.space	4096
-EXPORT_SYMBOL(empty_zero_page)
 	.globl	swapper_pg_dir
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 043bbeaf407c..b06e5d969051 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -27,6 +27,9 @@
 unsigned long long memory_limit;
 bool init_mem_is_free;
 
+unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
+EXPORT_SYMBOL(empty_zero_page);
+
 pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 			      unsigned long size, pgprot_t vma_prot)
 {
-- 
2.25.0

