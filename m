Return-Path: <linuxppc-dev+bounces-9831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777C4AEA2A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:33:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjPb01qCz3bjG;
	Fri, 27 Jun 2025 01:33:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::231"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951986;
	cv=none; b=janPeFmWeD02BrcKJlQYhfttQp+rJ0p7YljUgvp8vM5WjK5GLVnv2QAtEGqodMI+CBykAG6CA9YxuxT7hyJQVVHfRgwS+yeKsbf1WjspprPfR7U8lm4KrmT11PdQKun5q305lDVDrq1vM9FTDWqI98UyAFqbtKqCMl7ztVS7cOZOK0KOIBw3pk/B8UNb8YS9SooUIShzSstGcU4e2nOkLpRGTNRD4XCHiJC86aRGQC1fTB/0zL0PGIDzvgBVvDomWphbNMYLFaHJodD3f/b4rNQrVMF1Vy+V1EVkdOGjiPbRGSVyYAE1Z5d4a9ItxD25d8YNhU0NYDWTELmWpjfiOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951986; c=relaxed/relaxed;
	bh=gODL4ePLEui+bgBCtMqPW0nf/RnbL8ytBUu0XwvP9Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Caw7Y+huQQFmXq0QivYh1WGQ8pzYIh3cjv1NQ/1doCkGr5KyM5TqX164fbz21ixu4fNfbyGD0a98Dsai9q30/cesHjChN/XMgOyONoM9VvIe4iBUit0btBXbUlRmMyoveWx9FbOA5gVQhbT1+7bDOKLlDsk7FEHIBQiUZ0xBiRXQBUABrGyP5G2mg/fsZzBbkXILyQurRU3eTVH5n0u83LQ9/zh14nIcSJL0zqk/NKnQvSITiqN/Q0ClFfCFAZ/IpkSPMRYFyPo06ctfdqLrqWTcN/SFa2BbvKvLive7995BaW51JfqvmrT/AswaywJiuPFtUAhGqEVqROvtFbcoyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gUgKvJB5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gUgKvJB5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjPZ0YCSz3bNt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:33:05 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-32b855b468bso13043181fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951983; x=1751556783; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gODL4ePLEui+bgBCtMqPW0nf/RnbL8ytBUu0XwvP9Tc=;
        b=gUgKvJB5BR3Qg7Lh/Vc3775zx6K9TCkAKA1TVCatWk+KZPwszA7HHq6O7fOqLTTo6y
         QFCcyee1RsXlK6wyPhYbS4zz3ZnVg3pUi4aWV8E5E4SAMevwKzSvqOkHkC1jWEwGAFne
         OsUGTk8v14ONSu7tpBM6COhUF10GNO2MQfqTNLvZbiYXcVvEh/hfrFcfzuniHv0NYuVQ
         bFAhRZREof7wMtgTjsCTaQB0fuFfSJ8UpP8lCeInEBOsCYiRVZ7/IiCgbVg/JJ5I2WCx
         zeAmhBWXpJzpqm81C3jTSsxKK3VkSyX9ArneZyxEMV6gV6K5SCi85YPwKAxDa2DGshVm
         zmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951983; x=1751556783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gODL4ePLEui+bgBCtMqPW0nf/RnbL8ytBUu0XwvP9Tc=;
        b=BP2f6FB81jVEMwDz9bsTu6VV4ACChixTYv3iJTPZWT1ki6FCIyqvEYfGdO6GDtzwOX
         TdkRHkEihJ0JBTAPOgRS/8E9OFTiRMoMAA5lbNoRCna9mWe8K5kjzaZGCCEXbJAT600e
         pU0IRYV2KdO+VTy6r1KavniW5/guLs1DpETE+tBBoJM4LZxOZlIbqoZ9LDG0GW5y9h3u
         UWJSxneNiYhzym+oHsXl+NcnhrNwQRAVhwSFirYV/NRJBWe6RdEklFXE1TdrQjlMXeEe
         biRvjmgVVchlPcdWUa76iU0M+gd2fXA34IxEMFeDksRjhJOsgyyBPzqfDP588LP+5q9U
         Hrhw==
X-Forwarded-Encrypted: i=1; AJvYcCVvpkK88Z5gmhJ2QYPjFI99AVhbcVm8Y2pk1fXzQIc2veg5QYs1aAuahapNchQmQROeMZ/9RJZ7J7NVSAo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwG785tuMpZUT0jY8YO9Ao0O52zL05HaosGZYMIWfZNzPTo59rG
	3EaDVse9U4Z/eJPTIZu5gwYNHHWjgELi2GP7yIgkv5JcSc7cQh/xqVda
