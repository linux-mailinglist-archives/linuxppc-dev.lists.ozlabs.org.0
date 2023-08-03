Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290276DC9B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:26:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P7+R+0Eq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGV4x6QzYz3dVB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:26:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P7+R+0Eq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThs6sf3z2yDh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpqOO4ww+J/PIsixcZ0dmvnPTqLvkjj+JHWF04dEE6UFRgqXsbfLw+nEYGmRiFMSjBBMfqHhIiff5ZQ3q3HcZwxtrfIC8no0+bdcBCt0h3BeRLRxHjx1PFdrjnu7Qhix2uEBZUv99zjpIkpjVe+0gFiV5drxzFB6Kv4ZUtytrxH+XNEXO6QfcO5alO89nLx2VHLeficuX/uFF13rWz0/o4SGBx7+5N62TJYFDRypX7V0aA2pvayZ08LUPbqODnD9nmP+d618xUoOl+FdCoJeh2uvsyonyqozBuK1UGGfMNqr1AuX+mDbHxegzI9m79ysXzrxTzw60lj9kWdOGS/x9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fq3126Qo3OufKjqsIE8nPPsKMpEZDrjx3PdzS6L5LrI=;
 b=Fp9fvaskpT6TtxgpsyfBUeARbO8LJSoZQ/24M8luVJPH632cIUPskUwUzXNH4tuOK5T86CF8TjnCc/McKOI3gwh0P8Zp2Bac/Uu3tpTITaMIVU/+FKBoL60NhIEHGZpbQkFp7gf9BmoGeuaS04ImUEQOWwzDAfhPvNsJNWbA3eazbXvKJPrgj1Qiyt8yIQcs83s3LPPa75dmw7wluRqOB/fr9VV21R21gDX5sKIazKoh2zBwH9/TsBqtLsNfL8ErXH7LWrzEqCvqL9AI0hN2J+3dI/tS2Fic+PDZVozBACHwMEVrlzMnjD5MDIqUxB0BXXJ7DtS/f1YTyRXAYnavLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fq3126Qo3OufKjqsIE8nPPsKMpEZDrjx3PdzS6L5LrI=;
 b=P7+R+0EqrmAv18ssLOs7L9N7kh2udxvmHxwZty2FokAhPuFvMslkvN6+br+355CXLhHtn+qQFOApqNycmophkQj6DHHWZ0B3nmsKAyAi/TST77Vs41tR1C1y8otnPPkiPQQJNgKIjCOJAc7gyU18hAFgXJmESGJ2AFPatdbXEklQTz/pxSj7oLjxyS8Z3RP4BiXViUqZQ3ANiuwwfeO66tB2NIVTmE9UyVdaTd8RY48PnKD2EDCxn9oG7nrfhGsBEu5HfPvDVOhmp1jWLqRZssE4MdAjae7QNMGWDOjW6AK8JuiXIEHfJVcy5etnvBo1tdBc36CIB014R5VBhEPY1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 00:08:23 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:22 +0000
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
Subject: [PATCH v6 15/25] iommufd/selftest: Make the mock iommu driver into a real driver
Date: Wed,  2 Aug 2023 21:08:02 -0300
Message-ID: <15-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0287.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6b0dae-6e15-46f7-cf2e-08db93b5bc5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	WtVUvxYkJEcRz9BmEEJLp83i7jDpNFri2xjQN1nFCfPImXBg4Qj7m+XOvmoUw9z7RpRMTkXr14gBi5htMX6iXDldfSvPipQwee7+FLs3vxW+JnI9HhxrjDQDvVUKidOldE1SUFtTNjSOfjf/kaLYjlmNutWOAHu19Nhj2/+WeZv+2x0fkevzIYy4NFkuE+ZGZXd2XKEKSdx0UlnJFGgbYS0npLoHgGYm33xa/aDUgLZ5kBeVgYTvSgoLXBspg4eIDp5Kf3CiNzX0uhMgvEaqll83uNWOQ4pRZH1nhEujdxQZcJXCueV3NtNkWoAz5TiLsmyMu5YMu3UmrzWaD/vfICNatU78fv7nVJDmdlax68oapQrTdy4ITP6w4LTNQJmZCW4y+UE8ATlKACb+HuuBEtvC2kIhbvMRHDbmWUdtqYpV4lq+OY4VbnqKSOGmOozuT0aVkVBQuy9kQLdjQRZQn9J6bIHmmUE2PLUIRldJFD2dyqTxRphkbo43Kyj1JdP92cY8E4XiiOoXTw4ZNq//x0QjohpG9I/RqXOyu/8fgjKbGr+1HtV1ipZOZ4czE4GCjwHmR9WyDkR+yt9aPCy71d0ItjTbbGgTLNuvE7nwa057NOHSLuFjt3FugVyeUBzRboeVJ89FRak0kQKFgD5+PQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(7416002)(36756003)(86362001)(7406005)(54906003)(478600001)(110136005)(38100700002)(921005)(83380400001)(186003)(2616005)(6506007)(107886003)(26005)(41300700001)(8676002)(8936002)(6512007)(6666004)(6486002)(316002)(30864003)(66476007)(66556008)(5660300002)(4326008)(2906002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Q2yaZ3ZyQhw8sQPQNtQwHoQidrFGOQUJg/TcNQHUn+OdaI4BgsjIlZnxrBNk?=
 =?us-ascii?Q?5sOtQsW+7kxiodg8v1RWGBvV7lYOF2wJJC8SdkLaaQvtU070gpEu2H7kw/Bb?=
 =?us-ascii?Q?7LYsLWHneGJKelKPIvQdNe+z8yVl3VPXWRwa/4TRj7fNJYnoP3LrDuOKdHeP?=
 =?us-ascii?Q?Iy6doyENmerkRM1BObKBB3m9olwwgIBHvU6+39M8URX7Cobkd/G6DM9rRJ8o?=
 =?us-ascii?Q?FgYT1rpYUDr5spE+Dg3s7gnd5zXEJuPE+yKyD2AHZncsltwusnBa879F67MH?=
 =?us-ascii?Q?P7JQRtHg2cuK9ieoZaizrRc3wwYuChE2z00Wk5NsrBnWxbHq6VgHBrwapUCm?=
 =?us-ascii?Q?cPRbLM7wfx1Ee2SMY2kg1rG7eVnIv8EFC2kgx0R4IuseAnO3bhJZdUN68jFF?=
 =?us-ascii?Q?8nP74s9Oeyt6r82BjbQQLRjwj0hIkGUTjHVkbxpfFeEk5rTiHJRq3Ic2R+2g?=
 =?us-ascii?Q?JGFE77T6KCUFeGxMEjTUtCS9Qwk5RpmQEq2vQseb0aK2ruT7KXq9n7aWAIFx?=
 =?us-ascii?Q?7Wo+H1jdx+MR/Lgj9+Vhr+T7mWnruj35b/KlAgeWGzEH3cGzReH14l9qSXR6?=
 =?us-ascii?Q?EIRCGmFYi8tXTiRPMqOlh+QnE74OyMbiwEf0hmc0fg5O6q0l6+Nx+2R8TsdA?=
 =?us-ascii?Q?SGTNsfRkoZlLu23f4uxWasELaSwHz3lL7tOnvOyt27SnEor7zxVw6jKiErpR?=
 =?us-ascii?Q?T2s8PYt27ex69QN5ksK08G5a2BVKgXM0X1I5mmvBTcJ5GYt/rDqRBLZ5wR9v?=
 =?us-ascii?Q?wc7TXvsYgNxUrCj3O84oXU5kffbLRtQ9ESxUzB3oFDI+Pm5dP6rpAV7qab5J?=
 =?us-ascii?Q?SUEm/g2D8RUX3M/SH64Yhj4TSacUHyXjg0TghUgA8vjkQPPXfgIZJbutvn8A?=
 =?us-ascii?Q?OvQI6srPNAI7yj/l49e9MulDvN7RzW9MdMsYLnICA2EO6yeZpkHkd6LtUFPr?=
 =?us-ascii?Q?8fMQITdnUUpV5JXs7V/Qh8YSZknIuLn24cMYQZ62NWT8jgNp1Aj/SedQvgz6?=
 =?us-ascii?Q?J8knCbHsvr6zKx4Z0cc1GrcfOS0/f99KpNR70RpOKZa910LYuN3oeUuAFjXC?=
 =?us-ascii?Q?ySy0tFxP512sejodlxrq3FZLBl2dvI9sO5wigecEbc9wsdXLMEDlhPWKOmXu?=
 =?us-ascii?Q?nIvbC9z9DmIAQjXfEW0n9nvwrl8WWKMa3NgCQL82Aol/1QqhF3ND4/Qc5NAc?=
 =?us-ascii?Q?szMt5bU6LEaMwII2hymgZUu5dqQ+YCIH6t8JzjBBmnvznx/OakNTi5oknIMQ?=
 =?us-ascii?Q?4ku3rum/TvU7yjP78dMT5h6cetdfEHZLP9Uc2rqjlC76ARkKqInTt1kFv9wV?=
 =?us-ascii?Q?q85mAOPoOu1fe7PMCzZ9C/nnPuEBzHHc497HUxvCKzc4wSxfOo3OEMsPB62O?=
 =?us-ascii?Q?l/c+Fx4HsnO02oyLePmdWARuHCWRhLhmzfjwnK4WOD2SjBhypNLHTqO3FxmH?=
 =?us-ascii?Q?u91VzG4nzxe68293Ei0uKKAx4pvRrrkUK7BdoY2hqkwBvFgwCe6wu1dhuAsa?=
 =?us-ascii?Q?OvTF7CZPysJMQWr7xTnU4N7vMWcod0kQ9YehT4NcSFeIjbUK1edMrF34BLSF?=
 =?us-ascii?Q?5qro+NvZOCB84CpR0dcJ+0vRo3GEeg2d03SdN8wS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6b0dae-6e15-46f7-cf2e-08db93b5bc5d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:16.5159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGW1fF7cEC9m6Xg4kmGmEiX4irW2slct0rvtqjswP9H3dMVVVzEvlNMK6FLwzIGY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6085
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
 drivers/iommu/iommu.c                   |  43 +++++++
 drivers/iommu/iommufd/iommufd_private.h |   5 +-
 drivers/iommu/iommufd/main.c            |   8 +-
 drivers/iommu/iommufd/selftest.c        | 149 +++++++++++++-----------
 5 files changed, 152 insertions(+), 69 deletions(-)
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
index a1a93990b3a211..7fae866af0db7a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -36,6 +36,7 @@
 #include "dma-iommu.h"
 
 #include "iommu-sva.h"
