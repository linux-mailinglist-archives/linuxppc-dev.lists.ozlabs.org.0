Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 778CE704230
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:17:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxcy27P7z3fcp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:17:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fPPAzRfn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::629; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fPPAzRfn;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxH12R5vz3f66
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXd/5MNPcbwQt135mTWFBG1buAwqFWNEdvyb3aLn/4eKuFANN3Yy5cbu/bcdIjulNUiUtEk8JBuKorEDsJxq6FSP8DwV6Q29CAkK9JHoGadfjEl1rskr3TlCjTpJOaHo9cbK9bEMMzsRz0p6VFFmHpItbtZwY4UXoDFlHcX5Uc+5QxH+XDwIzZPN+8mhTizXfKQOsJR1q0G3GSVXbX56eC2i6ImHRD5ggAxIOFBjkyyVwENS9velONQI0B+YdSO0LVZS2dUVD7cWXPMZdUeo5CCWqn7lN5b4d1lG66q71YUSNa0gJ6KLwNF3yMEgvx88WpSlaCuqeiwTGZlDVSuUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgiE9B5ovwAJjwP8itSJ2p1/toDwMqVQx8el4JOd1fs=;
 b=OWM77i6jFIt0I8rWdUR2RHu0V37GW7cI65TrXfFwvEMyfAxoxyn6YEtdyheJip46C9e4DEHtlUlb5KdBJcRmb5GSEZaaf7Euf4vPpJZne5juiyBlXcb48YC8KiSJftBtzmOih49SPDKpSh/s//H5PSQNzCLWNnWMqx8SWvPJ3KKdshCLCfICpN1SuihEckdSdwA977lPLFeN8sNwhM3HNMdiu7Gbo3z7meJpLlYSTRgeT7IlQuNKCBpNiG/Z6tpEczfB91M9TJ1a9jpLRbNAacdSVqLwDCcPZ8IeCrslZuXvQn75c7kiBF5Z2FTJyTD1gvLq+84+XHjhZXrDJYLofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgiE9B5ovwAJjwP8itSJ2p1/toDwMqVQx8el4JOd1fs=;
 b=fPPAzRfnzHYUCvtwLnkjDEaTb4JN8dTmyaPyuHgH45FM/jgGOF3dfU8AqKHAhDS1sM9ASGXK3TtEuDXGM6hWQ3PgqBKcXzNod5pSTOdnBolBoj5X/oNlxqMNZAYWZvYhOyknKJYsJL8n8t6aL7v2oRG7oFz7VjnNtUC2mufNUospWpNvARatYFSiNjte5s2xR3j9Qp8fkNXFSqVii57CQe3yYgPESMSt6kCvEebu+KiksujZpTIit/MrEvQwJtzHsvzIVe3wsrbvhk19De+KNeY+oULqzUiFRI2qu9k2RnN/MEo/UFtt5dYXb48A8dlZOH4zwME3/FN5GeXTMS/PPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:14 +0000
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
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: [PATCH v2 22/25] iommu: Add __iommu_group_domain_alloc()
Date: Mon, 15 May 2023 21:00:55 -0300
Message-Id: <22-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:208:239::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: ec653f6c-981e-48b6-9a3e-08db55a0a397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	83BiJjDFx+Ej/+jvtY6pi3XcZGqHnaizlYIEolyfr4fFrIODXWSlWYapl1sZrzEJnpXmELwuXGk903Qg9MvO1oxw7ei2ZDYHMOjWN3D3EsR7TnHzT/mejHtaGCnZGyqad34I1WQ/j/4AeJ3BpAdzoLmJb3oVCHGdvp0G1SoAcVH31nI0GBxFUR+WT+cX+inJfXxJ8L2N+taxv4sNLgBq+WYswTwblMQNMjdtN14AYSSy+Bpb3Ji2kBCYQRBIKLh8O6IXPFx3bS3EFx4o/x3dDbDFVmd7mDhtDsmK1TA3B6nBWNBQTSh+KAJGlNuxjSZaBqZi1wUHHe2GEo0076B+pv2EcyazqQXSl4Uimznr1cpMc05Ji1ZgNp2A3cF7Bh1tg5OkHqFoXiCYjlCbujrvUpNfXFNc6JFOGjYgRu+jpx1J+niIU4YHcV/gbd3GDQVe09WWJ7FVlc0dQ6NP/6Nibraqgt6xlzM7H3sGLYwdVHltwG3mUGEun4im5hD6hq6Ejy++xB5baiVLvS1EKRZry76soT5iZZNpTFRHwvqh/AaKXO/Lpdds6Oiyv4MwIAg0ZeD7kLMZDX1vAp6w/gZuU1t1D3uRrPRdyTfm34h+rLU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pfftCMmYkPZy7SyPdDyn6H4BLjtL2hXWTe+TgdWnLcg6nSceXP/BUlGYQcIL?=
 =?us-ascii?Q?kv6lh9FHVy+pNdBTIgmGkt3rBXAYc9mqEiHlWa2JbdubRBuh9PlOYAG5ohaH?=
 =?us-ascii?Q?m4hR8MyQ0W9MDtd0WAGfwzVlrTyE92NZJATUk/bZxNu/uNIwpFSZaqdkfkND?=
 =?us-ascii?Q?HObj/EUFtZGrUhsKUGltjUPQsQ6uPmhsOKWF2ZWAHozy5ahxfneaMamrS3d7?=
 =?us-ascii?Q?sb/Z7DPG7EsExUnLHqacF/rmcqac2OEaaTrTyH3XuXHYP2GekcUKiOc29t5C?=
 =?us-ascii?Q?r2TtZJ4EITWU0nMwYAPFgWb4LfbB2FgvIZHstk4k4ZZTOoSW4B5GagOaCqD7?=
 =?us-ascii?Q?sczU48RzgWHtym85oU3mTTNMgl00+2Q6L8inUCZOOb6xGk6FRZ5ufdyKwVfU?=
 =?us-ascii?Q?0R9q6t8ccX1uqzQTFnb44t97ezSIaXriq/JZvdSC5LNsD0DqTPsnbdr4VrC3?=
 =?us-ascii?Q?QNf0G+Hd/eefPctDuABRWEUdE+jO+h5N7jH285gYcLeazwcp+WO2tgAY0yhE?=
 =?us-ascii?Q?EkqW1FRvJo9tdLgJfWpR3jP3WKmoQTKix115/t+C2PCmAMw3lRtvb0ZktT0o?=
 =?us-ascii?Q?9NUm5klvmwWitXQ+8yl9Jdain8E1FXBguDOr+zIAf9ircfa4EJdQbgGYVJHJ?=
 =?us-ascii?Q?9MV6/q23DhQlkRNmnIJcdu5BfPbip9GJAoK6OJDji9n/sDAAierMSaF69Fgs?=
 =?us-ascii?Q?Tavn6SWHfe+2/+F/GEcgZldLAAC5NaPwAHlQoYXCWJ1+vH6z81TOwuLsOXM5?=
 =?us-ascii?Q?fxtvHVvVM0E6mLmTRKPz8JgbtmGRBw2TqaiuiUzh8dxJ37khE0uNCTmMOUon?=
 =?us-ascii?Q?k6LprmTSKQntF/PHvdzZqInmABgar6dzo4X/c/Q0syJKX6TzWwJcyDeBYFUw?=
 =?us-ascii?Q?iNpnl/k8D8TboUGOw8uy4a/iQFs9GSW7h6BD9AXFSsJ/HTXRNuzR6th8yA/v?=
 =?us-ascii?Q?V07zhh7tDCnD+aDeUvuyEFVkjndGq3HZJBJrnvZl5eHiN2Ko1RTaqVwPGXVi?=
 =?us-ascii?Q?Zz4XIQ5CF2aAoNq6Z+vgSCWmqnWLci1S1p0QhnzXR0JA1f9Tj/eWnDiZo407?=
 =?us-ascii?Q?DSgPPqyp+jQNAgxXjRAz27oD7nNrW8uPz53lerwNgDo2CakLGA3Hdd8B5KC0?=
 =?us-ascii?Q?r1LfdangBAp2/jQ3hrma2moSFTsSDOJd3V0GW66XkjNIID4l/UciF/QbbcZy?=
 =?us-ascii?Q?b6fOxYWTT0pUhTmZtyrBJ+DmYnBwnF7CAe1r69gFAvQDwFwlLfCmpZ3m6ES3?=
 =?us-ascii?Q?CCuluDGooisSp8o5u5kUZTxxsvKgZ+X74qa3lA39rAszepE5ikVChKFBHFmi?=
 =?us-ascii?Q?VG5+rrPnmWdIcArMwrTBTDQkP4qqatxtsHraD2JTkbb6RGQvr++lci/Dv3qX?=
 =?us-ascii?Q?a4avHTJJGNmu1C1lqkb9kieT08Jg+C6jaMHdfwD7DFEB9YcECAdwGGII9+yw?=
 =?us-ascii?Q?+y+g0cpvAJnQaB7RsiWP/67lDS2R5UAL13sfBBcUWmY/B6wS3qQehUaC+Byf?=
 =?us-ascii?Q?ObrtXuHm1NGOb1zPiEDz2hK8NrgvSx+LvXJS8aaowElblfDT2d5DmUYoLihr?=
 =?us-ascii?Q?oGe/slNcKxTAwBTFfVNaM45SUKIyvZjew9/8RGmB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec653f6c-981e-48b6-9a3e-08db55a0a397
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:03.3160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4x3CfAsmKbF/2PbYih6Lth+QlUo4570hPPwVR6mZf6nqE2bel875lvy/HKUAVhX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
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
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allocate a domain from a group. Automatically obtains the iommu_ops to use
from the device list of the group. Convert the internal callers to use it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 66 ++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 15cdfca4011ef2..c4cac1dcf80610 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -94,8 +94,8 @@ static const char * const iommu_group_resv_type_string[] = {
 static int iommu_bus_notifier(struct notifier_block *nb,
 			      unsigned long action, void *data);
 static void iommu_release_device(struct device *dev);
-static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
-						 unsigned type);
+static struct iommu_domain *
+__iommu_group_domain_alloc(struct iommu_group *group, unsigned int type);
 static int __iommu_attach_device(struct iommu_domain *domain,
 				 struct device *dev);
 static int __iommu_attach_group(struct iommu_domain *domain,
@@ -1652,12 +1652,11 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
 static struct iommu_domain *
-__iommu_group_alloc_default_domain(const struct bus_type *bus,
-				   struct iommu_group *group, int req_type)
+__iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
 	if (group->default_domain && group->default_domain->type == req_type)
 		return group->default_domain;
-	return __iommu_domain_alloc(bus, req_type);
+	return __iommu_group_domain_alloc(group, req_type);
 }
 
 /*
@@ -1667,9 +1666,10 @@ __iommu_group_alloc_default_domain(const struct bus_type *bus,
 static struct iommu_domain *
 iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
-	const struct bus_type *bus =
+	struct device *dev =
 		list_first_entry(&group->devices, struct group_device, list)
-			->dev->bus;
+			->dev;
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
 	struct iommu_domain *dom;
 
 	lockdep_assert_held(&group->mutex);
@@ -1679,24 +1679,24 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 	 * domain. This should always be either an IDENTITY or PLATFORM domain.
 	 * Do not use in new drivers.
 	 */
