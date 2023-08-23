Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B37785DFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:59:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FVEqagPo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCBG3xjSz3dkQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:59:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FVEqagPo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::62a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwm6f54z3c7n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edlmDOmgG07gBhpWmEcI2fsEI84I1zJe5vBU3BTXRR3XkoxCeuI8KC0MfNlRj+/DdZRTMYso5PbAkOafEchbdJ5RSOY304jSUSgmMHG5Q3xGg4Y12sMtujvjO1EVLSbjXBPWbYYams8xblF0ydotGyp4NsmqPbkz2Ad2JeNgPATY4zXqREJ/WwfpqcppCKaqGh3sUTpVS8UbWGasNM65b0c33wYZuUbTnGYdXKECwxcFcyd/VlCINSty9ijcmWeKX+2IOV98qKQZ8+VpRthrfhMK226MPcrdqRTvL37vzIto7H2nUSZy72s0mpdjYesXZmmA5a55Ul85GXtVtsWLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK89+oT7SGuGQXQ3iWnWtJgoaaQ8k2dVDyI7oqhkZYw=;
 b=ftUJXuLQlzEKz871F/8M+IoZQ60PneAAehPqrJfI46Jn2KsvC9fHeFHdX1H1v7cCeUSBE5I9LS+RaT6/fQ0AwISnZ5y2VmBJ2g4fqvoqOPMty9vuacESKlI8pwMUnqWRIzgHvtUKhjhRb0I8RyY6r1Ku/nTtOK761jn8630BSqwbIKe4Uj5UkBAbC2+82++saRPwpRvpRuVZbbdlfTVlSAuEAT8xD/GN1qR4J4LuV5lE1bIwyl1Udt8Ne9Rq8msn+VV/muGv6oeSyTumfOVNTcOFouqEIa8u1BMXYiXOmXStYyj6a/MZJdX/Ix8+WIcFS1skJkIb6j5vmDF7MFWPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK89+oT7SGuGQXQ3iWnWtJgoaaQ8k2dVDyI7oqhkZYw=;
 b=FVEqagPoR4Fj/gGMPo6I9yDY6VfX9x/vd3wRbDDLxvdA8s9mFUGDN3MTGRhScb3aJMNzqsYFaRRD98tY5iBFwZe8yIplzak0toPINZorPYHmIJDHUaMLPNSdSfAHI3mnWy/E9EQbVGWf9bmsqrs8RC2nseEx287+piu2uwfPTYj6q16Nq/SYgTvQuluzUFvNXnmL6VO+W/VQOtqoznBIfsiSoEYqM+7HWlTVJwHuKopZ5ZYuGTU17at5ShvQPC/Jj5kciLNnS7KiZmsSg3I9ynhJ0ichdUI0ScS6m2IOx7fA0e2LQOGawmQv9Eyy/9EsM6ZFfa+yiVWfJQjBfMG2fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:53 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:53 +0000
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
Subject: [PATCH v7 08/24] iommu: Reorganize iommu_get_default_domain_type() to respect def_domain_type()
Date: Wed, 23 Aug 2023 13:47:22 -0300
Message-ID: <8-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:610:58::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b50ef2f-854f-4ed0-2df8-08dba3f8ac4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Vy1wd6DQQV31Z6WzBp9A6I3hs7rQLY9gaMhjZWeABlXXXnaLaK3WkZ0cWUNhVtWsx/7smRZpgRLG9oGYX2Hoh82vYrUn+2vaRAxomB6Hv8bAxZENElYKwI9vS8vY+HPtvYRbJI9qS0kwoPU/MsFnTim1Wo+9PbYOJE2CPHtrOoFAJwGDX7nK0lyQZe6SlKj+x4Bkz3kt3nZ8F8XTptf2+AHYdB7sZnDKDk0rybRVJzMCxty18W3ZGqaxRLw3J6Ojn4F/SHz53YD+xka7rNw02MJ2YiXaj+kI92v2vtK22DPCl8plgonLfBHxLmMA4lEbTYdyBI6NIZohTjTOTq1oFVnh99sWO9P0lvIG63QVzekuSHhcusM6u9i1XUm96kasM3t02WYqHjb9YzncHItfFNRtgHn2FJNV8v+ch0e3XCneHmCtk+TNsH0asFSa4+CT1AjYG1GbH4is32Ra3WmP1V1jwf2tReTtn8pr+htHHCiz+PPqvfhSBIcrsdYrTGNZ9MyU3Sk+GYGcKnFBoIpmm7XJTZbtl3jIVsBQUOTQb7mNtlHnTTbz6UE/1N87wca5bD7ntqaE70w1VTTpd0WKHqWwYv20YW61RLZ7IRmusuAWqxwYjgaXWiW4BZ1d7e/N
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?wgKFPeyBfgqGZWoG41vPAjYZ110P4HScRG+oKZ6WtPwtbk/tXofyGJnPknei?=
 =?us-ascii?Q?HcLe1wdg1MgjLPz7aiKn5f13j6Mta/FSm8xKVaoGaeLyKI8jzvPfXplIMWL9?=
 =?us-ascii?Q?CGqYh1Zz5foJqJ5bryETUKBBHse+pJIwfoyyuqMMRvaKECMimu3XBb/KALk+?=
 =?us-ascii?Q?iVOgwyAlSssbGkAhIamK+7SdIphT72oEnRc4zfDRtouu/Qf4m5NSxolDpRrt?=
 =?us-ascii?Q?/mjR/Rq/SduyRUEWEgbpMT9r2kMFZ/c8sviDwguFaNowr4I+ESg7a6pcRlhz?=
 =?us-ascii?Q?xJP4PlkanC/J/DgPnssSVk73U9ergQeW0XMxQx3ISWQmrQJPxyiDUsLqU63W?=
 =?us-ascii?Q?o3OcJ1I9KaMasNt71/mqjkERv3DXUlMrPZLN9h1SjK5qemZD2GXhXAh+HakC?=
 =?us-ascii?Q?lXU/MaqT2sopVu//FS2P0OTm89k0QBIi3sqD6foNRbRlU9Tnrb7slAD7S+zz?=
 =?us-ascii?Q?P+TtSHUEorR9EVQYEvxvj2aq+Q46+dLhkTSuDIwt2w+OsTFetXeDi6dJkZRy?=
 =?us-ascii?Q?LuAXHw9nAe+ZUXORQBKQBtUFrKqAlvIRXPoPmpdNGssEORd0qY2g3RXjHS8t?=
 =?us-ascii?Q?eKZlEHUh3LR9HZ6EUFwWwgXGLxkzFoVkHLTqRB65MuboZcmZSt5hgahzp1aD?=
 =?us-ascii?Q?ype608ewpf5ABc0TayDxf1XNOcbgtgiKUXqRWMW3v3lG4p7BCUUuoKuEVznP?=
 =?us-ascii?Q?r/OXDsU3VYZqEbf3qVUD25qVERUZbcwi/wR/vIkbeygyPfO1VgPP84PueCL7?=
 =?us-ascii?Q?ZLzR4WXqPKbuaCy6NrYBorRdZvImsgpiRbsRhAiCgMVYN0xK9ypAHi0qajYf?=
 =?us-ascii?Q?YnAOLYGQT27InMP35iE4sDz32zk1JLURCURz4096j6nOqS1WkDmXaQO9xwd8?=
 =?us-ascii?Q?ZBglPzVKusf5L/UVlo0d2pHbF9V+YHtZUpmB07JsxXzagMmmmYSxLlQkHr+9?=
 =?us-ascii?Q?x/e+imJXIWUVU7Ax3GnOc9SwdSYZ55D3zmPJHRjoywvuhrwT6XvhyKOcv9Zi?=
 =?us-ascii?Q?m8wPf5kDh3UDtr76roLP2V1C9AojS/lKF4nUINvpzG9WMvZTBtzXs5y39jvx?=
 =?us-ascii?Q?HC2dJksI+CNR99NaVJ+r82PZ4ZYrBJ5pfs4dNW273wnTf9gPSt3in2fmjE6g?=
 =?us-ascii?Q?G/Cu6uvNTsJs58OauwDbLDKqtpTmmIPtloCh0SFh3sK7rlEIIEMqh0JL9cOE?=
 =?us-ascii?Q?NvJAkYt/ZTPo/oQxXCGMvvNAghTiGRaockY08PCaYLKz+cBpF+iwWtCWeaOq?=
 =?us-ascii?Q?lpNZVPImJexIwPza90459RK4pwA98Ydt16hQjBzENRrhQuz9sup3vMX2tuZ2?=
 =?us-ascii?Q?3KZ3flrURUh4xpkVCBScM6ES+eyEKE5APjnyKXzGSEDbTKzZdzqf3KaEU9nv?=
 =?us-ascii?Q?egSgmoNZ9CZtfr0eZEqjgtI7maPEv2TqizyqoY7rl7a/Zlq4sXY+7ZoxLMlj?=
 =?us-ascii?Q?jQlJZNRqG5g5XBoEi9cS+my0ixxIYINmEF6me+o6fgnEds0c5Phk9xRH1PxY?=
 =?us-ascii?Q?6I5VInlUk/k2DToQ7oVYD7ajIZp2dh5FpkYIwx0m///wmjoyGMtd2ssRdk65?=
 =?us-ascii?Q?y0150v5vRWlLNcELGPgkT6qvMerQcg6w7Fp9uP58?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b50ef2f-854f-4ed0-2df8-08dba3f8ac4b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:44.4393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoAaKtVOcbTpYVa5iSBTGOfgJOzNIuAuj/sNBxSt5qBHrrds8qPHi/brDW8BgN/b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346
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