+#include "iommu-priv.h"
 
 static struct kset *iommu_group_kset;
 static DEFINE_IDA(iommu_group_ida);
@@ -290,6 +291,48 @@ void iommu_device_unregister(struct iommu_device *iommu)
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
index 74c2076105d486..d2b59a1157441c 100644
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
@@ -992,15 +967,57 @@ bool iommufd_should_fail(void)
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
+	rc = iommu_device_sysfs_add(&mock_iommu_device,
+				    &selftest_iommu_dev->dev, NULL, "%s",
+				    dev_name(&selftest_iommu_dev->dev));
+	if (rc)
+		goto err_bus;
+
+	rc = iommu_device_register_bus(&mock_iommu_device, &mock_ops,
+				  &iommufd_mock_bus_type.bus,
+				  &iommufd_mock_bus_type.nb);
+	if (rc)
+		goto err_sysfs;
+	return 0;
+
+err_sysfs:
+	iommu_device_sysfs_remove(&mock_iommu_device);
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
+	iommu_device_sysfs_remove(&mock_iommu_device);
+	iommu_device_unregister_bus(&mock_iommu_device,
+				    &iommufd_mock_bus_type.bus,
+				    &iommufd_mock_bus_type.nb);
+	bus_unregister(&iommufd_mock_bus_type.bus);
+	platform_device_del(selftest_iommu_dev);
 	debugfs_remove_recursive(dbgfs_root);
-	bus_unregister(&iommufd_mock_bus_type);
 }
-- 
2.41.0

