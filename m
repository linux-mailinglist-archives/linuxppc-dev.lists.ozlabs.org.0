Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83F79EA6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 16:06:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rieAkzLi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm2LP5bfNz3hsK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 00:06:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rieAkzLi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::622; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1sY3T09z3cPY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdfWhfwnMYMA29pvAdzXcwG+s/CRtTYW85Hlm52KAmwQHaoyczTvVUVjplb7x4+Y0pLK9wwZrRqmc3DijNmbuBr+G5eVOC15AQ7kL50e/uSpQMRGtfMGwNZjnryW0o9AIEQJgjjV42HpC8X7CPdPT4txAnoacXJlrere5avyTB1OxyTsp5PkkClkT42Y9IKA3n5lqqH4+ncszzOi7fq4LnugVN5zBOv6FVOQjKJBMv1JbypolnAHdXTInDp+4eenzaLvrz38bnIWTyzmYeyQLrFi81MsA1jR36153SGVrzZyhVjiutbSsF2YUjp72NUE7XSyLLQ5Ztw3zSBQBq8GGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6Ofy76OXliDxwzhRI9xEl+1qYy6y1CGVSch+HBiSNs=;
 b=XHpemJQN2fz70QN8UXTiCf10n937AMg0ZoR08z1WHxTUa2dk3Yl+OwIevxfGtDlL1AN0MJLyOuJPW9PMjnxqsJvahSSg8pk3lch5cBoQmXg2AUMFI0Fu7C8N8Kiq5+wpvgTo41BpBI//xlciM5B7odeaVexap9tvhjnfrSPe+BeI4YP96wg6goa1t9tlBYcQfK99lGjDK4fkAvpVh2Br6Bo0sjFn19bWcZVzB9WyMmLDYw4wEoWu6GN5wvY4oIMwzAvpOGhB0hsnR4KQLMiA2j/ukJxOWue8uEWCjF4e5CQKLry5x+Kg4EeXI9vFImtsmnEB+HuX7stev/g9+2A4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6Ofy76OXliDxwzhRI9xEl+1qYy6y1CGVSch+HBiSNs=;
 b=rieAkzLiUXEYLWcajSyceV+K0O7c+AMXANdrCkuxUviUrhN5OoNFOy2bJ+5tmM/TCoy5wF8iBvOGIfNP0bWCyuOVIT+N2O3QMO1C9yOvJ3+AbVkfDCpZhTifUadQ9Xymz2dM/i701YOPSQ+4Xq1eJLfQ+vWBYUN6rWFMpWmzv8wrG5Mf7/KvRPhyI3d3YJe/Qs5cJtGoc3txDRfZDVUJiqu51pmCq+s4JMsb3/xn0pYDsfrOAkB3Oy2B3dAKjReofBmWDGSwjAeoS+3EPeUCp61V8E4t9NN+V516Dnr5IC05wa0aNaveAJ97rgChkfiYplOHIGcLTUAwsttpdGsYog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:44:13 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:13 +0000
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
Subject: [PATCH v8 08/24] iommu: Reorganize iommu_get_default_domain_type() to respect def_domain_type()
Date: Wed, 13 Sep 2023 10:43:41 -0300
Message-ID: <8-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:208:23a::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 28eb189c-13f7-48dc-1c48-08dbb45f83c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Tcv5gVnU6USzb28nl9ewZ3CEVwlikFUu3fvT91p1ll4iW8qv8BDWSkA+/VCcjY4q70qB8rVOkMc20dMnsuwXsm1i4hY2KOZn1FiAxpJRn3dbdEJA7q4x1iFPAE4qpyoAa8aSk7C50+H2+BQgbTTVTfca0kdpreJ2IMrl2KEezqEy0u3dHZChDghoC7dc9qlBCBrh4cEI+b1U1+QOUdPilrel8VcWaWwDIr6H8tTQ5TImk1MWUsKq28AzBaNqiaeX89RJjH1XzRTXBqH5sf7rA0KVojmk+cFNzRD45xwwAHl7CP/gtPAH6PHzZ8WigEDn0Ep1SafTZ1uLHG0PUSIwIB8gHAt8r2scvQXQvQMxxuwgf2aP456cbfP0AW8TlLbAXdLypEccKIbOeduETziz6FqN1auQC3rbxjLKuKHJqq2YWwh08vNaq71l2qAxBw6e27vWC5S60lEqm7qI8qkRipZIpGLqgW8EZuz67mA4Gb+DHKrlxjOjRv3fSCCKv3Thq5X1Zkvi4XQF0uKqNGvIucAU4fhEBkI7lJY/Lg3ebCEWTEwXD3tsjcypuAw/PNsuq38uoMlAgmr4oBYdxOL+1RAAfxV1JHDTP5AoOfj7wo3epdGGZPd2H7MuYy5+ic4u
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(86362001)(6512007)(921005)(66946007)(110136005)(2616005)(478600001)(107886003)(6666004)(38100700002)(6506007)(6486002)(26005)(316002)(4326008)(54906003)(66476007)(8936002)(66556008)(41300700001)(36756003)(8676002)(5660300002)(2906002)(7406005)(7416002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?anVoQ2RvmrtP1At7tyMX6O5/KDs79v1kvoOka7JjllVT4fZyqgJQg60lNyIi?=
 =?us-ascii?Q?pBCz8hWnhd9Z2WEqCHGZLQcLybNTrUIhnFO18YeAQ1XmPyOak3dvA/xD9zSj?=
 =?us-ascii?Q?gxiqsgdVs2j9OsJVe/9cIotBacsfhXLjfxzQZCuEVA6O9mhr9fAnRBZoywP4?=
 =?us-ascii?Q?f1XspqtdS0PdTJO1+MY57mEtu8pBOJdoOpboz+oyh3ORBg6riIlNb5Hypxt7?=
 =?us-ascii?Q?yIxk8zYhPQ3M7sXSyZJay98eSjCtFR4TQ+lOicvhHNhKVB1YRjTuIWyyqmHv?=
 =?us-ascii?Q?QxbUqXaYwzedg8HUsajtyemfTR6ow2ZAAruy0tTPclqRYDh4jMyF/Zm1nWGc?=
 =?us-ascii?Q?Mn3CWrwL0DphJYMSV1kGsS9+fqLj/KKT8s03DPMCcIoZjB64OVhsJc+z/Ngw?=
 =?us-ascii?Q?Q/EFohXUgKoW1NI9hdiUzNzoF96ObybMTaBlArkbl9Uhm51GWR7jjyvPMswu?=
 =?us-ascii?Q?mhzDu/UxCDcEzXDbwpDGzrMzCF9sNnBiYQtUbO9SsA/w4CkWokEF3cNw4Hmy?=
 =?us-ascii?Q?WYTRmAYiOBsGqcM+f66W12HVCgY6o2ZKp52O1NZU7WQCXi1eckJon7mfaQ9p?=
 =?us-ascii?Q?jO+cZHUYeb9jID7ghgaoaXmDb+cHaa8dBTsxMe0oTAPlaFtVxV03THeM0Trd?=
 =?us-ascii?Q?48wiozPxWNRB8giBtas0oipxUn6NwcweTrAXnVfeNQ+ndQNThz/vB43hFJJw?=
 =?us-ascii?Q?DkaVi7muq9rctaScUaj1x7tTqrIJyKvcfnMBM1fRLx4Z0btjbZ59AR5z0KKr?=
 =?us-ascii?Q?GXjsBhXU/FPCf2q8c5QiqTDLUEAdwFLm8WsnDtITUR2TG9Xx5WgflRjh4Qw2?=
 =?us-ascii?Q?NUfbytYb3IUE5uAsGpjStF1+3vjUmNKgPoYI9/utlMKKuQDIEaupKX2kxjAK?=
 =?us-ascii?Q?Nd/+9192bx4mldOW8847dCjmQKB4InnCwcMtT+4UCPW1mcnMTz+YKIOwNreb?=
 =?us-ascii?Q?P9wiUMBDFBUdCcK6yLtdZkMnTj4AhTjnBn+RTJAWzjKpwVmCX+KQIK7OYFB+?=
 =?us-ascii?Q?py62pR372gRyjqi4CX5PbvD/xoblNtufpHHFIGE9n37wjeibgOxY3E1Xiviv?=
 =?us-ascii?Q?YZr/wlFrrzlMOrjbfQV+HMR/XyTaSjGoP3fETEavlFZUoyOnh9gCunppf961?=
 =?us-ascii?Q?C/+PeentDxx1x3vJowUcKKKrrG1tH5IgmOv8BJtTy/ykhQhdqvjJIhEzFZyE?=
 =?us-ascii?Q?PEnX+/gi2GfjqNYpQMSB7kRt5Zz5cMENq8Brx0s9g/8ujhsSNWcnKDFkh07Q?=
 =?us-ascii?Q?yQVqE0/79Zx2NKy48jmkRxzWEZt5EGE52DzHm8KxoNeNkoqENhPaibJs18/K?=
 =?us-ascii?Q?gzkBxcwtCGx5KV4Z/WoNytU3gEDjN32+l1Msl3mVuQLA75DIcwqX13T1fOfv?=
 =?us-ascii?Q?ukz6oUcWYyJVK96nOfJi1qhmNFg8BHK+KdPsjPGvf27HnWyHYWpFG7ikqqNo?=
 =?us-ascii?Q?1iDMP07gfn/3f+Uy/2FmvvtOSS2HR3PRkVPl5mZCL5uXksybZA8LLhQKgI0X?=
 =?us-ascii?Q?QW+FVF6cq7sMYymamxqIJs0DGKQ1cTbd9cFVytXBepNuAWn52jxpdk3v6qTh?=
 =?us-ascii?Q?1ScChtKmsA5i2wnikXw3Fwyd+wb0ZXW8m2SKqsos?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28eb189c-13f7-48dc-1c48-08dbb45f83c4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:13.0210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ACI664wuzRC+iDoUZHmfDHYveirBHLfklWojAcw76UcuF/pZI7Bo8zIqEgHHsJ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 117 ++++++++++++++++++++++++++++--------------
 1 file changed, 79 insertions(+), 38 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0e13e566581c21..9188eae61e929e 100644
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
2.42.0

