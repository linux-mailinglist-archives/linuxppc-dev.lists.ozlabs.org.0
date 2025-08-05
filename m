Return-Path: <linuxppc-dev+bounces-10659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A8CB1B66F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:27:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxG2b0GxFz3bnc;
	Wed,  6 Aug 2025 00:26:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754404007;
	cv=none; b=Oc4LkBG6k0++R/e0MxfJUEDyzHo5s4YZ7tB3/NeJyGtenUHZGKSW1LE0GlpE+6NyB+fwGRcdqBXGgVVZAcwy7Lh2HJUnBCxA7KtytvggQ4qocjRK4SnGIy6CQZrog4JSzRlMWNUkB0M4ktVjQJCTLxw08xrq0ocz9PJBuT2pDX7G2xTQ0/wy7vpWK9acihDrtxpNqPQjia+VrQBehOJfEwVNUWCgUmbPTiLBSnvTATkhp8ZGjbHa7H8vuPvUwXA2ivmGDfXGEeRigpnz//J5TGaYKvY5JpxBepaFHqz+Ih4Np7WTyGpPYbAc2FwPT0jRAmjhgbKv8PSSIoShSnVKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754404007; c=relaxed/relaxed;
	bh=Pl3xBvbmXoSLjMyBTIqb051cyNY5upcj2qfXScxGTG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ju0qKd87/HqtSyOfNU6DqVnpjyFa8/WjWFLwTkfcU+2+BlENi4kSHSiu3ckY/RJUohhsSm3Bz5K9Rg/8nSdXr+HmD0NGLHuVP0yfz45ZHFfwGAtovm1LG8Yrd8w4pO7dV1fO1t0LSnI8enXc6Oz5Zggd5atCA1TangjgYeFtR3EFbpSqBACYSZBRfrZTup99pM44J+HGzcgPnuPl4goO1w3tvRVxvtax8LTotKs6YPkpOlRSSSm0UHS/iqFADFZkbCp2Tl5zvXDMkAX9Rk8ssEAg9uKuzX9LhlWzQ/qys3FLFs2+Eom2z4yzfIpKc/k2XWs0LXOwTzfTWwXVHSvlIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JN7upXDN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JN7upXDN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxG2Y6fJvz3bmS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:26:45 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55b8736b1d6so6108228e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 07:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754404003; x=1755008803; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pl3xBvbmXoSLjMyBTIqb051cyNY5upcj2qfXScxGTG8=;
        b=JN7upXDNvCCHKrKrbuah+42f3gm/JMQzed9YCaP58UcUAt5AOdWoWMxoX6X4viLl/Y
         KjffkCrYbdIxtQ9PT1eKhwY/z8g8WDRl1mJhjXQT970wYWsXE3IC6UEfoRyGPtg2faPl
         WNIDzJNeyMIY50Vvd1Gh5OX7Yhn+v0iF6ouygw6B5lckyFdDx2k+Hgm5Lm1Kp952xVj0
         FRT3tT73i/ynf2Atpb9TNzDZ4gqH0+I/GiDLg5L9aNFYB2/+/H+jRIJ4G4rYLFnPpET8
         /I08MP1Z/xMijImxBnozn/Dpa/cNT+jiV7YbV6pnZBZ3s1bCM32Hs8Cxtm12aUtlsiSO
         8yJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754404003; x=1755008803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pl3xBvbmXoSLjMyBTIqb051cyNY5upcj2qfXScxGTG8=;
        b=LuXMapTxOmGbXPZcsgQhF7VarpKTF/nlz1vMIHIVit6dvM5mnIR0lX7McTwthgf4Qz
         sbcvp79T2PC98MQRlANk+WjdnJHCRL/mZlLeI4WHQdMrpbcsHadbdXqKWM0GLX5K5WcK
         VZ7YS5IvSixok5ieEJbwFZyHQbngoyO1EPiQqtIdpWD78RZWp5tdrgPKZwPVybmgUKDf
         Or4sz1NaNOlKVNqqnTfOr6equagERJQXxn9i2TR78Coc152TdS/NTbUYSM6ArWZpErv2
         IS5ukzeUCglnskbOVzM1yWpNyOjxp1g6buESY/Rv9GfxtpCyjeTGJTiojEhr1lSxIzU7
         hnUg==
X-Forwarded-Encrypted: i=1; AJvYcCUOElWfBeVJpY+VWgOWqEir3YZpz+0ufYwmaZ4lg/KxUhI3Wy+RKVWSRgCylVLojb3QZ36MQmpB/nahNw4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwNrKKjg73JkvCfY0cubos3r4udmRCS4IS0HFjyCmkkQoghPCRw
	4evJOe9sjApEulKWr0GC013DC2usX/UfE8FoxET601qwGPikgwzISHhU
