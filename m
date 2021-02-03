Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC730DBEC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:55:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW38m1kLxzF3Gl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:55:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=VmzeA/6j; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0c51NFwzF02Z
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 23:00:04 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id o20so16517516pfu.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Feb 2021 04:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FaxU8G6b68GEdEbXS6bZDEyMoHhbuYhFSTBo6L7+8wc=;
 b=VmzeA/6jTeJHl92Ui+bW8jMnWfBJzOz2tWH7ZG/ltLwUUaY3jql12q4I/LUKW84XrX
 SPm285KUxoURFjo+ZFPZtM2ObLr6nzqErBg4pInHV8eJKHAdqJtRup8+irCG03feIu97
 pmByKUqzPo0Z1/NZpO9hGbdKuv156j4xyd0Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FaxU8G6b68GEdEbXS6bZDEyMoHhbuYhFSTBo6L7+8wc=;
 b=au2smjduGubUU2k8Yc18gHJNlhyOZ6qPNY8aEI7DZYccMeOedpkdnw6dT8hW1WWEq7
 UO1+9GWeYchh4W61ti9UI/yVFRSOVF9gOx6Ly05b/Ex/YobY5JButw4PJNPqlhnvF7Nr
 NdaPFjMwgiraQAfbx3H6qDIEHymuuiqRBRLunvkjFBCfJ74a9a4NUNS9yxCX5RkoUPqB
 8sdoHhf4zSKjTM0sbSzV9hFEjGBuDFE9K0uZSvYsLoduAeHSsetabrZY3R+Qtoy63mRP
 C5PlCLYceQkkUnVSXSS42UM51SwjaCWlKIGHKzCiCrfj5LPleRgv7JumBL8RwsxctKyc
 Dj3Q==
X-Gm-Message-State: AOAM531kZ4x1bCQxzth+JzmhhgoXI+NvcAZCGwGqza5OYxwaXvIAEIaH
 Nc/F34pkqOhGgMTWeNUlvoI54Q==
X-Google-Smtp-Source: ABdhPJzJQ+HrkRqBl3GdIZ8HA1RDMTKlHsN8nxwZJJ2++D58biICNAHrnytqbZjJk0+WJgDowTrAZQ==
X-Received: by 2002:a62:a204:0:b029:1c3:fb27:16f3 with SMTP id
 m4-20020a62a2040000b02901c3fb2716f3mr2777075pff.61.1612353599093; 
 Wed, 03 Feb 2021 03:59:59 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-1c59-4eca-f876-fd51.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:1c59:4eca:f876:fd51])
 by smtp.gmail.com with ESMTPSA id p2sm2491813pgl.19.2021.02.03.03.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 03:59:58 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v10 1/6] kasan: allow an architecture to disable inline
 instrumentation
Date: Wed,  3 Feb 2021 22:59:41 +1100
Message-Id: <20210203115946.663273-2-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210203115946.663273-1-dja@axtens.net>
References: <20210203115946.663273-1-dja@axtens.net>
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
index cffc2ebbf185..4f4d3fb8733d 100644
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
@@ -141,6 +145,7 @@ endchoice
 config KASAN_STACK
 	bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
 	depends on KASAN_GENERIC || KASAN_SW_TAGS
+	depends on !ARCH_DISABLE_KASAN_INLINE
 	default y if CC_IS_GCC
 	help
 	  The LLVM stack address sanitizer has a know problem that
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

