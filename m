Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C22B7313896
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 16:54:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ9Yw6MvKzDr4F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:54:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ8bk2vRczDrh9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 02:10:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZ8bY70FzzB09ZM;
 Mon,  8 Feb 2021 16:10:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cH81IoSgu4Xu; Mon,  8 Feb 2021 16:10:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZ8bY63JgzB09ZC;
 Mon,  8 Feb 2021 16:10:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 480538B7B3;
 Mon,  8 Feb 2021 16:10:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OYkV4SG2SC-C; Mon,  8 Feb 2021 16:10:39 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 20FB78B7B2;
 Mon,  8 Feb 2021 16:10:39 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 16FF26733E; Mon,  8 Feb 2021 15:10:39 +0000 (UTC)
Message-Id: <3e48bb439357c6f72ae4343bf93bd29f0980eeb1.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612796617.git.christophe.leroy@csgroup.eu>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v5 19/22] powerpc/syscall: Optimise checks in beginning of
 system_call_exception()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon,  8 Feb 2021 15:10:39 +0000 (UTC)
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

Combine all tests of regs->msr into a single logical one.

Before the patch:

   0:	81 6a 00 84 	lwz     r11,132(r10)
   4:	90 6a 00 88 	stw     r3,136(r10)
   8:	69 60 00 02 	xori    r0,r11,2
   c:	54 00 ff fe 	rlwinm  r0,r0,31,31,31
  10:	0f 00 00 00 	twnei   r0,0
  14:	69 63 40 00 	xori    r3,r11,16384
  18:	54 63 97 fe 	rlwinm  r3,r3,18,31,31
  1c:	0f 03 00 00 	twnei   r3,0
  20:	69 6b 80 00 	xori    r11,r11,32768
  24:	55 6b 8f fe 	rlwinm  r11,r11,17,31,31
  28:	0f 0b 00 00 	twnei   r11,0

After the patch:

   0:	81 6a 00 84 	lwz     r11,132(r10)
   4:	90 6a 00 88 	stw     r3,136(r10)
   8:	7d 6b 58 f8 	not     r11,r11
   c:	71 6b c0 02 	andi.   r11,r11,49154
  10:	0f 0b 00 00 	twnei   r11,0

6 cycles less on powerpc 8xx (328 => 322 cycles).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/interrupt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 55e1aa18cdb9..8c38e8c95be2 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -28,6 +28,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 				   unsigned long r0, struct pt_regs *regs)
 {
 	syscall_fn f;
+	unsigned long expected_msr;
 
 	regs->orig_gpr3 = r3;
 
@@ -39,10 +40,13 @@ notrace long system_call_exception(long r3, long r4, long r5,
 
 	trace_hardirqs_off(); /* finish reconciling */
 
+	expected_msr = MSR_PR;
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
-		BUG_ON(!(regs->msr & MSR_RI));
-	BUG_ON(!(regs->msr & MSR_PR));
-	BUG_ON(arch_irq_disabled_regs(regs));
+		expected_msr |= MSR_RI;
+	if (IS_ENABLED(CONFIG_PPC32))
+		expected_msr |= MSR_EE;
+	BUG_ON((regs->msr & expected_msr) ^ expected_msr);
+	BUG_ON(IS_ENABLED(CONFIG_PPC64) && arch_irq_disabled_regs(regs));
 
 #ifdef CONFIG_PPC_PKEY
 	if (mmu_has_feature(MMU_FTR_PKEY)) {
-- 
2.25.0

