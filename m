Return-Path: <linuxppc-dev+bounces-10298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEB5B08F50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:28:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZz004QPz30RK;
	Fri, 18 Jul 2025 00:28:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762491;
	cv=none; b=dFOPW5Ud3dTURnloqRSBbHO19pLf8YIycwMTEFujJHU0iS3lF/v60PAidHbZ2ypwG4W6nNUGHWo5ecvb7Ey7TQkFAb2vXiihhkWroGdveXi5ZL3dYf57Yh0Zp2/BLcMJa9VIFEUcRTmm2fQJDpw1XYjXHeyXzO2bmkH3oNOX/zLRscBgot6piHo26oRNe5K30wNQNmpd3A9qSetKKvhHNyYpBc9xW2vmg88rbhJwHfNyuWflAhAYlSRP2CkLA5o+PWMpIxirqUmlE/QOgD/A0Z0n08ji7+tZEdUMRkzeHnNWoIkH47huj/v/M+gH2E01crmaQuusttpFjgp46SBr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762491; c=relaxed/relaxed;
	bh=FVh/EioNiM2ei5SEPjKOjjcyR398WOKR4A8RtqUhr5I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OCBrrtXaSQh8JwI0BICjLRjHZwR8DW6X0D1MIoWDwtN8/CceeEkf2r9KGuOASfOHJYoQUCWSefEVjjs80GKWPALcJjPwWMSWuN/8v+Ba3o5WzQWBxqirNmfsbOQ7YUb+jpa72uDd7C7MTg0O7Ic4sjP30+VIf6s/jc8nbHAGejsJA8EfIIJI9sEYGbLBMCti4KU4JRfQ8I5KUE4/GI7yk7+osU7lSEcW/nhfgVT8dSCF9LcQbskYajZox5xhh0Kzq8eoXlhp8hqx2mMNq3vO//b5IIDQMS1DISNKwnxdQKJ41/SzE7Pv0aYGceHPlgAdZOMMWoUYtM5sKPxLazueMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W2/jBUpL; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W2/jBUpL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZyz0WQPz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:28:10 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so1339483e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762488; x=1753367288; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVh/EioNiM2ei5SEPjKOjjcyR398WOKR4A8RtqUhr5I=;
        b=W2/jBUpLploOcWMaVxKRG7FHwg4NDJcd6BGHt/4MEtMFCVIBxS3iEDFE1V9/J38V6j
         oN/J068Y5W2uPfXwgw2cTcxNJo/3l0jezrWAdvCNUmtndQx8D8jb42oR/Tt7igD7aUpR
         AbDSN0UDiOdKTXMMXvVp628pzYVRbHzAFoQGDyjToOMnUr00/uR38vUoOjVwhcHU+N8r
         G2j5WSyq+qTqpyhPhoH+ZWSfXjQRqdwx7Yom0rQaiJ8yPiy4NsChsN9iKuUI7wmGjVO8
         oVprG8CK05bGFZUxOSYXZsidJoAX7XmTHYeO3bKeLlp0VdSOoLzAoFh38DSgAZZYlRH/
         hY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762488; x=1753367288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVh/EioNiM2ei5SEPjKOjjcyR398WOKR4A8RtqUhr5I=;
        b=gaJZ4z3C6QjS7XGdVai2HIrl2LwxaWqOB0+BGTtc1Ey54MhLb5wslSNCkUnzQUpkap
         8gTOrrOTeTA00LBOlI/yzjz+gG6I5NnEOm0+ot8hNGKfql6u40aaFM6NptHbbwQ5FMsn
         CnIIfg+xohrq65D+9WrDMpiNqt4UaFPUuS9TBrcDY7NfJ7q57mhoa3jhJIOb+m9TIzN9
         RPe7RcM5hZaxpPRBG7VCezo5H4vATZSkIC0EjYNGwGsmwVNyDks+QnPWxkxnQSfOiVP7
         EgmNUnxYaKiYrdaaHiNUWi8/vDGirDs2h+hhFP3SDGRxRbUvgBLOzkAfmp9dIxk70QiU
         webQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxj5g9MQ8+0pMkJx5QSbqidFaJb1RdbMMrkpBh+cF0tvuh6njaLaeAMV84EngqQBkR4gL6wGan6OWkfIc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy6aP2D9qwPqBaRv/lObJ7t7RyvqbzWqqkjsl4+NgNaPJbRprJD
	sDkLV37EzZiDalpPrjYYXiKAn2sdJH9iE+fM3VQCKBbrccInzMdPYC5p
