Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BEE332503
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 13:12:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvvH62LRnz3fC9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 23:12:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvvCR15Btz3cK7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 23:09:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DvvCM31KKz9tyjH;
 Tue,  9 Mar 2021 13:09:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Dd-6LQI-1UZ2; Tue,  9 Mar 2021 13:09:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DvvCM0hdnz9tyjF;
 Tue,  9 Mar 2021 13:09:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 688D48B7FC;
 Tue,  9 Mar 2021 13:09:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Q2BNzlo41jGJ; Tue,  9 Mar 2021 13:09:36 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F0738B800;
 Tue,  9 Mar 2021 13:09:36 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 03D0067555; Tue,  9 Mar 2021 12:09:36 +0000 (UTC)
Message-Id: <28be46386846e1f454c10d7ac63cf986fc0a8193.1615291472.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615291471.git.christophe.leroy@csgroup.eu>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 10/43] powerpc/32: Entry cpu time accounting in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Mar 2021 12:09:36 +0000 (UTC)
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

There is no need for this to be in asm,
use the new interrupt entry wrapper.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/interrupt.h |  3 +++
 arch/powerpc/include/asm/ppc_asm.h   | 10 ----------
 arch/powerpc/kernel/entry_32.S       |  1 -
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index b2f69e5dcb50..c35368adbe71 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -32,6 +32,9 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 #ifdef CONFIG_PPC32
 	if (!arch_irq_disabled_regs(regs))
 		trace_hardirqs_off();
+
+	if (user_mode(regs))
+		account_cpu_user_entry();
 #endif
 	/*
 	 * Book3E reconciles irq soft mask in asm
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 3dceb64fc9af..8998122fc7e2 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -23,18 +23,8 @@
  */
 
 #ifndef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
-#define ACCOUNT_CPU_USER_ENTRY(ptr, ra, rb)
 #define ACCOUNT_CPU_USER_EXIT(ptr, ra, rb)
 #else
-#define ACCOUNT_CPU_USER_ENTRY(ptr, ra, rb)				\
-	MFTB(ra);			/* get timebase */		\
-	PPC_LL	rb, ACCOUNT_STARTTIME_USER(ptr);			\
-	PPC_STL	ra, ACCOUNT_STARTTIME(ptr);				\
-	subf	rb,rb,ra;		/* subtract start value */	\
-	PPC_LL	ra, ACCOUNT_USER_TIME(ptr);				\
-	add	ra,ra,rb;		/* add on to user time */	\
-	PPC_STL	ra, ACCOUNT_USER_TIME(ptr);				\
-
 #define ACCOUNT_CPU_USER_EXIT(ptr, ra, rb)				\
 	MFTB(ra);			/* get timebase */		\
 	PPC_LL	rb, ACCOUNT_STARTTIME(ptr);				\
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 0f18fe14649c..0f3f1bdd909e 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -152,7 +152,6 @@ transfer_to_handler:
 	lwz	r12,THREAD_DBCR0(r12)
 	andis.	r12,r12,DBCR0_IDM@h
 #endif
-	ACCOUNT_CPU_USER_ENTRY(r2, r11, r12)
 #ifdef CONFIG_PPC_BOOK3S_32
 	kuep_lock r11, r12
 #endif
-- 
2.25.0

