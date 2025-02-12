Return-Path: <linuxppc-dev+bounces-6118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58A8A32044
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 08:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt9TB13hSz30Kd;
	Wed, 12 Feb 2025 18:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739346606;
	cv=none; b=oAJdy/z3vqxZv2/E6J9O81OEojf4qJpcyxOZZM171Q7nDuvmVY4HJcEgnszfns2w5fu8WEQWdEUTPebuozR2bTDCGSnVsTfmDmMRrD0B/1zAJW7iWy10t0MUQQShBy23XLeHgv0HtgvNHGgChhCK0KSJVg2ZEAsTP0vyUICNnKTgv0NdgO9ufU3kfC+jtRw5fCRJfuPTvGjK9lXX6u3Og+6wD0vuinbRPI5CSE2dLjhEPONyiEnDkemZLsEWH6DFk5bYQ5/DPvWrsu0znOmkVi4txqoBCjmUQ0HAcuo8BHZ8TeF6OowIxwiWZAScalD5/xxPu42J2Dyv+4/eKWVMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739346606; c=relaxed/relaxed;
	bh=h3H6lkXu54p518FwHwb5Ay9saaClYTLN/yBs/zHqTdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEC4gLpJfOYcpyqg1779VTGvrWtD+WzQZcy2jBJF9eaFPXlAE7nG6B+hW42bUgKDAVyF5L4F6LAmEUutCyc+MesVbmplo0W6ktl9mDPHfrGFJG1I77uGdJojSAQzcPIbC86FbdT47FGxpuoYYNB/adZgSKG+w5rItvLrnJn2fw23oZRqVwjG10Dv2keLVa3+Gl4k/JGtW7RJLaU7GOgskV1cmMqr/QjNwUNYYI3LDzMkGyshDMFNpUFlY+shj2xYAqGni7nELv639zfuRHMyjx3J6hL47H/jTfMwmulsfUuB43ME4T8CYjpdmfzgLaNUFW7Gedc3rLPuzeRQZk07NA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt9T92jRmz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 18:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yt9GW2gRHz9sSf;
	Wed, 12 Feb 2025 08:40:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id win_Exv7QbtN; Wed, 12 Feb 2025 08:40:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yt9GW1hD6z9sSd;
	Wed, 12 Feb 2025 08:40:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 110AF8B770;
	Wed, 12 Feb 2025 08:40:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id X0yeLhePcO08; Wed, 12 Feb 2025 08:40:51 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DF78E8B763;
	Wed, 12 Feb 2025 08:40:50 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Don't use --- in kernel logs
Date: Wed, 12 Feb 2025 08:40:48 +0100
Message-ID: <54a1f8d2c3fb5b95434039724c8c141052ae5cc0.1739346038.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739346048; l=2323; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=AOpEiDRdv/zMfMTCdXM0iJQaQUXHegfeysZkTKSnhmE=; b=HnFm4QGgZpVbWmsHfAv54PYdo8ORxP8uSAGUO5YwkXdvYNyyO0KcFrr9cj+Rso5TvF0E78nS5 KtDuxVk6pLLA6eTap+dpy3Bg0u7HmZEguEMpQw94EZzFrQNBs5wa4TA
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

When a kernel log containing --- at the start of a line is copied into
a patch message, 'git am' drops everything located after that ---.

Replace --- by ---- to avoid that.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/process.c | 8 ++++----
 arch/powerpc/xmon/xmon.c      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index ef91f71e07c4..855e09886503 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1000,7 +1000,7 @@ static inline void tm_reclaim_task(struct task_struct *tsk)
 
 	WARN_ON(tm_suspend_disabled);
 
-	TM_DEBUG("--- tm_reclaim on pid %d (NIP=%lx, "
+	TM_DEBUG("---- tm_reclaim on pid %d (NIP=%lx, "
 		 "ccr=%lx, msr=%lx, trap=%lx)\n",
 		 tsk->pid, thr->regs->nip,
 		 thr->regs->ccr, thr->regs->msr,
@@ -1008,7 +1008,7 @@ static inline void tm_reclaim_task(struct task_struct *tsk)
 
 	tm_reclaim_thread(thr, TM_CAUSE_RESCHED);
 
-	TM_DEBUG("--- tm_reclaim on pid %d complete\n",
+	TM_DEBUG("---- tm_reclaim on pid %d complete\n",
 		 tsk->pid);
 
 out_and_saveregs:
@@ -2367,14 +2367,14 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
 				(sp + STACK_INT_FRAME_REGS);
 
 			lr = regs->link;
-			printk("%s--- interrupt: %lx at %pS\n",
+			printk("%s---- interrupt: %lx at %pS\n",
 			       loglvl, regs->trap, (void *)regs->nip);
 
 			// Detect the case of an empty pt_regs at the very base
 			// of the stack and suppress showing it in full.
 			if (!empty_user_regs(regs, tsk)) {
 				__show_regs(regs);
-				printk("%s--- interrupt: %lx\n", loglvl, regs->trap);
+				printk("%s---- interrupt: %lx\n", loglvl, regs->trap);
 			}
 
 			firstframe = 1;
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 268859e4df87..042793b5be78 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1787,7 +1787,7 @@ static void xmon_show_stack(unsigned long sp, unsigned long lr,
 				       sp + STACK_INT_FRAME_REGS);
 				break;
 			}
-			printf("--- Exception: %lx %s at ", regs.trap,
+			printf("---- Exception: %lx %s at ", regs.trap,
 			       getvecname(TRAP(&regs)));
 			pc = regs.nip;
 			lr = regs.link;
-- 
2.47.0


