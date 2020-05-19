Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C76371D909B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 09:02:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R6JD3mLPzDqcD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 17:02:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R4hN3N8gzDqW6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 15:49:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49R4hJ3XM0z9txm0;
 Tue, 19 May 2020 07:49:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IwhKBM4a27U6; Tue, 19 May 2020 07:49:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49R4hJ2m6dz9txlx;
 Tue, 19 May 2020 07:49:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 73E438B7A7;
 Tue, 19 May 2020 07:49:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IJD4e6qqNMiY; Tue, 19 May 2020 07:49:21 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 430128B767;
 Tue, 19 May 2020 07:49:21 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1F9F065A4A; Tue, 19 May 2020 05:49:20 +0000 (UTC)
Message-Id: <6312575d06a8813105e6564a3b12e1d373aa1b2f.1589866984.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589866984.git.christophe.leroy@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 37/45] powerpc/8xx: Refactor kernel address boundary
 comparison
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 19 May 2020 05:49:20 +0000 (UTC)
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

Now that linear and IMMR dedicated TLB handling is gone, kernel
boundary address comparison is similar in ITLB miss handler and
in DTLB miss handler.

Create a macro named compare_to_kernel_boundary.

When TASK_SIZE is strictly below 0x80000000 and PAGE_OFFSET is
above 0x80000000, it is enough to compare to 0x8000000, and this
can be done with a single instruction.

Using not. instruction, we get to use 'blt' conditional branch as
when doing a regular comparison:

0x00000000 <= addr <= 0x7fffffff ==>
0xffffffff >= NOT(addr) >= 0x80000000
The above test corresponds to a 'blt'

Otherwise, do a regular comparison using two instructions.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_8xx.S | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 9f3f7f3d03a7..9a117b9f0998 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -32,10 +32,15 @@
 
 #include "head_32.h"
 
+.macro compare_to_kernel_boundary scratch, addr
 #if CONFIG_TASK_SIZE <= 0x80000000 && CONFIG_PAGE_OFFSET >= 0x80000000
 /* By simply checking Address >= 0x80000000, we know if its a kernel address */
-#define SIMPLE_KERNEL_ADDRESS		1
+	not.	\scratch, \addr
+#else
+	rlwinm	\scratch, \addr, 16, 0xfff8
+	cmpli	cr0, \scratch, PAGE_OFFSET@h
 #endif
+.endm
 
 /*
  * We need an ITLB miss handler for kernel addresses if:
@@ -209,20 +214,11 @@ InstructionTLBMiss:
 	mtspr	SPRN_MD_EPN, r10
 #ifdef ITLB_MISS_KERNEL
 	mfcr	r11
-#if defined(SIMPLE_KERNEL_ADDRESS)
-	cmpi	cr0, r10, 0	/* Address >= 0x80000000 */
-#else
-	rlwinm	r10, r10, 16, 0xfff8
-	cmpli	cr0, r10, PAGE_OFFSET@h
-#endif
+	compare_to_kernel_boundary r10, r10
 #endif
 	mfspr	r10, SPRN_M_TWB	/* Get level 1 table */
 #ifdef ITLB_MISS_KERNEL
-#if defined(SIMPLE_KERNEL_ADDRESS)
-	bge+	3f
-#else
 	blt+	3f
-#endif
 	rlwinm	r10, r10, 0, 20, 31
 	oris	r10, r10, (swapper_pg_dir - PAGE_OFFSET)@ha
 3:
@@ -288,9 +284,7 @@ DataStoreTLBMiss:
 	 * kernel page tables.
 	 */
 	mfspr	r10, SPRN_MD_EPN
-	rlwinm	r10, r10, 16, 0xfff8
-	cmpli	cr0, r10, PAGE_OFFSET@h
-
+	compare_to_kernel_boundary r10, r10
 	mfspr	r10, SPRN_M_TWB	/* Get level 1 table */
 	blt+	3f
 	rlwinm	r10, r10, 0, 20, 31
-- 
2.25.0

