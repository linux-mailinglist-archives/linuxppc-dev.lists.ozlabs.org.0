Return-Path: <linuxppc-dev+bounces-10292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E16B08F40
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:28:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZyc0pcGz3bmy;
	Fri, 18 Jul 2025 00:27:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762472;
	cv=none; b=BPjg8ihGXkL7FZiAMZKrSCWgm+GhG4Tc5cXZ6vv1LADZ1umWx4djP9rDXtWLI9By2GAWn3m7nNjg/ENrSlwkSs31ueSKofMlSgZNAD3x3RKmXvmHQGddFYDjYiptoXDcsaBTaozeb6/EH24E6lZjTtPq2fU56NPDag0QHI7gGlyEy+FwVWRp39dLrb9jXoTiIpVn2yTpoXkBzWk1Js2XaUT3kyp8f/n8pzl/2m8AU/k1ouppRPOgCen+fN5AQjxLn5gwLlo79IRlQeQPB2FMDvK9whJm0eoIMiHiljFjscImGdy5DKk4ZazXwyD0/uq4SNJm1AC3rbI5gyiK+vWlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762472; c=relaxed/relaxed;
	bh=CtzrgmhXOlDN0Ac+5J9qvgdYRUcauOXxnB1y58JGUsg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NHnxxmfFgdN5c0Plk2NkH368oMmEZ1Jwy5fb6k2ztBlhnWk8Q9zle0CD8iexGaE/oyGEsxxqmeAWiOC54EQA/r9ry9mMUqFMDbjTDzD5WIALbRtJx4CJnjW50M7b8RTPUea1TFRLPB9ayYKnLIfagxKptTKpC5CCf9M0NO60n4Tho14YJmq8cisJl6ooNxutmxrPs1kz27ZWy9jceeePqqgEjWnXM56Zkc560gzh3ev18WIVehtzhpxYV0Abjo3T4858LG0X0tIqKVZ4v/tY/lMiJb+2W1KdBpswCckqncBbZb7RybvhZ2A3EoyRs3AjfzP4qyYHtps2kWMDNdc+7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gWaXwC5d; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gWaXwC5d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZyb080Zz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:27:51 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553d52cb80dso1223048e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762468; x=1753367268; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtzrgmhXOlDN0Ac+5J9qvgdYRUcauOXxnB1y58JGUsg=;
        b=gWaXwC5dydVRG/k8sbcFVvHPofB/B7IDp3txRKxn9b/QKXcvKlaeypc63fqxK8Ihxg
         Oj/Jk7yQlS9Lj7z4l3aXIxlOkIWpPhZs3JsaeJ+mdgSay45eUL5W0dPQoo1iz8wLNZYH
         6i2qKji89NdkNawbXIkeKBKwsRmpOND9pPdNITz/ffXWepoBPjjMPVXmz//2qx2/une9
         45JAaHg+Q65wNnBaKeQsUR+LdTKclWnDjO+MSYZvVDSeHi205KLKjXYBLKT/mRipFvsb
         FcQZDXihRHnsR40whj7q7gtIcwsTQRXz+Xm2E/7JwWeVcGWuJoURJW0dnaym+69KEpY+
         LFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762468; x=1753367268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtzrgmhXOlDN0Ac+5J9qvgdYRUcauOXxnB1y58JGUsg=;
        b=G7YpZArbm//DJLciKPCVuHV57CafpLZdI4xn+M8QFQcVPLlbpzQNgYb+TNw9th6n1i
         CX+GUJWN9/lflns9WfspWZL4h7POR7VzKoJDueUn9jZqF1BvYGQS8lw44kpkvLPu28dV
         n4C7RgP7R33VCCaENFx+eksYEzfggwHbPmOfrDxquMmwbw5t9TGqW+Z89gkO4PZw/zJC
         yXFMUMMy+SVWnJHRSDUjlkMxs5KO8FvMbPYRnKbnnxyFH3thvV+Q1Txy3yphzgohUJlD
         M/A/u3OG5JBVnfPBY7CShHsMDg3459zieNInMQNF3M/CZEBbnuVZ8RuZq64hCsUwQ74V
         V6Yw==
