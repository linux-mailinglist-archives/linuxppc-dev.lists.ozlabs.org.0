Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F0B75FDF5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:41:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ax/8ecXd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nXF4NJwz3d9g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:41:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ax/8ecXd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::629; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6d5Q22z2ytd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKTqdWxnaWGWIfvfd0ZblD8ksY6xuOYhyu9V4g/1OnDV3h5uz04mMke0GbmuKhl2jeetdp9XfgsgRmEB8yg+OhftY4TvUE6BSPD9gyDOJPM9Hh7yp5nVZZHUF4QWXHX15IlDoCWkIHMAqr5iOO/YX/2vk4QKr0awl/AIE4geug9EFABQ7Ag26xp+zUJZZatWK6V1fD9QNeXuF7/3yMkpr7tinUiOCOawVIxEBC4Wa7H3U1aJNh2mAUNlO76CpP0VM6z98DgI8aTjrmPcV0Q7pVKRFB0PzQQmGIWOs2Ez5xe+101WiBP1xaQ8d2KLO2gLUhJyQY8YAwdnCqGhLuNtwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHnIih7z1NsYVt0Tt2cxqsqWFhB4lKuFjuoGFmx4KEU=;
 b=in6joumP4T9PJ/Zm3F4gwx6DiyGqPKh/ZEpIN97DBICvRfLPXYMFmw7Jp0/bIEJjfqejmbAXU6lbVqHYngXG41WvVFfsRUCW+nR1WpAbN3r2MOkonR3quKIoasjnNz+GU+nGS1X2Wf3NteXWoAmc+i+QsVahXbxBd46i/yObpH446vsXlOoniqbH5/jWNrF4kpUW71ScrHECXBRzLQkokFWT65I9K26bFNX2IrzNLsR24DuhmOCiAe8jt2xjCgCkYq0lLPgopP/obtobY54G1Pozsg5Wv9Xq+eI0DHoPtQWuHG7KX/QJocsPIYNA3jNBXGmYUKGYHrh3DMhkMoeknw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHnIih7z1NsYVt0Tt2cxqsqWFhB4lKuFjuoGFmx4KEU=;
 b=Ax/8ecXdTo2xBgcZ02lnb5U8yH+X292I77q8dJljakTDrpObTbMPoCeuadqSe2fPPIh29up1egWGQBvn2mkyfsrOlDuTzhIDY9+fmLIdkOZNPKKGLrDPQcUUjhMsmQGBL17bShu4YeNt5PIPuxz0ve9fUexrAnSeOu4sWMpvs4QPDgKzNPF03HdemRl5CDPxeDSxb9S81AKVRkekCDfuJXab1+KyrCJvdSxM4YnN1OccOabSQIM606O2cibNXenXU7Eh3z75yFsfQY9Qvq89yzKTzF8hsQsmAWLHlBSZkcQYL1V2Bjd+XXKjbhEowLB7QmxWWOMBBQMS/yTqhUpZOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:28 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:28 +0000
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
Subject: [PATCH v5 17/25] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Mon, 24 Jul 2023 14:22:07 -0300
Message-ID: <17-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0027.namprd22.prod.outlook.com
 (2603:10b6:208:238::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f2ae72-57c9-41e5-fc2a-08db8c6a8988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Z9cm2tRL2mm6ZVT60zv3q8hcUAxShBB0B3C6DcgsntCTqeA4eK3tHoqIC0yjvwlhRitI7fNQd9FYzfD4F75v5DhWIqt9+w2nCOEVt6WzXKJscBfy4Xfu1o/yfLQzSeNNrKgB5j91mwy+RCmK7rFwWd32LemD+GwIh8WtCQxFcP0DAcklLLF/pSMY6d3623B+qRbGnvrmHjTvRiTQ7wSVNUQ6syRbzJWRqGnL3RRQwlLUN6o8iXwNrCWfTwaRpEgUG42bnm2cJG0qmRfHQ9M7P5bs/63lmZ0sEIjNlFHyjefX7eQP7YJi5yUUYeaALS20ML0XWAl1UcKCrqeC278QlUGYax9EbFH7sG1JFa2nX8n3J+bSWKal0rPPbWCNg/X0yNJmfziKc3oBi/kLteijN/K2EL0x+Q/4fU6wqb5wsCmzW63bWh8tSoDAqLVp0zwRjEo1V1xVcBuWygcPjQk7bhHUz/VuUUwyNVLHS6XztgpRogzrd8zNrYOtbgAqJ8Qo3MdS5LguSfl1t1erEB52FULZJWcPLOrMbKWe295qu/XtUyu2p4UbVSX5o4PF9JK+QT0qgw+kj/+oxCJN2skHwmrmSnDtL9aNjNEcMd7XEDE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?5OoJsfb9nu6T1aNTnkfxzAOMSxIIVlSu159uTB98TPeaWWFjiCA/VVG5K9e6?=
 =?us-ascii?Q?v7hefcqoF3vag6Aoh6R4tFCuoQvehMyCKswyimBRZeWiaE5DGco5lofUiAkb?=
 =?us-ascii?Q?UkgzOS1lgprmmVMTohU2pHnwTOYhgiVYFeG0q2E1njU8s6N2noFi4eZXYZfJ?=
 =?us-ascii?Q?QsFi8SP8mtALRYb/eHrTKjHMatfQPalIA9nkL/lE2cGIK9cckYJLK6/MckGh?=
 =?us-ascii?Q?noVawtgCP8gRHhqvSv0tJTG7FAdNhu9CIOgcn+V7n4LyRZxVgusAl0cJAn08?=
 =?us-ascii?Q?63lLMJFtkw22B3xixjZDXJj42DWvZoHUotk3t4p2J6lxh2ltAPKiIl5No5zU?=
 =?us-ascii?Q?uZqfCMXuM8yi8RE8kn+N7pgzsba2HrMTUq+IfXaWx5LpGZBQZDdBCV8kfxZt?=
 =?us-ascii?Q?6lF9PyuwoabNtk6XQMvqg+NS+zyTv7gR/35T8xhGfZkm1YiwUALhQr3YwVNy?=
 =?us-ascii?Q?SWOELNIWvDyNBzvnbnDWr/5OCo8kETwVVGoD6aybol71Q4r3THH/PhEOF0Eo?=
 =?us-ascii?Q?Kjf7VFkYROaQPM5yJrE4BNM6BGbO/X7FNMi6MEYkFjbr88ynnYMPElqYUAkN?=
 =?us-ascii?Q?zcRRrcynuZ+zoy0XvL8l/s5akal6Z+GlSEz7ygYoeBqSD4IbGMJpUtS4T8dS?=
 =?us-ascii?Q?R/Q+phyYK1iBSSOGSebMudrv/XKIyoibNrunE4sq0wb/lneyHvA9R7PI5Ak+?=
 =?us-ascii?Q?VbMeSG1zEKSpnZrmlBtcxZ9CT/GfQqozLbNFHLQudYPP9NQi6gjf7Ge1Bt2a?=
 =?us-ascii?Q?50QK9jUyMQpLIaRrjRh3ZeIHA36cWKUFDPcmwIhq0f+zeznK1TmFInsR7Vl0?=
 =?us-ascii?Q?4h2KNeoLA2x1TvT0TrVRmZpV8sQ1QVNauloTnEnT6HKB58sHVDBMoQT+RGZM?=
 =?us-ascii?Q?0YIe/bli3zKbvfRRkKh6+e6pQcIvx+ziLoa1EENdvcQhLEP70G0x11ka9+o9?=
 =?us-ascii?Q?QDerDWEChbaCx1oWxzKbdtL4qstXcwikTe+xn1BrSjCsQ+v2hGC4FbXge54K?=
 =?us-ascii?Q?4SoUS9z7UUYKFD7fZmLF+pfZscKfCW6KW7lMaf4VmAWyePdg1FkXtubekdlV?=
 =?us-ascii?Q?kv1PLhWUd4ElNbNbmLjKKyFF2eqYsUjekaW9lHOzyHAEofayhfyNvKKAVut0?=
 =?us-ascii?Q?VH6MVR/akx/w58pOajgwfL3jEqu9OEDJTl3lioyFXjwMGqhfp0JDnY5jcC48?=
 =?us-ascii?Q?Ljl4w7HBgxz8fc0yO+EQGveH+jNdoHtzvjAio69wkWkZBAhcxbUfIWKWGdwL?=
 =?us-ascii?Q?WAeA9gt5t1MPCnX9HnDZfYB2hSm8SZIfoY/XwozmN/5cmY5O592ZJjRAO2Jx?=
 =?us-ascii?Q?A/K7Y+uCXT/f52pQjQ237Q0ckfNvJS948iA8CVwcO4EKOA+MAP3GoV16S8OZ?=
 =?us-ascii?Q?Rc15ZH7RAtWaZ6wyH5cshrv7zBFDhx8YsnMiSCBBUJS+wYX0cdn8hLapWlvA?=
 =?us-ascii?Q?5x93amCXaiBN7ir0XMobsz7Fqp1AazFVaFH/ZNy2ZrNhyrscbBZHazmMioZM?=
 =?us-ascii?Q?In4B5E22EZ4CruLjJJ5fEyL4wL8+EFOxAEW6SzTtQEjzJsH+jOS+R1Cbpat9?=
 =?us-ascii?Q?yeiYL1R+4ldxtoxHq/Y7eROjLHSx4l4lTVQpY/qA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f2ae72-57c9-41e5-fc2a-08db8c6a8988
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:20.6306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RF46/EyTnGLqQn+sqaTimN/aSWpcsperwBj34XEmm+627NZW5QzpE7jN13hHEgM1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252
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

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index a503ed758ec302..9d7b9d8b4386d4 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -387,6 +387,44 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
 	return 0;
 }
 
+static int qcom_iommu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct qcom_iommu_domain *qcom_domain;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
+	unsigned int i;
+
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	qcom_domain = to_qcom_iommu_domain(domain);
+	if (WARN_ON(!qcom_domain->iommu))
+		return -EINVAL;
+
+	pm_runtime_get_sync(qcom_iommu->dev);
+	for (i = 0; i < fwspec->num_ids; i++) {
+		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
+
+		/* Disable the context bank: */
+		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
+
+		ctx->domain = NULL;
+	}
+	pm_runtime_put_sync(qcom_iommu->dev);
+	return 0;
+}
+
+static struct iommu_domain_ops qcom_iommu_identity_ops = {
+	.attach_dev = qcom_iommu_identity_attach,
+};
+
+static struct iommu_domain qcom_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &qcom_iommu_identity_ops,
+};
+
 static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			  phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			  int prot, gfp_t gfp, size_t *mapped)
@@ -553,6 +591,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 }
 
 static const struct iommu_ops qcom_iommu_ops = {
+	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
 	.domain_alloc	= qcom_iommu_domain_alloc,
 	.probe_device	= qcom_iommu_probe_device,
-- 
2.41.0

