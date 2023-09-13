Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E141279EA0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:50:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XjacmMOl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm1zf5Fhqz3dLt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:50:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XjacmMOl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::60a; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s44cYrz3byH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7KfJOAS3tTTpuQXZAdJQRKIDl0W+0/b8B9o8pasqXLLz8CiRRpd01egzWXz6uLxK4dOwX6Qyvj5Z4+IB2NVp4KVVBOjokfRdT++hnwrD0GJ4pzMj+GDC2aKGZiN05vRY1T/Jl7fHh1r7hi+dG9b2p7rKGOYEsad5zLsNJf/UA3mitOuuYWXDrsMOmW1eeET/ftaxmyYGMlGIPIGqpUyv//3NVKFgvmiVby8UItXQnLSLCFaaGEMyL7eMAPCwmMIVjsAvDxxzDYOAqQh6ioKTa9CE2YqfFUkPRugSyQ0ryChl1PaNu1ekrX/xonh8mUsFbggwMTMP6wKGZKZHR7onA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NIVE7CWxR0FxCz56shPeYjcF7xWS2YbJasUFM69M30=;
 b=OUFEyX19ivv4poB6uIS8cMC1QalguPGOi2c8ag1yV8qE1Y6T1T1o/B0mZ0IgiJH0JmaBK+og4D7bdzjoamNNVbncx5u6uyqsXa0S5yV50Emr7+hNh2vM00UbKhb9PQHMbAwzCV80tDcWQDRtnp8QStX6D2qOzY9Nb9xm5krw2mCFX3zexqr+A5kAT1vklVoscYfNaCbjMxxsv99D052l2Kpdl+ZSca4Wwnd2sXPbgywQ9U02eQK6foDlzLG1KG5mkZ0sMQuiTzUIhzNG6vye0cKjmn+x8oUpfq1gPwZRG7xynOlzcMr0t7LI/4fWlblDZrNjcUaFziPWz/5iS8fI6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NIVE7CWxR0FxCz56shPeYjcF7xWS2YbJasUFM69M30=;
 b=XjacmMOlBxQiyxNagLrXxtS0ryUb0Nn1K27UIOHGWTdRMnnbZvRTHhla+XjO59eDK48NByhBhXB12OEoJH/KXqOz435dWcjUsAQ5Lbbu9gTwNPuxkX8vHsTKiBiUMEzKE/XoqrjY1iaZM0LrCKr/9DKQQ8rEV44IksUZNstrANAhfCGiUzu2a2doRJinReXhJsPl4VuQy6O5Gmp2eJVLASd/07M56ZlYnVGGueGRNlTIar/FtwDfAIPudzj2AZBAc/MlZ3iGZBx+0+7I1iwYMLo5lTC+J+6KPS/xeC66q3PDPqhgd2MM+OjEP7mKthyD+TMQhWfshSvoxOaHnZ8Efw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Wed, 13 Sep
 2023 13:44:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:00 +0000
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
Subject: [PATCH v8 21/24] iommu: Add __iommu_group_domain_alloc()
Date: Wed, 13 Sep 2023 10:43:54 -0300
Message-ID: <21-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0378.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::23) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc3b9ae-4d73-40be-48e7-08dbb45f7b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IuBI5wvhxqJOQ9LmJ57Pe4WH2rmSeq7+dbXPEHLifNUKufLPoch5jgHC1aw/dGMX5isErdbruZRMQVkyJ883csb126Iymil3RfH04cJpqUR0KVftpJWPP2aW3lsIZOFJ6GHnE1qqOWFChB9S6NYLsy231YTHqXw/mXAo0RkQX7TLmjIkmQuU38hFZMLJFNR+JS633vKeTingp/x8Tz0r+1f2H2Uu4l+tiGawWSxxojxyOaYzZlaI+w0LNeJiggpG/KO8FXQQQI5eHK8xGH/tzazOsqNqEa13fJYBAPRoumvbgeaIrUULOIIxCX2s23BLwZKzMXaKy3n2NmW5eS2obnSKKOVWR5dyvlt1saidF3Vcg4/pgYYiig1YN5SXUk+CbdDzYnFYTZe2mGmB55t851WA+qCb073FOnjQeX3gSMj3icA+LUsurwuA0Mn94bOt534BOhgl3MDOmqSwaSI1haN8FS7qcf1Aai0q75enczl3b/nLwN1DoUmZezdnT8tzQUCMoxyzac7K9xOZHeqp8TEV1dTEARi9aBK6TKUeRdAHOAxRWI96WciJvtzHZnjSN0/1LrAsGVPaREkUnJY212Q5iINCB6cw5DQMWzD398s=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(26005)(8936002)(8676002)(4326008)(6666004)(921005)(38100700002)(2616005)(107886003)(478600001)(5660300002)(66556008)(54906003)(66946007)(110136005)(41300700001)(6506007)(6486002)(6512007)(316002)(66476007)(83380400001)(7406005)(7416002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?B/F6ljw8LjHBkZoaR4x0CThophA7Lt/HrKMJ31qlcXDqnW125WZGA1E4avtQ?=
 =?us-ascii?Q?xiEflJydL/PK/f6gK9JHKFhER9XWY+MdAwdV/wPTP8vZa2L8RHOVArGEh/5z?=
 =?us-ascii?Q?fqaVdwpYunzgDafNgNranHXVKfUPjeaMrk6EcNsR+dkRSLZ8tDWykWkEossK?=
 =?us-ascii?Q?5E4MYt/rFqzLYADDLvlasLJE/qHNc4To42mivQc0GRvgaWhLZpmm/61dK/K3?=
 =?us-ascii?Q?/yZ1E6LPzIed5Qs8po0Ced26l2cXUjSNIgymMLQvqECpIspSBMkjUWTJdOZt?=
 =?us-ascii?Q?rDE5eM/Uu3kVqbXQbNmAGHPn3dMB9CU6Z69OryywfvCfnhYJP43DPp25Z53m?=
 =?us-ascii?Q?87PybHOB9QaW7vaSndf1cPYR3PTNcXmlT95boG5Me3sSETmGAaIKa/4jD5UA?=
 =?us-ascii?Q?LtKmc+M3PlPdc1TcKqbPdYm8l8Z3HIOFXzAbiUxN1Cdt8wDIWBGKTq3V2TbO?=
 =?us-ascii?Q?+8F9CyP51JEnCFemBMvvy0MjCxRsOECHm0jVyeku481g+5a6OKPTmLhN4FTM?=
 =?us-ascii?Q?2friBAxVa0wR6xaiQG+bF3KCsjaUllqk2X2gVCJ2ahcN3BsJo9vBk2Fk197A?=
 =?us-ascii?Q?hybcAVoDxA4GIzVs/+MnQJ9LZQEXCn+JgIzM7EZ0sr0mq08hhqcBiY9s1WzZ?=
 =?us-ascii?Q?8cMc013C/zPQ+1UbQkXA2DMg7roeOaTnv31n+hsR7PJ3wqqxtmV1mPuX6bKQ?=
 =?us-ascii?Q?GDFJhsJURwaNbl+N/HFqaxZjs4RQ4ICVI54DHSNOMmwDZdnppd5nz04bRrGP?=
 =?us-ascii?Q?8jH1Jc47FQePU8BxvVWn/q8v7u7gce4qHboCBI7N2NWdt8NXCIT07sQ3n2CR?=
 =?us-ascii?Q?iFi80qFBCMXvuuhwkdroXC3X5mhvJ5vdmRV44WRg5sDlSdUfKbXpEWNV2S+t?=
 =?us-ascii?Q?JPw9k0J/K/KP3JyLiYQ0ZQOP1RxzDD8A4G+cKvk6yI1OOHb1c7yfm422LGWp?=
 =?us-ascii?Q?h9Fx1JjMtNpcy8B65Htstohb3Y/s1UG6PcMImWg5WVxe24iF9u9tuOlUu/aZ?=
 =?us-ascii?Q?xiiPQBDVWOJWLqoTZhZrnDQGf6eJmNpeQxnW4R39LaP1VgfX3+V3UlTRXq3G?=
 =?us-ascii?Q?u+HLs4QpyBUkfqn9EvYlfOxMuxi0c+bl3Q8rPZtZSusyW6nRVAYFFGcTAWEq?=
 =?us-ascii?Q?OQPXpXLGHpnTZV6CK75leFjYS/4DDZCzt4DxsM02AuDUQe0VyBhq4Wq5C4XK?=
 =?us-ascii?Q?fDZy1gjIvIV6FEbazmd3PfnxjmAxuW415GeWo7Rp/ZoG+vv+F4yZCi/XFP7Q?=
 =?us-ascii?Q?H6g0FPST4yvkLFsCM43u/LGEnBnzLuMhkPI1b8SpIdb8e5KMTXf2ddg9V0cy?=
 =?us-ascii?Q?YNKx0ZlOApjLExicj2IDAlOySVJ1aSD2rxozB4vrSmHSYLhenwMhjwO6rjKn?=
 =?us-ascii?Q?Q1cde8f+ZwzKhdku1juzUHK8ADcUfU9H4aE14y8z1CusVc75MPyR9EwgeZpo?=
 =?us-ascii?Q?2hZsV8zDhyiMHwUasOHGZgXbN3g57kuHd/ex8nvr6Q9CkTFa2SdUXLU5w9Jw?=
 =?us-ascii?Q?AIdjIuPvwxfucwsVswIIzOjdqJtiDM4X/CNCcd8zDihDSNmdf/pZF0g4uCif?=
 =?us-ascii?Q?/MrFvj+kT5lHOS6n3nIfW/wUqJavl4HHkTBwBNal?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc3b9ae-4d73-40be-48e7-08dbb45f7b6c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:43:59.0798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zl9p57TUbnUoBLtlXFluIcZEHAyz87aZTW1DKbX0VbqD4mo0oGZmt+AX+y0Ajacz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5096
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

Allocate a domain from a group. Automatically obtains the iommu_ops to use
from the device list of the group. Convert the internal callers to use it.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 59 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cfb597751f5bad..38856d542afc35 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -96,8 +96,8 @@ static const char * const iommu_group_resv_type_string[] = {
 static int iommu_bus_notifier(struct notifier_block *nb,
 			      unsigned long action, void *data);
 static void iommu_release_device(struct device *dev);
-static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
-						 unsigned type);
+static struct iommu_domain *
+__iommu_group_domain_alloc(struct iommu_group *group, unsigned int type);
 static int __iommu_attach_device(struct iommu_domain *domain,
 				 struct device *dev);
 static int __iommu_attach_group(struct iommu_domain *domain,
@@ -1719,12 +1719,11 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
 static struct iommu_domain *
-__iommu_group_alloc_default_domain(const struct bus_type *bus,
-				   struct iommu_group *group, int req_type)
+__iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
 	if (group->default_domain && group->default_domain->type == req_type)
 		return group->default_domain;
-	return __iommu_domain_alloc(bus, req_type);
+	return __iommu_group_domain_alloc(group, req_type);
 }
 
 /*
@@ -1751,9 +1750,7 @@ static const struct iommu_ops *group_iommu_ops(struct iommu_group *group)
 static struct iommu_domain *
 iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
-	const struct bus_type *bus =
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev->bus;
+	const struct iommu_ops *ops = group_iommu_ops(group);
 	struct iommu_domain *dom;
 
 	lockdep_assert_held(&group->mutex);
@@ -1763,24 +1760,24 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 	 * domain. This should always be either an IDENTITY/BLOCKED/PLATFORM
 	 * domain. Do not use in new drivers.
 	 */
-	if (bus->iommu_ops->default_domain) {
+	if (ops->default_domain) {
 		if (req_type)
 			return ERR_PTR(-EINVAL);
-		return bus->iommu_ops->default_domain;
+		return ops->default_domain;
 	}
 
 	if (req_type)
-		return __iommu_group_alloc_default_domain(bus, group, req_type);
+		return __iommu_group_alloc_default_domain(group, req_type);
 
 	/* The driver gave no guidance on what type to use, try the default */
-	dom = __iommu_group_alloc_default_domain(bus, group, iommu_def_domain_type);
+	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
 	if (dom)
 		return dom;
 
 	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
 	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
 		return NULL;
-	dom = __iommu_group_alloc_default_domain(bus, group, IOMMU_DOMAIN_DMA);
+	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
 	if (!dom)
 		return NULL;
 
@@ -2043,19 +2040,16 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
-static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
-						 unsigned type)
+static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 unsigned int type)
 {
 	struct iommu_domain *domain;
 	unsigned int alloc_type = type & IOMMU_DOMAIN_ALLOC_FLAGS;
 
-	if (bus == NULL || bus->iommu_ops == NULL)
-		return NULL;
+	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
+		return ops->identity_domain;
 
-	if (alloc_type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
-		return bus->iommu_ops->identity_domain;
-
-	domain = bus->iommu_ops->domain_alloc(alloc_type);
+	domain = ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
 
@@ -2065,10 +2059,10 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	 * may override this later
 	 */
 	if (!domain->pgsize_bitmap)
-		domain->pgsize_bitmap = bus->iommu_ops->pgsize_bitmap;
+		domain->pgsize_bitmap = ops->pgsize_bitmap;
 
 	if (!domain->ops)
-		domain->ops = bus->iommu_ops->default_domain_ops;
+		domain->ops = ops->default_domain_ops;
 
 	if (iommu_is_dma_domain(domain) && iommu_get_dma_cookie(domain)) {
 		iommu_domain_free(domain);
@@ -2077,9 +2071,17 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	return domain;
 }
 
+static struct iommu_domain *
+__iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
+{
+	return __iommu_domain_alloc(group_iommu_ops(group), type);
+}
+
 struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 {
-	return __iommu_domain_alloc(bus, IOMMU_DOMAIN_UNMANAGED);
+	if (bus == NULL || bus->iommu_ops == NULL)
+		return NULL;
+	return __iommu_domain_alloc(bus->iommu_ops, IOMMU_DOMAIN_UNMANAGED);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 
@@ -3239,21 +3241,18 @@ void iommu_device_unuse_default_domain(struct device *dev)
 
 static int __iommu_group_alloc_blocking_domain(struct iommu_group *group)
 {
-	struct group_device *dev =
-		list_first_entry(&group->devices, struct group_device, list);
-
 	if (group->blocking_domain)
 		return 0;
 
 	group->blocking_domain =
-		__iommu_domain_alloc(dev->dev->bus, IOMMU_DOMAIN_BLOCKED);
+		__iommu_group_domain_alloc(group, IOMMU_DOMAIN_BLOCKED);
 	if (!group->blocking_domain) {
 		/*
 		 * For drivers that do not yet understand IOMMU_DOMAIN_BLOCKED
 		 * create an empty domain instead.
 		 */
-		group->blocking_domain = __iommu_domain_alloc(
-			dev->dev->bus, IOMMU_DOMAIN_UNMANAGED);
+		group->blocking_domain = __iommu_group_domain_alloc(
+			group, IOMMU_DOMAIN_UNMANAGED);
 		if (!group->blocking_domain)
 			return -EINVAL;
 	}
-- 
2.42.0

