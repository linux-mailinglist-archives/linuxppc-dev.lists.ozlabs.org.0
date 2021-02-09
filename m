Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68628314CBB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:17:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZf2v3DjkzDsh0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:17:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdZs19GMzDsPr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:37 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdZm6d1vz9tx43;
 Tue,  9 Feb 2021 10:56:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UTXjDEB3I0bT; Tue,  9 Feb 2021 10:56:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdZm5gCrz9tx3b;
 Tue,  9 Feb 2021 10:56:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB75D8B7D6;
 Tue,  9 Feb 2021 10:56:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id g6alza1ydE_d; Tue,  9 Feb 2021 10:56:33 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 629858B7D4;
 Tue,  9 Feb 2021 10:56:33 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3771167342; Tue,  9 Feb 2021 09:56:33 +0000 (UTC)
Message-Id: <beda587cfa2b0ae7777bdd53a15b859a51aa78ca.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 09/41] powerpc/32: Entry cpu time accounting in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:33 +0000 (UTC)
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
index 24671c43f930..e794111d7c03 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -19,6 +19,9 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 #ifdef CONFIG_PPC32
 	if (regs->msr & MSR_EE)
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
index 53fb16f21b07..87c06e241fc2 100644
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

