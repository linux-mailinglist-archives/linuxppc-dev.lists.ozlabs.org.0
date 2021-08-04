Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 102CC3E036E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 16:36:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfvSn6VpKz3clk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 00:36:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=pulehui@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfvSM5SJZz30BX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 00:36:19 +1000 (AEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GfvMn3qJJz83dT;
 Wed,  4 Aug 2021 22:32:21 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 22:36:12 +0800
Received: from ubuntu1804.huawei.com (10.67.174.98) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 22:36:12 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <oleg@redhat.com>, <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
 <paulus@samba.org>, <naveen.n.rao@linux.vnet.ibm.com>, <mhiramat@kernel.org>, 
 <christophe.leroy@csgroup.eu>, <peterz@infradead.org>, <npiggin@gmail.com>,
 <ruscur@russell.cc>
Subject: [PATCH] powerpc/kprobes: Fix kprobe Oops happens in booke
Date: Wed, 4 Aug 2021 22:37:35 +0800
Message-ID: <20210804143735.148547-1-pulehui@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.98]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500019.china.huawei.com (7.185.36.180)
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
Cc: zhangjinhao2@huawei.com, xukuohai@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When using kprobe on powerpc booke series processor, Oops happens
as show bellow:

[   35.861352] Oops: Exception in kernel mode, sig: 5 [#1]
[   35.861676] BE PAGE_SIZE=4K SMP NR_CPUS=24 QEMU e500
[   35.861905] Modules linked in:
[   35.862144] CPU: 0 PID: 76 Comm: sh Not tainted 5.14.0-rc3-00060-g7e96bf476270 #18
[   35.862610] NIP:  c0b96470 LR: c00107b4 CTR: c0161c80
[   35.862805] REGS: c387fe70 TRAP: 0700   Not tainted (5.14.0-rc3-00060-g7e96bf476270)
[   35.863198] MSR:  00029002 <CE,EE,ME>  CR: 24022824  XER: 20000000
[   35.863577]
[   35.863577] GPR00: c0015218 c387ff20 c313e300 c387ff50 00000004 40000002 40000000 0a1a2cce
[   35.863577] GPR08: 00000000 00000004 00000000 59764000 24022422 102490c2 00000000 00000000
[   35.863577] GPR16: 00000000 00000000 00000040 10240000 10240000 10240000 10240000 10220000
[   35.863577] GPR24: ffffffff 10240000 00000000 00000000 bfc655e8 00000800 c387ff50 00000000
[   35.865367] NIP [c0b96470] schedule+0x0/0x130
[   35.865606] LR [c00107b4] interrupt_exit_user_prepare_main+0xf4/0x100
[   35.865974] Call Trace:
[   35.866142] [c387ff20] [c0053224] irq_exit+0x114/0x120 (unreliable)
[   35.866472] [c387ff40] [c0015218] interrupt_return+0x14/0x13c
[   35.866728] --- interrupt: 900 at 0x100af3dc
[   35.866963] NIP:  100af3dc LR: 100de020 CTR: 00000000
[   35.867177] REGS: c387ff50 TRAP: 0900   Not tainted (5.14.0-rc3-00060-g7e96bf476270)
[   35.867488] MSR:  0002f902 <CE,EE,PR,FP,ME>  CR: 20022422  XER: 20000000
[   35.867808]
[   35.867808] GPR00: c001509c bfc65570 1024b4d0 00000000 100de020 20022422 bfc655a8 100af3dc
[   35.867808] GPR08: 0002f902 00000000 00000000 00000000 72656773 102490c2 00000000 00000000
[   35.867808] GPR16: 00000000 00000000 00000040 10240000 10240000 10240000 10240000 10220000
[   35.867808] GPR24: ffffffff 10240000 00000000 00000000 bfc655e8 10245910 ffffffff 00000001
[   35.869406] NIP [100af3dc] 0x100af3dc
[   35.869578] LR [100de020] 0x100de020
[   35.869751] --- interrupt: 900
[   35.870001] Instruction dump:
[   35.870283] 40c20010 815e0518 714a0100 41e2fd04 39200000 913e00c0 3b1e0450 4bfffd80
[   35.870666] 0fe00000 92a10024 4bfff1a9 60000000 <7fe00008> 7c0802a6 93e1001c 7c5f1378
[   35.871339] ---[ end trace 23ff848139efa9b9 ]---

There is no real mode for booke arch and the MMU translation is
always on. The corresponding MSR_IS/MSR_DS bit in booke is used
to switch the address space, but not for real mode judgment.

Fixes: 21f8b2fa3ca5 ("powerpc/kprobes: Ignore traps that happened in real mode")
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/powerpc/include/asm/ptrace.h | 6 ++++++
 arch/powerpc/kernel/kprobes.c     | 5 +----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 3e5d470a6155..4aec1a97024b 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -187,6 +187,12 @@ static inline unsigned long frame_pointer(struct pt_regs *regs)
 #define user_mode(regs) (((regs)->msr & MSR_PR) != 0)
 #endif
 
+#ifdef CONFIG_BOOKE
+#define real_mode(regs)	0
+#else
+#define real_mode(regs)	(!((regs)->msr & MSR_IR) || !((regs)->msr & MSR_DR))
+#endif
+
 #define force_successful_syscall_return()   \
 	do { \
 		set_thread_flag(TIF_NOERROR); \
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index cbc28d1a2e1b..fac9a5974718 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -289,10 +289,7 @@ int kprobe_handler(struct pt_regs *regs)
 	unsigned int *addr = (unsigned int *)regs->nip;
 	struct kprobe_ctlblk *kcb;
 
-	if (user_mode(regs))
-		return 0;
-
-	if (!(regs->msr & MSR_IR) || !(regs->msr & MSR_DR))
+	if (user_mode(regs) || real_mode(regs))
 		return 0;
 
 	/*
-- 
2.17.1

