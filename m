Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7DC639AB2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:58:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpZM2lR8z3f8k
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:58:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e0hGiqTG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e0hGiqTG;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNM6CVfz3cLJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:11 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so602939pje.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mw6OJKd2lcdMmF5UuydK2s0XiUQAnr8szlW7P0LtaZc=;
        b=e0hGiqTGdNgzWsAXLiKyABq1Z6omZGHxvDSBnqsSslq6eXMjgQvhwgvfzuamdRkszT
         wF7b278AZkmYsEbSzgyD7NCdUCydSfu0FTFHIg34tcL4qMsVLEuFKC8ZdQXKp56IZIHU
         dBLDwxCmjokhRI2TGMpISEBSlyMXMvhK35aRolk1tOfRiOm4JKJa8lcCtZeGz5BZKNTS
         ZFn3gJurRU34dQFsiOgi7oTGpzM9mCzRvldBGrlg7IYY3cln9IURpGPXDFpk/hmDXiwE
         hYFgGr/tC6issVC/PzI56Iz++EimM+vc9DsvwKgeUrse5EOSDcoYxa9VHdQY2wWHOmYF
         MYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mw6OJKd2lcdMmF5UuydK2s0XiUQAnr8szlW7P0LtaZc=;
        b=0K4k5nYli/NqHYNQnPl1CFXjHiYrzzE7AtCKuxHW4Vr6XidFgntgXEeYt6qez3KRAH
         kdHaLR1DTw3wFzr6Hqrd0gobhkAaJfD8uzXYD6IsBsagqgg8LF0d5DG/r485TBRsWjsL
         tuQdlsb5gfLA+dldNSKBLOIj0Gb56JyJ+O1QL36MLNSTD/yz3clE+zWAQIp1h/UYQcf+
         HX9qq0WMcWSwm9Z1SekyWrKCHVheMpA9GIBsocbaU6dJBrCchzS364mHnLJ8xYaHRrda
         d9nh4wM53bIUGKaOjezcvv/g9m/OFMO+bH2ykbK/9yVN4j3jDLI4ctIY0THH7pDUYIpe
         1EjA==
X-Gm-Message-State: ANoB5plM7qPpMgUVChm+zpv9mIjyLKDqbt00PHbIb40TSiOdP0rJQ/9z
	6Ktu+UlYcUAicAZQaVkzreTefbNGBcloOA==
X-Google-Smtp-Source: AA0mqf6vOz6VyH1z2lIu5COS4cRr5hVMIeDweum9UbZ3rljJ6x5qm5qvSjudHsIXynAQYgng87oZ9w==
X-Received: by 2002:a17:90b:793:b0:218:9c4f:e97 with SMTP id l19-20020a17090b079300b002189c4f0e97mr39684779pjz.2.1669553411049;
        Sun, 27 Nov 2022 04:50:11 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/17] powerpc: Rename STACK_FRAME_MARKER and derive it from frame offset
Date: Sun, 27 Nov 2022 22:49:34 +1000
Message-Id: <20221127124942.1665522-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127124942.1665522-1-npiggin@gmail.com>
References: <20221127124942.1665522-1-npiggin@gmail.com>
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

