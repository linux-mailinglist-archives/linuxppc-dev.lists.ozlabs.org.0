Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13B7339C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:25:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=efz5JtpQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTdn68SYz3dGr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:25:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=efz5JtpQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::614; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8P30GTz3brj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRhEmnHwLnr9Ez13B9Ep6kg5Naa0iYZmUb89fx/rWs6WKiLA9ODjLoPjSVyvpFvJHLUDhchqCSotpb6uAmUGiPDCNB4LAvHtznfwvro5f3nVX/9xn09BpJ3B+0716UvScQR9CC8pCIymAVUNuTsrwO+Vg695cpsSqh9R/GtNf950M2KjPj2e4lSZBKxmzZo5Wn1GqrRZ2Nn1tBuM9cXDkLHdpiG09OfvwQ1RFqZ+gGZ3KrSDRQTVz6btbHloimcTXOUBGFLseIDoE82bUzscHnvRk8NtzwCHqC1UPxFph/jr7vC2ug7BYMi1N2PvE8SDpiZUJSkJXFgRGjSBR3gyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufSWSvsleexlF3GNgDXWYBv3/yHgBGse/HO/S7+KY9k=;
 b=Q+bXc9qS/Ma0U6zuAjELIX8HDd0XcpAUOLkjcq7q8JakY2mrG3aI6wEByoUpIq9GmUQ/0ueeah1pHjVc0eHBpuzDefCyCkmixZexDXGXKHVQq367gIREVUZWX+pDRdPA1/5yDfbAbODd494gVbHU0sK1kFjVpq8s1q6cG6wR18a4SVVwHayC2pbnHsRKZYoflSt/mHLYwblK+/TdMUmitQzvzkQdIM+eIH50FHacyMC5ZGa0kf5f9tmUaebczX0WaBPSNmJzsWfCixcYu/ayK4xpHfvacrSKR/cCm/koBUYFuYWUexDEG4QtfH6GI8Yq7qEhBPeijXmRv1BHWwlGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufSWSvsleexlF3GNgDXWYBv3/yHgBGse/HO/S7+KY9k=;
 b=efz5JtpQCCHYuybGKAF5/iCbkJVxIaevIvslY/euuNw0metlnaj3AY05PbIzMbxZjtzgtRJy4Bv38OxKXEspdFM+/tWNeVbdRZCleRky7G2Q4HNWyBUjkjhlVjwD00pljzS2c/t+138yZJagsQCFLBDDuzCAwxom7Fn3eMXHFiWu+yXNc/Ngcunke8y9J1KalYMXOlntGX0tx3D6Fgt857j5vYLJ+B/uFouA2Zjfijwsx4b3gDO0MaduwE3Bnzo7O2MHRr5IBcvR/DAnQzLauLuwi0trsXenp0EM0otSA32ZYs+NIqHkIH2W3XZyYsR1AlQqwDTRt/95A7bDhhhyaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 19:03:10 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:10 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andy Gross <agross@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linuxppc-dev@lists.ozlabs.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH v4 15/25] iommufd/selftest: Make the mock iommu driver into a real driver
