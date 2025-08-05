Return-Path: <linuxppc-dev+bounces-10656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D696B1B66B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:26:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxG2S1Fjfz3bnx;
	Wed,  6 Aug 2025 00:26:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754404000;
	cv=none; b=RS+3KHEngPk+eGra64JWliNEZjs8hYNMERLcFTUj1XdJiVwI6Ge6+tZSs/BtPixp9r9ivijSuHfsstYpoq0sKRYAZxU0qcFakBhU8LqJIxd6/S5kyDyFlBbbJP9JaEReHV/WVv/3ealRzV/KLB2WYiWIk48A7+zlsG1quX70xIN31wi+OKOpkOWAmrufOmSR1dJKVgBp40mz/BmWhvDujsXv0ION2RjaWufTaFuqNV1tW8OiaCb55iV94SPL9UuqcC9M9eP5cLH8Nbq6+R3HewQaJlzP6W2Ob9Vkbq0HaBKIPDN/UcLGXSknAz3Fx2K6/ebXz4f5C9g+xPb20HM+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754404000; c=relaxed/relaxed;
	bh=vUUI2xKZlk5/jtNpSyx53EShjk/LU4/amvgKSzwK4wM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NBqd6Y7iuw6H5aCcN2lVQ6opJON6aFAfDmjzUlNF8euZbz5swJUzUAtk+YAZ/b1ij9qGXXCaBNnoy/7NQWwjSKfceTHOPEgmp4zr+vdNRHzgqceQIq2wKHjA5o88OAMCWhsFDNQJgEzP4HKBg+PoTGcA8/nFanrP4ETykDqb5+zX8yhUrakQESwOsMvYHgFGsCRHZoQxLoUtRdgKSkPMvgK0AiOIaxs1kaerlCmSR/cbBCOcCU3MkpPA+kAxy0JCjX81adKW7VyGIs69HPioDJ0jsJOBvC8J9bcGBoukC2kGy4ug7d+kItnt83FtVNcM3ATs6ZlziHvlisdJBEndNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bvILVRek; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bvILVRek;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxG2R2552z3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:26:39 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55b9375d703so4853268e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754403996; x=1755008796; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUUI2xKZlk5/jtNpSyx53EShjk/LU4/amvgKSzwK4wM=;
        b=bvILVRek30oJdDbZX5GxBUyUUzvrGCLbJZImOF+59eG2vgEdkUY0LG/rKaA+vLWRcB
         29YuvqvYNynJFqyubVd7Q6eW2CKvV9dZT7WyqtNgjWg658/qgjGuhRTlQ4oK+p6HJxHm
         h7u5Ol1XVh8iUAZjqSg91/AZVBlNN2iRFG1FPX3khfzB2nlb9bgOfIls+6XHbA0LOZ7j
         qgFSpbnIHwQnFqFsfyw5ssjYvxe14t7C/mR1MSyGaU9W3R9WLyKttRYE4DzgHUUHOWAG
         nryCZeEJBGR6KzTKn/FSdTUVJ41+tfXStJbQxXzKrwijdiL4TRLjkFcH+mcix6wYI0Rl
         xf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403996; x=1755008796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUUI2xKZlk5/jtNpSyx53EShjk/LU4/amvgKSzwK4wM=;
        b=KCdLMTJXbi28EemR98a9Itac9d81P7sF10jRBaXtfKDRyXOiLMItM7Wzvyb0CFboqI
         PiYBqHZY6hXF5FPhvrWpBpLweLRgYWsrBEO6OGV9g1Jt7MZLAXoiWp0vr4raIwjetNU7
         1e2TPgvP0kKLH7q1xz3ufn0Y2qyDISKumavIzSLYvD1KKeZ+viTSZqS7NindtJjXZzIt
         1PusOuWAQJqLcrRt2s6wwCj5sWraWEzUf+EexqK6NA0ODt+Yt5qGzWOYDbCirjASOZMR
         DBzoUvto0H/2GQPFQ+wZ8Uiuc5BIQdf7FQgVAkHfwJ6B4sI+RE8OiKPA5Nytlb3aX/BU
         f7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCW23Ke1Hjk/IHmFU/iHXxP3AVDq3Ct650mgXdpwhGt5nkfNYED4TFMJGPg6eg98RKSAtK2JAaITQK1xR0k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyIoNMa0IGsF6UTJ6SXitGLHE+q7nAJHE5yGsmuR4CQtouxew6D
	A83YQFHNi+Qd7ODfTtJF5rQolsj6A+U4JDXsaGvcijg+K0QE2GsH1cGG
