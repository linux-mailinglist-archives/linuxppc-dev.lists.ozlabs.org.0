Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2EE211A62
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 05:00:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y2sF4h4HzDqSR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 13:00:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=ZP48jJgv; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y2kZ6JjGzDqsQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 12:54:46 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id j1so11866718pfe.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 19:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D4Q7wlnC9uinQAfoiYOmKAt3GyYnF0nwS1m28sSQDUo=;
 b=ZP48jJgvWkI9Wmfys6LSUGRJKCAuUvIJ1CenCS7q4/qaZMUpIwAmGMeKJPT2wS0Wmy
 yQ4JtPRu7jJcldH2+IBxwZ7U8Dmekr3AiJj8akIHRdks0YXPwYaZJa5DOKZilVmzJlCP
 F/rL62iMEdh++SSXvJq21IJPk/pF89qIJJacE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4Q7wlnC9uinQAfoiYOmKAt3GyYnF0nwS1m28sSQDUo=;
 b=mkCd+7h/9afCu5YTlKAd+2Kw3ro13IzUqAn6YvX8ptrdvcHcXwnTErpZAYAYlZTDaS
 BpPraZ2MoAQ+eI876DaZRiu+Agg0a8rrt+lp/W86wKmRjW1sh7Dgkz07YA2zMXbdNWmB
 9ANJvnV/evWBSKAcJJgL+cnOyewkmlB5pzvgvZN2o/DJ6YUgC9srrAY8YnYrxL3Q4UbF
 F7FERRYYXS/OToj+IyMdNUXwvlbH7Oal+3EqZD61Q6hKiYBXTOAPuHxojG+qZRD1QvPf
 d1/an/xThQNiIVWDMDKc4DZF3q0z/K7ZYO2Lu4IgPY3NV1jnft1aFhT2wD4Bq39qsg4s
 d82A==
X-Gm-Message-State: AOAM5332yLEoBAuJSzN6Dt93mt8ukYgGpgcRYZKMYOYLxZPGO4W5LE/w
 e9xiXgU5ufpa4Yq5sP2pLRTKUw==
X-Google-Smtp-Source: ABdhPJyDd94QLnAKxB+F6OzOYld27r7l1OjUzszJAvVmLhfM9lYgzLjnElqe0vUfemvYhf3Y3Zpv8g==
X-Received: by 2002:a63:20d:: with SMTP id 13mr22820110pgc.166.1593658484159; 
 Wed, 01 Jul 2020 19:54:44 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-3c80-6152-10ca-83bc.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:3c80:6152:10ca:83bc])
 by smtp.gmail.com with ESMTPSA id h6sm7031275pfo.123.2020.07.01.19.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 19:54:43 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v8 2/4] kasan: Document support on 32-bit powerpc
Date: Thu,  2 Jul 2020 12:54:30 +1000
Message-Id: <20200702025432.16912-3-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702025432.16912-1-dja@axtens.net>
References: <20200702025432.16912-1-dja@axtens.net>
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

KASAN is supported on 32-bit powerpc and the docs should reflect this.

Document s390 support while we're at it.

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 Documentation/dev-tools/kasan.rst |  7 +++++--
 Documentation/powerpc/kasan.txt   | 12 ++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index c652d740735d..554cbee1d240 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -22,7 +22,8 @@ global variables yet.
 Tag-based KASAN is only supported in Clang and requires version 7.0.0 or later.
 
 Currently generic KASAN is supported for the x86_64, arm64, xtensa, s390 and
-riscv architectures, and tag-based KASAN is supported only for arm64.
+riscv architectures. It is also supported on 32-bit powerpc kernels. Tag-based
+KASAN is supported only on arm64.
 
 Usage
 -----
@@ -255,7 +256,9 @@ CONFIG_KASAN_VMALLOC
 ~~~~~~~~~~~~~~~~~~~~
 
 With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
-cost of greater memory usage. Currently this is only supported on x86.
+cost of greater memory usage. Currently this supported on x86, s390
+and 32-bit powerpc. It is optional, except on 32-bit powerpc kernels
+with module support, where it is required.
 
 This works by hooking into vmalloc and vmap, and dynamically
 allocating real shadow memory to back the mappings.
diff --git a/Documentation/powerpc/kasan.txt b/Documentation/powerpc/kasan.txt
new file mode 100644
index 000000000000..26bb0e8bb18c
--- /dev/null
+++ b/Documentation/powerpc/kasan.txt
@@ -0,0 +1,12 @@
+KASAN is supported on powerpc on 32-bit only.
+
+32 bit support
+==============
+
+KASAN is supported on both hash and nohash MMUs on 32-bit.
+
+The shadow area sits at the top of the kernel virtual memory space above the
+fixmap area and occupies one eighth of the total kernel virtual memory space.
+
+Instrumentation of the vmalloc area is optional, unless built with modules,
+in which case it is required.
-- 
2.25.1

