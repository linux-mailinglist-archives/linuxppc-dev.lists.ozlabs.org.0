Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA74C57B508
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 13:04:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LntBM4cNNz3chy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 21:04:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kwwnuXXd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kwwnuXXd;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnt9200gGz2xjm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 21:03:17 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id 70so16220491pfx.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kBi+NdAzq7wuL4GEH5aN8bOZ61bpd6rksyx869TB+hI=;
        b=kwwnuXXdiUEkd9KzV9z9mS6fmmSYKdYN+eKzxLYyXtII9bokEQ19SP1S+wnu8R3noJ
         4SZVwi1DDKPyDwreHnouvgJF1euKfiOlMVHm8VO2NEk/I1CG/c1trr7DdzD+Ik7/2oQ1
         V0/r3OT50LSJwFpIQHYfnOCuNeBX3sI7TlVRNoMxMRwlQA2S3eaBqJcLBcnQPLREvron
         Fq1JQIDKql9CsRPgW6TQ+Sykl316r4Ge8oLU0g92kVAzfIUHIK9YVRWXVKbxJH2lOGXk
         tMrGpBmtfUr8mC01ysXzvyJ2dArJ7FUGxja9TqPzYgW4rv1ZLMOi1ST2U4XuP1pWtDln
         U44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kBi+NdAzq7wuL4GEH5aN8bOZ61bpd6rksyx869TB+hI=;
        b=qw0Ghd9LhVPvZZFHw3VxjrjOl5y4dZ8bpQAVAJT3lUC1kBKpUrXly/ORGhWmx1Mnb3
         tTAmMnBQC0XflpjawHAP/EPJUtRjXP2CaBzx/BVH0pEfmUGdonLYvYpcemjp4Bufo3Uh
         k0Bza3EMXpH7fPL4uuVl5hiG+8AOQ9Qegwutenb4lj0kuq8pPIavnfV7u+0MyI85VoPE
         qJn5dbboFq42l6FAPvhNX0HIphxE1ZCFQ4PhypFkxoWk2pBoMfGz/3gx7Ur/lHdaUELK
         jBihtUsTGt+23ydPzfS9mJ9Ba5lnsEkajQI5qu8pIi/HL6qG3GsxtJ/wf8XCz1t3U4Z6
         AmQg==
X-Gm-Message-State: AJIora+HeR8dgQJLOtcHsSEMdvSBjuL6pU5pa2OjDKgK0QeUKFnMoHDW
	fJNpxsvxwxSTOqEigKI/UFcOO0cqqI4=
X-Google-Smtp-Source: AGRyM1svqswZGmnXH7rfjn++mkftbOmkTg8N3JAH2sjhrEEE0zY+tAeR7j1GCgoo6lOKPQ/LspR6MQ==
X-Received: by 2002:aa7:80d3:0:b0:52b:9237:a355 with SMTP id a19-20020aa780d3000000b0052b9237a355mr6196528pfn.73.1658314994724;
        Wed, 20 Jul 2022 04:03:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-33-251-27.static.tpgi.com.au. [27.33.251.27])
        by smtp.gmail.com with ESMTPSA id p9-20020aa79e89000000b00528a097aeffsm13238652pfq.118.2022.07.20.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 04:03:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/64s: Make POWER10 and later use pause_short in cpu_relax loops
Date: Wed, 20 Jul 2022 21:03:02 +1000
Message-Id: <20220720110302.684113-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720110302.684113-1-npiggin@gmail.com>
References: <20220720110302.684113-1-npiggin@gmail.com>
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
---
Unfortunately qemu TCG does not emulate pause_short properly and will
cause hangs. I have a patch for it but not merged yet. But if we tune
qspinlock code it would be best to do it with this patch.

Thanks,
Nick

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

