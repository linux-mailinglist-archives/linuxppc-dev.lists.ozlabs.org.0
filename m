Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FDA2CB271
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 02:42:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm1tb2s21zDqW5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 12:42:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Cm19323b8zDqs1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 12:09:58 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 7D1E6AE8022A;
 Tue,  1 Dec 2020 20:09:55 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/kuap: Restore AMR after replaying soft
 interrupts
Date: Wed,  2 Dec 2020 12:09:52 +1100
Message-Id: <20201202010952.7157-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When interrupted in raw_copy_from_user()/... after user memory access
is enabled, a nested handler may also access user memory (perf is
one example) and when it does so, it calls prevent_read_from_user()
which prevents the upper handler from accessing user memory.

This saves/restores AMR when replaying interrupts. get_kuap/set_kuap have
stubs for disabled KUAP so no ifdefs.

Found by syzkaller.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

This is an example:

------------[ cut here ]------------
Bug: Read fault blocked by AMR!
WARNING: CPU: 0 PID: 1603 at /home/aik/p/kernel/arch/powerpc/include/asm/book3s/64/kup-radix.h:145 __do_page_fau

Modules linked in:
CPU: 0 PID: 1603 Comm: amr Not tainted 5.10.0-rc6_v5.10-rc6_a+fstn1 #24
NIP:  c00000000009ece8 LR: c00000000009ece4 CTR: 0000000000000000
REGS: c00000000dc63560 TRAP: 0700   Not tainted  (5.10.0-rc6_v5.10-rc6_a+fstn1)
MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28002888  XER: 20040000
CFAR: c0000000001fa928 IRQMASK: 1
GPR00: c00000000009ece4 c00000000dc637f0 c000000002397600 000000000000001f
GPR04: c0000000020eb318 0000000000000000 c00000000dc63494 0000000000000027
GPR08: c00000007fe4de68 c00000000dfe9180 0000000000000000 0000000000000001
GPR12: 0000000000002000 c0000000030a0000 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 bfffffffffffffff
GPR20: 0000000000000000 c0000000134a4020 c0000000019c2218 0000000000000fe0
GPR24: 0000000000000000 0000000000000000 c00000000d106200 0000000040000000
GPR28: 0000000000000000 0000000000000300 c00000000dc63910 c000000001946730
NIP [c00000000009ece8] __do_page_fault+0xb38/0xde0
LR [c00000000009ece4] __do_page_fault+0xb34/0xde0
Call Trace:
[c00000000dc637f0] [c00000000009ece4] __do_page_fault+0xb34/0xde0 (unreliable)
[c00000000dc638a0] [c00000000000c968] handle_page_fault+0x10/0x2c
--- interrupt: 300 at strncpy_from_user+0x290/0x440
    LR = strncpy_from_user+0x284/0x440
[c00000000dc63ba0] [c000000000c3dcb0] strncpy_from_user+0x2f0/0x440 (unreliable)
[c00000000dc63c30] [c00000000068b888] getname_flags+0x88/0x2c0
[c00000000dc63c90] [c000000000662a44] do_sys_openat2+0x2d4/0x5f0
[c00000000dc63d30] [c00000000066560c] do_sys_open+0xcc/0x140
[c00000000dc63dc0] [c000000000045e10] system_call_exception+0x160/0x240
[c00000000dc63e20] [c00000000000da60] system_call_common+0xf0/0x27c
Instruction dump:
409c0048 3fe2ff5b 3bfff128 fac10060 fae10068 482f7a85 60000000 3c62ff5b
7fe4fb78 3863f250 4815bbd9 60000000 <0fe00000> 3c62ff5b 3863f2b8 4815c8b5
irq event stamp: 254
hardirqs last  enabled at (253): [<c000000000019550>] arch_local_irq_restore+0xa0/0x150
hardirqs last disabled at (254): [<c000000000008a10>] data_access_common_virt+0x1b0/0x1d0
softirqs last  enabled at (0): [<c0000000001f6d5c>] copy_process+0x78c/0x2120
softirqs last disabled at (0): [<0000000000000000>] 0x0
---[ end trace ba98aec5151f3aeb ]---
---
 arch/powerpc/kernel/irq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 7d0f7682d01d..915123d861d0 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -221,6 +221,7 @@ void replay_soft_interrupts(void)
 	 */
 	unsigned char happened = local_paca->irq_happened;
 	struct pt_regs regs;
+	unsigned long kuap_state = get_kuap();
 
 	ppc_save_regs(&regs);
 	regs.softe = IRQS_ENABLED;
@@ -309,6 +310,7 @@ void replay_soft_interrupts(void)
 		trace_hardirqs_off();
 		goto again;
 	}
+	set_kuap(kuap_state);
 }
 
 notrace void arch_local_irq_restore(unsigned long mask)
-- 
2.17.1