X-Gm-Gg: ASbGncu3uM1fWGfA7/2uNN0pPWn5gjoIzz56HqpHKTTlw+BkGe3OmyuWA3k2OJ6zpEv
	QjXyzy/fy2FCTZRmJTVairrwfHBz0sFAEbQQFl89jndlDTWihrgPd2E17OAUJwTN52v2TY2Z5VJ
	Imw8sshfKZLOjj2yK667wxugKKJR8UPL6aIXGJfOpzCEzLBjKz0SZ7u6p9hKmn/3RFgAnV+ujCI
	fnhA7rV1nNWPHnWwjE+pshfcJEeirLN3rZrvvI720q+CMn52RyZkEnE/Q/0Tz0eV4mGTRlsdJm3
	KcHxnk1CkamC+6y3JQdRu8YoVEGOsceVmI3SjkYVfF6C3aaaAC1fQvACfCrQ0PBI3vsRtK0wlUt
	EGBXP/DbWtFsqWoMMwXiG3ygv6rF0fZa2ydI5l0qY6fClQAoRpxFC/Em5pl+STkWc+badSw==
X-Google-Smtp-Source: AGHT+IEuyOphkquEE1TcD7oJ1sEAoZRW6geJFjdlevxIlBKJ8sCVOgd5wEIObFEm35WGh0DuMN4+1Q==
X-Received: by 2002:a05:6512:228a:b0:55c:ac98:edb6 with SMTP id 2adb3069b0e04-55cac98f040mr114526e87.12.1754403995715;
        Tue, 05 Aug 2025 07:26:35 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:35 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	trishalfonso@google.com,
	davidgow@google.com
Cc: glider@google.com,
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
Subject: [PATCH v4 3/9] kasan/arm,arm64: call kasan_init_generic in kasan_init
Date: Tue,  5 Aug 2025 19:26:16 +0500
Message-Id: <20250805142622.560992-4-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805142622.560992-1-snovitoll@gmail.com>
References: <20250805142622.560992-1-snovitoll@gmail.com>
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

Call kasan_init_generic() which handles Generic KASAN initialization.
Since arm64 doesn't select ARCH_DEFER_KASAN, this will be a no-op for
the runtime flag but will print the initialization banner.

For SW_TAGS and HW_TAGS modes, their respective init functions will
handle the flag enabling.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/arm/mm/kasan_init.c   | 2 +-
 arch/arm64/mm/kasan_init.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index 111d4f70313..c6625e808bf 100644
--- a/arch/arm/mm/kasan_init.c
+++ b/arch/arm/mm/kasan_init.c
@@ -300,6 +300,6 @@ void __init kasan_init(void)
 	local_flush_tlb_all();
 
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
-	pr_info("Kernel address sanitizer initialized\n");
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 }
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index d541ce45dae..abeb81bf6eb 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -399,14 +399,12 @@ void __init kasan_init(void)
 {
 	kasan_init_shadow();
 	kasan_init_depth();
-#if defined(CONFIG_KASAN_GENERIC)
+	kasan_init_generic();
 	/*
 	 * Generic KASAN is now fully initialized.
 	 * Software and Hardware Tag-Based modes still require
 	 * kasan_init_sw_tags() and kasan_init_hw_tags() correspondingly.
 	 */
-	pr_info("KernelAddressSanitizer initialized (generic)\n");
-#endif
 }
 
 #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
-- 
2.34.1


