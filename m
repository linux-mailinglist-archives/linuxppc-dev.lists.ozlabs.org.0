Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78307672AE3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 22:51:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxzxJ1xT9z3cD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 08:51:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aqBu6/y8;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wshYCj7T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aqBu6/y8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wshYCj7T;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxzwN1GGxz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 08:50:59 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id DCD3F3F824;
	Wed, 18 Jan 2023 21:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674078656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ImXWQyU4WFGAYv86tZ8Xzi8aUY2vgULsXE686tIBgtA=;
	b=aqBu6/y8+eY7NxuH49S2vhQnojNiXzIIFVXUoWwqh4gQTC/EBxdbk9xbSc9VpUYsGxke+H
	I4j/1Fe8CJ4hNNrv+izPi93x0VR2Nr4YmUAE5duvZK3xnDSsqplfZP/lORSvCITsvISo5b
	vI0Nrq88LJgj1V/hOg/QWTM0fuXMkpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674078656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ImXWQyU4WFGAYv86tZ8Xzi8aUY2vgULsXE686tIBgtA=;
	b=wshYCj7T4L0m6eOKuX/ezCn2oMy5WSPFrp+Mx2EJgbAw9tG7KVya4xbzPFwcjcUOLPVyRw
	PrWMvVbalNRogDBA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id A99192C141;
	Wed, 18 Jan 2023 21:50:56 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: "Erhard F." <erhard_f@mailbox.org>
Subject: [PATCH] of: Fix of platform build on powerpc due to bad of disaply code
Date: Wed, 18 Jan 2023 22:50:45 +0100
Message-Id: <20230118215045.5551-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118211305.42e50a4a@yea>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The commit 2d681d6a23a1 ("of: Make of framebuffer devices unique")
breaks build because of wrong argument to snprintf. That certainly
avoids the runtime error but is not the intended outcome.

Fixes: 2d681d6a23a1 ("of: Make of framebuffer devices unique")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 drivers/of/platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f2a5d679a324..e9dd7371f27a 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -564,10 +564,10 @@ static int __init of_platform_default_populate_init(void)
 		}
 
 		for_each_node_by_type(node, "display") {
-			char *buf[14];
+			char buf[14];
 			if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
 				continue;
-			ret = snprintf(buf, "of-display-%d", display_number++);
+			ret = snprintf(buf, sizeof(buf), "of-display-%d", display_number++);
 			if (ret >= sizeof(buf))
 				continue;
 			of_platform_device_create(node, buf, NULL);
-- 
2.35.3

