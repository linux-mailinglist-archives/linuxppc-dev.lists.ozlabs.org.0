Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F96393F7C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:27:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kVYrv20k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgg01GKGz3cxn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:27:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kVYrv20k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgX45283z3cNB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:24 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 80A11240013;
	Mon, 29 Jul 2024 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=APwAy045+0bwsYWXWzWi8kg7IB9CU666Ib602lP5Ma0=;
	b=kVYrv20k9mDyvJa3yczKwdZwYx75K97npjDH5zsl2GPd2zsjhu2NlrlS2T2YOrEQbsgiDt
	V0rXu+s8ckXoYEdKSqB5UMYn2J2ZoHe2f4wamw65BKlI2sjCWuplDcENM1MPPIW4ZWkbl6
	AR5WSdky/9yQxQDjc4mYIygzUT4Rk1O9MurEv/k+9piH5h9bTUNVropze7ofL/vBwOrnvA
	AGbWV8JYqfbz1bily/WJqFoslXeF0mTwOQtklpjqxKC0bgdfaln6CziMZZ7AsYDRn2SZOI
	1iwJzL/htTGBoWZE1afdSRCZF7P9vaxD6xi/aU6Hy5zqAN3Amhu9EahczScnOQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 05/36] soc: fsl: cpm1: tsa: Fix blank line and spaces
Date: Mon, 29 Jul 2024 16:20:34 +0200
Message-ID: <20240729142107.104574-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240729142107.104574-1-herve.codina@bootlin.com>
References: <20240729142107.104574-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

checkpatch.pl raises the following issues
  CHECK: Please don't use multiple blank lines
  CHECK: spaces preferred around that '/' (ctx:VxV)
  CHECK: spaces preferred around that '+' (ctx:VxV)
  CHECK: spaces preferred around that '-' (ctx:VxV)

Fix them.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/tsa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index dc4dda17dab8..7b1032fb1572 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -18,7 +18,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-
 /* TSA SI RAM routing tables entry */
 #define TSA_SIRAM_ENTRY_LAST		BIT(16)
 #define TSA_SIRAM_ENTRY_BYTE		BIT(17)
@@ -244,8 +243,8 @@ static void tsa_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area
 	resource_size_t quarter;
 	resource_size_t half;
 
-	quarter = tsa->si_ram_sz/4;
-	half = tsa->si_ram_sz/2;
+	quarter = tsa->si_ram_sz / 4;
+	half = tsa->si_ram_sz / 2;
 
 	if (tdms == BIT(TSA_TDMA)) {
 		/* Only TDMA */
@@ -408,7 +407,7 @@ static int tsa_of_parse_tdm_route(struct tsa *tsa, struct device_node *tdm_np,
 		}
 
 		dev_dbg(tsa->dev, "tdm_id=%u, %s ts %u..%u -> %s\n",
-			tdm_id, route_name, ts, ts+count-1, serial_name);
+			tdm_id, route_name, ts, ts + count - 1, serial_name);
 		ts += count;
 
 		ret = tsa_add_entry(tsa, &area, count, serial_id);
-- 
2.45.0