Except for dart (which forces IOMMU_DOMAIN_DMA) every driver returns 0 or
IDENTITY from ops->def_domain_type().

The drivers that return IDENTITY have some kind of good reason, typically
that quirky hardware really can't support anything other than IDENTITY.

Arrange things so that if the driver says it needs IDENTITY then
iommu_get_default_domain_type() either fails or returns IDENTITY.  It will
not ignore the driver's override to IDENTITY.

Split the function into two steps, reducing the group device list to the
driver's def_domain_type() and the untrusted flag.

Then compute the result based on those two reduced variables. Fully reject
combining untrusted with IDENTITY.

Remove the debugging print on the iommu_group_store_type() failure path,
userspace should not be able to trigger kernel prints.

This makes the next patch cleaner that wants to force IDENTITY always for
ARM_IOMMU because there is no support for DMA.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 117 ++++++++++++++++++++++++++++--------------
 1 file changed, 79 insertions(+), 38 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 7cedb0640290c8..bdeeb574d9495c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1718,19 +1718,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
-static int iommu_get_def_domain_type(struct device *dev)
-{
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
-
-	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
-		return IOMMU_DOMAIN_DMA;
-
-	if (ops->def_domain_type)
-		return ops->def_domain_type(dev);
-
-	return 0;
-}
-
 static struct iommu_domain *
 __iommu_group_alloc_default_domain(const struct bus_type *bus,
 				   struct iommu_group *group, int req_type)
