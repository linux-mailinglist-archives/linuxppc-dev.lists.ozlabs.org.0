Return-Path: <linuxppc-dev+bounces-599-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CE99608E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 13:38:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtQXZ6QlGz2yVD;
	Tue, 27 Aug 2024 21:38:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.255
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724758702;
	cv=none; b=R1ordicBDWRaE3GVGORwQ1wcDl/7lFCePtL0wAQskrjTCggUAvO1rV5kvRkefEIDbheLud4eWLcuGWKDecgEH8gWJJTehdkY0RLWaxJ7dVgpmzLAVkPIk8WB3kgfp5+/FtT0HA+HexabNek1F5+iGYgBbnYx2sWnwUxyqzss3bgnTIIV8m1WlRrrp4TGfvJ+B/dS76FePvO+6iiT3uIBTmAqpmuaOYnucTXVkMpZ+6M7qCUJ9UGBt6xnzGL9JD6n2o90leT5IpfUao1muQ89ma5szZdNwaJC0+7k13YhB7YlekQAV9tYWTKkZ9A1207qFS/6ygwbfn5dYgm5adlAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724758702; c=relaxed/relaxed;
	bh=3yiIX9LDkrPDh7GRPqepNE1yKgPXfYii7nzLUNDEKOo=;
	h=Received:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=YcOa4I1MI/c6RuwKa630JT95ItSGzbioHwa/6/GzQMz/VnQxnRVOHZz3853e7AO1RX+BdyD4Xryvih/9I/TvgG7WpoObCSP/XiTireW74uU5DoxbKm5+L+hBXxoFHCQKR54duJa406mRq5TtjIOBy999Ms9w37vwXvgGmx+YyhE9Ib/H1VZs0FV3iHUqeD9t/8Jm89qKGpBdEZQ5GZFmOHHTFf+JiUrXS4vsnPG0ngtO1qRmMhJP7qRm3w6Xh22yEmJ7ah4w0LijfIiZPULuYQgqJbgCdqY6xSJNbo+a6AiHwLsbs0BjLs2hMErwnfeag5UN/Y3YA7QZzKsUqGnZ5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtQXY71v4z2yLY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 21:38:21 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WtQWY6Vpgz14GKW;
	Tue, 27 Aug 2024 19:37:29 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id C5510140202;
	Tue, 27 Aug 2024 19:38:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <andrew@lunn.ch>, <sebastian.hesselbarth@gmail.com>,
	<gregory.clement@bootlin.com>, <herve.codina@bootlin.com>,
	<qiang.zhao@nxp.com>, <christophe.leroy@csgroup.eu>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <nm@ti.com>,
	<ssantosh@kernel.org>, <petlozup@nvidia.com>, <pshete@nvidia.com>,
	<ruanjinjie@huawei.com>, <christophe.jaillet@wanadoo.fr>,
	<ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-tegra@vger.kernel.org>, <krzk@kernel.org>, <jic23@kernel.org>
Subject: [PATCH -next 7/8] soc: ti: knav_dma: Simplify with scoped for each OF child loop
Date: Tue, 27 Aug 2024 19:46:06 +0800
Message-ID: <20240827114607.4019972-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827114607.4019972-1-ruanjinjie@huawei.com>
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

And use the dev_err_probe() helper to simplify error handling during
probe. This also handle scenario, when EDEFER is returned and useless
error is printed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/soc/ti/knav_dma.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index fb0746d8caad..eeec422a46f0 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -706,20 +706,15 @@ static int knav_dma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
-	struct device_node *child;
 	int ret = 0;
 
-	if (!node) {
-		dev_err(&pdev->dev, "could not find device info\n");
-		return -EINVAL;
-	}
+	if (!node)
+		return dev_err_probe(&pdev->dev, -EINVAL, "could not find device info\n");
 
 	kdev = devm_kzalloc(dev,
 			sizeof(struct knav_dma_pool_device), GFP_KERNEL);
-	if (!kdev) {
-		dev_err(dev, "could not allocate driver mem\n");
-		return -ENOMEM;
-	}
+	if (!kdev)
+		return dev_err_probe(dev, -ENOMEM, "could not allocate driver mem\n");
 
 	kdev->dev = dev;
 	INIT_LIST_HEAD(&kdev->list);
@@ -732,10 +727,9 @@ static int knav_dma_probe(struct platform_device *pdev)
 	}
 
 	/* Initialise all packet dmas */
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		ret = dma_init(node, child);
 		if (ret) {
-			of_node_put(child);
 			dev_err(&pdev->dev, "init failed with %d\n", ret);
 			break;
 		}
-- 
2.34.1


