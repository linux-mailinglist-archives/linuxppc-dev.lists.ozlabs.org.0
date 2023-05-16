Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB0704219
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:12:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxWk14cPz3fpg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:12:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fVZ1DJHL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fVZ1DJHL;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGz0rbMz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U64jkaI042/ABdvRrFvjLtes1cdyQ3QtgYQk344yDjipTKSiAakOeETGxotwFjM01B34xbdSDmWbF1NzBBOsdLsON6kBSpwwN8FxvqnpolA+PiWapx1jlZjOxnnW83fBjFKogjF7CocRf6zjBERi6bg8S5VUN4zxIR3vBa+Zs58dGzOe4gl2rQX9C+GrleqQ5gxeetG8U5vDOmvzgPiFjNWm5x9DEcQuUeYQO4TIKnB8Wyyupgh3jkgK/73Wm82bznBVzc5mZ4XpBFqWyBn5Xbt88VdcHJg/Er8t4LdH1c9n4DqXAe9TKG87uHIV1M2Cw0viazgAmDfjsuVBfZDMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWXa5iPUsdOK6aga88CkdY8DnvSE5VOlKfKrBPcpAvo=;
 b=GDLmZ1w04Q5QES7TLGeLAl80eWqByP/cYJU/vMl3Qnq+sB3kkhippgjHWuCdG2gPLXA30oLgJas8jIMf6sXpUGBe5dy+m/LZa3tNanZp3VdXGnuKv83YeItXpJdkb/Yfs5qYNSEwfdCSXOwJOUF/UiG4mqifs8MZDQdZtdRie4ZZs3RGtN0NKxVwLf6U8wDubiCjCy7mVjnuh7UiNvUEFRegkZtDhXSAVUjLEbHCYS+RCoWJ0aMw2PtQno17Tq8NC22J5rPBa32XyGm66yFvDWt5sIXEHGLy0XHP1V+BSXfW8fXP2NAe1/zlEmDeRIiFBXPoyFnXaRV3mMlbCHFsnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWXa5iPUsdOK6aga88CkdY8DnvSE5VOlKfKrBPcpAvo=;
 b=fVZ1DJHLJLUzvMCq97mTY1CoBS0YUlvv54n95q1gSMddf37J0AsCB45vH3hNd6Z2tkc6+LF4nJFgbCkf5kLTGW+f5VqXf85aRSWIwBXTbOBFHOFh3UFRgETTzWqvQgJA4HbyMqIcnoZuMc+gDHaCy6sKm8UN3HalOw+tV0B8sqBO3zt1GGcZpeifynejp1Jhzy59YvZ7EgoBdWXpMJ7uYEHa/+3tFs1c6hzuf7YCoLFkyQez06YQgTTP0ZwGCTRcWthiCoFiyvywnrkQHrwpU6fd88MAeJl/PRwVowh6pxKgUjNtMbktKX0g+BHWQUj+kQ0atgeK/yJ9yE/JdRXiRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:09 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:09 +0000
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
Subject: [PATCH v2 04/25] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
Date: Mon, 15 May 2023 21:00:37 -0300
Message-Id: <4-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:208:239::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: ef50d403-0254-42ba-0e21-08db55a0a2e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	EPlQESXF9pteLqRFabdpqjgvHHuZ1x5Q7xj9S4Lvw0CdbpaDiYawyXhPYq+Lx+/ADCmU6iBJWCakladM6hgeq8WIMAoQx1BAYXmKUydGOn3UOJS2XsNYWfUIp0BRui6eIVWlxuPt8Z7FwN8ec2Q2REiQ2yTMd3DUxoMiMUds3773jCxOEj/UHYCVJYHqzeMol8WsDSMsq/Yw9W3bnaW/5IWtCyKIC0bZQHLrLSGzFED4aKpc2cMOhposd1/GrUZwsJ2hdboEURxZ0v/Ic0dSur+YWXGpwJ/FwAiz24sEtWSQmI83qOOexFMb9tcZU/J8iNQ5LvOSaKPYMZWG1TWPfPZyAAOos295TmkCVdlVUFUzJtOLOfQtVKTp6Hz4996KkHnHVTUFvZWN5JBU+FRbfT5phVkzKYoBk4ztLupkbIz1KMmigO1YWWzoypocdmW2zae4yPyAsP0VmmHMH8wc8zdMSJwxSm1RxEqk+ZQytl0vgLHvtMOEHqidOvHNpkrBcxR5GTUaNKKqQmR1zOz6iJm+FACFfNYnUOc/kIURD7DH2sD0wdQDwtiLa5muozvNZcXgIsx0hbfVFZyjbdfAKsR+lJhsCGxxakQummqL08DeMH0RSy1hvbH0+EldaJPc
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?suxNupL6KWq3a5HotL/Js9WgE8nVqae7BgcoRJzOAdggcNHmTgmU5vnTG/wX?=
 =?us-ascii?Q?ulFSIcvp8ok5o4BWHn666nr2cAw4r79qXxtp+g/aVn25bMzs+rIAXCqqjLif?=
 =?us-ascii?Q?ytDtI+hZDVWvtaxw+Jzbn9G+u2lMC1jqqNQbGN7TPS5wQyIdn6wfrYFIYtnh?=
 =?us-ascii?Q?yuj3BBPLSNhpeTwtJ+ryIpCHIlcVU0MVeHsprZBOJsjdzJqdkLbGdDE0XW9e?=
 =?us-ascii?Q?MywVt0Pxmav3jiFtOcvRaeII4BIvoMuOWerSLZ17mwgE6uAIwUMtfwGYLwf1?=
 =?us-ascii?Q?FMfXLfxewCaH9wtVbfFFoURQvXX1sGR11/NIsEYxWagpxhN2FJ+AXWspRJnB?=
 =?us-ascii?Q?kupnzlAkf8QZhVsxYJJ7eYRWJikNla0F0tRQZzSIWz2Tqr0hh6FVobKnzVGm?=
 =?us-ascii?Q?nN/kaOHWcMIv4YILR5Lb/8jIU198eP76QBs8nlMfizANf+eUoyuaB0LBYqdH?=
 =?us-ascii?Q?xpXTj9QxMRQD/9Vbx8mh1Wr2hM5LC2Mr976QHjMiAfZzlQQCIy1TnIt61Ccy?=
 =?us-ascii?Q?Mljm96khEixX1XBt50wqSJ1GhFf1hO5N80F+ZmI+VimuYo93KL/AXkMgy41k?=
 =?us-ascii?Q?5CdhJtMYKxUgJWRXw6wxlu1MaK5TcdMNs1+6Z9kEBuQQIi0MDlQBnv8K9jnZ?=
 =?us-ascii?Q?buEJ1QI+Zief8N/x3oJdeVGFr5vxAMphxPPnyq5mloeoZo8MqSnzCmYJqL7f?=
 =?us-ascii?Q?F31X4ykUWrmSrqzhZxo5E8QGlO2+H6nVg563OlCCoxV8zUeyYPvYwAj68x84?=
 =?us-ascii?Q?hA6NAmf1PlYC+gpZqotBBadoN5gtxDOo4ptoxjub2HSLvtBqUiMqLKagC5HG?=
 =?us-ascii?Q?oCKbdbfaedf0qQbAt22IfuUkDQ4f3tLYv2k1FkfgPDKDjalPMzb+khGkWvzW?=
 =?us-ascii?Q?lHVQ0DP+evwSpPaTpeBZwQRt5JmGcddTwlst/kAuX/GflMOp2zcXY1+TMo7h?=
 =?us-ascii?Q?EREkVmtJnxRfAX+OC1Zy+hvhnp4Ygt+DEavvG49Jk8G7cds4AOleyWt/aQ80?=
 =?us-ascii?Q?OKfv2wGLSKDyd5lyVnrqJH2/K0ZTq6XfLM/0dG9lrGtskfKjLczFlaSO7PUm?=
 =?us-ascii?Q?qFA5s8Sme1/FTfE3Hf2uV64JlyPa6L6p6AeTPuma+JLLtkpRo5fChcyhYI7S?=
 =?us-ascii?Q?aSxf4V0ewPLr0KDQZFY3kkyVGbjNBFtut9Vwme1CqkSJQDKyga3M4IVyDjrl?=
 =?us-ascii?Q?byrSteil14ninqbKIYK7LRpylaxdvPYl+fDrrtdHv+OPowcml2JRmNTVwYZi?=
 =?us-ascii?Q?RqOlQi/YSFO8gkMz1+nZJ7uGbqEpBQS8bVNfnkhk4Ku/w/W0GnVxIo2TgZmA?=
 =?us-ascii?Q?PjzPX7fVrOt9ci5EApXg0BThjyyUVeaDbFWZUcMIMZC6dqWIAps/uDFoRZUk?=
 =?us-ascii?Q?GhxV2oSn+0QKXM+CT9iDjocPnYgP3SbSSI08HcP2BJWRaD+qvEKHNMRqmjil?=
 =?us-ascii?Q?zWz7vyphoDLiBSAjbsWt90U2ZbNcjmRl7fAi0dSvnMG3FSq8EtR+PbFtyh1O?=
 =?us-ascii?Q?6myV5XoGdZzPgp3yhYSeh7hZF2jFnv8IxzKN32XqN0JFLykWF55mg2Snf6Qg?=
 =?us-ascii?Q?9+gNgX6FhaMYADchXUAXnm5HWDxXK0mKGCFr4BgX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef50d403-0254-42ba-0e21-08db55a0a2e0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:02.0856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FG1kMtQCpJZq8nk2Hn71dcdh0P8Y5DvgoDvsxLklT+XFdX2KdQp/At9oa/KaMh4r
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

