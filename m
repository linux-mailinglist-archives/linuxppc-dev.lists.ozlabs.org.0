Return-Path: <linuxppc-dev+bounces-5356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4D1A14EBA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 12:47:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZHzY0wFHz30Pn;
	Fri, 17 Jan 2025 22:47:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ab"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737114473;
	cv=none; b=lRBg03rglB/Tv/oxK/g8gZdn4AW6BnxApgz20H30juYfCpV6508CqkvU18zBeR7n9rnfx9rXAwWyg7jv6E+sgS4hxrwJwobGuctsHakLqfnqrY/bCETVuIgBOUTWPITjo54mbKBedaPJZRPJx0/P9D4p7QDkzDUVRh8TCd0QsNosjOLL4Y54azrd2MECn4uN7usmAJZWqAnM8Hy2TU1Q07TG9Qhh8ZrrWdYnnYWlmHeFOW+ihxsBKF4zo4+5Hjoo1EcMown0IsTTFgTzGWGNPCqAirnHZg3LQVoNDMOaUDytadWqDHzK+UbiIuvQ78lSNMDQkWBeHkOaGf6fC7Wbsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737114473; c=relaxed/relaxed;
	bh=VOzs1/uk+f0UYDcEG8Y22jpAtVU8GmqKKNkO1hSuNIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gyGuIT0oD7j93C/PY5zVg3H3ZHT3wRGXvEmgIHHfOqT+j9TF42GaIpJijVYruucTalDYtt5hW+2KEK9MtG481e7xugUNM6pkSfDZDpM5I5aDESeKFTTXkwewqWy5ObDdoVQ5N5bURd8u1AHPquUZcrMg0hnVsF9xIwraaxhBIlBAbFg41YIB3Lx6uy11WN8ZOIvwkcWERnQJCY19psVSVMwNKFF95MdUjWbWDvksabNWwUMlYp/cwmRA/fsXPnWdCHDgtdJkF7qY/+dw3rPN4kz51ME6CpXMDWAQ0Ma4lT4VFwg9mI2UXzeqZB3urQEM0QR4EqOf6+6K+4fpYOS7EQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::ab; helo=out-171.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ab; helo=out-171.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZHzR1pW4z2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 22:47:45 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737114439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VOzs1/uk+f0UYDcEG8Y22jpAtVU8GmqKKNkO1hSuNIU=;
	b=DJn1hSiFNhcaaOt10HcodRo54MELfXLd/xyrmDqPqK1g7mNfLDF1W0eijSbrRj9sBXWHyx
	yCD6GjDvXyL44yboHlRwJuSOJqkO4vTTIutki8+TqhPHnEBHi/VVsRGhIbZQ/VUOugc0XJ
	UJoIWvc/g3Z3sOCoAXdbtWmjv/RfM3c=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/powermac: Use str_enabled_disabled() and str_on_off() helpers
Date: Fri, 17 Jan 2025 12:46:20 +0100
Message-ID: <20250117114625.64903-2-thorsten.blum@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove hard-coded strings by using the str_enabled_disabled() and
str_on_off() helper functions.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/platforms/powermac/setup.c | 4 ++--
 arch/powerpc/platforms/powermac/time.c  | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 6de1cd5d8a58..e119ced05d10 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -45,6 +45,7 @@
 #include <linux/root_dev.h>
 #include <linux/bitops.h>
 #include <linux/suspend.h>
+#include <linux/string_choices.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 
@@ -238,8 +239,7 @@ static void __init l2cr_init(void)
 				_set_L2CR(0);
 				_set_L2CR(*l2cr);
 				pr_info("L2CR overridden (0x%x), backside cache is %s\n",
-					*l2cr, ((*l2cr) & 0x80000000) ?
-					"enabled" : "disabled");
+					*l2cr, str_enabled_disabled((*l2cr) & 0x80000000));
 			}
 			of_node_put(np);
 			break;
diff --git a/arch/powerpc/platforms/powermac/time.c b/arch/powerpc/platforms/powermac/time.c
index 8633891b7aa5..b4426a35aca3 100644
--- a/arch/powerpc/platforms/powermac/time.c
+++ b/arch/powerpc/platforms/powermac/time.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/mm.h>
 #include <linux/init.h>
 #include <linux/time.h>
@@ -77,7 +78,7 @@ long __init pmac_time_init(void)
 		delta |= 0xFF000000UL;
 	dst = ((pmac_xpram_read(PMAC_XPRAM_MACHINE_LOC + 0x8) & 0x80) != 0);
 	printk("GMT Delta read from XPRAM: %d minutes, DST: %s\n", delta/60,
-		dst ? "on" : "off");
+		str_on_off(dst));
 #endif
 	return delta;
 }
-- 
2.48.0


