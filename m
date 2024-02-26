Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF62867054
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:16:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L0lXhRcV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxNC2b3Lz3vbY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:16:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L0lXhRcV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxJP0pRjz3cRc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:12:52 +1100 (AEDT)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5a03933eb55so1255303eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942370; x=1709547170; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlPzJOA7yG26HKy83xR6jHIo02HYDiPlSn1sSTNjdtM=;
        b=L0lXhRcVWlqj3OvEGC8FCtTyfEd+7M6yp//e4StrNxRdT83Qe5YXZh+7AMq0jn8SlA
         V1mgOhSJNJoRcarPsi5V9fE3MjLmudlzBeuREICsIe2PKzPfy2uDN0RIs2SmCU6KHtds
         dOUjyR1gL7al6ZALicK5x4985jJepyj8uWnJAm7cngolEa8WOAt0Xn3TCnacWxsb4FXS
         ddv4dXrzM8Xge7/qHSbQ0BlFKeORMLulsvYuN9D1Wymc8/2RZSRhSFq8nrX9JBJbfk3k
         gwT32wUbZnUmgd+1AFQMWTI7O0RhiJ/DL70UrAPaV4Ir2yGxEhTAH+akQ/o9wDq/TAFC
         scQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942370; x=1709547170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlPzJOA7yG26HKy83xR6jHIo02HYDiPlSn1sSTNjdtM=;
        b=d+qzG5bE8FsqphlEzPbXesuIEOHkUypf0VrZB3JMTL69AQD4qBnKPJ7tc22gczbYQ3
         O2oltS8hrpKf32RU3AMW8Wv371ngmIJ/+0y5RmZtjwET4yx6jybU2qfd22FpSbIsmaAR
         q4QMC2B9mI1G5qWrxbIaFUwWBkArPsvSEwbqqDmSsq+WqyVdP3FdBWqAnNrKShir/NnK
         Y5M2HSyOtDaICTzC2053MCDIVdtZevYxvteNo3vECCCuNFr+32AzQIi+/MauPrmiHTOR
         Xo78cF6NiaAlB8f90dcMBGKsnZD6+lEczFfex3aqT+PGDUcdpNUu/gk7AQ/v/JWqQQdZ
         HCfw==
X-Forwarded-Encrypted: i=1; AJvYcCUw4yIXgZBvN/VZgGZ+n106uhB62F3q6JYqOIWCr98MpCHCqDKiolqC7+ysPYyC/WfQTSBDV7/PIf1xZ3B9LTmyqCHWvzOFMQVLMNhTPg==
X-Gm-Message-State: AOJu0Yx1wpbNM+KRTp1PAmI1Ncwh/O3jq91DRl6u1N6ST28rqDlKfuJX
	nCqUsHMKu2hfuefPeyt9mLyL3qXfZFGrZs/zMUOCveCb6UNfcqRg
X-Google-Smtp-Source: AGHT+IFBfl5Q5KisBGtiG/T5CPUrvfqxr0lnt67lRLOeWbmF4Tvfx58+qKE4sX88mI7p9rwb+lsj4Q==
X-Received: by 2002:a05:6358:6422:b0:178:b97c:f087 with SMTP id f34-20020a056358642200b00178b97cf087mr8211946rwh.15.1708942369673;
        Mon, 26 Feb 2024 02:12:49 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:12:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 04/32] powerpc: interrupt stack backtracing
Date: Mon, 26 Feb 2024 20:11:50 +1000
Message-ID: <20240226101218.1472843-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226101218.1472843-1-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for backtracing across interrupt stacks, and
add interrupt frame backtrace for unhandled interrupts.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/processor.c |  4 ++-
 lib/ppc64/asm/stack.h   |  3 +++
 lib/ppc64/stack.c       | 55 +++++++++++++++++++++++++++++++++++++++++
 powerpc/Makefile.ppc64  |  1 +
 powerpc/cstart64.S      |  7 ++++--
 5 files changed, 67 insertions(+), 3 deletions(-)
 create mode 100644 lib/ppc64/stack.c

diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index ad0d95666..114584024 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -51,7 +51,9 @@ void do_handle_exception(struct pt_regs *regs)
 		return;
 	}
 
-	printf("unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n", regs->trap, regs->nip, regs->msr);
+	printf("Unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n",
+			regs->trap, regs->nip, regs->msr);
+	dump_frame_stack((void *)regs->nip, (void *)regs->gpr[1]);
 	abort();
 }
 
