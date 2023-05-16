Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF6704210
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:08:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxQc6Fzyz3fpR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:08:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WgiIVO1U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WgiIVO1U;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGy0rPvz3c92
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOReQsFwdIRzGdusKoV9Ci8cIgF4oTJC2PHTInqlmuV4yIDAhnuieBqnOmEnKwGexXvDY6IWKOqaedv3vUEHza9fkmaciGpRLJXdk3bzjC+ZuoIBYL/bjhaRl69eywp+7M59+1Zl9+suUHE/Jqxeoyx0k6zp3dnnJu9yK1WfWMb86Ib1oEZ8UPYvJUBSqsrMMRgh5xpwpvhZf0het8Z0m5d3sGdrfiTEdPSln3jkwEmIPeLs0rWJT9xf9DafNnVc5nLISmDKiCb0Vcw2ZFwWkMX1P2VkfxM/H9iHPY6EFHX1RphrzI9rf0a95yJ6j/fxxmBTD1nIa/+BsnpxlvYgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWcdf8b2PXJhSKoySFkI98G69xxcJ7S3Pa6t265Rgr8=;
 b=iNMsDhSDcFJW29haNSNvrpz1uzWWm31F7edHv2awyu65PiJGPDwvUgAIFx+3V1KPbaohQzJIAYtuwKJY6wj3l6rJx60qfw5pn74QXpM/tFJuyGML3rzQ01ZMOK9twlF0v+UdJaoVbE/KMiSOwvei9tM/fAGc3LWS/dibmsXtV/vUjxgc7WuuZRpVPQw45WVQJHOJNtROFq3sjh84SphoTU0EXEYC266Iou3L/c+GzzgYCqhNvSjCpRFF47nCdg7KulJAjtJV+PyKEgPL2bGhrM2VoR5GJH4F8mzst3TGyaKGKlW7RNtQqKnpUn2ByPZpbPsh29xfYWSycR0LIfylIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWcdf8b2PXJhSKoySFkI98G69xxcJ7S3Pa6t265Rgr8=;
 b=WgiIVO1UXhBi2wF1FL0OIzLIrcPlRIUzxqq8jzj+eurFV1SICLCKv14Se5ROQtRRiVnskylkn/kHzDhGIYoErDU/b70G6L3Z6odumY+FWGiAdLHWM9SOI0p10XRW0ARet4Q3RqUcdPctX93tyUPz8P8+ALkBOGHliuW8i0zRvouQHeAP47YNQ1XorGDc3Fy0tIMCx6/ycDEZvNKXj+1dFIC60vw+u80a8BJlscrlBLbKAFOiq8lALCZtbxRGElV+Dhkma28O4irjJQZGSkU/Vk71iJWUKe+FZ5uHDw0+08H31KNwbGOIK6pPiy7Drnx3zOSGvqu6VrMg8NDH46gU7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:06 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:06 +0000
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
Subject: [PATCH v2 01/25] iommu: Add iommu_ops->identity_domain
Date: Mon, 15 May 2023 21:00:34 -0300
Message-Id: <1-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0008.namprd15.prod.outlook.com
 (2603:10b6:207:17::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e9d00c-c908-447c-3db6-08db55a0a28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ue2UffKEUiks0dJG2SUIzRUIAGzBWU+VIfO8k5nM+/R0QMQLKlgwfBmTshrId+SnnTnBgQLnXrw6ZdSrQ7oU4150kr46T74EGLmtZr3e+0VT6NReNHFFJ67nCJELlJ5wAOj7Fa5ZGU9vTEWqRgwF6IG6lPoelowcvdJN+m3o5gNpjZtQSj9NmE/BvlKZ1NDOLjhdw9GTYh96BjgqDOoOwqkLelPbGRW38Q6qSENsdxKiZOclv2PVTNSxZ2qv57GHvK/Pq67wHi+yBfMp8IeuCteFaJpCLWEuJTmaLMZcO4aHR6EHiq1HvVwbaiLdsk5KrqCpn/t6Oego23YPJgwWlXikYNiPp4hDYQUsOpaO7iDFmU0BBaRCQ2a6QpaYt+VUQEP0gGpGFLbksgyi3jzboKnetldMEiECcUIV8lkFrU2K9gKvJzTXKor/ty+QfTEFitScjqLi23xRQLUnvf5FsH8KFPLa/2g21dI7dVQHvQs6Br2zGeVk2JLfgMoC7022vKwkIpyAuU3J9fd2cfAiLHdJBh1nqDfATtZI3c9hLPlY71+uaHrcPD6Qxmn7YtJVoOdC98F5AHVUEHqnDwR4SVbbtU26auc6VBEeFBJaCp8InfIH4GY+XNvMhlNSfHGB
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bqL+8IOMxhUx2Pk5TgX9lT9LWPkVdOPHsVYCVMCiVrKx8crnEPl2V9K69ivV?=
 =?us-ascii?Q?lav2sJSi5Xg9SkXMeDTpxBoNw8YacffO7//0XviFvn0dCR/EDDLhz352/L2+?=
 =?us-ascii?Q?iDvZh3YG3+Cy9E5Knw0+DYI+Ie4/R8m0i9T3mWX1ueiFRKYPBG/dKrcrvF1R?=
 =?us-ascii?Q?y8meLjnL1q7fzeW6A8cprTgeyzytHMBUNPSmeGWrYsrcUtATDvgRq2oZXQXO?=
 =?us-ascii?Q?sAOyRwCoFOS3e2By2LRIjqeU62J0RfP5zQXOg0SnDn6gUuPjKRAE6uyXIsQN?=
 =?us-ascii?Q?HVLpu7sYoUja1JZuMGWWnF73LdOd95k5e6f6WD70+vj09whrK5eBSebuHVie?=
 =?us-ascii?Q?2MVkSlU40dxAsHMJs5b++8TwGpOuB4X/Ovmk0Optxq2b5kqkJWlgtWoWoAol?=
 =?us-ascii?Q?7LuRiixC0zLJ9sYb9Ga41obIxnQ9Vr1Go/V6ZRKVDMDM/pV20bnv0vhBRwMM?=
 =?us-ascii?Q?+LqwIa2pIrVuWlf/yipwwGdwO8gvp4HlagOxXnCRvGTHJ2/S5RxhgcGi5y6i?=
 =?us-ascii?Q?YZOU6vy4nPTHa1mayt9y67eFDkKMlFWksXqKVpwID9BKF92COMgBHE3dyX4S?=
 =?us-ascii?Q?I99xhIfkMywOt2KmcjfkLsr2/dEkfENBxO7hzotlVZlCWa3W++fxC3eCWr8G?=
 =?us-ascii?Q?dlVMQ0z58T++8Wj5d35+3HB5ZGmt8zETPTJkSn193PoQXaogQdJCrWE1Z7xl?=
 =?us-ascii?Q?k1VnldTwLZncw7ahaRQa7ULTVwG2WA0v1Jr1qmkqCSV4GVI3b6R+R5Wp7F7a?=
 =?us-ascii?Q?ajcbE3zrJtTd/Q6ISTNeeO1AC9Dr7eHJqWFvC/EQPp4Uh5TyXAfrShIweqmg?=
 =?us-ascii?Q?mr8lJBljJPpSHJyEqvasSCz2DEuSD0LJtTO2bJrrHy5RYa4HrDOFXFHgp9t9?=
 =?us-ascii?Q?hS9vVumFI7GPLPUjvBX3RB5/SmXpxN6oYgsufOp0m98HrpBcYrSTHUG1c5nc?=
 =?us-ascii?Q?Wj2/JiuIkJEXWviSkcbAx1dAVVY2GRtnIeH5r4BWCWfWAavbHGADnOnlmXHR?=
 =?us-ascii?Q?zX/Q0pC/O7ckHkVCtFHdEFKKaDiZXxfIWPb9fKeoT2sBapKrJPLg/PZTYjCp?=
 =?us-ascii?Q?SaVDqW9oifWd8HRMOUZHIvAvChGKXkCInktCUODOWGp9QytFQwotBhnJx6BG?=
 =?us-ascii?Q?IInAY4Nno3MJ2Jq8td67veRVNtS6MOagGPP0aZO7iaOETjUl49uw1Tv7jOwp?=
 =?us-ascii?Q?5U/SJeFLKmhQBwqf+2m39jQX618NzLWyOYL+6y6RaA3SHf7esifdnpytctbR?=
 =?us-ascii?Q?yGIXtbGxcvaPT1j8IM7yr2nhQkWJUktggmH4LTngLYnA/qvvyfOvBEziKXx+?=
 =?us-ascii?Q?suBv5spReWrgIhkIaHl6kAySFoGgqvQTIVHsOqnW9/64JpqEyW036z2DvJQG?=
 =?us-ascii?Q?pqVU3smE4kRn72z4hfy8R2XjPd9aCOGlLMyBqqrFrKXfSmyeZgECSRGsIdJw?=
 =?us-ascii?Q?3TJ+rvOcvhxNojJ/ZV2cpU7JJlsXEMzw9D/Cf/IVQVHV7NO7YudyPshkzDCj?=
 =?us-ascii?Q?NbT4sepcV8GWnJ3c2eExctwFoSmHqGPSrGgxmdjRBjcnxD+1mc8c807x/gbx?=
 =?us-ascii?Q?615szxhszd2uafhXRRepFq6cmvJk1yFeZGXxywYK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e9d00c-c908-447c-3db6-08db55a0a28a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:01.6177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4d1OR07r55aZIhwG6wPW6OB0c07g2sNbM8GUJIT6IieCXT/iuqi65yb54CEaUUqT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786
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

This allows a driver to set a global static to an IDENTITY domain and
the core code will automatically use it whenever an IDENTITY domain
is requested.

By making it always available it means the IDENTITY can be used in error
handling paths to force the iommu driver into a known state. Devices
implementing global static identity domains should avoid failing their
attach_dev ops.

Convert rockchip to use the new mechanism.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c          | 3 +++
 drivers/iommu/rockchip-iommu.c | 9 +--------
 include/linux/iommu.h          | 3 +++
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4d7010f2b260a7..e02bc94a6c80cc 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1916,6 +1916,9 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	if (bus == NULL || bus->iommu_ops == NULL)
 		return NULL;
 
+	if (type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
+		return bus->iommu_ops->identity_domain;
+
 	domain = bus->iommu_ops->domain_alloc(type);
 	if (!domain)
 		return NULL;
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index ea5a3088bb7e8a..ebce56d6e9c634 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1017,13 +1017,8 @@ static int rk_iommu_identity_attach(struct iommu_domain *identity_domain,
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
@@ -1087,9 +1082,6 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
 {
 	struct rk_iommu_domain *rk_domain;
 
-	if (type == IOMMU_DOMAIN_IDENTITY)
-		return &rk_identity_domain;
-
 	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
@@ -1214,6 +1206,7 @@ static int rk_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops rk_iommu_ops = {
+	.identity_domain = &rk_identity_domain,
 	.domain_alloc = rk_iommu_domain_alloc,
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e8c9a7da106096..2823b0b23e6cb5 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -248,6 +248,8 @@ struct iommu_iotlb_gather {
  *                    will be blocked by the hardware.
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
+ * @identity_domain: An always available, always attachable identity
+ *                   translation.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -281,6 +283,7 @@ struct iommu_ops {
 	const struct iommu_domain_ops *default_domain_ops;
 	unsigned long pgsize_bitmap;
 	struct module *owner;
+	struct iommu_domain *identity_domain;
 };
 
 /**
-- 
2.40.1

