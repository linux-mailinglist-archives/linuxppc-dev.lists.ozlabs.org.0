Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ED73138A9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 16:58:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ9g52WgjzDrBH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:58:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ8bm6FNNzDrj1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 02:10:44 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZ8bc4DN5zB09ZQ;
 Mon,  8 Feb 2021 16:10:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yP2LxmVx8Wlz; Mon,  8 Feb 2021 16:10:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZ8bc2YxlzB09ZC;
 Mon,  8 Feb 2021 16:10:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B17E8B7B2;
 Mon,  8 Feb 2021 16:10:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id F0aPqm2tk8Li; Mon,  8 Feb 2021 16:10:41 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 31C798B7BC;
 Mon,  8 Feb 2021 16:10:41 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 279436733E; Mon,  8 Feb 2021 15:10:41 +0000 (UTC)
Message-Id: <7e381dc58b3f583556cfab37ba5d813bfd5cce1e.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612796617.git.christophe.leroy@csgroup.eu>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v5 21/22] powerpc/32: Remove the counter in global_dbcr0
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon,  8 Feb 2021 15:10:41 +0000 (UTC)
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

global_dbcr0 has two parts, 4 bytes to save/restore the
value of SPRN_DBCR0, and 4 bytes that are incremented/decremented
everytime something is saving/loading the above value.

This counter is only incremented/decremented, its value is never
used and never read.

Remove the counter and devide the size of global_dbcr0 by 2.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: New
---
 arch/powerpc/kernel/entry_32.S   | 12 +++---------
 arch/powerpc/kernel/head_32.h    |  3 ---
 arch/powerpc/kernel/head_booke.h |  5 +----
 3 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 7c824e8928d0..a574201b0eb6 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -175,14 +175,11 @@ transfer_to_handler:
 	addi	r11,r11,global_dbcr0@l
 #ifdef CONFIG_SMP
 	lwz	r9,TASK_CPU(r2)
-	slwi	r9,r9,3
+	slwi	r9,r9,2
 	add	r11,r11,r9
 #endif
 	lwz	r12,0(r11)
 	mtspr	SPRN_DBCR0,r12
-	lwz	r12,4(r11)
-	addi	r12,r12,-1
-	stw	r12,4(r11)
 #endif
 
 	b	3f
@@ -980,14 +977,11 @@ load_dbcr0:
 	addi	r11,r11,global_dbcr0@l
 #ifdef CONFIG_SMP
 	lwz	r9,TASK_CPU(r2)
-	slwi	r9,r9,3
+	slwi	r9,r9,2
 	add	r11,r11,r9
 #endif
 	stw	r10,0(r11)
 	mtspr	SPRN_DBCR0,r0
-	lwz	r10,4(r11)
-	addi	r10,r10,1
-	stw	r10,4(r11)
 	li	r11,-1
 	mtspr	SPRN_DBSR,r11	/* clear all pending debug events */
 	blr
@@ -996,7 +990,7 @@ load_dbcr0:
 	.align	4
 	.global global_dbcr0
 global_dbcr0:
-	.space	8*NR_CPUS
+	.space	4*NR_CPUS
 	.previous
 #endif /* !(CONFIG_4xx || CONFIG_BOOKE) */
 
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 282d8fd443a9..5001c6ecc3ec 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -166,9 +166,6 @@
 	addi	r11,r11,global_dbcr0@l
 	lwz	r12,0(r11)
 	mtspr	SPRN_DBCR0,r12
-	lwz	r12,4(r11)
-	addi	r12,r12,-1
-	stw	r12,4(r11)
 3:
 #endif
 	b	transfer_to_syscall		/* jump to handler */
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index bfbd240cc8a2..5f565232b99d 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -142,14 +142,11 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	addi	r11,r11,global_dbcr0@l
 #ifdef CONFIG_SMP
 	lwz	r10, TASK_CPU(r2)
-	slwi	r10, r10, 3
+	slwi	r10, r10, 2
 	add	r11, r11, r10
 #endif
 	lwz	r12,0(r11)
 	mtspr	SPRN_DBCR0,r12
-	lwz	r12,4(r11)
-	addi	r12,r12,-1
-	stw	r12,4(r11)
 
 3:
 	b	transfer_to_syscall	/* jump to handler */
-- 
2.25.0

