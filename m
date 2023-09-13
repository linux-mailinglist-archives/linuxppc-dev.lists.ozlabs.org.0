Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0CC79EA45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:59:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P3oGU/1B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm2Bb6bBcz3gk3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:59:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P3oGU/1B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::614; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1sG45qrz3cD7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cie2jHAsYO0Vn74UzYWfmS5R4IKtvxrbY3jMeTmeoTpMXhMw+8wX36TmuWj3uM7qqJ6zoUoVpBFQpE+FukKpkjJs0VuVfmu6JLUPN5niWd49TC3H3plUqumiQMCd3/oXNus/crU5zHPi9y8Ynn7MMvsZQW9sN36KlI6GmRrT23mq4JaO77VzsjjDr4ra6/KXKGqfDw6yB4lL8ly1aUDhOI0KgLIeKriovi+iVEVZj7Ffz3bl7Q0urOShtGYDfUIOMrvM+ZnR/OFgDjPB2zhRfQrD0njQzRD7qlEwozuf+eRkI1Y03fGkkb/wA+inW+sJUjx3HfrUiTmVtI1eT0lPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hi/n7kfwxCeDVcR4nvyHJvufDlrVv3o8pPpyBD24vMA=;
 b=nK9HUpBfSaaUmTpxLBWAv9T6FFy6NOqeOFidmvUvj4EHnA3idw8GXJ9W3vIb1PjqgheudTxPcTZIMDAn6Hlx3b4YUNTHVbFFfaGOLzsjUa1AdFqhThRprtaqnHE24SEO40IlRSiDpozpMjn62P6luS5e+aEf4ep60fCLKomK1O5aQPnUmByLCQx9b2kkejtZr/0C7hdJPd7H+x5nfnWeIYbYY2Be7beUzwflCv2sWpYxII+dKCqIjo/L5omVymy8c2xm4zjCFCkb6fmewCfAzChA9kDDYrWG7VrpDgort+zhyUlvDat3v+faFibkC6+t2qR2o4uEn1QKYbMXV+rNxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hi/n7kfwxCeDVcR4nvyHJvufDlrVv3o8pPpyBD24vMA=;
 b=P3oGU/1BDFYbK1atsg1gw+LZ1MW95BezBaeB5uC9YGJO+iQO29xUOzN7e1RauO3rePCz1kDt9TSiqfSJ1Hp7nKz8Y0FXfQVgrNEVJaHHDWqRsG0cEPbMJE3vCx/KH8ofMznJhm1YLb/RiG3p2+vF6XrJIsiIDb76ZXXP2r7/+cv1eXHgj0Fu/HXgBGfSoJziVuK0ctOsgUoB6z+VxMke+kl6HHfcVwOg9GWQ7So2JH2OLk6QX8iVELCUX8VMToq4YtgIjpCwiJsIv3GXxodC2wjHZ2e8opZZaQwLZgcwrm98VFfJdhNHqMVu2u1pid+7vPcrJKdBPfXdQo/BxytUJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:44:10 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:10 +0000
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
Subject: [PATCH v8 15/24] iommu: Remove ops->set_platform_dma_ops()
Date: Wed, 13 Sep 2023 10:43:48 -0300
Message-ID: <15-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:208:23a::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6a9106-6505-44db-e034-08dbb45f822e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Mio1XDWEusljrIApy/YF1ZM/9yUUs14bFelluHEJDWdZjm+NNsSHRQ0p/inBQ9NJ50BQTr46tA/wbuqoVOASJenFI37eHkWMgtLG6ZXHpB+49f96v4Yn/vp1f0Yudi1lJPKg4t/CqfUEuvg0sM5Xbfoho9EzCRYc7bcXtwRG8qqsEj0SxtiSaCCEUInHdbbeHXELgmdCkTEJp7dkmNI88wupByNuLf3fnyqDoO3C1kP/jUe2r6wbZ+oBibcNOhY8WgtKth9QmHaWmm/lJk6QrLq/4ErUUGBY/IggjnqGj4dl1SpCyszxEfSDA9uZiJPmt8f2pCKPMAvbPGQNUF0vx+64HlOEq2cjY1FFlMN5NOkWi3ZX/ufsI4J22xtt1lF3YDj+G+/JZShlgywxXtaJIZDXG+9i2Hp42qXUcRzQthFu03ZIHSXfmO9+1zjGc3xjBC2MJxceD/xPBjUKzNQ6x9kGivOyHOLTcgr83nZ5ZNvb7G9xq9DuSqZdsz8bLo5EHwsTf5C7i75sBMSzDVL14Wh3Z5Smsmbsk7X2tUYohUp3DSYWMQj1g3vYnv5xZMNQ7kWyv3PKtZfKO97ehpabSCKnr2Kh8EOow3YIVE4RIeU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(86362001)(6512007)(921005)(66946007)(110136005)(2616005)(478600001)(107886003)(6666004)(38100700002)(6506007)(6486002)(26005)(316002)(4326008)(54906003)(66476007)(8936002)(66556008)(41300700001)(36756003)(8676002)(5660300002)(2906002)(7406005)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?zmEL3GDB+7arUQbTbA+R+kyuBjIbeoJHPOnZV4LJNes5f8MOi9IF4mgBJDCo?=
 =?us-ascii?Q?Omx1URlOziaHsLfhoPHC1jxeWQKtqe4iQr2PUGeqnw/oXSPegeOyObDwW9BJ?=
 =?us-ascii?Q?xvkaKD4B4LD5ydcaQrScm1WPRPTq+mS6qM4bNhD1dT3Pk3tx0Sw5eeuPCq5F?=
 =?us-ascii?Q?+VazizMOFeqjEjfeFGaDJZYE1UGEexHjDQVvKD4/uFxtblMQJJbZrueAUOaC?=
 =?us-ascii?Q?UiBEn4W2t1CcL/WRVWQJ7jiJOamWrOm+XBPACoDKaWIOplcQCWQ7qaV+hVZ2?=
 =?us-ascii?Q?6kyiLQjiec9D1BaVGGM0TnVffOY5X0BL9DOpae4cT+pnUzjoMwnYo7iMzlDV?=
 =?us-ascii?Q?RQ5hF5aVv7qUv9IucH59mNspNk2Wf9lMWFTlwF0uUW4N2nT/YEeLsPNkbPv/?=
 =?us-ascii?Q?Nz3s0GVs4MDhp9zrrVlS/eV/rvwlfKndXT4VoaxsKfzOyT2fXP35jagqSvEw?=
 =?us-ascii?Q?7rfPVY9wUIXqnAfvxA2JDfoBDn+hI4vLLJ2MPGZamfMLgQcc6PinR12Zd+i2?=
 =?us-ascii?Q?QzUiVXtM1ABfm9WUXoKfZ2oE6chn5SY+DoZTbowgiHdjE/iHO9KU3j3dlq3I?=
 =?us-ascii?Q?3rqmejmiO5HW8xg48vN29cRJewAtOpFfYxv6WeG4F3SAjAR3TjMOJMXKqOB5?=
 =?us-ascii?Q?XMmCdAiEWrsTwCDklV4IJ6NWf3UCC8ns8JmSa54GqOQ9q+7ymvTXm13tfHQa?=
 =?us-ascii?Q?zWHNgOsnSZ8RwTn+fxKUKSDlhORpItiitqeGfIhAyOtxXqDKpJiA8q+ePzRG?=
 =?us-ascii?Q?2/HzHwTXEuG5IiZBTXCa3Vv0oEmHKA0VLx22ErBHsUTPJuKPogRKiqO1T4B7?=
 =?us-ascii?Q?mzrbA68Xk/zkD/21Nw/7RvOze7QnNLrU7kkT6RwCBlB3MqH7v7FbpGZiFXgq?=
 =?us-ascii?Q?Jq3goEqrezCMHBkUC8JKl+WeNVoudm/UsKl9E8ZYzrjudej1GNik8JOYd3tN?=
 =?us-ascii?Q?wczhWBPVQCu19JXa4SWIfjWkc0NG//B7biqEWzTXs0SbMn1e1Idy0WfoAHcY?=
 =?us-ascii?Q?oSmAGvr9ASyrlINEYz10yi6MVUBae2PwfqodvQaB5XVanqWddBXcXFxZySHV?=
 =?us-ascii?Q?YBfm/eoFEHAGOIzWEGElC65W/QXwIevF1x6+SiqKSxwTMz1Fq5NPHfBpcbbH?=
 =?us-ascii?Q?aO3yj1ZxT/jP930/dE67Nhn8upvIckBeL4bdcOmzMQ+y3THC90c2Y+XWNgU9?=
 =?us-ascii?Q?OKEdfq8F3a1kq4Q/c4oN5i7ktxYsD5lMu0mat/lE7x+vtFA1Dgg3/X0dM8Ao?=
 =?us-ascii?Q?fwWGjzQcLQ+lF+SeR971XUw/4gW5oRNqaGrJUufSH9U8IEwjZL8RCbDpgYSs?=
 =?us-ascii?Q?+FGHQz5kkQsqW3CcC0tBWfL8TXqxJCvPSMgDfXN2Tv1w25ucIDQgZdlyg/mL?=
 =?us-ascii?Q?m/orrG3t/Mr4DSe4Rmsin3vXCvfkiPxD5JmfLDKEbslJIm1M06wUBF2vhECT?=
 =?us-ascii?Q?S4+Uq3vCS66AHBtsS6ITLhbfF8oFFjgDhNUzMDVTB+H5TZmVEBCFJmKR3dx8?=
 =?us-ascii?Q?524grLX/zYTN9mMYg5W2BFYBPUw9Dt1Ya2u9e+bjhXdn1PjJfVjHf+T6lcRr?=
 =?us-ascii?Q?pf/gEpe86qERECJjjM6DicT5Htpljx6lc4AcuwWb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6a9106-6505-44db-e034-08dbb45f822e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:10.5003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTPtZvcfrS7QjrKTnwZysvBOtM+m/FqRYb4N92Gpwwu2/kWti4y2TS2Vi6lJdcBf
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

