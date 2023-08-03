Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B761276DC88
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:21:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kHhcmsf2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTzh3zr8z3dVS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:21:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kHhcmsf2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThn6Bdqz2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blF+8kSr7VOcTeLDBtZyzRCwu4I5+hE14x/Cpr8ykeoxaORfLyNYKXslfcT2uES41zNb4RLpyw95y2eOSn8OdYis53mijRFPlDQO91/2fJeqWW/kd0H9Hpqbtu8M7wW4I/I7h7+dg3pm4QByjxXOxKM0jPSIMvv6xaZtEy62tV6GwJUF26GzrkB572heEX7S+IwTEQ6aJllG5bn14VxJXU0vAmYR/BnZLG21R/sfp8vm4po5Wd6qP11fspwUc/gYHTGVeZ7wRTeWEgtfnoqVG9afTUeLFVr3dxT0MW5jRkk8umsBvizzcjM0pzUzwRs57TwOSTcMyO09BEV4pPKCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8cvW84AteYGsHkKJoxDmgX1gvmm/kLqlAnWOZtGp1s=;
 b=d3YsHCHfWZzKzKbAg8VyFQ9t84mrS9Q6PfsEOyyPUg+Z86RPV10gxaJ9DAbsU+3A0bNS6/Sgml+z0SUphQT42YRyKM1omA74aErUrn6I/iYBfuM6BueygppX16c33ynH2zxEmaYkKNdltIk+xNuKe+1t3pL8PdtItGxuHsQelTZmsaj2GOZM1dA8nHYDE8+oeXrAhwT1gsHHhB0ZMMlwknN7z8AogD+HOmEr8gnlUYnubV4RZEZfDhIPvAhroZFkIhI1Tyav8vTM3xaXT4Q11XSFkjAVk1JjjfocMYDFj58uwDf7bpdFbzhk+RqaWUdvUG3Iv5k04RiQ+bsxktcHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8cvW84AteYGsHkKJoxDmgX1gvmm/kLqlAnWOZtGp1s=;
 b=kHhcmsf28oZhFH2Te8iaMg3eJdL6RMI7EnuCofFuYtz0lrRM7LQWxQ6j/56yNEi3qq+qwl3xp1rrwFrZEHVsrU3TQu2YzoLL4qAsig/8ClQ0OUQFXiXqgCc3MbB1O/If9PfdoYZ3/XbaVcRrO79El4lQlYfK3u3xsPOlls311hJxHiME9wqVXy35sCiHG2yQJzILJFlhCkdvs+kFtXJjkq4TyWH+RuWz56tnpXx6yKFORHV9+fSowAsdAYLgsCFK67nkXQB/I1Woe9Q+oInRMPpdYRkSuv/GlrUQZmYXeIml0JEU/R/U0cz3bL0S/2PN9nnEbqcuNnG4HqqQI2HPFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:20 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:20 +0000
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
Subject: [PATCH v6 20/25] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed,  2 Aug 2023 21:08:07 -0300
Message-ID: <20-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0283.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d6420b-9c1f-4a3f-84a0-08db93b5bc30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aeQyStlrZHYPiSHQAvqqYwwbYtIsht1/FZUwE2WMGPFopMbbdRxzswARY15TuSciFtEKDhryeN1J547QzZBB4WsQ7Cd+MpmlJkAnFM+7pcDaDbf00LyXN2N/I1wQKJju1sFwZ7jVqH7B+Ja0z6Fn9htW13+fpuxOsWUuH8yA0XRBxdu6iNTavodMvQK6buEsr+D2WydNMdBk+LAR40c6l97rZhK6Jdy04IEmA7lItT0hYULf5hwdzq18GqqrI7bdMGtj5sTB7LP5oGipsUELS+ZRiHWbkWLre8rEUwLBqo/frsxMqU7AROK50L3k0sW34Vnez5Q2h0m45nxchc+YanVZSrZck7NDE3h8bOP7McwFNfnyhici421DRhwrkjAisdMej1UJzdWmlLiX3OZgDZcs9+JOBIBVxR8o0xKPU0P0XuU0tHnIGbA7C21FUwzEWXZrDC1/n/p/BakARlRCcMHCd6l2suPG5fh/tWVpRCOkpu93N8UTK00eR2lDZYrEk11jQCCAqxzU2hxAsgQGHliLrioqS1MbjfM/8gPO6w9DASn/TWxye/tqOWYynV7dfvOZNBp/V1OscAcDN5i2EiYkrhqFS+t7C4TjgFgC8Cc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?BLEeDltAnik2j+r3SVBKA5FpnmDirlUm8OExRLUQT94+2xkDwRhn4Qxk1TmJ?=
 =?us-ascii?Q?kkSyxZ7Fz43FjMTrPKAUXUW+mjNroiMIEX6HgBHeHWtGlZCTUiM5cuCMgrJZ?=
 =?us-ascii?Q?3a6y/4NFpBJu5Rr4XO/zZsP2DUCeVwVjwujrK1jESrMYoGIcdptjUMVW9AqG?=
 =?us-ascii?Q?ldBTWIiEh8CKrZndkkcdCIuw1GCzzKxw5tXK6eqapfepwX9Plai0RWZAoeXB?=
 =?us-ascii?Q?7fzHCh/WqvMXRPvD4QA8sY/gDeMyUHTFlsISA20orwrgmuemXnADRtanJbbP?=
 =?us-ascii?Q?rveZK7r/jtUCbSiYo8Hmyo9rCA/+XE9IjohphAdho2cnH9tOoXynMj1x8Wn0?=
 =?us-ascii?Q?2KW+p+BXSvjqdj3yJve1z1JQ0y6jeGTn192Q6FWIh0HfgvhOoJ47dDxKiurV?=
 =?us-ascii?Q?xpXFigKzhQ0hWA3YZ2t9iR0uZItnrfo+R69L0scbcWBq9Jg8TDREhCtFi7oE?=
 =?us-ascii?Q?XtBEdNL+LvtGfpT6KxJUaFLf92xKW1uqtWyzXrXzD5ATpdgFH9OqfRbdN1W9?=
 =?us-ascii?Q?Lgu55yFBb8WzBBUONLIc56HKvG83bf2SrrQyG7mzfN2H0+F7y7UvRSY1Hp0C?=
 =?us-ascii?Q?16lnpTQyK3CXsBbPfxTlGAXVlrJGMps/x1Y2mGA0pvO6qCy2xQ8i2vxlm+Ff?=
 =?us-ascii?Q?xYGzCP1R6Dde+X3ZRCIH487XcHmYoWr48hIJyF6ROKychK47x8ChMhbPMhmG?=
 =?us-ascii?Q?L3UDCh4giRMpyjYYPewmdFHXKyag4MJDUxllJK2I0ehjmsF8yfpDprzxG2dT?=
 =?us-ascii?Q?cgTEaakRSVXjQQpepEVnrurjXNu4G6vEwLokqlzrPw1ajI4Q8Tgy6tk773b7?=
 =?us-ascii?Q?3EGgIZ8h3c2x35EeGhxwtNByCCzQbv2rCdjV4XWsYj4TCkO6/aTVnPt9v24K?=
 =?us-ascii?Q?QeCU0/KuOjVjYr6YPNRj2jNxHOPUelxCqJaKMeBWHGV/bKbtOT1f8fx/elvT?=
 =?us-ascii?Q?h6MAdnD5F3qZTKjt1H71mWcdgJAJ3tWBnHWc+2RAJ+gyTooT1YjBOgBon01n?=
 =?us-ascii?Q?ieAPn8sM1x03q5cMbKWzIHuWbL/XWol8WTwnU8mEKvHp54C/sTBIgayKzbfB?=
 =?us-ascii?Q?lZdsZfsSvdnm+JypQUVMz47BW2nfONZqNXkJt/ZT2PYE5nVB7JOOr8k0N8it?=
 =?us-ascii?Q?zsuXOSZoIpFq0QrbRxElgl7UrIAPtq3G66NIgkxSHjeo+c07R+1/faJqpglu?=
 =?us-ascii?Q?mTnxRx+rB9JB0iT5dlfgb4qxEXWki6z4VYbRN09L0D/L3wMDWA9qoy1N8SRA?=
 =?us-ascii?Q?ZA02rlIdgWECmENagr/I1nN6bMsU4Md+gu8WfoDmYm7u6TNwPlTePWr0QRcq?=
 =?us-ascii?Q?4UZdrWK8yA+DsZ/4Iij6rb4VYZDd6/59vTiyJRbHEfHg8dfIFa0DKW2O+iWM?=
 =?us-ascii?Q?Ry787SQp1w2oeEbuW+fzHgM38w2C7pXMCWKW1eOgW6+tPp/08FRjHTGLdYhm?=
 =?us-ascii?Q?lD96awNWoACXG5BMDoqkY5wi5FLFetxxxiMseUXmAWrHU8O7qt797DjaOC/h?=
 =?us-ascii?Q?Y3DbJTnH++k8yyzKf363cs/17N5Yoq6dlyHlWe4QlMfSfphEXaeDkbSZDyEf?=
 =?us-ascii?Q?0K4NfEc5NBHR7Lh/A3LhLBxwqphAgArtNlrbJZl0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d6420b-9c1f-4a3f-84a0-08db93b5bc30
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:16.1498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkG28XrfXg4JL1hTJf5XAE25CkDZamlkGstmA/eHTbzSLcH/UgxXxBXxRE+0WIY2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809
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

