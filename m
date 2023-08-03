Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9E276DC87
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:20:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XUUGDu+6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTyk1tfkz3cK8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:20:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XUUGDu+6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::62a; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThn3Nt7z3bNq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cp5rszlA32ddpI7zXHSyj2yNlx10KwQWeOXeW0rZLGJEvNTWWInVwmxrmC/ItLKmlFQA69nh0tNFFlxgxwmNAzuuM1fUS7U63kiEH8Ibnz+VrGTRTwJozPyLl/vRRPXktKSI/Q+zNOuo0jPrnrCD9B75vc5y7fyXb7RXijNmJnPgADR6Fv0lq0L8nSZwMBrtiXtV25usZQFhTzMB1cwTsb3t9CUbLAeTqGrUaGwONVeArnL3iwvQ3mmWS/d1hRflJvBRu901uApaW96kqHJ+gRpjjITZNv/ZxIdEgeC8iGwFJDM4FnntgUl8gS5R2aE2LAUy/Lf/Z4+sBL2hnJ3W3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/0gHl//8SqNFKrgnCU9P1aax7WPPBmGyHqK+vgxw6c=;
 b=j6ejmh1GQRSLo0Na8PNSsSensF1q8H4/wVTCW3/ZVBBSifw8oHygdee3bTEMcyfxUYeb5vZXZxmJVYEUmxp79UIV//ILN/2fpSmPcuqjYjrexn7Il7lQIZeZRUJAOceuyNh48nkaIx3XUehbmn9nY8pvD6vvlclxSdX1wGIVDyLdeFldD3z6mldMhsBBBKnigN+ZD/M+P8GU6rCvp9/PM5wn6HJpnMQQtY5kkEdIw34kQLd3sXRsqep/sclBW39QdZJJtcYWZObyhu6u1xyIe3MpK0Vdb9WUk5rUN4rgZ5gbT5atovf2c1x71cEbXYCxhLvI98Fc0e0UFWguFtvSew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/0gHl//8SqNFKrgnCU9P1aax7WPPBmGyHqK+vgxw6c=;
 b=XUUGDu+603R/yEZ+xdDDpqtWHO4m9P7pF0bWAxl+0WX7U/ARtNV9licL+v3FVVHDfq6dyZu3Dx9kSPKCWXPK9rlTDVZIwuFjrtqrGCELsq0OFbTItc22cPocByt9u6TmYvIiSNzT0kMUFrteyprgTK7DDkmGrGoAQQh4uDX/SroHeeCCoomqO1LJdRfpPwMPieZk5muPgwXXot9v7RxTWMBpF4xsGA0KSZHjjES27YvCj4W8RLITnFyb6f8Tv2purPRrfSWgWw4DWCzQoz8DDMyadHhZrXpPrPHRevEoT9l8VLaPSYiHHrRHuC1eXRr8dnVgnvjeg+se99xc2+9jCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:20 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:20 +0000
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
Subject: [PATCH v6 03/25] powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
Date: Wed,  2 Aug 2023 21:07:50 -0300
Message-ID: <3-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:208:32e::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c22a07-4d83-44dc-254a-08db93b5bc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	s6DZlPmKFJGYZUjXO4TLCG228FBGlEi0sb9cC+dtqYWoELiYeUoiSgxhMCQj7YwaCnu7E9RPFR6m3p5ACQ/hg8NTCbyiAhOXGyD+iK6xXt4sPO5O3pNb/Ta0lK9X9eUsS5L8i2mWR0f8wHYz9pO9KvEffQxyIO8CwCIqVrsrwjsRWNNoY6EgwCB0mjgOl5HenouVtQdGK76zNO1XiSbFlBJsRVTMpnY9+Ml2TzG6M4ggcsLOHbuRNFT1E0jcSIetfAx/AS2PsUwlUs/F/nxxA6e8lfTwRWHZOZL4owVsAnEwIXAFOvLjky5uBjETxaYrCKUT0u1GeTT1z3dMOdJB7NrUdOS3W5n9mcyPth4SHqPKNQgfeSUSAGWIuQtTdid+FA0xta4PgHD3/Iw0Ir/eeLbZIfWyVv+Guw71E7w8OfJyDHtCHEmBF3TyqCmmp2QLGmN3Z5meM4uHqYgZW36PxR115zaOwyuAPqNyuO49OEDWE21G2SzPTi9fkTspVenj1NxZkvLVEgeFunWXlS5KZyEmdF8Hoxv5s6lDavI8MQ6RHyc6yMJhzK+L2lo4RCx6YyIkse4Ai4hjBbp5yRkWLH+yBTTGHXqMvWuFsG0tn/M0DgbJWI75U2XGpaazKDP6
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4zJfy+r5V7F/s6VZVXwdXRtV8/dNhOlS2ygVdhtFBQ/Meh1uViKWvy+ZzEj4?=
 =?us-ascii?Q?j9l/3XVfDKGTuGfFF3yaeC3i49OHbqRxUjEMbeWIImM4+7Bf7MiUYm7N3R3+?=
 =?us-ascii?Q?k+aRKwN9KTd5hzUhKp5D9dXWfe/E4msdCa/oJcMuejAes2rkUM4MNhmir+X+?=
 =?us-ascii?Q?94mWKF8mXGtHSp3oVgXwNAdXc8WQS6zVSqcb57cim7wqhq/X23NYNwu1z4Ue?=
 =?us-ascii?Q?jdAe+hCSQVC5YiyqwaEgPQfBKsjv06M17I8BujUSTktfK6bUSmbj6fYgHBRU?=
 =?us-ascii?Q?y2WrefdDzX9CzxMSiXsqGu74IfQrLuwg1lKkZba3hZJ5YgwBtN8oF5uZgHF/?=
 =?us-ascii?Q?kR3299WHr64CH+AkPIlnLRbTItwYd85QAk4WLRFvV6s2i+XlcwkYE6r9Iraz?=
 =?us-ascii?Q?+MVem+mmJ44iU8qI1Ny9VpvRn68mfItvuD5g3hkYpJooHwyxjXnSPfPDSiAf?=
 =?us-ascii?Q?OSFbDBnCbqW/DvZTc53guUc6c+bF1/OOoUrCAuty8xPpc6VINH8Xah9LTOsj?=
 =?us-ascii?Q?XSWryUeAMz9+tv/oK3sYg7PjY4x6eri1ZreMSPQTEBmykZaVw7HzwuwWT7vj?=
 =?us-ascii?Q?E/bAyLH76Kseo2vwjjhUme296DA2741B+DPqL1fi4EcRoWAn4KOyJ1Gc18ac?=
 =?us-ascii?Q?irBSVQdDpQmDOivZoKLxs8TCm8nX1jUdspp5jnSFO6lzhaDgZKlbKQl7023B?=
 =?us-ascii?Q?DMzWgG+vVBJ3pUA6xJ/bD5rmvok96zE0v2NUNHK7Zja8rIZrQFDuzOWDQiuU?=
 =?us-ascii?Q?Ti2XhotzMp6Q2ENwJ/PJY2tCLRHHYsdEnfRdTXJjLUmw8HajDEIpGDrzx6qF?=
 =?us-ascii?Q?7h0CR/NcjiIBTH8C8Evyf6FnoguElitT9vgbC1WtFrmwxWdqPru07/imsG24?=
 =?us-ascii?Q?kRaVcuuwqskG9adDjBzKVB8GKeHV+mmVbXNI1RGzCWaxD1F2mMXFo6yhSZmp?=
 =?us-ascii?Q?fl5QSe8QatDHNPEKP8AO4V+RTrCGj+IuBLKczS4lVKOsXBxf14FJCPu9xqub?=
 =?us-ascii?Q?32QphiVbFX0Ik4bRjctAm6d8aH8AAqOX2Q98IExwO2lOc9XoqouJN/QQW1IJ?=
 =?us-ascii?Q?9QJBFYOe3Bsd2HQT/PCUuDUecx3c8fB1d0tBSi+VKkxWfUlOZMaIcmhiTtZU?=
 =?us-ascii?Q?oUpT4cqOegi1/F0IQgNEwc2mkl+DBxdGI80eSymwDNjA1vVLdb9azCFUuNsk?=
 =?us-ascii?Q?pC+IEaER55zKIgO5te1TZ7yIosnDs/FOyy0OOTs0WpfC/pc8zc0OqXYaf4hR?=
 =?us-ascii?Q?QZB1Qunx33LEUMnpR3KwZntZMR4Q6AF6l2gikK7g8OD5rx2Zn5hZoZ4dqsGM?=
 =?us-ascii?Q?ZkbTC3R+t8uaLYIIdoM0FFJIaS8G4CdL9+eHPpy2B1784f5yiQzIdGMF6zQ2?=
 =?us-ascii?Q?6WdSJDZnPliBnUjQjPhRpZKjvEmsjno/U7EyT5hf4sGC/otAVtJ6qtB7qetB?=
 =?us-ascii?Q?vr5ufZqVjA5gPGEBqBrC0R+lIsMHgO5hWh1uOvMQCeMeY+GpjZo/7nULZ1nI?=
 =?us-ascii?Q?i9qKo/0nyEuhzZN9EQpyLp/LfNTFJcUqM/eTDYSDAwjdXnT6TQeFH5HiAlcV?=
 =?us-ascii?Q?KhP3VYIxyvLbe+SvByWAhLzdJ1KT3CWEGmLFoDWn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c22a07-4d83-44dc-254a-08db93b5bc0f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:15.9588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leW1uQ8TzT68MBT9ekL1m6+Ida3NCtxgwJhXUlM3ppYWTj9OfjmDR3B2TME9dkz2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809
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

