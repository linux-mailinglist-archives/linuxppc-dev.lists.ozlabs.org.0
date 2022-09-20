Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8995BE5A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 14:24:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX11m6r9Wz3cC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:24:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QBLuuQrH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QBLuuQrH;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MX10b4HWTz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 22:23:11 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id c24so2195396plo.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 05:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tbCe8Z5/AG2fggvlriFr/YWvwLf8BQOqvnc5d9rfjmw=;
        b=QBLuuQrHplR61fSZb7cZ2sCN0xhQVjdt+CBYCWOz0NKPz/JfuMOqhzfAwC0W+Di33u
         wTVQ1wxSGu1la3hQHfC6PETQpyxSmAy2Os5vbfNghJM4UliFi0fWEisEREDnH7eSlqEw
         yf03TZ4x9ZqRTgIH/xRwZqT7CDBz1DvRUNTI4bRuGdTAet+od2YxYKxbJOtUhkguygWL
         cSLzw3v12/sbZDeBucjz4vHlOdaJFVq5kBcIJwYUIEWS7Wy2aNSI/z4ExWm/EiNBjx73
         PojhX9/ccCgO2j3PFNEqA2dPrhJ6hZ+J/tcfop5IKoqNx2pUqFYppdeYDvndHLGyWjGZ
         FFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tbCe8Z5/AG2fggvlriFr/YWvwLf8BQOqvnc5d9rfjmw=;
        b=DwudW9nre2aFrqcYDvh06q/TM7cvtyB+33srXBdjbiqeV0Ah7RLtuImwS61lGRxMYQ
         xIb0zseQcHm7UigrLXVuexAUKmdIOV5UfFxqi7jFj4JW8KiCIiTSgxei8XptkHEtpV2t
         Z1QdZyQO4OhdkNypoZS14LBASZeJWD7IWzM51bMALusqLoEKB2K6DjD4NMZScU8Wjto2
         PTM3y2nBcC7UcwTrkLxSR3WdgyyxaXdl/uBivGkmsdQR0X2qP6XlF9JGkslNdATqD/Qk
         zoTevuUAxulMlRuZ8UpiTlbj+WXphaT1NKlwc8cn8jFFlNGutnK1wKn+Wq8ADQfcMgPt
         HDZQ==
X-Gm-Message-State: ACrzQf3gL+cf/RAmCs5dkpvPctZz6n4qcylydDq6HJc7Z0BeHMRf+Uix
	7jEcE6akYGR91eHpl1MO9HzY/H7sCjY=
X-Google-Smtp-Source: AMsMyM65UroFYUKDBt4CDw5ZuZw8KzUo400c5C5lQFsJVWgXQMUbloTPPVCyIXrwsgV0CseuvUAH/A==
X-Received: by 2002:a17:903:110f:b0:178:a07e:e643 with SMTP id n15-20020a170903110f00b00178a07ee643mr4482477plh.41.1663676588872;
        Tue, 20 Sep 2022 05:23:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.219.227.147])
        by smtp.gmail.com with ESMTPSA id t17-20020a170902e1d100b001708c4ebbaesm1246569pla.309.2022.09.20.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 05:23:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/2] powerpc/64s: Make POWER10 and later use pause_short in cpu_relax loops
Date: Tue, 20 Sep 2022 22:22:59 +1000
Message-Id: <20220920122259.363092-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920122259.363092-1-npiggin@gmail.com>
References: <20220920122259.363092-1-npiggin@gmail.com>
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

We want to move away from using SMT priority updates for cpu_relax, and
use a 'wait' instruction which is similar to x86. As well as being a
much better fit for what everybody else uses and tests with, priority
nops are stateful which is nasty (interrupts have to consider they might
be taken at a different priority), and they're expensive to execute,
similar to a mtSPR which can effect other threads in the pipe.

This has shown to give results that are less affected by code alignment
on benchmarks that cause a lot of spin waiting (e.g., rwsem contention
on unixbench filesystem benchmarks) on POWER10.

QEMU TCG only supports this instruction correctly since v7.1, versions
without the fix may cause hangs whne running POWER10 CPUs.

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v4:
- Rebase, test with upstream qemu with fix
- Clarify asm comments and fix typo (thanks Segher)

 arch/powerpc/include/asm/processor.h      | 28 +++++++++++++++++++----
 arch/powerpc/include/asm/vdso/processor.h | 10 +++++++-
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index fdfaae194ddd..6b9b0d710468 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -355,11 +355,29 @@ static inline unsigned long __pack_fe01(unsigned int fpmode)
 
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
+		"nop", /* v3.1 uses pause_short in cpu_relax instead */	\
+		%0) :: "i" (CPU_FTR_ARCH_31) : "memory");		\
+} while (0)
+
+#define spin_cpu_relax()						\
+do {									\
+	asm volatile(ASM_FTR_IFCLR(					\
+		"nop", /* Before v3.1 use priority nops in spin_begin/end */ \
+		PPC_WAIT(2, 0),	/* aka pause_short */			\
+		%0) :: "i" (CPU_FTR_ARCH_31) : "memory");		\
+} while (0)
+
+#define spin_end()							\
+do {									\
+	asm volatile(ASM_FTR_IFCLR(					\
+		"or 2,2,2", /* HMT_MEDIUM */				\
+		"nop",							\
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
2.37.2

