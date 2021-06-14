Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 722DA3A6647
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 14:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3Vck0ryCz309N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 22:09:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=nzArecrR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=nzArecrR; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3VcF36STz2xZm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 22:09:16 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id l184so8450439pgd.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qAHvMQfZr2aPDxGZrWGMnkryTv3iza4sU9JvuXfV5xE=;
 b=nzArecrR/ZolTpQ1D3E2uwGlPm95pLtdc84tR3qnNbBARekChG1Vp5mwLwfflaOCkD
 JFG+PDB0Ts/0+ESqAxnErlWe3ZNWd5/++sLvEZWlLXLqi+66xjDq9K8/le2SvpLBBR2Z
 ZuqkzO36EJhRXsusyJ4wpfx6dS+yEu70lX6Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qAHvMQfZr2aPDxGZrWGMnkryTv3iza4sU9JvuXfV5xE=;
 b=rGkWnDCOKag/V0lgdjTJYURT1HxfJ37Hpt+ji4xOlBCiDnr6Yi1vnylDxyG9Q63qpo
 teBYXfCNuaDk69M5EAGblpXdOh11fw5HFK1DHfmjFO3LdHzTJjnC991GRDtQPr0pnRpT
 5X7+R55xQDL594G4K/PxZz1yIAXUf2rpF0f78ck9gmQF3gpoClTo06NuLMrC908MKXKT
 S1dtx+sbk+auFh8k2rfB3Cs49VE8E+0Qomrs7TShfCCVTMt1Hhl0n6IYHPUxZpMaEBAX
 hGxswi6WWIIkQ6n9g9kk782iQpcdginEg3oTI2+EYUXcJGFa5o5ewqFu+lqVxisL8j9t
 Imxg==
X-Gm-Message-State: AOAM532977sOODbswxvyTPNraANoyyCv/ZoWu3XOx6iS/FQ+QjNIayyX
 fY0bw7mXEDMOOa63Rr12PzcXlbRu2SAGhQ==
X-Google-Smtp-Source: ABdhPJxjoMV/i+6IeZePorQNFX63V3KBJXBU+59BG6cKPAuomXXvkvu1YkDgIh7FsU1oR0WiN5xkZg==
X-Received: by 2002:a63:3603:: with SMTP id d3mr16694918pga.346.1623672553329; 
 Mon, 14 Jun 2021 05:09:13 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id l201sm12593718pfd.183.2021.06.14.05.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 05:09:12 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc: make stack walking KASAN-safe
Date: Mon, 14 Jun 2021 22:09:07 +1000
Message-Id: <20210614120907.1952321-1-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make our stack-walking code KASAN-safe by using __no_sanitize_address.
Generic code, arm64, s390 and x86 all make accesses unchecked for similar
sorts of reasons: when unwinding a stack, we might touch memory that KASAN
has marked as being out-of-bounds. In ppc64 KASAN development, I hit this
sometimes when checking for an exception frame - because we're checking
an arbitrary offset into the stack frame.

See commit 20955746320e ("s390/kasan: avoid false positives during stack
unwind"), commit bcaf669b4bdb ("arm64: disable kasan when accessing
frame->fp in unwind_frame"), commit 91e08ab0c851 ("x86/dumpstack:
Prevent KASAN false positive warnings") and commit 6e22c8366416
("tracing, kasan: Silence Kasan warning in check_stack of stack_tracer").

Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>

---

v2: Use __no_sanitize_address, thanks Naveen
---
 arch/powerpc/kernel/process.c    | 5 +++--
 arch/powerpc/kernel/stacktrace.c | 8 ++++----
 arch/powerpc/perf/callchain.c    | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 89e34aa273e2..3464064a0b8b 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2121,8 +2121,9 @@ unsigned long get_wchan(struct task_struct *p)
 
 static int kstack_depth_to_print = CONFIG_PRINT_STACK_DEPTH;
 
-void show_stack(struct task_struct *tsk, unsigned long *stack,
-		const char *loglvl)
+void __no_sanitize_address show_stack(struct task_struct *tsk,
+				      unsigned long *stack,
+				      const char *loglvl)
 {
 	unsigned long sp, ip, lr, newsp;
 	int count = 0;
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 1deb1bf331dd..1961e6d5e33b 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -23,8 +23,8 @@
 
 #include <asm/paca.h>
 
-void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
-		     struct task_struct *task, struct pt_regs *regs)
+void __no_sanitize_address arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
+					   struct task_struct *task, struct pt_regs *regs)
 {
 	unsigned long sp;
 
@@ -61,8 +61,8 @@ void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
  *
  * If the task is not 'current', the caller *must* ensure the task is inactive.
  */
-int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
-			     void *cookie, struct task_struct *task)
+int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
+						   void *cookie, struct task_struct *task)
 {
 	unsigned long sp;
 	unsigned long newsp;
diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 6c028ee513c0..082f6d0308a4 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -40,7 +40,7 @@ static int valid_next_sp(unsigned long sp, unsigned long prev_sp)
 	return 0;
 }
 
-void
+void __no_sanitize_address
 perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
 	unsigned long sp, next_sp;
-- 
2.27.0

