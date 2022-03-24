Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422644E616E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 11:02:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPLPV173Wz30Gx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 21:02:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPLP037TJz300Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 21:02:09 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KPLNr3WQ0z9sSS;
 Thu, 24 Mar 2022 11:02:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VxMrlxVlEZsa; Thu, 24 Mar 2022 11:02:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KPLNn4nzlz9sSc;
 Thu, 24 Mar 2022 11:02:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9296C8B77D;
 Thu, 24 Mar 2022 11:02:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BVx8rW-JRqBr; Thu, 24 Mar 2022 11:02:01 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.77])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 518D98B763;
 Thu, 24 Mar 2022 11:02:01 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22OA1pW01785564
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 11:01:51 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22OA1n8q1785563;
 Thu, 24 Mar 2022 11:01:49 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Subject: [PATCH v1] ftrace: Make ftrace_graph_is_dead() static inline
Date: Thu, 24 Mar 2022 11:01:45 +0100
Message-Id: <529ece004e0901ca04ea0e07d6bf8476612e2294.1648116004.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648116104; l=2446; s=20211009;
 h=from:subject:message-id; bh=ZlWlF/2Q8VhknjFakoPVJk36sDwoITMWV3dAmu3iVtU=;
 b=cG6UsY2SXO/IhxVjRv7/ZL6p25PW/o+QGZA5PHl9a+OZ/FpaM/ESkoBYxYzCa4hE+wOS0W+HidsS
 G8CENNBSDoAs+bzS90qKmOvikCYpPkXJqXtwqjTj5DaTzRxWd2Iu
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

ftrace_graph_is_dead() is used on hot paths, it just reads a variable
in memory and is not worth suffering function call constraints.

For instance, at entry of prepare_ftrace_return(), inlining it avoids
saving prepare_ftrace_return() parameters to stack and restoring them
after calling ftrace_graph_is_dead().

The performance improvement is noticeable.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/ftrace.h | 15 ++++++++++++++-
 kernel/trace/fgraph.c  | 14 +-------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 9999e29187de..cecdda515059 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -1006,7 +1006,20 @@ unsigned long ftrace_graph_ret_addr(struct task_struct *task, int *idx,
 extern int register_ftrace_graph(struct fgraph_ops *ops);
 extern void unregister_ftrace_graph(struct fgraph_ops *ops);
 
-extern bool ftrace_graph_is_dead(void);
+/**
+ * ftrace_graph_is_dead - returns true if ftrace_graph_stop() was called
+ *
+ * ftrace_graph_stop() is called when a severe error is detected in
+ * the function graph tracing. This function is called by the critical
+ * paths of function graph to keep those paths from doing any more harm.
+ */
+extern bool kill_ftrace_graph;
+
+static inline bool ftrace_graph_is_dead(void)
+{
+	return kill_ftrace_graph;
+}
+
 extern void ftrace_graph_stop(void);
 
 /* The current handlers in use */
diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 22061d38fc00..3961f5884063 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -23,24 +23,12 @@
 #define ASSIGN_OPS_HASH(opsname, val)
 #endif
 
-static bool kill_ftrace_graph;
+bool kill_ftrace_graph;
 int ftrace_graph_active;
 
 /* Both enabled by default (can be cleared by function_graph tracer flags */
 static bool fgraph_sleep_time = true;
 
-/**
- * ftrace_graph_is_dead - returns true if ftrace_graph_stop() was called
- *
- * ftrace_graph_stop() is called when a severe error is detected in
- * the function graph tracing. This function is called by the critical
- * paths of function graph to keep those paths from doing any more harm.
- */
-bool ftrace_graph_is_dead(void)
-{
-	return kill_ftrace_graph;
-}
-
 /**
  * ftrace_graph_stop - set to permanently disable function graph tracing
  *
-- 
2.35.1

