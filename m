Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F7079EA1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:53:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XlKo436g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm23R2Zw5z3fL1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:53:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XlKo436g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::606; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s52Bg3z3c09
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5FkRVGg4sU04yxvDWiHEuENyBoG1N+7D353sVQf1sZU5J+fJSxFkADVPTsKs/SO7/zcOU59RBH2Prqup5tE+cHCPThwEREkyla8YivY1IjmZXxermMiPTavcmSs7WOp1iHUXzkn/4Bnxr/qBgVF2+rGsoXd5Ewrfpsr8ZauVX255GPlAX3vu5k7FzzjxPHZKIHlsTjdsAHxgtu1Jy0fvecKNJQdpRbdO+5DgxXm9JjLAqSUSqkepl1yG6ax3/OTL90jeV43lgas9FgjXQAetjFYQ5oyjz9AS0uesPLMqCqb0QU8Tb36CINa+nfd0bfvMJW3oMNE75VR9VvGbIGwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP7ogtWJ/7GbE71MxHZ57UPC9Bg7OkMJW7YJCy/gSUc=;
 b=FwQzu3eo5IwjUiU2uQ7ZTnkp+cqp1WHV8Qwj7dJMoZ7e8nQ17jSEbCVCd4s0/pdJz+7Mdu1nVkWQx+WnaGWjEFmzX9u9NMDMtewldrjmnNlnb7e/+zHRpQvTUdhzGvS5pGrAPQl7xE5WVAtNYnnVCQy1osJZ9WdCoRROvQhTnVC+/chxPSVyDpqkiQ/11WjizbjebODl1uG4PuUmOowVKdA7HuV3cS5HA7TNPKx1IQqrUT52XsjGw+A3KTq4X8meC39vJLCQGjAfjxDVOFMyPTarPEeowJCZQ8+DsDkN9tyg94Ww9wT98ITOJ3TumTCxDiX+E+NvojMpfEDwrgbAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP7ogtWJ/7GbE71MxHZ57UPC9Bg7OkMJW7YJCy/gSUc=;
 b=XlKo436gNxnp/aUNK8pKyS3l2QKGGayWcjHp7SadaW6jQUoerzNADmbeRk4hzHb04t4mn/E35PeYsYMXmlS7X6EjuH9cepR2tmmHGGjhQ0B+s9fWS7S9RIhEtCxv9u+wHwibaFfMnMzsibiHdtuPZXDrED0isxyNEklbB+6F0giT0Ar9/BOqU6gAtDARLMiZ0uOXZSZr/JzeBqDGoPXs64Q0D8u/Qp9VqWiEkPgzUF9DerhYl6AeQxPHLNkS9qarVbPXr5T7NjZS8Ypu+B5hsnFfc7g3TMkK15XZfLcfre5hXgSaBTYflK/Gxr+O503ALviSm/LOxblcg4SYkgpU0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Wed, 13 Sep
 2023 13:44:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:01 +0000
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
Subject: [PATCH v8 04/24] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
Date: Wed, 13 Sep 2023 10:43:37 -0300
Message-ID: <4-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:208:e8::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: f42209b8-e2e4-4d9e-431e-08dbb45f7baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6V0PA+koJvXsd4mi7r9Twf8X+HhRmdmKWvBw0qJTasvWo4ipceWnHbrkUE+tux9bOMRU2bsqGYa4fA0Pb25v4Pz0mqDIg/GsJUq3JoaKOKfCnhH3aW36pghxF6iTnz/a0PfC0ahsSkRHeSHw5O/bOVIRggXtnvtm4aVzlzs1eGb6Y58MCWOxUO24AQguioNtauK+1GeVD4YbfvYw6MtKSxw/35L0YYaqMNsDdTZzxRwMRWA4qD5/y+8F94KDngOE10fynTl8aW9FKRSzSu27zcRniPWKApu1L59zUCnuiT2P9vgxh9I8gbQhy7T13xh7Wxm2FLenQY5a+HsmKnlpeR28Ow6oGjm9Zig59Z9KqihSfzs72T9m54lUqG7NHbkIZo2OCWtUWQGROLdVhxrMyAq5I9cPJriK+ZdaEN+rVRo5Obg8RlItYg41vOAEBpR0LJvBqATJXsckwKKt7iTMBXbKiSPGmkTQOhIcs7vLDA6MNEuS4l0h7g3ZIpx/cowTnUZJWXYWqt8fIPIGDrhuc6EfJsNb/83jADLgsX6Fp0UuYFazG8P3ma+j9Yu0ByBZcyb3Ed4ZKxzP8zgoSO7mVuwoBYhVG0KDSyRStYJ9L4TiuIiDhg/CkAfd+fsSEyJB
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(26005)(8936002)(8676002)(4326008)(6666004)(921005)(38100700002)(2616005)(107886003)(478600001)(5660300002)(66556008)(54906003)(66946007)(110136005)(41300700001)(6506007)(6486002)(6512007)(316002)(66476007)(83380400001)(7406005)(7416002)(2906002)(86362001)(36756003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4+aXTQw1zV/w75psH0pueu/Qjo3OGMnWWopMmbvZ0zyhI4OBBCpTMPxNjlmJ?=
 =?us-ascii?Q?EOUSVMv22P+ynrn+shJpfogdf5isksbiei4YXIse2TcZe1hRYGvocAvcgsKV?=
 =?us-ascii?Q?6gN7JSAlqTXUcZq/uHhs4oSj0eCXqPUcHH15cO+WtusNMBm1aVQivv23epkQ?=
 =?us-ascii?Q?ajnKE3f+g3CshOpHkxfLyZR6oyTcN5pdrFy9R6aLrS1sm23BRToC2t5PN4El?=
 =?us-ascii?Q?jCMB3IWzjeM3UvK7AkjhUUnU2AD0IrkhIQOaS9xhfVu1o+NgaR4NRf2UX89a?=
 =?us-ascii?Q?x8VZK982I1WdaCDWogQBMty8QM4d047igLYPK8l5NVXC6W+/LkZmJxTDVl5P?=
 =?us-ascii?Q?QD89PiFnQRYQ2n4JHRJBr5LpHZZCU/V94NGMz8glUfnDoRixRyCAcjuKR9tv?=
 =?us-ascii?Q?9BjecxlPtXjIK7cC0FdMi1Z2zukvt9cruglLjL3yhcu5n/rq1DTf7jDYq7ac?=
 =?us-ascii?Q?9hsCPotsI2+nRssUJb8UaW/DQMYJWq1/wJ+FBp3oq3FCEavh26YKmWPdCaMR?=
 =?us-ascii?Q?t8ebzJYe/uVXTyy9tewl/pHAe/k61wEO+feBVVcdqFu2AkoBylKeh+U80v0u?=
 =?us-ascii?Q?GFCTC1FmRBcqdOXfvnQishql1Ip9UYrB5wbXgLKZFLgZ9fpUiEwtwm5AeseT?=
 =?us-ascii?Q?vSiphy+9+nbEFRX7PerHsiLLvsvBxV8mAzBAlTkivDg70qT3T2uWcuS4fR2T?=
 =?us-ascii?Q?g2WEXNahBwUDWZ2pPpGG5r5dWAapr7oU8mQKF882xXJQ2fr2vxciIKjFJQwU?=
 =?us-ascii?Q?9PAJJylE/T8vb1yHku+5nuQT3s4hbBttGw4GgHwJsxz2l8APaG7d7hmQkJic?=
 =?us-ascii?Q?Ne5A4jI5oFB4PNzugDTiBFUMmclYj+m1NkeJl/TtzkBW3HdfMc0ccVUSuxd7?=
 =?us-ascii?Q?j2WFNxhb+q66jppDQaaO1ksJgrH38IYEb/r/k5NRumlN7FRNESia8Vg8WX+y?=
 =?us-ascii?Q?5njcYdoxc0HWkTBXe6OhoGSCmAWZhEpirvshQkyjVHE7dArWndFXoVeZdyZj?=
 =?us-ascii?Q?0eVN4zBujQWzKe0v1Cj7f7AtKhhQfSHmXxCVKNAwkmQzE/68JSih3o/QnpWm?=
 =?us-ascii?Q?ZYErOQsxD/dFCaRvFpNB/pFQepB8CicsUqKq//OQboh+lLY726VeQCBJg9hO?=
 =?us-ascii?Q?xjfuzMyQF0LGZ6lXMr2aB+0BZTmnouLTVhIZhiB00u+L9k5VqiOyKB2h/40c?=
 =?us-ascii?Q?qcyPMO3PWu9yGW8rgV44Wmq1XEja8+GgYxGUa8Yk1mCwCZdgfGy+xyFQ3KG2?=
 =?us-ascii?Q?k7Tv4EqOjz9UcpHNcjQMiJMqGTl6+CxLBO8cWpPFm8zr5aCiCtYgFfrzYWQJ?=
 =?us-ascii?Q?12SdbKDtskHfovEYoPvpnDTQtuFbVbWmGhLNAfIn/Ue9WctOd7jidu6Y3Jp9?=
 =?us-ascii?Q?fPG7zRyJq2qjn2Hs/5nXHYpduQKxV0p5xO4DONUVxu1Gaej0iuotepLlw2Ju?=
 =?us-ascii?Q?E0kclT/ezKnXs7dZ7SfUzg97B7FeypQa+p34ADXn//uu4UgmtWN+sgNm/mpc?=
 =?us-ascii?Q?h5u7XM3GUvY7uGxgz/z5Si3ZQP/qghNOZJjDeJU5EDXyirttkBYDL3FsS8/V?=
 =?us-ascii?Q?6O06geG1SArx1gcas0R4a2SZQNk+QN99kU+cHdQe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42209b8-e2e4-4d9e-431e-08dbb45f7baa
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:43:59.4886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5ZtYk5hdaCMKgz2zYBXpHpOWdZhKrA3XlG9noLFnTpBGjPa8yu1Z/tiwFybRBni
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

The PLATFORM domain will be set as the default domain and attached as
normal during probe. The driver will ignore the initial attach from a NULL
domain to the PLATFORM domain.

After this, the PLATFORM domain's attach_dev will be called whenever we
detach from an UNMANAGED domain (eg for VFIO). This is the same time the
original design would have called op->detach_dev().

This is temporary until the S390 dma-iommu.c conversion is merged.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/s390-iommu.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index fbf59a8db29b11..f0c867c57a5b9b 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -142,14 +142,31 @@ static int s390_iommu_attach_device(struct iommu_domain *domain,
 	return 0;
 }
 
-static void s390_iommu_set_platform_dma(struct device *dev)
+/*
+ * Switch control over the IOMMU to S390's internal dma_api ops
+ */
+static int s390_iommu_platform_attach(struct iommu_domain *platform_domain,
+				      struct device *dev)
 {
 	struct zpci_dev *zdev = to_zpci_dev(dev);
 
+	if (!zdev->s390_domain)
+		return 0;
+
 	__s390_iommu_detach_device(zdev);
 	zpci_dma_init_device(zdev);
+	return 0;
 }
 
+static struct iommu_domain_ops s390_iommu_platform_ops = {
+	.attach_dev = s390_iommu_platform_attach,
+};
+
+static struct iommu_domain s390_iommu_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &s390_iommu_platform_ops,
+};
+
 static void s390_iommu_get_resv_regions(struct device *dev,
 					struct list_head *list)
 {
@@ -428,12 +445,12 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 }
 
 static const struct iommu_ops s390_iommu_ops = {
+	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
 	.domain_alloc = s390_domain_alloc,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = s390_iommu_set_platform_dma,
 	.pgsize_bitmap = SZ_4K,
 	.get_resv_regions = s390_iommu_get_resv_regions,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.42.0

