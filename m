Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA1079EA36
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:56:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=al8Zb6Fz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm27F30hfz3g8c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:56:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=al8Zb6Fz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::60a; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s62cXXz3c3P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJEJENjvenBQ+v7VORnE+8G19tvizkeiaueGQXHCCh6FVXzMTlFV0S86vFhLUqRFus7WNnI3tpYsb+WI3z/1gN7aVVg713mifMLk07Cw/C5dPZy4cWvkg7AyJ/cO645eeMWIskuWMssD++ElKBnPxepQU2DDDq7VsZLY+R+o1cfXZC85AKoiYS8EnN1FaracHGJtMH1+7WhVjautaZ9obZfPz2gbzaLFudl/T4nTxATOfjlQqZymMIuNgRDlHnxElH+dQXROZjaKkmhMfM0B+gXe2EyWlh3aaIhYLtDEv1qJmjHaxFM+xJoFxNRLISr2vyJkw0p6jjAGc2vvdiEJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnaNGntUlSwLAGnPflOZxkApEDiDVtlv/h2EH2VI09g=;
 b=eTWId0kHH59fR5E5Jk87RkA6DVKEJSF0GRe41T6JKx1p1Rmtgo4HLYuE91DkZSKJ2yaUBL7li6wFdlMsz/3Tjn0kQvQODiQzABCrG6Ol1jqC3zHy1Of5M4wfx9hwDm6753vT2Bo1P6UVBJgyZbIHaZoZ2GX42JZ4Dcm2xJlcVceTa3c2SOEu2W311X6+t6ZBZDSIhbXhlMspjfPlClBLdnS21o1rfN0+d0U3R2RnQKtO+qAsUvDHVGkHgjytzyPDmZ7VlD8up6y+dCVEbk3EaIYXhgiNU2BT2TpTCpEgS6Y+zZ4bVEr14w969YeSB9PJhDddKGLxJGHLCzy/Hp4YiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnaNGntUlSwLAGnPflOZxkApEDiDVtlv/h2EH2VI09g=;
 b=al8Zb6Fz/FyaKLEiooTmsIy9W0wZXOkcsE2LE2xyftZs5s1wcWz8Kc+Q3w3x0YPOUQOOg4PaJbHeA0NgF+4UQuX6PNLbZHjeNbM6XYdKYJEi4RPiTIasASaZtzKD/OHijS8KRo30lIU1U5Q2RvkS6mN2D6l6lOyqTQxn8Ij7SggwHPt1JsbBg2DEyo629yHv2E1XmHILE8Zwi4rUS3WbhtBcQOMPqKZR/S9mvmQzFDYMeL8/NfkxTlePR5zjLbULmBmXee0qdKQTKqG5zaFw94akaTeZUbgX5FliK35PLsd43NHCk8EaXCkaYVOtKwF06k5prvNO0KzP6VTU3FXbAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Wed, 13 Sep
 2023 13:44:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:02 +0000
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
Subject: [PATCH v8 09/24] iommu: Allow an IDENTITY domain as the default_domain in ARM32
Date: Wed, 13 Sep 2023 10:43:42 -0300
Message-ID: <9-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0367.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b97ed4-5810-4af4-9f68-08dbb45f7bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bWQ22jPanpM3yCnTnj0inlmV7p73ArjgDXoNk5tGXQgrhT+L9ctrf/DiRX2ypH2bUHgnMEQSIbbXr7fFW3G+23WhvoQM8ytyjQiWfLXA+Zdl7n9DivUDfv5DOZ2ywXqqKEldk02WNX4GzLhXvdLQmxpU2n+LiTL9unh0n3+mB5Qx2YXJ5GagK85CKDAFj2wDuNhClf77A2p5nyEniu3094q74sa6PXrdfTaA00qYjYLyDF2xkY9TYNMC+2eDQkRTNQzZ07aXGI2/PVj68bYe8i5C+wbgu1gnZSAbq4+t++NSniYPlHzrUwYnRfZMJaKiGI+WgodloPrRGoLORAWhTS5yUKTE7o5u8WlwpYIY8pTEmBWwmzFuuP/WSx+NXYMkowSopikRV31F4z60ZSvFzU/Iycc5VsvJUW27V4BA8JPT5ZWrubi2iiJB/EFoFb7cTnQ3HgJzJgi+djV3bkIJ3R/aNV4srC2TJVyQKlVQj/+9tSCKaqU52Wq9l37EVC31ZW3cG3pi8HHO+WPkehyW5z+5/1nZ2QVYztFhIVNdXwqotFSvKKGhcIHqh6w35595AMqGNqaRq7YwVdqZzk6+hIpt0oVS+olnPXmFbClL/avrDPfAXaVhNOAjhdZdrPl3
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(26005)(8936002)(8676002)(4326008)(6666004)(921005)(38100700002)(2616005)(107886003)(478600001)(5660300002)(66556008)(54906003)(66946007)(110136005)(41300700001)(6506007)(6486002)(6512007)(316002)(66476007)(83380400001)(7406005)(7416002)(2906002)(86362001)(36756003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Q9iLRoiSmVwJMBATS6w+SfO4weAnEEarWi3Ti2o4WTqEntqsyanwlaa8nljE?=
 =?us-ascii?Q?gTFmejvx0EUPf1m2T5P56KD4F50LHjg93tcdbg+5GaQsOAFGkOJlHI9jaRyF?=
 =?us-ascii?Q?bvxx8HXTd6N8W/9tXIpjqBYiJd2w4Dv5kTpreeQhzxvCPdPZxV0rp/OzmHld?=
 =?us-ascii?Q?TbID0QadYrJ5CI0g0V4l6nNmqXHMsXOOOqnyt1j+eyoBs7AyBOXPdnIA7d7Q?=
 =?us-ascii?Q?Mq+0ajGSQqdY3dIY/Cf31zCqoMy/DW86/4/0zc+0DHj4JgR0lQ0ranNaDWji?=
 =?us-ascii?Q?ZnAZUIZGByCexLXQ6E50u9nDPIb+r4x7nPY6O+zIPD+MZz37SgzDQdNLg9uE?=
 =?us-ascii?Q?vXURzTEEVW4gclBwsf5+9oP1AOtiiztELa/36eS1dz2HfyuzC+2M2p4vT4Go?=
 =?us-ascii?Q?H4m0wCSPy0zXbeF4vmC3/YKZ7Mt2F3Qa9HFgkPVjGZgdp13iFTZL137bqyd3?=
 =?us-ascii?Q?C5lqkJccs7Ww96VzWHyyLFQbl7UDuBdwgFHoTXBziAIL/xzGaY3vux6Wi7Qo?=
 =?us-ascii?Q?S31//e2H7JpYD7sGU5BRPvcxc6pMaCjFvQMA0Tr7r1Qkbq1sgBni9JYhuN1I?=
 =?us-ascii?Q?W1PsrAo4qz0Hb9Yd0JVrQjn4NaR30kUSEKdEJsR52EWU1dPOulDlO0yw66Qx?=
 =?us-ascii?Q?8nof3KjhKXv93bLPAVh/kWmyQVUBYh4vfL9sGLrs0stKZ3kNmCp8NQH/G+99?=
 =?us-ascii?Q?Z5Wb98A81QDc2Han5SQPEkeJetYTtMDhE9VEVrFCyWVe7JQDwNGELGgIdG4L?=
 =?us-ascii?Q?A8l+t4Lpoac9412hRK8BpCvVwi/WMDQK/ZY268nq2/1WzDkeRVUsS4f8NO8O?=
 =?us-ascii?Q?VupldpJlTsdVSu0VLm2UqI61HhmOYKOLoqaqzmHrjzSlAZHyLyLwXCMBc5xw?=
 =?us-ascii?Q?i5hGhmIyP2Qz1qPZj9fWXTOfyk51ZL77xT/qB6reKYTBrClRwCipV+p4Zuu2?=
 =?us-ascii?Q?C0kkXfscwj7062MVzG97UD7tuIXMETOWW8gMEgRsRj155pgYSrpQLFrqnqye?=
 =?us-ascii?Q?vK9XKZfqREHNF6IPNL8olap5SbVqFGnbbzZb9KWUXSuhkkj5fFJdt1kjlOot?=
 =?us-ascii?Q?AUDmhJaCtY8CkjjqtWikpwGGyCxM1QmldmkvRRkFH+7XmNuI4+G4VyMsizOO?=
 =?us-ascii?Q?uNX6CxPaK/PEiuHG9mDWzJFICMMSFXF4GX9U4nh2Vy++kcIEss3rrI+NfjDF?=
 =?us-ascii?Q?LzRopTyi2U/MpcPdK8FpwKP5E9YGXOpNMyKeDBSqXUvpDDlQuaQOVgvjw7md?=
 =?us-ascii?Q?rrHaWWI5nBhHnRWdy4iKxaHFIxRVMUhCFbNQql+V3Twc8oxTCNWa1ODieILd?=
 =?us-ascii?Q?yKMlXuhHLmbMfaELN8TpMfr1h0eN9rS44yvz43vYlOITkThV0niGENuVGpWe?=
 =?us-ascii?Q?nFRaNvJ9yti7N5dzW4iWHBtPMTzrkzSCQwrYE6351Ul0ScY5+qSA3mhhEqQw?=
 =?us-ascii?Q?ISeAmTlttgBd4/xdFrRj3afE4KmIcAZlCZzDsOWBa9WePRSnLRa28J614gJL?=
 =?us-ascii?Q?e7OS9iTbEhyE8R2QBee06qwWVf3bZCf5txwwMjxTc4rIs5q+7duxnEOzmcvr?=
 =?us-ascii?Q?YQD5EC0ZDSUhu70+dWXahz2m6a6L7nvBF3Og9PyT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b97ed4-5810-4af4-9f68-08dbb45f7bea
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:43:59.9645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFmrttLN8HQldTotkOOY3+qhf2u+NoRTR2QMysTnZf9SwmmPfCvOxFkH3pp3qqvu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5096
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
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c          | 21 ++++++++++++++++++++-
 drivers/iommu/mtk_iommu_v1.c   | 12 ------------
 drivers/iommu/rockchip-iommu.c | 10 ----------
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 9188eae61e929e..1efd6351bbc2da 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1865,17 +1865,36 @@ static int iommu_get_def_domain_type(struct iommu_group *group,
 static int iommu_get_default_domain_type(struct iommu_group *group,
 					 int target_type)
 {
+	const struct iommu_ops *ops = group_iommu_ops(group);
 	struct device *untrusted = NULL;
 	struct group_device *gdev;
 	int driver_type = 0;
 
 	lockdep_assert_held(&group->mutex);
+
+	/*
+	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
+	 * identity_domain and it will automatically become their default
+	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
+	 * Override the selection to IDENTITY if we are sure the driver supports
+	 * it.
+	 */
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain)
+		driver_type = IOMMU_DOMAIN_IDENTITY;
+
 	for_each_group_device(group, gdev) {
 		driver_type = iommu_get_def_domain_type(group, gdev->dev,
 							driver_type);
 
-		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted)
+		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
+			/*
+			 * No ARM32 using systems will set untrusted, it cannot
+			 * work.
+			 */
+			if (WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)))
+				return -1;
 			untrusted = gdev->dev;
+		}
 	}
 
 	if (untrusted) {
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
index 033678f2f8b3ab..a582525d36f8cc 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -998,13 +998,6 @@ static struct iommu_domain rk_identity_domain = {
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
@@ -1183,9 +1176,6 @@ static const struct iommu_ops rk_iommu_ops = {
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
2.42.0

