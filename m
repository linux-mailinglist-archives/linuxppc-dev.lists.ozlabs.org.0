Return-Path: <linuxppc-dev+bounces-5333-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CC2A1362A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 10:06:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYcS02c82z2yvv;
	Thu, 16 Jan 2025 20:06:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737018400;
	cv=none; b=bAasRkgLhz0a4RCcdgHO4VCxAB0RNaN2+T22mKCiqeKZPeoS38OvfPVlIKcd53EwpgsDG5Pn5ZpH49i0Rzf6b4ppEQG9K/rTPpK19R3uizSX+ZCGI+o6czIb26nsqLhMNYnPlwpfRZb9ui0eJ1iqUQ65FT8GpdGkZbFAfFyNc9F16Y4DuFlohBj53Aui99Kilq+W/dC1IMOWNR7RU13ZnR3soTpntiKxUO3juI7U+qfcccaj5TyBntl8PJ7WK+XjsQWXX44jza7CiPS+djByuvT7k36wrPTzfjj8MV1E+oUSgF/7pZdps0GBbZQShWRgdYqAidiLB4yE2KVoCZtMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737018400; c=relaxed/relaxed;
	bh=ulbn2gRU5MN0S+VZMneJpsyHlwuwCh9HUXmEX/tD+g4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VuGFl1Cghk4ik+bV1fWB+8CqOf3mjm9odTY+wllQ8xnfS5/lrqaOZZxO/umnyQHDk8qY1pN+uX+K+uEbKlhSCljIOxHrZQ4IiZdS5fd9m5wp9o+b/GNXCi2lDmo5b2udGK99skYdUrel9bTeM/DK2fD86yCUOiVZncWEIBFUYp/X/kZP8BTOtISr0ihNF8NOOxIr5iPLySgcf2fyocTxMXLOAECjfiKwWiMWeObnn3+81QYC1Nc/3f2ruICh1g2q4faY5rMYJ4v8PeHT0/gUiHMZcs0vmHXxPxGKtERza7+5s0kALbxH5Ux/0bPTkqSg7oUdG3yspQwzq/lXs2MlpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=pangliyuan1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=pangliyuan1@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1228 seconds by postgrey-1.37 at boromir; Thu, 16 Jan 2025 20:06:38 AEDT
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYcRy6S74z2yvl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 20:06:35 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YYc0f72TMz20nyY;
	Thu, 16 Jan 2025 16:46:26 +0800 (CST)
Received: from kwepemd200025.china.huawei.com (unknown [7.221.188.181])
	by mail.maildlp.com (Postfix) with ESMTPS id BDAFE180044;
	Thu, 16 Jan 2025 16:46:02 +0800 (CST)
Received: from Linux-SUSE12SP5.huawei.com (10.67.136.247) by
 kwepemd200025.china.huawei.com (7.221.188.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Jan 2025 16:46:02 +0800
From: pangliyuan <pangliyuan1@huawei.com>
To: <pangliyuan1@huawei.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <naveen@kernel.org>, <maddy@linux.ibm.com>,
	<anil.s.keshavamurthy@intel.com>, <davem@davemloft.net>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>
CC: <wangfangpeng1@huawei.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH] powerpc/kprobes: don't save r13 register in kprobe context
Date: Thu, 16 Jan 2025 16:45:39 +0800
Message-ID: <20250116084539.58847-1-pangliyuan1@huawei.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20241209091039.72786-1-pangliyuan1@huawei.com>
References: <20241209091039.72786-1-pangliyuan1@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.136.247]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200025.china.huawei.com (7.221.188.181)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

When CONFIG_STACKPROTECTOR_STRONG is enabled and FTRACE is disabled on
powerpc64, repeatedly triggering the kprobe process may cause stack check
failures and panic.

Case:
There is a kprobe(do nothing in handler) attached to the "shmem_get_inode",
and a process A is creating file on tmpfs.

                           CPU0