diff --git a/lib/ppc64/asm/stack.h b/lib/ppc64/asm/stack.h
index 9734bbb8f..94fd1021c 100644
--- a/lib/ppc64/asm/stack.h
+++ b/lib/ppc64/asm/stack.h
@@ -5,4 +5,7 @@
 #error Do not directly include <asm/stack.h>. Just use <stack.h>.
 #endif
 
+#define HAVE_ARCH_BACKTRACE
+#define HAVE_ARCH_BACKTRACE_FRAME
+
 #endif
diff --git a/lib/ppc64/stack.c b/lib/ppc64/stack.c
new file mode 100644
index 000000000..fcb7fa860
--- /dev/null
+++ b/lib/ppc64/stack.c
@@ -0,0 +1,55 @@
+#include <libcflat.h>
+#include <asm/ptrace.h>
+#include <stack.h>
+
+extern char exception_stack_marker[];
+
+int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
+{
+	static int walking;
+	int depth = 0;
+	const unsigned long *bp = (unsigned long *)frame;
+	void *return_addr;
+
+	asm volatile("" ::: "lr"); /* Force it to save LR */
+
+	if (walking) {
+		printf("RECURSIVE STACK WALK!!!\n");
+		return 0;
+	}
+	walking = 1;
+
+	bp = (unsigned long *)bp[0];
+	return_addr = (void *)bp[2];
+
+	for (depth = 0; bp && depth < max_depth; depth++) {
+		return_addrs[depth] = return_addr;
+		if (return_addrs[depth] == 0)
+			break;
+		if (return_addrs[depth] == exception_stack_marker) {
+			struct pt_regs *regs;
+
+			regs = (void *)bp + STACK_FRAME_OVERHEAD;
+			bp = (unsigned long *)bp[0];
+			/* Represent interrupt frame with vector number */
+			return_addr = (void *)regs->trap;
+			if (depth + 1 < max_depth) {
+				depth++;
+				return_addrs[depth] = return_addr;
+				return_addr = (void *)regs->nip;
+			}
+		} else {
+			bp = (unsigned long *)bp[0];
+			return_addr = (void *)bp[2];
+		}
+	}
+
+	walking = 0;
+	return depth;
+}
+
+int backtrace(const void **return_addrs, int max_depth)
+{
+	return backtrace_frame(__builtin_frame_address(0), return_addrs,
+			       max_depth);
+}
diff --git a/powerpc/Makefile.ppc64 b/powerpc/Makefile.ppc64
index b0ed2b104..eb682c226 100644
--- a/powerpc/Makefile.ppc64
+++ b/powerpc/Makefile.ppc64
@@ -17,6 +17,7 @@ cstart.o = $(TEST_DIR)/cstart64.o
 reloc.o  = $(TEST_DIR)/reloc64.o
 
 OBJDIRS += lib/ppc64
+cflatobjs += lib/ppc64/stack.o
 
 # ppc64 specific tests
 tests = $(TEST_DIR)/spapr_vpa.elf
diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index 14ab0c6c8..278af84a6 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -188,6 +188,7 @@ call_handler:
 	.endr
 	mfsprg1	r0
 	std	r0,GPR1(r1)
+	std	r0,0(r1)
 
 	/* lr, xer, ccr */
 
@@ -206,12 +207,12 @@ call_handler:
 	subi	r31, r31, 0b - start_text
 	ld	r2, (p_toc_text - start_text)(r31)
 
-	/* FIXME: build stack frame */
-
 	/* call generic handler */
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_handle_exception
+	.global exception_stack_marker
+exception_stack_marker:
 
 	/* restore context */
 
@@ -321,6 +322,7 @@ handler_trampoline:
 	/* nip and msr */
 	mfsrr0	r0
 	std	r0, _NIP(r1)
+	std	r0, INT_FRAME_SIZE+16(r1)
 
 	mfsrr1	r0
 	std	r0, _MSR(r1)
@@ -337,6 +339,7 @@ handler_htrampoline:
 	/* nip and msr */
 	mfspr	r0, SPR_HSRR0
 	std	r0, _NIP(r1)
+	std	r0, INT_FRAME_SIZE+16(r1)
 
 	mfspr	r0, SPR_HSRR1
 	std	r0, _MSR(r1)
-- 
2.42.0

