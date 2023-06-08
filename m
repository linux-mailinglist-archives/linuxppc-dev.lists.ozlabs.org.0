Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EDD727973
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 10:01:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcGrc4VyNz3dwP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 18:01:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FSas9QUg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FSas9QUg;
	dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGn33jKMz3dxc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 17:58:47 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-3f9c60bc99cso2237861cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686211127; x=1688803127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmEhHDXqBF9dQ1veYws/GnTEIhu9OPeqy9gy1d4w4DM=;
        b=FSas9QUg0UpdaLQcAcrgO+WSq/ocmCN8xKJ4KaAPW84Dm1aS8VCARaSFulSe1vWHVS
         nrK/ONUP3MvBx+ePiWqriKeg3gwanhQv3yghafty8pF3wexJAcWqGSlsqHNN/hYxpbVx
         iohdAGMELlqbyrR8sZX40mSSF9+OkqzutNEnwViW3tAxDM8+cMxIRyESG1ZQY1Z7ocn8
         OZI+QSIJBk912zU93j7b1fGjUwsDG0aMnGmnLHF2+05BG+doiwRs2jNYDntLYaymX6fm
         8v1+3JtWuBZQC7NCSDy5QB7RXn/DXmu1VRb2dSD20bZBPHiVMbW3y1esS9kEa82tK/DM
         k8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211127; x=1688803127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmEhHDXqBF9dQ1veYws/GnTEIhu9OPeqy9gy1d4w4DM=;
        b=BLX4X7cCk4cgt6xxyW5Fy5I9BsSvh5gUyZxzBvPSmOLi1azT3aoOTXBJrTJ0CdsESn
         UXs+c7F+suYJJPGNSvN/xBAotb+MULYgNqZ7qMSJ4mXH3HiVQCB9XmLe/q/6HgsA/enb
         5vHSTuDtNYOCdKTG/LeFM0tkO6ikvr2xIJPNc85Cya8aI3EG/P9yrq7faKS5haA5EIGD
         xo0ri12psMWFIT9FXrBK30xce7oyOLRkC5ORrunJJ6x+eBNat/qDFAYotOgieQjqbT4c
         ImrNvjE0gm2N0q7xmluXKu/Zu2GEayV67WV7YgSmJ4urax/ZTEz3MVWfx5pdYTi/FVYi
         Wydg==
X-Gm-Message-State: AC+VfDwauY13HievIu1/gEZbOBi6MEMwDwEq1+lM/UNZBoRwN3fnJr5w
	zIRdV/phHMA08pm5EZNH5Zs=
X-Google-Smtp-Source: ACHHUZ5pZcO+N3Su+GOBU3WMg4D9ivP4jx6OqrrOSe/69gNNpjrbL1hXdwcvJQzjzuzgsPF6UNMhWw==
X-Received: by 2002:a05:622a:180a:b0:3f8:6b32:480d with SMTP id t10-20020a05622a180a00b003f86b32480dmr6247042qtc.46.1686211126897;
        Thu, 08 Jun 2023 00:58:46 -0700 (PDT)
Received: from wheely.local0.net ([1.146.34.117])
        by smtp.gmail.com with ESMTPSA id 17-20020a630011000000b00542d7720a6fsm673182pga.88.2023.06.08.00.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:58:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v4 03/12] powerpc: Abstract H_CEDE calls into a sleep functions
Date: Thu,  8 Jun 2023 17:58:17 +1000
Message-Id: <20230608075826.86217-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608075826.86217-1-npiggin@gmail.com>
References: <20230608075826.86217-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This consolidates several implementations, and it no longer leaves
MSR[EE] enabled after the decrementer interrupt is handled, but
rather disables it on return.

The handler no longer allows a continuous ticking, but rather dec
has to be re-armed and EE re-enabled (e.g., via H_CEDE hcall) each
time.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/handlers.h  |  2 +-
 lib/powerpc/asm/ppc_asm.h   |  1 +
 lib/powerpc/asm/processor.h |  7 ++++++
 lib/powerpc/handlers.c      | 10 ++++-----
 lib/powerpc/processor.c     | 43 +++++++++++++++++++++++++++++++++++++
 powerpc/sprs.c              |  6 +-----
 powerpc/tm.c                | 20 +----------------
 7 files changed, 58 insertions(+), 31 deletions(-)

diff --git a/lib/powerpc/asm/handlers.h b/lib/powerpc/asm/handlers.h
index 64ba727a..e4a0cd45 100644
--- a/lib/powerpc/asm/handlers.h
+++ b/lib/powerpc/asm/handlers.h
@@ -3,6 +3,6 @@
 
 #include <asm/ptrace.h>
 
-void dec_except_handler(struct pt_regs *regs, void *data);
+void dec_handler_oneshot(struct pt_regs *regs, void *data);
 
 #endif /* _ASMPOWERPC_HANDLERS_H_ */
diff --git a/lib/powerpc/asm/ppc_asm.h b/lib/powerpc/asm/ppc_asm.h
index 1b85f6bb..6299ff53 100644
--- a/lib/powerpc/asm/ppc_asm.h
+++ b/lib/powerpc/asm/ppc_asm.h
@@ -36,6 +36,7 @@
 #endif /* __BYTE_ORDER__ */
 
 /* Machine State Register definitions: */
+#define MSR_EE_BIT	15			/* External Interrupts Enable */
 #define MSR_SF_BIT	63			/* 64-bit mode */
 
 #endif /* _ASMPOWERPC_PPC_ASM_H */
diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index ac001e18..ebfeff2b 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -20,6 +20,8 @@ static inline uint64_t get_tb(void)
 
 extern void delay(uint64_t cycles);
 extern void udelay(uint64_t us);
