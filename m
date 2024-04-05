Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652BB899848
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:43:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UgtMW+og;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sTZ133vz3vrn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:43:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UgtMW+og;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sKB2p0kz3vZH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:36:30 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ecf9898408so734880b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306188; x=1712910988; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojc5Jzo7lufTrgoyK+GArsWzgBJsqMRvJtb4QkYd9p0=;
        b=UgtMW+ogv1DZreosxi1kay2OXRskZGfl/z41yxTJtdw37cRRDSFaRTJ2kPmNkf+mpX
         Xeyh5LyFAKPKVcHX9ot0s006bRhcuxOkcYcoAgk9v4NORBV3e5J/QY59iPt8GA/wdzne
         4p24pujsIVP6gotLkvi0ceJK6lR7gBfvBNz7hgJ985Q/ejSyj5Hg8gtjgW9Zs5ubttYI
         MzRfeAZMMKi4zk/upJO7uE/48Yhg0eFzH0dpYPom9MV4/rHThuXjmxvz7hZGqSouRbrf
         R3VNF8qHNq4EP+OLpRTtRIdYcYFVyx+3wx0UozKbw9dAxqkbz6Zh5NPLGwRB2rNhi4ZN
         H0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306188; x=1712910988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojc5Jzo7lufTrgoyK+GArsWzgBJsqMRvJtb4QkYd9p0=;
        b=mR2qaba6aAMrcdI74YQpI4VlxI2yCKa2LeeXUv9uOcfD1YZO2ghmB2v39wRyQONxHA
         1tE9A8qru3n77AqpFuHxKTZMbW2sYAmTTLN2FrJYOf3UrjKnvy2FurAJ+GQCRvPxK8Nz
         fJnXExPuUjy3ly2O0xl7p9wlP9+rbrbpw6AalhWPCL/b8COkm1FHzmxVdFRB5V7O3HHK
         919g1Baiv+Tog65o+t8XzDWHzDqZDo1vYRzWp1EkcelJQadLYCGQG3/p+IAYDchd5fqd
         5eOTY/daey8PTS7zfb9LHApOk21t+fjTQycrrBEaqdF9m8PxOUt2YST/ryY8O8lKSCyL
         egOg==
X-Forwarded-Encrypted: i=1; AJvYcCXd2/1lawFaPHuhbWdAkV32ECYKfIpNvYlbkGE+8SEAXWE+uURp5Xuhsz4YYwzkD6i43nHlhRNVW7kD8YOqUyC1ypCCHHeXUUtqJpp9dA==
X-Gm-Message-State: AOJu0Yz1vaY89touZbjq+bYF24yyesCKQkAXLZQunDaSbnJjERfsEFCE
	jH7szRyq4zqGOui8f0GE2IT8GwaV+g9xXKq6+zUe841diHnLkh6O
X-Google-Smtp-Source: AGHT+IHhkgehUTWXHc9Epdp8neXLEfg0Xxtzigufux5Yi09dT9q7r3Cj5bfLmMhAMIPs13Ja1RKsAA==
X-Received: by 2002:a05:6a21:7888:b0:1a3:a821:f297 with SMTP id bf8-20020a056a21788800b001a3a821f297mr1328214pzc.2.1712306187838;
        Fri, 05 Apr 2024 01:36:27 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:36:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 10/35] powerpc: interrupt stack backtracing
Date: Fri,  5 Apr 2024 18:35:11 +1000
Message-ID: <20240405083539.374995-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for backtracing across interrupt stacks, and add
interrupt frame backtrace for unhandled interrupts.

This requires a back-chain created from initial interrupt stack
frame to the r1 value of the interrupted context. A label is
added at the return location of the exception handler call, so
the unwinder can recognize the initial interrupt frame.

The additional cstart entry-frame is no longer required because
the unwinder now looks for frame == 0 as well as address == 0.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/processor.c |  4 +++-
 lib/ppc64/asm/stack.h   |  3 +++
 lib/ppc64/stack.c       | 53 +++++++++++++++++++++++++++++++++++++++++
 powerpc/Makefile.ppc64  |  1 +
 powerpc/cstart64.S      | 15 +++---------
 5 files changed, 63 insertions(+), 13 deletions(-)
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
index 000000000..e6f259de7
--- /dev/null
+++ b/lib/ppc64/stack.c
@@ -0,0 +1,53 @@
+#include <libcflat.h>
+#include <asm/ptrace.h>
+#include <stack.h>
+
+extern char do_handle_exception_return[];
+
+int arch_backtrace_frame(const void *frame, const void **return_addrs,
+			 int max_depth, bool current_frame)
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
+	if (current_frame)
+		bp = __builtin_frame_address(0);
+
+	bp = (unsigned long *)bp[0];
+	return_addr = (void *)bp[2];
+
+	for (depth = 0; bp && depth < max_depth; depth++) {
+		return_addrs[depth] = return_addr;
+		if (return_addrs[depth] == 0)
+			break;
+		if (return_addrs[depth] == do_handle_exception_return) {
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
index 80baabe8f..07d297f61 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -51,16 +51,6 @@ start:
 	std	r0,0(r1)
 	std	r0,16(r1)
 
-	/*
-	 * Create entry frame of 64-bytes, same as the initial frame. A callee
-	 * may use the caller frame to store LR, and backtrace() termination
-	 * looks for return address == NULL, so the initial stack frame can't
-	 * be used to call C or else it could overwrite the zeroed LR save slot
-	 * and break backtrace termination.  This frame would be unnecessary if
-	 * backtrace looked for a zeroed frame address.
-	 */
-	stdu	r1,-64(r1)
-
 	/* save DTB pointer */
 	std	r3, 56(r1)
 
@@ -195,6 +185,7 @@ call_handler:
 	.endr
 	mfsprg1	r0
 	std	r0,GPR1(r1)
+	std	r0,0(r1) /* Backchain from interrupt stack to regular stack */
 
 	/* lr, xer, ccr */
 
@@ -213,12 +204,12 @@ call_handler:
 	subi	r31, r31, 0b - start_text
 	ld	r2, (p_toc_text - start_text)(r31)
 
-	/* FIXME: build stack frame */
-
 	/* call generic handler */
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_handle_exception
+	.global do_handle_exception_return
+do_handle_exception_return:
 
 	/* restore context */
 
-- 
2.43.0

