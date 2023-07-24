Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4358475FDC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:31:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AS3dQ8Mu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nJw17xQz3dD1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:31:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AS3dQ8Mu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::611; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6Z2zB5z2yDb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYtuvQtDIGWhoGu/ib56+qEWAvuFN85aqMuEPuRp0mlz47QpauscWdPNjVn8zlqzT1f5MtWhWZnU+10YaBYXHhW7TNE5MqCMBBRJp991V5tNPHuJTYKI8xyOFPKfuh8W4LqnQrhuWwYJ2zAjiJDD0ZfKpDdjZ9EQMaDCyZop3mtff/oEGHH8wUIaX/nEXp+E+lvv39iq03Px/YfUB2fDg82YG1PrrjiQ4XSPR9iVYqqkN2++0hKhIOa7z6ic5F4mYOX2olbyNbtEtK48uiZW9T+Nbf+L/MXBy7/h6e6Gd/uVy4IxjDapAvIB1/5PMR2VcwCzGRUw/+GfUp5fn/OY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/uxLFw6T9ll/W7V4Vb06QW+koECiUEA49Foq4D3zXw=;
 b=oc4tD2Hpc+LYTYk43lhdTtG04g6J812c9LbDCb5s0BEKj5Wz6UYw9DoqBjjm2yN0v4ffdWQ4G9Af6ZRr9hAfGygHIcwpPLYp7Z4dcXgZ/r45zyHpvNdXlGLTOd1zGtrtkeQXV5MYKuV7XsfSdtKl9oWltguAb11mPnUAkgF4TZ6L790ou55TrfGQvdwmUa31GNS4aGV9gXuT9JIKa2qXJSRpAHV/aaacfiIsQG6RplXRy+wX5NX2Fz+qIoMOuwOXVNOfgFQQnF50anPm+IFm3QIWTeBOm2AqeGb2zq+RIHiaSb8HG+RI2O0Xv6MIuMvh7pvAtJw9cjAzlfLePcH86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/uxLFw6T9ll/W7V4Vb06QW+koECiUEA49Foq4D3zXw=;
 b=AS3dQ8MuG09gZsjIO0SfUGZ3V3L7OooWFz0E1QbpYDG0QMXsd+6zls5wlU4BzdR9op/+rAdxyAskVw5z7UcI1Hk3IZVm4ZrPRK5XuAYf2SJLf1fslLhC4btRjU/mQ+M6vFSWIijXLqb5egE1ZquU4MS48wdUWNZ/9strVgfcDdBk5s808MT9viqdL1MalwoQRSk/qfmIBc8G2zdoFE6eleQv6fVq577f94R2M6vw0iAazTjVkSuFdDmGGhn1mUmkuDb/KAREL3+fErvya5aZIySXz7Bd2quETJpUdJ9HCf/Pa0AeVQD6q/fW6FY1p/g7f/3uZj02/bEeMfUC24sNsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:20 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:20 +0000
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
Subject: [PATCH v5 25/25] iommu: Convert remaining simple drivers to domain_alloc_paging()
Date: Mon, 24 Jul 2023 14:22:15 -0300
Message-ID: <25-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:208:2be::9) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2e99fd-6130-45cc-1662-08db8c6a87a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	K9bQmnWR6ekgkHXjWTofGDenpkkP6WnPNIjuIzjpj/xlkzI/GywKdrFqteCq5zI9q5MXN2BkBdFNhTi7md2z8mjcE+ZhQZuG0awNZ8QP9nGfIpEduNawbZg3jlcmMvYx/nwqCq85NWNBMsdxTvEuZPrBhfw5mnyn/lvGfitcMteb9W73AnBRQaTHgoLq03yw47UGHGkb7cU1eZaU+FcxAgUMJebYDcYnTEZ4L4gop+dX7cu9zXF1+HPsecfCE2wltjw94aNEIR+XmDUOL9V8WPpvHTJl4pRfBUGh9kzXay2EA4lvKkPMoL8pfI0ysM5S61+2ByB3LD1AqA8A5EDcT1Wo5LmrRPAehsCTueBq9Kuk+U8qtFBaD2N2rMYhuPzuZE6q266KSCWxZfkdEqF552RRtxTa+td3L0Y2MAfKfuIsOGup0+J9Y+b7HNIkXxUJ25DcbmaPChd5UGmAHFSJ9icBGcvYakKxPBmDKt44aUwXBilbmdRzaagUIfG7KtZoi76uh36ZZF5wCZuPujrvXV33+4w9xELGqH1Z40DvlZwjJVayl4b6Ue66N4ADIp6IL7dg2YCdoY+TRuL8z8k298QBCb/MSimDbHRvQD5pxFE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(36756003)(478600001)(6512007)(6486002)(110136005)(6666004)(54906003)(6506007)(186003)(26005)(107886003)(2906002)(316002)(4326008)(66946007)(66556008)(66476007)(7416002)(7406005)(8676002)(5660300002)(8936002)(921005)(38100700002)(41300700001)(86362001)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bE7llnglrWBWDD2EFtb+GdFu5s1ZDYkvcVrPyMCVG6jtISOidqWlZUThJLHH?=
 =?us-ascii?Q?HIVqyVnaK4x7KupHOACfVoYJVXQ0iba9UyV52lMNlby3+4PO9fx1i9f27x0c?=
 =?us-ascii?Q?RMeNj0uEllONA/I+M583rXdJvVBlVXOj0Q2YI8gSYNdmfVJpz7fUk3amN+q0?=
 =?us-ascii?Q?SqyBptYQgw3ey5KPZBqwbj3bulM/S7fWjHZLgtABeAoMRN+BLw7KlejGieEe?=
 =?us-ascii?Q?bfMnXUy/Q7MxmXjChtvSskZeTMAz+ivc0+Bco9H99mbwwPhRwTdZS5oh7/HT?=
 =?us-ascii?Q?N55zN29orkW29sKWiDgFeb4EAJLViNZzSpvJzfb+UoiMggtv0XZ10ll7zPEm?=
 =?us-ascii?Q?WY97/B1pedPF7Tx3joGgpDgTK4wywHec4Z6vPK4VnDe3B5QJoFJS9D8AOsI3?=
 =?us-ascii?Q?T1tB39DsXoP6yY7rTjtAzfay3lu7Ak58HBw/xvmL3O2x+EkrnQenaFYJbwJN?=
 =?us-ascii?Q?bwHrnojg4PotyFc9YclYhyLiO2Ubrs3HnNzrtmpiYMIh1FrtF2AcaX23G0j5?=
 =?us-ascii?Q?MyHoeObfrbCnKc4Zekpnobm9vWSmMU24KvJo2YRZMI3OPlV5X4ne0LMyGfrH?=
 =?us-ascii?Q?jkMPJiMdxLXZFBoX48IM+8NxUOatg3P7OinBB8cteOY03rPYE4VQGCjFNryu?=
 =?us-ascii?Q?GJWeOQqgK+334Fbr4T8k1SJtsvQ2q2rjVZx9EIuUtv1d456sAeY5gvyG3LoN?=
 =?us-ascii?Q?4GbrZ3aZ1DqmWsa7b5p95yXhFCP5jF+JXaTWUnBPYKWi8F2OAjFBVX+2SEAV?=
 =?us-ascii?Q?LhHrgNBy0evRTCdHZ0wqabzrAJo4PA4du82J+T+QBJUhuua9igjQQMnCt2+1?=
 =?us-ascii?Q?iK2hZ7yMHDCK8/DlDW8TUP4OCExmSPg80D7HjborwPUslZWfMA8QZT+iJBMZ?=
 =?us-ascii?Q?IzjVuZTQYr8IzL/99nNwgk14IrBL03c/NCMp/KjJCDjS0rIoLXA100K7kqPD?=
 =?us-ascii?Q?Xfj38q07JxPo6+1+zCbi8thMAry103KhgZvbEzz59doHR08wSGdrH8SSLdHu?=
 =?us-ascii?Q?bxN8LUe00V7rxG1oTCRaxwhLF8D862VBmTrUuI2k8J/x+xEqHIjASufphCP6?=
 =?us-ascii?Q?AwkM5OZ8wRWWlkimfWx3hjeuddGsp5pOTQCrkB5eaC8nxTBN/cn8GXLSVTK/?=
 =?us-ascii?Q?mtmaChCGooXU5NEdLLc58WhicDQ4HWulcr4UOtRudTf4QDLrIwfPowyU9Kf9?=
 =?us-ascii?Q?XX11PhYarzUuhJnnkRw3RPGWTaxywFP8IcBdMw2gDiMa9iGl1qBNAl0Zltyw?=
 =?us-ascii?Q?tjOpx/HqtIGSJI+F/pbyvIX6baqvBEg5alOIObPqRoeN8KM2NAGWOE6GlEsu?=
 =?us-ascii?Q?UykZDsImWs1e+eJwNCMNxAlyQ3z+oLTsldkIhpMize0Tckl4DLfk+UnieD5H?=
 =?us-ascii?Q?zfnezahBcmWn2Xg7XJl78EGwo6r+UGIRaNRsuVRxTTTRiKbjKWLOGByNYdUO?=
 =?us-ascii?Q?iaAdOr+GvgGcv3cBWfK+tNmR9DWd0ECEQJGxA0epqQyCbPV6WgNrybc6Dm6S?=
 =?us-ascii?Q?GuOQXGafPA1vhGSBNZHmLoILjWtxDsYkbIIbz5ZK2OvqpfbpCrMa4I2PwIpn?=
 =?us-ascii?Q?nxE4r5VePa8Nhib61bXd8s+mxCkf38HTaIsoUcvO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2e99fd-6130-45cc-1662-08db8c6a87a5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:17.7136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3k5d8oN+BlABMqq/bSbCMnw37Hw/aJWIG7k/EFWMOEfxXNJrh17tftd99x7LNbma
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