+extern void sleep_tb(uint64_t cycles);
+extern void usleep(uint64_t us);
 
 static inline void mdelay(uint64_t ms)
 {
@@ -27,4 +29,9 @@ static inline void mdelay(uint64_t ms)
 		udelay(1000);
 }
 
+static inline void msleep(uint64_t ms)
+{
+	usleep(ms * 1000);
+}
+
 #endif /* _ASMPOWERPC_PROCESSOR_H_ */
diff --git a/lib/powerpc/handlers.c b/lib/powerpc/handlers.c
index c8721e0a..296f14ff 100644
--- a/lib/powerpc/handlers.c
+++ b/lib/powerpc/handlers.c
@@ -9,15 +9,13 @@
 #include <libcflat.h>
 #include <asm/handlers.h>
 #include <asm/ptrace.h>
+#include <asm/ppc_asm.h>
 
 /*
  * Generic handler for decrementer exceptions (0x900)
- * Just reset the decrementer back to the value specified when registering the
- * handler
+ * Return with MSR[EE] disabled.
  */
-void dec_except_handler(struct pt_regs *regs __unused, void *data)
+void dec_handler_oneshot(struct pt_regs *regs, void *data)
 {
-	uint64_t dec = *((uint64_t *) data);
-
-	asm volatile ("mtdec %0" : : "r" (dec));
+	regs->msr &= ~(1UL << MSR_EE_BIT);
 }
diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index 0550e4fc..aaf45b68 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -10,6 +10,8 @@
 #include <asm/ptrace.h>
 #include <asm/setup.h>
 #include <asm/barrier.h>
+#include <asm/hcall.h>
+#include <asm/handlers.h>
 
 static struct {
 	void (*func)(struct pt_regs *, void *data);
@@ -58,3 +60,44 @@ void udelay(uint64_t us)
 {
 	delay((us * tb_hz) / 1000000);
 }
+
+void sleep_tb(uint64_t cycles)
+{
+	uint64_t start, end, now;
+
+	start = now = get_tb();
+	end = start + cycles;
+
+	while (end > now) {
+		uint64_t left = end - now;
+
+		/* TODO: Could support large decrementer */
+		if (left > 0x7fffffff)
+			left = 0x7fffffff;
+
+		/* DEC won't fire until H_CEDE is called because EE=0 */
+		asm volatile ("mtdec %0" : : "r" (left));
+		handle_exception(0x900, &dec_handler_oneshot, NULL);
+		/*
+		 * H_CEDE is called with MSR[EE] clear and enables it as part
+		 * of the hcall, returning with EE enabled. The dec interrupt
+		 * is then taken immediately and the handler disables EE.
+		 *
+		 * If H_CEDE returned for any other interrupt than dec
+		 * expiring, that is considered an unhandled interrupt and
+		 * the test case would be stopped.
+		 */
+		if (hcall(H_CEDE) != H_SUCCESS) {
+			printf("H_CEDE failed\n");
+			abort();
+		}
+		handle_exception(0x900, NULL, NULL);
+
+		now = get_tb();
+	}
+}
+
+void usleep(uint64_t us)
+{
+	sleep_tb((us * tb_hz) / 1000000);
+}
diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index 5cc1cd16..ba4ddee4 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -254,7 +254,6 @@ int main(int argc, char **argv)
 		0x1234567890ABCDEFULL, 0xFEDCBA0987654321ULL,
 		-1ULL,
 	};
-	static uint64_t decr = 0x7FFFFFFF; /* Max value */
 
 	for (i = 1; i < argc; i++) {
 		if (!strcmp(argv[i], "-w")) {
@@ -288,10 +287,7 @@ int main(int argc, char **argv)
 	if (pause) {
 		migrate_once();
 	} else {
-		puts("Sleeping...\n");
-		handle_exception(0x900, &dec_except_handler, &decr);
-		asm volatile ("mtdec %0" : : "r" (0x3FFFFFFF));
-		hcall(H_CEDE);
+		msleep(2000);
 	}
 
 	get_sprs(after);
diff --git a/powerpc/tm.c b/powerpc/tm.c
index 65cacdf5..7fa91636 100644
--- a/powerpc/tm.c
+++ b/powerpc/tm.c
@@ -48,17 +48,6 @@ static int count_cpus_with_tm(void)
 	return available;
 }
 
-static int h_cede(void)
-{
-	register uint64_t r3 asm("r3") = H_CEDE;
-
-	asm volatile ("sc 1" : "+r"(r3) :
-			     : "r0", "r4", "r5", "r6", "r7", "r8", "r9",
-			       "r10", "r11", "r12", "xer", "ctr", "cc");
-
-	return r3;
-}
-
 /*
  * Enable transactional memory
  * Returns:	FALSE - Failure
@@ -95,14 +84,10 @@ static bool enable_tm(void)
 static void test_h_cede_tm(int argc, char **argv)
 {
 	int i;
-	static uint64_t decr = 0x3FFFFF; /* ~10ms */
 
 	if (argc > 2)
 		report_abort("Unsupported argument: '%s'", argv[2]);
 
-	handle_exception(0x900, &dec_except_handler, &decr);
-	asm volatile ("mtdec %0" : : "r" (decr));
-
 	if (!start_all_cpus(halt, 0))
 		report_abort("Failed to start secondary cpus");
 
@@ -120,10 +105,7 @@ static void test_h_cede_tm(int argc, char **argv)
 		      "bf 2,1b" : : : "cr0");
 
 	for (i = 0; i < 500; i++) {
-		uint64_t rval = h_cede();
-
-		if (rval != H_SUCCESS)
-			break;
+		msleep(10);
 		mdelay(5);
 	}
 
-- 
2.40.1

