Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79772A40C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:05:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBsP0763z3ffC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:05:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M6ChzCqr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::608; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M6ChzCqr;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfy6xGWz3dx8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFSsQ3deyqgkDRwKoXgb3D2SyHzemi6wQoOhfqTHaUliC5rasJVI2S8zYwmy35/uHm9ioHovZTO3XhvtCb8naUH+FYN3VcDmUG5tRTqvTJu4afMrsP7YNXBuPa3OsscINrxRmg7CcBvuvqJrTNayVYsIQXUyRDcYBZqsR3mblbb2a1j5PiOA0NKsNBZWDcYp8kANAeX17E0bJ8m2WKFwpteVKmFJWcb1jGZtixanqmUm8q0yLMLZCV6GRdsxWU9O3180upFA6DlWtNVfj3ZuI+SiaFHt/fit6iztLYTfYnO523aq6QEq6WyT/VS3ji0NxAbBG6UJf0rCmFsf4QU3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPsNfHZDxUgWRO3W/MpYN6KAqvhiZXTwDMHsE/9voOg=;
 b=W+Rm0XcP3hrksds/ca32ZM9qS+Nn/xab6Gk0DIni9Ls+3ad4gXGxMkCLdjQec2hfGOy8lRIBMTHyP+kLno212SpxJrJZKNfUNkAI6ybq7bhP/vmTE99hkWTrhEA84StYjeT/xXvk1nJuzzVummY6qLzJjo/HfcchD5Zvc1npApv2xyfCWkYZk4yFjnB496Z4INyHCcgw14ZNIOPZ36LfnIBLhJtQY6l0laY8x9T+yMCqL3f7QQEDX13A1Wf5dvw2mFBh8iy0xy8PN8xuYhlxvSuM7Tf+FNr6zYBfdWfXkL3ExgNIiLFmI6F0Z07Q0op02LMYqReRRd+1xHizjF3twg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPsNfHZDxUgWRO3W/MpYN6KAqvhiZXTwDMHsE/9voOg=;
 b=M6ChzCqrDL0f+LLD5FW+uyHuVohVfOWNZWV8+etjGuIHPjMDm1Nvrvwb3a56TiauIS4FGq3hnQmuwnKfRk5ZNksgr8o3ak8y6TimK1KzcbcrhPG4yfaT8Vte5KEfHbo516ktZkGKxNH+dDauQiUquvg2zYPZZjo2dBXkahdK+qarCNPAxi93Tp7yUFMQPCSdumM0oQEG4/W0SgIJnIgUQFkeqW4oU4PTQ7xHE47asnXFgHamO0AItCR0oCFU0Y5oQprYqd0JS6JYMsXdlbX2GZDsUFeVrTCdU9l3RmQHg3OMQeB1CT2RqGTkYVrK9LYM2BCsqJB19sNTXoQcrXJqtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5264.namprd12.prod.outlook.com (2603:10b6:5:39c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 19:56:19 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:19 +0000
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
Subject: [PATCH v3 23/25] iommu: Add ops->domain_alloc_paging()
Date: Fri,  9 Jun 2023 16:56:11 -0300
Message-Id: <23-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c97eff1-1f2c-4755-8774-08db69239630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	S+oCWsSag1uQU4th5UECTHm+Uq428wZ4ocvtOXKh9sjNcVYtbqZ49jmDMf/bmjH7fmuCYMGncIabe+OV9/7AEYGFOn8S0tyw02sODiJeU3xSKY6GHU0bzUzlEUE1kxyVTrOs1Yl6SunkXxRHeGr84U69qE57qV0druaZVjw+zJNP4oklaFldwt4V0BiN78qQMRsG8BvVWJe2xlsbNhIE7zTnya8D2OsbWrKbUFBdhEXlQcLuLp8oiak8WlqoPvehgYgKH1RCt8oGMe5pL/5MfnjGsDz3NpisErh1UwUfMXC2Ko4xuVVFJDfGHzSSMyV5LMP3S7tbF6Zkg2b8NkbcWVOsSHhe8b/wZ2NgcOFJB5VbAe4KFmrFWot9rolVhF7Lb6L4WCa0goZiFumKXaOV5LGPL3+UgmZ8mNJD38VNdZKvbakYhYzIcVp1aw8KDSZIkM9T+kB5Lh2QNqDGit4Fz+iFzvwZe3aEvteXNzOXXu9+VvwAcfrKOTWkvjcYJku2ZEaCCzr2n6UavK9DuPKTwv+1ECYu0hjxfw2nO97+YjotzZEKgbpnxHGTU+q97roLpCItyzyFjHhEw1kdSDLE7rnQjIzgxyA+tP0n9V7PJr8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2906002)(83380400001)(36756003)(26005)(6512007)(6506007)(478600001)(54906003)(110136005)(107886003)(6486002)(6666004)(8936002)(7416002)(7406005)(5660300002)(2616005)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(186003)(316002)(38100700002)(921005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/hfFcSRjURBzQ0ts0Vn2L2sxCEAyVfXgoRyKH//EME/HHox5USw/l+Dh9wHF?=
 =?us-ascii?Q?6utPKnrNXNBWIBFybU9dy1Y7Ytmj4bU59Drj+AbjgeRHzo9wj2khVXMXFZib?=
 =?us-ascii?Q?Oky5jnTjfm6dO7r+R/QuzGB6CczDcUThUaQ/rkcNiXcnwTaZWFjoGUBc8JHJ?=
 =?us-ascii?Q?+krZT7ncdr+8y9COmzCzycB0OFJLMuaCtsClFGEJ+V2if+QMu+yHHiwOc0zd?=
 =?us-ascii?Q?1DgjUWzL+Qylk8q9zX8XotzIDZRCu3/O1amJB5tmlpTzWllcblP5B/Cq/X/G?=
 =?us-ascii?Q?mJNN577LnbJWRh39WztvO1Q3z14bX6/n8EVtaqLY24Olgx/fXdJE4ufbVgRd?=
 =?us-ascii?Q?XNU7UbsUCMwk60ZRycMZyBeRNlP+IOnb0ebTBIy3h630rfuQyHKsqqK67hlZ?=
 =?us-ascii?Q?BmkWUE18feckuUSZY7fxyJjGGWXmHZy5gaT5xaEW/62XKPzdtr1aBZWa+X/N?=
 =?us-ascii?Q?rWBRjbxHiB49SDmsglVhnrYrVEuQBwU6jw7LAT2Xbwe/V0RtLePBbRrB7srC?=
 =?us-ascii?Q?zFcWv0jS9wCuaxwNL6hvvsRefqbKkflLA2SQEDU85KOhd6D8FexKXMg6ulMR?=
 =?us-ascii?Q?7viRS2VjL8338GqKVuJa888U+yJf5uAnulLvvmBSMkkJAN5SFnfa/EASaiEm?=
 =?us-ascii?Q?WmjUdKLp32GSmud6dNe1xPAGOi088q9tQowu1IrkgiBT4pEfenFWp8RJKYpN?=
 =?us-ascii?Q?RnntU/OhBKqtW+jHRibYQVLNP36XOA678jDSsmj4KbNc0nWEe3ASL3bco+u7?=
 =?us-ascii?Q?TJyDxi3ZDADya44aVRSWGCJL/REUAb+XriHlWJXfQNZyd8nnVyDSt7OXmsfq?=
 =?us-ascii?Q?mOMw8s/9kMIN/6j01DnNeXwjsOP2EZu//994lEU4P9gTqzNEcjou+kYN5K43?=
 =?us-ascii?Q?0uWlpumt4/uIr+FkjbzKZFEkEkY+ykHfKPYz4PXZBQj3txCLUzmqWS8E+ADH?=
 =?us-ascii?Q?oQAdQelMrEm2Q3+APTHphFvg5rhtk+teOwAIiyf/fSfeDIPvGqsvGfqJkVxF?=
 =?us-ascii?Q?ZBmITOdy2Y/mxxe9TJCGHeZvrH91TOXcLkoqmvkXn60DihcRe8e24f/SRvZz?=
 =?us-ascii?Q?OblXE6vTj6neVl/kiLsbl0ZaAhXa8wweu63SkO/3TrM6lQmyWawdVf3cvmkQ?=
 =?us-ascii?Q?l15SCUegRMX5mJ1rT0DY3M+onUkGEyDt1zkRoppxA6aD1IuznBcIsIKEMsau?=
 =?us-ascii?Q?mJChhhoPYeNFpxwtIPmMeT8ruxFlzsoimVXJRylqpOkmA87MmrWSGHNmfHQS?=
 =?us-ascii?Q?Z77XmdnQgm1HRb7x5pS34zwMR1XAKZj/psNP2+4BMXBELV8pNln8swprqrL6?=
 =?us-ascii?Q?obhePOg38D/xkTFG/4X4d+jHAg55PpQRr7Vv31m3ZmkSUBzRKnHrk++gnF2P?=
 =?us-ascii?Q?BaoefAa9xDcpJpaHzLtiba8Me3/ahgR+G/FjFoCXw9vJBRgBLQxXuB/4Zr8N?=
 =?us-ascii?Q?9beDS3I80M7DqGCdZzjje60sKgNIqnFRbmA6ZpBMD+Hr4Tjsdph48HwQyjav?=
 =?us-ascii?Q?NimckRaaluaJGoh8ZvJlDk1FFe8NOJgQej6mSrKC913SFtBqg5BMsdYn8nE+?=
 =?us-ascii?Q?9mzvwi/B3ZPdYSyglBHC8Xp5zxwKWg7eGgg/6l/X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c97eff1-1f2c-4755-8774-08db69239630
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:17.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohIGnzWOipZ4w8Rv8OVzfZrXgSEcaqWbuBwVrdqWsa3cpJ0YNPeIVT40DS4kYJK6
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

This callback requests the driver to create only a __IOMMU_DOMAIN_PAGING
domain, so it saves a few lines in a lot of drivers needlessly checking
the type.

More critically, this allows us to sweep out all the
IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA checks from a lot of the
drivers, simplifying what is going on in the code and ultimately removing
the now-unused special cases in drivers where they did not support
IOMMU_DOMAIN_DMA.

domain_alloc_paging() should return a struct iommu_domain that is
functionally compatible with ARM_DMA_USE_IOMMU, dma-iommu.c and iommufd.

Be forwards looking and pass in a 'struct device *' argument. We can
provide this when allocating the default_domain. No drivers will look at
this.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 13 ++++++++++---
 include/linux/iommu.h |  3 +++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0346c05e108438..2cf523ff9c6f55 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1985,6 +1985,7 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
 static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 struct device *dev,
 						 unsigned int type)
 {
 	struct iommu_domain *domain;
@@ -1992,8 +1993,13 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
 
 	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
 		return ops->identity_domain;
+	else if (type & __IOMMU_DOMAIN_PAGING) {
+		domain = ops->domain_alloc_paging(dev);
+	} else if (ops->domain_alloc)
+		domain = ops->domain_alloc(alloc_type);
+	else
+		return NULL;
 
-	domain = ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
 
@@ -2024,14 +2030,15 @@ __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
 
 	lockdep_assert_held(&group->mutex);
 
-	return __iommu_domain_alloc(dev_iommu_ops(dev), type);
+	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, type);
 }
 
 struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 {
 	if (bus == NULL || bus->iommu_ops == NULL)
 		return NULL;
-	return __iommu_domain_alloc(bus->iommu_ops, IOMMU_DOMAIN_UNMANAGED);
+	return __iommu_domain_alloc(bus->iommu_ops, NULL,
+				    IOMMU_DOMAIN_UNMANAGED);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 49331573f1d1f5..8e4d178c49c417 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -233,6 +233,8 @@ struct iommu_iotlb_gather {
  * struct iommu_ops - iommu ops and capabilities
  * @capable: check capability
  * @domain_alloc: allocate iommu domain
+ * @domain_alloc_paging: Allocate an iommu_domain that can be used for
+ *                       UNMANAGED, DMA, and DMA_FQ domain types.
  * @probe_device: Add device to iommu driver handling
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
@@ -264,6 +266,7 @@ struct iommu_ops {
 
 	/* Domain allocation and freeing by the iommu driver */
 	struct iommu_domain *(*domain_alloc)(unsigned iommu_domain_type);
+	struct iommu_domain *(*domain_alloc_paging)(struct device *dev);
 
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
-- 
2.40.1

