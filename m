Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F472A400
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:02:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBnX5j3kz3fvZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:02:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KE0E0t79;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::610; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KE0E0t79;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfx4wGRz3dx8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtKiYKUG70CTMaEdKZOfOigG9Iwe7EkWaDS952XFYttSPiEdg/KwPyi5rv2YveA9L+5GcL5wHLxnq1MRRxkHKDv+tvQa/sw+jRFpKY/wh8Cidieu+7vxgr6MT84z+jTLcchTygXTd2E+HqhTjiLxdG9eHdBK5Rh8IJ9CdvhWbtaSXDQFOzlpjNKQkgwvlcj9DzRlu/DAubU2jZOW39PRgtpMn2O49HZ9RpbyeKV5BYKMHm7fwxdbRpB33Rn0ieeHrEmzbNHD4ktWW++NQ3YYqhZWjFVqS4w+l8LetDuY1uEQ73EelzltWNAAKcbrDbTqHLvsZPK1ZSgEL3cTUwnhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbWRU94XzyWJt6kncIgWnjN2oHbRSgh268gPeGHXQkY=;
 b=ZZB9K3Di58xwCOaQ2Mbq2jXfQtlnuZwKCHUNxeMzXiSSo7pVqAHq2nT7O5gUKWSeQ5+GK67c3zpt9EiOtQ61E7HAJk6MbN5ADDG7a2t6OGe59nncnw+XlbqlUynVrlFIKjH7i41qp/I082jXILXv4sxAuvpksC9NpXSrHXtmX8eiF87aGsUUNYkz3v6Fdr9qJHM1+8xF08lWr476xRCAgN6Zwo2HjtM27YkYGrdYO5ktn2jj+e6ZOT5iYRu0SsaOHCPGH53PFF+VjSzsZsMY3iX/6Qe9yKMNDpgEI4ugR3jpbYSmTNgA+a/tm59JgDZljO/QgN3LBLvZ036Z1SWNzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbWRU94XzyWJt6kncIgWnjN2oHbRSgh268gPeGHXQkY=;
 b=KE0E0t79ljo9t3ZQRZuf0iTok0Dpueb7H9ODmPsYq9S4LwxQgcRMx8HKhcVl7kvk04YPHI/J8IcFKXXOELaFqV175fYtKKFyytZ5xtdwOjU66NHZs+rOEVDCkn8ffy1WL0pLGI+WLG7+w6dJGGO0EJZmJf47J8+R3LVdVxEjUqgDagRFCl26/YNHmp25OP+y+Hsh23lX338qZrlz+nmufYwWi5ahv6a1B5po0EkMZ+y/2F0iyR8+tcvEgGdx6bbZP+n/R84X7c/qugbxYs91CQE1kdg81kahvGv3zTpW9S4vMiXxAqB/qseEby5QbIBxQC3jdF4UMltwwCoM25PM8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5264.namprd12.prod.outlook.com (2603:10b6:5:39c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 19:56:20 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:20 +0000
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
Subject: [PATCH v3 21/25] iommu: Require a default_domain for all iommu drivers
Date: Fri,  9 Jun 2023 16:56:09 -0300
Message-Id: <21-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a1c917-d938-4433-387b-08db692397bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Af5P6nn/WVyww/eIwpgHyUyG9BoqjTwe+efgDPoxRCyeRicQXrrr0eQDTX7zeN0rQYnSqi0mjNzCKuJVydvnLNxtxErYRq+Blz6h+e7kk7LG4LNVh6Y1xyHVx+96BXMj3JNkt6k2Zjsv5eSRrPPOnil0IR7BiK+BFvPc9o+GQ6blLeUnqo9vdtO76kgaKuGNZHR33Z5yY5UjFv0l/MAOYZMAEjBxE3c4mCxdegEN+2vl1lK2HKFYWYuxmo0lY0k3RHWR/gxxmCH/vu4T3Kr3giEAu2qg08XaCSFNaQzdl9WFyIQ9ZqheGGbFT3OJo5kUn3gQfiL6+wfrfTdgA5qFr7RmZMs6EwRdBMDxOEDaXrUwRJGWRw9u4ztw/0EDYjPBi/gcyBnIsAAf4arZl4iPw9RjRX7EQ/+ir7Hu11HJzhpupDbxpozTQnmuvnTnckzEcbpd48x9CyYtbtHH+nPP1becb2kJX28+C7RvjRiwcUUb5TTQYLBcLrbSXzt00lAIVbYbA3XkxtSB3sM/vG+YcyBrBWPa52oOJ0k1LoGjwFRNC9GI54uG309sCJWT3WX+Qz9Jn41VEhcwGZZuhZP4AULA/1dXh2eMalasfJwhiDo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2906002)(83380400001)(36756003)(26005)(6512007)(6506007)(478600001)(54906003)(110136005)(107886003)(6486002)(6666004)(8936002)(7416002)(7406005)(5660300002)(2616005)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(186003)(316002)(38100700002)(921005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DrjMK7Twn+YLiri1HGiM2PSPYXIz5XJV2fVE/atLm+0i4hjGqDXVzbW06Yqf?=
 =?us-ascii?Q?4as72qsjRd1HXBRQ9Xtduqt186vDp4Nes6s+SMKrEtzYoWzZaLRHBoGU+qli?=
 =?us-ascii?Q?yhf24abHDiZog+HgJsOrecfDTMdPZVV1ps4vvNzHVXKG1GVFkzCCRdTMH/5i?=
 =?us-ascii?Q?9AybAlciNtkFvXxrEKvD7v1wYvIsg/F+sySVXcd7Wgz2ft7KbQqSS47d5XP2?=
 =?us-ascii?Q?w/7O+5K6A0fyiKZc/7LS5Lgp1dnG4T9MiN5rYzQxCZ2oBeFD/41ds7T2YtVj?=
 =?us-ascii?Q?CeRoIA6yK9jgNq9IvrVc54ZxMZy/NZpNG2VzyWEKQ8abHVTkQXgq1X67z/qN?=
 =?us-ascii?Q?KWO9X/lto+M/QCTjPQ+FbU+rI1DCmojIG8UbQRfGoW3kSDcZd41z/Wgklwrr?=
 =?us-ascii?Q?xLHy7aP1PVFlwNleioQBTDG065WOpR/WSDjFSNMJ4lpFUTn3w9M7ulQ4vzXy?=
 =?us-ascii?Q?HYqhyeD93i6hjYN+PZqRTBgt2/FyL5XB3Z0YfzP566MkiyHq2NlRwDmTqnGI?=
 =?us-ascii?Q?az9pmrzFYiklQ7If/BSYh4tm6MCQgIJxmitt/f/OC6y4oCcNU0SLqjxb4bil?=
 =?us-ascii?Q?sDJ5EiulOtli4mjnu1D6a6+xbsLBCMdpsPtjBBiXQYFyA+p8yPEj81Fsgk9+?=
 =?us-ascii?Q?iO8Oz68WZz4OQXnUmeayME/4lg/9vJrAODlP+vCAVm4pr0v7fJaNTFARzhAd?=
 =?us-ascii?Q?eiv2j1evfaXhh9TbvSyKtGrZ7DnQaZInADk3kWZLU4T2obDvmy/VpdHGCVHD?=
 =?us-ascii?Q?0x9l63DW9QWj2zif7fKV+U+vRgEisQuMlvB+0KHXXFGurKii7lkQId5tD57K?=
 =?us-ascii?Q?IVAxKQC4uWmmqH3KxgDzD2m0r7rYOnS585mhHu+B5bLmBQUsLguBMTdruRt6?=
 =?us-ascii?Q?cEWlX8iuy7d0KLKzRAirFK+wT87JioSevbvyMX+jLeyvTLGI/NnMwa0o3ZD3?=
 =?us-ascii?Q?LzJPgQcgHUfQlttxLzyxN3xNA/MpT1Ofzz6S5Ec+r363W5qjO8kfs22gcTzI?=
 =?us-ascii?Q?2H7rSViPpQkiuRf8Kh6U2OxqrRzNHBL9IQWJi3g6UlnZqzi0Y6kh3ODxwJc0?=
 =?us-ascii?Q?gmVnZaV4Xe5lcP/kTJDA5DIveyaRTFAssoeMukEezt5Vyb5Qmu/dUTafPZWl?=
 =?us-ascii?Q?i0xTIpn5MBeHHIZg4qFExGJUZhZ06ikq3dessGxZCHfKRa3nrAV4NsWU7HR5?=
 =?us-ascii?Q?4gWu2OOxEkCsCkX+OyvVuUrscJc5EoEmjLyxGnzLlquezpivxuwvJXobrJod?=
 =?us-ascii?Q?ukwsjD2Y1amz/N2UGK2i1s1Jb4Em//kBzqOXkYaMjd9HClYz755If3MZAQzU?=
 =?us-ascii?Q?5W2vIW1U+DpuAbGOi6B3ysz9c0HQ4dfElJdB8X2Yq850k0iDA0kIRInvqrOO?=
 =?us-ascii?Q?LGDRP6BnVLmWLJ+Hfk8Ih67ImVE5TUrRfo7mnK1rQScRrTmNjJFyQtqYmHuO?=
 =?us-ascii?Q?AzhTrXm4BlGurikw+7mTTnXr4yjFba4cIB7lNK2obv97RcfWckeZX8DL18Hg?=
 =?us-ascii?Q?tt+9Seh27Y13iBCdNjdh+aRRKrQ1k74OKpjabIGLafDCw05ODHJWH1d8d+WX?=
 =?us-ascii?Q?nH811D6OoKGU1heotL9gZJGl7y12AeOAyYjIXO/n?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a1c917-d938-4433-387b-08db692397bc
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:19.4856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycljoVPSWZc1CUghZh4Mm5MJeEqyOgaIdfXw5dCDuCze/aY6FL1o4WhBZU98BfOH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5264
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

At this point every iommu driver will cause a default_domain to be
selected, so we can finally remove this gap from the core code.

The following table explains what each driver supports and what the
resulting default_domain will be:

                                        ops->defaut_domain
                    IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
amd/iommu.c             Y       Y                       N/A             either
apple-dart.c            Y       Y                       N/A             either
arm-smmu.c              Y       Y                       IDENTITY        either
qcom_iommu.c            G       Y                       IDENTITY        either
arm-smmu-v3.c           Y       Y                       N/A             either
exynos-iommu.c          G       Y                       IDENTITY        either
fsl_pamu_domain.c       Y                               N/A             N/A     PLATFORM
intel/iommu.c           Y       Y                       N/A             either
ipmmu-vmsa.c            G       Y                       IDENTITY        either
msm_iommu.c             G                               IDENTITY        N/A
mtk_iommu.c             G       Y                       IDENTITY        either
mtk_iommu_v1.c          G                               IDENTITY        N/A
omap-iommu.c            G                               IDENTITY        N/A
rockchip-iommu.c        G       Y                       IDENTITY        either
s390-iommu.c                            Y       Y       N/A             N/A     PLATFORM
sprd-iommu.c                    Y                       N/A             DMA
sun50i-iommu.c          G       Y                       IDENTITY        either
tegra-smmu.c            G       Y                       IDENTITY        IDENTITY
virtio-iommu.c          Y       Y                       N/A             either
spapr                                   Y       Y       N/A             N/A     PLATFORM
 * G means ops->identity_domain is used
 * N/A means the driver will not compile in this configuration

ARM32 drivers select an IDENTITY default domain through either the
ops->identity_domain or directly requesting an IDENTIY domain through
alloc_domain().

In ARM64 mode tegra-smmu will still block the use of dma-iommu.c and
forces an IDENTITY domain.

S390 uses a PLATFORM domain to represent when the dma_ops are set to the
s390 iommu code.

fsl_pamu uses an IDENTITY domain.

POWER SPAPR uses PLATFORM and blocking to enable its weird VFIO mode.

The x86 drivers continue unchanged.

After this patch group->default_domain is only NULL for a short period
during bus iommu probing while all the groups are constituted. Otherwise
it is always !NULL.

This completes changing the iommu subsystem driver contract to a system
where the current iommu_domain always represents some form of translation
and the driver is continuously asserting a definable translation mode.

It resolves the confusion that the original ops->detach_dev() caused
around what translation, exactly, is the IOMMU performing after
detach. There were at least three different answers to that question in
the tree, they are all now clearly named with domain types.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e60640f6ccb625..98b855487cf03c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1805,10 +1805,12 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
 	 * identity_domain and it will automatically become their default
 	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
-	 * Override the selection to IDENTITY if we are sure the driver supports
-	 * it.
+	 * Override the selection to IDENTITY.
 	 */
-	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain) {
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
+		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
+				IS_ENABLED(CONFIG_IOMMU_DMA)));
+
 		type = IOMMU_DOMAIN_IDENTITY;
 		if (best_type && type && best_type != type)
 			goto err;
@@ -2906,18 +2908,9 @@ static int iommu_setup_default_domain(struct iommu_group *group,
 	if (req_type < 0)
 		return -EINVAL;
 
-	/*
-	 * There are still some drivers which don't support default domains, so
-	 * we ignore the failure and leave group->default_domain NULL.
-	 */
 	dom = iommu_group_alloc_default_domain(group, req_type);
-	if (!dom) {
-		/* Once in default_domain mode we never leave */
-		if (group->default_domain)
-			return -ENODEV;
-		group->default_domain = NULL;
-		return 0;
-	}
+	if (!dom)
+		return -ENODEV;
 
 	if (group->default_domain == dom)
 		return 0;
-- 
2.40.1