These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
allows them to support that mode.

The prior work to require default_domains makes this safe because every
one of these drivers is either compilation incompatible with dma-iommu.c,
or already establishing a default_domain. In both cases alloc_domain()
will never be called with IOMMU_DOMAIN_DMA for these drivers so it is safe
to drop the test.

Removing these tests clarifies that the domain allocation path is only
about the functionality of a paging domain and has nothing to do with
policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.

Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/msm_iommu.c    | 7 ++-----
 drivers/iommu/mtk_iommu_v1.c | 7 ++-----
 drivers/iommu/omap-iommu.c   | 7 ++-----
 drivers/iommu/s390-iommu.c   | 7 ++-----
 4 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 26ed81cfeee897..a163cee0b7242d 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -302,13 +302,10 @@ static void __program_context(void __iomem *base, int ctx,
 	SET_M(base, ctx, 1);
 }
 
-static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *msm_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct msm_priv *priv;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		goto fail_nomem;
@@ -691,7 +688,7 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 
 static struct iommu_ops msm_iommu_ops = {
 	.identity_domain = &msm_iommu_identity_domain,
-	.domain_alloc = msm_iommu_domain_alloc,
+	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 7c0c1d50df5f75..67e044c1a7d93b 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -270,13 +270,10 @@ static int mtk_iommu_v1_domain_finalise(struct mtk_iommu_v1_data *data)
 	return 0;
 }
 
