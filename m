Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D763AAC99
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 08:41:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5CB66tV6z3cDv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 16:41:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=NX/qvxr8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=NX/qvxr8; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5C980YnTz2yyS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 16:40:11 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso3255401pjp.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 23:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FhcxQma+NItwG5Mp37m/KF4tp14MA8dMkKZlGGIww7w=;
 b=NX/qvxr8dhuE37o1z5sgt2XG3iamjEnXiWs3Cjuob6iS4N7i54VKlfizgYe8xGGkPG
 ECD5YCGaTs51KaCl4epayh0dHJ+o8LndpifLgVU7jrsZXsK+fxf956QA+f9kaEQexM97
 ESKPsh4uIbJJ1pXHDwjoTPF3Wsz2Knn+hfVYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FhcxQma+NItwG5Mp37m/KF4tp14MA8dMkKZlGGIww7w=;
 b=H9uBJJZX+faRi6o563x752zNGtdds5yiEFvesVC1l1sJ4JAr4Zqzm1KK0lwT/zAlvh
 OrSUJgtwqZoo96U5RgAGH23cIXooPIGx7N+Ou3JsTJsFtr/7d/7v5B6FcM/sTMlPQKdT
 GE0e/OlXjuqixNVsNXWWdk1tXAEdpchSJH6g3flr3cDycSeOms0Q+ANB+cDnw6k5lRR4
 Rqj4kID/aU5g+J9qRO5F6P0sJkmznvYg5aInEfbWnQ5Qr0LSAb8hrK+J5jWj8CwMowPK
 F0pwe8Ly0e08MBrDOcK1aRfs1x6OjipFqKMvkVkRTD7M7f/a+FlgtzvJ9O1tSQkUbfwH
 Tgmw==
X-Gm-Message-State: AOAM532RfVgf60J530FQUryLQ7Yx9306DkSDa+4bvWqfjhBZqBoWgnLl
 vPrD+VkG1TWCGaQwgy/JvoSNAA==
X-Google-Smtp-Source: ABdhPJzfeN5byN4YxzyNu/GjCulyBlU25iQrctXCoCFZvJ5L0B+A23QQj4gHY87HwYK24nhSnOkqEg==
X-Received: by 2002:a17:90b:38ca:: with SMTP id
 nn10mr4147573pjb.127.1623912008754; 
 Wed, 16 Jun 2021 23:40:08 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id d12sm3987316pfo.113.2021.06.16.23.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 23:40:08 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, elver@google.com, akpm@linux-foundation.org,
 andreyknvl@gmail.com
Subject: [PATCH v14 1/4] kasan: allow an architecture to disable inline
 instrumentation
Date: Thu, 17 Jun 2021 16:39:53 +1000
Message-Id: <20210617063956.94061-2-dja@axtens.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617063956.94061-1-dja@axtens.net>
References: <20210617063956.94061-1-dja@axtens.net>
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For annoying architectural reasons, it's very difficult to support inline
instrumentation on powerpc64.*

Add a Kconfig flag to allow an arch to disable inline. (It's a bit
annoying to be 'backwards', but I'm not aware of any way to have
an arch force a symbol to be 'n', rather than 'y'.)

We also disable stack instrumentation in this case as it does things that
are functionally equivalent to inline instrumentation, namely adding
code that touches the shadow directly without going through a C helper.

* on ppc64 atm, the shadow lives in virtual memory and isn't accessible in
real mode. However, before we turn on virtual memory, we parse the device
tree to determine which platform and MMU we're running under. That calls
generic DT code, which is instrumented. Inline instrumentation in DT would
unconditionally attempt to touch the shadow region, which we won't have
set up yet, and would crash. We can make outline mode wait for the arch to
be ready, but we can't change what the compiler inserts for inline mode.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 lib/Kconfig.kasan | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index cffc2ebbf185..cb5e02d09e11 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -12,6 +12,15 @@ config HAVE_ARCH_KASAN_HW_TAGS
 config HAVE_ARCH_KASAN_VMALLOC
 	bool
 
+config ARCH_DISABLE_KASAN_INLINE
+	bool
+	help
+	  Sometimes an architecture might not be able to support inline
+	  instrumentation but might be able to support outline instrumentation.
+	  This option allows an architecture to prevent inline and stack
+	  instrumentation from being enabled.
+
+
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
@@ -130,6 +139,7 @@ config KASAN_OUTLINE
 
 config KASAN_INLINE
 	bool "Inline instrumentation"
+	depends on !ARCH_DISABLE_KASAN_INLINE
 	help
 	  Compiler directly inserts code checking shadow memory before
 	  memory accesses. This is faster than outline (in some workloads
@@ -141,6 +151,7 @@ endchoice
 config KASAN_STACK
 	bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
 	depends on KASAN_GENERIC || KASAN_SW_TAGS
+	depends on !ARCH_DISABLE_KASAN_INLINE
 	default y if CC_IS_GCC
 	help
 	  The LLVM stack address sanitizer has a know problem that
@@ -154,6 +165,9 @@ config KASAN_STACK
 	  but clang users can still enable it for builds without
 	  CONFIG_COMPILE_TEST.	On gcc it is assumed to always be safe
 	  to use and enabled by default.
+	  If the architecture disables inline instrumentation, this is
+	  also disabled as it adds inline-style instrumentation that
+	  is run unconditionally.
 
 config KASAN_SW_TAGS_IDENTIFY
 	bool "Enable memory corruption identification"
-- 
2.30.2