Prior to commit 1b932ceddd19 ("iommu: Remove detach_dev callbacks") the
sun50i_iommu_detach_device() function was being called by
ops->detach_dev().

This is an IDENTITY domain so convert sun50i_iommu_detach_device() into
sun50i_iommu_identity_attach() and a full IDENTITY domain and thus hook it
back up the same was as the old ops->detach_dev().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/sun50i-iommu.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 74c5cb93e90027..0bf08b120cf105 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -757,21 +757,32 @@ static void sun50i_iommu_detach_domain(struct sun50i_iommu *iommu,
 	iommu->domain = NULL;
 }
 
-static void sun50i_iommu_detach_device(struct iommu_domain *domain,
-				       struct device *dev)
+static int sun50i_iommu_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
 {
-	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 	struct sun50i_iommu *iommu = dev_iommu_priv_get(dev);
+	struct sun50i_iommu_domain *sun50i_domain;
 
 	dev_dbg(dev, "Detaching from IOMMU domain\n");
 
-	if (iommu->domain != domain)
-		return;
+	if (iommu->domain == identity_domain)
+		return 0;
 
+	sun50i_domain = to_sun50i_domain(iommu->domain);
 	if (refcount_dec_and_test(&sun50i_domain->refcnt))
 		sun50i_iommu_detach_domain(iommu, sun50i_domain);
+	return 0;
 }
 
