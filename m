Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 723F047B9CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 07:00:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5RN2FYLz3df1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 17:00:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5Q16BXBz3bNB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 16:59:37 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id B781B80B64;
 Tue, 21 Dec 2021 00:59:30 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH llvm 3/6] powerpc/64/asm: Inline BRANCH_TO_C000
Date: Tue, 21 Dec 2021 16:59:01 +1100
Message-Id: <20211221055904.555763-4-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211221055904.555763-1-aik@ozlabs.ru>
References: <20211221055904.555763-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, Alan Modra <amodra@au1.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is used just once and does not really help with readability, remove it.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/exceptions-64s.S | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a30f563bc7a8..83d37678f7cf 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -89,19 +89,6 @@ name:
 	ori	reg,reg,(ABS_ADDR(label))@l;				\
 	addis	reg,reg,(ABS_ADDR(label))@h
 
-/*
- * Branch to label using its 0xC000 address. This results in instruction
- * address suitable for MSR[IR]=0 or 1, which allows relocation to be turned
- * on using mtmsr rather than rfid.
- *
- * This could set the 0xc bits for !RELOCATABLE as an immediate, rather than
- * load KBASE for a slight optimisation.
- */
-#define BRANCH_TO_C000(reg, label)					\
-	__LOAD_FAR_HANDLER(reg, label);					\
-	mtctr	reg;							\
-	bctr
-
 /*
  * Interrupt code generation macros
  */
@@ -962,7 +949,9 @@ TRAMP_REAL_BEGIN(system_reset_idle_wake)
 	/* We are waking up from idle, so may clobber any volatile register */
 	cmpwi	cr1,r5,2
 	bltlr	cr1	/* no state loss, return to idle caller with r3=SRR1 */
-	BRANCH_TO_C000(r12, DOTSYM(idle_return_gpr_loss))
+	__LOAD_FAR_HANDLER(r12, DOTSYM(idle_return_gpr_loss))
+	mtctr	r12
+	bctr
 #endif
 
 #ifdef CONFIG_PPC_PSERIES
-- 
2.30.2

