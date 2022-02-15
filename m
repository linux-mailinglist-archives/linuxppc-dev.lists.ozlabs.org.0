Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D85EE4B7462
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 19:32:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyqTD3FPNz3dcr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 05:32:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyqSN6y1Tz3bWj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 05:32:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JyqSC0spkz9sS8;
 Tue, 15 Feb 2022 19:31:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBL1cRfOBO0b; Tue, 15 Feb 2022 19:31:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JyqSB1RvHz9sS9;
 Tue, 15 Feb 2022 19:31:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1572A8B77D;
 Tue, 15 Feb 2022 19:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BPH8QzsaA4IC; Tue, 15 Feb 2022 19:31:54 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.174])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFE568B77A;
 Tue, 15 Feb 2022 19:31:53 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21FIVi7o146772
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 19:31:44 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21FIVihx146771;
 Tue, 15 Feb 2022 19:31:44 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 2/4] powerpc/ftrace: Add recursion protection in
 prepare_ftrace_return()
Date: Tue, 15 Feb 2022 19:31:23 +0100
Message-Id: <74edf2ff0a60e66b0d9225a137100a86a0557032.1644949750.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ff535e86d3a69376a6d89168511d4e403835f18b.1644949750.git.christophe.leroy@csgroup.eu>
References: <ff535e86d3a69376a6d89168511d4e403835f18b.1644949750.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1644949837; l=1454; s=20211009;
 h=from:subject:message-id; bh=xZYWjYWqiSAg8pwgNQX7t/kBFhRU9zZkBGIvI52V/4s=;
 b=hoACMMUc0kMQo/AciROzjGF96l3iIcRLywnffI+iD3rs2+WduVQB8T3Nl7EojuxAL+Z9/Eiu3ZT/
 12Rb7DtCAtnRYLbhYvL181l1plYLd51uQeT/qNFSkSKiv7up1H4a
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

The function_graph_enter() does not provide any recursion protection.

Add a protection in prepare_ftrace_return() in case
function_graph_enter() calls something that gets
function graph traced.

Reported-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Fixes: 830213786c49 ("powerpc/ftrace: directly call of function graph tracer by ftrace caller")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 74a176e394ef..f21b8fbd418e 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -944,6 +944,7 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 						unsigned long sp)
 {
 	unsigned long return_hooker;
+	int bit;
 
 	if (unlikely(ftrace_graph_is_dead()))
 		goto out;
@@ -951,10 +952,16 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 	if (unlikely(atomic_read(&current->tracing_graph_pause)))
 		goto out;
 
+	bit = ftrace_test_recursion_trylock(ip, parent);
+	if (bit < 0)
+		goto out;
+
 	return_hooker = ppc_function_entry(return_to_handler);
 
 	if (!function_graph_enter(parent, ip, 0, (unsigned long *)sp))
 		parent = return_hooker;
+
+	ftrace_test_recursion_unlock(bit);
 out:
 	return parent;
 }
-- 
2.34.1

