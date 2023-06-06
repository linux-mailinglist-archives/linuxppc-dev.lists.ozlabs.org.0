Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 955A6723E06
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 11:42:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb59w2f5Xz3fhx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:42:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QkaPvdTe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QkaPvdTe;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb55T1ctvz3f0D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 19:38:52 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5428f63c73aso2909505a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 02:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686044330; x=1688636330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BP7sv56sSZVGYKuG4xdF4PTVbcSuzFuYTXq7ORXVJsE=;
        b=QkaPvdTetHaBh2yTUt0SThgEn66LGUG+ecXfFHZHH8xyKBEM9T+eXCRAAQrGuM+jf2
         yHBLgNzsRk9YqM/ayTlJiRyhpbVHaYV5QZsegaPBKcvNeQP311n5e0DXjaxrkJ+NAxr+
         O21Dy5rEApMvLs3HmXJsk8In/nC7GT7PcBanzwdT64MwGJL/LUjMt/Idn4JuK9AQTcim
         Zw96d4Uv+0m7RC1U+KYBDzUR5SO+2iGTxe7hik08KoQHPYdfjJa/WRO8BUqkkcOPMDD6
         jsHCdzsmSIybhr6n2iM36Of7XjES2rCururP7xS6Vrjvoj6iltzltzOZJ6vUBrPUo/cV
         FxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044330; x=1688636330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BP7sv56sSZVGYKuG4xdF4PTVbcSuzFuYTXq7ORXVJsE=;
        b=BCUWjY94OIv9RhuQKYRNsPfVCdoSHpeZjcIy6cFgryf16lhChSxO3DZ418VunjVO+d
         e+zqrq52ASRTqmNY/JeO9ubYma0yvz3ueSiXc66WUI82Fp1SzY8qwkYCYKMSAIBfhb8R
         NEti2dgsbSrgbxgzdH1OHtCORvZhjGSHtNfxUfxTHyGMMHG0XsPq910l0qwMjCuNDdYf
         pX7vnmH99Bo4MwlPtC4957brw4xgFQDVm0Uh2J8MfC67LQB6YRiX3CIOxIQmfM3CRi1o
         jdhvTI0B2kTNlMUQ/S1kX6oI40OJIwzXoH4aJafWl/TZLqDA2kZAxJPpYxfkgHmN3MXP
         JEXQ==
X-Gm-Message-State: AC+VfDz+s6cJ0DNfYneKmfMFvgEBdYzRblx2cVwAU3+J5GVyzcQ/o61D
	3dpwwgXP9xya7bfLjQMo351ngj4csT4tuA==
X-Google-Smtp-Source: ACHHUZ6BHXdy/Pg6hkTVsrV084gpFqYMFeyjThiQambRoeBhCA+9FDCMhwMwVdxwefZ0mrCJt3V42g==
X-Received: by 2002:a05:6a20:914f:b0:10b:71c:20c5 with SMTP id x15-20020a056a20914f00b0010b071c20c5mr1563673pzc.51.1686044330458;
        Tue, 06 Jun 2023 02:38:50 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902ea0800b001ac8218ddb7sm8048442plg.84.2023.06.06.02.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:38:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] powerpc/64s: Remove support for ELFv1 little endian userspace
Date: Tue,  6 Jun 2023 19:38:32 +1000
Message-Id: <20230606093832.199712-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606093832.199712-1-npiggin@gmail.com>
References: <20230606093832.199712-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ELFv2 was introduced together with little-endian. ELFv1 with LE has
never been a thing. The GNU toolchain can create such a beast, but
anyone doing that is a maniac who needs to be stopped so I consider
this patch a feature.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/elf.h         | 6 ++++++
 arch/powerpc/include/asm/thread_info.h | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/elf.h
index 79f1c480b5eb..a26ca097d032 100644
--- a/arch/powerpc/include/asm/elf.h
+++ b/arch/powerpc/include/asm/elf.h
@@ -12,8 +12,14 @@
 
 /*
  * This is used to ensure we don't load something for the wrong architecture.
+ * 64le only supports ELFv2 64-bit binaries (64be supports v1 and v2).
  */
+#if defined(CONFIG_PPC64) && defined(CONFIG_CPU_LITTLE_ENDIAN)
+#define elf_check_arch(x) (((x)->e_machine == ELF_ARCH) && \
+			   (((x)->e_flags & 0x3) == 0x2))
+#else
 #define elf_check_arch(x) ((x)->e_machine == ELF_ARCH)
+#endif
 #define compat_elf_check_arch(x)	((x)->e_machine == EM_PPC)
 
 #define CORE_DUMP_USE_REGSET
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index bf5dde1a4114..bc5d39a835fe 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -183,9 +183,13 @@ static inline bool test_thread_local_flags(unsigned int flags)
 #define clear_tsk_compat_task(tsk) do { } while (0)
 #endif
 
-#if defined(CONFIG_PPC64)
+#ifdef CONFIG_PPC64
+#ifdef CONFIG_CPU_BIG_ENDIAN
 #define is_elf2_task() (test_thread_flag(TIF_ELF2ABI))
 #else
+#define is_elf2_task() (1)
+#endif
+#else
 #define is_elf2_task() (0)
 #endif
 
-- 
2.40.1

