Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D879EA42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:57:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RzGUxbP8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm28V648Gz3gZc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:57:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RzGUxbP8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::60e; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1sB1R47z3cDS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8kaI9IXCMHNsYow05ZW3/vOnGuTyoQ2PfasXQdoZWGivIcew2KXNiEP/MNwXBOJij0oFI4RkjRWJ2GDizkdrVbykSSIw31llCEw9wtY2jxdVFhTUeQrYXkP3JooxuhCxETzuk4G3AvFulLjgvb+e9bk2W51m8ghaSOoIfi1fdGG94O9aK+NBzVF4xMJmMqygx7YH+s3LyTT9lWgdD7aWGrAI5xIsmMdfi2lxiqsv3hICvI1WPmHrE2eDMqfhh0NaTJNTGvB92J/PbVApELt8eu3rDczB51TyNGte0Lz4OcZDpZZiJriKtJr3H4vhXs8y8OM+mccSjnY7klMKtT0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Zq+KeSF2C+mH/jFfjLMxge5E08n1Gl6FiKFL8Brt7U=;
 b=RzjULPBhHfasnVvJWBBa9zOtboIi3Hvtwn0b20NAeLvJfaA1pvqsAbPWqRDJUZA9QpFOltWPD2sE5ge/SR0cYhVCPrsXKweI8QfYIX/3hJV6UgonHpcAp+3X9TKd/81aN2+HIryttpb1dMI4pbMP7OGFmryzxmE8PLPFneqzyCeJTu0IQhq4hyT8wT8RIke30Cvv0Q9QF6Onv6wzC4WF2i4JqjcZYEwNWvINzpa9xz6joq6C73kKUPCxeZbbNew9k76g5B48m18jRb2DZRn0VH4N/zqnD7zMQO0C2qV1Dn2b3PxeYlWux8hOHxK95yf0dwMVrVgOzf4APlCtt1ibtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Zq+KeSF2C+mH/jFfjLMxge5E08n1Gl6FiKFL8Brt7U=;
 b=RzGUxbP89P6cF/6gN1tBaM9d1kKKcI/rZWNhWF5Dwu5ouJ2n4VOZkESLuyT0nMXtIHNBrxFwhCa0E3e2cpc5MGnGoq/orowc+kDeD+B47v8b2EcPllWI5HVnoXPoyat1YqkTpPOjdpXbgj0Pqp37/c+OXFGtE8o9Wd3sidXiV/oUW8ssQ54TLK/HgBVtaGp6K7TsueRA2aPzatON8JCkjPd7mm07LXopQbIanYyCEE5rVmKzdLcqUmnVQfRyrSgh9SxFKRZG/ScYXrpfZ+nWr+f8683SoHbxdYhm3mmbUMiAOJ26TPm/QhoeZoEDkNFivNEkPh+ujcQDqNpzSjuCgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:44:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:08 +0000
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
Subject: [PATCH v8 11/24] iommu/tegra-smmu: Implement an IDENTITY domain
Date: Wed, 13 Sep 2023 10:43:44 -0300
Message-ID: <11-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:208:23a::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d28118-7208-4916-eb90-08dbb45f80e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	blzXrg8ZSpuei6mRqmfyghcNmfYkHQFqgLEnZtp/atpucQ6428r1w2ia0k1D0EL4IHybVrmN95kJ4GcPkF1arx8OsxC1R7wc0Oo9JbOzL0yH/Ur1h8WDnaN/ZCPYri9Dm2KnFJBebLCMUHDEuhjH3O1pxrgX1CRdOm8EHXjAvtjqQvQIAWX0OX/QOz5eBSYAdrLb1Df1AMxpkqL4l0Hu5ymJZ9z3M0GWxujPUpLyHWItxtl8cVithwtb6jEvvRlu6o89XifFJcOcS2oCzbCd4s2TANlZsHKFwUb4/Hn1xKDHEMQRblmtIOM+7U4zj5JNfZ7BAa6S9EyOVlqcweQUQkChL7vQcHdFwGNFEXha5lrtxruhActVebBvdE6yTC4Wmi8vX48PldvOUGxmqzdoy4QERhvPzJZjIn2SPAb8YsQibJ5vN2gREKW5v8ueAsotyaU6tr1sC6Jgn41TzGzc/zjNIPTZ+thJRK9rM98CQ9pKX5HI5ku2BN9yYtxtic+8UePEb6u0JRXW8Prm79AMnKKuf7Zwok4DGSAaLOrQakJeZjjE06BEaHha4fAHaT5aX6a+ovPuuQjat8Qn/8r5qwnlUvQephe/hRGCqXS1++U=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(86362001)(6512007)(921005)(66946007)(110136005)(2616005)(478600001)(107886003)(6666004)(38100700002)(6506007)(6486002)(26005)(316002)(4326008)(54906003)(66476007)(8936002)(66556008)(41300700001)(36756003)(8676002)(5660300002)(2906002)(7406005)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?KRA4dkN6SFbhY/PhxcCiHyKWQpKjz2jW7UNjCB3po56EaZgKgUO4nOd4GBIG?=
 =?us-ascii?Q?gMv997a2WVc7I/KyP+FjBxMMP1RKA96zebLhPb79pSTWzFJgim+3f/kWvmk7?=
 =?us-ascii?Q?NyDjLc1fwuXxhZkpCXPN9fE4ItGW4/2xKnc6E2I0bfwJXHLcvTn0ZJ9rLwJf?=
 =?us-ascii?Q?jP9OWY90I+eYrhI1XIYFEWVqpuOX1cVQJxKTejZyayApNzZ6f5mP8qvLHfqv?=
 =?us-ascii?Q?FflKxYcQaAznvMKIanaozC5PEbjJU1xWn1fYpQ6IbRnI2TTON7P/HPH8OsnZ?=
 =?us-ascii?Q?NBS7nACHLuP6g/c/+bpeEd6ypnTlgnRRdbC4rZ8TrYNYwDaFYqPcI0bhR7R0?=
 =?us-ascii?Q?ySK3TiFJj0+Id4eAJUTqps1iaM/77/uA18uS/U/VM+2bIu6Ytz6oQPEYS22J?=
 =?us-ascii?Q?0u+EAusKY80fihGUB3rE65iAm3Ug10bh1KVJkFQv3zNJ4YMB7QjmXrPsr+co?=
 =?us-ascii?Q?wGDa6EWTKpNmSrFWfG/3+E61wlgb0eKZTnpBbgV8F7HgR0FJSNUUvWuD24oE?=
 =?us-ascii?Q?2ehSQEQtw0lhbnQZ8GXhpq87/l37z3qiigNRa+nL8FfFcGs+Xzp86Elcrvrt?=
 =?us-ascii?Q?KWtt2dTAnOnF8iZ4/fX/Bdic0qiWw++dpp3+9VGANI2BLULXhI6iN02irQqj?=
 =?us-ascii?Q?cE5doFZ/VBq9yS+q8Rohh7kMQb6woBrP+/+mwopsCDzS0/3ci8JEIBlIHGc6?=
 =?us-ascii?Q?J/r85ZArEgAyCooHbuyURPd5NvewZfL4mkcE023W7Ft8XIaR1xw92o5wcSpi?=
 =?us-ascii?Q?1dbBPBsQ+fhIyxqBH0UzOarXN5V2bOVSF8eYQk/aKWY9TMYUPgKaVlX/OD8D?=
 =?us-ascii?Q?bS5ce16ppkxSCwhHbpLQEu6fgASdbp3DMgWEMgDZo5FLS9++lHqQjlXl0toP?=
 =?us-ascii?Q?BjZHRxtnQBKV0uy6j5iaPjbOW/fZU3CQdlreFaRXADSH0vuAiiZoRPgAhsh7?=
 =?us-ascii?Q?HpGYMrRaRgjKx1pBN+LuCrDkeyWP0rYAkrvPydmGsoV7a0pgl7//kcSYq6Lk?=
 =?us-ascii?Q?MKw9s0SOw3791wFcHIzgjmGEsIkpB0bsUkC0Hgm5dDpttn3Ej0gvSCF1tGH7?=
 =?us-ascii?Q?6dcrJekyXh5T+veeAl4R9mhHj6Py8RLb1yn6+6ofymXu4AVL8acUqVr592b/?=
 =?us-ascii?Q?3WpeOsmkXPQSTa2ynPQ+npsCYOXuqXRWuZ3mo/fIwsO0MJFkAvhdU3YytMg2?=
 =?us-ascii?Q?NA1iPtPYqWxuoaw31tumy5bUlK57wRI3dX2cugGcn/GJSZEwx6itzp0B5VhQ?=
 =?us-ascii?Q?Afz0tMEXVie7r6rUh7wwTnnlglihK9BLrhweyM9EqVATVMhvI0n1wf/Nu4Ly?=
 =?us-ascii?Q?wwAB3rq0ZpynXDAExiUO0EuhIgD+BP22OZtLUwHYbj8kSqQzDtCHCcCW8Kkb?=
 =?us-ascii?Q?9/uJxxKmwF7y9uLO+1GJWoUX05gE/FvLXGeXJuI/UkUGYSAk69eeOL2KM8Nw?=
 =?us-ascii?Q?l8xDNmVuAyB6KwWZXc83LHU8D07SEWXxzo+KVm9JeiwrblInoDkOit2jf+d5?=
 =?us-ascii?Q?D+1/8wqYMyhoWXsx+ke46VJ+oPnVAf7kAy8Z1zPQgRW8Tq8ASVpzYsz1zUrk?=
 =?us-ascii?Q?V3dNx0ECcVcb+sHxpCUiE3Wr9jpKf5puxlPOQraK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d28118-7208-4916-eb90-08dbb45f80e5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:08.2909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvBp9wR+2KK0icFR0MLheJ1G1tbpT+otaGTmZ30lcId6magrsCIXei2DvGQ4IfYw
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

