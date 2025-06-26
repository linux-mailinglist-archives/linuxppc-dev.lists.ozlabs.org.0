Return-Path: <linuxppc-dev+bounces-9823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37DAEA292
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjNb35Yvz30VR;
	Fri, 27 Jun 2025 01:32:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::233"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951935;
	cv=none; b=cWqDPHLvmZxzD0scR13TSiY3R7CshYApXNjp7Ih9fCiaEzE9oka1QVQMCExo94ap0lGEiYU2BrPIx37ZsjVwNdoegTxtgmzk0Ne5/gfeQazSbzMrhPkZGlJ61xAKWcMEUd1cpw7LjoV99VmNgTpwwD4NuhBpgARrmdLb/E1PYr44/pN97kEeg4+a8UB6Mzld9oX8P+Y8Cbk5b4BvKM05l7+c33fQ5qtdi3wgnqx+25OPgBjWz4/LLFGb674hO3KJD6MAzK5NtYEMYmzjKsASWtN1+unRW8uGa3nwDvbCRWNHBvbiE9X2eE9pwQFgOXLMzt7XhVu6beHZoVqFw8h4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951935; c=relaxed/relaxed;
	bh=8WWyylL/OQDZN+BQlllp9O148iIrISnZhKRdMW4Il1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jCmWpE5CPxvJQSLzJ/f9jo9vF3W8D5xaSZXH605pAa/Ji3D7hQ/WEmgz3ZZqDt38oy6vd8zadPpfy94NMpDp/6J2yEIOlpVJd938Op3TeHs8eKtbwsmF0RpmPrEOw+bHbXW6y+VUHkhBx54zBuSji5Ki8sZBMr22rzhW9bQjD9DvQgkeaDWrZzj47IOS0qmatdAgdh3pU0uOhrSf54mxVf9oSvKcJcA+rz7F7s+zIje5DJHS0ekItA2iBWZzUOIEW6EoxFqAvqVUXcDYdo5LUB5rs9LpwZxOGvbv0fCTuIOiFAWXGbPu8HGXMGNB8oAF6j5QfazZEyq6MX0e2dBwbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QbFUZARX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QbFUZARX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjNZ2jtHz30Pg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:32:14 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso11702751fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951931; x=1751556731; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WWyylL/OQDZN+BQlllp9O148iIrISnZhKRdMW4Il1I=;
        b=QbFUZARXwzHIRcUKQG0xnVHYrE2r9aIUQ4WVh6uxX33F6rrO1Uo5mFpCCLErW6jGX9
         6v0voGNwrcvKM86EvvSxjNknE1Vv65x916AniwwUlfVirKRj2lHr8xKd3DL7pZl1Wz0Q
         aIlqdAykDlS1V3gJEGBsuCO6v4KwR9Ub4vmRemza28xpQQDnc24xYhnXZDrQ0GRfxkKV
         to40MXGvrv9RuzcydaDmbBS3Z3KXBOd2Ze7PIbxd1WYRz3cmaFtkhe3U/3CZXr+ox1+M
         lls0s15LswlarJPssBj7EyLVE86mC5/dJisVrmgEXz4vZeuxeqm+qHgGAu6y+tBrL/wN
         tYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951931; x=1751556731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WWyylL/OQDZN+BQlllp9O148iIrISnZhKRdMW4Il1I=;
        b=u2lypQIwJt/XWStyc4wer4A6hQHHg8v1d4aeHCAD32i2Eg1WOeGHdjMu5YC1wuUtZ5
         udTXq73G/FkLAPzAJH5WleIjbXCrtSpcfXxpN+HqWXeciB/44/01T+Vvu2DiVQPtS9Gd
         QSbtX5+9ARx5BY4PtMtCR7mJQYgH7mwrFt932sHcZmbet+YdIUI2ZtJJlputRclqp/iu
         Zk3HjG2bro9gxfSsSGyfP0RNv3XdQosGGTma9+jKzzmmJQoB98k4JYmS5b4RpVOfEfQo
         CNEr2/7sCAn8BPrS0VOLxCaY8YPtcQ04KBfM56v3djCSYm9ajj/HImXToMpMYL83lYtK
         2e8g==
X-Forwarded-Encrypted: i=1; AJvYcCVvhfW6hVAzr7fpFdIWIzBTHmTX2+f7AVFlGMCzG98tKAEeBbonCc/pWHzKQbg6JwHp73x5oqU8A9X7jQc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyYjSiFMEwszhtYBJdFkxHidASmuMWRifyJhAcellOC4sLRpGAY
	CWPwGxjaoDjGKHRMjhA10wusbmLhAfVU3DvNjqElGbNZ4v8kXMchKMks
X-Gm-Gg: ASbGncseOLMZgXmMEvBrGZxglT4Gm1106AxkoP+3AalJharUIM809nM9IrnpSHdQlYK
	rqrcu9Qe9ie/OwwyL6Xkojb7jmiAlwCxmsY2gb48CpDAfAw0Z2rfutRgiBIVk3oNBhobvQMa1iU
	Mf5YMC0Cnea2JLJjjaIgj4tc2mOs7gs8umvil6FaD8VTcdPYkvg9W4FQWetqZI+M+dvlLU/I7h6
	cAvtUuhCagZ4jOSlMrGKLimM6SMsUCMjKmzgA1kSWH7sIc+tw601jDgFtGthILX37yhZqZkS4FB
	Q9cd3xDMWeuPWWO2lSjvTHUDsvw3qYyBdt57r46a1XVoUCrcFtdUn09e3Tu0GW4LjigmLQ/TMG4
	ZqvTjsLdQDiPwBDqyFb0EwBvDrwDnBBRy2zGt9tF5
