Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E158C75FD8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:25:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=F/r2ApWy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8n9H5r74z3bx2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:25:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=F/r2ApWy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::627; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6X2RZVz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhQG6RiZEal+OjfnnbPwFr3jQ03JuY6/i1BTsGFaI5pxg+KSahwr4PZ7KIokkAGboFn4gfVB5mniygu+596YPMysrCQqkpluFL2KehGl2LrAtATJET+Shq5DJhMnlvDm/l3OG/O5cLIwwMtXyNWvU6rttOywWG8mgD2QHfS2ufoWFXd/cUIDOk1yiGHJkb4H5Hciun6/5R/wNYJcFgzKtJc2Dhn+mIIaQiiiU4dHx19epNCBOV2QfYzrgQ3waWoCpxRe7M7RQ+bLKrhZnIIHjPPuJkVawT+5+voI1JaZZ6AKwBTEf83BZ3P+OU1cdg1OhqViKHS+aAPraMNwVCw1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDluT46x+zXNddSWPORIIRIHHLjHcmJkqURv+cv/jF8=;
 b=Qw2Ju8oPvKqZrUUJZzwFWBV56norpFxgiyCuzgdzNFV41OPzurLIGRaYZV3rAX62OqkLTh9teCxX/7nX+5Yw0uZyiEDppBw1pqCBzY18hUu8pK8Tw3ifshsie6FNzEUxL8inkx7eH+zGznigsGRI/NLOS7wNc0jVSPcQM/MCEqsJtQnyY327FVkSZOOG/uWtC6uw7V8FGmQeyynAj0zIK4XY2KL/rRNfQdEfx1KBZuAIYY0W4w3wRfLPDEoAyAkpyRBxqak4JC3VF4pOHMuV3OWKN/rd0gbB3UPRCQSzSvI8LyKntU5MvVTeNFqNUowZtlexniRE2paBM/sScBAabA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDluT46x+zXNddSWPORIIRIHHLjHcmJkqURv+cv/jF8=;
 b=F/r2ApWylgRDmT5nTIpxxuwbuIIV6VS11vKD84aXfFr1fdR82rkrtkz8dAJC+RFI+SnfWfV1GvtoXjpMjWBIU4ffkfIbPYmA63OnJFQJAz++rlv7BTpOF/E3KJ8HEaP2XsJ0lJ4GYp97IqtRhwJ9cqQB3brGkONZiPRshlxA50e1t8BFycX+f2fmacBkkJ+o5b730ZiX3df6Uw8TS0SSeyLOljVXyqYa2DlhgNvjspU9NESaai8t+e6Z/Dd/CKfk+Mo05WCZUKGWX6MfiSgh1wnPSPYQ+o5YMNKmKY6CD36IYRZdx+z8rPpveYhiWuSl0cu/ptzSqQPLgRVtChVqwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:17 +0000
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
Subject: [PATCH v5 01/25] iommu: Add iommu_ops->identity_domain
Date: Mon, 24 Jul 2023 14:21:51 -0300
Message-ID: <1-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:208:2d::34) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: cd805c52-bd10-4797-f54d-08db8c6a875f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AaOGeZtLuUoq0yOzWphFzqM2XZ8gp73PIhrBkG5c7DZyTXoxpKwa3FU8WLn22Gt27oPD94s1gXc5u/+Y4oru5vS9J2eoFpHhJqEEZ/TbIUxkxpGLrFOUVhW0s6TEENpquWakCsdqq9dDoSNA+93hPR75eRUOVK0BiuYmPjbKPCOABs7ZFpcRgziB9epf8wtQGekx26gFr8hXm6T8j8txWey7i9Zh/e+6uL4XRWV74Ol0iUQxdJgklkRM8U9IrMsBj9yhY2yBiz6hsgdnp6xAojP0Kj3YpiYW5plZI194+g+lYNaXPe+eHFNB4BOCpUAbiraVie+Ut5409OuurbnOyYS7qHp7QwziUbbkmB0ViQYQHB+cBEahr9p9eigKPewrDW6yYF+Uh1y/B2Q496MREfWyuw3mk8soLBR4uXR5Nx1sGC9OzS4ukxKtosBHvCimx9fcyKK2p1CZzSbnszKfSSa/cp8Xa1KLdeqq2EL4k+ZR9fT6RTvDftrKydfgOk7SDEnl2njgyAv/2CgMzsj6sRPu1dy6JCtlOjZ6ax1J0uOcfz2PB3DvJnecbJ4B2BAlQWBIMlYtecYIU2DNbYDll/qOyQXa9zGxZDK1djtEBzw7Bj/tg5xv1pIIwsYzrxUh
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(36756003)(478600001)(6512007)(6486002)(110136005)(6666004)(54906003)(6506007)(186003)(26005)(107886003)(2906002)(316002)(4326008)(66946007)(66556008)(66476007)(7416002)(7406005)(8676002)(5660300002)(8936002)(921005)(38100700002)(41300700001)(86362001)(83380400001)(2616005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?+qWD703rqRcFznWyA2xlTK6lhw8b1E0wo3KBs5dG444Sovc6TJrHDMbMmW15?=
 =?us-ascii?Q?euvi0TPObKmXqirCNTD1gia7qbO15LI94dbKi4mR3/5V099WfbWMP6MjGGFK?=
 =?us-ascii?Q?1lpa0y/4jGRSXBgxJDp1XG9L14Ww4GUp0gSA23B5Wb/zRJsUhhABLUXnr2VG?=
 =?us-ascii?Q?ITL4MaFWvjr8f1njGFGDorU+jaI461j5rJSZ9CDmpeWWaSUFVm7A74CNCxGM?=
 =?us-ascii?Q?IqryQ7k4h2nMwoA9c6T2Mtj+C1He3KYTYtyLaydfdiQx/xutjE3lr/pqHFZR?=
 =?us-ascii?Q?qXsaT9IkZ46JRXYskl2P4XenCsMhfgCS5Dt76tigqaR6wS+l0fHxD1vRfzO9?=
 =?us-ascii?Q?BOk14vpcYjH/p3UWAj+CYMi/IxaEoDbRR7YDD4xfachuB08e5QECpvteY2Z5?=
 =?us-ascii?Q?G+DMhLI6P8S7sSiH7mAAdWE9zXh+JvlmboxGUzbmAoNP5KgCC0mqkeAWdDLi?=
 =?us-ascii?Q?jtxu4uCP+JxPYRKEXZk3q7rPn7jkjCI5onuf42mIRCR4WZ9M/K/c6cBmkIn0?=
 =?us-ascii?Q?YDEDqkMPtDuhWirsWMiOYn8/BIsLMtVrsL3kkceLTBPs66IWUi0iGx0RWVok?=
 =?us-ascii?Q?WAEFJ/Y7djCGUqymehOGpywVPfubfN/Q7a88OMu2RlMfd0c5R7RT9Vp7o//5?=
 =?us-ascii?Q?15qiJywNytHnBXgEwcajEDrYXuXd0msqMINjbCDg72+Nx8C8gFOqAq14CSRk?=
 =?us-ascii?Q?H8NOX3ytL5uBXIM9EU+PBeAVcEUL32F5j3s9MJe1mjQeTkKJDfSKEZITOZDW?=
 =?us-ascii?Q?YWGWixPAwl3X5+kdRcXLlvS4TTLEdrlKotFal5QJvvK6DLnPRpGeM9HhSKfY?=
 =?us-ascii?Q?S4rzq1Wo8q+Qtol8DBkGPW/48uBnbWfNLODGr73/KAny/cXW0LBgHzv3Vjje?=
 =?us-ascii?Q?pdhwLJ1X2OhM0fBcoZfDv0PVb36PKnxYScy+8jz98mLN5ylDEmXFuTgdV84f?=
 =?us-ascii?Q?EYLrTLoqsSKKSmIZTbEQZWk0hj0ZVW1pL4Br2mK1MQu+rSg4h8/5t4SDadRW?=
 =?us-ascii?Q?8dQzcpHue7u+kYPjqYOMRNnRdrEIdDLDudEOM7oQLkrO3BKgFklmK26BZvXN?=
 =?us-ascii?Q?hwHxMYws1cuQx9sUKfQZBkGLQ4g2YakDMPfb9cSwCQpFQdqYzuYJlVyOs8WL?=
 =?us-ascii?Q?H6jyhGUvYOdMx742llTnzTVaL6ZeZtEMQA6rCT/q8kiARY7on5zQqRTGJn/i?=
 =?us-ascii?Q?oFQuCXDSfR+vIQJwbXuZVraacY51RkAtYEUmBDbnW9U6fD2m9J/7H+ve6iZz?=
 =?us-ascii?Q?YX70Ia8NIM5II/5j1b45GfViE5ltFhKJ1JD4mdRFYfJycm1nSRRJT5dqL5/f?=
 =?us-ascii?Q?VuSUiR0V0BTXFmPqewD81vcxASBejmccHaHxZZsPg5AVuJ+pNcANwU7vc+KH?=
 =?us-ascii?Q?p6cbZrIqnRj4uQAmap/RSA1gX/ZlmHjyUMXIQvs6vdcr00FO5k63e2O3jjUd?=
 =?us-ascii?Q?y+rwb8k8PpJTWYVxDU2PJCJAgrwul0aT+c/pQs4BzVjPLhUgWrgPLGj3KHcJ?=
 =?us-ascii?Q?YeBP9Jg45tadG1wt7E+GdH2F48PgyftWHSjcuLUTKQBCWEm6Ik0GGtL4niFN?=
 =?us-ascii?Q?BesEvz8V7kmUOMuvZ22waAlxtEe8R5sJ1PE5jZ78?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd805c52-bd10-4797-f54d-08db8c6a875f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:17.0394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CYBFExc66C8/4hy2QJ51BPmy5kBgtCPX1GjYdjzhfcwdkyEAHujoON8LT/Kibgm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
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

This allows a driver to set a global static to an IDENTITY domain and
the core code will automatically use it whenever an IDENTITY domain
is requested.

By making it always available it means the IDENTITY can be used in error
handling paths to force the iommu driver into a known state. Devices
implementing global static identity domains should avoid failing their
attach_dev ops.

Convert rockchip to use the new mechanism.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c          | 3 +++
 drivers/iommu/rockchip-iommu.c | 9 +--------
 include/linux/iommu.h          | 3 +++
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4352a149a935e8..5e3cdc9f3a9e78 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1931,6 +1931,9 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	if (bus == NULL || bus->iommu_ops == NULL)
 		return NULL;
 
+	if (alloc_type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
+		return bus->iommu_ops->identity_domain;
+
 	domain = bus->iommu_ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 8ff69fbf9f65db..033678f2f8b3ab 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -989,13 +989,8 @@ static int rk_iommu_identity_attach(struct iommu_domain *identity_domain,
 	return 0;
 }
 
-static void rk_iommu_identity_free(struct iommu_domain *domain)
-{
-}
-
 static struct iommu_domain_ops rk_identity_ops = {
 	.attach_dev = rk_iommu_identity_attach,
-	.free = rk_iommu_identity_free,
 };
 
 static struct iommu_domain rk_identity_domain = {
@@ -1059,9 +1054,6 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
 {
 	struct rk_iommu_domain *rk_domain;
 
-	if (type == IOMMU_DOMAIN_IDENTITY)
-		return &rk_identity_domain;
-
 	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
@@ -1186,6 +1178,7 @@ static int rk_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops rk_iommu_ops = {
+	.identity_domain = &rk_identity_domain,
 	.domain_alloc = rk_iommu_domain_alloc,
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b1dcb1b9b17040..e05c93b6c37fba 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -254,6 +254,8 @@ struct iommu_iotlb_gather {
  *                    will be blocked by the hardware.
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
+ * @identity_domain: An always available, always attachable identity
+ *                   translation.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -287,6 +289,7 @@ struct iommu_ops {
 	const struct iommu_domain_ops *default_domain_ops;
 	unsigned long pgsize_bitmap;
 	struct module *owner;
+	struct iommu_domain *identity_domain;
 };
 
 /**
-- 
2.41.0

