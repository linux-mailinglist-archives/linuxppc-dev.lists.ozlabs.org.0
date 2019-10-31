Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 893D5EACCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 10:46:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473gSl1W6CzF2ZM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 20:46:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="WNnsrZjR"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473gJb0ytczF5dg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 20:39:27 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id c13so3982990pfp.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bVXjkvYDDmbnxsC38vuCWt+2DP5YT7XnHdrJpHAvWR8=;
 b=WNnsrZjRTgHN6z6qKlm3PPgDZ1DUQyGBME1hqttIlhCsP6pp51i+VPTsPipTm3KOvJ
 GEptraycQIRKuAP1Hj9aeVXUefmzwkWW5fefm1hacJjRHsvlIYfTLhVRVB97p5euRlwi
 jr0ph8pnjBiRogObdVC2UZwlO/vOSBdYij0G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bVXjkvYDDmbnxsC38vuCWt+2DP5YT7XnHdrJpHAvWR8=;
 b=PGKK6+wl8cH9D0Pr7MtbB6M/i5tySonwnNSVppgJgyHyq9O8H4DMWkCSiLIwkLRLcz
 CsXiXS+tYxEm1fGmz21xIZbbnHkzGrHKUyFOy5MP6AvsiiJiZG+dV/2yxBB948ziDTnG
 E106JvkhViBtwc796cBTsztsyfDc7Cp1OAntV8u8D0LeqjsHTm1osXoCjos/p7BT5r4J
 TOo3VCfZietIb/2eMT5Hvc1qx04xkwircydOrZycExGAKGDsZYyO7LoEuj0JMHd5YyMQ
 7nr0Ac6l0R9xJOW/vYaYRxbOVmpJyxpOQTMhhgbyUC5rU8CjM7ZAK5JBtyz8ADtLyTre
 eyKQ==
X-Gm-Message-State: APjAAAUf9VmpOvU2fyuZa86wGNJclrErO0p2TOMPR31j+JqcwqbT+++f
 6ITKQD0Dze5Op+lZLdGu31aMHg==
X-Google-Smtp-Source: APXvYqzVRXl1zQigZoY89DcUqTx/QAdcydg/VNoN51Ltb+z4DjNulE5WAl6UPNAKeADCABZ+amSUTQ==
X-Received: by 2002:a17:90a:1f4b:: with SMTP id
 y11mr5863515pjy.123.1572514764668; 
 Thu, 31 Oct 2019 02:39:24 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-783a-2bb9-f7cb-7c3c.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:783a:2bb9:f7cb:7c3c])
 by smtp.gmail.com with ESMTPSA id n15sm2785042pfq.146.2019.10.31.02.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 02:39:23 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v11 2/4] kasan: add test for vmalloc
Date: Thu, 31 Oct 2019 20:39:07 +1100
Message-Id: <20191031093909.9228-3-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031093909.9228-1-dja@axtens.net>
References: <20191031093909.9228-1-dja@axtens.net>
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

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
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

