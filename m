Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6163176DCA8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:29:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VZsw5JYJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGV961PM0z3dwT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:29:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VZsw5JYJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThw2qKTz2ypt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kk8SP6tNr5zU60eqF8RxgoUsO6lUSVP0I/QMATqQ9OsAh4p0WulBZ0XpMmHIzkPw0xpFlQwD9s0NrrsNm8PqG+QuqHIcwsOVBPrTVxzwAXRHo6IZks7+JOvNkaj+/SyRGB5JP3r+lNq0JTE9NcJq74bCHKkJEGH9EZYlMSdvzytqzbbBlwqyGPFZldrsV2lWaO1/Jg7ymyKlUJY+5aV25TyoioVWb9mG1F43u1u51su+Pf7cKe55FP7MWdhyh0QyVaJLQEv+WMN1u7Ea5RZcnX8MpDHwr2eAmTd+9MhJbrZ2okXeo6DUByyGvh405VydoMVPNSCRwWh8/nZDuqQM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK2gs2gxwmqDvnsbxx19mnnuEldKr5sxQDHk/fU2WJA=;
 b=VfljL0xhCThB2QEZW/2YRKPpQriBqhkspc+wZurxGRgMtOw20FPBg1o+sm4kf9egXLnfPyKQg/E+lMbVk/JJbQ1t8WCO8a385ao249f/BjG3JKjnOaIWHmKpIruJlMKk/C7c+ov3ApUM4h3SUZzQ/ucqDTY65k25snkUw7Uln5YJM4i7tEuIBkMvRMjQYq1UjU9I5No9AtxjNZchrRxXP+5JxNyafm6CKoA2AbnD5N+cxJWMPROjd+vQaHKnePLrbmcWkExPsaAtbAOIWLIUMJxOr48Zm+AQkZM8sdfpC2Lnt2XAFBxAo2Ikcvv25zqKwicqreYplcf5mKNzX893RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK2gs2gxwmqDvnsbxx19mnnuEldKr5sxQDHk/fU2WJA=;
 b=VZsw5JYJ3HnWVulTrFcv3fN1tIt3xCrvXpHgruk6bcJBh3zlnK7RtHFi1A+XbaLvrLMD7RwCdw0t0Gw4pXIRjTJjJLAOdbvCge9DyuYvaQt2HO1UJXWFXIkCi1uZ0MGGbKcqtIgbIbjAx3sOPSK6mRxB2SUjVLOoOryqtYSGGzfR6GVGnUFMgNls5jDO45nHY+kdfsCGMmZ3ll8wUnOwuyKvaQ9MoTgWsAwLCecaJrku9YCa35qm2RPfK7bFt2eRRdWLtoNnPLhalkth7LgSbmp7Wp6HNjib+lvMXrbmENYEajTs4T9fpnixPSbcuNNDRn8T3+XGX0ErfhzOKYEcMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 00:08:26 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:26 +0000
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
Subject: [PATCH v6 01/25] iommu: Add iommu_ops->identity_domain
Date: Wed,  2 Aug 2023 21:07:48 -0300
Message-ID: <1-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0298.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 520d6bf9-61ad-48fe-93fe-08db93b5bd2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	50AH99N8k4Rrkac2FbeENv/aCQrL/1LcJ3/IYs17avlJlprnhvq5AdhDgYM4Yld0jQx9km8Kanuy1p9v3ksDOsz6f26c5KqAdFtwMMlKGqW4Gg5kosgKwM6/7OhsEDQGTkGq0G2jb8mUwEsZ3tb1YEEe6AZVtPY6UFA2KKgX4pIrA0O4QsF7cUfuM7Lq6vfqFUFUAMQys1fenftYp//+GN82M+VfI+MFIbrR/8ggCFhhuVleO8kYwKSmIvCTyJP2oePIJhGkBZt0Uml5hem+BrC2UZBFMWwidxr7iF2GLCBEdW2Ii+/vfo+6bnNQV1YMInQhqGhEir0oArlGGrZjeMBq/KbGj/SxWcTAbcvDR/odB/ebGz3mM8pyVgVEy/S/jOZXmDFcQedN2Qc/EXLsJJUVRkHw/IJ04ql5iFT4vo2kT8af2wH+F1Jmtp7erj7D/BtumOqYT/xTYRCBtOOJjozissybnCdqiH+0qkaSMNdEbBg92F9OoYOzLn419Dij2IFJBtIWQ1+7td0lk/7wrDPGrXWZpOBBRkHE5k37YL0o07mGHAuecxBIZDJWlfSbNLdtG7EclAhHOHMOCSTlakAGd7V9yKRbKvh8eJYsAhXvsB9xsZ1Dwljl+k0RvzoUqTVlVsC+4pDH67nI952dABJrqEntcgwrZQEeocyaMbA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(7416002)(36756003)(86362001)(7406005)(54906003)(478600001)(110136005)(38100700002)(921005)(83380400001)(186003)(2616005)(6506007)(107886003)(26005)(41300700001)(8676002)(8936002)(6512007)(6666004)(6486002)(316002)(66476007)(66556008)(5660300002)(4326008)(2906002)(66946007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?XJFfjpCNpVqIlKzHuB5TnDeP6rO8DuvFGcPSoacvzFPofsNGaVO1xpqJViSW?=
 =?us-ascii?Q?3G0j089MgwJAEU9sMaUWAB01xkCCTaPsuMyG4+CyMNvAMrH0dXC69AL9Q9rj?=
 =?us-ascii?Q?FcioYMd+TKTepFWAwYgkol/DZ9ynSyEzVgo8YG/LBQYo909QmV4tc40w9AwC?=
 =?us-ascii?Q?eJFktc0TjF9WvFODIfsIS0WZUL7HD8PpT3pHzIGLDwb68/AcQ4ARU9asEV9M?=
 =?us-ascii?Q?V/VRUl+GU7oYgGxLhWInKpSLE+EGVfJ1C2nqmhJUDxsbPZWvD+cpatBXAPkX?=
 =?us-ascii?Q?J3CUoA4r0DiLmeEkV9zMqw8X6XJ3MJ4m6XPOcBRad3UapxrgDu6Msj1a5pvk?=
 =?us-ascii?Q?5dymfqV1RxZQ9x9S8AsIPbBCNpEHSkMwv3BCUfXwIaTNubbbm2PrM1/F1NPc?=
 =?us-ascii?Q?uoi/jhW9BrL4q6kGPGi4BbeaAjxz4BHp9tsowN8pUyrA54bi1UGuZLl9VIu6?=
 =?us-ascii?Q?lasc8F2M8RryUTeiX5scMFPZo3rqh9hT8HFsIXpPRtNHbm0NpuwkjcjWTyBe?=
 =?us-ascii?Q?Kh6/YWMXMBQXU8yChzyIbB6Uk5ywqhtG2XUDzAT/ekRCYzyNeJdcf7FYXDYC?=
 =?us-ascii?Q?b4dbhvU7VmA9Mhh2ydJLNravrZ5zLWA67Dnt+tjeaOLcisE5ZA2kKR2GQFPG?=
 =?us-ascii?Q?53fWaaClrjn+nFd2QIp/mwlc1YKllRDS/QLWXkI4LsZx0ij20Qf8+Y1TriD5?=
 =?us-ascii?Q?7h2B7LHdsAPcA0U1hDJpPcZXG7afYVs8pgMzrbzsg5f1YL/w5kA7zKeHsE+5?=
 =?us-ascii?Q?JWE+/y4QWyshd+DJJ99CxGjgBIcw76zwCU4qXTYk+AeqFLLkyz+xNtzaXg4+?=
 =?us-ascii?Q?o1xYRSGBpiCmReyiRLbJPtyvxUL3sQMfHMVSBxLYtcSl2TbrEa2UlcDSBPgE?=
 =?us-ascii?Q?cNAqQzvI5pk4tjcedApc3Fxv/Aosc2N8/S0Owd+Wuc8P/PGDsu2mWhiIAL2Z?=
 =?us-ascii?Q?t7WEq4eshhE9h7OSHuxeVJCDasMuwqPW9SMxDsAfQBf900Xd5hQbMQ9bett1?=
 =?us-ascii?Q?0sf3LminiH4Ti5xvl98XUHtfgwRzhfGFW/Jdoao83KRkcqvdgOPsfQRmrfzL?=
 =?us-ascii?Q?7MF5yh4KEouSRH5dKJTIsLYBKUQ0ToaV3LrJIO2bsYbMqTy8m4SjhDSvs2Tc?=
 =?us-ascii?Q?ArSwlC4g20RjmRrjpvvXyMWxqMXTJScEM2GjY31I9gYr73fHLsLxFf9aKDY6?=
 =?us-ascii?Q?q6p8WLgs/il2Ksz71ge0ebH1b+6h9OL+9T7Kl+9f32tIKjnRoTFQCDDoyNJo?=
 =?us-ascii?Q?6fqM3T7nMWNyqCenbWeK7wtTUxFhfRHR87GDTnHG3EswmNUY5xDoLaXkDay6?=
 =?us-ascii?Q?JJVOmD28ksELK6cbojE9ydZweZzStpKpsHIs5Aszvk6mnMBeXoO8pAbcn/eM?=
 =?us-ascii?Q?Sdj00AB5jv4b3D05l991HySZzdBVBbwZJUiD/zcwhdqEWNidKQ5ypkJ1lw2/?=
 =?us-ascii?Q?O8GqIsyWFrv39U6+uQW7tBLzQaeqWaeHGCsGkJeX0/CpJXJumC88DkOd768K?=
 =?us-ascii?Q?fvrFuDPGIrceIjPUF7PW2U3zO7NqkMvRD8nmnJrMf5AtURJG7lgVju/LYP8u?=
 =?us-ascii?Q?JA/5ofPbmngF4O+k208m+t+86zDigrAwpFtM0f7H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520d6bf9-61ad-48fe-93fe-08db93b5bd2f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:17.8458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8PSJwqD7u+esauLafi6xRtVQuhXwv6yJQ3oZdFHDJtWnXSHmNFb8UFgzgGaDjnk
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
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
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

