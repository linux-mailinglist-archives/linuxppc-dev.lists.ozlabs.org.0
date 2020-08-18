Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D4A248D67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:44:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJF74hZgzDqbw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:44:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhZ20TMzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:26 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhT2vNKz9vCxm;
 Tue, 18 Aug 2020 19:19:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7fFxnJ-HMX1E; Tue, 18 Aug 2020 19:19:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhT0kw9z9vCxg;
 Tue, 18 Aug 2020 19:19:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E9ED38B7EC;
 Tue, 18 Aug 2020 19:19:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RF2JSlC1Y3sg; Tue, 18 Aug 2020 19:19:22 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A1B778B7D7;
 Tue, 18 Aug 2020 19:19:22 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8291B65CF4; Tue, 18 Aug 2020 17:19:22 +0000 (UTC)
Message-Id: <abfdc105b8b28c4eb3ab9a26297d17f302b600ea.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 10/25] powerpc/signal: Call get_tm_stackpointer() from
 get_sigframe()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:22 +0000 (UTC)
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

Instead of calling get_tm_stackpointer() from the caller, call it
directly from get_sigframe(). This avoids a double call and
allows get_tm_stackpointer() to become static and be inlined
into get_sigframe() by GCC.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal.c    | 9 ++++++---
 arch/powerpc/kernel/signal.h    | 6 ++----
 arch/powerpc/kernel/signal_32.c | 4 ++--
 arch/powerpc/kernel/signal_64.c | 2 +-
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index a295d482adec..5edded5c5d20 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -144,10 +144,13 @@ int show_unhandled_signals = 1;
 /*
  * Allocate space for the signal frame
  */
-void __user *get_sigframe(struct ksignal *ksig, unsigned long sp,
-			   size_t frame_size, int is_32)
+static unsigned long get_tm_stackpointer(struct task_struct *tsk);
+
+void __user *get_sigframe(struct ksignal *ksig, struct task_struct *tsk,
+			  size_t frame_size, int is_32)
 {
         unsigned long oldsp, newsp;
+	unsigned long sp = get_tm_stackpointer(tsk);
 
         /* Default to using normal stack */
 	if (is_32)
@@ -304,7 +307,7 @@ void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
 	user_enter();
 }
 
-unsigned long get_tm_stackpointer(struct task_struct *tsk)
+static unsigned long get_tm_stackpointer(struct task_struct *tsk)
 {
 	/* When in an active transaction that takes a signal, we need to be
 	 * careful with the stack.  It's possible that the stack has moved back
diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index 6c2a33ab042c..fb98731348c3 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -10,8 +10,8 @@
 #ifndef _POWERPC_ARCH_SIGNAL_H
 #define _POWERPC_ARCH_SIGNAL_H
 
-extern void __user *get_sigframe(struct ksignal *ksig, unsigned long sp,
-				  size_t frame_size, int is_32);
+void __user *get_sigframe(struct ksignal *ksig, struct task_struct *tsk,
+			  size_t frame_size, int is_32);
 
 extern int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 			   struct task_struct *tsk);
@@ -19,8 +19,6 @@ extern int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 extern int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 			      struct task_struct *tsk);
 
-extern unsigned long get_tm_stackpointer(struct task_struct *tsk);
-
 #ifdef CONFIG_VSX
 extern unsigned long copy_vsx_to_user(void __user *to,
 				      struct task_struct *task);
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 61621acacc63..e5b2801a94ac 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -766,7 +766,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 
 	/* Set up Signal Frame */
 	/* Put a Real Time Context onto stack */
-	rt_sf = get_sigframe(ksig, get_tm_stackpointer(tsk), sizeof(*rt_sf), 1);
+	rt_sf = get_sigframe(ksig, tsk, sizeof(*rt_sf), 1);
 	addr = rt_sf;
 	if (!access_ok(rt_sf, sizeof(*rt_sf)))
 		goto badframe;
@@ -1226,7 +1226,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 #endif
 
 	/* Set up Signal Frame */
-	frame = get_sigframe(ksig, get_tm_stackpointer(tsk), sizeof(*frame), 1);
+	frame = get_sigframe(ksig, tsk, sizeof(*frame), 1);
 	if (!access_ok(frame, sizeof(*frame)))
 		goto badframe;
 	sc = (struct sigcontext __user *) &frame->sctx;
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index d3db78732070..fec27d599e87 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -822,7 +822,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	unsigned long msr = regs->msr;
 #endif
 
-	frame = get_sigframe(ksig, get_tm_stackpointer(tsk), sizeof(*frame), 0);
+	frame = get_sigframe(ksig, tsk, sizeof(*frame), 0);
 	if (!access_ok(frame, sizeof(*frame)))
 		goto badframe;
 
-- 
2.25.0

