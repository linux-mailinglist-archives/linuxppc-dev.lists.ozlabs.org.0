Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 720AFDA333
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 03:32:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ts943WkGzDr8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 12:32:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="m1ApeOEB"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ts112q04zDr7G
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 12:25:25 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id d22so300844pls.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 18:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=whmCcgz4VjZeRv6SREyqmZaNFMJpz8TJQeqtX9KJOOU=;
 b=m1ApeOEBceEitnwnVhSqb3qb8hNwH66tjcLagM1+mI6PFnNgrn5Dqs68VEyged3ZLe
 H/uKj71qyeGCmqzt29SEJYhu5OVDWqcQKVYk4MRoeokuQpyzBpo+zlze/ugO7ZWt0PW/
 0BZ4YdnuvAP9ZUNSyjzYEvtHn3WSIILR8Lnf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=whmCcgz4VjZeRv6SREyqmZaNFMJpz8TJQeqtX9KJOOU=;
 b=rh3H/DsU24uGIjAw50mOkg9T6ewvAVPgrKF4GR+Nl3V7p/xjerFf9h2dQe+k98Psza
 vWo0euYGUEdtVWh+IKiiZOI0c8MlHLzTX/lJU8+9a5jViZNG1SvngUkKZgFjhx3HCCGD
 njCdIOtqy25o8ktUWDjrHyBd6L92QzndZ9wihwE46Pi3CNjPIbcm5dQrVqwik5ylmVI7
 joL5p2EN+lCydQV3PPqes3zFhscx6gQ2vZMYFBuQTeXKa2UwDKHCLcsZJWPtVbTPzznI
 sQglmXLNO5fO4joo7VXZdRZFjKn1rMK9xJNyOaTMvUhO8iu55TpscXCdG7gto1Q+9W6S
 1I8g==
X-Gm-Message-State: APjAAAW8nW+hzlr8XFkXIvpVSGOsvBcfaFUbE/eYVcMaXNL1wp5j/75p
 EZxxss7kVARA6bX2cttDMc17Jg==
X-Google-Smtp-Source: APXvYqwsR4962cnxMoM3dLvmhRD0TpVziHNmalYqRChEROjKsnzFNViD40UQgLnKTQ4n4Gd/NeT1qg==
X-Received: by 2002:a17:902:9a88:: with SMTP id
 w8mr1250860plp.129.1571275523512; 
 Wed, 16 Oct 2019 18:25:23 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id 14sm340879pfn.21.2019.10.16.18.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 18:25:22 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v9 2/5] kasan: add test for vmalloc
Date: Thu, 17 Oct 2019 12:25:03 +1100
Message-Id: <20191017012506.28503-3-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017012506.28503-1-dja@axtens.net>
References: <20191017012506.28503-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Test kasan vmalloc support by adding a new test to the module.

Signed-off-by: Daniel Axtens <dja@axtens.net>

--

v5: split out per Christophe Leroy
---
 lib/test_kasan.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git lib/test_kasan.c lib/test_kasan.c
index 49cc4d570a40..328d33beae36 100644
--- lib/test_kasan.c
+++ lib/test_kasan.c
@@ -19,6 +19,7 @@
 #include <linux/string.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
+#include <linux/vmalloc.h>
 
 #include <asm/page.h>
 
@@ -748,6 +749,30 @@ static noinline void __init kmalloc_double_kzfree(void)
 	kzfree(ptr);
 }
 
+#ifdef CONFIG_KASAN_VMALLOC
+static noinline void __init vmalloc_oob(void)
+{
+	void *area;
+
+	pr_info("vmalloc out-of-bounds\n");
+
+	/*
+	 * We have to be careful not to hit the guard page.
+	 * The MMU will catch that and crash us.
+	 */
+	area = vmalloc(3000);
+	if (!area) {
+		pr_err("Allocation failed\n");
+		return;
+	}
+
+	((volatile char *)area)[3100];
+	vfree(area);
+}
+#else
+static void __init vmalloc_oob(void) {}
+#endif
+
 static int __init kmalloc_tests_init(void)
 {
 	/*
@@ -793,6 +818,7 @@ static int __init kmalloc_tests_init(void)
 	kasan_strings();
 	kasan_bitops();
 	kmalloc_double_kzfree();
+	vmalloc_oob();
 
 	kasan_restore_multi_shot(multishot);
 
-- 
2.20.1

