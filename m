Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C64727339D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:26:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZCXR1QGl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTfx4y9pz3dWp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:26:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZCXR1QGl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::614; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8Q02t3z3btq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoMbPQpahfa9+H5UtY45H3VoXuyMALMFEBfaszRiGbNR3DkF8LH9EONv8r8h/evhIhX/GK2n3TNj74K0LGDHu8YGyPB+MIX9Oy7qlLiXND4wbT7hT7j2eznKmcya+BQKITr9XaG8b4yWjmg9m2QpVNa6wFPy8vXzYMvU0YWEl7qvvxZ9TSFpIAPUAZ3KLIJWuzKcxQn1u57rrAK5RQ64ksCFqnMeYGKmv1k0vZoLTZuhyECUIW9zYrRWPMLGn+yQP8fsUihDfnvIN2l3JKv5pqba4L+syro9UPEMS7tAs+PqK75rYyFsBDWlzVyJEC4tSdwKZxWxe6TeNtgW84g5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccdy4lMCVhPTXmPL2kfCI+rEpB3OgvMl4gKeFc77hkA=;
 b=Nl7Pl6McSj+Tlfnjnk+ySwFXSEcgrEQzA1q6qdA1tGCZGtAPlKNXyarw3gCEzpHe0tDLbK/dZ+s6b3ii9e9Pk1vqzenWzfvoWWNbRhodY8oSArU00tEyDBUbKNtbto8e5bntf/emN+MmJOVwrKV3nTc0Gb4Hw96wWa8pxSBKRfQ24Phs70ql09SaDSAD6w2qE7kOU/bfrn0VXMlTzJmyZbXTkSbeJ8YWNQYyiszwmnr3VOcyuFDhIUkMeFnCRY2jEGbCsVsvKjeMFEKfgqupCbLgWeRK+nt+fDvNA4seTCEXJkaeZ49fAgbp2/o7M43zhTpVqW3+BmcGALgkY27dMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccdy4lMCVhPTXmPL2kfCI+rEpB3OgvMl4gKeFc77hkA=;
 b=ZCXR1QGlC5MkhYJy6DS/2UBIqH+Kpv4kVhXXv6ulVIXza9QIdvmiiR/E4mYWHtGYk+n8tfQMUYf9Fzdr8TfBiZhfUvyHG+iElEKHryWyk/u4fniavlRXww1SnMOqk0zLAIJt/dRSv8djw+IMiAo65s3PQWq2tUNtM6hTs8qAjrsmbSNVObAyA3636LT5WgRvgwVqTQ2WncR0CG3u529oQw9G8yqtWjnzPA6AMFbKvC0bNGr1dBzDhE/D8zqJZyis5EW+sMr2H3KEiHmqDFD123IxsqKsIAeAi/naLpSCvZHIBhPsXsZdg7BEaHmektj+C+zQy3gpeg0vpUkgVTiF0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 19:03:10 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:09 +0000
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
Subject: [PATCH v4 20/25] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Date: Fri, 16 Jun 2023 16:02:49 -0300
Message-Id: <20-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:208:329::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 243370b0-228a-4c54-69d3-08db6e9c4c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4KNOAyckghr1R0cTx9K9qQxJLw89YVDVP9QFntSjd3egoZIM0dss9RLphSByT1kGmNaLJ33kWzZmd4rT0Fcro3Iq5Xsfmm7jGHfI13WGdWTj/y4OD/bZBMVf2AWiRwvHca3JgDDX59yPcCTpYL4mMiWp+EpS8sx5IxFtq3ZetWD6/+BdCDNGe/mju/EaYKpDMlCQ+62uKJgTGnhf3B9mTM0SD4NHrXy1qq4J2jtc8NULxDArgd7/1uGAkm1sTGmDNq+8fMTOm+YpS2QSPRCW/si5p/fKWpb4PFFbcLePneFN7/p6SyNl9eqK2ACYie56CEE1GeHezAhJXo6klu/DoWhvE2iKjxImIYROIC+jvBZ74xnRKjO594Fr4iacLPoEfQN7yLKP1rw31YucdU8BjwBoDl8BjaRa2OhoCi+urXsp/+uuD8U4QlH9464mO3HbOLZS7JJ72V9k8DtWNraxZ6GucGFyV+vG0q500BxIMHOOtlaBvrHO0azUw1FooJ094ZJer2HlvHXke/dD/AoAckasExGyOkgGoM2SyFAz19zI6y7Ac3LcAeSyGnUOT4rqWQC/cJidUZGO9lEl88HVEQP5aZjovnjazQEHnVnqnwk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(36756003)(86362001)(110136005)(66556008)(66476007)(54906003)(4326008)(316002)(66946007)(107886003)(478600001)(6666004)(6486002)(7416002)(41300700001)(5660300002)(8936002)(8676002)(7406005)(2906002)(38100700002)(921005)(2616005)(83380400001)(6512007)(6506007)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?gT0TwwhLM3Z/x7TfJ30sEot3l4DDnJt7j1oI1DK2BB6yVahn27VYj83jd90V?=
 =?us-ascii?Q?El+AwmAqwe48/INtezwT0MEaLBrTDRowEUbCHImT024GIaSit4ANyO8Xzfo0?=
 =?us-ascii?Q?p3vSnYZJJgNRcrWJ3OBlN9SIHn2yzPrhmitEoPf+/MUxzee8es5GWbuFX2uF?=
 =?us-ascii?Q?COfXz9XA7UzKSAg8wFUiDc1vwyIszieH3BQIh7gGXzUcJSPJAlKQMb0QEoDg?=
 =?us-ascii?Q?UMEsO2A+rDod+o2NmDnjd8xtGIQyu7J5ldwj0vmXn1rA4JTVZ/KY/fA3d8N6?=
 =?us-ascii?Q?aDQG9ySVGQh/xnjWpj/MCAM2K2vukv/swXdkVepzpXhaeHKxPdEPtiFt2ly0?=
 =?us-ascii?Q?3lPm28odvOxFbTMqFA/N8iFtrfTlUqWiRf8dTOHuvCeE/DNjHZOKsvOsTU++?=
 =?us-ascii?Q?q1adBTPOG7LM8npYLgMSsna6yS9Gsij3E9/vo5rKcOB5UDRuHI6uzU4DJ7rz?=
 =?us-ascii?Q?fH3PZ3UXVbzZ/YDYPz5F+McoScPJ+6pW52eQTrMErhagmqwIvF9LnYYJ8M79?=
 =?us-ascii?Q?Ha4WLP7JB9nUeTsljCi3sKRndcSMC1c2K0xJwi6YavoHFTE5ef6lpNswOX0N?=
 =?us-ascii?Q?uL/jvGYtgOpNK7f6wIvY3K3tby1oVQtqXaDGhqpvNkbPcbbG2fToXcouKwqN?=
 =?us-ascii?Q?sZ6fyMwEP/kJ5rsyb05buLW7LwDUYvTwZ49UgkQSCGY9Df/uoaesHcwfbj8b?=
 =?us-ascii?Q?9Hbbu0XGcxxRGM8sJt1DNXswMBje9AvJyLA2VdHZg55h3A5am4YE9Ar0ZbER?=
 =?us-ascii?Q?uzI80xpkGqW/gxJWLwwXGY3KJzJf4n9HXDamgANH945ZP4pBzoM5dJlRoBMa?=
 =?us-ascii?Q?acpFXAn5OyY4bGCBAebRPusy/i4DXeqj78gd0wBxpocrs7VD/4AUv4G4y2B9?=
 =?us-ascii?Q?SVEKWfYYJQFLl2CjkV0CM9AKM9OGosUVra3MEQZKz7nXbu0BqwBEkBWCqtZA?=
 =?us-ascii?Q?Z4RHodqZL0G2xrjegoP/GCYg7jQwLgXMW2UwIcugeUMfdC/J0Fnvqcc4AKF6?=
 =?us-ascii?Q?cGNQYi8SCqQWR0JZd/UdSFWFVUAiy/9vCkhRXna8TPH3FIy+UBbGBDW2CBkS?=
 =?us-ascii?Q?JtpAcJatLhE0Hlbwa7BbVAVMfXkMMVjt/7gNP5SPP/jVteS8Us2beNFy6K+O?=
 =?us-ascii?Q?i1k34Dtiyb7MhVHc/+h6KTRGbCaAWdUIezN2D+Z+w36zXyzk4eYbYjIa609f?=
 =?us-ascii?Q?2lSImVtrN+wteIgL1Gb30jl8BpD2LPqZZSjV8lEWBln9nYBoFbpWiv+e7JKv?=
 =?us-ascii?Q?/Ef6BUynnn4/2Fep1z59BE/r9TwbVEOF8PrgdY/OAYh92diJs17p8TCp3GZI?=
 =?us-ascii?Q?JVnjyPwtvexmTwg7hmRmaBBe20WJYgDb5WASTvV2dA2LcBHFkRb3o9Ee1IGl?=
 =?us-ascii?Q?WWKy7XQZ2WaaTATUftFmZyr5AimQzuKvh1Ieg/sq4QM1jRxqaczzppCJxDkE?=
 =?us-ascii?Q?0l01R74cV/p7nRDbyvDgh+zEiJR4CAH61pGSHTxxNJ/wh78mUCN3rtT5UuW9?=
 =?us-ascii?Q?X85JHCy5r6FeQahl63KB+UzJcTCYfDmc+P2j0VsrlyHR5eSZ4x1/pPg4yHF/?=
 =?us-ascii?Q?DzInk6lI09Hh9cfDHEyYsr9eiazK0gjnZ8jOqGWt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 243370b0-228a-4c54-69d3-08db6e9c4c71
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:58.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08Tr1ZvAcoV/f+P3urqgiGgkPGl6D9fzWRMCAeN4kuXFb97PSarUn8rFeaSbrhLD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912
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
2.40.1

