Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 114C056D347
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:16:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh8Dk6SlJz3fq1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:16:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X6dVkiqE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X6dVkiqE;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh86z3vj1z3cMq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:11:39 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id f11so3364666plr.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kbOy68chFo9p31+WmLVIMBNGbtK2PTioaQrCoywan7I=;
        b=X6dVkiqEGfHqLzxFJIPwTS2faHR51wM5uuBMrwSvpWiaP9BNI6qW/DaqYAnTP/iaQ7
         NwSJsdimNml8/GYs1aR2VkF8UOqAUNxKsNg5zuSRl/WEfpbYpq6amh1fUtXZMjPEUwBT
         +1ohv5Z9IfSVIX5qObzCY5C96DWSIAHG4VYEA8I9SzBV2zCQCqsdyY5yRsiLJ+6nrT1u
         aRExTzJX5v1c5YQLm8H9XyV6VDFJ8x/sbd+rYMlQv2rmkfuM73b++hPEI24Ux+cl3BCQ
         iRxLchwmzYj63EtsWnKtLc70hDwK7r369Urg25a4VCzJoRSQhreKRYUQ0qgBlrXDsD1M
         W5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kbOy68chFo9p31+WmLVIMBNGbtK2PTioaQrCoywan7I=;
        b=SBgCBYYRt8Hfto6uuHeb3kq1vGIKGeksKJmoFGKi5sJ5Sd7LkTFSS04onZnhyuoNtY
         vbLZddJ9qsmfyGi5ixH5PQKFYYRXYWZNnKcm7MmbEAiS7NAuRt1F5VNsxw8yJNzQNmiS
         IyYUtzrTRuyuJOvA/+e8dVwARVWhIF7S6lemQfAYmh5sCMrA9ftpA8Ok4LHlmPU/ugQu
         kQYnggaoTWYwSPGjBvLVEBx9FmwRdNzMWlcASy4e6VaeEclO230aOX8FMNwEVtoMZG9g
         4DASIZ62MZao7zNhyvKIiA/qr3qS4j/lMWd+UXClxXSqRn3eECbi0pvMSbE0FO3GqmbQ
         N58w==
X-Gm-Message-State: AJIora9vgdP+rFucT7KMxTyg0aUuAJoHxWpvGJyG3YwzxcHMynuQoP0I
	MD+BcDHM9tbxdbWtlZmVUM/Vy9nwfXw=
X-Google-Smtp-Source: AGRyM1vArxmwhYmJeVHqyKvRM9+4rHrcE2QNdV7+Jo3uy4WvxvD2Frp1nX8vVJgOIh21gk8inmmf6Q==
X-Received: by 2002:a17:902:8e8b:b0:168:a135:d636 with SMTP id bg11-20020a1709028e8b00b00168a135d636mr15986702plb.140.1657509097175;
        Sun, 10 Jul 2022 20:11:37 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id s17-20020a632151000000b0041264dec901sm3063236pgm.21.2022.07.10.20.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:11:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: Make POWER10 and later use pause_short in cpu_relax loops
Date: Mon, 11 Jul 2022 13:11:28 +1000
Message-Id: <20220711031128.151437-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711031128.151437-1-npiggin@gmail.com>
References: <20220711031128.151437-1-npiggin@gmail.com>
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

We want to move away from using SMT prioroty updates for cpu_relax, and
use a 'wait' instruction which is similar to x86. As well as being a
much better fit for what everybody else uses and tests with, priority
nops are stateful which is nasty (interrupts have to consider they might
be taken at a different priority), and they're expensive to execute,
similar to a mtSPR which can effect other threads in the pipe.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Unfortunately qemu TCG does not emulate pause_short properly and will
cause hangs. I have a patch for it but not merged yet. But if we tune
qspinlock code it would be best to do it with this patch.
---
 arch/powerpc/include/asm/processor.h      | 30 +++++++++++++++++++----
 arch/powerpc/include/asm/vdso/processor.h | 10 +++++++-
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index fdfaae194ddd..61f16515cbe0 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -355,11 +355,31 @@ static inline unsigned long __pack_fe01(unsigned int fpmode)
 
 #ifdef CONFIG_PPC64
 
-#define spin_begin()	HMT_low()
-
-#define spin_cpu_relax()	barrier()
-
-#define spin_end()	HMT_medium()
+#define spin_begin()							\
+do {									\
+	asm volatile(ASM_FTR_IFCLR(					\
+		"or 1,1,1", /* HMT_LOW */				\
+		"nop",/* POWER10 onward uses pause_short (wait 2,0) */	\
+				%0) :: "i" (CPU_FTR_ARCH_31) : "memory"); \
+} while (0)
+
+#define spin_cpu_relax()						\
+do {									\
+	asm volatile(ASM_FTR_IFCLR(					\
+		/* Pre-POWER10 uses low ; medium priority nops */	\
+		"nop",							\
+		/* POWER10 onward uses pause_short (wait 2,0) */	\
+		PPC_WAIT_BOOKS(2, 0),					\
+				%0) :: "i" (CPU_FTR_ARCH_31) : "memory"); \
+} while (0)
+
+#define spin_end()							\
+do {									\
+	asm volatile(ASM_FTR_IFCLR(					\
+		"or 2,2,2", /* HMT_MEDIUM */				\
+		"nop",/* POWER10 onward uses pause_short (wait 2,0) */	\
+				%0) :: "i" (CPU_FTR_ARCH_31) : "memory"); \
+} while (0)
 
 #endif
 
diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
index 8d79f994b4aa..1116230ebb08 100644
--- a/arch/powerpc/include/asm/vdso/processor.h
+++ b/arch/powerpc/include/asm/vdso/processor.h
@@ -22,7 +22,15 @@
 #endif
 
 #ifdef CONFIG_PPC64
-#define cpu_relax()	do { HMT_low(); HMT_medium(); barrier(); } while (0)
+#define cpu_relax()							\
+do {									\
+	asm volatile(ASM_FTR_IFCLR(					\
+		/* Pre-POWER10 uses low ; medium priority nops */	\
+		"or 1,1,1 ; or 2,2,2",					\
+		/* POWER10 onward uses pause_short (wait 2,0) */	\
+		PPC_WAIT_BOOKS(2, 0),					\
+				%0) :: "i" (CPU_FTR_ARCH_31) : "memory"); \
+} while (0)
 #else
 #define cpu_relax()	barrier()
 #endif
-- 
2.35.1

