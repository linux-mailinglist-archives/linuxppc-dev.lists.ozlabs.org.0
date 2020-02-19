Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF520163E88
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 09:08:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Mr280FcgzDqgL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 19:08:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=a+d2CLaH; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MqzY6QqJzDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 19:06:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48MqzT4ggBz9v6VD;
 Wed, 19 Feb 2020 09:05:57 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=a+d2CLaH; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5Lddv28HMTMo; Wed, 19 Feb 2020 09:05:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48MqzT3gGvz9v6Ty;
 Wed, 19 Feb 2020 09:05:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582099557; bh=uC99Dw4D896mmje569PEZXQY/OKyCCj388EQrB6kDWk=;
 h=From:Subject:To:Cc:Date:From;
 b=a+d2CLaH+uVHh/i//leT7/8ULoS24WZjpZXGzo1fI50D+DIFw5ecyk5lwixFRiPlh
 Uh3U++78S5n79Da4kzB7y5p6Jc1dyZ2B3EZgkBcV/Cfjx93DnmaxnR8+lYZXWzak8D
 ekhnBzrIp6AD/8Bn6//kD0OYC2NW+yYigu+sdCAI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 652888B829;
 Wed, 19 Feb 2020 09:05:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iOegjwy5ehTE; Wed, 19 Feb 2020 09:05:58 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EAE978B756;
 Wed, 19 Feb 2020 09:05:57 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AF05E65317; Wed, 19 Feb 2020 08:05:57 +0000 (UTC)
Message-Id: <07a17425743600460ce35fa9432d42487a825583.1582099499.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2] powerpc/kprobes: Remove redundant code
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Date: Wed, 19 Feb 2020 08:05:57 +0000 (UTC)
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

At the time being we have something like

	if (something) {
		p = get();
		if (p) {
			if (something_wrong)
				goto out;
			...
			return;
		} else if (a != b) {
			if (some_error)
				goto out;
			...
		}
		goto out;
	}
	p = get();
	if (!p) {
		if (a != b) {
			if (some_error)
				goto out;
			...
		}
		goto out;
	}

This is similar to

	p = get();
	if (!p) {
		if (a != b) {
			if (some_error)
				goto out;
			...
		}
		goto out;
	}
	if (something) {
		if (something_wrong)
			goto out;
		...
		return;
	}

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: Reverse the logic by testing (!p) before kprobe_running() as suggested by Naveen.
---
 arch/powerpc/kernel/kprobes.c | 80 ++++++++++++++---------------------
 1 file changed, 32 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 9b340af02c38..84567406b53d 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -274,54 +274,6 @@ int kprobe_handler(struct pt_regs *regs)
 	preempt_disable();
 	kcb = get_kprobe_ctlblk();
 
-	/* Check we're not actually recursing */
-	if (kprobe_running()) {
-		p = get_kprobe(addr);
-		if (p) {
-			kprobe_opcode_t insn = *p->ainsn.insn;
-			if (kcb->kprobe_status == KPROBE_HIT_SS &&
-					is_trap(insn)) {
-				/* Turn off 'trace' bits */
-				regs->msr &= ~MSR_SINGLESTEP;
-				regs->msr |= kcb->kprobe_saved_msr;
-				goto no_kprobe;
-			}
-			/* We have reentered the kprobe_handler(), since
-			 * another probe was hit while within the handler.
-			 * We here save the original kprobes variables and
-			 * just single step on the instruction of the new probe
-			 * without calling any user handlers.
-			 */
-			save_previous_kprobe(kcb);
-			set_current_kprobe(p, regs, kcb);
-			kprobes_inc_nmissed_count(p);
-			kcb->kprobe_status = KPROBE_REENTER;
-			if (p->ainsn.boostable >= 0) {
-				ret = try_to_emulate(p, regs);
-
-				if (ret > 0) {
-					restore_previous_kprobe(kcb);
-					preempt_enable_no_resched();
-					return 1;
-				}
-			}
-			prepare_singlestep(p, regs);
-			return 1;
-		} else if (*addr != BREAKPOINT_INSTRUCTION) {
-			/* If trap variant, then it belongs not to us */
-			kprobe_opcode_t cur_insn = *addr;
-
-			if (is_trap(cur_insn))
-				goto no_kprobe;
-			/* The breakpoint instruction was removed by
-			 * another cpu right after we hit, no further
-			 * handling of this interrupt is appropriate
-			 */
-			ret = 1;
-		}
-		goto no_kprobe;
-	}
-
 	p = get_kprobe(addr);
 	if (!p) {
 		if (*addr != BREAKPOINT_INSTRUCTION) {
@@ -346,6 +298,38 @@ int kprobe_handler(struct pt_regs *regs)
 		goto no_kprobe;
 	}
 
+	/* Check we're not actually recursing */
+	if (kprobe_running()) {
+		kprobe_opcode_t insn = *p->ainsn.insn;
+		if (kcb->kprobe_status == KPROBE_HIT_SS && is_trap(insn)) {
+			/* Turn off 'trace' bits */
+			regs->msr &= ~MSR_SINGLESTEP;
+			regs->msr |= kcb->kprobe_saved_msr;
+			goto no_kprobe;
+		}
+		/* We have reentered the kprobe_handler(), since
+		 * another probe was hit while within the handler.
+		 * We here save the original kprobes variables and
+		 * just single step on the instruction of the new probe
+		 * without calling any user handlers.
+		 */
+		save_previous_kprobe(kcb);
+		set_current_kprobe(p, regs, kcb);
+		kprobes_inc_nmissed_count(p);
+		kcb->kprobe_status = KPROBE_REENTER;
+		if (p->ainsn.boostable >= 0) {
+			ret = try_to_emulate(p, regs);
+
+			if (ret > 0) {
+				restore_previous_kprobe(kcb);
+				preempt_enable_no_resched();
+				return 1;
+			}
+		}
+		prepare_singlestep(p, regs);
+		return 1;
+	}
+
 	kcb->kprobe_status = KPROBE_HIT_ACTIVE;
 	set_current_kprobe(p, regs, kcb);
 	if (p->pre_handler && p->pre_handler(p, regs)) {
-- 
2.25.0

