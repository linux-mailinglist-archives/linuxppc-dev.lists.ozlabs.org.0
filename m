Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBFD94B74E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:14:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=b/7FZ3bx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfdZr1lzHz3bnL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:14:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=b/7FZ3bx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWm0WFxz3dBt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:47 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id D49C4C000F;
	Thu,  8 Aug 2024 07:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CMTNP6nIDlPN6mndO+22CDidWRq33DXdG24hHtwqOs=;
	b=b/7FZ3bxk2VwTGeRteJCLCnnOHnlEyFnzH6XfwV3duaSwJmncP8myLRxUpnnXJtUXW/qsv
	5Em9q4/rVkujsA2imLjiG9YLBxHW01CB7s+xgOUO0J7wpvHeSOEJCo9GY2+mYR8vyC+Ukq
	lb1v9pOd4AoYoaD3WXKTSNehBay38/8xkSH95xkUu0wyVl8usmT9D0zgUtNyqJDWiJ2ixD
	YPyHSjIIRR9A/jvMyMobA611eqgaU72jusrBxKhzvBHd9mVTY6IwM0Htr9x1eg0NP6fKgp
	xDsxHrUH2ilQwccyEMeBwFtlGTj70iNGNoLqFlKc//FBtNT587tFzGP4AgSaXA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 09/36] soc: fsl: cpm1: tsa: Use ARRAY_SIZE() instead of hardcoded integer values
Date: Thu,  8 Aug 2024 09:11:02 +0200
Message-ID: <20240808071132.149251-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240808071132.149251-1-herve.codina@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
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

