Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C163EEEB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:43:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpv0v6yV6z30Fm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 00:43:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gpv0V2qK2z2yNp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 00:43:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gpv0N6XTrz9sV8;
 Tue, 17 Aug 2021 16:43:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLT5rGdc23Vl; Tue, 17 Aug 2021 16:43:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gpv0N5ST0z9sTs;
 Tue, 17 Aug 2021 16:43:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A0D568B7C3;
 Tue, 17 Aug 2021 16:43:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FB6XH30JvjtI; Tue, 17 Aug 2021 16:43:16 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 41E398B7A9;
 Tue, 17 Aug 2021 16:43:16 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C54A1668F5; Tue, 17 Aug 2021 14:43:15 +0000 (UTC)
Message-Id: <1d28441dd80845e6428d693c0724cb6457247466.1629211378.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32s: Fix random crashes by adding isync() after
 locking/unlocking KUEP
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 userm57@yahoo.com, fthain@linux-m68k.org
Date: Tue, 17 Aug 2021 14:43:15 +0000 (UTC)
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

Commit b5efec00b671 ("powerpc/32s: Move KUEP locking/unlocking in C")
removed the 'isync' instruction after adding/removing NX bit in user
segments. The reasoning behind this change was that when setting the
NX bit we don't mind it taking effect with delay as the kernel never
executes text from userspace, and when clearing the NX bit this is
to return to userspace and then the 'rfi' should synchronise the
context.

However, it looks like on book3s/32 having a hash page table, at least
on the G3 processor, we get an unexpected fault from userspace, then
this is followed by something wrong in the verification of MSR_PR
at end of another interrupt.

This is fixed by adding back the removed isync() following update
of NX bit in user segment registers. Only do it for cores with an
hash table, as 603 cores don't exhibit that problem and the two isync
increase ./null_syscall selftest by 6 cycles on an MPC 832x.

First problem: unexpected PROTFAULT

	[   62.896426] WARNING: CPU: 0 PID: 1660 at arch/powerpc/mm/fault.c:354 do_page_fault+0x6c/0x5b0
	[   62.918111] Modules linked in:
	[   62.923350] CPU: 0 PID: 1660 Comm: Xorg Not tainted 5.13.0-pmac-00028-gb3c15b60339a #40
	[   62.943476] NIP:  c001b5c8 LR: c001b6f8 CTR: 00000000
	[   62.954714] REGS: e2d09e40 TRAP: 0700   Not tainted  (5.13.0-pmac-00028-gb3c15b60339a)
	[   62.974581] MSR:  00021032 <ME,IR,DR,RI>  CR: 42d04f30  XER: 20000000
	[   62.990009]
        	       GPR00: c000424c e2d09f00 c301b680 e2d09f40 0000001e 42000000 00cba028 00000000
        	       GPR08: 08000000 48000010 c301b680 e2d09f30 22d09f30 00c1fff0 00cba000 a7b7ba4c
        	       GPR16: 00000031 00000000 00000000 00000000 00000000 00000000 a7b7b0d0 00c5c010
        	       GPR24: a7b7b64c a7b7d2f0 00000004 00000000 c1efa6c0 00cba02c 00000300 e2d09f40
	[   63.075238] NIP [c001b5c8] do_page_fault+0x6c/0x5b0
	[   63.085952] LR [c001b6f8] do_page_fault+0x19c/0x5b0
	[   63.096678] Call Trace:
	[   63.100075] [e2d09f00] [e2d09f04] 0xe2d09f04 (unreliable)
	[   63.112359] [e2d09f30] [c000424c] DataAccess_virt+0xd4/0xe4
	[   63.125168] --- interrupt: 300 at 0xa7a261dc
	[   63.134060] NIP:  a7a261dc LR: a7a253bc CTR: 00000000
	[   63.145302] REGS: e2d09f40 TRAP: 0300   Not tainted  (5.13.0-pmac-00028-gb3c15b60339a)
	[   63.165167] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 228428e2  XER: 20000000
	[   63.182162] DAR: 00cba02c DSISR: 42000000
        	       GPR00: a7a27448 afa6b0e0 a74c35c0 a7b7b614 0000001e a7b7b614 00cba028 00000000
        	       GPR08: 00020fd9 00000031 00cb9ff8 a7a273b0 220028e2 00c1fff0 00cba000 a7b7ba4c
        	       GPR16: 00000031 00000000 00000000 00000000 00000000 00000000 a7b7b0d0 00c5c010
        	       GPR24: a7b7b64c a7b7d2f0 00000004 00000002 0000001e a7b7b614 a7b7aff4 00000030
	[   63.275233] NIP [a7a261dc] 0xa7a261dc
	[   63.282291] LR [a7a253bc] 0xa7a253bc
	[   63.289087] --- interrupt: 300
	[   63.294322] Instruction dump:
	[   63.299291] 7c4a1378 810300a0 75278410 83820298 83a300a4 553b018c 551e0036 4082038c
	[   63.318630] 2e1b0000 40920228 75280800 41820220 <0fe00000> 3b600000 41920214 81420594
	[   63.338503] ---[ end trace f642a84639cba377 ]---

