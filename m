Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E34E6564
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 15:36:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPSV14Xs1z3c8w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 01:36:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPSNl09qrz3c1N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 01:32:22 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KPSMD0wk1z9sTs;
 Thu, 24 Mar 2022 15:31:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbWzCh9ugxq4; Thu, 24 Mar 2022 15:31:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KPSLz0530z9sTw;
 Thu, 24 Mar 2022 15:30:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E8A498B780;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iL0nVEGK8aqY; Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.77])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C89348B794;
 Thu, 24 Mar 2022 15:30:49 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22OEUfQG1811694
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 15:30:41 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22OEUf7P1811693;
 Thu, 24 Mar 2022 15:30:41 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 04/22] powerpc/ftrace: Use is_offset_in_branch_range()
Date: Thu, 24 Mar 2022 15:29:54 +0100
Message-Id: <dca358bb02e40e104957e70552c50c37a68c9c80.1648131740.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648131740.git.christophe.leroy@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648132151; l=1631; s=20211009;
 h=from:subject:message-id; bh=OWDdhcCtR60EJOCWc6cwIHh4xDhD5orD3drnjJOkPJg=;
 b=R5nyRGuj8ht2rQYbKC52j94uH0d5CMW8dnEJ87IEaRoi9cSUhWquC0kV0SAWhQU9ot7ixbEx9b23
 Fwd0ds1VBxTIp443RcLjfbRk7zgWHz50EoIM86V1Jtbw5mTgHJpo
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use is_offset_in_branch_range() instead of create_branch()
to check if a target is within branch range.

This patch together with the previous one improves
ftrace activation time by 7%

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 3ce3697e8a7c..41c45b9c7f39 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -89,11 +89,9 @@ ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_t new)
  */
 static int test_24bit_addr(unsigned long ip, unsigned long addr)
 {
-	ppc_inst_t op;
 	addr = ppc_function_entry((void *)addr);
 
-	/* use the create_branch to verify that this offset can be branched */
-	return create_branch(&op, (u32 *)ip, addr, 0) == 0;
+	return is_offset_in_branch_range(addr - ip);
 }
 
 static int is_bl_op(ppc_inst_t op)
@@ -261,7 +259,6 @@ __ftrace_make_nop(struct module *mod,
 static unsigned long find_ftrace_tramp(unsigned long ip)
 {
 	int i;
-	ppc_inst_t instr;
 
 	/*
 	 * We have the compiler generated long_branch tramps at the end
@@ -270,8 +267,7 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 	for (i = NUM_FTRACE_TRAMPS - 1; i >= 0; i--)
 		if (!ftrace_tramps[i])
 			continue;
-		else if (create_branch(&instr, (void *)ip,
-				       ftrace_tramps[i], 0) == 0)
+		else if (is_offset_in_branch_range(ftrace_tramps[i] - ip))
 			return ftrace_tramps[i];
 
 	return 0;
-- 
2.35.1