X-Gm-Gg: ASbGncsX/xXhYRLHU4y5dFHmGB3VMrTJEx4P2Op04daxbt1UC64xWgKIeSnw+oGAH8H
	r3eMtY1hKTOU4p9Dmpa3TSrRaCnU/p3c0uZa8kVScZm56QeFtqVGJF3laJtEI2G/GxNQrmQFzRW
	akgnswIjoL+gxrsCWBRxJTQckBE4tRYvhZXYAm5XKgNocd2CF6MY4eBAfiNL0yKmiK9qosKu6Cz
	PURxPSTrgH9shz3RSYLjlifYELfmojLT2bMoY1E19sE0Cj0+HZo7FmH2ihHicLRQHbxUJ1TyEPY
	p/p3f6NfZ/aocmAZ8D5O/c6j7ZCluIhc+ikVQAfEbAV3dNS5o+fbxp0PPKPIyver+uiB2e7CQV0
	JH2yLxjsPC3djM6yWcciMAQcEnKM/84cipJWW/AedcX3HQvsP9oViUwlChXaMDXFZD8dY
X-Google-Smtp-Source: AGHT+IGxLJhvaMCe+spMW+LE9A946Qy8DaLWnnJJyiUxPC1zU6fBVPq5lHa93m7Tf0WxYYCemaAtrQ==
X-Received: by 2002:a05:6512:611:10b0:553:2e92:2c98 with SMTP id 2adb3069b0e04-55a2339f4b9mr1702111e87.42.1752762487529;
        Thu, 17 Jul 2025 07:28:07 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:28:06 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org
Cc: ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v3 08/12] kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
Date: Thu, 17 Jul 2025 19:27:28 +0500
Message-Id: <20250717142732.292822-9-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717142732.292822-1-snovitoll@gmail.com>
References: <20250717142732.292822-1-snovitoll@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

UserMode Linux needs deferred KASAN initialization as it has a custom
kasan_arch_is_ready() implementation that tracks shadow memory readiness
via the kasan_um_is_ready flag.

Select ARCH_DEFER_KASAN to enable the unified static key mechanism
for runtime KASAN control. Call kasan_init_generic() which handles
Generic KASAN initialization and enables the static key.

Delete the key kasan_um_is_ready in favor of the unified kasan_enabled()
interface.

Note that kasan_init_generic has __init macro, which is called by
kasan_init() which is not marked with __init in arch/um code.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v3:
- Added CONFIG_ARCH_DEFER_KASAN selection for proper runtime control
---
 arch/um/Kconfig             | 1 +
 arch/um/include/asm/kasan.h | 5 -----
 arch/um/kernel/mem.c        | 4 ++--
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index f08e8a7fac9..fd6d78bba52 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -8,6 +8,7 @@ config UML
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_FORTIFY_SOURCE
+	select ARCH_DEFER_KASAN
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_STRNCPY_FROM_USER
diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
index f97bb1f7b85..81bcdc0f962 100644
--- a/arch/um/include/asm/kasan.h
+++ b/arch/um/include/asm/kasan.h
@@ -24,11 +24,6 @@
 
 #ifdef CONFIG_KASAN
 void kasan_init(void);
-extern int kasan_um_is_ready;
-
-#ifdef CONFIG_STATIC_LINK
-#define kasan_arch_is_ready() (kasan_um_is_ready)
-#endif
 #else
 static inline void kasan_init(void) { }
 #endif /* CONFIG_KASAN */
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index 76bec7de81b..058cb70e330 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -21,9 +21,9 @@
 #include <os.h>
 #include <um_malloc.h>
 #include <linux/sched/task.h>
+#include <linux/kasan.h>
 
 #ifdef CONFIG_KASAN
-int kasan_um_is_ready;
 void kasan_init(void)
 {
 	/*
@@ -32,7 +32,7 @@ void kasan_init(void)
 	 */
 	kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
 	init_task.kasan_depth = 0;
-	kasan_um_is_ready = true;
+	kasan_init_generic();
 }
 
 static void (*kasan_init_ptr)(void)
-- 
2.34.1