Second problem: MSR PR is seen unset allthough the interrupt frame shows it set

	[   63.666846] kernel BUG at arch/powerpc/kernel/interrupt.c:458!
	[   63.680633] Oops: Exception in kernel mode, sig: 5 [#1]
	[   63.692201] BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 PowerMac
	[   63.705011] Modules linked in:
	[   63.710247] CPU: 0 PID: 1660 Comm: Xorg Tainted: G        W         5.13.0-pmac-00028-gb3c15b60339a #40
	[   63.734553] NIP:  c0011434 LR: c001629c CTR: 00000000
	[   63.745796] REGS: e2d09e70 TRAP: 0700   Tainted: G        W          (5.13.0-pmac-00028-gb3c15b60339a)
	[   63.769844] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 42d09f30  XER: 00000000
	[   63.786052]
        	       GPR00: 00000000 e2d09f30 c301b680 e2d09f40 83440000 c44d0e68 e2d09e8c 00000000
        	       GPR08: 00000002 00dc228a 00004000 e2d09f30 22d09f30 00c1fff0 afa6ceb4 00c26144
        	       GPR16: 00c25fb8 00c26140 afa6ceb8 90000000 00c944d8 0000001c 00000000 00200000
        	       GPR24: 00000000 000001fb afa6d1b4 00000001 00000000 a539a2a0 a530fd80 00000089
	[   63.871284] NIP [c0011434] interrupt_exit_kernel_prepare+0x10/0x70
	[   63.885922] LR [c001629c] interrupt_return+0x9c/0x144
	[   63.897168] Call Trace:
	[   63.900562] [e2d09f30] [c000424c] DataAccess_virt+0xd4/0xe4 (unreliable)
	[   63.916773] --- interrupt: 300 at 0xa09be008
	[   63.925659] NIP:  a09be008 LR: a09bdfe8 CTR: a09bdfc0
	[   63.936903] REGS: e2d09f40 TRAP: 0300   Tainted: G        W          (5.13.0-pmac-00028-gb3c15b60339a)
	[   63.960953] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 420028e2  XER: 20000000
	[   63.977948] DAR: a539a308 DSISR: 0a000000
        	       GPR00: a7b90d50 afa6b2d0 a74c35c0 a0a8b690 a0a8b698 a5365d70 a4fa82a8 00000004
        	       GPR08: 00000000 a09bdfc0 00000000 a5360000 a09bde7c 00c1fff0 afa6ceb4 00c26144
        	       GPR16: 00c25fb8 00c26140 afa6ceb8 90000000 00c944d8 0000001c 00000000 00200000
        	       GPR24: 00000000 000001fb afa6d1b4 00000001 00000000 a539a2a0 a530fd80 00000089
	[   64.071020] NIP [a09be008] 0xa09be008
	[   64.078079] LR [a09bdfe8] 0xa09bdfe8
	[   64.084874] --- interrupt: 300
	[   64.090108] Instruction dump:
	[   64.095074] 80010024 83e1001c 7c0803a6 4bffff80 3bc00800 4bffffd0 486b42fd 4bffffcc
	[   64.114419] 81430084 71480002 41820038 554a0462 <0f0a0000> 80620060 74630001 40820034
	[   64.134298] ---[ end trace f642a84639cba378 ]---

Reported-by: Stan Johnson <userm57@yahoo.com>
Fixes: b5efec00b671 ("powerpc/32s: Move KUEP locking/unlocking in C")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 64201125a287..2658d30b223c 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -4,6 +4,8 @@
 
 #include <asm/bug.h>
 #include <asm/book3s/32/mmu-hash.h>
+#include <asm/mmu.h>
+#include <asm/synch.h>
 
 #ifndef __ASSEMBLY__
 
@@ -28,6 +30,8 @@ static inline void kuep_lock(void)
 		return;
 
 	update_user_segments(mfsr(0) | SR_NX);
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
+		isync();	/* Context sync required after mtsr() */
 }
 
 static inline void kuep_unlock(void)
@@ -36,6 +40,8 @@ static inline void kuep_unlock(void)
 		return;
 
 	update_user_segments(mfsr(0) & ~SR_NX);
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
+		isync();	/* Context sync required after mtsr() */
 }
 
 #ifdef CONFIG_PPC_KUAP
-- 
2.25.0

