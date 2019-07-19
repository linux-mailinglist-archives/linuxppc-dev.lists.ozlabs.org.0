Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0196E0C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 07:53:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qgCk6spwzDqtN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 15:53:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qf845s44zDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 15:05:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="Znn2KVe6"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 45qf836QDkz9s00;
 Fri, 19 Jul 2019 15:05:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1563512707;
 bh=M+utsh9UbAsD43z7wK4lS+57JCI6TToPn3sL83++q5k=;
 h=From:To:Cc:Subject:Date:From;
 b=Znn2KVe6t3HWwaFhpNM4s2SWpg5QKgs+t8FoMeIxdT4O2yZbEOLJDnAAhlNyeokfK
 2P33GwGq+yc9BVgmQ68xJyofRQ9RdrIxPmljqTWykaSHuXpMghP51bKax5o3PBRdqJ
 zEVYVgZOMhpxL7tPRjHBheLFSjnyJhmF185w+tNUU5MImOIKPcIRHSDsBItKeCHKZb
 nJ8qi4xvPvJpQ9oVVJjyU+Cr9sC+UiuJ8maXO/ZSCcBqC/WclCbRKwcmr0m5WLPjYX
 NYcI3/qFCXeUwPnT7+n2VSugxziLcioBOvVbuk0ree3ykkSCOVS+VxfrifsXu7aoGo
 Tkc4FGe9f/PhQ==
Received: by neuling.org (Postfix, from userid 1000)
 id C62EA2A1025; Fri, 19 Jul 2019 15:05:07 +1000 (AEST)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/tm: Fix oops on sigreturn on systems without TM
Date: Fri, 19 Jul 2019 15:05:02 +1000
Message-Id: <20190719050502.405-1-mikey@neuling.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: mikey@neuling.org, Praveen Pandey <Praveen.Pandey@in.ibm.com>,
 gromero@br.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Breno Leitao <breno.leitao@gmail.com>, Haren Myneni <haren@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On systems like P9 powernv where we have no TM (or P8 booted with
ppc_tm=off), userspace can construct a signal context which still has
the MSR TS bits set. The kernel tries to restore this context which
results in the following crash:

[   74.980557] Unexpected TM Bad Thing exception at c0000000000022fc (msr 0x8000000102a03031) tm_scratch=800000020280f033
[   74.980741] Oops: Unrecoverable exception, sig: 6 [#1]
[   74.980820] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[   74.980917] Modules linked in:
[   74.980980] CPU: 0 PID: 1636 Comm: sigfuz Not tainted 5.2.0-11043-g0a8ad0ffa4 #69
[   74.981096] NIP:  c0000000000022fc LR: 00007fffb2d67e48 CTR: 0000000000000000
[   74.981212] REGS: c00000003fffbd70 TRAP: 0700   Not tainted  (5.2.0-11045-g7142b497d8)
[   74.981325] MSR:  8000000102a03031 <SF,VEC,VSX,FP,ME,IR,DR,LE,TM[E]>  CR: 42004242  XER: 00000000
[   74.981463] CFAR: c0000000000022e0 IRQMASK: 0
[   74.981463] GPR00: 0000000000000072 00007fffb2b6e560 00007fffb2d87f00 0000000000000669
[   74.981463] GPR04: 00007fffb2b6e728 0000000000000000 0000000000000000 00007fffb2b6f2a8
[   74.981463] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   74.981463] GPR12: 0000000000000000 00007fffb2b76900 0000000000000000 0000000000000000
[   74.981463] GPR16: 00007fffb2370000 00007fffb2d84390 00007fffea3a15ac 000001000a250420
[   74.981463] GPR20: 00007fffb2b6f260 0000000010001770 0000000000000000 0000000000000000
[   74.981463] GPR24: 00007fffb2d843a0 00007fffea3a14a0 0000000000010000 0000000000800000
[   74.981463] GPR28: 00007fffea3a14d8 00000000003d0f00 0000000000000000 00007fffb2b6e728
[   74.982420] NIP [c0000000000022fc] rfi_flush_fallback+0x7c/0x80
[   74.982517] LR [00007fffb2d67e48] 0x7fffb2d67e48
[   74.982593] Call Trace:
[   74.982632] Instruction dump:
[   74.982691] e96a0220 e96a02a8 e96a0330 e96a03b8 394a0400 4200ffdc 7d2903a6 e92d0c00
[   74.982809] e94d0c08 e96d0c10 e82d0c18 7db242a6 <4c000024> 7db243a6 7db142a6 f82d0c18

The problem is the signal code assumes TM is enabled when
CONFIG_PPC_TRANSACTIONAL_MEM is on. This may not be the case as with
P9 powernv or if `ppc_tm=off` is used on P8.

This means any local user can crash the system.

Fix the problem by returning a bad stack frame to the user if they try
to set the MSR TS bits with sigreturn() on systems where TM is not
supported.

Found with sigfuz kernel selftest on P9.

This fixes CVE-2019-13648.

Fixes: 2b0a576d15 ("powerpc: Add new transactional memory state to the signal context")
Cc: stable@vger.kernel.org # v3.9
Reported-by: Praveen Pandey <Praveen.Pandey@in.ibm.com>
Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/kernel/signal_32.c | 3 +++
 arch/powerpc/kernel/signal_64.c | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index f50b708d6d..98600b276f 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -1198,6 +1198,9 @@ SYSCALL_DEFINE0(rt_sigreturn)
 			goto bad;
 
 		if (MSR_TM_ACTIVE(msr_hi<<32)) {
+			/* Trying to start TM on non TM system */
+			if (!cpu_has_feature(CPU_FTR_TM))
+				goto bad;
 			/* We only recheckpoint on return if we're
 			 * transaction.
 			 */
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 2f80e270c7..117515564e 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -771,6 +771,11 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	if (MSR_TM_ACTIVE(msr)) {
 		/* We recheckpoint on return. */
 		struct ucontext __user *uc_transact;
+
+		/* Trying to start TM on non TM system */
+		if (!cpu_has_feature(CPU_FTR_TM))
+			goto badframe;
+
 		if (__get_user(uc_transact, &uc->uc_link))
 			goto badframe;
 		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
-- 
2.21.0

