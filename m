Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 506BB51F3FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 07:42:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxVSS1wggz3fcB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 15:42:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxVLX5hTcz3chY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 15:37:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KxVKY0Cfpz9sVq;
 Mon,  9 May 2022 07:36:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmN4D4BYOimX; Mon,  9 May 2022 07:36:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF5xcbz9sW1;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C3D508B763;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id widlIQcjDZqV; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E09C8B796;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aS2O1591211
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 9 May 2022 07:36:28 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aRLp1591209;
 Mon, 9 May 2022 07:36:27 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v3 01/25] powerpc/ftrace: Refactor prepare_ftrace_return()
Date: Mon,  9 May 2022 07:35:59 +0200
Message-Id: <0d42deafe353980c66cf19d3132638c05ba9f4a9.1652074503.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652074581; l=1899; s=20211009;
 h=from:subject:message-id; bh=zXRjPYU7QaID1rculDvXRerDW2vtk7P4KyqgYPe84dw=;
 b=o1G0sYC8erkJqZcmp7GkD0pST9lh2bvwHstrjnoDn3xdXwNCXy2S3uRTP1fhToxjlMs0JGWHMdDc
 Oz314hUEAXYYDKAiHwHWKPvo68IJM2f/GXaJeTSb2vV7fHgtX/dp
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

When we have CONFIG_DYNAMIC_FTRACE_WITH_ARGS,
prepare_ftrace_return() is called by ftrace_graph_func()
otherwise prepare_ftrace_return() is called from assembly.

Refactor prepare_ftrace_return() into a static
__prepare_ftrace_return() that will be called by both
prepare_ftrace_return() and ftrace_graph_func().

It will allow GCC to fold __prepare_ftrace_return() inside
ftrace_graph_func().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 4ee04aacf9f1..7a266fd469b7 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -939,8 +939,8 @@ int ftrace_disable_ftrace_graph_caller(void)
  * Hook the return address and push it in the stack of return addrs
  * in current thread info. Return the address we want to divert to.
  */
-unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
-						unsigned long sp)
+static unsigned long
+__prepare_ftrace_return(unsigned long parent, unsigned long ip, unsigned long sp)
 {
 	unsigned long return_hooker;
 	int bit;
@@ -969,7 +969,13 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 		       struct ftrace_ops *op, struct ftrace_regs *fregs)
 {
-	fregs->regs.link = prepare_ftrace_return(parent_ip, ip, fregs->regs.gpr[1]);
+	fregs->regs.link = __prepare_ftrace_return(parent_ip, ip, fregs->regs.gpr[1]);
+}
+#else
+unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
+				    unsigned long sp)
+{
+	return __prepare_ftrace_return(parent, ip, sp);
 }
 #endif
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
-- 
2.35.1

