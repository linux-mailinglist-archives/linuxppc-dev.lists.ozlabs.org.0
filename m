Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C211785E08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 19:04:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BMNtROfk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCH96lbvz3fHJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 03:04:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BMNtROfk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::62a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwr1Pwmz3c7C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5YX9Z63U5T8ykXAq383zQ4z7F5JnIt7veM6/TLeEM4mWCO6WZ8cfsO/jXk9UFYbgZYcBYLqOzxAg/uP+HcFmAFlQr5t/xkERNBue6o092zIsGq9IBheYrv7eXFNxmPXYy7i3c/d5/TL1ZgC+ShpZEWjMu3UTb4J4RPjCyHZLSOyJYj9EigFKTU9jSnI7eledPekwcouYjs+tJL70nbEnVsc1AGTSS9Q9E3zRQtHpkOVj/coqXGLsBdM6YawF3vfhqsOIT/eL1tzQn42VoZaf5DMHfbBIicyCs4/VgnIYz911eap8RrdApObj+wGiJfp8rxPlSzRsTJBsJ9bUq7SPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MArZG0Mn6WSHzfFrVjayVPIE2cn8WkfzXpG8RhhC8Kg=;
 b=hBlAdfiFqvceNEtf6zl5wEi0eb90KX0lFuX3Bau0K8VheYJUo+HvUxgKkizehbYVMJkCy/2oXnhlmk9jnkz/ZP8MI7VHKuFHM1udnZtwLlh2n7Aphp6tLv4fa5TxQraisyycv0ZqbcTWvjnwsW6gGhV/RW6KPNAi61d+k88+jFlrlX9c8BlgT42vhl3+9jVxe2yFXkublLpEoIJBLqi7fqyNKVcejRVhzleM32zRXRxzNJ6peXl2K56xph3sbISfKeEmXzGdDRjB5cUaFVqbZVPkykeWSg3t4f3LjEzEksVp+g5yB7xZu/UZqLCMp5Ww0M7NECQ9zAha/ZgLghkSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MArZG0Mn6WSHzfFrVjayVPIE2cn8WkfzXpG8RhhC8Kg=;
 b=BMNtROfkxmXY27h64opydb6GNqrADgVab4S7m5HTqtLQxlhm1QRJCHREyS0zgy2KrVt99hBuLTEir2bDgQkjil/AbIT3jCRMysTAp6U18fgSLXuIwVW+OyhkXvHxiFagTkntRjiQoqCfkDMvAgXLnsthEojOG9TDMRxNm5tDFtnUrOplU6Z9uy+bgISnOPZ++/SSAdz6jv0p5OKlSi2Fyq9bqsm+/l1Co7ASJcgug3DqwU/DNPKWScfrTghhfbcT+nbLNBtiOsEiYlyH3fon89lRn3FZjrWP4cxfwMZYdgOTb1ZW+ZinB4WdY3frTfVyOSmDTPesnAXKY/wuqJ+M+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:57 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:57 +0000
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
Subject: [PATCH v7 22/24] iommu: Add ops->domain_alloc_paging()
Date: Wed, 23 Aug 2023 13:47:36 -0300
Message-ID: <22-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:610:58::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: d0199f27-3796-48fe-60d5-08dba3f8ad70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FI5DGH6LGTXHaYFVfjQAr9ywlu/AHB/ZIws8F9GyDroyzlLPGivfPctaR0wdfcwgIhBJrn2/gDcC3lECvtA9+A8vlakfWbn+RUMoERX/7g/GZ7ChThXHMZwY898TsGJKqznZPCrl239piUjYxSm3HtMQfQSSwY4+ZADSdcVDUzsmZiL+OSIfMnrtlYLRRWkQu8RclnJ/wmEv8wDWfGmnv2lWrtk8CHNJBP+ltGnxH4QuajiJPCfYxy42lSF2GZhvXlyeFlXTelumxmmwxCBEXPi75fkMt9IV44MkRcQ1h3M2F0UIxDlewFTeO5zW/0WVzaAQqW0AyR45X5HV74EWjK+UFNaTrcod61MxsmU02sd8fH0u2HjTnHIEP1ut/xiZ39bq5N2u26pc+OicQBzcrjzwLrF1GqxEUIjeuWjIbNkp0tHgvzW3oj0WWIqpyredcbFgSpGhSqcvNdm94dy7CLVsOomyOnHyGFKFLdn7dFBcvj3OU4rBL0Z5PoRkua9k7fdqMZ+0pKS4bxbojOPZ2ewNsiIW+1Qyk+Q8QpSQBRcxeUDN/uLrwKJRZkKM2bNYNXpjaUi1EaDDKcLvI3ssPkC9g+FH61SdNwIWbupErAA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?hxbPuIG6dwTAS5188ooE+jzPvJncFDYZ8wV4ad2mMosC060ophRA3E8rEMnV?=
 =?us-ascii?Q?m1ofTwJ9KExRZO74pudW1XuaPFRQJ8sazsULINTtX0w+Tfp7Y0gPmN1f/Xxz?=
 =?us-ascii?Q?H7TchZw/FqueDum2DAhaNSDN4WhdR5m5BDVA1fvenKvfDbbdM8nAX8HSDNRD?=
 =?us-ascii?Q?HeWjfTYjwiTZQbgtU7P0RSBI6S3q8363YohDM8qGBt5Gh5dQT63NaJUTtpPx?=
 =?us-ascii?Q?SYoX7Isr4EjTKurTaujD9MTkj2fWB502Ko6qULG08mwk+7N37alNkLkfvEzR?=
 =?us-ascii?Q?syvLVPIpHfoWBcusWfF/d1XCb0zRaQjBDZNsJDE+BWPTfRsXVjA1x9ozaDxj?=
 =?us-ascii?Q?nxuIdl7bp85WRfG4PqRj32LOD2exBmRe+W2SYpsyI3/vpJkZZFslvWDNNtS6?=
 =?us-ascii?Q?P1W+mdx5zb2H8ZGnXz6gC/E1Fj5xtTZq1AgFYReErTjZAkPa/avdOdTO4IlV?=
 =?us-ascii?Q?X94GI2kP1wroNciIP6LmTauuKqeN4MKYukzGqTZUjPgWsqN1dQ9Ex3igTbpc?=
 =?us-ascii?Q?pOKUV45vv7C6WE5Yq2Zp7QFpVeW7BEttYvrELUzSyjJI/GOf4ga1RHAbClDN?=
 =?us-ascii?Q?9UBsl+r45VxLGB9JSOnZEmZqBbk4qAE5pAg7l2F5dBWisZklMcPXFE1UHXLZ?=
 =?us-ascii?Q?00uVkN86GZhxnbV86+2cpiglbJDeOltaGe35ccPhAcEm5qTWHEqDJe7w7kwX?=
 =?us-ascii?Q?OrfU7AjKB2V4V1RLtt3pf00TX4RrRggaZeKS0HvMcGJdLd9H7MQgc7DPIlpQ?=
 =?us-ascii?Q?Y1TFzRCJybCbR6PWDr+4/thDMcHBYmbJ2V+09bSlao4crxs7jG8tyggjVoM1?=
 =?us-ascii?Q?oBtc20VoMGJrTr2sqlsi41KDEqtICMHKtO1sjoyhHUIme/hZtNU7A6OJhLVu?=
 =?us-ascii?Q?TZXNpFo1MjtEbNJairpBLj8xfAV0WBC4Iy3mmLZNp8QcGg4hfrGh7rU8+nlw?=
 =?us-ascii?Q?cles1HwhfYlZwdar/Cz6B0clws+QmbPKJjYVJfjb3cpRaxMAGwiK59r3mhPh?=
 =?us-ascii?Q?Ge/JQwAXiEMpWefBWn5L/du/QchtZt4yBERgHUF7wTMYLKbrSxvv6fRpg/Ja?=
 =?us-ascii?Q?2zBBynZxS34Gv3gfVhtgObWM3t+VSDffdQz7KTcnGejXQEriHBUTwGRAYeTV?=
 =?us-ascii?Q?w0jupcs4fYATYBcZ23oOUtn1VLyxVjMs/rqbtJsJs/ZW/KZlf7e7pTotk/F9?=
 =?us-ascii?Q?YxB0JmcZmwyxsvhlRleWaERdg5dcF9EfAr7svNXNk8QFtNSosice4L4N4MP7?=
 =?us-ascii?Q?QnOpLAOPAxj231lk/8m/ekKnrw/lPFnGtOeJRgKtU+DXAI8qFbXwCNN9WSfX?=
 =?us-ascii?Q?/2+sZUtxsUJyrPy581MmU1FZmqvv2qjcQccsE0thJkFHmwV43RFlTDnVjgR2?=
 =?us-ascii?Q?ZjBE9f+1PFpwV3bP324BDmdZT3dE6cDGCqo2Qniy/ANAPp+X0RNaVg9I6z39?=
 =?us-ascii?Q?b0C1RsX/1UoAPb3ofh5ep6USNdRiI8x5vIh2j74zlIUZ0+nlb30ORnxXclae?=
 =?us-ascii?Q?8NQqmYKU8s3m5JAMc0HpIergtrA4fya/3TwcgBjNIIbt1YdFRb+PquW0HnmI?=
 =?us-ascii?Q?oDK9aycqoCf7tUEIvtZptu9HikLyuCZSao7odggV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0199f27-3796-48fe-60d5-08dba3f8ad70
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:46.3321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJ0W6LNzTULVV+lVMTHJ4vuat4dojvEQd1ynfBOiQ3VoaYEy3RGKoBSRz/IKDQGq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346
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
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 17 ++++++++++++++---
 include/linux/iommu.h |  3 +++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 568dec45a06954..c5d8cf48a99332 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2041,6 +2041,7 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
 static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 struct device *dev,
 						 unsigned int type)
 {
 	struct iommu_domain *domain;
@@ -2048,8 +2049,13 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
 
 	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
 		return ops->identity_domain;
+	else if (type & __IOMMU_DOMAIN_PAGING && ops->domain_alloc_paging)
+		domain = ops->domain_alloc_paging(dev);
+	else if (ops->domain_alloc)
+		domain = ops->domain_alloc(alloc_type);
+	else
+		return NULL;
 
-	domain = ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
 
@@ -2074,14 +2080,19 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
 static struct iommu_domain *
 __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
 {
-	return __iommu_domain_alloc(group_iommu_ops(group), type);
+	struct device *dev =
+		list_first_entry(&group->devices, struct group_device, list)
+			->dev;
+
+	return __iommu_domain_alloc(group_iommu_ops(group), dev, type);
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
index c3d2e79076ffab..319bdc8328b407 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -239,6 +239,8 @@ struct iommu_iotlb_gather {
  *           use. The information type is one of enum iommu_hw_info_type defined
  *           in include/uapi/linux/iommufd.h.
  * @domain_alloc: allocate iommu domain
+ * @domain_alloc_paging: Allocate an iommu_domain that can be used for
+ *                       UNMANAGED, DMA, and DMA_FQ domain types.
  * @probe_device: Add device to iommu driver handling
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
@@ -271,6 +273,7 @@ struct iommu_ops {
 
 	/* Domain allocation and freeing by the iommu driver */
 	struct iommu_domain *(*domain_alloc)(unsigned iommu_domain_type);
+	struct iommu_domain *(*domain_alloc_paging)(struct device *dev);
 
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
-- 
2.41.0