Date: Fri, 16 Jun 2023 16:02:44 -0300
Message-Id: <15-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:208:329::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: ba463ba2-4f3a-4539-4f23-08db6e9c4cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GF0G29oxabSmmqdQN0BnFy2tB5iNCES4gT0yZW2eoqkutCfko0YX7QrjgqWOjSKcYuiAHVoQDsd0imyrlf1swEZpd0NdSpd+gnlfkLU4XFYCBWoGyWVkXpsvqwzfC7NGKBmjxYENHW24R4azcGlR9PVh+r+xUbLI6F9E4vMGBYMtYzvgxh7o2uzXyAd1EwlsUQM8bU1jJYn84UzeQiNH3BEl9xbpw65EjGB+z3AMIByYPVtNDqBG3C9o/fa+28smDEDOqk5P1hr28C1OHOESiPY8YClF/66qIwsijcLaj2EHUsCTAvHZxDBGQTFPwnFDowEMZJNNiGf3fFTMmKWDjOdH/ovi6SbK4/1SYEzCcuyFg/7Ei3mYFBtONdattUIZiVXHeu7rZAcGhVeJDPLbBMlcPbj+q8LROIARY+IgSMh69Na7ts/tXL5uNkSgEMbIYGeytk3jNqLurskSz3kx5FgJ7KmYu3zEpd+MiJPDAP9ppBqYkPNIGSkiho3HZR9Msn9F84G2MuDrDciISiezaCYDKpSCfN/jSoUPegsI5B2uXsUd8HaW6M9ZB1UP+ri66sdlh0ksuUBM8yIC78TLHhypMom7JhXqvFJep3ko7VM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(36756003)(86362001)(110136005)(66556008)(66476007)(54906003)(4326008)(316002)(66946007)(107886003)(478600001)(6666004)(6486002)(7416002)(41300700001)(5660300002)(30864003)(8936002)(8676002)(7406005)(2906002)(38100700002)(921005)(2616005)(83380400001)(6512007)(6506007)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?OD3URbfRUK6XTLLO446Pg9h7hT/PoE7wKPu+5Yx5BWOXClT0U23qVEZfaRjE?=
 =?us-ascii?Q?pVoogRex/H+LwgbY4qYScVtVQ5iy+7+AOv8GCwM/TFh9Sn/kdh5uDVbjpXOL?=
 =?us-ascii?Q?lf4VpB4EogWyjpP3QJDTg9uw0Y4uvsg3wtzSRE5sopcdpcYp1xh++W7twuZf?=
 =?us-ascii?Q?SSIj5js7pWLw+e0T/GhioCshFkU0lLd6/kFm8bwomaW1V7yjIh6lCgPHkKmE?=
 =?us-ascii?Q?Va8kaYc38HH25vg8/CCyBrHKyjQSSOXIIAgDhZk5G9aa6KLFR70kq6FZ0p9g?=
 =?us-ascii?Q?BZO1I0nE3lIxEYxg1vtFrxDJq617ueb/hpDD5vPl1b2F2dO+OcIgXKvT9IV+?=
 =?us-ascii?Q?KdkuEzyap+uB+kJ+Tv8zN6GZmzD58/1bRqqZEFe7KJ7GQrLc0/6WwVhvC33B?=
 =?us-ascii?Q?+7n6p/Ciwq7F3yD9CZ6qYcMylDxuXjKJQyQl3IVXCBRjvEhqKL09H1SmoRwj?=
 =?us-ascii?Q?tftnEIYquwKt37pQenWLSYommzA9a/hVB9rejwoWQaFUkf+QTuI7l50Sgoe+?=
 =?us-ascii?Q?yfnIHOWsyje++oN6Fhrc0GIbeafvIpjvWlpYxI1Xh2ZvRMaMS1XI8MLievZP?=
 =?us-ascii?Q?GuY/HBXHcXgS8FGdF6WBLdug3L48Nay4Q74G/QO3HBaySIN13VbPn7ZNrOT4?=
 =?us-ascii?Q?Nafh64oZuT9itVKsYZZ9OerC6igg9pOpzkVhIA3Ib59gRCaadGSIlrqB10pF?=
 =?us-ascii?Q?X+H8MWw7gHyhuo+NLFmamIZ0mLQ5uWWi+Cjy6nmW8h+TiayjoVPCA46BEwcl?=
 =?us-ascii?Q?I1tXTQrUHEX/CQWYE6hFT43pVAPWDg9aIYSBz3U+JC1f5WeQu7MSASlpVYWI?=
 =?us-ascii?Q?GTwDPGlO7jA6xsrIYY+94CHbDbFzQRB4dCEx/5pR0iOE4v78LorA4NRokfFs?=
 =?us-ascii?Q?F9R2f9+E+jQAZ/6ww4CSEHkHKRx/Ln3hQeyhg0p0ipCI7ZWShHxpqmv2bXo6?=
 =?us-ascii?Q?O3sWoguuHdGo2/NOGZ4jzMfgHvuMFpGpTsyrc9qLORvadJvgJnGquLxtCe1I?=
 =?us-ascii?Q?O2TiFycFDTcLrS+e4VhRzuIKa9w3nUJ2PNvWbas/BqXEdnTg215my2iLFq6p?=
 =?us-ascii?Q?gWRB65ewEAz6PwoEQMag0mxVmz9l7AWxXk/VPJOg4rN691W5ES09FQQz/UiJ?=
 =?us-ascii?Q?gWPzvxrUhhf4JvS5TnrZV1s4WkODKoCQxgeEuyJmF8RhK62gPhL1ucsOxtq5?=
 =?us-ascii?Q?q4ysNRs4tEUHmefa9UUKADoffKvKjk/B92q3bROf6jfVAJMsLqqNHkv2wS1X?=
 =?us-ascii?Q?nO1+H0KgyNqJ2lTMVqe+8ZSHSJosaD2WmgqHjBSf+6l4vK6qUZAAzmDAAc89?=
 =?us-ascii?Q?BejJAClAHY7Ai1oN+tE2Ri5/XAxCFMk8XJDNPr8Yjq6r6JzC8X6PP6qT7aZ6?=
 =?us-ascii?Q?uiC6ufKOU38Yqq++8PLamy8KSomW64dclNhGG0PmI/ROVe1/6+HiNsgq1NYu?=
 =?us-ascii?Q?nkTH+Qn4+IfiDsSTN2ztjEqAnp9R6DWbLQLlNH/EfJ383rCkANSt03HzZLat?=
 =?us-ascii?Q?2YKf/60JXRDUN+MVFoG8rEwEECiacmmvqrmgGEAHFMWeDNNgZZ4SFw+Z/SlU?=
 =?us-ascii?Q?D9MdT398fg2LbVWfOPTwGOsH6bBunvax5sirzGCx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba463ba2-4f3a-4539-4f23-08db6e9c4cbb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:58.5860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1OO0dJaTEJ66dkyxY9MszZL5cpEeyboyhRSQ2LdWC0XBhepzsQfcyVtezJyVgBT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I've avoided doing this because there is no way to make this happen
