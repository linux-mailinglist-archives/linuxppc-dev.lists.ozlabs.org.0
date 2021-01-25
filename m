Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D2C302699
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 16:02:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPY4716R5zDr2k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 02:01:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPXmS3h71zDqjx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 01:48:24 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DPXmJ1bwlz9v0H0;
 Mon, 25 Jan 2021 15:48:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7jcHPIQb0b9h; Mon, 25 Jan 2021 15:48:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DPXmJ0qZCz9v0Gw;
 Mon, 25 Jan 2021 15:48:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 636858B79F;
 Mon, 25 Jan 2021 15:48:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PqICLbpgykXw; Mon, 25 Jan 2021 15:48:21 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 23EB08B79B;
 Mon, 25 Jan 2021 15:48:21 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1949866AD8; Mon, 25 Jan 2021 14:48:21 +0000 (UTC)
Message-Id: <e1961d698ee434a429117884f8d6ebd8383dc41d.1611585031.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1611585031.git.christophe.leroy@csgroup.eu>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 08/23] powerpc/irq: Add helper to set regs->softe
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon, 25 Jan 2021 14:48:21 +0000 (UTC)
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

regs->softe doesn't exist on PPC32.

Add irq_soft_mask_regs_set_state() helper to set regs->softe.
This helper will void on PPC32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/hw_irq.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 614957f74cee..ed0c3b049dfd 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -38,6 +38,8 @@
 #define PACA_IRQ_MUST_HARD_MASK	(PACA_IRQ_EE)
 #endif
 
+#endif /* CONFIG_PPC64 */
+
 /*
  * flags for paca->irq_soft_mask
  */
@@ -46,8 +48,6 @@
 #define IRQS_PMI_DISABLED	2
 #define IRQS_ALL_DISABLED	(IRQS_DISABLED | IRQS_PMI_DISABLED)
 
-#endif /* CONFIG_PPC64 */
-
 #ifndef __ASSEMBLY__
 
 #ifdef CONFIG_PPC64
@@ -287,6 +287,10 @@ extern void irq_set_pending_from_srr1(unsigned long srr1);
 
 extern void force_external_irq_replay(void);
 
+static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, unsigned long val)
+{
+	regs->softe = val;
+}
 #else /* CONFIG_PPC64 */
 
 static inline unsigned long arch_local_save_flags(void)
@@ -355,6 +359,9 @@ static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
 
 static inline void may_hard_irq_enable(void) { }
 
+static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, unsigned long val)
+{
+}
 #endif /* CONFIG_PPC64 */
 
 #define ARCH_IRQ_INIT_FLAGS	IRQ_NOREQUEST
-- 
2.25.0

