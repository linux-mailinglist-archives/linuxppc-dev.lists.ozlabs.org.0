Return-Path: <linuxppc-dev+bounces-602-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE37C9608EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 13:38:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtQXb3jQmz2yYY;
	Tue, 27 Aug 2024 21:38:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724758703;
	cv=none; b=MpXk7Q9BXtsbQ689CutjjQmsvR0RjT5M/kr/3SVRJECJ+qv+Zjo3oxbpsJppLg2jl8tdWuoQlINSk1Tp+iL1LX3MC56R61wb3w1szePYZeqlNFdNTfu3jcli3Cy28X7RJ6djcphljenEbL+F8LW+pwo/1EMLww8MVKb9YZxeCPKzPNNwhtQPLWpwgrrxsuE6vC43rmjrwpZLV/1YB1Ukn3yY1t1052j2Iz4YFH56V/SwCInhxr0UunNQn24naVD8CLDr/p0dpFvRlJPVD4bOtmWZLVGc3UUCAWnofIoB+bcMtErxchK8K2smOaBGAjLs9UjJFGqxOJIdi1cBIEO57w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724758703; c=relaxed/relaxed;
	bh=1fCgKQIkz/+gi9fV1OrbsnV3X9mQtRzZv7rrrwMCDd8=;
	h=Received:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=ckltt0+xfXAMlm1QYQVv8MYry33cXTe8ZS8hv9D2yEJ9d4MmRP5Yh6vxmbHs0vCxqbk4DbXX08Gv/UG165SHy+h/2InOdS5Qd7ZUl5kf2sJFvrVgyNIhqBcssMW7gHA3gOeidXMKvGhet86mR507RGh4h/iunnQO+cbJf56y+biNiZ4FkI5qE8fxgB3HS0N2x35c4npqBwgqweJpbT9TCWfeWpnspAVHfKcn5stK5hdzTVFMbVYUAeG9v4MBZy9/ebFLFQbJaeZX2gPE2374pru88UG6hemWR68E8ih9F43qPpNE9YLN7F3xrvsuZWqaIvFkqpkZDgBCe/Qn2jicpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtQXZ0dM4z2yQG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 21:38:22 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WtQQv39T5zQqgc;
	Tue, 27 Aug 2024 19:33:27 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 26A9B18010B;
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
Subject: [PATCH -next 6/8] soc: dove: Simplify with scoped for each OF child loop
Date: Tue, 27 Aug 2024 19:46:05 +0800
Message-ID: <20240827114607.4019972-7-ruanjinjie@huawei.com>
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
 drivers/soc/dove/pmu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/dove/pmu.c b/drivers/soc/dove/pmu.c
index 6202dbcd20a8..75f5fc3cb2c6 100644
--- a/drivers/soc/dove/pmu.c
+++ b/drivers/soc/dove/pmu.c
@@ -372,7 +372,7 @@ int __init dove_init_pmu_legacy(const struct dove_pmu_initdata *initdata)
  */
 int __init dove_init_pmu(void)
 {
-	struct device_node *np_pmu, *domains_node, *np;
+	struct device_node *np_pmu, *domains_node;
 	struct pmu_data *pmu;
 	int ret, parent_irq;
 
@@ -405,21 +405,18 @@ int __init dove_init_pmu(void)
 
 	pmu_reset_init(pmu);
 
-	for_each_available_child_of_node(domains_node, np) {
+	for_each_available_child_of_node_scoped(domains_node, np) {
 		struct of_phandle_args args;
 		struct pmu_domain *domain;
 
 		domain = kzalloc(sizeof(*domain), GFP_KERNEL);
-		if (!domain) {
-			of_node_put(np);
+		if (!domain)
 			break;
-		}
 
 		domain->pmu = pmu;
 		domain->base.name = kasprintf(GFP_KERNEL, "%pOFn", np);
 		if (!domain->base.name) {
 			kfree(domain);
-			of_node_put(np);
 			break;
 		}
 
-- 
2.34.1