without an intrusion into the core code. Up till now this has avoided
needing the core code's probe path with some hackery - but now that
default domains are becoming mandatory it is unavoidable. The core probe
path must be run to set the default_domain, only it can do it. Without
a default domain iommufd can't use the group.

Make it so that iommufd selftest can create a real iommu driver and bind
it only to is own private bus. Add iommu_device_register_bus() as a core
code helper to make this possible. It simply sets the right pointers and
registers the notifier block. The mock driver then works like any normal
driver should, with probe triggered by the bus ops

When the bus->iommu_ops stuff is fully unwound we can probably do better
here and remove this special case.

Remove set_platform_dma_ops from selftest and make it use a BLOCKED
default domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu-priv.h              |  16 +++
 drivers/iommu/iommu.c                   |  43 ++++++++
 drivers/iommu/iommufd/iommufd_private.h |   5 +-
 drivers/iommu/iommufd/main.c            |   8 +-
 drivers/iommu/iommufd/selftest.c        | 141 +++++++++++++-----------
 5 files changed, 144 insertions(+), 69 deletions(-)
 create mode 100644 drivers/iommu/iommu-priv.h

diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
new file mode 100644
index 00000000000000..1cbc04b9cf7297
--- /dev/null
+++ b/drivers/iommu/iommu-priv.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2023, NVIDIA CORPORATION & AFFILIATES.
+ */
+#ifndef __IOMMU_PRIV_H
+#define __IOMMU_PRIV_H
+
+#include <linux/iommu.h>
+
+int iommu_device_register_bus(struct iommu_device *iommu,
+			      const struct iommu_ops *ops, struct bus_type *bus,
+			      struct notifier_block *nb);
+void iommu_device_unregister_bus(struct iommu_device *iommu,
+				 struct bus_type *bus,
+				 struct notifier_block *nb);
+
+#endif
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 7ca70e2a3f51e9..a3a4d004767b4d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -36,6 +36,7 @@
 #include "dma-iommu.h"
 
 #include "iommu-sva.h"
+#include "iommu-priv.h"
 
 static struct kset *iommu_group_kset;
 static DEFINE_IDA(iommu_group_ida);