-static struct iommu_domain *mtk_iommu_v1_domain_alloc(unsigned type)
+static struct iommu_domain *mtk_iommu_v1_domain_alloc_paging(struct device *dev)
 {
 	struct mtk_iommu_v1_domain *dom;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -585,7 +582,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
 
 static const struct iommu_ops mtk_iommu_v1_ops = {
 	.identity_domain = &mtk_iommu_v1_identity_domain,
-	.domain_alloc	= mtk_iommu_v1_domain_alloc,
+	.domain_alloc_paging = mtk_iommu_v1_domain_alloc_paging,
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 34340ef15241bc..fcf99bd195b32e 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1580,13 +1580,10 @@ static struct iommu_domain omap_iommu_identity_domain = {
 	.ops = &omap_iommu_identity_ops,
 };
 
-static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *omap_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct omap_iommu_domain *omap_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	omap_domain = kzalloc(sizeof(*omap_domain), GFP_KERNEL);
 	if (!omap_domain)
 		return NULL;
@@ -1748,7 +1745,7 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 
 static const struct iommu_ops omap_iommu_ops = {
 	.identity_domain = &omap_iommu_identity_domain,
-	.domain_alloc	= omap_iommu_domain_alloc,
+	.domain_alloc_paging = omap_iommu_domain_alloc_paging,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index f0c867c57a5b9b..5695ad71d60e24 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -39,13 +39,10 @@ static bool s390_iommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
-static struct iommu_domain *s390_domain_alloc(unsigned domain_type)
+static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
 {
 	struct s390_domain *s390_domain;
 
-	if (domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	s390_domain = kzalloc(sizeof(*s390_domain), GFP_KERNEL);
 	if (!s390_domain)
 		return NULL;
@@ -447,7 +444,7 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 static const struct iommu_ops s390_iommu_ops = {
 	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
-	.domain_alloc = s390_domain_alloc,
+	.domain_alloc_paging = s390_domain_alloc_paging,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-- 
2.41.0

