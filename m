Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C23902F06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 05:18:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vyv4w4kRWz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 13:18:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=hook=nn=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vyv472JSpz30Sx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 13:17:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 04C0ACE1905;
	Tue, 11 Jun 2024 03:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7E5C4AF1C;
	Tue, 11 Jun 2024 03:17:23 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.97)
	(envelope-from <rostedt@goodmis.org>)
	id 1sGs0w-00000001JhD-0WrV;
	Mon, 10 Jun 2024 23:17:38 -0400
Message-ID: <20240611031737.982047614@goodmis.org>
User-Agent: quilt/0.68
Date: Mon, 10 Jun 2024 23:09:36 -0400
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
Subject: [PATCH 2/2] function_graph: Everyone uses HAVE_FUNCTION_GRAPH_RET_ADDR_PTR,
 remove it
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Borislav Petkov <bp@alien8.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

All architectures that implement function graph also implements
HAVE_FUNCTION_GRAPH_RET_ADDR_PTR. Remove it, as it is no longer a
differentiator.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 Documentation/trace/ftrace-design.rst | 12 ---------
 arch/arm64/include/asm/ftrace.h       | 11 ---------
 arch/csky/include/asm/ftrace.h        |  2 --
 arch/loongarch/include/asm/ftrace.h   |  1 -
 arch/powerpc/include/asm/ftrace.h     |  2 --
 arch/riscv/include/asm/ftrace.h       |  1 -
 arch/s390/include/asm/ftrace.h        |  1 -
 arch/x86/include/asm/ftrace.h         |  2 --
 include/linux/ftrace.h                |  2 --
 kernel/trace/fgraph.c                 | 35 +--------------------------
 10 files changed, 1 insertion(+), 68 deletions(-)

diff --git a/Documentation/trace/ftrace-design.rst b/Documentation/trace/ftrace-design.rst
index 6893399157f0..dc82d64b3a44 100644
--- a/Documentation/trace/ftrace-design.rst
+++ b/Documentation/trace/ftrace-design.rst
@@ -217,18 +217,6 @@ along to ftrace_push_return_trace() instead of a stub value of 0.
 
 Similarly, when you call ftrace_return_to_handler(), pass it the frame pointer.
 
-HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
---------------------------------
-
-An arch may pass in a pointer to the return address on the stack.  This
-prevents potential stack unwinding issues where the unwinder gets out of
-sync with ret_stack and the wrong addresses are reported by
-ftrace_graph_ret_addr().
-
-Adding support for it is easy: just define the macro in asm/ftrace.h and
-pass the return address pointer as the 'retp' argument to
-ftrace_push_return_trace().
-
 HAVE_SYSCALL_TRACEPOINTS
 ------------------------
 
diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index ab158196480c..dc9cf0bd2a4c 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -12,17 +12,6 @@
 
 #define HAVE_FUNCTION_GRAPH_FP_TEST
 
-/*
- * HAVE_FUNCTION_GRAPH_RET_ADDR_PTR means that the architecture can provide a
- * "return address pointer" which can be used to uniquely identify a return
- * address which has been overwritten.
- *
- * On arm64 we use the address of the caller's frame record, which remains the
- * same for the lifetime of the instrumented function, unlike the return
- * address in the LR.
- */
-#define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
-
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
 #define ARCH_SUPPORTS_FTRACE_OPS 1
 #else
diff --git a/arch/csky/include/asm/ftrace.h b/arch/csky/include/asm/ftrace.h
index fd215c38ef27..00f9f7647e3f 100644
--- a/arch/csky/include/asm/ftrace.h
+++ b/arch/csky/include/asm/ftrace.h
@@ -7,8 +7,6 @@
 
 #define HAVE_FUNCTION_GRAPH_FP_TEST
 
-#define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
-
 #define ARCH_SUPPORTS_FTRACE_OPS 1
 
 #define MCOUNT_ADDR	((unsigned long)_mcount)
diff --git a/arch/loongarch/include/asm/ftrace.h b/arch/loongarch/include/asm/ftrace.h
index de891c2c83d4..c0a682808e07 100644
--- a/arch/loongarch/include/asm/ftrace.h
+++ b/arch/loongarch/include/asm/ftrace.h
@@ -28,7 +28,6 @@ struct dyn_ftrace;
 struct dyn_arch_ftrace { };
 
 #define ARCH_SUPPORTS_FTRACE_OPS 1
