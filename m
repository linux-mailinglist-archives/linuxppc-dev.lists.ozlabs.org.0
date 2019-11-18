Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E8100803
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 16:18:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gszn36jszDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 02:18:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=5krg=zk=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GsxY5nLBzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 02:16:49 +1100 (AEDT)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 129452071B;
 Mon, 18 Nov 2019 15:16:47 +0000 (UTC)
Date: Mon, 18 Nov 2019 10:16:45 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: powerpc ftrace broken due to "manual merge of the ftrace tree
 with the arm64 tree"
Message-ID: <20191118101645.2f68c521@oasis.local.home>
In-Reply-To: <20191118095842.546b38d8@oasis.local.home>
References: <1573849732.5937.136.camel@lca.pw>
 <20191115160230.78871d8f@gandalf.local.home>
 <1573851994.5937.138.camel@lca.pw>
 <20191118095104.0daebbc3@oasis.local.home>
 <20191118095842.546b38d8@oasis.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 Nov 2019 09:58:42 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 18 Nov 2019 09:51:04 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > > > Test this commit please: b83b43ffc6e4b514ca034a0fbdee01322e2f7022      
> > > 
> > > # git reset --hard b83b43ffc6e4b514ca034a0fbdee01322e2f7022
> > > 
> > > Yes, that one is bad.    
> > 
> > Can you see if this patch fixes the issue for you?  
> 
> Don't bother. This isn't the right fix, I know see the real issue.
> 
> New fix coming shortly.
> 

Can you try this?

It appears that I picked a name "ftrace_graph_stub", that was already in
use by powerpc. This just renames the function stub I used.

-- Steve

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 0f358be551cd..996db32c491b 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -112,7 +112,7 @@
 #ifdef CONFIG_FTRACE_MCOUNT_RECORD
 #ifdef CC_USING_PATCHABLE_FUNCTION_ENTRY
 /*
- * Need to also make ftrace_graph_stub point to ftrace_stub
+ * Need to also make ftrace_stub_graph point to ftrace_stub
  * so that the same stub location may have different protocols
  * and not mess up with C verifiers.
  */
@@ -120,17 +120,17 @@
 			__start_mcount_loc = .;			\
 			KEEP(*(__patchable_function_entries))	\
 			__stop_mcount_loc = .;			\
-			ftrace_graph_stub = ftrace_stub;
+			ftrace_stub_graph = ftrace_stub;
 #else
 #define MCOUNT_REC()	. = ALIGN(8);				\
 			__start_mcount_loc = .;			\
 			KEEP(*(__mcount_loc))			\
 			__stop_mcount_loc = .;			\
-			ftrace_graph_stub = ftrace_stub;
+			ftrace_stub_graph = ftrace_stub;
 #endif
 #else
 # ifdef CONFIG_FUNCTION_TRACER
-#  define MCOUNT_REC()	ftrace_graph_stub = ftrace_stub;
+#  define MCOUNT_REC()	ftrace_stub_graph = ftrace_stub;
 # else
 #  define MCOUNT_REC()
 # endif
diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index fa3ce10d0405..67e0c462b059 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -336,10 +336,10 @@ int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace)
  * Simply points to ftrace_stub, but with the proper protocol.
  * Defined by the linker script in linux/vmlinux.lds.h
  */
-extern void ftrace_graph_stub(struct ftrace_graph_ret *);
+extern void ftrace_stub_graph(struct ftrace_graph_ret *);
 
 /* The callbacks that hook a function */
-trace_func_graph_ret_t ftrace_graph_return = ftrace_graph_stub;
+trace_func_graph_ret_t ftrace_graph_return = ftrace_stub_graph;
 trace_func_graph_ent_t ftrace_graph_entry = ftrace_graph_entry_stub;
 static trace_func_graph_ent_t __ftrace_graph_entry = ftrace_graph_entry_stub;
 
@@ -619,7 +619,7 @@ void unregister_ftrace_graph(struct fgraph_ops *gops)
 		goto out;
 
 	ftrace_graph_active--;
-	ftrace_graph_return = ftrace_graph_stub;
+	ftrace_graph_return = ftrace_stub_graph;
 	ftrace_graph_entry = ftrace_graph_entry_stub;
 	__ftrace_graph_entry = ftrace_graph_entry_stub;
 	ftrace_shutdown(&graph_ops, FTRACE_STOP_FUNC_RET);
