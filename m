Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6284B7465
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 19:33:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyqTg2rp0z3cYs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 05:33:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyqST515Mz3cCG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 05:32:09 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JyqSD4Khxz9sS9;
 Tue, 15 Feb 2022 19:31:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ypNzNVQ374H; Tue, 15 Feb 2022 19:31:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JyqSB1WCKz9sSB;
 Tue, 15 Feb 2022 19:31:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 124AC8B77B;
 Tue, 15 Feb 2022 19:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id p6EysXEEycC9; Tue, 15 Feb 2022 19:31:53 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.174])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BEE268B779;
 Tue, 15 Feb 2022 19:31:53 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21FIViqR146776
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 19:31:44 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21FIVijG146775;
 Tue, 15 Feb 2022 19:31:44 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 3/4] powerpc/ftrace: Have arch_ftrace_get_regs() return
 NULL unless FL_SAVE_REGS is set
Date: Tue, 15 Feb 2022 19:31:24 +0100
Message-Id: <2f9a7e898c93cc7438ef5ccd47cb9c3a9c5b53ef.1644949750.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ff535e86d3a69376a6d89168511d4e403835f18b.1644949750.git.christophe.leroy@csgroup.eu>
References: <ff535e86d3a69376a6d89168511d4e403835f18b.1644949750.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1644949837; l=1733; s=20211009;
 h=from:subject:message-id; bh=cAWvlwCa+nEKIutuhyeNrkOt9aAuzzmtgF3bPEJq5WY=;
 b=b07RY3tcCjuMLFy7nTaDe7Z4KjEYo6N6K86nUQyejxDiLo0SVJ2huhqZmQGwbQzw5+lFz7MY26rx
 gpN8vPayC0jqRosi3GwRiBDBGu1g6JPW7fH1WqZoQrIyf2CDX7+N
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When FL_SAVE_REGS is not set we get here via ftrace_caller()
which doesn't save all registers.

ftrace_caller() explicitely clears regs.msr, so we can rely
on it to know where we come from. We don't expect MSR register
to be 0 at all when involving ftrace.

Reported-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Fixes: 40b035efe288 ("powerpc/ftrace: Implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ftrace.h           | 3 ++-
 arch/powerpc/kernel/trace/ftrace_mprofile.S | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 70b457097098..ff034ae4e472 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -30,7 +30,8 @@ struct ftrace_regs {
 
 static __always_inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *fregs)
 {
-	return &fregs->regs;
+	/* We clear regs.msr in ftrace_call */
+	return fregs->regs.msr ? &fregs->regs : NULL;
 }
 
 static __always_inline void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/kernel/trace/ftrace_mprofile.S
index 8443902d5a05..eb077270ec2f 100644
--- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
@@ -205,6 +205,10 @@ _GLOBAL(ftrace_caller)
 	PPC_STL	r0, _LINK(r1)
 	mr	r4, r0
 
+	/* Clear MSR to flag as ftrace_caller versus frace_regs_caller */
+	li	r8, 0
+	PPC_STL	r8, _MSR(r1)
+
 	/* Load &pt_regs in r6 for call below */
 	addi    r6, r1 ,STACK_FRAME_OVERHEAD
 
-- 
2.34.1

