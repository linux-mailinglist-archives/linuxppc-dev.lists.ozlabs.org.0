Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B549579EA13
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:51:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R1IW0OA3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm21Y4Lvwz3dXW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:51:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R1IW0OA3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::620; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s50pC7z3byH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGyDzOo8afE6eVyuUuEZNUZDuk6LQGkv5loo2/up7xg29Mp9rpQEfMzcpMUvaQSyIucN9A6GQ7l0MSPA1Ab5URPG+xIRA1bXhu6p25y+qmj+R7Tbn3rwlMX9L6dtkD0hGCsCXuf+dR8SAwH2YxK+BCq3SU+MsjP8tyFED/edL3ZGyAw1nLX1PXx3JXwUQ9wX6ICtQvBhyABdl3vhKlkDTmFUbIyrqailyHdzmVlfR6Sl9cx1sR36f7OpGLDzf06/7Ep9T986l5y2Buro3EBr5Sak9a8594+eHqJblzUY6qkA450LwuxfBTzt4sDMebja2FLcULbFHqpBHMPVAMq5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kufSAqD9BJNrg8fa/bEo/F3L0mckILs91GIQXkFYM0=;
 b=MpjY5bwGTNKAvPCPZvWbuNme7ELoduGFMCI4rrgSIXfiYeevtFWxf+tSoXgvwc1dfyf+t8Fv+8m12oEgH3BgnFIbqYWXi3lWisA4/QUbe0HJ7DxyMBByvch+o3LyICozw+vBWnC3KHEWU2lVGJO0Kjc6LF5HIKvxZTn0U3vlTcgrDMn6omGn4XhGERvimYde1jiu3F25sim2CfnJhsUhdOype5MnNHBhfy6czWIdzhjqCIopf96vvhiOzRLIRXHNfhSgR/y/BH6xonZI9TQUsCxoymqSMnte78oOjrnYNYkKPQqmdFitvVFuzGxEMkBbKthtcOeAwGRdcpvDcJ1ZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kufSAqD9BJNrg8fa/bEo/F3L0mckILs91GIQXkFYM0=;
 b=R1IW0OA3RNmGnz7zZxMbuArdJY/sdOsRem8bxcCjfgtnXndJt59hz9wfkwqIO4AwI3AMI18waUI/75LFCvowI/ljjfa1LkrscaH4jI1ZD0NEEpZEJJLbIgyWwtyUlmlimqqW24wROKULutWU5HmRRptuF/8N244DoZZCPKwp9GvFuEuQV169AsupA0yGwTzMpRPsnynAHs9yYdG2GWHrDWLQX2D1B4tVJvcyXoP1c63WuSvnkEy2DWJAX9DFl8yLHFBGh0l02Aus3nKEi9qioTM6ux3qc0LaiQErZEMpZaoIp9/K7im+D+2BUPcx7ZBJu/NVIBL3oKJyeT2BYr8Dug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA3PR12MB7923.namprd12.prod.outlook.com (2603:10b6:806:317::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 13 Sep
 2023 13:44:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:03 +0000
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
Subject: [PATCH v8 01/24] iommu: Add iommu_ops->identity_domain
Date: Wed, 13 Sep 2023 10:43:34 -0300
Message-ID: <1-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0376.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA3PR12MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf3734c-2e1b-48b1-4c19-08dbb45f7c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DBu7yR631yRjf6WhoniBL6f56Y7L6gkU6MVZkYsFQDb+S3ttxeY/N5d6JDeX3OXZ1oVYobTLJaAQi1yuLlt/ZiZ4nuTTkVz68AUpX7lbOQcwUOAMNM1DNLMIuHIbufzchUGzvHBx3IZgM9d2O5V6g4yVFGPNFmoAvV/BtzzzmLDq15j1oVz9bUwRcPs65KH303LXARhvGOlINDQc058MpBbcY7rJ4qbgBts/KKBjlzfvSKERM/rUVWtYmABg+FNgbWixuAi3pb3hfJrJ/xaNoZ9Xdv90E0O5pOw2mX8935tVCDQQFhPztRfHTxgIywjhsV6vBiuSbu+vEsGE0xtG99Lq/7/Pmz36YfR8q4qSbGx10VDdUMlIMdLSYx/7OjZp4ijxtkcgaMsIR+Kqwk/VF9C7rs2giaCCRQ6w6maZrhNfxU1VF76WfCTc/afnuoHSzN2guOEDXw7w0ExeKNggUO12YsFl8O0LvLxpYIqtT7F11I5D831Zrlw+NkO2F/da+5YygMhIrsidYHifu+534HWaj/gnVyqLQNvdbq4WDPUg9zJfI2rsEcg6Eh2QM87yPiSl53WuORTS7RgThThT1a0go0cQw8aiugpRAzMcbykBBEpPSI3MXynEc1cBojoO
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(376002)(136003)(366004)(1800799009)(451199024)(186009)(478600001)(38100700002)(83380400001)(36756003)(6512007)(26005)(921005)(6486002)(6506007)(2616005)(6666004)(86362001)(107886003)(41300700001)(316002)(54906003)(66476007)(5660300002)(4326008)(8936002)(7416002)(7406005)(66946007)(110136005)(2906002)(8676002)(66556008)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ZucGJ6Ie2BTe8W8q3BHY19kr4uoSf6bKst15Nssi2ChhrBZ07D1vOtWDnOOO?=
 =?us-ascii?Q?Cjfm+AZ4mPmAvz8vbBZW+FtnbPujerL5T4eRyvT8+o63++OYfWlEy7GHZ3pq?=
 =?us-ascii?Q?UIX8e0iXw/ew5zFiYhNo9P/RYJz4gt37U2STERtctl5MgW37xePKjyVH1xdG?=
 =?us-ascii?Q?ckKC1Ly2u/RxoEyNxJLN4hsLeQSZ9p8E4pGhRxho4WoefUf9O7v8MbcUNuDu?=
 =?us-ascii?Q?bWWOzWRkRP7J++jkLdls6Vj36TI6IOD0w03pUPN6b56fBSE65uMsywCiBhtE?=
 =?us-ascii?Q?jDNShLq1vWtqx9ldnH5oRVq+Mx/ZXi5OaN/eoYMGmFumj9U8nMNyaxO799Vf?=
 =?us-ascii?Q?g2vm5Ypljyf8Ea2eAP5pRSRdRi59QkscNDOfnwSq6EBG9dREBXMbRZYzPCwH?=
 =?us-ascii?Q?/9YrOHeu2UpWQ9KprLx9WlXSYP9aMnwV0B21/NeEieHHqZOlHMP6bWf4/bek?=
 =?us-ascii?Q?G6yVdoWFfvaGILwivaBrbgc9y8vF9JpWpAB1mql70juhVNr7gK6FEgrUwore?=
 =?us-ascii?Q?TKABp85mRew38emr+7jt1hdvtfI1/dBSPJx3rHmIX35WDkSry1KELcWoM3Gs?=
 =?us-ascii?Q?hxXlTtvn1/xWll9KQ+oNQCgKAfnunrVWiILPNaNOttjFFL/ye1SueOGfbkiH?=
 =?us-ascii?Q?amQkSrCqUL0Z7x9mpEoKrH4CrA8OYkCZ6qmDtb8YRw4UwNBpjFHyWUthOZDZ?=
 =?us-ascii?Q?0JytrS77I1AqIr/zeQcYWbXJdOLHRn5Ta9nrw3KdqtKIq21LPJTSZjoCVYMr?=
 =?us-ascii?Q?aeNfUPjce1H228Vw/w4F/+/R4HGaU66k/VGG2ekrdwt2SzHqBycBQXudkkGz?=
 =?us-ascii?Q?saoM2/P6VJsQgxGJZPzwhlrWB9upF/8TNZSl9A2CbVelErghERujveTPaBO3?=
 =?us-ascii?Q?QpFA3T0QfIKhDaexjl1SfnA9On7svNT860KzNBLP89xZr1brEY61mT0vb/34?=
 =?us-ascii?Q?ecQu1DDP9iEJAMmV8FYnUOHbF3LYdcCmRfOR5mlY8T1stc9rKYhIDjZK6J9E?=
 =?us-ascii?Q?kHmi2vKajvtkpbfXoKw2Ci7fkZrgslfAheJicvyNsC2VxfIw555U9oh7xnH5?=
 =?us-ascii?Q?/F0jnEaqk/II84dpvO4/Hzy3iYRDgclC5CcFSxYbVBLJp+RhTfj4TF2gviSe?=
 =?us-ascii?Q?34/bl5yGWKGKbPRudOosG8FNyQIIMYETUU9S6PX91uNG4renRplUQsY8HxBY?=
 =?us-ascii?Q?heZp6h9m9m/158pfGa8m4q+MY91P4EHmczzfUVDA4vqE5FfQiHKwaIKfJTE7?=
 =?us-ascii?Q?9gfejp2ec9zRy/+pXVok+MagoCIanQ4fUz4mSNnA5+qlBROO/QfTF9HpfTZU?=
 =?us-ascii?Q?jre4cteNEiAjkPt9WWW7Mol+kXfngBfp0gcfpA6fMSm/FQFOJG9uN7E7VVOp?=
 =?us-ascii?Q?iP6dk43JQZ4CeWV+94NoYbh/+/Nn0Cya8Uy9mfDckWDGJ+Oby2qMnqKKF3Zp?=
 =?us-ascii?Q?0XIWCu+q+r8a+rsTCkTPTn25HkTnqvj716WqkMY2Pp57fA3RTdBSUSxpzigw?=
 =?us-ascii?Q?UqCGkItV8qXG2zIHDPbQ8gkhscNWTI7qoFrfhe1ZT5opZUhVrGteHCxHuaMJ?=
 =?us-ascii?Q?Ve0CS+KC/LU9kh7meUwcVcb2YLkREdtgX7M9f40O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf3734c-2e1b-48b1-4c19-08dbb45f7c1a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:00.3579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkJ6DogLUB2rXijv8MRWjUzV66GSzbhBbw1pr9ZWe+2N/VU20GDRGHRuqHiUKYzn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7923
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

This allows a driver to set a global static to an IDENTITY domain and
the core code will automatically use it whenever an IDENTITY domain
is requested.

By making it always available it means the IDENTITY can be used in error
handling paths to force the iommu driver into a known state. Devices
implementing global static identity domains should avoid failing their
attach_dev ops.

To make global static domains simpler allow drivers to omit their free
function and update the iommufd selftest.

Convert rockchip to use the new mechanism.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c            | 6 +++++-
 drivers/iommu/iommufd/selftest.c | 5 -----
 drivers/iommu/rockchip-iommu.c   | 9 +--------
 include/linux/iommu.h            | 3 +++
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3bfc56df4f781c..33bd1107090720 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1978,6 +1978,9 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	if (bus == NULL || bus->iommu_ops == NULL)
 		return NULL;
 
+	if (alloc_type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
+		return bus->iommu_ops->identity_domain;
+
 	domain = bus->iommu_ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
@@ -2011,7 +2014,8 @@ void iommu_domain_free(struct iommu_domain *domain)
 	if (domain->type == IOMMU_DOMAIN_SVA)
 		mmdrop(domain->mm);
 	iommu_put_dma_cookie(domain);
-	domain->ops->free(domain);
+	if (domain->ops->free)
+		domain->ops->free(domain);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_free);
 
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 56506d5753f15c..d48a202a7c3b81 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -111,10 +111,6 @@ struct selftest_obj {
 	};
 };
 
-static void mock_domain_blocking_free(struct iommu_domain *domain)
-{
-}
-
 static int mock_domain_nop_attach(struct iommu_domain *domain,
 				  struct device *dev)
 {
@@ -122,7 +118,6 @@ static int mock_domain_nop_attach(struct iommu_domain *domain,
 }
 
 static const struct iommu_domain_ops mock_blocking_ops = {
-	.free = mock_domain_blocking_free,
 	.attach_dev = mock_domain_nop_attach,
 };
 
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
index c50a769d569a60..d0920b2a9f1c0e 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -260,6 +260,8 @@ struct iommu_iotlb_gather {
  *                    will be blocked by the hardware.
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
+ * @identity_domain: An always available, always attachable identity
+ *                   translation.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -294,6 +296,7 @@ struct iommu_ops {
 	const struct iommu_domain_ops *default_domain_ops;
 	unsigned long pgsize_bitmap;
 	struct module *owner;
+	struct iommu_domain *identity_domain;
 };
 
 /**
-- 
2.42.0