X-Gm-Gg: ASbGncvGwPzqCXPgn7zVEMM9cGj1rpE9ycuA+UMRZps4virfLPvzcjhd2P8qfojMxWV
	r4qcQL52BaSnFwdQMzPZCSRD/VFo1eF17C4cF8XinJsPMzBBLHvtYAoY6Vj/QlxFGCwwp8VDvsI
	j9GIIDdEv/iEoiepI7ndjXg9kuYrXDaF+peM4nyCTe+aZlaP5Co6T+vHuvgmVhicL+s0MZgmqd4
	es1ZAuwI24q6vkTZ4epu8MrrmLyaDtYGD0bBCw4i2fTrvPG8HH8BI6cBXVTg7YkSC1c4xtAi++/
	iL09xPqG+PLD0wJgmWMFuMnXsxc7GE6XuN+BirmoDigB/rhiZfPhUzZpZmorJexlUOUDLBmdBRd
	rcnmp3lpVfMgZSIS0d3nZrokNX5b+AEGOhSt9wNWFkaHN+dcr6OCbTRd6hBrDVyXxYC4YRg==
X-Google-Smtp-Source: AGHT+IGVveeqR4Cp++JX2gYkKHclckYO0JnGR061NIJDmvQ7jhspWng2d4EVRtNzF0MnSLGE8X42Dw==
X-Received: by 2002:a05:6512:ba8:b0:55b:8e3e:2be6 with SMTP id 2adb3069b0e04-55b97b2971dmr4253074e87.24.1754404002655;
        Tue, 05 Aug 2025 07:26:42 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:42 -0700 (PDT)
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
Subject: [PATCH v4 6/9] kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
Date: Tue,  5 Aug 2025 19:26:19 +0500
Message-Id: <20250805142622.560992-7-snovitoll@gmail.com>
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

UserMode Linux needs deferred KASAN initialization as it has a custom
kasan_arch_is_ready() implementation that tracks shadow memory readiness
via the kasan_um_is_ready flag.

As it's explained in commit 5b301409e8bc("UML: add support for KASAN
under x86_64"), if CONFIG_STATIC_LINK=y, then it works only with
CONFIG_KASAN_OUTLINE instrumentation.

Calling kasan_init_generic() in the end of kasan_init() like in other
arch does not work for UML as kasan_init() is called way before
main()->linux_main(). It produces the SEGFAULT in:
kasan_init()
	kasan_init_generic
		kasan_enable
		static_key_enable
			STATIC_KEY_CHECK_USE
...
<kasan_init+173>    movabs r9, kasan_flag_enabled
<kasan_init+183>    movabs r8, __func__.2
<kasan_init+193>    movabs rcx, 0x60a04540
<kasan_init+203>    movabs rdi, 0x60a045a0
<kasan_init+213>    movabs r10, warn_slowpath_fmt
	 WARN_ON_ONCE("static key '%pS' used before call to jump_label_init()")
<kasan_init+226>    movabs r12, kasan_flag_enabled

That's why we need to call kasan_init_generic() which enables the
static flag after jump_label_init(). The earliest available place
is arch_mm_preinit().

kasan_init()
main()
	start_kernel
		setup_arch
		jump_label_init
		...
		mm_core_init
			arch_mm_preinit
				kasan_init_generic()

PowerPC, for example, has kasan_late_init() in arch_mm_preinit().
Though there is no static key enabling there, but it should be the best
place to enable KASAN "fully".

Verified with defconfig, enabling KASAN.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v4:
- Addressed the issue in UML arch, where kasan_init_generic() is
  called before jump_label_init() (Andrey Ryabinin)
---
 arch/um/Kconfig             |  1 +
 arch/um/include/asm/kasan.h |  5 -----
 arch/um/kernel/mem.c        | 12 +++++++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 9083bfdb773..8d14c8fc2cd 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -5,6 +5,7 @@ menu "UML-specific options"
 config UML
 	bool
 	default y
+	select ARCH_DEFER_KASAN
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CPU_FINALIZE_INIT
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
index 76bec7de81b..704a26211ed 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -21,10 +21,10 @@
 #include <os.h>
 #include <um_malloc.h>
 #include <linux/sched/task.h>
+#include <linux/kasan.h>
 
 #ifdef CONFIG_KASAN
-int kasan_um_is_ready;
-void kasan_init(void)
+void __init kasan_init(void)
 {
 	/*
 	 * kasan_map_memory will map all of the required address space and
@@ -32,7 +32,10 @@ void kasan_init(void)
 	 */
 	kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
 	init_task.kasan_depth = 0;
-	kasan_um_is_ready = true;
+	/* Since kasan_init() is called before main(),
+	 * KASAN is initialized but the enablement is deferred after
+	 * jump_label_init(). See arch_mm_preinit().
+	 */
 }
 
 static void (*kasan_init_ptr)(void)
@@ -58,6 +61,9 @@ static unsigned long brk_end;
 
 void __init arch_mm_preinit(void)
 {
+	/* Safe to call after jump_label_init(). Enables KASAN. */
+	kasan_init_generic();
+
 	/* clear the zero-page */
 	memset(empty_zero_page, 0, PAGE_SIZE);
 
-- 
2.34.1