-#define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 
 #define ftrace_init_nop ftrace_init_nop
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 107fc5a48456..559560286e6d 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -8,8 +8,6 @@
 #define MCOUNT_ADDR		((unsigned long)(_mcount))
 #define MCOUNT_INSN_SIZE	4 /* sizeof mcount call */
 
-#define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
-
 /* Ignore unused weak functions which will have larger offsets */
 #if defined(CONFIG_MPROFILE_KERNEL) || defined(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)
 #define FTRACE_MCOUNT_MAX_OFFSET	16
diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 9eb31a7ea0aa..2cddd79ff21b 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -11,7 +11,6 @@
 #if defined(CONFIG_FUNCTION_GRAPH_TRACER) && defined(CONFIG_FRAME_POINTER)
 #define HAVE_FUNCTION_GRAPH_FP_TEST
 #endif
-#define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 
 #define ARCH_SUPPORTS_FTRACE_OPS 1
 #ifndef __ASSEMBLY__
diff --git a/arch/s390/include/asm/ftrace.h b/arch/s390/include/asm/ftrace.h
index 77e479d44f1e..fbadca645af7 100644
--- a/arch/s390/include/asm/ftrace.h
+++ b/arch/s390/include/asm/ftrace.h
@@ -2,7 +2,6 @@
 #ifndef _ASM_S390_FTRACE_H
 #define _ASM_S390_FTRACE_H
 
-#define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 #define ARCH_SUPPORTS_FTRACE_OPS 1
 #define MCOUNT_INSN_SIZE	6
 
diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
index 897cf02c20b1..0152a81d9b4a 100644
--- a/arch/x86/include/asm/ftrace.h
+++ b/arch/x86/include/asm/ftrace.h
@@ -20,8 +20,6 @@
 #define ARCH_SUPPORTS_FTRACE_OPS 1
 #endif
 
-#define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
-
 #ifndef __ASSEMBLY__
 extern void __fentry__(void);
 
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 4135dc171447..845c2ab0bc1c 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -1071,9 +1071,7 @@ struct ftrace_ret_stack {
 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 	unsigned long fp;
 #endif
-#ifdef HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 	unsigned long *retp;
-#endif
 };
 
 /*
diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 91f1eef256af..8317d1a7f43a 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -593,9 +593,7 @@ ftrace_push_return_trace(unsigned long ret, unsigned long func,
 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 	ret_stack->fp = frame_pointer;
 #endif
-#ifdef HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 	ret_stack->retp = retp;
-#endif
 	return offset;
 }
 
@@ -887,10 +885,8 @@ ftrace_graph_get_ret_stack(struct task_struct *task, int idx)
  * will be assigned that location so that if called again, it will continue
  * where it left off.
  *
- * @retp is a pointer to the return address on the stack.  It's ignored if
- * the arch doesn't have HAVE_FUNCTION_GRAPH_RET_ADDR_PTR defined.
+ * @retp is a pointer to the return address on the stack.
  */
-#ifdef HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 unsigned long ftrace_graph_ret_addr(struct task_struct *task, int *idx,
 				    unsigned long ret, unsigned long *retp)
 {
@@ -926,35 +922,6 @@ unsigned long ftrace_graph_ret_addr(struct task_struct *task, int *idx,
 
 	return ret;
 }
-#else /* !HAVE_FUNCTION_GRAPH_RET_ADDR_PTR */
-unsigned long ftrace_graph_ret_addr(struct task_struct *task, int *idx,
-				    unsigned long ret, unsigned long *retp)
-{
-	struct ftrace_ret_stack *ret_stack;
-	unsigned long return_handler = (unsigned long)dereference_kernel_function_descriptor(return_to_handler);
-	int offset = task->curr_ret_stack;
-	int i;
-
-	if (ret != return_handler)
-		return ret;
-
-	if (!idx)
-		return ret;
-
-	i = *idx;
-	do {
-		ret_stack = get_ret_stack(task, offset, &offset);
-		if (ret_stack && ret_stack->ret == return_handler)
-			continue;
-		i--;
-	} while (i >= 0 && ret_stack);
-
-	if (ret_stack)
-		return ret_stack->ret;
-
-	return ret;
-}
-#endif /* HAVE_FUNCTION_GRAPH_RET_ADDR_PTR */
 
 static struct ftrace_ops graph_ops = {
 	.func			= ftrace_graph_func,
-- 
2.43.0