X-Forwarded-Encrypted: i=1; AJvYcCU2CuLcl3EA2sPq8p34Flu/SvM7+xPIbPOaCFtyE1uqqgvjDJPnVVxtRyGsOkI9UEEdpxZ74KPmahq5pI4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw88gl3l78Xs1qcR2Wk8kRLqmgGELZqkpaLGclGZiE6pUOw4e3j
	j0PWDRsye3zg1NbHzj/3dGKTtfliDLVBFc1e0khnxpwfkNQSS3xysQGDmn55zz1g984=
X-Gm-Gg: ASbGncurQjlBNYG95hc3RQ4MWwO+hBDlKxfnG7xB/PPzuy77081+IzpLY5m84rkvt1J
	9TMckK4oNAJ6TmQfyydIndVG0gwuhpjqhqwkgFYRNwVYafzDcvJ4ysm6f37STfJmQZB4wDUHcfc
	c20vNXWz/J2g3y+XkYHlVjdWRslB3YZNVqZ9BOIAKbCvl6R1p+gNsIcu6CzHjhCPYlzW4fUSEsp
	OBH5/YGaejb5E4ZRKexnqeXUWohBc5DkiuEcO7dwNxGrMRZA2yVACWCp1QDSDu6CdrM55ZaRblf
	BJBJ3DgBoDVPev86IXlYeQKrrJrvmwEWpmF5cZgL8O+vVDD6a5QaT/WOG0hMRQf3HHi8PA102NY
	C6i+3bzDnKFQI07/vvW3KGlD/lizcVBvl/J/d7Wm3SXTmwtCgZTspY21NME7GIkuwBNMF
X-Google-Smtp-Source: AGHT+IGFU/9g3XHsICupAR2OwO3I+VhsbowqxnMbfcNePQa3z69BAqmHMKuwXCkJ+RRLdmWNcXslSQ==
X-Received: by 2002:a05:6512:1254:b0:553:2c01:ff4a with SMTP id 2adb3069b0e04-55a2fdd97dbmr24308e87.3.1752762467575;
        Thu, 17 Jul 2025 07:27:47 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:46 -0700 (PDT)
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
Subject: [PATCH v3 02/12] kasan: unify static kasan_flag_enabled across modes
Date: Thu, 17 Jul 2025 19:27:22 +0500
Message-Id: <20250717142732.292822-3-snovitoll@gmail.com>
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

Historically, the runtime static key kasan_flag_enabled existed only for
CONFIG_KASAN_HW_TAGS mode. Generic and SW_TAGS modes either relied on
architecture-specific kasan_arch_is_ready() implementations or evaluated
KASAN checks unconditionally, leading to code duplication.

This patch implements two-level approach:

1. kasan_enabled() - controls if KASAN is enabled at all (compile-time)
2. kasan_shadow_initialized() - tracks shadow memory
   initialization (runtime)

For architectures that select ARCH_DEFER_KASAN: kasan_shadow_initialized()
uses a static key that gets enabled when shadow memory is ready.

For architectures that don't: kasan_shadow_initialized() returns
IS_ENABLED(CONFIG_KASAN) since shadow is ready from the start.

This provides:
- Consistent interface across all KASAN modes
- Runtime control only where actually needed
- Compile-time constants for optimal performance where possible
- Clear separation between "KASAN configured" vs "shadow ready"

