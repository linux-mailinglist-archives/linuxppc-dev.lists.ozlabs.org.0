Return-Path: <linuxppc-dev+bounces-8662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75750ABBC30
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 13:20:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1FbD74Csz2xBV;
	Mon, 19 May 2025 21:20:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747653608;
	cv=none; b=bF603TCSKZlUe1Bfy006A4S2IJMuOCPB8Dj4fP7GajYV0aYeVeFnsdQMtyJ26VdUc9xA2n/rMizehnoD2bKBglcKriIoPAjeDyxYgBsU87eAjdTX6bCM38ZVjY9sctS50uEa84pWzkS6fyMV85vhZxc4JJl/ll6ioVTzR84ZKvUvlZBNO3i8LYLYE580DWl0aVY03nM3uob83cm+bIsimVJO8oGAlM7bfU8Bk+pOEeYIIUwp58IaM3yRsGr3fqvpVxtYOqg14aY7+7+IDWzVFgDVE7VVjXHGajjLkw9miwg85xLQxLsAvUq2nGPlpsc3Urghm3hJAcBR80lft5SYag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747653608; c=relaxed/relaxed;
	bh=Pg/h+3AUuXh+Lp//vEQMpLvp/Pda67WjMagYQLQYIHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cA0BFYZQfENCX9pGf35GJy/7rVI8ObUub+Yx6wXpMVgMLJQEirJRpUqiSblT2WFcVsDPh0GARUG9hOZ+dpMZW2G1nPTR/q8cLgM6YexhNPDsB7u8xTY18AIwgn7VrkdE8TRDe/AlVurd01HeW33ElbIFMsWa215tX8chKdj0Cvf9Eed62kZ/wTSNrOBV/aALBDHs7s2EhMHIsuZgEjbTJ3uWHdFrtserW39Q7Mf6dmoS5IWGeCfuHg1dIBRsQPTe6rMGDSVPBADk8RO38s8/GlZP0vQXhqx6rwu+k8fVK4nKu85+DLPW1+ow/SM8lEP+iIu6POdJ6tC4KFkNJDMktw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=FlgA5dG8; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=FlgA5dG8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1Fb843Ftz2ygn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 21:20:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Pg/h+3AUuXh+Lp//vEQMpLvp/Pda67WjMagYQLQYIHw=; b=FlgA5d
	G8GgeflPZkA3xueZMltVQcJhbp0y8nMWJgZ3oNs6jLij1j5LdEDjvj+BvITOrNa6
	rNNdINIX0aIGFIkDrYKLy29isibdUvofLEdqu1Eucx9GawQFTpqZz+BFa8UDM1Hv
	xCrX4SKz9V46cFD3s9IdtbPOG+D95OrHU+Rq7tMLertpU4PVjCJ/eRHwAgcP8cbm
	m2YNGJLellYWSgvYk/9CwoAUImH/xPqpNS9kelaph2PsRvwtZSMpbzTG05W53skF
	tNnO6rVSwliO6kkv8iF21N1+Lq+BoovqRY5zTmDM662HQV3JqtTQbo+udRBGLT3Q
	8mBVy0hFBbFc1EAA==
Received: (qmail 2453716 invoked from network); 19 May 2025 13:13:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:13:21 +0200
X-UD-Smtp-Session: l3s3148p1@q6k3OHs1estZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] i2c: powermac: convert of_node usage to fwnode
Date: Mon, 19 May 2025 13:13:12 +0200
Message-ID: <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

'of_node' in i2c_boardinfo is deprecated in favor of 'fwnode'. The I2C
core handles them equally, so simply convert this driver to fwnode.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-powermac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index 9a867c817db0..f99a2cc721a8 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -349,7 +349,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 		/* Fill out the rest of the info structure */
 		info.addr = addr;
 		info.irq = irq_of_parse_and_map(node, 0);
-		info.of_node = of_node_get(node);
+		info.fwnode = of_fwnode_handle(of_node_get(node));
 
 		newdev = i2c_new_client_device(adap, &info);
 		if (IS_ERR(newdev)) {
-- 
2.47.2