All drivers are now using IDENTITY or PLATFORM domains for what this did,
we can remove it now. It is no longer possible to attach to a NULL domain.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 30 +++++-------------------------
 include/linux/iommu.h |  4 ----
 2 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 1efd6351bbc2da..42a4585dd76da6 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2351,21 +2351,8 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 	if (group->domain == new_domain)
 		return 0;
 
-	/*
-	 * New drivers should support default domains, so set_platform_dma()
-	 * op will never be called. Otherwise the NULL domain represents some
-	 * platform specific behavior.
-	 */
-	if (!new_domain) {
-		for_each_group_device(group, gdev) {
-			const struct iommu_ops *ops = dev_iommu_ops(gdev->dev);
-
-			if (!WARN_ON(!ops->set_platform_dma_ops))
-				ops->set_platform_dma_ops(gdev->dev);
-		}
-		group->domain = NULL;
-		return 0;
-	}
+	if (WARN_ON(!new_domain))
+		return -EINVAL;
 
 	/*
 	 * Changing the domain is done by calling attach_dev() on the new
@@ -2401,19 +2388,15 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 	 */
 	last_gdev = gdev;
 	for_each_group_device(group, gdev) {
-		const struct iommu_ops *ops = dev_iommu_ops(gdev->dev);
-
 		/*
-		 * If set_platform_dma_ops is not present a NULL domain can
-		 * happen only for first probe, in which case we leave
-		 * group->domain as NULL and let release clean everything up.
+		 * A NULL domain can happen only for first probe, in which case
+		 * we leave group->domain as NULL and let release clean
+		 * everything up.
 		 */
 		if (group->domain)
 			WARN_ON(__iommu_device_set_domain(
 				group, gdev->dev, group->domain,
 				IOMMU_SET_DOMAIN_MUST_SUCCEED));
-		else if (ops->set_platform_dma_ops)
-			ops->set_platform_dma_ops(gdev->dev);
 		if (gdev == last_gdev)
 			break;
 	}
