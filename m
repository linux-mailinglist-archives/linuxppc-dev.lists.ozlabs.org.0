Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AECC902F03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 05:17:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vyv4W1DXzz3cV5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 13:17:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=hook=nn=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vyv461Qk6z30Sx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 13:17:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F30660C23;
	Tue, 11 Jun 2024 03:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B51C2BBFC;
	Tue, 11 Jun 2024 03:17:23 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.97)
	(envelope-from <rostedt@goodmis.org>)
	id 1sGs0v-00000001Jgi-42JD;
	Mon, 10 Jun 2024 23:17:37 -0400
Message-ID: <20240611031737.821995106@goodmis.org>
User-Agent: quilt/0.68
Date: Mon, 10 Jun 2024 23:09:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: [PATCH 1/2] function_graph: Fix up ftrace_graph_ret_addr()
References: <20240611030934.162955582@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Yang Li <yang.lee@linux.alibaba.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Borislav Petkov <bp@alien8.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Yang Li sent a patch to fix the kerneldoc of ftrace_graph_ret_addr().
While reviewing it, I realized that the comments in the entire function
header needed a rewrite. When doing that, I realized that @idx parameter
was being ignored. Every time this was called by the unwinder, it would
start the loop at the top of the shadow stack and look for the matching
stack pointer. When it found it, it would return it. When the unwinder
asked for the next function, it would search from the beginning again.

In reality, it should start from where it left off. That was the reason
for the @idx parameter in the first place. The first time the unwinder
calls this function, the @idx pointer would contain zero. That would mean
to start from the top of the stack. The function was supposed to update
the @idx with the index where it found the return address, so that the
next time the unwinder calls this function it doesn't have to search
through the previous addresses it found (making it O(n^2)!).

This speeds up the unwinder's use of ftrace_graph_ret_addr() by an order
of magnitude.

Link: https://lore.kernel.org/linux-trace-kernel/20240610181746.656e3759@gandalf.local.home/

Reported-by: Yang Li <yang.lee@linux.alibaba.com>
Fixes: 7aa1eaef9f428 ("function_graph: Allow multiple users to attach to function graph")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/fgraph.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 63d0c2f84ce1..91f1eef256af 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -870,18 +870,24 @@ ftrace_graph_get_ret_stack(struct task_struct *task, int idx)
 }
 
 /**
- * ftrace_graph_ret_addr - convert a potentially modified stack return address
- *			   to its original value
+ * ftrace_graph_ret_addr - return the original value of the return address
+ * @task: The task the unwinder is being executed on
+ * @idx: An initialized pointer to the next stack index to use
+ * @ret: The current return address (likely pointing to return_handler)
+ * @retp: The address on the stack of the current return location
  *
  * This function can be called by stack unwinding code to convert a found stack
- * return address ('ret') to its original value, in case the function graph
+ * return address (@ret) to its original value, in case the function graph
  * tracer has modified it to be 'return_to_handler'.  If the address hasn't
- * been modified, the unchanged value of 'ret' is returned.
+ * been modified, the unchanged value of @ret is returned.
  *
- * 'idx' is a state variable which should be initialized by the caller to zero
- * before the first call.
+ * @idx holds the last index used to know where to start from. It should be
+ * initialized to zero for the first iteration as that will mean to start
+ * at the top of the shadow stack. If the location is found, this pointer
+ * will be assigned that location so that if called again, it will continue
+ * where it left off.
  *
- * 'retp' is a pointer to the return address on the stack.  It's ignored if
+ * @retp is a pointer to the return address on the stack.  It's ignored if
  * the arch doesn't have HAVE_FUNCTION_GRAPH_RET_ADDR_PTR defined.
  */
 #ifdef HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
@@ -895,6 +901,10 @@ unsigned long ftrace_graph_ret_addr(struct task_struct *task, int *idx,
 	if (ret != return_handler)
 		return ret;
 
+	if (!idx)
+		return ret;
+
+	i = *idx ? : task->curr_ret_stack;
 	while (i > 0) {
 		ret_stack = get_ret_stack(current, i, &i);
 		if (!ret_stack)
@@ -908,8 +918,10 @@ unsigned long ftrace_graph_ret_addr(struct task_struct *task, int *idx,
 		 * Thus we will continue to find real return address.
 		 */
 		if (ret_stack->retp == retp &&
-		    ret_stack->ret != return_handler)
+		    ret_stack->ret != return_handler) {
+			*idx = i;
 			return ret_stack->ret;
+		}
 	}
 
 	return ret;
-- 
2.43.0


