Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E52D55E7755
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 11:37:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYnB339q6z3cj0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 19:37:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=lihuafei1@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYn9b1HBYz3c4c
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 19:37:06 +1000 (AEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYn476F2kzlVyl;
	Fri, 23 Sep 2022 17:32:23 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 17:36:33 +0800
Received: from ubuntu1804.huawei.com (10.67.174.174) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 17:36:32 +0800
From: Li Huafei <lihuafei1@huawei.com>
To: <mpe@ellerman.id.au>, <jniethe5@gmail.com>
Subject: [PATCH] powerpc/kprobes: Fix null pointer reference in arch_prepare_kprobe()
Date: Fri, 23 Sep 2022 17:32:53 +0800
Message-ID: <20220923093253.177298-1-lihuafei1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
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
Cc: lihuafei1@huawei.com, peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, mhiramat@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I found a null pointer reference in arch_prepare_kprobe():

  # echo 'p cmdline_proc_show' > kprobe_events
  # echo 'p cmdline_proc_show+16' >> kprobe_events
  [   67.278533][  T122] Kernel attempted to read user page (0) - exploit attempt? (uid: 0)
  [   67.279326][  T122] BUG: Kernel NULL pointer dereference on read at 0x00000000
  [   67.279738][  T122] Faulting instruction address: 0xc000000000050bfc
  [   67.280486][  T122] Oops: Kernel access of bad area, sig: 11 [#1]
  [   67.280846][  T122] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
  [   67.281435][  T122] Modules linked in:
  [   67.281903][  T122] CPU: 0 PID: 122 Comm: sh Not tainted 6.0.0-rc3-00007-gdcf8e5633e2e #10
  [   67.282547][  T122] NIP:  c000000000050bfc LR: c000000000050bec CTR: 0000000000005bdc
  [   67.282920][  T122] REGS: c0000000348475b0 TRAP: 0300   Not tainted  (6.0.0-rc3-00007-gdcf8e5633e2e)
  [   67.283424][  T122] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 88002444  XER: 20040006
  [   67.284023][  T122] CFAR: c00000000022d100 DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0
  [   67.284023][  T122] GPR00: c000000000050bec c000000034847850 c0000000013f6100 c000000001fb7718
  [   67.284023][  T122] GPR04: c000000000515c10 c000000000e5fe08 c00000000133da60 c000000004839300
  [   67.284023][  T122] GPR08: c0000000014ffb98 0000000000000000 c000000000515c0c c000000000e18576
  [   67.284023][  T122] GPR12: c000000000e60170 c0000000015a0000 00000001155e0460 0000000000000000
  [   67.284023][  T122] GPR16: 0000000000000000 00007fffe8eeb3c8 0000000116320728 0000000000000000
  [   67.284023][  T122] GPR20: 0000000116320720 0000000000000000 c0000000012fa918 0000000000000006
  [   67.284023][  T122] GPR24: c0000000014ffb98 c0000000011ed360 0000000000000000 c000000001fb7928
  [   67.284023][  T122] GPR28: 0000000000000000 0000000000000000 000000007c0802a6 c000000001fb7918
  [   67.287799][  T122] NIP [c000000000050bfc] arch_prepare_kprobe+0x10c/0x2d0
  [   67.288490][  T122] LR [c000000000050bec] arch_prepare_kprobe+0xfc/0x2d0
  [   67.289025][  T122] Call Trace:
  [   67.289268][  T122] [c000000034847850] [c0000000012f77a0] 0xc0000000012f77a0 (unreliable)
  [   67.289999][  T122] [c0000000348478d0] [c000000000231320] register_kprobe+0x3c0/0x7a0
  [   67.290439][  T122] [c000000034847940] [c0000000002938c0] __register_trace_kprobe+0x140/0x1a0
  [   67.290898][  T122] [c0000000348479b0] [c0000000002944c4] __trace_kprobe_create+0x794/0x1040
  [   67.291330][  T122] [c000000034847b60] [c0000000002a1614] trace_probe_create+0xc4/0xe0
  [   67.291717][  T122] [c000000034847bb0] [c00000000029363c] create_or_delete_trace_kprobe+0x2c/0x80
  [   67.292158][  T122] [c000000034847bd0] [c000000000264420] trace_parse_run_command+0xf0/0x210
  [   67.292611][  T122] [c000000034847c70] [c0000000002934a0] probes_write+0x20/0x40
  [   67.292996][  T122] [c000000034847c90] [c00000000045e98c] vfs_write+0xfc/0x450
  [   67.293356][  T122] [c000000034847d50] [c00000000045eec4] ksys_write+0x84/0x140
  [   67.293716][  T122] [c000000034847da0] [c00000000002e4fc] system_call_exception+0x17c/0x3a0
  [   67.294186][  T122] [c000000034847e10] [c00000000000c0e8] system_call_vectored_common+0xe8/0x278
  [   67.294680][  T122] --- interrupt: 3000 at 0x7fffa5682de0
  [   67.294937][  T122] NIP:  00007fffa5682de0 LR: 0000000000000000 CTR: 0000000000000000
  [   67.295313][  T122] REGS: c000000034847e80 TRAP: 3000   Not tainted  (6.0.0-rc3-00007-gdcf8e5633e2e)
  [   67.295725][  T122] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44002408  XER: 00000000
  [   67.296291][  T122] IRQMASK: 0
  [   67.296291][  T122] GPR00: 0000000000000004 00007fffe8eeaec0 00007fffa5757300 0000000000000001
  [   67.296291][  T122] GPR04: 0000000116329c60 0000000000000017 0000000000116329 0000000000000000
  [   67.296291][  T122] GPR08: 0000000000000006 0000000000000000 0000000000000000 0000000000000000
  [   67.296291][  T122] GPR12: 0000000000000000 00007fffa580ac60 00000001155e0460 0000000000000000
  [   67.296291][  T122] GPR16: 0000000000000000 00007fffe8eeb3c8 0000000116320728 0000000000000000
  [   67.296291][  T122] GPR20: 0000000116320720 0000000000000000 0000000000000000 0000000000000002
  [   67.296291][  T122] GPR24: 00000001163206f0 0000000000000020 00007fffe8eeafa0 0000000000000001
  [   67.296291][  T122] GPR28: 0000000000000000 0000000000000017 0000000116329c60 0000000000000001
  [   67.299570][  T122] NIP [00007fffa5682de0] 0x7fffa5682de0
  [   67.299837][  T122] LR [0000000000000000] 0x0
  [   67.300072][  T122] --- interrupt: 3000
  [   67.300447][  T122] Instruction dump:
  [   67.300736][  T122] 386319d8 481342f5 60000000 60000000 60000000 e87f0028 3863fffc 481dc4d1
  [   67.301230][  T122] 60000000 2c230000 41820018 e9230058 <81290000> 552936be 2c090001 4182018c
  [   67.302102][  T122] ---[ end trace 0000000000000000 ]---
  [   67.302496][  T122]

The address being probed has some special:

  cmdline_proc_show: Probe based on ftrace
  cmdline_proc_show+16: Probe for the next instruction at the ftrace location

The ftrace-based kprobe does not generate kprobe::ainsn::insn, it gets
set to NULL. In arch_prepare_kprobe() it will check for:

  ...
  prev = get_kprobe(p->addr - 1);
  preempt_enable_no_resched();
  if (prev && ppc_inst_prefixed(ppc_inst_read(prev->ainsn.insn))) {
  ...

If prev is based on ftrace, 'ppc_inst_read(prev->ainsn.insn)' will occur
with a null pointer reference. At this point prev->addr will not be a
prefixed instruction, so the check can be skipped.

Check if prev is ftrace-based kprobe before reading 'prev->ainsn.insn'
to fix this problem.

Fixes: b4657f7650ba ("powerpc/kprobes: Don't allow breakpoints on suffixes")
Signed-off-by: Li Huafei <lihuafei1@huawei.com>
---
 arch/powerpc/kernel/kprobes.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 912d4f8a13be..9f6cbbd56809 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -161,7 +161,12 @@ int arch_prepare_kprobe(struct kprobe *p)
 	preempt_disable();
 	prev = get_kprobe(p->addr - 1);
 	preempt_enable_no_resched();
-	if (prev && ppc_inst_prefixed(ppc_inst_read(prev->ainsn.insn))) {
+	/*
+	 * When prev is a ftrace-based kprobe, we don't have an insn, and it
+	 * doesn't probe for prefixed instruction.
+	 */
+	if (prev && !kprobe_ftrace(prev) &&
+	    ppc_inst_prefixed(ppc_inst_read(prev->ainsn.insn))) {
 		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
 		ret = -EINVAL;
 	}
-- 
2.17.1