@@ -3036,9 +3019,6 @@ static int iommu_setup_default_domain(struct iommu_group *group,
 	/*
 	 * There are still some drivers which don't support default domains, so
 	 * we ignore the failure and leave group->default_domain NULL.
-	 *
-	 * We assume that the iommu driver starts up the device in
-	 * 'set_platform_dma_ops' mode if it does not support default domains.
 	 */
 	dom = iommu_group_alloc_default_domain(group, req_type);
 	if (!dom) {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index a05480be05fd08..511dfeea527215 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -243,9 +243,6 @@ struct iommu_iotlb_gather {
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
  *                  group and attached to the groups domain
- * @set_platform_dma_ops: Returning control back to the platform DMA ops. This op
- *                        is to support old IOMMU drivers, new drivers should use
- *                        default domains, and the common IOMMU DMA ops.
  * @device_group: find iommu group for a particular device
  * @get_resv_regions: Request list of reserved regions for a device
  * @of_xlate: add OF master IDs to iommu grouping
@@ -280,7 +277,6 @@ struct iommu_ops {
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
 	void (*probe_finalize)(struct device *dev);
-	void (*set_platform_dma_ops)(struct device *dev);
 	struct iommu_group *(*device_group)(struct device *dev);
 
 	/* Request/Free a list of reserved regions for a device */
-- 
2.42.0

