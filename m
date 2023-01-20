Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DABA0675C76
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 19:11:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz6xd4r65z3fHj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 05:11:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0kWIhRlh;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pMQoSUb2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0kWIhRlh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pMQoSUb2;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz6wf31Tlz3bXr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 05:10:09 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id C8FCB5FBEC;
	Fri, 20 Jan 2023 18:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674238201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkN6PpdG4Lfy4P3q90hNQcwHa4prP8EZfXIbP4VPT1k=;
	b=0kWIhRlhN7HnSu+SxpjJGtYLQu4XcH6zs4to/NIdHtBXBculzP4PLNMAV5+yc4d71dJUaG
	oadi+rIkwbUZxynl0J1hzyIy902XaC9+Ri33hyLzl6K3hX/R36Pv7Q5Mvm2wRfdy2Y3xE+
	w77XGUvo5bAgyWquH5lxT++OBk4wtBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674238201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkN6PpdG4Lfy4P3q90hNQcwHa4prP8EZfXIbP4VPT1k=;
	b=pMQoSUb2TTGqCwG6jJMv4mpI6i869ypvc5S+cATJNQF48NGzaXKIy5cpIl8JIQWeK4xXo0
	FcS8/7i4aLHJ0eCA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id 9E25A2C141;
	Fri, 20 Jan 2023 18:10:01 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3] of: Make of framebuffer devices unique
Date: Fri, 20 Jan 2023 19:09:57 +0100
Message-Id: <20230120180958.30798-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <CAL_JsqKo+mdjA485KDb1ZauJcbOU-FR1G-Z2sYYNu7+Zn32wSA@mail.gmail.com>
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
Cc: "Erhard F." <erhard_f@mailbox.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Michal Suchanek <msuchanek@suse.de>, Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since Linux 5.19 this error is observed:

sysfs: cannot create duplicate filename '/devices/platform/of-display'

This is because multiple devices with the same name 'of-display' are
created on the same bus.

Update the code to create numbered device names for the non-boot
disaplay.

cc: linuxppc-dev@lists.ozlabs.org
References: https://bugzilla.kernel.org/show_bug.cgi?id=216095
Fixes: 52b1b46c39ae ("of: Create platform devices for OF framebuffers")
Reported-by: Erhard F. <erhard_f@mailbox.org>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v3:
- merge fix into original patch
- Update the device name format
- add missing const
- do not continue with iterating display devices when formatting device
  name fails
---
 drivers/of/platform.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 81c8c227ab6b..4d3a4d9f79f2 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -525,6 +525,9 @@ static int __init of_platform_default_populate_init(void)
 	if (IS_ENABLED(CONFIG_PPC)) {
 		struct device_node *boot_display = NULL;
 		struct platform_device *dev;
+		int display_number = 0;
+		char buf[14];
+		const char *of_display_format = "of-display.%d";
 		int ret;
 
 		/* Check if we have a MacOS display without a node spec */
@@ -555,7 +558,10 @@ static int __init of_platform_default_populate_init(void)
 			if (!of_get_property(node, "linux,opened", NULL) ||
 			    !of_get_property(node, "linux,boot-display", NULL))
 				continue;
-			dev = of_platform_device_create(node, "of-display", NULL);
+			ret = snprintf(buf, sizeof(buf), of_display_format, display_number++);
+			if (ret >= sizeof(buf))
+				return -EOVERFLOW;
+			dev = of_platform_device_create(node, buf, NULL);
 			if (WARN_ON(!dev))
 				return -ENOMEM;
 			boot_display = node;
@@ -564,7 +570,10 @@ static int __init of_platform_default_populate_init(void)
 		for_each_node_by_type(node, "display") {
 			if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
 				continue;
-			of_platform_device_create(node, "of-display", NULL);
+			ret = snprintf(buf, sizeof(buf), of_display_format, display_number++);
+			if (ret >= sizeof(buf))
+				break;
+			of_platform_device_create(node, buf, NULL);
 		}
 
 	} else {
-- 
2.35.3

