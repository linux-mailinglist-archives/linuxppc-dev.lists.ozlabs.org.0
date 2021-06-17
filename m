Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 404AB3AAFC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 11:31:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Gyn6nqGz3c7N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 19:31:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=VxBhETKa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=VxBhETKa; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Gxx26F2z3076
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 19:30:45 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id u18so4515651pfk.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1nSYxJY0N3aZr/pdi8HOrkpkeyyKzwB00+Ef/RsvCEU=;
 b=VxBhETKa1BkglHL6eiGuDKau5qIlvO2SE6buqTTYwaSC4Qq5gYa8/0Iu8HTz88B0+o
 bv8FuQFbSiqr5YoaoJu0h/DwAkJzkeYN4j9I34Y3qNg1dnVP4NtMb2C4vKeoWXhrcSFi
 LAMbptK+3YwoGNurib7Mg7XZAtIEpcnkIpe6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1nSYxJY0N3aZr/pdi8HOrkpkeyyKzwB00+Ef/RsvCEU=;
 b=OjZfqZJSHqQX3C2LW+j9dtSwquSK7ceoMlu2JbIEpCjCXoMigRhhLsZp7TjcklUzCN
 hNiAePDBE1kExB3SJMP31WlTzElKgkm+A8+8EXLJtriaOnT5Ph4zvWqZqSJfoHnNBFC6
 iajHYH36OdCcdGXexwn7ah4KMFw1Ah6q5R701286fC2QmkX4aQPAcEUFeFG/lEbpfFcX
 7GYhKf2DbglWPdxC0xLqa8YH+ttSI6bWj8WN8Z8Ii6Qh679BuCUbokSzouVBKLOFlIcw
 Q5E5wwcFn9sCjTBjIPVwgH0OkI79yLfIQInxgOsUR+8OOUAFi/mdlxnroDmaMvRUC4Dd
 qTgQ==
X-Gm-Message-State: AOAM531+kUENzpmchiCusfSZtd5m5Ds0vTsEyHy94HiHOZSUyP9CzV+f
 FjBAyLrjRWW3nXVo4YaAgjlW1Q==
X-Google-Smtp-Source: ABdhPJyV1oWZvDdmYRFVr5QxoEcMf74PgidkzSk77dFrjXAyQzrlIf5IqVEJJ6SfYAnO1F6jO2BI8A==
X-Received: by 2002:a62:380c:0:b029:2f7:4057:c3ed with SMTP id
 f12-20020a62380c0000b02902f74057c3edmr4363473pfa.21.1623922242435; 
 Thu, 17 Jun 2021 02:30:42 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id a23sm4404876pff.43.2021.06.17.02.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:30:42 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, elver@google.com, akpm@linux-foundation.org,
 andreyknvl@gmail.com
Subject: [PATCH v15 1/4] kasan: allow an architecture to disable inline
 instrumentation
Date: Thu, 17 Jun 2021 19:30:29 +1000
Message-Id: <20210617093032.103097-2-dja@axtens.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617093032.103097-1-dja@axtens.net>
References: <20210617093032.103097-1-dja@axtens.net>
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

