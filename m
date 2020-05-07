Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 013161C8A3D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 14:15:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HsqW1X06zDqgD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 22:15:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Hsmy2gSKzDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 22:13:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QdTEcZFb; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49Hsmy0prkz9sSc; Thu,  7 May 2020 22:13:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49Hsmx62z6z9sSd; Thu,  7 May 2020 22:13:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588853601;
 bh=eOqCvUV4bRwBUpO7x7lzofkLSWNxKtgo5XAEFhJa5Qc=;
 h=From:To:Subject:Date:From;
 b=QdTEcZFbXn1Pe87a9Jbo74mhWscJcXqbpEJ+dSMt4feXphXBKm8DtKGFS6FwN/vl3
 nLor09HQtf7nuYNFqwdwYnRsNyaOBm77VSU7mHM0hGeL25/ElVLO+XUbW8cmTVCZYm
 dz9ZhohWYiKbxtW/UkhaLKr1qLK/ToWoAYiSshjMuz79IkboIycpyYZ/ht5rNKZe+2
 CA4CmMQwu8StR7f4LIvPck9IgyrBgA3DtRQ0hr0SLdY30+5Ej4lbHXxiPj/TltnRWA
 r3X486L3ZSDEF13XxoobIfBI2LJ2lhid7lmvLJ6dRbGHk1cwWI0v2Vubc2Ku0KOUlF
 +/K92eVfi1GBQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 1/4] powerpc/64s: Always has full regs,
 so remove remnant checks
Date: Thu,  7 May 2020 22:13:29 +1000
Message-Id: <20200507121332.2233629-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/ptrace.h | 23 ++++++++++++++++-------
 arch/powerpc/kernel/process.c     |  2 +-
 2 files changed, 17 insertions(+), 8 deletions(-)

v2: Unchanged.

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index e0195e6b892b..89f31d5a8062 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -179,6 +179,20 @@ extern int ptrace_put_reg(struct task_struct *task, int regno,
 
 #define current_pt_regs() \
 	((struct pt_regs *)((unsigned long)task_stack_page(current) + THREAD_SIZE) - 1)
+
+#ifdef __powerpc64__
+#ifdef CONFIG_PPC_BOOK3S
+#define TRAP(regs)		((regs)->trap)
+#define FULL_REGS(regs)		true
+#define SET_FULL_REGS(regs)	do { } while (0)
+#else
+#define TRAP(regs)		((regs)->trap & ~0x1)
+#define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
+#define SET_FULL_REGS(regs)	((regs)->trap |= 1)
+#endif
+#define CHECK_FULL_REGS(regs)	BUG_ON(!FULL_REGS(regs))
+#define NV_REG_POISON		0xdeadbeefdeadbeefUL
+#else
 /*
  * We use the least-significant bit of the trap field to indicate
  * whether we have saved the full set of registers, or only a
@@ -186,17 +200,12 @@ extern int ptrace_put_reg(struct task_struct *task, int regno,
  * On 4xx we use the next bit to indicate whether the exception
  * is a critical exception (1 means it is).
  */
+#define TRAP(regs)		((regs)->trap & ~0xF)
 #define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
-#ifndef __powerpc64__
+#define SET_FULL_REGS(regs)	((regs)->trap |= 1)
 #define IS_CRITICAL_EXC(regs)	(((regs)->trap & 2) != 0)
 #define IS_MCHECK_EXC(regs)	(((regs)->trap & 4) != 0)
 #define IS_DEBUG_EXC(regs)	(((regs)->trap & 8) != 0)
-#endif /* ! __powerpc64__ */
-#define TRAP(regs)		((regs)->trap & ~0xF)
-#ifdef __powerpc64__
-#define NV_REG_POISON		0xdeadbeefdeadbeefUL
-#define CHECK_FULL_REGS(regs)	BUG_ON(regs->trap & 1)
-#else
 #define NV_REG_POISON		0xdeadbeef
 #define CHECK_FULL_REGS(regs)						      \
 do {									      \
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8479c762aef2..8af3583546b7 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1720,7 +1720,7 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 	 * FULL_REGS(regs) return true.  This is necessary to allow
 	 * ptrace to examine the thread immediately after exec.
 	 */
-	regs->trap &= ~1UL;
+	SET_FULL_REGS(regs);
 
 #ifdef CONFIG_PPC32
 	regs->mq = 0;
-- 
2.25.1