What tegra-smmu does during tegra_smmu_set_platform_dma() is actually
putting the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index e445f80d02263b..80481e1ba561b8 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -511,23 +511,39 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 	return err;
 }
 
-static void tegra_smmu_set_platform_dma(struct device *dev)
+static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct tegra_smmu *smmu = as->smmu;
+	struct tegra_smmu_as *as;
+	struct tegra_smmu *smmu;
 	unsigned int index;
 
 	if (!fwspec)
-		return;
+		return -ENODEV;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	as = to_smmu_as(domain);
+	smmu = as->smmu;
 	for (index = 0; index < fwspec->num_ids; index++) {
 		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
 		tegra_smmu_as_unprepare(smmu, as);
 	}
+	return 0;
 }
 
+static struct iommu_domain_ops tegra_smmu_identity_ops = {
+	.attach_dev = tegra_smmu_identity_attach,
+};
+
+static struct iommu_domain tegra_smmu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &tegra_smmu_identity_ops,
+};
+
 static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
 			       u32 value)
 {
@@ -962,11 +978,22 @@ static int tegra_smmu_of_xlate(struct device *dev,
 	return iommu_fwspec_add_ids(dev, &id, 1);
 }
 
+static int tegra_smmu_def_domain_type(struct device *dev)
+{
+	/*
+	 * FIXME: For now we want to run all translation in IDENTITY mode, due
+	 * to some device quirks. Better would be to just quirk the troubled
+	 * devices.
+	 */
+	return IOMMU_DOMAIN_IDENTITY;
+}
+
 static const struct iommu_ops tegra_smmu_ops = {
+	.identity_domain = &tegra_smmu_identity_domain,
+	.def_domain_type = &tegra_smmu_def_domain_type,
 	.domain_alloc = tegra_smmu_domain_alloc,
 	.probe_device = tegra_smmu_probe_device,
 	.device_group = tegra_smmu_device_group,
-	.set_platform_dma_ops = tegra_smmu_set_platform_dma,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.42.0

