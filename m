Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F88686B76
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 17:23:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6S063FY4z3f6L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 03:23:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.45; helo=mail-ot1-f45.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6RzX0kC8z3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 03:23:02 +1100 (AEDT)
Received: by mail-ot1-f45.google.com with SMTP id cm26-20020a056830651a00b00684e5c0108dso6553379otb.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Feb 2023 08:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R40wPAUHV11BoLIxg3n5Gsakpb6u6fji29HG4MLTY4o=;
        b=kxDdAwVxxIdhjW0WXC3A+ZA+kdbStifdRsUETlTsA+9v7Ay65eTyK3u/NGFsxdLFns
         vYSbXBXyOvXX1eHbzYL7g81i2U+6dZuYdUU9B76l+QJACPuRpwz1XPdJ0EMPY77SDBf6
         TZ+oydlx8gxgoHUolzZRK/iYakRt5tn7Fr4DC+AX5M/D7Xzi12BqPhz0OWKxsZ5IwHu5
         TnhmuyU+H8iCj89/Q7Jpg5CD6CqyxaUbQwVSWoEiTyrWTJRp+8GrJ6qDQXP7XE3yYsgn
         JkAeuqVheFfNsTeR8TanflHjOQ6K/b19htqAWbZRHR9qkFs3cqQCtCM5yUXmzhqhU5bn
         OKdg==
X-Gm-Message-State: AO0yUKWGM7bqS47WPfaXlC7+mAsLZfBsfq6B4nKXolZUgLMHAbGvgh+H
	szM30IUismcFxO9ANo1ePA==
X-Google-Smtp-Source: AK7set/UX1tfLsIgf/HC8D7E26Rttu7INRWLZgG9CGpFRsZtZJmjwG0t2Ty7lv8janpvOOJu5kq1nA==
X-Received: by 2002:a05:6830:2b1f:b0:68b:c04d:79ca with SMTP id l31-20020a0568302b1f00b0068bc04d79camr2413569otv.33.1675268578345;
        Wed, 01 Feb 2023 08:22:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c20-20020a9d6854000000b006864ccdb053sm5694860oto.26.2023.02.01.08.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:22:58 -0800 (PST)
Received: (nullmailer pid 3575712 invoked by uid 1000);
	Wed, 01 Feb 2023 16:22:57 -0000
From: Rob Herring <robh@kernel.org>
To: Frank Rowand <frowand.list@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4] of: Make OF framebuffer device names unique
Date: Wed,  1 Feb 2023 10:22:47 -0600
Message-Id: <20230201162247.3575506-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: "Erhard F ." <erhard_f@mailbox.org>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michal Suchanek <msuchanek@suse.de>

Since Linux 5.19 this error is observed:

sysfs: cannot create duplicate filename '/devices/platform/of-display'

This is because multiple devices with the same name 'of-display' are
created on the same bus. Update the code to create numbered device names
for the displays.

Also, fix a node refcounting issue when exiting the boot display loop.

cc: linuxppc-dev@lists.ozlabs.org
References: https://bugzilla.kernel.org/show_bug.cgi?id=216095
Fixes: 52b1b46c39ae ("of: Create platform devices for OF framebuffers")
Reported-by: Erhard F. <erhard_f@mailbox.org>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Link: https://lore.kernel.org/r/20230120180958.30798-1-msuchanek@suse.de
[robh: Rework to avoid node refcount leaks]
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/platform.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 81c8c227ab6b..b3878a98d27f 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -525,6 +525,7 @@ static int __init of_platform_default_populate_init(void)
 	if (IS_ENABLED(CONFIG_PPC)) {
 		struct device_node *boot_display = NULL;
 		struct platform_device *dev;
+		int display_number = 0;
 		int ret;
 
 		/* Check if we have a MacOS display without a node spec */
@@ -555,16 +556,23 @@ static int __init of_platform_default_populate_init(void)
 			if (!of_get_property(node, "linux,opened", NULL) ||
 			    !of_get_property(node, "linux,boot-display", NULL))
 				continue;
-			dev = of_platform_device_create(node, "of-display", NULL);
+			dev = of_platform_device_create(node, "of-display.0", NULL);
+			of_node_put(node);
 			if (WARN_ON(!dev))
 				return -ENOMEM;
 			boot_display = node;
+			display_number++;
 			break;
 		}
 		for_each_node_by_type(node, "display") {
+			char buf[14];
+			const char *of_display_format = "of-display.%d";
+
 			if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
 				continue;
-			of_platform_device_create(node, "of-display", NULL);
+			ret = snprintf(buf, sizeof(buf), of_display_format, display_number++);
+			if (ret < sizeof(buf))
+				of_platform_device_create(node, buf, NULL);
 		}
 
 	} else {
-- 
2.39.0

