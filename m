Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C092772A406
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:03:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBpV41Jtz3fyH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:03:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dXF3PIdW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::61b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dXF3PIdW;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfy0VBqz3dx8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mokWQe8AL5EOXRWdd0zux9kbwe83cckXMHBHGaEiIXXOsCvSrdSqOsqwH9eNKVXnmEr2ZqXuAML+vokYKNFNIAO0mjhWmF+h1lZkp07/Jdo2pva/YN+DiFP7BCuOSc6oVlXmAZycHi9IHK2DIjY8Q+GEwNkvG7jVLaYLtuWay3pgsQf4A25ln0iA1xBv/uN6udpJlMKURV6qEJ0PKT9nE6YlaB7RlTMV2J7BBSW4yLhIxV0xEcMYMgYwOoyuLZGK3JTpcZqAWB1fMIJD0gBrt9yoQXL7O/gHSN7Tn2IBFJXnRCcF0Wq8cMBAevHkPTcx6l1U5PZ2ViVoTIG+lOZPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcLi5FVNpllgaVjruqTdAdysLAYv9WirjaaTtSVFkqs=;
 b=LJRVJ3xUeTsasw3Te3A8S0nl7tcUv8Xo3BOsV86mDfS4YjrrOvjYNJ8a5QItYU1Oh7aFzOvkGDZyArBBhFQxhutfZq+Dtomf8pn8vOEAaAPh33Aupcjdd+wflEATY/m6smZD3nCh+lZBEioiCUIiPc9Uc5Dty/7P0kPTJAIf4eHpt6/ry62GK96U3RQLj+rT1qI/T81ifTuzlANxPK8xZDw0cRGMHqAyMloW8+K2IFX29b8OWY9Ek8cGEUTdcI8fz5MuME3GlW8y+E29imV+UKI4xodo3NiJI1zmRSeTeE2ZcBF1OLSNOw5F8mE4i6uaW5IKtkaXW7X3FxdJGrh1mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcLi5FVNpllgaVjruqTdAdysLAYv9WirjaaTtSVFkqs=;
 b=dXF3PIdWqQXW00wnh/Z6nuFCqArKx5oHtYxUXhxpjV9xf59xj+GRTDC7zgtjTtUgSUd0isb2nWTyZpokb7ZUM0XfTJi6gfnlIGCkExxOH3FXRgQ7Po5HCwJbTw71eNI5a5oPK2Jyv+GKCYGZ24EDDp13DzTKnuPDs2QuMiCSHL3nkRldoxuuOf/XtsIDUq4gjCu7HbYYal1NX/DM/RR/T2THyslqXX2RAjUcbwPGzBOdSc0Ov4b8eeCIaxypWf36lrmnIHfYgeS2PYu97UhmQ5TwHL/6REIPaSM+VdWgk9lQW5fkQVrOJUsAoRBL65gVcg73S1NPVOSSkOu5z7v8Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 19:56:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:18 +0000
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
Subject: [PATCH v3 09/25] iommu: Allow an IDENTITY domain as the default_domain in ARM32
Date: Fri,  9 Jun 2023 16:55:57 -0300
Message-Id: <9-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0145.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::30) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f25a15-9d13-46fe-9c4f-08db69239624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nDaKMPWjiaT95/AsCLdaXEi28pwtBBLpicIpPvvi/HwUTiwoXLGkLdUoHv1j3PpYLhlPZDbAoRKSrZwy7Q6pz1X4BRUKSgX9SO4KD5bz1HcPG09zkgMfGcpvZ+H9vbY8zFkjb4LCc6MqGO+dw/nbGeagocWj9KMplRqWvgcNH9dEf0EJK6ZVtu/I9L8RnbRu/kHsyjChGa1z/BAE9YL4As8FfAXcz1bBNOk/TiMB0AmWnuwZxNHDQOwckRoiYVvJ8v4jVdD76T8Re6x3u1jf6ap2q8lm8AYjQrzMtCyqABs87nUaN9/vzABRvbFlRVA+z6b3RkALNpoLDniOo770So1628i4nwNW7Z+97aCCr/1D0WxA44e7sT2CRkyhfYBCdiUxle3ggeRXZsVBZIozuzUZhXTbnzC+nKOyQAlIrnkXybThZI/3r0Hu13KdUfB2Hv9Tv6dKXSC1pFTAZux3CtfbXcz3w14RvxV2/66bktgiJFYfaUF1vRlRRIoOIuddZipgyJSEvWblnwzn3UybjocrRvZ+xl/oVMBrK+yvyT79BryqqbaTF8056/3QlBdyMfD8jFoSSUcYM5tQsze+iNj6P1XYprL8QYribU3GKPntraqpFdnKJcLgel46UJSg
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(478600001)(2906002)(83380400001)(2616005)(6506007)(107886003)(186003)(6512007)(26005)(921005)(86362001)(38100700002)(6486002)(36756003)(6666004)(5660300002)(8676002)(8936002)(41300700001)(66476007)(4326008)(66556008)(66946007)(316002)(54906003)(7406005)(7416002)(110136005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?F+G3s6iJYBq5M8b/EFjKQnJrOz7uomtyAtiTEvST9cxulchqf8YW9QBq5Ppe?=
 =?us-ascii?Q?uszpLmip9E7quY6iMobmwFQEPnOSfcasOcbEF74lH1PFRoJ3Dff6cjIgWsG8?=
 =?us-ascii?Q?1KsP68ScFWs2tqKwamWB8SXiHYc/slpJ25dozZXxGQYflLs/E6dJE5X7Frzt?=
 =?us-ascii?Q?UX2gvviTn6hQSc5BJChiGKg2rdb2s2+EG0QCTjEP5VlA9j/RLfkOBcYTI5Nf?=
 =?us-ascii?Q?u+V9nljROhxxHpeFWPf5GEgWpiGfTPWNSRLCqlKbQeFxxHhyb8aJcduljReD?=
 =?us-ascii?Q?NYSm+HSeASJza1dkYoLIo6uJcsnwiCWAO8pgYhbXZL7ss7zJKgLBRYI6mQUe?=
 =?us-ascii?Q?xs1NoATEto4FDOV0zuej7acZTT8XhL5HiiRgq7e58kaNALUFgV9Vz+J7r5fu?=
 =?us-ascii?Q?ew/xQNNs9SJdUYOf/2snywzaQ0bVq2QdhLuKlPUV/b7LADFPojQQOTj0a7ru?=
 =?us-ascii?Q?Mp+JvjHLmvksq1LehtigexsjmKDeKbB534NYQxDDq1byrCTrgVA8OqH9SYPq?=
 =?us-ascii?Q?Xs3IPSJaem7TUTyAv91XFLlnkxRr6moPN+nLQrnpkPwScRUWBdDLsJRt9b8P?=
 =?us-ascii?Q?Q5Stx1u65TluhRelDg5CtmOT2NRIxcqKIHrskwgOjlYJzh7RUbZ8g3/IvRsp?=
 =?us-ascii?Q?2Xze1wSC6Wp2NTiO9Ij7GhEBFrZTuPtAejvqGVdYyjTQ4SThxOJOlRViP+PG?=
 =?us-ascii?Q?/L6UpgDK8QIpS4GZNxZVpnozYQss+Hx2/jrT5XDAgdo0SRQl9kM5akAaYhfn?=
 =?us-ascii?Q?qfGLT5QS1ldlTSeee9akuGp/Vx3BOuR17luUP2M7ktowMpgblPr0ErK7BFwj?=
 =?us-ascii?Q?LLhN8ZuwVu+pngAt2PiwEDwZUOhICx5dblw3/fbxoCVo624onrB74/nyRJuS?=
 =?us-ascii?Q?wWHHuljBb9ARoVvfxK0H9jHlHcUuMUeBdw2fKHcqWzy6ma9j8RtDSwk4ClHu?=
 =?us-ascii?Q?GUEw3NY6Kvni+9D3D8QeectCrqO7SGb+WGzph4NfapJ5Ih0/PFDZge0BmQ7G?=
 =?us-ascii?Q?0KP6HbKoSFxMPOoC5NAni/wIYadU789yXJNItb6WiyIaRT3Vt18Kshq2JpQH?=
 =?us-ascii?Q?tFPcmffLlG3lnrp3V82vCp8zKU0pM0f9LODOAKMMXVxCVlQzfqJMmjlC/Gkb?=
 =?us-ascii?Q?xbqm0pTSvw7xT3P3DEK+yhr4HxeifFqBWWxC0igiGcS5nwZemv64J9bG12Px?=
 =?us-ascii?Q?0LFiCvZTpZd+1uyCZ2qmOjDXqAG1rq/C1HZjWGMpuOWaGrRCC8M1NkWNqhuc?=
 =?us-ascii?Q?WF8d0C+oGjdSBFVKnTtF0bd18mWtVEyX2GWZbdsMmFNvOnT+/r4gpNACgXZp?=
 =?us-ascii?Q?mOy1Bh6ns/XSi2/TnhUrrcgtFmGNYTomZWyF2aTYq/JAOPW52c7w66ZOvlsl?=
 =?us-ascii?Q?vwcRo7VkPCtVl+/JGyvfqH0Lb7D5SRgi/Noe1n/7VNiE32ntHwkAHgsY+rXF?=
 =?us-ascii?Q?clJ0/espEGK4E3hx2NwC6DOlcF2I7QEGw06vzrHYFcUKcLbqC3mfIM7mtMRW?=
 =?us-ascii?Q?H4YVyhB1ML5/yE0ElmfEZ1hOOtIgO5hRu7oFm6eyAdLoFY2hNykPGLcVHTSG?=
 =?us-ascii?Q?ekdWOw0xcgMCDYrr36c1UiqnXl9u0rqdwAOwLfyj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f25a15-9d13-46fe-9c4f-08db69239624
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:17.0319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oExenR5HGTv/heZdHyNQlj+fcYpDm8I69ikXiXJFcLP9GMBOYW5WkA1uPi0GT95l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7489
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

Even though dma-iommu.c and CONFIG_ARM_DMA_USE_IOMMU do approximately the
same stuff, the way they relate to the IOMMU core is quiet different.

dma-iommu.c expects the core code to setup an UNMANAGED domain (of type
IOMMU_DOMAIN_DMA) and then configures itself to use that domain. This
becomes the default_domain for the group.

ARM_DMA_USE_IOMMU does not use the default_domain, instead it directly
allocates an UNMANAGED domain and operates it just like an external
driver. In this case group->default_domain is NULL.

If the driver provides a global static identity_domain then automatically
use it as the default_domain when in ARM_DMA_USE_IOMMU mode.

This allows drivers that implemented default_domain == NULL as an IDENTITY
translation to trivially get a properly labeled non-NULL default_domain on
ARM32 configs.

With this arrangment when ARM_DMA_USE_IOMMU wants to disconnect from the
device the normal detach_domain flow will restore the IDENTITY domain as
the default domain. Overall this makes attach_dev() of the IDENTITY domain
called in the same places as detach_dev().

This effectively migrates these drivers to default_domain mode. For
drivers that support ARM64 they will gain support for the IDENTITY
translation mode for the dma_api and behave in a uniform way.

Drivers use this by setting ops->identity_domain to a static singleton
iommu_domain that implements the identity attach. If the core detects
ARM_DMA_USE_IOMMU mode then it automatically attaches the IDENTITY domain
during probe.

Drivers can continue to prevent the use of DMA translation by returning
IOMMU_DOMAIN_IDENTITY from def_domain_type, this will completely prevent
IOMMU_DMA from running but will not impact ARM_DMA_USE_IOMMU.

This allows removing the set_platform_dma_ops() from every remaining
driver.

Remove the set_platform_dma_ops from rockchip and mkt_v1 as all it does
is set an existing global static identity domain. mkt_v1 does not support
IOMMU_DOMAIN_DMA and it does not compile on ARM64 so this transformation
is safe.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c          | 26 +++++++++++++++++++++++---
 drivers/iommu/mtk_iommu_v1.c   | 12 ------------
 drivers/iommu/rockchip-iommu.c | 10 ----------
 3 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0c4fc46c210366..7ca70e2a3f51e9 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1757,15 +1757,35 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 	int type;
 
 	lockdep_assert_held(&group->mutex);
+
+	/*
+	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
+	 * identity_domain and it will automatically become their default
+	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
+	 * Override the selection to IDENTITY if we are sure the driver supports
+	 * it.
+	 */
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain) {
+		type = IOMMU_DOMAIN_IDENTITY;
+		if (best_type && type && best_type != type)
+			goto err;
+		best_type = target_type = IOMMU_DOMAIN_IDENTITY;
+	}
+
 	for_each_group_device(group, gdev) {
 		type = best_type;
 		if (ops->def_domain_type) {
 			type = ops->def_domain_type(gdev->dev);
-			if (best_type && type && best_type != type)
+			if (best_type && type && best_type != type) {
+				/* Stick with the last driver override we saw */
+				best_type = type;
 				goto err;
+			}
 		}
 
-		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
+		/* No ARM32 using systems will set untrusted, it cannot work. */
+		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted &&
+		    !WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))) {
 			type = IOMMU_DOMAIN_DMA;
 			if (best_type && type && best_type != type)
 				goto err;
@@ -1790,7 +1810,7 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
 		iommu_domain_type_str(type), dev_name(last_dev),
 		iommu_domain_type_str(best_type));