Also adds kasan_init_generic() function that enables the shadow flag and
handles initialization for Generic mode, and updates SW_TAGS and HW_TAGS
to use the unified kasan_shadow_enable() function.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v3:
- Only architectures that need deferred KASAN get runtime overhead
- Added kasan_shadow_initialized() for shadow memory readiness tracking
- kasan_enabled() now provides compile-time check for KASAN configuration
---
 include/linux/kasan-enabled.h | 34 ++++++++++++++++++++++++++--------
 include/linux/kasan.h         |  6 ++++++
 mm/kasan/common.c             |  9 +++++++++
 mm/kasan/generic.c            | 11 +++++++++++
 mm/kasan/hw_tags.c            |  9 +--------
 mm/kasan/sw_tags.c            |  2 ++
 6 files changed, 55 insertions(+), 16 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 6f612d69ea0..fa99dc58f95 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -4,32 +4,50 @@
 
 #include <linux/static_key.h>
 
-#ifdef CONFIG_KASAN_HW_TAGS
+/* Controls whether KASAN is enabled at all (compile-time check). */
+static __always_inline bool kasan_enabled(void)
+{
+	return IS_ENABLED(CONFIG_KASAN);
+}
 
+#ifdef CONFIG_ARCH_DEFER_KASAN
+/*
+ * Global runtime flag for architectures that need deferred KASAN.
+ * Switched to 'true' by the appropriate kasan_init_*()
+ * once KASAN is fully initialized.
+ */
 DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
 
-static __always_inline bool kasan_enabled(void)
+static __always_inline bool kasan_shadow_initialized(void)
 {
 	return static_branch_likely(&kasan_flag_enabled);
 }
 
-static inline bool kasan_hw_tags_enabled(void)
+static inline void kasan_enable(void)
+{
+	static_branch_enable(&kasan_flag_enabled);
+}
+#else
+/* For architectures that can enable KASAN early, use compile-time check. */
+static __always_inline bool kasan_shadow_initialized(void)
 {
 	return kasan_enabled();
 }
 
-#else /* CONFIG_KASAN_HW_TAGS */
+/* No-op for architectures that don't need deferred KASAN. */
+static inline void kasan_enable(void) {}
+#endif /* CONFIG_ARCH_DEFER_KASAN */
 
-static inline bool kasan_enabled(void)
+#ifdef CONFIG_KASAN_HW_TAGS
+static inline bool kasan_hw_tags_enabled(void)
 {
-	return IS_ENABLED(CONFIG_KASAN);
+	return kasan_enabled();
 }
-
+#else
 static inline bool kasan_hw_tags_enabled(void)
 {
 	return false;
 }
-
 #endif /* CONFIG_KASAN_HW_TAGS */
 
 #endif /* LINUX_KASAN_ENABLED_H */
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
index ed4873e18c7..c3a6446404d 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -32,6 +32,15 @@
 #include "kasan.h"
 #include "../slab.h"
 
+#ifdef CONFIG_ARCH_DEFER_KASAN
+/*
+ * Definition of the unified static key declared in kasan-enabled.h.
+ * This provides consistent runtime enable/disable across KASAN modes.
+ */
+DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
+EXPORT_SYMBOL(kasan_flag_enabled);
+#endif
+
 struct slab *kasan_addr_to_slab(const void *addr)
 {
 	if (virt_addr_valid(addr))
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index d54e89f8c3e..03b6d322ff6 100644
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
+	kasan_enable();
+
+	pr_info("KernelAddressSanitizer initialized (generic)\n");
+}
+
 /*
  * All functions below always inlined so compiler could
  * perform better optimizations in each of __asan_loadX/__assn_storeX
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index 9a6927394b5..c8289a3feab 100644
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
@@ -260,7 +253,7 @@ void __init kasan_init_hw_tags(void)
 	kasan_init_tags();
 
 	/* KASAN is now initialized, enable it. */
-	static_branch_enable(&kasan_flag_enabled);
+	kasan_enable();
 
 	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, stacktrace=%s)\n",
 		kasan_mode_info(),
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index b9382b5b6a3..275bcbbf612 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -45,6 +45,8 @@ void __init kasan_init_sw_tags(void)
 
 	kasan_init_tags();
 
+	kasan_enable();
+
 	pr_info("KernelAddressSanitizer initialized (sw-tags, stacktrace=%s)\n",
 		str_on_off(kasan_stack_collection_enabled()));
 }
-- 
2.34.1


