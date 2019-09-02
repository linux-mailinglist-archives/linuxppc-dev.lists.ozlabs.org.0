Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E35A54C3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 13:27:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MSV42VMQzDqfp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 21:27:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="GKuCbVx1"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MSN13TQMzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 21:21:53 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id h195so2307894pfe.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 04:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HNDV9DT7O32N2h9l7CrACdWJSzNVfR3Dv9pnUT55kOg=;
 b=GKuCbVx1t+eL5NuSXYg24Zb8O/7qTbI6sdxmgVMesG2eQh9g+M4P/EvE8/9CODfonb
 HkkHFG8Jfj0z4u6Wejfvymvg0FJ/jFlvzomETWUK76xRmoT4O1vaYZFlHdPyE8vpCFrZ
 3vAjdReE6wxH63jd/H9o8cAAEV+he33Jb66Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNDV9DT7O32N2h9l7CrACdWJSzNVfR3Dv9pnUT55kOg=;
 b=tuZU0p2BbfwxoMoMh8wun0ASG1c1s5G+kM2d8r8m/OolE7vqE7Ej2T2N+8pJIBcl4S
 nwlwzoC2aqQJ5nll7m5ci2VZHvfWGKgLhPaIeBLhzvioqikUAt2vpiC4+67qXzlVpY8/
 X6YeQJhzl4DmXLam5aqP9cQxb1SfEyagApFQ7/KKjbylFSF16LG7keSVjkSMq+6Mkb6Y
 Ez4OYQ3MGVCOVnSVf0OVHkK7B08wfcWgESZI0u86UAxy9AWOlOrEHQKP0ENRZckuySyS
 BpN2R7sUsmauwcTC+jdSRcA/cT5E87/eAIxG8L1o1lfUspvsuTxw7Ix7f8XkCp8O9M4G
 kILg==
X-Gm-Message-State: APjAAAWhywNMTrRw3tZ3b3q4tS0aItTuJVW9b7sq+sxzQOHjEgWvCh/p
 AB/LVwLwjPcNz3E4vDFstSv37Q==
X-Google-Smtp-Source: APXvYqxtvaCM3hqb+7Izu1R5iMb3P+H/OrJHoZiO5jXOxIbwph4iMi5iHPiqM6OOmUWJg7dmwTafQA==
X-Received: by 2002:a63:b904:: with SMTP id z4mr24200059pge.388.1567423310696; 
 Mon, 02 Sep 2019 04:21:50 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id o64sm7133044pjb.24.2019.09.02.04.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:21:50 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v6 2/5] kasan: add test for vmalloc
Date: Mon,  2 Sep 2019 21:20:25 +1000
Message-Id: <20190902112028.23773-3-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902112028.23773-1-dja@axtens.net>
References: <20190902112028.23773-1-dja@axtens.net>
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