POWER is using the set_platform_dma_ops() callback to hook up its private
dma_ops, but this is buired under some indirection and is weirdly
happening for a BLOCKED domain as well.

For better documentation create a PLATFORM domain to manage the dma_ops,
since that is what it is for, and make the BLOCKED domain an alias for
it. BLOCKED is required for VFIO.

Also removes the leaky allocation of the BLOCKED domain by using a global
static.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/kernel/iommu.c | 38 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index c52449ae6936ad..ffe8d1411a9d56 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1269,7 +1269,7 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
 /*
  * A simple iommu_ops to allow less cruft in generic VFIO code.
  */
-static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
+static int spapr_tce_platform_iommu_attach_dev(struct iommu_domain *dom,
 					       struct device *dev)
 {
 	struct iommu_group *grp = iommu_group_get(dev);
@@ -1286,17 +1286,22 @@ static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
 	return ret;
 }
 
-static void spapr_tce_blocking_iommu_set_platform_dma(struct device *dev)
-{
-	struct iommu_group *grp = iommu_group_get(dev);
-	struct iommu_table_group *table_group;
+static const struct iommu_domain_ops spapr_tce_platform_domain_ops = {
+	.attach_dev = spapr_tce_platform_iommu_attach_dev,
+};
 
-	table_group = iommu_group_get_iommudata(grp);
-	table_group->ops->release_ownership(table_group);
-}
+static struct iommu_domain spapr_tce_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &spapr_tce_platform_domain_ops,
+};
 
