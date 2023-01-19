Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E87886734D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 10:54:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyHzN5QkMz3fCt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 20:54:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JmeRmKIx;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=W4gz9+a1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JmeRmKIx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=W4gz9+a1;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyHyP4RMDz3ch7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 20:53:49 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id D8E7E38562;
	Thu, 19 Jan 2023 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674122025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K5Wjtf9hLzRkuQgSxBaDv2x2hWptBx8DnMTdLdxBFys=;
	b=JmeRmKIxA6LcTyfKL46wUKQQNW++j5YCwI2EWzrWqc5lJBCJIisF2fK988F9sSL9hOiPLb
	7VDN++/nwTj39/JeiH2rRbyjjJ3Lybm1hAjvfdiXu1dj6hmt2KO/8opk+B/kYdfQBKc4K1
	hK5CGO2UJtE0+0SnXEbldehQ/6TlDAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674122025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K5Wjtf9hLzRkuQgSxBaDv2x2hWptBx8DnMTdLdxBFys=;
	b=W4gz9+a1bRbUTmeUmj43HT5F78l511dttU0eg+3fYuLsqWanKN8UgFIovvKDV5LDR+eYhH
	+5jwqSM1gnnDzMDw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id A9E912C141;
	Thu, 19 Jan 2023 09:53:45 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: "Erhard F." <erhard_f@mailbox.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2] of: Fix of platform build on powerpc due to bad of disaply code
Date: Thu, 19 Jan 2023 10:53:23 +0100
Message-Id: <20230119095323.4659-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118215045.5551-1-msuchanek@suse.de>
References: 
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, open list <linux-kernel@vger.kernel.org>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit 2d681d6a23a1 ("of: Make of framebuffer devices unique")
breaks build because of wrong argument to snprintf. That certainly
avoids the runtime error but is not the intended outcome.

Also use standard device name format of-display.N for all created
devices.

Fixes: 2d681d6a23a1 ("of: Make of framebuffer devices unique")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v2: Update the device name format
---
 drivers/of/platform.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f2a5d679a324..8c1b1de22036 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -525,7 +525,9 @@ static int __init of_platform_default_populate_init(void)
 	if (IS_ENABLED(CONFIG_PPC)) {
 		struct device_node *boot_display = NULL;
 		struct platform_device *dev;
-		int display_number = 1;
+		int display_number = 0;
+		char buf[14];
+		char *of_display_format = "of-display.%d";
 		int ret;
 
 		/* Check if we have a MacOS display without a node spec */
@@ -556,7 +558,10 @@ static int __init of_platform_default_populate_init(void)
 			if (!of_get_property(node, "linux,opened", NULL) ||
 			    !of_get_property(node, "linux,boot-display", NULL))
 				continue;
-			dev = of_platform_device_create(node, "of-display", NULL);
+			ret = snprintf(buf, sizeof(buf), of_display_format, display_number++);
+			if (ret >= sizeof(buf))
+				continue;
+			dev = of_platform_device_create(node, buf, NULL);
 			if (WARN_ON(!dev))
 				return -ENOMEM;
 			boot_display = node;
@@ -564,10 +569,9 @@ static int __init of_platform_default_populate_init(void)
 		}
 
 		for_each_node_by_type(node, "display") {
-			char *buf[14];
 			if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
 				continue;
-			ret = snprintf(buf, "of-display-%d", display_number++);
+			ret = snprintf(buf, sizeof(buf), of_display_format, display_number++);
 			if (ret >= sizeof(buf))
 				continue;
 			of_platform_device_create(node, buf, NULL);
-- 
2.35.3