+static struct iommu_domain_ops sun50i_iommu_identity_ops = {
+	.attach_dev = sun50i_iommu_identity_attach,
+};
+
+static struct iommu_domain sun50i_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &sun50i_iommu_identity_ops,
+};
+
 static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 				      struct device *dev)
 {
@@ -789,8 +800,7 @@ static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 	if (iommu->domain == domain)
 		return 0;
 
-	if (iommu->domain)
-		sun50i_iommu_detach_device(iommu->domain, dev);
+	sun50i_iommu_identity_attach(&sun50i_iommu_identity_domain, dev);
 
 	sun50i_iommu_attach_domain(iommu, sun50i_domain);
 
@@ -827,6 +837,7 @@ static int sun50i_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops sun50i_iommu_ops = {
+	.identity_domain = &sun50i_iommu_identity_domain,
 	.pgsize_bitmap	= SZ_4K,
 	.device_group	= sun50i_iommu_device_group,
 	.domain_alloc	= sun50i_iommu_domain_alloc,
@@ -985,6 +996,7 @@ static int sun50i_iommu_probe(struct platform_device *pdev)
 	if (!iommu)
 		return -ENOMEM;
 	spin_lock_init(&iommu->iommu_lock);
+	iommu->domain = &sun50i_iommu_identity_domain;
 	platform_set_drvdata(pdev, iommu);
 	iommu->dev = &pdev->dev;
 
-- 
2.41.0