-static const struct iommu_domain_ops spapr_tce_blocking_domain_ops = {
-	.attach_dev = spapr_tce_blocking_iommu_attach_dev,
+static struct iommu_domain spapr_tce_blocked_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
+	/*
+	 * FIXME: SPAPR mixes blocked and platform behaviors, the blocked domain
+	 * also sets the dma_api ops
+	 */
+	.ops = &spapr_tce_platform_domain_ops,
 };
 
 static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
@@ -1313,18 +1318,9 @@ static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
 
 static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
 {
-	struct iommu_domain *dom;
-
 	if (type != IOMMU_DOMAIN_BLOCKED)
 		return NULL;
-
-	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
-	if (!dom)
-		return NULL;
-
-	dom->ops = &spapr_tce_blocking_domain_ops;
-
-	return dom;
+	return &spapr_tce_blocked_domain;
 }
 
 static struct iommu_device *spapr_tce_iommu_probe_device(struct device *dev)
@@ -1360,12 +1356,12 @@ static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
 }
 
 static const struct iommu_ops spapr_tce_iommu_ops = {
+	.default_domain = &spapr_tce_platform_domain,
 	.capable = spapr_tce_iommu_capable,
 	.domain_alloc = spapr_tce_iommu_domain_alloc,
 	.probe_device = spapr_tce_iommu_probe_device,
 	.release_device = spapr_tce_iommu_release_device,
 	.device_group = spapr_tce_iommu_device_group,
-	.set_platform_dma_ops = spapr_tce_blocking_iommu_set_platform_dma,
 };
 
 static struct attribute *spapr_tce_iommu_attrs[] = {
-- 
2.41.0