The PLATFORM domain will be set as the default domain and attached as
normal during probe. The driver will ignore the initial attach from a NULL
domain to the PLATFORM domain.

After this, the PLATFORM domain's attach_dev will be called whenever we
detach from an UNMANAGED domain (eg for VFIO). This is the same time the
original design would have called op->detach_dev().

This is temporary until the S390 dma-iommu.c conversion is merged.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/s390-iommu.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index fbf59a8db29b11..f0c867c57a5b9b 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -142,14 +142,31 @@ static int s390_iommu_attach_device(struct iommu_domain *domain,
 	return 0;
 }
 
-static void s390_iommu_set_platform_dma(struct device *dev)
+/*
+ * Switch control over the IOMMU to S390's internal dma_api ops
+ */
+static int s390_iommu_platform_attach(struct iommu_domain *platform_domain,
+				      struct device *dev)
 {
 	struct zpci_dev *zdev = to_zpci_dev(dev);
 
+	if (!zdev->s390_domain)
+		return 0;
+
 	__s390_iommu_detach_device(zdev);
 	zpci_dma_init_device(zdev);
+	return 0;
 }
 
+static struct iommu_domain_ops s390_iommu_platform_ops = {
+	.attach_dev = s390_iommu_platform_attach,
+};
+
+static struct iommu_domain s390_iommu_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &s390_iommu_platform_ops,
+};
+
 static void s390_iommu_get_resv_regions(struct device *dev,
 					struct list_head *list)
 {
@@ -428,12 +445,12 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 }
 
 static const struct iommu_ops s390_iommu_ops = {
+	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
 	.domain_alloc = s390_domain_alloc,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = s390_iommu_set_platform_dma,
 	.pgsize_bitmap = SZ_4K,
 	.get_resv_regions = s390_iommu_get_resv_regions,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.40.1

