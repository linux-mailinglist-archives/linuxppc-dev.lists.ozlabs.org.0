Return-Path: <linuxppc-dev+bounces-9750-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 015D2AE8558
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:59:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3MP34ckz30Lt;
	Wed, 25 Jun 2025 23:58:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::232"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750845175;
	cv=none; b=A55vkqMXBhFaV1G7Pp/09vAII1R6kzhDdHgIV+IRXCf4FNkijKl7JkfmaJFmBAclzAAwmUVnVOIJ/JpkfevxCm8tvL5+SeX5T2rmvY2xVPRoVWSgUuIJyh0d/aZqt1DirXkOAMtkQ/WD9opdyghx5AJkoR71UL6111s709F7tcPdBwwM0u8tRYY/ug/HmFpLzqnEGmJ0NAmDoqf0VXy2s5fsW5Mrqc4P0zRBQ/3Cqjn+DHB3XvAiH5VhzOKamFFOGIBDlnVIEKoMQbb9s3zHTi8rk1KKDs38Ktug0c5SUISmUHJMMLcmSRWktAcDHTMzOUZ2vMZae9QJgUMJzFjpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750845175; c=relaxed/relaxed;
	bh=U6SFM5Ezspiku172UK6Utmx+P9PfAPP964pKgViV7lo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VKhtLxyTc5ioI9oId3fJ4KmHL8u9N1IJPh8eL2cYVwy3L31QDzZO1OTDTcXMHL3r9M7VwzhVt0z242Wo1ZDUjXCb7jotuYeYlH+8DUPWwsMCaSSoEmSpqmU/Mx6qMaiZpCq6jmEsP/GVptfFzBzVJkS7QcS68HKhKuvskyIGWeNmhdRha0kUT1soYd7ob7Hqssm7mSHanyglmapAp5K9zw/woY1nSM+vLl5sT+FUl/PJAcWzQ0H2tMdk82IsRomCbWCiVw6nTsunDr18JrgxBn3TLKAA0DW5UBBHRlnQjS1oRLyOXcngfoi7TI/HLCTz5o9erIr11wb3325LbD83DA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gTHo+DKe; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gTHo+DKe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRxvV4MQgz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 19:52:54 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-32b3b250621so12816941fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845171; x=1751449971; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6SFM5Ezspiku172UK6Utmx+P9PfAPP964pKgViV7lo=;
        b=gTHo+DKe3R0EPoiPG5iOa3+juR3nhom1JdJO5PeVKrEORYlknutranDR+EKs+vSAq/
         AXhdao2NoO42SHpazUxJMPDG7xidZ3ESsEkY2EZUdWQY7TGxfxCmbPiBlIN/0v+1RdLl
         PM10xsgz6tYv2WPJ3e5E+Tg93drxku55oYsuhsrhXkbhbSTzIiWuzBts96OcGK031N5H
         KOAK27Z9qGHi4umhFN1ZxqZaNlyQexCVYuuwrc6hH2TieC5E6au5yRNY9FE9d6oYKXfU
         PON1Ckh5zGjjVFAfcBmxdDacQ3EC+KeHs5oNjO2VgzxDWlAdTp7SYVczBMgkT3IDvazc
         C7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845171; x=1751449971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6SFM5Ezspiku172UK6Utmx+P9PfAPP964pKgViV7lo=;
        b=GrOPfr87+LRcKH0LjqyeD07NCo14e+Uw6jZTs/eXpeW4nBQO6NR4Ac7jHmWSWoxD3f
         Blx0Ujy3E+AgNrDJDIbKWP2w8n5CsiphObLyI9/PwTyuXJE+W/qJ9FFls9qvJek2gY65
         WIb22tATZ2k2VqQ2DejEWGMVkREanimfdgqduQoDzWBk6XfMq5jFJn1tutUh3/SFp1TD
         hwlS+lcnnUcgpDjs8ec2Ig1k5BgRzrHv6Gm8MWCkiYZfNQ81It8QZSzT68A26IuYvHmz
         +jvFCOHHyjF6A0mTVOYCxgZ+JFzWnpkYUlqhgLw8zsjFb+n6xmi6IJfuEWrLw5imYVCE
         MoyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqEPNvUaaOz4EEWTubmvvX2/412OK/AFrpkVXpt3sKrqm8E2LUw5fWbypSa94eL2pooVygbL4fHwDiBMs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw2i/44Uj3nwqknqDZJ9mSWb6Ha7ArnMfAeMYabSeZUyicN39KU
	u5PviIjhrDC9rLo0QqX4qXV10VEoWX34P0ID+qQx5fkLcASwXuglrPit
