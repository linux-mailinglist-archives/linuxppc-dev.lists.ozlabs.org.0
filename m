Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E264633CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 13:06:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3LXc0rVrz3cW6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 23:06:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3LWk0CZyz3096
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 23:05:22 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J3LWb4ksHz9sSc;
 Tue, 30 Nov 2021 13:05:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asgcQ1z_74_Z; Tue, 30 Nov 2021 13:05:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J3LWZ2vy0z9sSd;
 Tue, 30 Nov 2021 13:05:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 544FF8B77B;
 Tue, 30 Nov 2021 13:05:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BsaB4EuA2GbA; Tue, 30 Nov 2021 13:05:14 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.93])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 15E558B763;
 Tue, 30 Nov 2021 13:05:14 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1AUC50nJ213789
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 13:05:00 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1AUC50Fp213788;
 Tue, 30 Nov 2021 13:05:00 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] powerpc/32: Remove _ENTRY() macro
Date: Tue, 30 Nov 2021 13:04:50 +0100
Message-Id: <62a35f8dde2bb74c8d0d7a5430cce07a5a3a6fb6.1638273868.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <68932ec2ba6b868d35006b96e90f0890f3da3c05.1638273868.git.christophe.leroy@csgroup.eu>
References: <68932ec2ba6b868d35006b96e90f0890f3da3c05.1638273868.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638273888; l=4300; s=20211009;
 h=from:subject:message-id; bh=kk1+JxekfD4IbJEqqb7QNhKABAvCBFivCtE4ldcnTes=;
 b=HntRXWiVjdk15JZ1Ldc0sXl03UFVWcal2aidJ+xkDuaCWRLM6zs2H5M2770RtsCFO+z6QXBBx0JH
 0abFFUghDfZfzu7hukTUl3Y4pajTmW1DIHnBFhvm/UZi2czecWbd
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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

_ENTRY() is now redundant with _GLOBAL(). Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc_asm.h   |  4 ----
 arch/powerpc/kernel/head_40x.S       | 18 +++++++++---------
 arch/powerpc/kernel/head_44x.S       |  4 ++--
 arch/powerpc/kernel/head_8xx.S       |  4 ++--
 arch/powerpc/kernel/head_book3s_32.S |  8 ++++----
 arch/powerpc/kernel/head_fsl_booke.S |  6 +++---
 6 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 35544ba93352..ea90ef9da207 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -192,10 +192,6 @@ GLUE(.,name):
 
 #else /* 32-bit */
 
-#define _ENTRY(n)	\
-	.globl n;	\
-n:
-
 #define _GLOBAL(n)	\
 	.globl n;	\
 n:
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 7d72ee5ab387..af63eb7deb69 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -52,8 +52,8 @@
  * This is all going to change RSN when we add bi_recs.......  -- Dan
  */
 	__HEAD
-_ENTRY(_stext);
-_ENTRY(_start);
+_GLOBAL(_stext);
+_GLOBAL(_start);
 
 	mr	r31,r3			/* save device tree ptr */
 
@@ -81,19 +81,19 @@ turn_on_mmu:
  */
 	. = 0xc0
 crit_save:
-_ENTRY(crit_r10)
+_GLOBAL(crit_r10)
 	.space	4
-_ENTRY(crit_r11)
+_GLOBAL(crit_r11)
 	.space	4
-_ENTRY(crit_srr0)
+_GLOBAL(crit_srr0)
 	.space	4
-_ENTRY(crit_srr1)
+_GLOBAL(crit_srr1)
 	.space	4
-_ENTRY(crit_r1)
+_GLOBAL(crit_r1)
 	.space	4
-_ENTRY(crit_dear)
+_GLOBAL(crit_dear)
 	.space	4
-_ENTRY(crit_esr)
+_GLOBAL(crit_esr)
 	.space	4
 
 /*
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index 02d2928d1e01..6170a804e181 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -52,8 +52,8 @@
  *
  */
 	__HEAD
-_ENTRY(_stext);
-_ENTRY(_start);
+_GLOBAL(_stext);
+_GLOBAL(_start);
 	/*
 	 * Reserve a word at a fixed location to store the address
 	 * of abatron_pteptrs
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 0d073b9fd52c..0b05f2be66b9 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -53,8 +53,8 @@
 #define PAGE_SHIFT_8M		23
 
 	__HEAD
-_ENTRY(_stext);
-_ENTRY(_start);
+_GLOBAL(_stext);
+_GLOBAL(_start);
 
 /* MPC8xx
  * This port was done on an MBX board with an 860.  Right now I only
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index dae813539851..26a56cd26967 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -50,13 +50,13 @@
 	mtspr	SPRN_DBAT##n##L,RB
 
 	__HEAD
-_ENTRY(_stext);
+_GLOBAL(_stext);
 
 /*
  * _start is defined this way because the XCOFF loader in the OpenFirmware
  * on the powermac expects the entry point to be a procedure descriptor.
  */
-_ENTRY(_start);
+_GLOBAL(_start);
 	/*
 	 * These are here for legacy reasons, the kernel used to
 	 * need to look like a coff function entry for the pmac
@@ -781,7 +781,7 @@ relocate_kernel:
  * r3 = dest addr, r4 = source addr, r5 = copy limit, r6 = start offset
  * on exit, r3, r4, r5 are unchanged, r6 is updated to be >= r5.
  */
-_ENTRY(copy_and_flush)
+_GLOBAL(copy_and_flush)
 	addi	r5,r5,-4
 	addi	r6,r6,-4
 4:	li	r0,L1_CACHE_BYTES/4
@@ -1075,7 +1075,7 @@ BEGIN_MMU_FTR_SECTION
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	blr
 
-_ENTRY(update_bats)
+_GLOBAL(update_bats)
 	lis	r4, 1f@h
 	ori	r4, r4, 1f@l
 	tophys(r4, r4)
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 0a9a0f301474..29badf8176ed 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -54,8 +54,8 @@
  *
  */
 	__HEAD
-_ENTRY(_stext);
-_ENTRY(_start);
+_GLOBAL(_stext);
+_GLOBAL(_start);
 	/*
 	 * Reserve a word at a fixed location to store the address
 	 * of abatron_pteptrs
@@ -154,7 +154,7 @@ _ENTRY(_start);
  * if needed
  */
 
-_ENTRY(__early_start)
+_GLOBAL(__early_start)
 	LOAD_REG_ADDR_PIC(r20, kernstart_virt_addr)
 	lwz     r20,0(r20)
 
-- 
2.33.1

