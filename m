Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D612D9436
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 09:41:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvZcx00QSzDqTx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 19:41:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CvZZs5gpnzDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 19:40:01 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 169E7AE80049;
 Mon, 14 Dec 2020 03:39:20 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v3] powerpc/kuap: Restore AMR after replaying soft
 interrupts
Date: Mon, 14 Dec 2020 19:39:18 +1100
Message-Id: <20201214083918.71075-1-aik@ozlabs.ru>
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

Since de78a9c "powerpc: Add a framework for Kernel Userspace Access
Protection", user access helpers call user_{read|write}_access_{begin|end}
when user space access is allowed.

890274c "powerpc/64s: Implement KUAP for Radix MMU" made the mentioned
helpers program a AMR special register to allow such access for a short
period of time, most of the time AMR is expected to block user memory
access by the kernel.

Since the code accesses the user space memory, unsafe_get_user()
calls might_fault() which calls arch_local_irq_restore() if either
CONFIG_PROVE_LOCKING or CONFIG_DEBUG_ATOMIC_SLEEP is enabled.
arch_local_irq_restore() then attempts to replay pending soft interrupts
as KUAP regions have hardware interrupts enabled.
If a pending interrupt happens to do user access (performance interrupts
do that), it enables access for a short period of time so after returning
from the replay, the user access state remains blocked and if a user page
fault happens - "Bug: Read fault blocked by AMR!" appears and SIGSEGV is
sent.

This saves/restores AMR when replaying interrupts.

This adds a check if AMR was not blocked when before replaying interrupts.

Found by syzkaller. The call stack for the bug is:

copy_from_user_nofault+0xf8/0x250
perf_callchain_user_64+0x3d8/0x8d0
perf_callchain_user+0x38/0x50
get_perf_callchain+0x28c/0x300
perf_callchain+0xb0/0x130
perf_prepare_sample+0x364/0xbf0
perf_event_output_forward+0xe0/0x280
__perf_event_overflow+0xa4/0x240
perf_swevent_hrtimer+0x1d4/0x1f0
__hrtimer_run_queues+0x328/0x900
hrtimer_interrupt+0x128/0x350
timer_interrupt+0x180/0x600
replay_soft_interrupts+0x21c/0x4f0
arch_local_irq_restore+0x94/0x150
lock_is_held_type+0x140/0x200
___might_sleep+0x220/0x330
__might_fault+0x88/0x120
do_strncpy_from_user+0x108/0x2b0
strncpy_from_user+0x1d0/0x2a0
getname_flags+0x88/0x2c0
do_sys_openat2+0x2d4/0x5f0
do_sys_open+0xcc/0x140
system_call_exception+0x160/0x240
system_call_common+0xf0/0x27c

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
Changes:
v3:
* do not block/unblock if AMR was blocked
* reverted move of AMR_KUAP_***
* added kuap_check_amr

v2:
* fixed compile on hash
* moved get/set to arch_local_irq_restore
* block KUAP before replaying

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
 arch/powerpc/kernel/irq.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 7d0f7682d01d..92f28ad78d6d 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -311,6 +311,23 @@ void replay_soft_interrupts(void)
 	}
 }
 
+#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_KUAP)
+static inline void replay_soft_interrupts_irqrestore(void)
+{
+	unsigned long kuap_state = get_kuap();
+
+	if (kuap_state != AMR_KUAP_BLOCKED)
+		set_kuap(AMR_KUAP_BLOCKED);
+
+	replay_soft_interrupts();
+
+	if (kuap_state != AMR_KUAP_BLOCKED)
+		set_kuap(kuap_state);
+}
+#else
+#define replay_soft_interrupts_irqrestore() replay_soft_interrupts()
+#endif
+
 notrace void arch_local_irq_restore(unsigned long mask)
 {
 	unsigned char irq_happened;
@@ -320,6 +337,14 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	if (mask)
 		return;
 
+	/*
+	 * It fires if anything calls local_irq_enable or restore when
+	 * KUAP is enabled, and the code handles that just fine by saving
+	 * and re-locking AMR but we would like to remove those calls,
+	 * hence the warning.
+	 */
+	kuap_check_amr();
+
 	/*
 	 * From this point onward, we can take interrupts, preempt,
 	 * etc... unless we got hard-disabled. We check if an event
@@ -373,7 +398,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	irq_soft_mask_set(IRQS_ALL_DISABLED);
 	trace_hardirqs_off();
 
-	replay_soft_interrupts();
+	replay_soft_interrupts_irqrestore();
 	local_paca->irq_happened = 0;
 
 	trace_hardirqs_on();
-- 
2.17.1