X-Gm-Gg: ASbGncsG91tJqqxhGUc2GEHMAd67L6rojiReJ0dc2/BgcNA+18FcrFQI47kbzqvoScO
	jHYPTIMsixhzevaKHSMF63DDJ5qJQ1CDiXF3cRh7MpOZ2p2zRS9DRX9iVrDld6V90T7gA0fuV13
	AMDy2KsG7C3tDKxHXb9tlxROpr0LszwKMSFs8oaFv09RcdTWdpT2OoRcnup0yq4B8VajmUuoWzi
	6t0wjeV9AGzLUHV8zkLuNVMYM60qI68p/GSafyL+QkC8b6cJezMkDF3bOfQ6UP+gEE8h7slQPLl
	88kcgpLlrfvJngn/a5FIanyapUWk/jeyZbKAmslkOZcTbHWQz3+tQb7lBXN5XPMGplp+Uyjc0vZ
	yHipznS5x3vDvrFY5TSvTboHUhnLCQg==
X-Google-Smtp-Source: AGHT+IEfwLa2l5GETasrkBN6s16G3uwHStgfCUXGV9Vb0lViqA4Rs63c7NBMXwsuNAY9/KPq3s8gww==
X-Received: by 2002:a05:651c:f03:b0:32b:93fa:2c0b with SMTP id 38308e7fff4ca-32cc64d280emr4286261fa.11.1750845171079;
        Wed, 25 Jun 2025 02:52:51 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:52:50 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
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
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 1/9] kasan: unify static kasan_flag_enabled across modes
Date: Wed, 25 Jun 2025 14:52:16 +0500
Message-Id: <20250625095224.118679-2-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625095224.118679-1-snovitoll@gmail.com>
References: <20250625095224.118679-1-snovitoll@gmail.com>
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

Historically the fast-path static key `kasan_flag_enabled` existed
only for `CONFIG_KASAN_HW_TAGS`. Generic and SW_TAGS either relied on
`kasan_arch_is_ready()` or evaluated KASAN checks unconditionally.
As a result every architecture had to toggle a private flag
in its `kasan_init()`.

This patch turns the flag into a single global runtime predicate that
is built for every `CONFIG_KASAN` mode and adds a helper that flips
the key once KASAN is ready.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 include/linux/kasan-enabled.h | 22 ++++++++++++++++------
 include/linux/kasan.h         |  6 ++++++
 mm/kasan/common.c             |  7 +++++++
 mm/kasan/generic.c            | 11 +++++++++++
 mm/kasan/hw_tags.c            |  7 -------
 mm/kasan/sw_tags.c            |  2 ++
 6 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 6f612d69ea0c..2436eb45cfee 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -4,8 +4,12 @@
 
 #include <linux/static_key.h>
 
-#ifdef CONFIG_KASAN_HW_TAGS
+#ifdef CONFIG_KASAN
 
+/*
+ * Global runtime flag. Starts ‘false’; switched to ‘true’ by
+ * the appropriate kasan_init_*() once KASAN is fully initialized.
+ */
 DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
 
 static __always_inline bool kasan_enabled(void)
@@ -13,18 +17,24 @@ static __always_inline bool kasan_enabled(void)
 	return static_branch_likely(&kasan_flag_enabled);
 }
 
-static inline bool kasan_hw_tags_enabled(void)
+#else /* !CONFIG_KASAN */
+
+static __always_inline bool kasan_enabled(void)
 {
-	return kasan_enabled();
+	return false;
 }
 
-#else /* CONFIG_KASAN_HW_TAGS */
+#endif /* CONFIG_KASAN */
 
-static inline bool kasan_enabled(void)
+#ifdef CONFIG_KASAN_HW_TAGS
+
+static inline bool kasan_hw_tags_enabled(void)
 {
-	return IS_ENABLED(CONFIG_KASAN);
+	return kasan_enabled();
 }
 
+#else /* !CONFIG_KASAN_HW_TAGS */
+
 static inline bool kasan_hw_tags_enabled(void)
 {
 	return false;
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 890011071f2b..51a8293d1af6 100644
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
index ed4873e18c75..525194da25fa 100644
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
index d54e89f8c3e7..32c432df24aa 100644
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
index 9a6927394b54..8e819fc4a260 100644
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
index b9382b5b6a37..525bc91e2fcd 100644
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


