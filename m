Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1147066E440
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 17:59:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxFV66B5Vz3cdZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 03:59:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JUbOFdVF;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6lqQPt2R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JUbOFdVF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6lqQPt2R;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxFT72DhPz3cGd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 03:58:18 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id C82ED1F74D;
	Tue, 17 Jan 2023 16:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673974694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LPaYt3U/+H6P7eBulHoAyo/q+calGwfFAzTXNU5KimU=;
	b=JUbOFdVFaKmrVOvq3sVHVsHhZME515FfjfYS7VHGzK5iYuLYMfMS6XuVdEFSaC0O6qpq3Q
	vD1FYrqYADCWjNkGT4UKaY4wFwccoT86mCEXTJmmSh2x0JjDlcR1RT2FUCgRnNlzxX170d
	ZcKLPiEXMhIFVsSNZKqEz0NNPOVa7Mc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673974694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LPaYt3U/+H6P7eBulHoAyo/q+calGwfFAzTXNU5KimU=;
	b=6lqQPt2RsGNeAnbw/9nYXIXLKwIjFo1wjbBxGc33WOcfLKrlQtQ0VUgSK1Qb87xIA/hf/f
	nU/JiqL58TrC/9Cw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id 879F62C141;
	Tue, 17 Jan 2023 16:58:14 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: 
Subject: [PATCH] of: Make of framebuffer devices unique
Date: Tue, 17 Jan 2023 17:58:04 +0100
Message-Id: <20230117165804.18036-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.35.3
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, "Erhard F ." <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org, Javier Martinez Canillas <javierm@redhat.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Michal Suchanek <msuchanek@suse.de>, Frank Rowand <frowand.list@gmail.com>
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
 drivers/of/platform.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 81c8c227ab6b..f2a5d679a324 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -525,6 +525,7 @@ static int __init of_platform_default_populate_init(void)
 	if (IS_ENABLED(CONFIG_PPC)) {
 		struct device_node *boot_display = NULL;
 		struct platform_device *dev;
+		int display_number = 1;
 		int ret;
 
 		/* Check if we have a MacOS display without a node spec */
@@ -561,10 +562,15 @@ static int __init of_platform_default_populate_init(void)
 			boot_display = node;
 			break;
 		}
+
 		for_each_node_by_type(node, "display") {
+			char *buf[14];
 			if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
 				continue;
-			of_platform_device_create(node, "of-display", NULL);
+			ret = snprintf(buf, "of-display-%d", display_number++);
+			if (ret >= sizeof(buf))
+				continue;
+			of_platform_device_create(node, buf, NULL);
 		}
 
 	} else {
-- 
2.35.3

