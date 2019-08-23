Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E19AF88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 14:31:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FLPH455mzDrqC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 22:31:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FLLC23yczDrQl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 22:29:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46FLLB6F8Cz9s7T; Fri, 23 Aug 2019 22:29:06 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46FLLB5djwz9sN6; Fri, 23 Aug 2019 22:29:06 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/64: Fix stacktrace on BE when function_graph is
 enabled
Date: Fri, 23 Aug 2019 22:29:01 +1000
Message-Id: <20190823122901.32667-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently if we oops or warn while function_graph is active the stack
trace looks like:
  .trace_graph_return+0xac/0x100
  .ftrace_return_to_handler+0x98/0x140
  .return_to_handler+0x20/0x40
  .return_to_handler+0x0/0x40
  .return_to_handler+0x0/0x40
  .return_to_handler+0x0/0x40
  .return_to_handler+0x0/0x40
  .return_to_handler+0x0/0x40
  .return_to_handler+0x0/0x40
  .cpu_startup_entry+0x34/0x40
  .start_secondary+0x680/0x6f0
  start_secondary_prolog+0x10/0x14

Notice the multiple entries that just show .return_to_handler.

There is logic in show_stack() to detect this case and print the
traced function, but we inadvertently broke it in commit
7d56c65a6ff9 ("powerpc/ftrace: Remove mod_return_to_handler") (2014),
because that commit accidentally removed the dereference of rth which
gets the text address from the function descriptor. Hence this is only
broken on big endian (or technically ELFv1).

Fix it by using the proper accessor, which is ppc_function_entry().
Result is we get a stack trace such as:

  .trace_graph_return+0x134/0x160
  .ftrace_return_to_handler+0x94/0x140
  .return_to_handler+0x20/0x40
  .return_to_handler+0x0/0x40 (.shared_cede_loop+0x48/0x130)
  .return_to_handler+0x0/0x40 (.cpuidle_enter_state+0xa0/0x690)
  .return_to_handler+0x0/0x40 (.cpuidle_enter+0x44/0x70)
  .return_to_handler+0x0/0x40 (.call_cpuidle+0x68/0xc0)
  .return_to_handler+0x0/0x40 (.do_idle+0x37c/0x400)
  .return_to_handler+0x0/0x40 (.cpu_startup_entry+0x30/0x50)
  .rest_init+0x224/0x348

Fixes: 7d56c65a6ff9 ("powerpc/ftrace: Remove mod_return_to_handler")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8fc4de0d22b4..1601d7cfe45e 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2048,7 +2048,7 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	struct ftrace_ret_stack *ret_stack;
 	extern void return_to_handler(void);
-	unsigned long rth = (unsigned long)return_to_handler;
+	unsigned long rth = ppc_function_entry(return_to_handler);
 	int curr_frame = 0;
 #endif
 
-- 
2.21.0