@@ -287,6 +288,48 @@ void iommu_device_unregister(struct iommu_device *iommu)
 }
 EXPORT_SYMBOL_GPL(iommu_device_unregister);
 
+#if IS_ENABLED(CONFIG_IOMMUFD_TEST)
+void iommu_device_unregister_bus(struct iommu_device *iommu,
+				 struct bus_type *bus,
+				 struct notifier_block *nb)
+{
+	bus_unregister_notifier(bus, nb);
+	iommu_device_unregister(iommu);
+}
+EXPORT_SYMBOL_GPL(iommu_device_unregister_bus);
+
+/*
+ * Register an iommu driver against a single bus. This is only used by iommufd
+ * selftest to create a mock iommu driver. The caller must provide
+ * some memory to hold a notifier_block.
+ */
+int iommu_device_register_bus(struct iommu_device *iommu,
+			      const struct iommu_ops *ops, struct bus_type *bus,
+			      struct notifier_block *nb)
+{
+	int err;
+
+	iommu->ops = ops;
+	nb->notifier_call = iommu_bus_notifier;
+	err = bus_register_notifier(bus, nb);
+	if (err)
+		return err;
+
+	spin_lock(&iommu_device_lock);
+	list_add_tail(&iommu->list, &iommu_device_list);
+	spin_unlock(&iommu_device_lock);
+
+	bus->iommu_ops = ops;
+	err = bus_iommu_probe(bus);
+	if (err) {
+		iommu_device_unregister_bus(iommu, bus, nb);
+		return err;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(iommu_device_register_bus);
+#endif
+
 static struct dev_iommu *dev_iommu_get(struct device *dev)
 {
 	struct dev_iommu *param = dev->iommu;
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index b38e67d1988bdb..368f66c63a239a 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -303,7 +303,7 @@ extern size_t iommufd_test_memory_limit;
 void iommufd_test_syz_conv_iova_id(struct iommufd_ucmd *ucmd,
 				   unsigned int ioas_id, u64 *iova, u32 *flags);
 bool iommufd_should_fail(void);
-void __init iommufd_test_init(void);
+int __init iommufd_test_init(void);
 void iommufd_test_exit(void);
 bool iommufd_selftest_is_mock_dev(struct device *dev);
 #else
@@ -316,8 +316,9 @@ static inline bool iommufd_should_fail(void)
 {
 	return false;
 }
-static inline void __init iommufd_test_init(void)
+static inline int __init iommufd_test_init(void)
 {
+	return 0;
 }
 static inline void iommufd_test_exit(void)
 {
diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 3fbe636c3d8a69..042d45cc0b1c0d 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -437,8 +437,14 @@ static int __init iommufd_init(void)
 		if (ret)
 			goto err_misc;
 	}
-	iommufd_test_init();
+	ret = iommufd_test_init();
+	if (ret)
+		goto err_vfio_misc;
 	return 0;
+
+err_vfio_misc:
+	if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER))
+		misc_deregister(&vfio_misc_dev);
 err_misc:
 	misc_deregister(&iommu_misc_dev);
 	return ret;
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 74c2076105d486..5433c9c545526d 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -9,14 +9,17 @@
 #include <linux/file.h>
 #include <linux/anon_inodes.h>
 #include <linux/fault-inject.h>
+#include <linux/platform_device.h>
 #include <uapi/linux/iommufd.h>
 
+#include "../iommu-priv.h"
 #include "io_pagetable.h"
 #include "iommufd_private.h"
 #include "iommufd_test.h"
 
 static DECLARE_FAULT_ATTR(fail_iommufd);
 static struct dentry *dbgfs_root;
+static struct platform_device *selftest_iommu_dev;
 
 size_t iommufd_test_memory_limit = 65536;
 
@@ -108,10 +111,6 @@ struct selftest_obj {
 	};
 };
 
