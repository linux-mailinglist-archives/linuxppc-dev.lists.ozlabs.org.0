Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D138E7F2F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 05:27:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472JV32pdkzF0gb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 15:27:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="lcDyHdzU"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472JLP0BXgzDr4Y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 15:21:16 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id g9so6299091plp.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 21:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HNDV9DT7O32N2h9l7CrACdWJSzNVfR3Dv9pnUT55kOg=;
 b=lcDyHdzUacgOhucQ6b8IWgwE46Vlk8g9GsG0YiqbvSuRh0midPQjkKTH8pqXZ6eSlf
 M1yH4o7rgNX40yBq5M4PAJVge7qa26A++93dTOcRGcNCrIQhxh5QfkU3EV2DF34ElmZk
 63eYGshNT63iTFBqS5s6pvBKl+7JsqOxJf9F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNDV9DT7O32N2h9l7CrACdWJSzNVfR3Dv9pnUT55kOg=;
 b=syg7OZEG5/SK+ubTqLWC0bE0KSgPTHAIBu1UrehsVS7j/Cfzfqxu8m1w12Pezt/ekv
 30b4g5wgikzMlgL1r5aOhs9fRjhHQ5QsCBNN6VrQii/LRQvu8aQ4UXH8L2S8Mvjn/G+u
 5BYTR0kURkhvldGOvOQQFhlDhgwyOtNBvfbBkW7rKtqcs9ppAySg4mUhNtOsebeRTyrZ
 pworLwt1jpwTihblNbhLi2rWGIm+1FbyeOGVrslKSlWPKNmbtP3/M3iMxTJDKq1AibXv
 X2qbpWV2PXbJBx6osywoiBRpGEcdxMkRplQ71KQ8qakuNV+jyme2V3DOO6Hm9nNDd4NC
 co3w==
X-Gm-Message-State: APjAAAVUwZEzi4KAc8FeQ7zDfIuPHhCyrFNkFyFd2ZhD1tfqZbGEA+OB
 XCap/BtTlqVpGII5buZAbdtfWQ==
X-Google-Smtp-Source: APXvYqxLsff9odhBvNICfK+D6Rfn6FtMiU4d244WqDyFRpWs6AJDTPdDv2j0OdBnEo98eZFpsfQ/6A==
X-Received: by 2002:a17:902:68:: with SMTP id 95mr1661194pla.117.1572322874296; 
 Mon, 28 Oct 2019 21:21:14 -0700 (PDT)
Received: from localhost ([2001:44b8:802:1120:783a:2bb9:f7cb:7c3c])
 by smtp.gmail.com with ESMTPSA id y11sm15418521pfq.1.2019.10.28.21.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 21:21:13 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v10 2/5] kasan: add test for vmalloc
Date: Tue, 29 Oct 2019 15:20:56 +1100
Message-Id: <20191029042059.28541-3-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029042059.28541-1-dja@axtens.net>
References: <20191029042059.28541-1-dja@axtens.net>
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

diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index 49cc4d570a40..328d33beae36 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
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

