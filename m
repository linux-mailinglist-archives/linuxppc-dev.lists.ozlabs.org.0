Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF2772A3E5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:57:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBgp2s7cz3fH6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 05:57:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TedxXsgO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::610; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TedxXsgO;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfw2FX0z3f5R
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVXKa/tLUjmM/u6+/GI0QuDntk/lOD4z3NTe63LkUEu6gDsVcx/0wfa26qrg5fgMN3PLtGa5UjLddGQKG8Wbsy1abbeMnstZT0HnEzchYwxPJGtsApj22NZX1TwvNhbxi/B49jp5mdk1hx4Eszm2jiFm2CKIEb4BuBgFWv4DG2J1uFFIbNHZy7rXxkn6gFOaRPM0kalsG3BgGxlYX8aQ0eGLqNKhz0sxsPx9aMRBJSULzYs/hopwnQHH/CiB36Ac5UGZNIjmc16ecCiwJNWc8tNe3Z0PneyErXDCAOrxlxkbA0LdtNMX8U/ocqsolg7ZYmV7VIIiR4OW15PS9Q4INA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTyavZJIyqr4bzkZ78lJsHJ+7Og9ytKqwQ0syxXa+K4=;
 b=mZHsn/PButXG/R5leB1YmwhpSMnS3J/p3dMzD02zuTHevfJYypx7PEDqVt43PE1AdMR55XjMtOUizjKsouKMpFziymFsxl5lN8lDKTpLeU/e46TEQTon54sMNDlDAFCNhGOjmK+eRl+uwvEScM8F2xLY7s4xioZK8urpgSjrCTnhDpMWcremg7nIpzJaBv4faNzkVgyu8nWg4u9v5lX6IG/fY1p+rOFRGbRXXBzAdwrvwyhTTQdouedEU+lK1mVE1u4ySDoxHo9nLhIlJaGzxINhG7PASKiEkYuZauoDXE24KChze7kjjJjQNfBD+iApF18U6uM+l4CAivgjtevkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTyavZJIyqr4bzkZ78lJsHJ+7Og9ytKqwQ0syxXa+K4=;
 b=TedxXsgOFAl1Tah6XOnZHkAsHgkjRmBhaFWMQ8z2sFfFG8Kop+oZ8E5IlWv4vRgdHri4tE6p6QiHGNpZxFwyh3sPRT34VT0OJeEV/P5aL4Jin5avgnUQ9S12o06BlYlw1djM0qvSJhmtz/NYbNYhouDmuBiVuAvjdpW1nMwtfX3dGUQb8XxZxogomk7OecDrxf56H0FNDXjg3u2kU8KTNHx+I8svgEK54UmQB2D+8T/Q82F9pqjfz7JSQmf1hO7/fRpdAvxroAhV3pIJE51uvzsaFtCbG4rMWOx/NN4rKLhCLLFQIDkfhYcIRTKNnC26qZmZWissatSL8myujKMs4Q==
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
Subject: [PATCH v3 13/25] iommu/omap: Implement an IDENTITY domain
Date: Fri,  9 Jun 2023 16:56:01 -0300
Message-Id: <13-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d97404f-e116-4255-fcae-08db69239626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	i9+eHV35JJL+sQJUy11x6k+f2pBWsLZiSpsLKNq9Eq+JXGd6nARj9+ZLIDsSuYpXDd3JIHQsMQG6/osfC5AqOmBRZsQ2VCKVzLYJ58M4iUQzQ52OWsOz0CisOZdPo6y3AHd0glCCym+CY8Pmflnmjic+IGUBo8O8PytZstJE1EmaPgDilvl2VK+iIMhY9eM0efns1mnqU3goa4JNDsjHRCItF9O+JFy7XxQbYIASU7qocM357ZuIR89KnPEIGt7YfFIsNGUu/K+0OMK5KE3YjZ/smS8f42cEmNzeNWvUB9xRiM7Qrr3Y8YlzFGChLNqNkUqVbTpORcg++qoEh0wUMNSd60rM1YulAEVA/xtjwr+pRRusAxDUhh7boCX/8tg0t9sIyAb0tayucxArCQ9fcKYLPPVCdexQF53sQtVGYu/GwvYZiK8jWfoobl8jV0wQ5gb/5D5GOBTdZUczutR2WVP+lzGS9U+e+VoRv1V9r24aiMzsh7lNH8q7AvJyzaduvWhESBIe0K3KZa+/CtC0RE4/XAEZmeQ5rayzfGso7TGU7OgxiOTm1WwmVYjJ3f2Tm3fHfmXv081jo9OpWhZnqed+RZvu6ix3UJwCf6aR3SY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2906002)(83380400001)(36756003)(26005)(6512007)(6506007)(478600001)(54906003)(110136005)(107886003)(6486002)(6666004)(8936002)(7416002)(7406005)(5660300002)(2616005)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(186003)(316002)(38100700002)(921005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pnS2x/jW2hl5ekb4rLHYAEha9CBDQlyBWqx0V2WtlGr/nDVqS/juNcahf7qm?=
 =?us-ascii?Q?3ImLO9MKRNzzByN3MVbY9Y7RdeNVjJ6i9kGP+7XZhg8iP7mND+6pQiVoU7pj?=
 =?us-ascii?Q?0kQKXwcfLm4YjjgrQM8bs81Q+xGG7W2ZaOXPFV2pkwXmm035StmYJunaT6J5?=
 =?us-ascii?Q?QMUzsqbaMhPIpzoBexJVG53xaXXEeef90LrKk7IRQthMgKczw1dHEwo2Zp+H?=
 =?us-ascii?Q?n/e8+XovnPRHnHF+nDvvEXiIJ+9CKaFkRyVGwAzsN2z9bSEqPcP0wjnjbbwH?=
 =?us-ascii?Q?xc8fnUaB2ToU3SZquL3u+fOjgYxk86Mm7iAbRL705PosSCcH9fhSKDWqjWB5?=
 =?us-ascii?Q?W9FsLbfaZD0sZuI/0RDNG4AFWyr1rrDDTe3e7IMjoqP3/mM3F59WTpUtTm+x?=
 =?us-ascii?Q?jG5khVXZO7Xoby/29ySIN92+whziudke+4avue+o2cAnKBxRwkUycEeH18N5?=
 =?us-ascii?Q?zp4JNt7Ih75JMTKnW6Osd7nCeEsdSnbxTdKUCV0aH7IerplL7mLFKLckqfO0?=
 =?us-ascii?Q?3DYyNM0z0A6313MRXSwBQ95nhgwyK0rxpIe5COLw01Hrxi3Z/gyCxFeYiz7O?=
 =?us-ascii?Q?6+X3762HqNnlj9odsKLCHkKEkQx1o/2reF2aTSUsCo6qQ5/G69T7h4M02cc9?=
 =?us-ascii?Q?mWhW0s7PDMtyVed9UF1PPqgEq0wit3z3fn3zTAaAT6/w6XEO2xLL1cMcULIY?=
 =?us-ascii?Q?Ds67dYRQtOXoBZaNsdmpp29jFz+vKLJvxLWnwkgO08Sqfx94QVn3QTXg0Pa4?=
 =?us-ascii?Q?rN0Q3McFeokCBSWikVtAK213yfvfV4xZN2vx7Q3GfIQ53io1T7J8IU9zjfQU?=
 =?us-ascii?Q?O8F45JEDjNC/oAnTXD2/HiZEo8OwQ58UVIOstUPziD6/mW5I4JBgSViZ2kNn?=
 =?us-ascii?Q?uop/8AjEvBZxCGJhIyTY3B0dwwsM09+PcegZ03B1+CQJflAOHpankaLXsvdG?=
 =?us-ascii?Q?vTSOPHhlThfcjh//1gTXW3afyiwsXSW1UIL5C5KpQVArKdMW2BvODRrg9BM0?=
 =?us-ascii?Q?QtNb/3Q/iFjtga9rak6xzRHBXkaqPCXRy1ucjosnEEsUDu0yQuxANGyd+ip3?=
 =?us-ascii?Q?X//bceB78uKN8coreTvaB4S0wKmxqN+11Z8pKZc838pMKzEdyqHjy/hhJCV+?=
 =?us-ascii?Q?jG/1pG4jo3vnlMFaVFtdAJZDkIuRrWHJbC1H9AOQmwpGCUWTy6Mm2GuEDi+y?=
 =?us-ascii?Q?+S6R8bd/SmYsQ4UV5Il8JFl5XWkRMOkln9xPPZyE2Bp8xNMGQjKS+6o98QkL?=
 =?us-ascii?Q?NsKkzd2CzvOwXFCYt+WV7izn48Bvlbki+iqdQMFAFcwa6GwyYimBEVFvP0rL?=
 =?us-ascii?Q?Pqcq/CZejAj/u4laJItmDaPK4piCP6ecCufIYi3J+yMw8AMKf5Wl6anFT778?=
 =?us-ascii?Q?q96vDlDUk7mC0LWyVhf4ALQxDEoHTHDXa3n/wvKhB0uquzu5gyo0/wY478wP?=
 =?us-ascii?Q?GLKk8cUzGNOENm2wHmdPox/OnGsT8XZ6fxnKzogcV8DK07LsAyYoE80Bu6Ic?=
 =?us-ascii?Q?lnz7XEo4+tNiI7jpTUp+JN9LHqe9gDxFj8aX4Lwq81ca//hebb8SEvoTjJ7T?=
 =?us-ascii?Q?lGHgYYB4BVyNR2uX4PK/5uxaddc/6/ydBCbxl7Ac?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d97404f-e116-4255-fcae-08db69239626
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:17.0515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uESICC2lODOvu3vukrqYvrdYTOmOuTPPCeOUIx6ojdfXdb8mu1ykAtJHAP/cq00
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

What omap does during omap_iommu_set_platform_dma() is actually putting
the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/omap-iommu.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 537e402f9bba97..34340ef15241bc 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1555,16 +1555,31 @@ static void _omap_iommu_detach_dev(struct omap_iommu_domain *omap_domain,
 	omap_domain->dev = NULL;
 }
 
-static void omap_iommu_set_platform_dma(struct device *dev)
+static int omap_iommu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
+	struct omap_iommu_domain *omap_domain;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	omap_domain = to_omap_domain(domain);
 	spin_lock(&omap_domain->lock);
 	_omap_iommu_detach_dev(omap_domain, dev);
 	spin_unlock(&omap_domain->lock);
+	return 0;
 }
 
+static struct iommu_domain_ops omap_iommu_identity_ops = {
+	.attach_dev = omap_iommu_identity_attach,
+};
+
+static struct iommu_domain omap_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &omap_iommu_identity_ops,
+};
+
 static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
 {
 	struct omap_iommu_domain *omap_domain;
@@ -1732,11 +1747,11 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 }
 
 static const struct iommu_ops omap_iommu_ops = {
+	.identity_domain = &omap_iommu_identity_domain,
 	.domain_alloc	= omap_iommu_domain_alloc,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
-	.set_platform_dma_ops = omap_iommu_set_platform_dma,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= omap_iommu_attach_dev,
-- 
2.40.1

