Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203715D8B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 14:47:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JvnP1jFxzDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 00:47:05 +1100 (AEDT)
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
 header.s=mail header.b=OJRozS65; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JvkC0MNvzDqY2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 00:44:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Jvk62C9tz9vCR3;
 Fri, 14 Feb 2020 14:44:14 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OJRozS65; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ti0GL2lrgQtq; Fri, 14 Feb 2020 14:44:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Jvk60tlfz9vCR5;
 Fri, 14 Feb 2020 14:44:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581687854; bh=8IMYknI2mXEEKtntcFVt5VUeSSPLrAqXhjaL2dyMK6I=;
 h=From:Subject:To:Cc:Date:From;
 b=OJRozS65Yrw1J3YL0lElZFk91a26UQQT7zj/kUF8VB/QO69MdwaStTvN/ETlOqkLE
 jnHmj3kv8dQFUFBOfgZ5SYL9rM7fIyDlWna7vH6BTS+/OuJXs7iKyA6J9Yc663m0jB
 t9VUoeQQpAfuMr4uSTslqrU8MZfccdTMudMzCGT8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 763378B89A;
 Fri, 14 Feb 2020 14:44:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FGFcy5NYp3sZ; Fri, 14 Feb 2020 14:44:15 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AA688B899;
 Fri, 14 Feb 2020 14:44:15 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0803E65284; Fri, 14 Feb 2020 13:44:15 +0000 (UTC)
Message-Id: <642c8b4ca59e658be38d8dde00f994e183790a6a.1581687838.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/2] powerpc/kprobes: Remove redundant code
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 14 Feb 2020 13:44:15 +0000 (UTC)
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
	if (something) {
		if (p) {
			if (something_wrong)
				goto out;
			...
			return;
		}
	}
	if (!p) {
		if (a != b) {
			if (some_error)
				goto out;
			...
		}
		goto out;
	}

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/kprobes.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index f8b848aa65bd..7a925eb76ec0 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -276,8 +276,8 @@ int kprobe_handler(struct pt_regs *regs)
 	kcb = get_kprobe_ctlblk();
 
 	/* Check we're not actually recursing */
+	p = get_kprobe(addr);
 	if (kprobe_running()) {
-		p = get_kprobe(addr);
 		if (p) {
 			kprobe_opcode_t insn = *p->ainsn.insn;
 			if (kcb->kprobe_status == KPROBE_HIT_SS &&
@@ -308,22 +308,9 @@ int kprobe_handler(struct pt_regs *regs)
 			}
 			prepare_singlestep(p, regs);
 			return 1;
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
 		}
-		goto no_kprobe;
 	}
 
-	p = get_kprobe(addr);
 	if (!p) {
 		if (*addr != BREAKPOINT_INSTRUCTION) {
 			/*
-- 
2.25.0

