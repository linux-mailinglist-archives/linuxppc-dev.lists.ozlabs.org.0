Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A933B2596
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 05:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9QtD2d3Yz306g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 13:41:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=D8DjGwJU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=D8DjGwJU; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9QsC70gnz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 13:41:03 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id c8so4023661pfp.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 20:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sf2vC4DdejXn0TlyY78AewZhU0SgkUPuFBMazAbHZK4=;
 b=D8DjGwJUlXIO0TVrSG/ZeVvUPW8wAHpUnKMSvZFVHtop5C+89pYkyv+sH9hOpbRZu/
 WeLrxWQk1TD4sCKNOKHTSyfqskGq5aaadsGnRaaDJz85jHEwhsY8ctxHqy/R1FXCJjVi
 YVLEC05DAfejjr8edszhWUuY6dHt2hgNoOS5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sf2vC4DdejXn0TlyY78AewZhU0SgkUPuFBMazAbHZK4=;
 b=QzelqU7hg6ckTgQxJReINoFmL23SQWByiCxOcwMBvSEh/p31A8OSqDMXtKni4FLnvr
 VlrenptBJRmlJ2qWY0StJvzo5zriTEMq+u3s7kk6RbgW1w0+0OzudSnY6IMEB3j/9mvv
 8etAG+UBMi9E5719xY5tTPwCSZJAHA/GF91sYjitR1OXk2zGDIT5C8Xak8I7z16mtR00
 drMnHDJsZyWxX5FVKeZhBILZWZzmQJ5Vi3NL+3eFk+qVV6ekS7jtkDGipXQvt2CwXtzg
 OfJ2pmKlMxAGg+mg+8t2kF6ubufAsdspI/p/2JEn2J2IPBW0ns8dwnZLl7kjyorGgbal
 Pc+w==
X-Gm-Message-State: AOAM533GHwirzh7Rs5iXbbdFmYPnxrZjBAVGoBtXwzoL2Xw+k8icz+YD
 zDGpJxhi2kMm8a7kSo5pjuuDeA==
X-Google-Smtp-Source: ABdhPJxwUXidQSW66Cd7hfNHu9m1OdS3iDnW9VrYoHaD9hKo1tsw6JFDwPcDmznjLKOpOobVgqPCDg==
X-Received: by 2002:a05:6a00:138f:b029:304:2af5:1e12 with SMTP id
 t15-20020a056a00138fb02903042af51e12mr3014900pfg.5.1624506060335; 
 Wed, 23 Jun 2021 20:41:00 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id p6sm6789262pjh.24.2021.06.23.20.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 20:41:00 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, elver@google.com, akpm@linux-foundation.org,
 andreyknvl@gmail.com
Subject: [PATCH v16 1/4] kasan: allow an architecture to disable inline
 instrumentation
Date: Thu, 24 Jun 2021 13:40:47 +1000
Message-Id: <20210624034050.511391-2-dja@axtens.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624034050.511391-1-dja@axtens.net>
References: <20210624034050.511391-1-dja@axtens.net>
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

Reviewed-by: Marco Elver <elver@google.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 lib/Kconfig.kasan | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index cffc2ebbf185..c3b228828a80 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -12,6 +12,13 @@ config HAVE_ARCH_KASAN_HW_TAGS
 config HAVE_ARCH_KASAN_VMALLOC
 	bool
 
+config ARCH_DISABLE_KASAN_INLINE
+	bool
+	help
+	  An architecture might not support inline instrumentation.
+	  When this option is selected, inline and stack instrumentation are
+	  disabled.
+
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
@@ -130,6 +137,7 @@ config KASAN_OUTLINE
 
 config KASAN_INLINE
 	bool "Inline instrumentation"
+	depends on !ARCH_DISABLE_KASAN_INLINE
 	help
 	  Compiler directly inserts code checking shadow memory before
 	  memory accesses. This is faster than outline (in some workloads
@@ -141,6 +149,7 @@ endchoice
 config KASAN_STACK
 	bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
 	depends on KASAN_GENERIC || KASAN_SW_TAGS
+	depends on !ARCH_DISABLE_KASAN_INLINE
 	default y if CC_IS_GCC
 	help
 	  The LLVM stack address sanitizer has a know problem that
@@ -154,6 +163,9 @@ config KASAN_STACK
 	  but clang users can still enable it for builds without
 	  CONFIG_COMPILE_TEST.	On gcc it is assumed to always be safe
 	  to use and enabled by default.
+	  If the architecture disables inline instrumentation, stack
+	  instrumentation is also disabled as it adds inline-style
+	  instrumentation that is run unconditionally.
 
 config KASAN_SW_TAGS_IDENTIFY
 	bool "Enable memory corruption identification"
-- 
2.30.2

