Return-Path: <linuxppc-dev+bounces-784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FDB96560B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 05:58:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww4Bk3yxpz304l;
	Fri, 30 Aug 2024 13:58:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.35
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724990318;
	cv=none; b=CWHpuehoL7pYyRczuv6ksiU039b7eUypSUa3K+hU/H7qzEbXLJkiHIEIil7S7tP3/YFfEUA+fOHJbjExz2N40TgAD6qvewKQApjrpglVQt9goqgrQwuDUqKnfNIEOt8uooWRoc9vyIsrNUPJ2V81t03w7lDGHI14R8PHXDjBYNu6VTXWrZ87vXwWzbVd3HsHbGyzaEo9yMkNyJsO3ovNErAmCR9kIGTFwB8BicA19ROWkRMMpVLnQaeii+lhPNiL/RTIcgIWpbRa0EqQtBgFNflGNV2wK4yXslHdDCEpj4NjIYMb3xunvbClZs+QDlSNZ8/IlLFMd9B4qRHKCmEIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724990318; c=relaxed/relaxed;
	bh=IaZ09lYynaRJJ8ecuz1Va8Vbk4D7PbIxaDqDpy2T/Mo=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=igKPLpX14MON9v8xMFOxpwkgKnMuFFj+6SKCWbUkb0uRHJsbj2vfAeMCBdmpOF/uq235oz5HNZ5tgIk+15eMcEqH75I8QIfU1z+Z3Gn0Ydd/VM0cb7JUvabJ1WFlGbW3A14NeSKfZuUh6r9fdHGOXobB/tdBnBAglppNxBdufLovbV4jK3tWAzhr5ZW7EgkyFbMZgu+kewN/HaQoSR2rwIPbXBQ8xUiMlHF/cVraDB5mTpdUCwVAXlBCPqQub//ZwJ4z89GbvaHS+uUQqM3dBips3X6ps4Jr3gMb5mCBzoihSzeBSEmf8/rR8+HtBpzxW8os/+Vi99s9v1zuiHjW1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww4Bj4PVpz3041
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 13:58:35 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Ww4BH6df0z1S9QM;
	Fri, 30 Aug 2024 11:58:15 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 0DF771A0188;
	Fri, 30 Aug 2024 11:58:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 11:58:29 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <herve.codina@bootlin.com>, <qiang.zhao@nxp.com>,
	<christophe.leroy@csgroup.eu>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 2/4] soc: fsl: cpm1: Simplify with dev_err_probe()
Date: Fri, 30 Aug 2024 12:06:34 +0800
Message-ID: <20240830040636.3508679-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830040636.3508679-1-ruanjinjie@huawei.com>
References: <20240830040636.3508679-1-ruanjinjie@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use the dev_err_probe() helper to simplify error handling during probe.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Update the commit message.
---
 drivers/soc/fsl/qe/tsa.c | 62 +++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 7fa399b7a47c..fc37d23b746d 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -453,10 +453,8 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 
 	for_each_available_child_of_node_scoped(np, tdm_np) {
 		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
-		if (ret) {
-			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
 		switch (tdm_id) {
 		case 0:
 			tsa->tdms |= BIT(TSA_TDMA);
@@ -465,18 +463,15 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			tsa->tdms |= BIT(TSA_TDMB);
 			break;
 		default:
-			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n", tdm_np,
-				tdm_id);
-			return -EINVAL;
+			return dev_err_probe(tsa->dev, -EINVAL, "%pOF: Invalid tdm_id (%u)\n",
+					     tdm_np, tdm_id);
 		}
 	}
 
 	for_each_available_child_of_node_scoped(np, tdm_np) {
 		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
-		if (ret) {
-			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
 
 		tdm = &tsa->tdm[tdm_id];
 		tdm->simode_tdm = TSA_SIMODE_TDM_SDM_NORM;
@@ -484,35 +479,26 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 		val = 0;
 		ret = of_property_read_u32(tdm_np, "fsl,rx-frame-sync-delay-bits",
 					   &val);
-		if (ret && ret != -EINVAL) {
-			dev_err(tsa->dev,
-				"%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
-				tdm_np);
-			return ret;
-		}
-		if (val > 3) {
-			dev_err(tsa->dev,
-				"%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
-				tdm_np, val);
-			return -EINVAL;
-		}
+		if (ret && ret != -EINVAL)
+			return dev_err_probe(tsa->dev, ret,
+					     "%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
+					     tdm_np);
+		if (val > 3)
+			return dev_err_probe(tsa->dev, -EINVAL,
+					     "%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
+					     tdm_np, val);
 		tdm->simode_tdm |= TSA_SIMODE_TDM_RFSD(val);
 
 		val = 0;
 		ret = of_property_read_u32(tdm_np, "fsl,tx-frame-sync-delay-bits",
 					   &val);
-		if (ret && ret != -EINVAL) {
-			dev_err(tsa->dev,
-				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n",
-				tdm_np);
-			return ret;
-		}
-		if (val > 3) {
-			dev_err(tsa->dev,
-				"%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
-				tdm_np, val);
-			return -EINVAL;
-		}
+		if (ret && ret != -EINVAL)
+			return dev_err_probe(tsa->dev, ret,
+				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n", tdm_np);
+		if (val > 3)
+			return dev_err_probe(tsa->dev, -EINVAL,
+					     "%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
+					     tdm_np, val);
 		tdm->simode_tdm |= TSA_SIMODE_TDM_TFSD(val);
 
 		if (of_property_read_bool(tdm_np, "fsl,common-rxtx-pins"))
@@ -645,10 +631,8 @@ static int tsa_probe(struct platform_device *pdev)
 		return PTR_ERR(tsa->si_regs);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "si_ram");
-	if (!res) {
-		dev_err(tsa->dev, "si_ram resource missing\n");
-		return -EINVAL;
-	}
+	if (!res)
+		return dev_err_probe(tsa->dev, -EINVAL, "si_ram resource missing\n");
 	tsa->si_ram_sz = resource_size(res);
 	tsa->si_ram = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(tsa->si_ram))
-- 
2.34.1


