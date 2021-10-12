Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D38A3429D6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 08:03:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT4pP2vmRz2yfk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 17:03:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130;
 helo=out30-130.freemail.mail.aliyun.com;
 envelope-from=yun.wang@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 60 seconds by postgrey-1.36 at boromir;
 Tue, 12 Oct 2021 16:40:27 AEDT
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT4JC2zv4z2xvc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 16:40:27 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrXxytR_1634017208; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrXxytR_1634017208) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 12 Oct 2021 13:40:09 +0800
Subject: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
To: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
Message-ID: <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
Date: Tue, 12 Oct 2021 13:40:08 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 12 Oct 2021 17:02:48 +1100
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

As the documentation explained, ftrace_test_recursion_trylock()
and ftrace_test_recursion_unlock() were supposed to disable and
enable preemption properly, however currently this work is done
outside of the function, which could be missing by mistake.

This path will make sure the preemption will be disabled when
trylock() succeed, and the unlock() will enable preemption when
the the testing of recursion are finished.

Reported-by: Abaci <abaci@linux.alibaba.com>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Michael Wang <yun.wang@linux.alibaba.com>
---
 arch/csky/kernel/probes/ftrace.c     |  2 --
 arch/parisc/kernel/ftrace.c          |  2 --
 arch/powerpc/kernel/kprobes-ftrace.c |  2 --
 arch/riscv/kernel/probes/ftrace.c    |  2 --
 arch/x86/kernel/kprobes/ftrace.c     |  2 --
 include/linux/trace_recursion.h      | 10 +++++++++-
 kernel/livepatch/patch.c             |  6 ------
 kernel/trace/trace_functions.c       |  5 -----
 8 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
index ef2bb9b..dff7921 100644
--- a/arch/csky/kernel/probes/ftrace.c
+++ b/arch/csky/kernel/probes/ftrace.c
@@ -24,7 +24,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		return;

 	regs = ftrace_get_regs(fregs);
-	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)ip);
 	if (!p) {
 		p = get_kprobe((kprobe_opcode_t *)(ip - MCOUNT_INSN_SIZE));
@@ -64,7 +63,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		__this_cpu_write(current_kprobe, NULL);
 	}
 out:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 0a1e75a..3543496 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -216,7 +216,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		return;

 	regs = ftrace_get_regs(fregs);
-	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)ip);
 	if (unlikely(!p) || kprobe_disabled(p))
 		goto out;
@@ -245,7 +244,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	}
 	__this_cpu_write(current_kprobe, NULL);
 out:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
index 7154d58..072ebe7 100644
--- a/arch/powerpc/kernel/kprobes-ftrace.c
+++ b/arch/powerpc/kernel/kprobes-ftrace.c
@@ -26,7 +26,6 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 		return;

 	regs = ftrace_get_regs(fregs);
-	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)nip);
 	if (unlikely(!p) || kprobe_disabled(p))
 		goto out;
@@ -61,7 +60,6 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 		__this_cpu_write(current_kprobe, NULL);
 	}
 out:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
index aab85a8..7142ec4 100644
--- a/arch/riscv/kernel/probes/ftrace.c
+++ b/arch/riscv/kernel/probes/ftrace.c
@@ -15,7 +15,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	if (bit < 0)
 		return;

-	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)ip);
 	if (unlikely(!p) || kprobe_disabled(p))
 		goto out;
@@ -52,7 +51,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		__this_cpu_write(current_kprobe, NULL);
 	}
 out:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
index 596de2f..dd2ec14 100644
--- a/arch/x86/kernel/kprobes/ftrace.c
+++ b/arch/x86/kernel/kprobes/ftrace.c
@@ -25,7 +25,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	if (bit < 0)
 		return;

-	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)ip);
 	if (unlikely(!p) || kprobe_disabled(p))
 		goto out;
@@ -59,7 +58,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		__this_cpu_write(current_kprobe, NULL);
 	}
 out:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index a9f9c57..805f9c4 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -214,7 +214,14 @@ static __always_inline void trace_clear_recursion(int bit)
 static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
 							 unsigned long parent_ip)
 {
-	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
+	int bit;
+
+	preempt_disable_notrace();
+	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
+	if (bit < 0)
+		preempt_enable_notrace();
+
+	return bit;
 }

 /**
@@ -226,6 +233,7 @@ static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
 static __always_inline void ftrace_test_recursion_unlock(int bit)
 {
 	trace_clear_recursion(bit);
+	preempt_enable_notrace();
 }

 #endif /* CONFIG_TRACING */
diff --git a/kernel/livepatch/patch.c b/kernel/livepatch/patch.c
index e8029ae..6e66ccd 100644
--- a/kernel/livepatch/patch.c
+++ b/kernel/livepatch/patch.c
@@ -52,11 +52,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (WARN_ON_ONCE(bit < 0))
 		return;
-	/*
-	 * A variant of synchronize_rcu() is used to allow patching functions
-	 * where RCU is not watching, see klp_synchronize_transition().
-	 */
-	preempt_disable_notrace();

 	func = list_first_or_null_rcu(&ops->func_stack, struct klp_func,
 				      stack_node);
@@ -120,7 +115,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
 	klp_arch_set_pc(fregs, (unsigned long)func->new_func);

 unlock:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }

diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
index 1f0e63f..9f1bfbe 100644
--- a/kernel/trace/trace_functions.c
+++ b/kernel/trace/trace_functions.c
@@ -186,7 +186,6 @@ static void function_trace_start(struct trace_array *tr)
 		return;

 	trace_ctx = tracing_gen_ctx();
-	preempt_disable_notrace();

 	cpu = smp_processor_id();
 	data = per_cpu_ptr(tr->array_buffer.data, cpu);
@@ -194,7 +193,6 @@ static void function_trace_start(struct trace_array *tr)
 		trace_function(tr, ip, parent_ip, trace_ctx);

 	ftrace_test_recursion_unlock(bit);
-	preempt_enable_notrace();
 }

 #ifdef CONFIG_UNWINDER_ORC
@@ -298,8 +296,6 @@ static inline void process_repeats(struct trace_array *tr,
 	if (bit < 0)
 		return;

-	preempt_disable_notrace();
-
 	cpu = smp_processor_id();
 	data = per_cpu_ptr(tr->array_buffer.data, cpu);
 	if (atomic_read(&data->disabled))
@@ -324,7 +320,6 @@ static inline void process_repeats(struct trace_array *tr,

 out:
 	ftrace_test_recursion_unlock(bit);
-	preempt_enable_notrace();
 }

 static void
-- 
1.8.3.1


