Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E536536476A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 17:48:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPB7P6L8Rz3brX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 01:48:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPB6l6YySz2xZy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 01:48:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FPB6c0C3Zz9vBLm;
 Mon, 19 Apr 2021 17:48:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Svf3duY9WK-N; Mon, 19 Apr 2021 17:48:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FPB6b6MZJz9vBLc;
 Mon, 19 Apr 2021 17:48:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A89F98B7C9;
 Mon, 19 Apr 2021 17:48:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Eg1Cuzq8-G_I; Mon, 19 Apr 2021 17:48:12 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A3868B7C6;
 Mon, 19 Apr 2021 17:48:11 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 523FD67A2A; Mon, 19 Apr 2021 15:48:11 +0000 (UTC)
Message-Id: <f7f8c9f98c33eaea316755c7fef150d1d77e047d.1618847273.git.christophe.leroy@csgroup.eu>
In-Reply-To: <e1147287bf6f2fb0693048fe8db0298c7870e419.1618847273.git.christophe.leroy@csgroup.eu>
References: <e1147287bf6f2fb0693048fe8db0298c7870e419.1618847273.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 3/3] powerpc/irq: Enhance readability of trap types
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 sxwjean@gmail.com
Date: Mon, 19 Apr 2021 15:48:11 +0000 (UTC)
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

This patch makes use of trap types in irq.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/interrupt.h |  1 +
 arch/powerpc/kernel/irq.c            | 13 +++++--------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 8970990e3b08..44cde2e129b8 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -23,6 +23,7 @@
 #define INTERRUPT_INST_SEGMENT    0x480
 #define INTERRUPT_TRACE           0xd00
 #define INTERRUPT_H_DATA_STORAGE  0xe00
+#define INTERRUPT_HMI			0xe60
 #define INTERRUPT_H_FAC_UNAVAIL   0xf80
 #ifdef CONFIG_PPC_BOOK3S
 #define INTERRUPT_DOORBELL        0xa00
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 893d3f8d6f47..72cb45393ef2 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -142,7 +142,7 @@ void replay_soft_interrupts(void)
 	 */
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (local_paca->irq_happened & PACA_IRQ_HMI)) {
 		local_paca->irq_happened &= ~PACA_IRQ_HMI;
-		regs.trap = 0xe60;
+		regs.trap = INTERRUPT_HMI;
 		handle_hmi_exception(&regs);
 		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
 			hard_irq_disable();
@@ -150,7 +150,7 @@ void replay_soft_interrupts(void)
 
 	if (local_paca->irq_happened & PACA_IRQ_DEC) {
 		local_paca->irq_happened &= ~PACA_IRQ_DEC;
-		regs.trap = 0x900;
+		regs.trap = INTERRUPT_DECREMENTER;
 		timer_interrupt(&regs);
 		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
 			hard_irq_disable();
@@ -158,7 +158,7 @@ void replay_soft_interrupts(void)
 
 	if (local_paca->irq_happened & PACA_IRQ_EE) {
 		local_paca->irq_happened &= ~PACA_IRQ_EE;
-		regs.trap = 0x500;
+		regs.trap = INTERRUPT_EXTERNAL;
 		do_IRQ(&regs);
 		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
 			hard_irq_disable();
@@ -166,10 +166,7 @@ void replay_soft_interrupts(void)
 
 	if (IS_ENABLED(CONFIG_PPC_DOORBELL) && (local_paca->irq_happened & PACA_IRQ_DBELL)) {
 		local_paca->irq_happened &= ~PACA_IRQ_DBELL;
-		if (IS_ENABLED(CONFIG_PPC_BOOK3E))
-			regs.trap = 0x280;
-		else
-			regs.trap = 0xa00;
+		regs.trap = INTERRUPT_DOORBELL;
 		doorbell_exception(&regs);
 		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
 			hard_irq_disable();
@@ -178,7 +175,7 @@ void replay_soft_interrupts(void)
 	/* Book3E does not support soft-masking PMI interrupts */
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (local_paca->irq_happened & PACA_IRQ_PMI)) {
 		local_paca->irq_happened &= ~PACA_IRQ_PMI;
-		regs.trap = 0xf00;
+		regs.trap = INTERRUPT_PERFMON;
 		performance_monitor_exception(&regs);
 		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
 			hard_irq_disable();
-- 
2.25.0

