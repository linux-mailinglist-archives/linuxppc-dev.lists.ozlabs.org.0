Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B97861301A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:03:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12f2006Sz3f3S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:03:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HXQseJEr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HXQseJEr;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12S04jvmz3cCZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:12 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id y13so9798385pfp.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mw6OJKd2lcdMmF5UuydK2s0XiUQAnr8szlW7P0LtaZc=;
        b=HXQseJEr4hUHr0PeEp6aoDnlFazPSNe+tcYzqRlAvVT14pzBPvxbRu1bqVIqA2ln/e
         q7Vt4VmZlWlt7DmN4Kk/GLQFNzh3cLCojd0tP+z7YBMY0KEeaS1D5pn/AcPYtC1wXAei
         8XiG6o9blg+J2fXz7DAsRmqeu3x+1a6VzI08CXpS2AWWCA93HyX7NdIdTRI3HT4M01OJ
         u3xFee6r7vVybm51+A4r7jX8ktsuNdtVqfIfZrByIh6DcBAhZPmpuapi67lsxE3JEbE+
         XSTx0SyajJxadw1mSE1JVQ0YPp2udhOL/tXX1k8wKawXOrrj9ZVsinnrBMz0mUPyo9Pa
         8gYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mw6OJKd2lcdMmF5UuydK2s0XiUQAnr8szlW7P0LtaZc=;
        b=yyzCEIVXd6r0/mwAicx7qiiTDqk5WsynVvzKFFzUjDdqAM5Fc1Q0fILkPx0SfXnJr8
         YycBTPnMnSCFacfTB9T2KAk/vBX6gsmP38GBogPfNjtv4FxdkMEDWKBm4hQgi3hi2th2
         wBzbYwocXcpvWbE2ts2zp5ebpFcLIGQhy0MQrVe0QLrQmRjnrGVjoEpuWO0G55uANExu
         NAHi7pLJJzD/fcpKQdfBYpnyp51ttwMfffD0GjMGTUT+LEHIm1JVig3zFx6WGTBtZMDZ
         E5lrtp4AiicemRu1AIwVyewiJKLQ0r1p8gR6lGnqGw4RnWuRHjBfm294N1LNbfG1WiZN
         keyw==
X-Gm-Message-State: ACrzQf2pKi83/MrJfZb79feyjwFM9M/04IVYMKE5ok6lrx63sF+gx1oD
	MahinWIN0EW85eAbbx9WKnY6GAogOD0=
X-Google-Smtp-Source: AMsMyM73IPeCkW+YGsA+DN+0niUj/fLZ9U6og6CH0JlDSkd4HfR/EysxNTX3T390qK+xLxVTDKImxA==
X-Received: by 2002:a05:6a00:150b:b0:56b:e358:5c08 with SMTP id q11-20020a056a00150b00b0056be3585c08mr12471730pfu.37.1667195709899;
        Sun, 30 Oct 2022 22:55:09 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 09/19] powerpc: Rename STACK_FRAME_MARKER and derive it from frame offset
Date: Mon, 31 Oct 2022 15:54:30 +1000
Message-Id: <20221031055440.3594315-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031055440.3594315-1-npiggin@gmail.com>
References: <20221031055440.3594315-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a count of longs from the stack pointer to the regs marker.
Rename it to make it more distinct from the other byte offsets. It
can be derived from the byte offset definitions just added.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h | 4 ++--
 arch/powerpc/kernel/process.c     | 2 +-
 arch/powerpc/kernel/stacktrace.c  | 2 +-
 arch/powerpc/perf/callchain.c     | 2 +-
 arch/powerpc/xmon/xmon.c          | 3 +--
 5 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 8a9f4cf8c4c5..fdd50648df56 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -126,7 +126,6 @@ struct pt_regs
 				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
 #define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
 #define STACK_INT_FRAME_MARKER	(STACK_FRAME_OVERHEAD - 16)
-#define STACK_FRAME_MARKER	12
 
 #ifdef CONFIG_PPC64_ELF_ABI_V2
 #define STACK_FRAME_MIN_SIZE	32
@@ -147,7 +146,6 @@ struct pt_regs
 #define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
 #define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
 #define STACK_INT_FRAME_MARKER	(STACK_FRAME_OVERHEAD - 8)
-#define STACK_FRAME_MARKER	2
 #define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
 
 /* Size of stack frame allocated when calling signal handler. */
@@ -155,6 +153,8 @@ struct pt_regs
 
 #endif /* __powerpc64__ */
 
+#define STACK_INT_FRAME_MARKER_LONGS	(STACK_INT_FRAME_MARKER/sizeof(long))
+
 #ifndef __ASSEMBLY__
 #include <asm/paca.h>
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index e7010f71de24..b0a9e5eeec4c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2234,7 +2234,7 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
 		 * We look for the "regs" marker in the current frame.
 		 */
 		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS)
-		    && stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
+		    && stack[STACK_INT_FRAME_MARKER_LONGS] == STACK_FRAME_REGS_MARKER) {
 			struct pt_regs *regs = (struct pt_regs *)
 				(sp + STACK_INT_FRAME_REGS);
 
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index a2443d61728e..7efa0ec9dd77 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -136,7 +136,7 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
 
 		/* Mark stacktraces with exception frames as unreliable. */
 		if (sp <= stack_end - STACK_INT_FRAME_SIZE &&
-		    stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
+		    stack[STACK_INT_FRAME_MARKER_LONGS] == STACK_FRAME_REGS_MARKER) {
 			return -EINVAL;
 		}
 
diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 9e254aed1f61..b01497ed5173 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -62,7 +62,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 
 		if (next_sp == sp + STACK_INT_FRAME_SIZE &&
 		    validate_sp(sp, current, STACK_INT_FRAME_SIZE) &&
-		    fp[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
+		    fp[STACK_INT_FRAME_MARKER_LONGS] == STACK_FRAME_REGS_MARKER) {
 			/*
 			 * This looks like an interrupt frame for an
 			 * interrupt that occurred in the kernel
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index e403f14eb6eb..bbdaa42ba4ba 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1720,7 +1720,6 @@ static void get_function_bounds(unsigned long pc, unsigned long *startp,
 }
 
 #define LRSAVE_OFFSET		(STACK_FRAME_LR_SAVE * sizeof(unsigned long))
-#define MARKER_OFFSET		(STACK_FRAME_MARKER * sizeof(unsigned long))
 
 static void xmon_show_stack(unsigned long sp, unsigned long lr,
 			    unsigned long pc)
@@ -1783,7 +1782,7 @@ static void xmon_show_stack(unsigned long sp, unsigned long lr,
 
 		/* Look for "regs" marker to see if this is
 		   an exception frame. */
-		if (mread(sp + MARKER_OFFSET, &marker, sizeof(unsigned long))
+		if (mread(sp + STACK_INT_FRAME_MARKER, &marker, sizeof(unsigned long))
 		    && marker == STACK_FRAME_REGS_MARKER) {
 			if (mread(sp + STACK_INT_FRAME_REGS, &regs, sizeof(regs)) != sizeof(regs)) {
 				printf("Couldn't read registers at %lx\n",
-- 
2.37.2

