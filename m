Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650857B759
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 15:22:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnxG40nwRz3bnr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 23:22:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QV1+QIYY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QV1+QIYY;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnxDq3WHzz3bdK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 23:21:47 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id c139so10182724pfc.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 06:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iF0XtDM1kBRIHnzGAPWEr56f7/FO/M8Tb5gfp2NVC8w=;
        b=QV1+QIYY0wNXWxQCyAmkb/UV2csHxk3MqRpMGNe9ZnvsVhZn9fUVVb1RURcfdu1DNO
         bHKIOrb9pAsi/oJYs7l4Qo6ReDX5ilcjlpao2wBGjPauINmkJ7m0aYuxW/fDgDb4n18X
         KRbquRhCIXjXCQJXBhH9pR7BajHz3Uxc7xKN2y/e4xFmN18YNn6jhepP6GeX5LLXwp56
         LXJu4KUbPVxLghq3D4PtdH5COHus6tRsJiKn8su2uT67A4X3kX30U4J13x+zPb58f5Jm
         EIUWW2aOGypwwu6Bq580gQWW0ht4JlOVPK0KoAKqjy/jYDCdcp9boUQ1LR2HoiMf/mat
         L+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iF0XtDM1kBRIHnzGAPWEr56f7/FO/M8Tb5gfp2NVC8w=;
        b=2waPyuJymHrFtraJrNHPWOjx0grFMp97Zjta29RNh7b6Vnq9qsDWyS7XxXU9uIWsP5
         TTUKf9TFHP509oqOI0BcvO99JSlo8EwJJUnNtmeN+Zv6eqKttP/cRqkg0yDUFu3I/+Ip
         w1/xJXAx3B9cuICVbGSaBqOp2BXEWbbeVF6IL/tWHxokSlC4/jJ7FlaB3FDRI0c0TffQ
         o0rRZRrpg59AhIoN34FtIeY+Grst5bVaJmyZM3oIUU8LuDuWRrOCVWk2JlQFHyRSVSiU
         A7Hq3LzZ6G1AIMUlApDKo8dKi+uO39avmXShyyyQnZYG8obhd8uc3Yh2KeoWV99ycdph
         YDAg==
X-Gm-Message-State: AJIora8EnSKoFrOXimlcxHS/dcOmUMkKGOcijmEqHpSP4oWu7YFarZMM
	zCyUs4dAKr9DGnoJrH8C6p+YnYtGsOA=
X-Google-Smtp-Source: AGRyM1vY0GgL1NG2GD4PjGiDWIZhQcV1qxdjls9ETlMLUECDyDABGUCLrqiABNGtboNDou06MencDg==
X-Received: by 2002:a63:541:0:b0:419:aea5:eff9 with SMTP id 62-20020a630541000000b00419aea5eff9mr29829427pgf.291.1658323305139;
        Wed, 20 Jul 2022 06:21:45 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-33-251-27.static.tpgi.com.au. [27.33.251.27])
        by smtp.gmail.com with ESMTPSA id t9-20020a1709027fc900b0016bf4428586sm13827504plb.208.2022.07.20.06.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:21:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/2] powerpc/64s: Make POWER10 and later use pause_short in cpu_relax loops
Date: Wed, 20 Jul 2022 23:21:32 +1000
Message-Id: <20220720132132.903462-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720132132.903462-1-npiggin@gmail.com>
References: <20220720132132.903462-1-npiggin@gmail.com>
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

 arch/powerpc/include/asm/processor.h      | 30 +++++++++++++++++++----
 arch/powerpc/include/asm/vdso/processor.h | 10 +++++++-
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index fdfaae194ddd..d926e59f9d1b 100644
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
+		%0) :: "i" (CPU_FTR_ARCH_31) : "memory");		\
+} while (0)
+
+#define spin_cpu_relax()						\
+do {									\
+	asm volatile(ASM_FTR_IFCLR(					\
+		/* Pre-POWER10 uses low / medium priority nops */	\
+		"nop",							\
+		/* POWER10 onward uses pause_short (wait 2,0) */	\
+		PPC_WAIT(2, 0),						\
+		%0) :: "i" (CPU_FTR_ARCH_31) : "memory");		\
+} while (0)
+
+#define spin_end()							\
+do {									\
+	asm volatile(ASM_FTR_IFCLR(					\
+		"or 2,2,2", /* HMT_MEDIUM */				\
+		"nop",/* POWER10 onward uses pause_short (wait 2,0) */	\
+		%0) :: "i" (CPU_FTR_ARCH_31) : "memory");		\
+} while (0)
 
 #endif
 
diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
index 8d79f994b4aa..778d2b53041b 100644
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
+		PPC_WAIT(2, 0),						\
+		%0) :: "i" (CPU_FTR_ARCH_31) : "memory");		\
+} while (0)
 #else
 #define cpu_relax()	barrier()
 #endif
-- 
2.35.1