-static void mock_domain_blocking_free(struct iommu_domain *domain)
-{
-}
-
 static int mock_domain_nop_attach(struct iommu_domain *domain,
 				  struct device *dev)
 {
@@ -119,7 +118,6 @@ static int mock_domain_nop_attach(struct iommu_domain *domain,
 }
 
 static const struct iommu_domain_ops mock_blocking_ops = {
-	.free = mock_domain_blocking_free,
 	.attach_dev = mock_domain_nop_attach,
 };
 
@@ -268,20 +266,26 @@ static bool mock_domain_capable(struct device *dev, enum iommu_cap cap)
 	return cap == IOMMU_CAP_CACHE_COHERENCY;
 }
 
-static void mock_domain_set_plaform_dma_ops(struct device *dev)
+static struct iommu_device mock_iommu_device = {
+};
+
+static struct iommu_device *mock_probe_device(struct device *dev)
 {
-	/*
-	 * mock doesn't setup default domains because we can't hook into the
-	 * normal probe path
-	 */
+	return &mock_iommu_device;
 }
 
 static const struct iommu_ops mock_ops = {
+	/*
+	 * IOMMU_DOMAIN_BLOCKED cannot be returned from def_domain_type()
+	 * because it is zero.
+	 */
+	.default_domain = &mock_blocking_domain,
 	.owner = THIS_MODULE,
 	.pgsize_bitmap = MOCK_IO_PAGE_SIZE,
 	.domain_alloc = mock_domain_alloc,
 	.capable = mock_domain_capable,
-	.set_platform_dma_ops = mock_domain_set_plaform_dma_ops,
+	.device_group = generic_device_group,
+	.probe_device = mock_probe_device,
 	.default_domain_ops =
 		&(struct iommu_domain_ops){
 			.free = mock_domain_free,
@@ -292,10 +296,6 @@ static const struct iommu_ops mock_ops = {
 		},
 };
 
-static struct iommu_device mock_iommu_device = {
-	.ops = &mock_ops,
-};
-
 static inline struct iommufd_hw_pagetable *
 get_md_pagetable(struct iommufd_ucmd *ucmd, u32 mockpt_id,
 		 struct mock_iommu_domain **mock)
@@ -316,22 +316,29 @@ get_md_pagetable(struct iommufd_ucmd *ucmd, u32 mockpt_id,
 	return hwpt;
 }
 
-static struct bus_type iommufd_mock_bus_type = {
-	.name = "iommufd_mock",
-	.iommu_ops = &mock_ops,
+struct mock_bus_type {
+	struct bus_type bus;
+	struct notifier_block nb;
 };
 
+static struct mock_bus_type iommufd_mock_bus_type = {
+	.bus = {
+		.name = "iommufd_mock",
+	},
+};
+
+static atomic_t mock_dev_num;
+
 static void mock_dev_release(struct device *dev)
 {
 	struct mock_dev *mdev = container_of(dev, struct mock_dev, dev);
 
+	atomic_dec(&mock_dev_num);
 	kfree(mdev);
 }
 
 static struct mock_dev *mock_dev_create(void)
 {
-	struct iommu_group *iommu_group;
-	struct dev_iommu *dev_iommu;
 	struct mock_dev *mdev;
 	int rc;
 
@@ -341,51 +348,18 @@ static struct mock_dev *mock_dev_create(void)
 
 	device_initialize(&mdev->dev);
 	mdev->dev.release = mock_dev_release;
-	mdev->dev.bus = &iommufd_mock_bus_type;
-
-	iommu_group = iommu_group_alloc();
-	if (IS_ERR(iommu_group)) {
-		rc = PTR_ERR(iommu_group);
-		goto err_put;
-	}
+	mdev->dev.bus = &iommufd_mock_bus_type.bus;
 
 	rc = dev_set_name(&mdev->dev, "iommufd_mock%u",
-			  iommu_group_id(iommu_group));
+			  atomic_inc_return(&mock_dev_num));
 	if (rc)
-		goto err_group;
-
-	/*
-	 * The iommu core has no way to associate a single device with an iommu
-	 * driver (heck currently it can't even support two iommu_drivers
-	 * registering). Hack it together with an open coded dev_iommu_get().
-	 * Notice that the normal notifier triggered iommu release process also
-	 * does not work here because this bus is not in iommu_buses.
-	 */
-	mdev->dev.iommu = kzalloc(sizeof(*dev_iommu), GFP_KERNEL);
-	if (!mdev->dev.iommu) {
-		rc = -ENOMEM;
-		goto err_group;
-	}
-	mutex_init(&mdev->dev.iommu->lock);
-	mdev->dev.iommu->iommu_dev = &mock_iommu_device;
+		goto err_put;
 
 	rc = device_add(&mdev->dev);
 	if (rc)
-		goto err_dev_iommu;
-
-	rc = iommu_group_add_device(iommu_group, &mdev->dev);
-	if (rc)
-		goto err_del;
-	iommu_group_put(iommu_group);
+		goto err_put;
 	return mdev;
 
-err_del:
-	device_del(&mdev->dev);
-err_dev_iommu:
-	kfree(mdev->dev.iommu);
-	mdev->dev.iommu = NULL;
-err_group:
-	iommu_group_put(iommu_group);
 err_put:
 	put_device(&mdev->dev);
 	return ERR_PTR(rc);
@@ -393,11 +367,7 @@ static struct mock_dev *mock_dev_create(void)
 
 static void mock_dev_destroy(struct mock_dev *mdev)
 {
-	iommu_group_remove_device(&mdev->dev);
-	device_del(&mdev->dev);
-	kfree(mdev->dev.iommu);
-	mdev->dev.iommu = NULL;
-	put_device(&mdev->dev);
+	device_unregister(&mdev->dev);
 }
 
 bool iommufd_selftest_is_mock_dev(struct device *dev)
@@ -443,9 +413,14 @@ static int iommufd_test_mock_domain(struct iommufd_ucmd *ucmd,
 	/* Userspace must destroy the device_id to destroy the object */
 	cmd->mock_domain.out_hwpt_id = pt_id;
 	cmd->mock_domain.out_stdev_id = sobj->obj.id;
+	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
+	if (rc)
+		goto out_detach;
 	iommufd_object_finalize(ucmd->ictx, &sobj->obj);
-	return iommufd_ucmd_respond(ucmd, sizeof(*cmd));
+	return 0;
 
+out_detach:
+	iommufd_device_detach(idev);
 out_unbind:
 	iommufd_device_unbind(idev);
 out_mdev:
@@ -992,15 +967,49 @@ bool iommufd_should_fail(void)
 	return should_fail(&fail_iommufd, 1);
 }
 
-void __init iommufd_test_init(void)
+int __init iommufd_test_init(void)
 {
+	struct platform_device_info pdevinfo = {
+		.name = "iommufd_selftest_iommu",
+	};
+	int rc;
+
 	dbgfs_root =
 		fault_create_debugfs_attr("fail_iommufd", NULL, &fail_iommufd);
-	WARN_ON(bus_register(&iommufd_mock_bus_type));
+
+	selftest_iommu_dev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(selftest_iommu_dev)) {
+		rc = PTR_ERR(selftest_iommu_dev);
+		goto err_dbgfs;
+	}
+
+	rc = bus_register(&iommufd_mock_bus_type.bus);
+	if (rc)
+		goto err_platform;
+
+	mock_iommu_device.dev = &selftest_iommu_dev->dev;
+	rc = iommu_device_register_bus(&mock_iommu_device, &mock_ops,
+				  &iommufd_mock_bus_type.bus,
+				  &iommufd_mock_bus_type.nb);
+	if (rc)
+		goto err_bus;
+	return 0;
+
+err_bus:
+	bus_unregister(&iommufd_mock_bus_type.bus);
+err_platform:
+	platform_device_del(selftest_iommu_dev);
+err_dbgfs:
+	debugfs_remove_recursive(dbgfs_root);
+	return rc;
 }
 
 void iommufd_test_exit(void)
 {
+	iommu_device_unregister_bus(&mock_iommu_device,
+				    &iommufd_mock_bus_type.bus,
+				    &iommufd_mock_bus_type.nb);
+	bus_unregister(&iommufd_mock_bus_type.bus);
+	platform_device_del(selftest_iommu_dev);
 	debugfs_remove_recursive(dbgfs_root);
-	bus_unregister(&iommufd_mock_bus_type);
 }
-- 
2.40.1