-	return 0;
+	return best_type;
 }
 
 static void iommu_group_do_probe_finalize(struct device *dev)
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index cc3e7d53d33ad9..7c0c1d50df5f75 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -337,11 +337,6 @@ static struct iommu_domain mtk_iommu_v1_identity_domain = {
 	.ops = &mtk_iommu_v1_identity_ops,
 };
 
-static void mtk_iommu_v1_set_platform_dma(struct device *dev)
-{
-	mtk_iommu_v1_identity_attach(&mtk_iommu_v1_identity_domain, dev);
-}
-
 static int mtk_iommu_v1_map(struct iommu_domain *domain, unsigned long iova,
 			    phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			    int prot, gfp_t gfp, size_t *mapped)
@@ -457,11 +452,6 @@ static int mtk_iommu_v1_create_mapping(struct device *dev, struct of_phandle_arg
 	return 0;
 }
 
-static int mtk_iommu_v1_def_domain_type(struct device *dev)
-{
-	return IOMMU_DOMAIN_IDENTITY;
-}
-
 static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -599,10 +589,8 @@ static const struct iommu_ops mtk_iommu_v1_ops = {
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
-	.def_domain_type = mtk_iommu_v1_def_domain_type,
 	.device_group	= generic_device_group,
 	.pgsize_bitmap	= MT2701_IOMMU_PAGE_SIZE,
-	.set_platform_dma_ops = mtk_iommu_v1_set_platform_dma,
 	.owner          = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= mtk_iommu_v1_attach_device,
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 4fbede269e6712..818748a76e2469 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1026,13 +1026,6 @@ static struct iommu_domain rk_identity_domain = {
 	.ops = &rk_identity_ops,
 };
 
-#ifdef CONFIG_ARM
-static void rk_iommu_set_platform_dma(struct device *dev)
-{
-	WARN_ON(rk_iommu_identity_attach(&rk_identity_domain, dev));
-}
-#endif
-
 static int rk_iommu_attach_device(struct iommu_domain *domain,
 		struct device *dev)
 {
@@ -1211,9 +1204,6 @@ static const struct iommu_ops rk_iommu_ops = {
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
 	.device_group = rk_iommu_device_group,
-#ifdef CONFIG_ARM
-	.set_platform_dma_ops = rk_iommu_set_platform_dma,
-#endif
 	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
 	.of_xlate = rk_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.40.1

