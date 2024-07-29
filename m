Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B999F93F7CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:28:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=WGI9iWGX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXggl4nh3z2ypm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:28:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=WGI9iWGX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgX45Dw9z3cTG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:24 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4A950240002;
	Mon, 29 Jul 2024 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CMTNP6nIDlPN6mndO+22CDidWRq33DXdG24hHtwqOs=;
	b=WGI9iWGXuYuJgKNp12X9G1lvRUkSv8XXk9oR7Og9j5CpEERltmgiYlAXBz0U9pN7uKmvbT
	0hc7ZbzQLChp7hw027Rx2BEW0pqNLhckpGXneA6L6dP34kOESGAqyaCBzgrIx3IeFWBBYS
	vUxUTurkrW2pOW0DMBx6o/gNIbcP2wpXU4JiIDVZdmCM509s+xBOGhxHHvOMFKAzkCpVF4
	eEs4oybJ7eFsUpvQ1olAT++s+/sxFrIyU02f28Hoa1XMUtIUb9bLnEG60LL2uNe95FIXOb
	E68kh5UV+RH16Z66flSkr3ot6u2ATvvDSSmCxWmgLiCS3wf56lxABEnPxeriwQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 09/36] soc: fsl: cpm1: tsa: Use ARRAY_SIZE() instead of hardcoded integer values
Date: Mon, 29 Jul 2024 16:20:38 +0200
Message-ID: <20240729142107.104574-10-herve.codina@bootlin.com>
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

Loops handling the tdm array use hardcoded size and the initialization
part uses hardcoded indexes to initialize the array.

Use ARRAY_SIZE() to avoid the hardcoded size and initialize the array
using a loop.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/tsa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 244d521d8780..3d0c31a62dbb 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -448,8 +448,8 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 	int i;
 
 	tsa->tdms = 0;
-	tsa->tdm[0].is_enable = false;
-	tsa->tdm[1].is_enable = false;
+	for (i = 0; i < ARRAY_SIZE(tsa->tdm); i++)
+		tsa->tdm[i].is_enable = false;
 
 	for_each_available_child_of_node(np, tdm_np) {
 		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
@@ -609,7 +609,7 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 	return 0;
 
 err:
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < ARRAY_SIZE(tsa->tdm); i++) {
 		if (tsa->tdm[i].l1rsync_clk) {
 			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
 			clk_put(tsa->tdm[i].l1rsync_clk);
@@ -710,7 +710,7 @@ static void tsa_remove(struct platform_device *pdev)
 	struct tsa *tsa = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < ARRAY_SIZE(tsa->tdm); i++) {
 		if (tsa->tdm[i].l1rsync_clk) {
 			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
 			clk_put(tsa->tdm[i].l1rsync_clk);
-- 
2.45.0

