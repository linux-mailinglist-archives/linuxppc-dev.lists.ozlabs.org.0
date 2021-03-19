Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D16E341FD7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 15:42:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F266b3M7Zz3c8r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 01:41:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=CWsyw4mB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=CWsyw4mB; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F265g0q1Lz3bxW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 01:41:10 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id 11so6041974pfn.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ydwegfj06jUtcG1bKMw1Rb3csKPSe8+eJN43gEYqDtE=;
 b=CWsyw4mBVYYeByo2NmAV258BnfafVcVIoZvhJvhi6CNHCf+F9cnaxudDwiLQtI/tdx
 7QZM8TZBam/tGkDvyQEtIFfXOt24Z5+pMalET8WYuKJ5MIN7UC9Ehz9bJTHW5/v8sRoY
 xHUySAj/MPui5Z8chx1OrAVZIrdBn1g5vsACk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ydwegfj06jUtcG1bKMw1Rb3csKPSe8+eJN43gEYqDtE=;
 b=anu02MjxZnw1PTmJYnYN5z0l5BvGNNQkRdmI+hCdRtKJnYvvFyY5FB7TMVYtR/B/td
 J6IP5XI5RfoiASaY5FCMA1fjmjCnKj0B3WwX8h/qoQ5CE5vZZV10RS6Wa+tqHjPduA43
 N/9rlmvtl1mFNU52Tvh9K2eu+P3JeW3HBFpSUHlltR8Rd6WDewYn0NaqmT5hh8iS22Ae
 BMzChfZu943gfGFwSFVA3uJ0TQwgRvS3MQcbbAWKiyhNm2SWRUqPQ2ERF4AZtDf0HuWl
 61vyS8jRKMhDVk19svbhOGOR5KFbEai6y9Q7x3DM7ckHA+SEGg86n1TFeFBxxBalwu0m
 OjUA==
X-Gm-Message-State: AOAM5305l0i02WNBoiuoucktfLw61R0+FYY6NTZH6yrzkII6gcVKAENw
 bWk2AuwJqeA2vZmI8qQcgWOnIQ==
X-Google-Smtp-Source: ABdhPJx8jC6sFzPVzCCBeAE55Npits4PhLlsXPXK2kY5DhbeqW460kQQ2vJrsrniRqiY86+J6PWQiw==
X-Received: by 2002:a63:181c:: with SMTP id y28mr11211891pgl.175.1616164868280; 
 Fri, 19 Mar 2021 07:41:08 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-674e-5c6f-efc9-136d.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:674e:5c6f:efc9:136d])
 by smtp.gmail.com with ESMTPSA id v13sm5242767pfu.54.2021.03.19.07.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 07:41:08 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v11 1/6] kasan: allow an architecture to disable inline
 instrumentation
Date: Sat, 20 Mar 2021 01:40:53 +1100
Message-Id: <20210319144058.772525-2-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319144058.772525-1-dja@axtens.net>
References: <20210319144058.772525-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For annoying architectural reasons, it's very difficult to support inline
instrumentation on powerpc64.

Add a Kconfig flag to allow an arch to disable inline. (It's a bit
annoying to be 'backwards', but I'm not aware of any way to have
an arch force a symbol to be 'n', rather than 'y'.)

We also disable stack instrumentation in this case as it does things that
are functionally equivalent to inline instrumentation, namely adding
code that touches the shadow directly without going through a C helper.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 lib/Kconfig.kasan | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index cffc2ebbf185..7e237dbb6df3 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -12,6 +12,9 @@ config HAVE_ARCH_KASAN_HW_TAGS
 config HAVE_ARCH_KASAN_VMALLOC
 	bool
 
+config ARCH_DISABLE_KASAN_INLINE
+	def_bool n
+
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
@@ -130,6 +133,7 @@ config KASAN_OUTLINE
 
 config KASAN_INLINE
 	bool "Inline instrumentation"
+	depends on !ARCH_DISABLE_KASAN_INLINE
 	help
 	  Compiler directly inserts code checking shadow memory before
 	  memory accesses. This is faster than outline (in some workloads
@@ -142,6 +146,7 @@ config KASAN_STACK
 	bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
 	depends on KASAN_GENERIC || KASAN_SW_TAGS
 	default y if CC_IS_GCC
+	depends on !ARCH_DISABLE_KASAN_INLINE
 	help
 	  The LLVM stack address sanitizer has a know problem that
 	  causes excessive stack usage in a lot of functions, see
@@ -154,6 +159,9 @@ config KASAN_STACK
 	  but clang users can still enable it for builds without
 	  CONFIG_COMPILE_TEST.	On gcc it is assumed to always be safe
 	  to use and enabled by default.
+	  If the architecture disables inline instrumentation, this is
+	  also disabled as it adds inline-style instrumentation that
+	  is run unconditionally.
 
 config KASAN_SW_TAGS_IDENTIFY
 	bool "Enable memory corruption identification"
-- 
2.27.0