A |r13 = paca_ptrs[0], paca_ptrs[0]->canary=A->stack_canary
  |touch a file on tmpfs
  |shmem_mknod():
  |    load A's canary through r13 and stored it in A's stack
  |    shmem_get_inode():
  |        enter kprobe first
  |        optinsn_slot():
  |            stored r13 (paca_ptrs[0]) in stack

  ......

  ==> schedule,  B run on CPU0, A run on CPU1

			   CPU0
B |r13 = paca_ptrs[0], paca_ptrs[0]->canary=B->stack_canary
  |do something...
                           CPU1
A |            r13 = paca_ptrs[1], paca_ptrs[1]->canary=A->stack_canary
  |            about to leave 'optinsn_slot', restore r13 from A's stack
  |            r13 = paca_ptrs[0], paca_ptrs[0]->canary=B->stack_canary
  |            leave optinsn_slot, back to shmem_get_inode
  |        leave shmem_get_inode, back to shmem_mknod
  |    do canary check in shmem_mknod, but canary stored in A's stack (A's
       canary) doesn't match the canary loaded through r13 (B's canary),
       so panic

When A(on CPU0) entring optinsn_slot, it stored r13(paca_ptrs[0]) in stack,
then A is scheduled to CPU1 and restore r13 from A's stack when leaving
'optinsn_slot'. Now A is running on CPU1 but r13 point to CPU0's
paca_ptrs[0], at this time paca_ptrs[0]->__current points to another
process B, which cause A use B's canary to do stack check and panic.

This can be simply fixed by not saving and restoring the r13 register,
because on powerpc64, r13 is a special register that reserved to point
to the current process, no need to restore the outdated r13 if scheduled
had happened.

Fixes: 51c9c0843993 ("powerpc/kprobes: Implement Optprobes")
Signed-off-by: pangliyuan <pangliyuan1@huawei.com>
---
 arch/powerpc/kernel/optprobes_head.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/optprobes_head.S
index 35932f45fb4e..bf0d77e62ba8 100644
--- a/arch/powerpc/kernel/optprobes_head.S
+++ b/arch/powerpc/kernel/optprobes_head.S
@@ -10,12 +10,12 @@
 #include <asm/asm-offsets.h>
 
 #ifdef CONFIG_PPC64
-#define SAVE_30GPRS(base) SAVE_GPRS(2, 31, base)
-#define REST_30GPRS(base) REST_GPRS(2, 31, base)
+#define SAVE_NEEDED_GPRS(base) SAVE_GPRS(2, 12, base); SAVE_GPRS(14, 31, base)
+#define REST_NEEDED_GPRS(base) REST_GPRS(2, 12, base); REST_GPRS(14, 31, base)
 #define TEMPLATE_FOR_IMM_LOAD_INSNS	nop; nop; nop; nop; nop
 #else
-#define SAVE_30GPRS(base) stmw	r2, GPR2(base)
-#define REST_30GPRS(base) lmw	r2, GPR2(base)
+#define SAVE_NEEDED_GPRS(base) stmw	r2, GPR2(base)
+#define REST_NEEDED_GPRS(base) lmw	r2, GPR2(base)
 #define TEMPLATE_FOR_IMM_LOAD_INSNS	nop; nop; nop
 #endif
 
@@ -45,7 +45,7 @@ optprobe_template_entry:
 	/* Save the previous SP into stack */
 	addi	r0,r1,INT_FRAME_SIZE
 	PPC_STL	r0,GPR1(r1)
-	SAVE_30GPRS(r1)
+	SAVE_NEEDED_GPRS(r1)
 	/* Save SPRS */
 	mfmsr	r5
 	PPC_STL	r5,_MSR(r1)
@@ -123,7 +123,7 @@ optprobe_template_call_emulate:
 	PPC_LL	r5,_CCR(r1)
 	mtcr	r5
 	REST_GPR(0,r1)
-	REST_30GPRS(r1)
+	REST_NEEDED_GPRS(r1)
 	/* Restore the previous SP */
 	addi	r1,r1,INT_FRAME_SIZE
 
-- 
2.37.7


