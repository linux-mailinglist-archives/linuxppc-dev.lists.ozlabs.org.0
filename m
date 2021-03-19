Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E5341FE2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 15:43:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F267w6MW3z3d2M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 01:43:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Kcj5V4JO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Kcj5V4JO; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F265v0CRFz3c3B
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 01:41:22 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id q11so3054150pld.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 07:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCC3AVfnj1w2eD4KT8qv23tgUysFvODW8V6tvYzpnj0=;
 b=Kcj5V4JO6UXzdOoeJYTdGv3hGZ0yiAZ4YA1dMGC+BWrEwefW0Qhg42b9QG27UfIZz+
 uf8r2JJzyEWmiIGbkR+DyB3Cyv7gPflBIA9aFiPnFfODIyrgnN84967czC0raJWhAown
 P0aP8rySNsA8usPv4NxILaGKNQmu0E7Ap02sM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dCC3AVfnj1w2eD4KT8qv23tgUysFvODW8V6tvYzpnj0=;
 b=Hsc+1KgXTDYwA+a57jTacqYmKWEyfMYSROQS4oqapkjjpPAR2BTYQ5BiUT3b79WCTw
 5h+BbZC36EO9iNMtAUbg7c0BDbIPv8kZvJ22DmpfvDZ9F3jjhgR7a8RPlJTYUTRzFMJy
 oON4pdWZGtzaGJII8X7pfq7xe1m8OKaWKaKJVKY0WNxvAK6jJOx+VE8ebXOZ7zhCGwsW
 4oGGcwEkusWtcztfWF0BAC1ImFdQoBR8mtfBrP+WUCultArY0Gke9elyqEDBEHCyYQsU
 EVArK0ncRCC6zXneJxuH9sjpjcii8XannZR15UnVt6RoSrAC4A6p5Yh5FG6J5wnBHV8o
 88Rw==
X-Gm-Message-State: AOAM532ZPESG3FgS9Mnvxlxo9MeXSBRGQQM4TKixnD0qIOCs0Fsn6B2b
 U/7BDjqaOFwxzHYvY7ovMZ5GXw==
X-Google-Smtp-Source: ABdhPJy9qheq4CMOyD57S1I8GxJvr41ZOEKYLEQSvW8ZHFsQj8D1wGZJuqJfJaHplnp4QE646Q++8A==
X-Received: by 2002:a17:902:ac93:b029:e6:548b:d61 with SMTP id
 h19-20020a170902ac93b02900e6548b0d61mr14570825plr.80.1616164880480; 
 Fri, 19 Mar 2021 07:41:20 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-674e-5c6f-efc9-136d.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:674e:5c6f:efc9:136d])
 by smtp.gmail.com with ESMTPSA id o197sm5984619pfd.42.2021.03.19.07.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 07:41:20 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v11 4/6] kasan: Document support on 32-bit powerpc
Date: Sat, 20 Mar 2021 01:40:56 +1100
Message-Id: <20210319144058.772525-5-dja@axtens.net>
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

KASAN is supported on 32-bit powerpc and the docs should reflect this.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 Documentation/dev-tools/kasan.rst |  8 ++++++--
 Documentation/powerpc/kasan.txt   | 12 ++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index a8c3e0cff88d..2cfd5d9068c0 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -36,7 +36,8 @@ Both software KASAN modes work with SLUB and SLAB memory allocators,
 while the hardware tag-based KASAN currently only supports SLUB.
 
 Currently, generic KASAN is supported for the x86_64, arm, arm64, xtensa, s390,
-and riscv architectures, and tag-based KASAN modes are supported only for arm64.
+and riscv architectures. It is also supported on 32-bit powerpc kernels.
+Tag-based KASAN modes are supported only for arm64.
 
 Usage
 -----
@@ -334,7 +335,10 @@ CONFIG_KASAN_VMALLOC
 
 With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
 cost of greater memory usage. Currently, this is supported on x86,
-riscv, s390, and powerpc.
+riscv, s390, and 32-bit powerpc.
+
+It is optional, except on 32-bit powerpc kernels with module support,
+where it is required.
 
 This works by hooking into vmalloc and vmap and dynamically
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
2.27.0

