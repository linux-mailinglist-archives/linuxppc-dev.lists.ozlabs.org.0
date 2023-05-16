Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEAC704238
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:19:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxgt41fZz3fKX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:19:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aBaTh7v4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::629; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aBaTh7v4;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxH31GjTz3f7N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aewSn2Mv+UQat/toGR87G1QVmtSAbqfc2xR6fLJMK5c7fDz6l2gHuSHzcqoRagMwZPHYMZulmT2ZrqjdfC4Y3TTBVQCjY7HPDUPpGXhQ3bKx7c23LTMoPwOiG5GjuUKfBvak8gyr3WCLLE8+UaozEoarTJ/hHI2kAN7ZXy8VV9pTTtikvMitTx9V2Jng6RzDbifQ8V2IDPV40e8yMLbgnXjOLgZpMkK/rIRhLq770u+7TxOTxBFtjQTrAzcvNOszWqi6Jzrv0KvXmvq6XPD06V3/POS65JYyUlDjaiDC3eLLYDKaVXKHvo+nd2klyacTCmJACEO31bscm/8GH/pq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEZRsssweMZ5k7WNHphRXCSjal3oAvfcmLmj/PoAl3s=;
 b=j2wvx0gAPsdYueN3RJNyWOhl2Qg0ILLtfvPjDDFR9Z9Slsf4Zz0RxkhEIsefc27eZbWhiYWo1gvwWyTG9RPiwvzm5OaaB3n8gjV0mH3fv5+1Ryja/JOyt4Q5h0Tl/gYgDhrnURz2HT6ypm7wssy5kqbO5G0GQZybqg31W7O2JV5F6e2vZq3ngjKbePb8GyBl0VedPjJWlGUyKA/+y2e8yr/8QwPOv/4Zk548SaZsUvsKG2ygj8LZnOcH9AmURzDXSFRumYHthRKYv8VsR62FzAeV/xOOkC0RsjTd+TQ99Ned2IsodLwDm9wy0qb53aX3kVqArWT2PGq/K8NnON73+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEZRsssweMZ5k7WNHphRXCSjal3oAvfcmLmj/PoAl3s=;
 b=aBaTh7v4J3PYlLC2+jFNGEHPYvpcHTIUN5J+GXzztYvlCsjE6bNBUAyc0MZVij+uafZ/kQsBVTXkmHbVnV/l7RI7EeNUyttWrcgf6uF7HP9/bnR9F5WJzGta2aZlz8FThokC5RSTGWKAQ3e3WgsGmZDsidycaNxQIzEz37Fxkw9tvcP0X6A6PoEreyzOsgFlkCutTC7/fo5qTafI7uhdCpgnI56RrUPHLDiI2dIvONK3qbBRqJdg6KdHOZKSZm5IaYfaTEEgUtDnUXFi1bcM9M7cFx26PYNoUjae/q4BlIGhW1ppE+ObSS/4igMZ9mz34RC2s1PQxHA/x0bw7LAm7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:16 +0000
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
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: [PATCH v2 15/25] iommufd/selftest: Make the mock iommu driver into a real driver
Date: Mon, 15 May 2023 21:00:48 -0300
Message-Id: <15-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:208:239::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: c87ab292-64f9-4444-6d9b-08db55a0a3ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	K4TZvs6yn1trPvFBbkevtpWt9hK+OR0UfvyxuGg3qSIG6rYoFbBZcA10OszOO4pZGPzfsFPlfsFg/EFAL91q0WFA/JpfnUDVNb89nCC+DHaz7ME/QeOEZm4CZok8sU6mS3k0e2SmkcYMZjl3TcLCJP3KlhadtrXDh6KAE7Afnf4HufYDrSBFflVWGGzuyMXS5dAGodOSvchQHUFAZwokmtUkn6nosXJPxbM17VUhIJRmWaA21iab9rb0dt7wQePw4HFh88dc9RVPHag1inXUxYqRy1i7yF968+bQrz9B7lwDABYh0qKaFCHQVvGUyyNSPb1QsbEeoWHZWPolka7R4rcAbik7uYw73DGPF/Xlun+vFTSP0Eu/OFd5oh5FQHLcc+5nU9F8rzMFOGlqG93gBBHVuHQE8nrgbKrAa0LOK4jKFwa3gsj0d4WqbAsNMZptknCLFP5jTuhkdYBP1KQ0/iconK7+3RoxSg6JffcHi+0r5Ub9f+M7SoQpQt6sOWAEq6bolpwMyydM5sVkONlqleCRQPQdFer12wavv7v9YN0ujvqfbFcOgxOdHZJ1lN1RnVFx0Qdk78tgW2C63y15LLcYS2JYvvmztIlEJtlPlYY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(30864003)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?1M39kNCxaN11r4sp379+FbWpct1EQvO/Kl07lBmjvNNULFZflvs12w6B2TG5?=
 =?us-ascii?Q?35HsBKHwhnYwas92cwpUPlrr0HZDnCJucvceKa3IGqkM4M3oc7WMaB3qY1mw?=
 =?us-ascii?Q?tma4S6FEqHYWQFX0TWSw/O8k9gaib1/0Sht2wcwRWc1GBS0cdN3/t780t8IL?=
 =?us-ascii?Q?iRhKxVdW5UToEn8+eV4cy7rdVUDGKdF4HQZEs3N9yz9Vh7F7If7rltdQHGy8?=
 =?us-ascii?Q?Q/b9i4tiz2MiRV8BudlflJh2hCdgHBzWN+j5Bi6/8Qv/bXOEz+H1FXD1G+Ii?=
 =?us-ascii?Q?zq/mv6+3aitxtlIg18jHmx1ug1WV5BKrvsoyy3T6lxuWdVZsRORjp1vvG9ze?=
 =?us-ascii?Q?zIAkGredxRWO+OR/sPdsjfumibMRN9pnpXNorkbAPUlLPMy4WaX33/eoACXn?=
 =?us-ascii?Q?WZiMrQM7k3BiToEzEledOmgNErF2X2q41tNyXqt+RBgh/YoyX107evFxS/4I?=
 =?us-ascii?Q?j40szs9jFfL22uIy0c9lZ35HxlUP2JRgPcCDnFiKISW4Zhzxcl677Hn7YCrt?=
 =?us-ascii?Q?nA2lC2TFIYSF50SYGikUQoCvLQrTD7VJDP53JJVxykizFrFmUrHqH+RG321H?=
 =?us-ascii?Q?M2KWer8moe/jzvjPbCCy4Hsj5hqbRcjFs5x3KOezoxaJObhgPYnjnqaTSjN9?=
 =?us-ascii?Q?Tm8oayJwPDcCfZqLB8ia1vYx117A4SReSXBnvcWQvnV/oCIHY52RKkcAM/IV?=
 =?us-ascii?Q?z7GWFKXCWPXWfK6X4XLQzQYFIi0sePotfbM3EHOQyTJXt0KV6ywlja2pTkGu?=
 =?us-ascii?Q?h15K/Zau5b4KuQ7NlEeLJnklJpAr4gkFak9XBNTEeu+mCl8NanjUn2GiPWXQ?=
 =?us-ascii?Q?7aePFltfGwbqCvqcO3OCrXgIlFRwwM8WViWc0bmg5mahOiiJjVgHcCBxldjR?=
 =?us-ascii?Q?NaFpLRc6g3WfqUpXErPnQgo5LBi2s3HeDp8L5BjFZJ1ek5Kd+3kxKCx+fXTI?=
 =?us-ascii?Q?KI6PAAmbFrhmehDt1AspyXaAz9o5Rrjflw4etmMDZyL0otP38uvcs3XI89vJ?=
 =?us-ascii?Q?Xu07azl0PiXXIK4w4TRMCBD60qOvZeh7lWS8YT2chrVvho1mkjn9kXJpF1rS?=
 =?us-ascii?Q?/0v1SaClZhKLnjfJ9GL0CwbYJ2L2D1EHh+gGadfYcd6CNJ/KX7nN44bTnk9Q?=
 =?us-ascii?Q?UHU40IPdSYrKPGD5glJHUgiBESxcrGh+5gl/GYJ+TURJlJkjhM8uU2NesFqZ?=
 =?us-ascii?Q?IKOM784WnCbYJocZ6XVzYOkaI+vJNiTkfsJ6gzVjU6g6bxThpAbgXVHq29CO?=
 =?us-ascii?Q?R/LgljyZ0eacfHij7L/VQ2PXx40CEw1lg6rasqqOtHR2s0ZVT7rGhpd386OC?=
 =?us-ascii?Q?8HZex8q7kGRsWKSTD1WGnaj25lxnIryEbEkFV4lOX9ec7SFu0Ccl3ZwSokv9?=
 =?us-ascii?Q?Y0krnLfsGPxdQTi7+fwsYXOO/pjIuN4D9rYtPonfYsLHxj4KC2NH8q1nnGhA?=
 =?us-ascii?Q?HprZ4ThMSlBdIJPE+TUSOe88QesdnC8a+J15wdL2FTPBgCkvadZJtI6HUu+E?=
 =?us-ascii?Q?pCfJXM4ahPOHIeInTsOlhjKd5zbN9xf5X0XsfzUWXYn4BXMxaI3AmqUD2B9M?=
 =?us-ascii?Q?vcxJ5/ExRwCTyIRtuPLhiA0jt7VFohCw97EYSVGN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87ab292-64f9-4444-6d9b-08db55a0a3ce
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:03.7090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfYA9pHqjeReV3sYg0aM+t/h0B+WtbGeFpWe43gqzKN+Z93uqdvOxXrLHeMfzT2m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
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
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>
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
index bed7cb6e5ee65b..f9f11ad918f673 100644
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

