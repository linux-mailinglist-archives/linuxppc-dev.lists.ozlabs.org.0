Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE615D8BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 14:49:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Jvrc0ZGDzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 00:49:52 +1100 (AEDT)
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
 header.s=mail header.b=osJOwHfv; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JvkC5jvvzDqY4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 00:44:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Jvk72V3Vz9vCR9;
 Fri, 14 Feb 2020 14:44:15 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=osJOwHfv; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0NoDlu6ms6Qm; Fri, 14 Feb 2020 14:44:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Jvk711Dqz9vCR5;
 Fri, 14 Feb 2020 14:44:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581687855; bh=p5OSchYtuMtDjkKkYQzLUBJDMO3eTkGR/MZiD0IIXe4=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=osJOwHfvoWgb3e+1x6J09Y1VkIdNT7TU2Dctc+uxOkG+hxqPMDxZk7Ub6XRLVnkep
 ddWoKAcvSHjRz95r4OEc+LnqCf9oQj6vHaI5WPbAIC7oXx3GmHXSsx7/smlk5G3tnl
 zzdHTZCbOeZ2fuz7ebtuRQglRxBSzCtOEp0QnwlA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D51F8B89C;
 Fri, 14 Feb 2020 14:44:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uy2nkeZb4FMB; Fri, 14 Feb 2020 14:44:16 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2DD4C8B89A;
 Fri, 14 Feb 2020 14:44:16 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0FD6C65284; Fri, 14 Feb 2020 13:44:16 +0000 (UTC)
Message-Id: <b67d6705956a1a294af600700115930ff87e643c.1581687838.git.christophe.leroy@c-s.fr>
In-Reply-To: <642c8b4ca59e658be38d8dde00f994e183790a6a.1581687838.git.christophe.leroy@c-s.fr>
References: <642c8b4ca59e658be38d8dde00f994e183790a6a.1581687838.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/2] powerpc/kprobes: Reduce depth of a test
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 14 Feb 2020 13:44:16 +0000 (UTC)
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

	if (a) {
		if (b)
			do_something();
	}

Is equivalent to

	if (a & b)
		do_something();

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/kprobes.c | 58 +++++++++++++++++------------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 7a925eb76ec0..d7c80a078c1e 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -277,38 +277,36 @@ int kprobe_handler(struct pt_regs *regs)
 
 	/* Check we're not actually recursing */
 	p = get_kprobe(addr);
-	if (kprobe_running()) {
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
+	if (kprobe_running() && p) {
+		kprobe_opcode_t insn = *p->ainsn.insn;
+
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
 			}
-			prepare_singlestep(p, regs);
-			return 1;
 		}
+		prepare_singlestep(p, regs);
+		return 1;
 	}
 
 	if (!p) {
-- 
2.25.0