X-Google-Smtp-Source: AGHT+IE9GYxLiOYhxIA5Ev3WJWnszBqvgVmZmVZpoI4KzTn4pH5uj6GPwII6Blv/6T015vTzfPK1pQ==
X-Received: by 2002:a05:6512:b91:b0:553:adf7:e740 with SMTP id 2adb3069b0e04-554fdd1d728mr2765576e87.28.1750951930696;
        Thu, 26 Jun 2025 08:32:10 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:10 -0700 (PDT)
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
Subject: [PATCH v2 01/11] kasan: unify static kasan_flag_enabled across modes
Date: Thu, 26 Jun 2025 20:31:37 +0500
Message-Id: <20250626153147.145312-2-snovitoll@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Historically, the runtime static key kasan_flag_enabled existed only for
CONFIG_KASAN_HW_TAGS mode. Generic and SW_TAGS modes either relied on
architecture-specific kasan_arch_is_ready() implementations or evaluated
KASAN checks unconditionally, leading to code duplication.

This patch unifies the approach by:

1. Moving kasan_flag_enabled declaration under CONFIG_KASAN (all modes)
   instead of only CONFIG_KASAN_HW_TAGS
2. Moving the static key definition to common.c for shared usage
3. Adding kasan_init_generic() function that enables the static key and
   handles initialization for Generic mode
4. Updating SW_TAGS mode to enable the unified static key
5. Removing the duplicate static key definition from HW_TAGS

After this change, all KASAN modes use the same underlying static key
infrastructure. The kasan_enabled() function now provides consistent
runtime enable behavior across Generic, SW_TAGS, and HW_TAGS modes.

This maintains a backward compatibility - existing architecture code
continues to work unchanged, but now benefits from the unified runtime
control mechanism. The architecture-specific kasan_arch_is_ready()
implementations can be gradually replaced with calls to the new
kasan_init_generic() function.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 include/linux/kasan-enabled.h | 10 ++++++++--
 include/linux/kasan.h         |  6 ++++++
 mm/kasan/common.c             |  7 +++++++
 mm/kasan/generic.c            | 11 +++++++++++
 mm/kasan/hw_tags.c            |  7 -------
 mm/kasan/sw_tags.c            |  2 ++
 6 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 6f612d69ea0..2b1351c30c6 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -4,9 +4,15 @@
 
 #include <linux/static_key.h>
 
-#ifdef CONFIG_KASAN_HW_TAGS
-
+#ifdef CONFIG_KASAN
+/*
+ * Global runtime flag. Starts ‘false’; switched to ‘true’ by
+ * the appropriate kasan_init_*() once KASAN is fully initialized.
+ */
 DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
+#endif
+
+#ifdef CONFIG_KASAN_HW_TAGS
 
 static __always_inline bool kasan_enabled(void)
 {
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 890011071f2..51a8293d1af 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -543,6 +543,12 @@ void kasan_report_async(void);
 
 #endif /* CONFIG_KASAN_HW_TAGS */
 
+#ifdef CONFIG_KASAN_GENERIC
+void __init kasan_init_generic(void);
+#else
+static inline void kasan_init_generic(void) { }
+#endif
+
 #ifdef CONFIG_KASAN_SW_TAGS
 void __init kasan_init_sw_tags(void);
 #else
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index ed4873e18c7..525194da25f 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -32,6 +32,13 @@
 #include "kasan.h"
 #include "../slab.h"
 
+/*
+ * Definition of the unified static key declared in kasan-enabled.h.
+ * This provides consistent runtime enable/disable across all KASAN modes.
+ */
+DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
+EXPORT_SYMBOL(kasan_flag_enabled);
+
 struct slab *kasan_addr_to_slab(const void *addr)
 {
 	if (virt_addr_valid(addr))
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index d54e89f8c3e..32c432df24a 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -36,6 +36,17 @@
 #include "kasan.h"
 #include "../slab.h"
 
+/*
+ * Initialize Generic KASAN and enable runtime checks.
+ * This should be called from arch kasan_init() once shadow memory is ready.
+ */
+void __init kasan_init_generic(void)
+{
+	static_branch_enable(&kasan_flag_enabled);
+
+	pr_info("KernelAddressSanitizer initialized (generic)\n");
+}
+
 /*
  * All functions below always inlined so compiler could
  * perform better optimizations in each of __asan_loadX/__assn_storeX
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index 9a6927394b5..8e819fc4a26 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -45,13 +45,6 @@ static enum kasan_arg kasan_arg __ro_after_init;
 static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
 static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
 
-/*
- * Whether KASAN is enabled at all.
- * The value remains false until KASAN is initialized by kasan_init_hw_tags().
- */
-DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
-EXPORT_SYMBOL(kasan_flag_enabled);
-
 /*
  * Whether the selected mode is synchronous, asynchronous, or asymmetric.
  * Defaults to KASAN_MODE_SYNC.
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index b9382b5b6a3..525bc91e2fc 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -45,6 +45,8 @@ void __init kasan_init_sw_tags(void)
 
 	kasan_init_tags();
 
+	static_branch_enable(&kasan_flag_enabled);
+
 	pr_info("KernelAddressSanitizer initialized (sw-tags, stacktrace=%s)\n",
 		str_on_off(kasan_stack_collection_enabled()));
 }
-- 
2.34.1


