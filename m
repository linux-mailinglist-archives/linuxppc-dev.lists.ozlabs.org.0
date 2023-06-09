Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B272A3E7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:58:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBhm1sj8z3fd8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 05:58:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IE4ChkQC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::61b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IE4ChkQC;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfw1nVnz3dx8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVC7ejHHhx/BkjZmQgXw8RUNINkA3uxf9xn5D2fADJps7mh9g8I7aehwKFEA+ngRm/EV27j+xSRhdq0CfrZsfa7KFk4quwm9uCAgvzg2pJ1+A6Col1a1G0suuAo+r2dh4S3SJyZ3umhKg1EGOh6NNwuekaXxO2i4K3DhDyxDT76LbocXqo4FcDzATxs1jlt+ODXf9Rgjx/wkkcKroHYk4xiUjhTLd2x4rkdWjorwuKQEoRORUHyV9dOSSFFNZERFNPenaNkPJQlgfBt9HPr7/4keXnwaBTBDFvFFfq8Dgss4BRvmPvt5DAQLIRUF4veUtLKxXp8+bSbYSKkp0o8kVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUUt/fAI8ph2DHNlhM4gNIsfEv7BScpXS9Tps+iWPLY=;
 b=T98twroviB78Q3Qw505KL1Rdajkj3B+z45uZkQ48pPNiFN9I64z8GxccFCJeeaS1fNpTfvWrCvHysycKQbhO0UTZdSWh7TIkjTAhhFfKoBI5xZXCOTdLz2IFyFA2UkwyPNcnA215a8w5e5gRegwQx9ZxgjlaELC1N4SmeNmx3zdzMTozk1KfPCptCSSUS2TE/vPsO2/4B0B9Cum0EwYbgbkNhF8Wf77DegHiQBZnksmErSNHeowH008fWsceGPyY3cxmpHa7DULjLhlOmiHbQPuX0Ws/wK2KkzWD7nXZ6aFKVEJpSXXznUASbxXYKEd5yAm1vxx1WENqYTmu7RvDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUUt/fAI8ph2DHNlhM4gNIsfEv7BScpXS9Tps+iWPLY=;
 b=IE4ChkQC1J9SOmEB+7GZs51dViivCwcQtcA+wZB+6O6nvHdxPqEs2nQqI1FkbZ724JkfIU0SG3Fuq3FtfUVLPmChK0QnSdJkvMEFmu6a0LBEfg/w42qRI+qo0GCMyBbanIHoFDTNrCSzvH3JTARk1OG4IFV4+A2IXxO6KHoJYmRx/UGrS6/YsE77tl6mqFiplhth8zoAH4E6SIzUttSGIPFUFIR315syf0h24fFbBoVEHoPsxB0UORVIAfSWeDW0vsdMNZGqj/nFNhhAkpG/m5DN8MyJrLJtJaBgjus+hB0RUfijQcCszF2JC6C9d5NjyTndjo0700VBSXTq4T8ewA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 19:56:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:16 +0000
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
Subject: [PATCH v3 12/25] iommu/tegra-smmu: Support DMA domains in tegra
Date: Fri,  9 Jun 2023 16:56:00 -0300
Message-Id: <12-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: df09db72-fb6f-47d4-8d2a-08db692395f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/H6Ugj0j7KGou1ti2pxM8uJDRb2eI9R+3EAJgy/RO0cf6I9+eTOM5w6Yy2PD/tHrdtC5JF2149R4qYstNzd3dcrkwnzB6Lx8kbZ1qmitsEilf/FmGCpo5us201rb7BR85gdZ/4TL/xAJwZ53dePJsXbM90hzPg1nf5BdaLufzi/CFankz/qNGx6PIBYjCt2/qODnn0YSRu7yEzMsLTvtOFciVEGgFISAzqqPJqzaichdFrzVXVfDyYQ2t1i7ULor+kwwNjBJgZJhuDUvhJ9JeYSxGw7EidWMvwIvIPl6GcnN/GhdqdU+Mz+AcDK3iEND7ij5+qoNSgloaiSLf/6N69VwlOobmG93rpSlgzd915Hj7+iAcRc7CieETDfKt5sCG7inhEbdskKjyDfPXtrKI+ydz/RArJCGhXSB2DdP3VgUw94MjEAoePcA5jxXL8XSPMIjxCbDDjUNws12yCS14q8ve0/K/Jr1jtDIWCGxAPLyrO6+3ZUBpP6rD6g109RIP/d7bmtzzMwJJT8Lx/nd0XS8bDoBJUKVZbN1EC/gc+q1Hlb4NOU1K5kRo9coMjW+7mfke7EEYHpfFTtrwlYMtWXCrPBNpdH8uGlkxJpMmEg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(478600001)(2906002)(83380400001)(2616005)(6506007)(107886003)(186003)(6512007)(26005)(921005)(86362001)(38100700002)(6486002)(36756003)(6666004)(5660300002)(8676002)(8936002)(41300700001)(66476007)(4326008)(66556008)(66946007)(316002)(54906003)(7406005)(7416002)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?5aXlUtpqqGUf3/ZoiOcQ38Z503MHnNxzJ8qVACsJPc7OuuzZ+wx6HvIAqOaP?=
 =?us-ascii?Q?tyejfftJNF29dOrBUHq6Z4ywzM+/rJsSacM/kWOEeqlSyzxIjkmLS6Ld4tDc?=
 =?us-ascii?Q?SIwwFobGHRcjhWcRp4Yya1V4JUfNnmFIufkeetY69JPHH+aGcUM/WM4IOu4P?=
 =?us-ascii?Q?fx5anu5AeYgnxhJntLkcYjXZg1s9gfMEHZzs8rW81In3fLLc2uZZWETbszDO?=
 =?us-ascii?Q?Ir82e8no68aSla3vxl/dlr6tYRIxHFFtTYBi6XV7hkhh99emK7aP9LyLEnNr?=
 =?us-ascii?Q?p77i66jNfHvSIZF1SBb7064Gi8UkOkNZNO/LJctWnoWL5eiraUtGZTIglSdz?=
 =?us-ascii?Q?dkrs3Ox0tjK9IpQoLRqS5J4kcwRzzeNMQIf3WctGC1eDytRe1kzwfpRgKinE?=
 =?us-ascii?Q?vXWO/SECpZyb6PaIPY5fUWtOAA02aKAvAWHcjhKB04sdXzl8iloarXW8T1Mr?=
 =?us-ascii?Q?23vfUjGMHfj5vQb1XSmvSpueCsiHU58kKZutOngRp/Bwq5Yg/ddOHKHl3Tcv?=
 =?us-ascii?Q?5PIwxapNrzOCjvWgie6yTSxFLZmLz4k9vUcXKYxLPvPEeRseIrzcMWv6tcy6?=
 =?us-ascii?Q?z2rU528ighr6aYbbfAIzOMDb83GYNeSq/jzTj2Tu2lMJf91/8gahCthPa7od?=
 =?us-ascii?Q?HMIWmR28KNIWNCQ15SDI55lUysS0nsqoYeLlmTev39c6SsfzD/JwU9q6AXw0?=
 =?us-ascii?Q?rL3PCYcbFq1Lgsd1F8NOC0H4SxLBIK8jFdnSQJBpgKbD420juKLptCdxprCC?=
 =?us-ascii?Q?GAv7RxlltUuV/lNBuqb2Ja6wSnSS+ETkeCfb0w+wZSld4Yt/mXP66HHDEAha?=
 =?us-ascii?Q?nJF4SukXj2xWZznOjPRjAxRD5mDQrmOcQy/wugykHgawk8AQDY7S9oGZiOue?=
 =?us-ascii?Q?L6+QWDEKhy+dI0vygSoOjHUthUV/OFaI5m93CVMnhOL6pOA3R18bIy5i8HpX?=
 =?us-ascii?Q?Z2Ck1n6/sAucVVCtY98ufrWPXdEkBB+cIa1/4OEQpj9G+9eoUscK6arJ3KJN?=
 =?us-ascii?Q?2rVGFtAC4K5yfaS9/CCXEuR+8OyF7yjxB2th7XyKxf6H5Y+GJzgX96zGdL26?=
 =?us-ascii?Q?3B/Hjne+rUcOwLcJ//J/zwaOoKT+lYVkqaFS8nbmbIv3cytpl2X3upi3seJq?=
 =?us-ascii?Q?kxNkhn3Bt0IeG5/zEcrc8lzLb4HZaU/QbfqNM1ePDH/VM/BLNCoi6kQuWJlJ?=
 =?us-ascii?Q?jruSHGmg+LQYjAgqTauCYncGbEJF9qV76uq6xG7fzyNPiReA+gSmiCKxY693?=
 =?us-ascii?Q?NwoXDnN1NifMvqQjl55bt0oMIAyK5jhPaJxr+/8jc/9AXgx3UuiOMKoC6tJ2?=
 =?us-ascii?Q?5bBySNyfizmywbqR19JRd9wJnVAAO7mxCE5hyDFnc0JzcDrWZ0Klp0iOmIIk?=
 =?us-ascii?Q?dSYNxGMsDwSqiweacv5aDGWousMfSW2scgaQCcpVXV8OX+ix4AclpcLC2AfI?=
 =?us-ascii?Q?RQGm8qOxIpt1Lfkepv1bU447HV6nBukxO80Iu/vR++W9b51Q0/BBZW6zevnP?=
 =?us-ascii?Q?5jCccBDBolm9v1nBu9lFlhcSc56e0TTDqiNLZ/Qt0LitbpC5AHXG+Pl8h+qS?=
 =?us-ascii?Q?mvtar7L0UOnoTD8E3BgEtpGh0ZZ+opENW+w++aJb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df09db72-fb6f-47d4-8d2a-08db692395f2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:16.5049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fPlJMs4apbZIY/zn1RTjoaeFciIVgyWvk5DRpHrvRVnmd3mKC+f5ygdTql3RL+q
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

All ARM64 iommu drivers should support IOMMU_DOMAIN_DMA to enable
dma-iommu.c.

tegra is blocking dma-iommu usage, and also default_domain's, because it
wants an identity translation. This is needed for some device quirk. The
correct way to do this is to support IDENTITY domains and use
ops->def_domain_type() to return IOMMU_DOMAIN_IDENTITY for only the quirky
devices.

Add support for IOMMU_DOMAIN_DMA and force IOMMU_DOMAIN_IDENTITY mode for
everything so no behavior changes.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index f63f1d4f0bd10f..6cba034905edbf 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -276,7 +276,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
@@ -989,6 +989,12 @@ static int tegra_smmu_def_domain_type(struct device *dev)
 }
 
 static const struct iommu_ops tegra_smmu_ops = {
+	/*
+	 * FIXME: For now we want to run all translation in IDENTITY mode,
+	 * better would be to have a def_domain_type op do this for just the
+	 * quirky device.
+	 */
+	.default_domain = &tegra_smmu_identity_domain,
 	.identity_domain = &tegra_smmu_identity_domain,
 	.def_domain_type = &tegra_smmu_def_domain_type,
 	.domain_alloc = tegra_smmu_domain_alloc,
-- 
2.40.1