-	if (bus->iommu_ops->default_domain) {
+	if (ops->default_domain) {
 		if (req_type)
 			return ERR_PTR(-EINVAL);
-		return bus->iommu_ops->default_domain;
+		return ops->default_domain;
 	}
 
 	if (req_type)
-		return __iommu_group_alloc_default_domain(bus, group, req_type);
+		return __iommu_group_alloc_default_domain(group, req_type);
 
 	/* The driver gave no guidance on what type to use, try the default */
-	dom = __iommu_group_alloc_default_domain(bus, group, iommu_def_domain_type);
+	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
 	if (dom)
 		return dom;
 
 	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
 	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
 		return NULL;
-	dom = __iommu_group_alloc_default_domain(bus, group, IOMMU_DOMAIN_DMA);
+	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
 	if (!dom)
 		return NULL;
 
@@ -1994,18 +1994,15 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
-static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
-						 unsigned type)
+static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 unsigned int type)
 {
 	struct iommu_domain *domain;
 
-	if (bus == NULL || bus->iommu_ops == NULL)
-		return NULL;
+	if (type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
+		return ops->identity_domain;
 
-	if (type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
-		return bus->iommu_ops->identity_domain;
-
-	domain = bus->iommu_ops->domain_alloc(type);
+	domain = ops->domain_alloc(type);
 	if (!domain)
 		return NULL;
 
@@ -2015,10 +2012,10 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	 * may override this later
 	 */
 	if (!domain->pgsize_bitmap)
-		domain->pgsize_bitmap = bus->iommu_ops->pgsize_bitmap;
+		domain->pgsize_bitmap = ops->pgsize_bitmap;
 
 	if (!domain->ops)
-		domain->ops = bus->iommu_ops->default_domain_ops;
+		domain->ops = ops->default_domain_ops;
 
 	if (iommu_is_dma_domain(domain) && iommu_get_dma_cookie(domain)) {
 		iommu_domain_free(domain);
@@ -2027,9 +2024,23 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	return domain;
 }
 
+static struct iommu_domain *
+__iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
+{
+	struct device *dev =
+		list_first_entry(&group->devices, struct group_device, list)
+			->dev;
+
+	lockdep_assert_held(&group->mutex);
+
+	return __iommu_domain_alloc(dev_iommu_ops(dev), type);
+}
+
 struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 {
-	return __iommu_domain_alloc(bus, IOMMU_DOMAIN_UNMANAGED);
+	if (bus == NULL || bus->iommu_ops == NULL)
+		return NULL;
+	return __iommu_domain_alloc(bus->iommu_ops, IOMMU_DOMAIN_UNMANAGED);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 
@@ -3138,21 +3149,18 @@ void iommu_device_unuse_default_domain(struct device *dev)
 
 static int __iommu_group_alloc_blocking_domain(struct iommu_group *group)
 {
-	struct group_device *dev =
-		list_first_entry(&group->devices, struct group_device, list);
-
 	if (group->blocking_domain)
 		return 0;
 
 	group->blocking_domain =
-		__iommu_domain_alloc(dev->dev->bus, IOMMU_DOMAIN_BLOCKED);
+		__iommu_group_domain_alloc(group, IOMMU_DOMAIN_BLOCKED);
 	if (!group->blocking_domain) {
 		/*
 		 * For drivers that do not yet understand IOMMU_DOMAIN_BLOCKED
 		 * create an empty domain instead.
 		 */
-		group->blocking_domain = __iommu_domain_alloc(
-			dev->dev->bus, IOMMU_DOMAIN_UNMANAGED);
+		group->blocking_domain = __iommu_group_domain_alloc(
+			group, IOMMU_DOMAIN_UNMANAGED);
 		if (!group->blocking_domain)
 			return -EINVAL;
 	}
-- 
2.40.1

