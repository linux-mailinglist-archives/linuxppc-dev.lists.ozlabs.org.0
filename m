Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B463A737A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 03:48:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3rnY03mBz3cPD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 11:48:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Pn6LBDzC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Pn6LBDzC; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3rm60mjpz2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:47:17 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id e33so5413454pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HOnQVo+SWV1H037ZQ/Ye/PGWwO/+/ZmfPhIlu9wOFzQ=;
 b=Pn6LBDzCFlVrC5tuz8fdMSLA0HjWfz1US+FJjBB7jTX/aufzoPNc6EjedXxxY3BLMm
 f1gHqD2r7QzoTO/8zt6a6IKMk0pOk/rHbExmfnwH8S/kFT/dQavV3mAeyh6n3hZDwmMZ
 IWjGf9JK/AoOfUpQ6+dnwlZ5SN8MwCTEraPZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOnQVo+SWV1H037ZQ/Ye/PGWwO/+/ZmfPhIlu9wOFzQ=;
 b=qsCeCc35XTnxH40eMPWLv7Wjtu4XLcEX+/1gKTi4OZWEfr/URIrhb8dPWcth9aEkLY
 QzlzY7XU+q3QSYj8YReBp4e6Zkp5by7DLFSRX1sAH8yLPfzJTN2e54S3YpU97CyjSFxC
 IhrMgGh+FbOY0IFpdINnBEB2hbDeUZR3NhNVLd8h5aEVqOihFzM1pFcHD7PQttNwXbDU
 vKq2eZ/fqrFKed2Thq6ciG6VV1AKbsq+Znt3FqeDwaGrRfV5lum4Nk7Z2taApsOkDhOw
 EenEPP+VyvnmjpY3mV+bt7ooflgsf5lrOCbwD7ZPX1f04S+qX/GDLUJwJtdtO87HxoHO
 D24Q==
X-Gm-Message-State: AOAM533vZrdIau0kQo1qg9gX8nOnwPEMtNIe/MPFZubsl0PDc0aLSryh
 tj9hXel3dZofIfz9x1sG8mmsWw==
X-Google-Smtp-Source: ABdhPJwqctJ4sje6V13eMdiiU5VjjfvVBqRlbjJUu+6/rSMEDip5D7XD4vGAToI0HE9b5nehhcU7rQ==
X-Received: by 2002:a65:66cf:: with SMTP id c15mr14734452pgw.121.1623721635179; 
 Mon, 14 Jun 2021 18:47:15 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id gk21sm13168157pjb.22.2021.06.14.18.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:47:14 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v12 1/6] kasan: allow an architecture to disable inline
 instrumentation
Date: Tue, 15 Jun 2021 11:47:00 +1000
Message-Id: <20210615014705.2234866-2-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210615014705.2234866-1-dja@axtens.net>
References: <20210615014705.2234866-1-dja@axtens.net>
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
Cc: elver@google.com, Daniel Axtens <dja@axtens.net>
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
 lib/Kconfig.kasan | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index cffc2ebbf185..935814f332a7 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -12,6 +12,15 @@ config HAVE_ARCH_KASAN_HW_TAGS
 config HAVE_ARCH_KASAN_VMALLOC
 	bool
 
+# Sometimes an architecture might not be able to support inline instrumentation
+# but might be able to support outline instrumentation. This option allows an 
+# arch to prevent inline and stack instrumentation from being enabled.
+# ppc64 turns on virtual memory late in boot, after calling into generic code
+# like the device-tree parser, so it uses this in conjuntion with a hook in
+# outline mode to avoid invalid access early in boot.
+config ARCH_DISABLE_KASAN_INLINE
+	bool
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
2.27.0