X-Gm-Gg: ASbGnctoW58OVLez7iIQc0daOu7kXQON2fIOlUj3An9Y75vpAL9gcSTGoD7KN5V97py
	Gkpf1mW8XzszdRDqjiucH53mALEeznwhR39YCyMhZYDU1fvlu9/R7FVpKr1XuNPDesN88qfSh+d
	J/jg6xjmIvtaNI5wM2BFczuQkV6xM8w1LalxF1YSP1g909EiaOizRL9ZNNOn1kx8kbeDwi2y3wO
	vtObUE//7o3FUgQmWZkV8o1oOlJ73UpRw6bw6dcXnM2NY0Frjj24/tU4aED7/bTbON2TWlhEOwM
	d5uqCBMvfJlbcX5K+2dscrW3nIbyv0YWbJyIurlG8Jz/nt1MTW80Po3wpaiLZCQ/Up4sRwKdhrn
	UUKtIbar8FJjlpHbDVK2EzY7tZlbeqw==
X-Google-Smtp-Source: AGHT+IFtokin1pGKu8SGoAO+egXDXmR37EPc9QSc1BH26CQqVKh0GZxc7OuPefULxYvAjMzQKpLkUQ==
X-Received: by 2002:a05:6512:318f:b0:553:ae47:6856 with SMTP id 2adb3069b0e04-5550b474cafmr117706e87.10.1750951982600;
        Thu, 26 Jun 2025 08:33:02 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:33:02 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 09/11] kasan/powerpc: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:45 +0500
Message-Id: <20250626153147.145312-10-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
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

Call kasan_init_generic() which enables the static flag
to mark generic KASAN initialized, otherwise it's an inline stub.
Also prints the banner from the single place.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Fixes: 55d77bae7342 ("kasan: fix Oops due to missing calls to kasan_arch_is_ready()")
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v2:
- Add kasan_init_generic() in other kasan_init() calls:
	arch/powerpc/mm/kasan/init_32.c
	arch/powerpc/mm/kasan/init_book3e_64.c
- Add back `#ifdef CONFIG_KASAN` deleted in v1
---
 arch/powerpc/include/asm/kasan.h       | 13 -------------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +-----
 4 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index b5bbb94c51f..73466d3ff30 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -53,19 +53,6 @@
 #endif
 
 #ifdef CONFIG_KASAN
-#ifdef CONFIG_PPC_BOOK3S_64
-DECLARE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
-static __always_inline bool kasan_arch_is_ready(void)
-{
-	if (static_branch_likely(&powerpc_kasan_enabled_key))
-		return true;
-	return false;
-}
-
-#define kasan_arch_is_ready kasan_arch_is_ready
-#endif
-
 void kasan_early_init(void);
 void kasan_mmu_init(void);
 void kasan_init(void);
diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_32.c
index 03666d790a5..1d083597464 100644
--- a/arch/powerpc/mm/kasan/init_32.c
+++ b/arch/powerpc/mm/kasan/init_32.c
@@ -165,7 +165,7 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KASAN init done\n");
+	kasan_init_generic();
 }
 
 void __init kasan_late_init(void)
diff --git a/arch/powerpc/mm/kasan/init_book3e_64.c b/arch/powerpc/mm/kasan/init_book3e_64.c
index 60c78aac0f6..0d3a73d6d4b 100644
--- a/arch/powerpc/mm/kasan/init_book3e_64.c
+++ b/arch/powerpc/mm/kasan/init_book3e_64.c
@@ -127,7 +127,7 @@ void __init kasan_init(void)
 
 	/* Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KASAN init done\n");
+	kasan_init_generic();
 }
 
 void __init kasan_late_init(void) { }
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index 7d959544c07..dcafa641804 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -19,8 +19,6 @@
 #include <linux/memblock.h>
 #include <asm/pgalloc.h>
 
-DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
 static void __init kasan_init_phys_region(void *start, void *end)
 {
 	unsigned long k_start, k_end, k_cur;
@@ -92,11 +90,9 @@ void __init kasan_init(void)
 	 */
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
 
-	static_branch_inc(&powerpc_kasan_enabled_key);
-
 	/* Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KASAN init done\n");
+	kasan_init_generic();
 }
 
 void __init kasan_early_init(void) { }
-- 
2.34.1


