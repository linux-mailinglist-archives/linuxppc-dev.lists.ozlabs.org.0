Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 291A476DCA6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:27:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Zhz5pgVr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGV710NbKz3cVq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:27:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Zhz5pgVr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThv1KDMz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOpPibG6jHK6uaaUhFLjuz3i1EIUhIrzXLTld6UL70Op1ZQY3AyGBagLyU7bXHUlI3VwWjmCSKAEq5ZyYonJPJEPmqig5J5UtHD6EqeYA5zd4pOgKqFKS7GdcjZfXoEU4XY/tipsq82BrXoWNZfNEiqYsh9eodOGLy4AvwEsGerap4B7LLHHDJt8lBzlCOlkTeu39K1Skm2eRzrJ3wm8vPv5g1pgJQVj0Av2luCe01ySLvFv1qAt7KSiVcaCDBuMzKgJHbCh3ZhqkouPQZaacShfVXNTUCQvKpia9BnpyIKOsM3a4tBtNn2unjisqh06HLol2mzP/5UaaJOeOmtqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0slDXFYbJM//zyjPKYXqKC9rH+RXKJstRFeiCBm71E=;
 b=SDIFxY7fNv//SckNaYdDj2V91MpcUDz3LgQSw310nePWyZADnXD5+8UAKXlrQClxa9UkGw6N60rlXpbzK6sBYO9bTrboUJLggGGS3gFjNxa/hT00qsJiNny1M2j2HWikfUYRqYW3gAou9soxZHw7u0gtiDmdzWF+1wnwx7a+2b1XdqR5wSGOURhotzG4iALsLo2Xwwi7Lnq39B4Xapo9HQE2N/x0jIUBMqxzgISjcdUR6WnXt+0oeSpPIdnYQSJn4sdj24Ho0popRkxvU41g+aGrpRGa7de/SRPjCXaB1DoNJTOkIE8M1t9IBmrypwFxtA+IDO/QrAQRJzIbU4ixbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0slDXFYbJM//zyjPKYXqKC9rH+RXKJstRFeiCBm71E=;
 b=Zhz5pgVr25D2Qcsmu7vorP5Dr/2/cf1KbtgedaxhKRXPKEuzCyoWEpSEgWm+T0z9K0nrPaIHC5U4GhGFVTBk9TKf6qvs6EktdDvvrhJE6sObjx09mx1nLB5vasPF92qWrS7fq4IHbIORJB80it73DXMyn7dR4fQ10eITpwg+6U7M98kw5MzywpLLGg/B4VgdnfYMVDcIy4/v2wYCwe3cFE7Da7DyY1IawXJEz7YbNs9kT+zSBMkqoA3DaOpZ1Okm6VRxlwhLO0Ov+mRaKXM1/f3r8+Nd0tXn9e8xMBwC/c2pcaRiHRD4c6Y3CRZUlXV9OWNiEoGHAaB/tP/skoz1hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 00:08:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:25 +0000
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
Subject: [PATCH v6 13/25] iommu/omap: Implement an IDENTITY domain
Date: Wed,  2 Aug 2023 21:08:00 -0300
Message-ID: <13-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0038.namprd15.prod.outlook.com
 (2603:10b6:208:237::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c10c5de-d8ef-471e-28b8-08db93b5bcbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9xwzZP6XEdgGZN2wGCWXZ4982UgKxwasjQzF5OrsXmoOYDSpQNqNC4V+JHfQpUpHJDv4oIWTjqNIfj1jtCPqrtb2r8Mih7WmHuIDrO2H7zfGv40jK/ttD72UFJpgMJlktqVEDveAwJnHbygyifKhlEXad71ZULl63uuwPvoqrdytRcnkud5T2qpittx7Cz45cCpKk9ow/v5ZTqv8tO+H4U+7uNNO7uvPg8ciWHDx2qTjpyYCV+C++JKL9DfHXx8huQwm6vOu3MqDcaEeUDLDFA9ea9JcNNLRvFmw/8B/nQEk7LuxN+uXfb6iogbsfa6azYzKV7ezoUtW1pdxMsKzneKFTGmwMkCSQ9ojxvYaXu7ZCHXvV/B+2YalcltbtoCbroHa7l2aOSot4xCVFqQQ9+Gq64K5dSEEhDfn/FTq4R3M/AOtzph0Rb2mkumvWp52fCZCUIcpgfjP9Jc2VEfARo6Vcesp35GARB9tVyxBcrOSEnx0yzAYE0rOR6DLLflAzf1yFp0Zu2eY36H/Esjx96yjpyatPvyQx0qb/bfj/aCx9Z0mJ87IIuegrUjJo75kM121KL2gx8sDdx8gY48GJn+cNjQ4N9K8MU1kYYcZ5ToJJ0lHDPY+gKnMdyvrNdmJ9xoy9AKMP+vASE4eA99fbA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(7416002)(36756003)(86362001)(7406005)(54906003)(478600001)(110136005)(38100700002)(921005)(83380400001)(186003)(2616005)(6506007)(107886003)(26005)(41300700001)(8676002)(8936002)(6512007)(6666004)(6486002)(316002)(66476007)(66556008)(5660300002)(4326008)(2906002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Q5ZEuJ9CD7uye8c9BVPXG/fW/zrIUP9jjdZz5QJe85bLbmJ1BeRgO+hWw/WL?=
 =?us-ascii?Q?0bVW9OlVRfWSIUHTq0Ccq9uiSmqD6rumDdUy85lZ+zTKom0WjtFXbZ2pyP0u?=
 =?us-ascii?Q?ICT2zV8310i/feZLcnZ+C67+yDg6+sfTNqSeYq1MYa9DKSJXoH4sBSjo2mWx?=
 =?us-ascii?Q?DQxW6skEMI4JnsNpgU/FSziZEjr0dpr+wCCO7zxThCFeSgAgUK8f79sGOn5r?=
 =?us-ascii?Q?ywfqNpnp1lUdQJPLk2+91VHnZFfbnTw63QuCyOs3FZR33hwoqXiLEpTOfR1f?=
 =?us-ascii?Q?Bw2WGMA6zoqnmchFOLmbrCxjhRe7gXhlRMvERFfN2GZwsseZJS2hFxHM1Ddy?=
 =?us-ascii?Q?0DJ3OaqGb6vjupBbiKhxBNUCn7nltHf8Mq1Palzu43/n9oQP0nATXpRm1OEd?=
 =?us-ascii?Q?392085tnHZYxcID99Cc0XhQ3v2lgHpybF/xC+7OWz+ufr6z5m0YHWzAApuWH?=
 =?us-ascii?Q?k/Ap6KbvibKooZ8Sd5ttMdr8TqfPx0o0sH6askM6vabxYSK8+9SS+MFEk8z9?=
 =?us-ascii?Q?rb1mhFh5ZL8z8mrZqEQLkzXmNClltQinMXaFrsk9e5/l0UouPI0gXgHuS477?=
 =?us-ascii?Q?g+sGHLNGzVQYKWkdHlWSUyS+mgLxFRF7sU66ID6mIMz89aZskeyEDx1jy6gS?=
 =?us-ascii?Q?vE674GVZxE0dY7oVmmm5BfIokSWG0DI07gtYIBtBBRUAgbPtp2xIrwcuQ+/P?=
 =?us-ascii?Q?aUvoCtbELc4ig00XZMCU8P8kZcPB2U0J5zJRBpuJZxsILTxFCiVy06T2FO/i?=
 =?us-ascii?Q?n7CJECeUjC9sBbCAubDhNe1/B3gjZzzu70y0ZnlhypgFJApo5tExyRcwRGyP?=
 =?us-ascii?Q?LboGt0a7EY7qq4K6ONFlmllvqfj4RDDUjNGLjM7gwLjhFzJY5ZMMFytCHsV8?=
 =?us-ascii?Q?HkGxSfD7eOcXvQZ8fw11kalaQ5esqD8K+TVpV3IecsJWKMHpO8l05scy3coU?=
 =?us-ascii?Q?PL+TslBNiNclwVq2H4cknAzeXuuL6gGm1kgmDCjUrEdvSufDdogkgxbGUHcZ?=
 =?us-ascii?Q?esUoFp5qpar0hVrU8boIjF1OpSeIasjYo7VDsQD7MXaksgQP1+u4Ih4SRVXE?=
 =?us-ascii?Q?I7WzutV1nsqzTwWXztVpeQt+3hZ/nO2Fow8jvbK9xWqGLZtIP93p+LuBdNOl?=
 =?us-ascii?Q?8KHb0c+FG3P2nKpMlH/vjyUURShf5qJaun+Ou/Ucx0EagKCfqt9k3xblMzMm?=
 =?us-ascii?Q?BlsuTjXdjYOnw6u91VkbAEai2TJlhAe69/6Shw2m5Aa8byJL3Ri1GPgt9v2v?=
 =?us-ascii?Q?hAdQ9TF7rNkv5TviIhxPqmuhN2Q0IGvcjmnslWwSfX0LBuIm353tFfqdsdLx?=
 =?us-ascii?Q?oAU2XEp6x2wifTAsQRi3BKkRQSSr1ss+i038kEDuE8o2ny/5fV4lwOSifpcn?=
 =?us-ascii?Q?dtIbNg8/MGLta8xTX4EcQ9tfygW9LcMSDONi3RgX+dJxL2saWWRivUMLkFM0?=
 =?us-ascii?Q?2pLq9/pyGohs0rB4WitHdA39aIWk3h3xr1xOm175n4QmAVWuBFSgM562gZxd?=
 =?us-ascii?Q?gS/oGQz4Rx3mEuhnmb987BtATIFCOY8SzlA3aqPlH3ZpQVYtYmO/rfVQq/ku?=
 =?us-ascii?Q?CVPeq2+gZNZl9gFmMRIP+u4kkf5OW79wPcvF85T3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c10c5de-d8ef-471e-28b8-08db93b5bcbd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:17.5691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBOvA6iWgm05Y8A3/kcqla2tepa5dSNtdo8tUCqfu2DlJcSdWrynF3eFBdbEmJW5
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

What omap does during omap_iommu_set_platform_dma() is actually putting
the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/omap-iommu.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 537e402f9bba97..34340ef15241bc 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1555,16 +1555,31 @@ static void _omap_iommu_detach_dev(struct omap_iommu_domain *omap_domain,
 	omap_domain->dev = NULL;
 }
 
-static void omap_iommu_set_platform_dma(struct device *dev)
+static int omap_iommu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
+	struct omap_iommu_domain *omap_domain;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	omap_domain = to_omap_domain(domain);
 	spin_lock(&omap_domain->lock);
 	_omap_iommu_detach_dev(omap_domain, dev);
 	spin_unlock(&omap_domain->lock);
+	return 0;
 }
 
+static struct iommu_domain_ops omap_iommu_identity_ops = {
+	.attach_dev = omap_iommu_identity_attach,
+};
+
+static struct iommu_domain omap_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &omap_iommu_identity_ops,
+};
+
 static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
 {
 	struct omap_iommu_domain *omap_domain;
@@ -1732,11 +1747,11 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 }
 
 static const struct iommu_ops omap_iommu_ops = {
+	.identity_domain = &omap_iommu_identity_domain,
 	.domain_alloc	= omap_iommu_domain_alloc,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
-	.set_platform_dma_ops = omap_iommu_set_platform_dma,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= omap_iommu_attach_dev,
-- 
2.41.0

