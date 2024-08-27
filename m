Return-Path: <linuxppc-dev+bounces-607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5276F9608FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 13:39:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtQY771Gsz2yk8;
	Tue, 27 Aug 2024 21:38:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724758731;
	cv=none; b=TNA/n6HmCCTzSRqiImKzPq6waCsoh6fxY8f2eai3DRngQCV4JPohRTbcH5v1M2Eu21rTxdhF0WcIOT+35YmMxNNprOaUfKFIgKH0ZXpiItjBA4dJUZ1dOwMSc+uA2hQ35Yz1cmIzDJfb4p0+tHi+4M3YokTW/qysaH9zK6UFVx9GnL3VJqRxPZOS/EOVBDrwkvQG8Ru1I+JsmLEZDGDU+kkDhJujrfruIuPHxU3R6Nc6MqeSEPWWCucWcevwlEyd6PpeHvPa8oqtLKnnqUd/hPvgsm/+ntwDwElc+LLepSoM0WDHuONVVImVClxdkH5XxU8DuNhrrcqNoJ7FHSexUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724758731; c=relaxed/relaxed;
	bh=Bh5x8cN6b49le4kLR1yloaUU6CqIls1aVKtyGmnM5Q8=;
	h=Received:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=AxTnKvu4HzlIKNPHx8cElrPoSV/Xp2/oGZd3DxEtrKaF0zUyNHo4H6FokGLUZWZtbOhAJHJI4ZdvoZw3Kv6GFGnlIZ/pZF/yHoxUsd8cloBV6RfMxvS9fyU4GvbtsLDNyN8QeD7KmIKo9LYUhcSq6jR/4naWbCcS1E3e5N9dPtSy8krODLMcl+vnS/JGJvwrl1X1XlShEaJNhyMLLiUhZRAorxKXlZY5qLUxNJ6z0PpnY7gH0XkR2D1lXTLxCMKg/BW8KOg2fgiLScSJHcJ0xbVhK5Hdx/St0lMP72G6VfkbIwPmD+LcJC6ruAHwVMRYffWW4+V3QMWr8IuiMMFanQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtQY73zwMz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 21:38:51 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WtQWX139WzyQZW;
	Tue, 27 Aug 2024 19:37:28 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 51D4B1402DE;
	Tue, 27 Aug 2024 19:38:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:14 +0800
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
Subject: [PATCH -next 5/8] soc/tegra: pmc: Simplify with scoped for each OF child loop
Date: Tue, 27 Aug 2024 19:46:04 +0800
Message-ID: <20240827114607.4019972-6-ruanjinjie@huawei.com>
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

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/soc/tegra/pmc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6c37d6eb8b49..a08c377933c5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1438,7 +1438,7 @@ static int tegra_powergate_init(struct tegra_pmc *pmc,
 				struct device_node *parent)
 {
 	struct of_phandle_args child_args, parent_args;
-	struct device_node *np, *child;
+	struct device_node *np;
 	int err = 0;
 
 	/*
@@ -1457,12 +1457,10 @@ static int tegra_powergate_init(struct tegra_pmc *pmc,
 	if (!np)
 		return 0;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		err = tegra_powergate_add(pmc, child);
-		if (err < 0) {
-			of_node_put(child);
+		if (err < 0)
 			break;
-		}
 
 		if (of_parse_phandle_with_args(child, "power-domains",
 					       "#power-domain-cells",
@@ -1474,10 +1472,8 @@ static int tegra_powergate_init(struct tegra_pmc *pmc,
 
 		err = of_genpd_add_subdomain(&parent_args, &child_args);
 		of_node_put(parent_args.np);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			break;
-		}
 	}
 
 	of_node_put(np);
-- 
2.34.1