@@ -1740,6 +1727,23 @@ __iommu_group_alloc_default_domain(const struct bus_type *bus,
 	return __iommu_domain_alloc(bus, req_type);
 }
 
+/*
+ * Returns the iommu_ops for the devices in an iommu group.
+ *
+ * It is assumed that all devices in an iommu group are managed by a single
+ * IOMMU unit. Therefore, this returns the dev_iommu_ops of the first device
+ * in the group.
+ */
+static const struct iommu_ops *group_iommu_ops(struct iommu_group *group)
+{
+	struct group_device *device =
+		list_first_entry(&group->devices, struct group_device, list);
+
+	lockdep_assert_held(&group->mutex);
+
+	return dev_iommu_ops(device->dev);
+}
+
 /*
  * req_type of 0 means "auto" which means to select a domain based on
  * iommu_def_domain_type or what the driver actually supports.
@@ -1820,40 +1824,77 @@ static int iommu_bus_notifier(struct notifier_block *nb,
 	return 0;
 }
 
-/* A target_type of 0 will select the best domain type and cannot fail */
+/*
+ * Combine the driver's chosen def_domain_type across all the devices in a
+ * group. Drivers must give a consistent result.
+ */
+static int iommu_get_def_domain_type(struct iommu_group *group,
+				     struct device *dev, int cur_type)
+{
+	const struct iommu_ops *ops = group_iommu_ops(group);
+	int type;
+
+	if (!ops->def_domain_type)
+		return cur_type;
+
+	type = ops->def_domain_type(dev);
+	if (!type || cur_type == type)
+		return cur_type;
+	if (!cur_type)
+		return type;
+
+	dev_err_ratelimited(
+		dev,
+		"IOMMU driver error, requesting conflicting def_domain_type, %s and %s, for devices in group %u.\n",
+		iommu_domain_type_str(cur_type), iommu_domain_type_str(type),
+		group->id);
+
+	/*
+	 * Try to recover, drivers are allowed to force IDENITY or DMA, IDENTITY
+	 * takes precedence.
+	 */
+	if (type == IOMMU_DOMAIN_IDENTITY)
+		return type;
+	return cur_type;
+}
+
+/*
+ * A target_type of 0 will select the best domain type. 0 can be returned in
+ * this case meaning the global default should be used.
+ */
 static int iommu_get_default_domain_type(struct iommu_group *group,
 					 int target_type)
 {
-	int best_type = target_type;
+	struct device *untrusted = NULL;
 	struct group_device *gdev;
-	struct device *last_dev;
+	int driver_type = 0;
 
 	lockdep_assert_held(&group->mutex);
-
 	for_each_group_device(group, gdev) {
-		unsigned int type = iommu_get_def_domain_type(gdev->dev);
+		driver_type = iommu_get_def_domain_type(group, gdev->dev,
+							driver_type);
 
-		if (best_type && type && best_type != type) {
-			if (target_type) {
-				dev_err_ratelimited(
-					gdev->dev,
-					"Device cannot be in %s domain\n",
-					iommu_domain_type_str(target_type));
-				return -1;
-			}
-
-			dev_warn(
-				gdev->dev,
-				"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
-				iommu_domain_type_str(type), dev_name(last_dev),
-				iommu_domain_type_str(best_type));
-			return 0;
-		}
-		if (!best_type)
-			best_type = type;
-		last_dev = gdev->dev;
+		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted)
+			untrusted = gdev->dev;
 	}
-	return best_type;
+
+	if (untrusted) {
+		if (driver_type && driver_type != IOMMU_DOMAIN_DMA) {
+			dev_err_ratelimited(
+				untrusted,
+				"Device is not trusted, but driver is overriding group %u to %s, refusing to probe.\n",
+				group->id, iommu_domain_type_str(driver_type));
+			return -1;
+		}
+		driver_type = IOMMU_DOMAIN_DMA;
+	}
+
+	if (target_type) {
+		if (driver_type && target_type != driver_type)
+			return -1;
+		return target_type;
+	}
+	return driver_type;
 }
 
 static void iommu_group_do_probe_finalize(struct device *dev)
-- 
2.41.0

