Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E8A72A3E9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:59:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBkg53Ksz3flP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 05:59:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WMI5Cowf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::61b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WMI5Cowf;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfw66gTz3f5R
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XF7WQMv3nB0S6CK0rOX21hSmOav04a4Aj9FtOJ461FlCCan0V2B6VHbzWM0y7TQS6lfk25ZZEUnuA1bYOiIHcoBHjIdupt2LLi4hv9iY2RTeyGsHfuvOj1g+HQmMxzOpTN4le88Oymby5OlsWNtDklvpafGIsT/tGOxtuBphyJNq1COqxwV+iAFssUAyLb4OXk1JHPd2Po9q7gQxE4UDgSyovVDCN+j55LArEeqreJMjXH5HBkRQPzOLChCCu/nDOe1DSE4DjYHWgqx7HEgKlSHR4gEbfmHpOSsKaZUxTE9TGlTeRacGWMdmFxbDoxRQ1R9X0CvU/s24U8odTPoDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjMNzj9ECgTiH26ByBwRnJAD0IolSUQ+Be7+5FtoCOo=;
 b=gpGtEi5yQZ13L3YgsYgLyQasccrToo/DQsrfH6z/82i6uKI5SBnNxxgtoWl7xAUjcNObFbxyVGMLkmINO6UloalW4bif102STPXea1ggYvtT73cNH++RXhGlg7e635a6y0mCI5b5T7DSC5stO7NpWjZt204Ykff23UrIubFRA4g7j/D1uui3FVsW0T1VWt56DHPTDrYgJ3tlpp8U0CjYPXkKJC42von85Pf6666FMJ/00mS2iI5I2j31UvAl3B5XyT4vBfGEYSqkDqE2BPrlcbrHcjU0ZvEJtEdvQJZIYW1JrDJ5ux8rr0n/aFHczNw4J6SHx0JYmeP1FoisrJICuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjMNzj9ECgTiH26ByBwRnJAD0IolSUQ+Be7+5FtoCOo=;
 b=WMI5CowfDhmRbAJOTdjviFOp6U/Vot1VWxTTj0hCGiHPGf13K9ajj+lH8YTdzq+7IkIA6774iZBiIG7GuYlp41xZmGFk4wqs3B5Q0snnKJMHZHy2Es5KG3X9q4hV7uIlTWVXybCIbmpyyqZPa2PQ2J4GK2Et8wsKzcl0RI+fUHz+HG58WkZlc3WPHvZM8FPI5ggnRnTNpH6zOMFjdH9IHUvB+DErapSHzp5KCy6q24XdDBfKFxi4x7I3yAAr4Y/67pYMsa82ClBfC/1gT0P7jng1z6p2XKehqkxtLI+00Ol9JMxNLxQXDq60TcwQ+JvxGHFxXe9798X3CCvzKlsTGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 19:56:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:17 +0000
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
Subject: [PATCH v3 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
Date: Fri,  9 Jun 2023 16:55:50 -0300
Message-Id: <2-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 02bec255-ea37-4d12-2c0f-08db692395f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	41J83Cj4z6+ERgvr9VJuj8wbwud4Y4w8gCqhW3quAHP920ydZFzMcH/mdg/ExePvFJGrw+6pgwdvcRlqN+CiB3ZIVZR+Cwix18MjTwkFh9L20eV1b8VDcLPLfzmZfIhtDyh5QRmxHAOERPI//2Oo+majMMZHfwJVGaqhx8W/HyEHSZDveILsA0wJYomOTsreO5oYf2So2Vn1vMaGMWuZuPT0ZiLZ92Rlhs0IpVYH8UFLExo1++/+JdXQZmzf5rOyw52DDSyP/XxUh9p46gr9DIe2TeKmGgQnLpB5BduDDUte3cKdmg1mGyeDC5bxReWR7y8lHdrbCL/A36GWCLCBVo7arZO8LcH1F5tDvFyLgeF1+z2e/85Fta81vyME2DvGSXzmGMo9WKe8LSkZTF7M+JC01xjHMq8rfenuEwq8zl2qH7Kqol0/1wz8c/JsAfAb7fPutO3zR3/x+S/X2D4bIKbZlaqGCZSF/eJ9a35OZepBDBY38v6hxQZLDyZxhjB46Py5hFOVhqU6XYX/27xIlv85Kf7Vmre6KDuYfxElvfojHnIQUuhey3i+bYEifSUv8QjonC9Vzc39sPvu6JS0Qdi0tz28e8sEK4XruaqnnDcoPbnzhsoH8YnitIqFtzAV
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(478600001)(2906002)(83380400001)(2616005)(6506007)(107886003)(186003)(6512007)(26005)(921005)(86362001)(38100700002)(6486002)(36756003)(6666004)(5660300002)(8676002)(8936002)(41300700001)(66476007)(4326008)(66556008)(66946007)(316002)(54906003)(7406005)(7416002)(110136005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?sGJEtfXI1ndQVOsa8X/gBLiNPJMZ+tllwEhu4ik9cIYZ6zSuw23tTrOGYKjy?=
 =?us-ascii?Q?lFRdsnXZjaID53mh964kKi/CwIJZYcddrZymcXEnsbhBescC+cWclvLNm0ja?=
 =?us-ascii?Q?leIymR5yXJn6DNzy933tVae2FS1hj0UfxYa+vjdnIYajpTmQyJGLogIITFb3?=
 =?us-ascii?Q?0apRcKl2yEKfOV/EYWVRjfzYlq+td8nQCC+vsa8TDwBpWOuSw+xjoXijYR6q?=
 =?us-ascii?Q?ccIQM0+EdCkgzfOlxN6QkekU7pFjWdybYaZek5aNPrvwJ1+Et4gnGHPPv2N4?=
 =?us-ascii?Q?MVIjEisxZ3F+Wx5zhzqFmNaVaPpnsFF01DfsUeJQLPaPjvhPqwjMXqV3pfOA?=
 =?us-ascii?Q?KP+HGgJ6PRp0/CQoFWjQ9IpsHoJtccxrLh1b66J8lbwwjybrMzNVi/Bt3/++?=
 =?us-ascii?Q?3lwSaEmDWWFX7q6yqi79Cx2wxTVTHnL3xAdq94xXHXK3Rz8qwHcM39dtxxMf?=
 =?us-ascii?Q?1DFf12wN+it4y1Jl89d0yeekt1GMAuMX6NY/8yrsyi15KWoc5RdaGtqpkqvb?=
 =?us-ascii?Q?YbaihB714AYsinweQE7HzHHEi3EULI++E+fP7K6lChUU+7917n0FWOI9JJpb?=
 =?us-ascii?Q?L9J0WtEwBBySKWSqhznmEewuPkEZ9UrooYmf07jFeAEkE2VlR4fOcZ65Trj3?=
 =?us-ascii?Q?HJycZsaVYZFcV3s2gVjRGcUSUBTc7P/qfn41tbrFScohCXFIn9TtjD14JfnU?=
 =?us-ascii?Q?MsXLd67k+9nKa0CxIpXg276+Os4ELV2O3lCJJzgQh6tBdY17C4fgZZBJZIsY?=
 =?us-ascii?Q?v2V9kihr1UULdZ/60bx3LbAvBeGfpSA/2+YAa2OY0NMZ01rphuuOfiYBPGK6?=
 =?us-ascii?Q?62ircZO+0nxDPTgpe+9//Asx6rB1uPkZrzwirKH+9Nflcqm0ljf4h/yd3PYP?=
 =?us-ascii?Q?AsjKnFemxVEAAcpoCDLJWkSM4k4Ofi8GKqJVSsAgaszHkIjYev9ZhThAXJtQ?=
 =?us-ascii?Q?/wDmZqoMQ5e4gcCAh/SO1UWERg6qGqjH341nRhFWvLZ5h6Z8I7oWzdJu5Ajn?=
 =?us-ascii?Q?ideYxKJkg8xhPctd55yfo4jt8Hz3lMzaV+UDDhmWP5k9LcBvsdXfIXKqW/jj?=
 =?us-ascii?Q?FhvrB8CuIRB8Ga5MRlAV+L1TU83a2Q8fHTKM3enICFeFq55LTBrKGSLCJ4Ci?=
 =?us-ascii?Q?oLVa4OfrZSbpQ2t2A+su/Fyx1AbJ5ql5RRw3N5kj1WIaQ33YfiIITFg57Fl1?=
 =?us-ascii?Q?owYRr0SI8m15crHzsGljk3vOwkmZItQSTVqsmVXVTqrOq+VRX6fzL2sF2o4U?=
 =?us-ascii?Q?G7jAm/bGf8kj+Az8DCVNB2+aJgP9cH+eyyJJB2fvELcau1UqOBHSpQxbqyHf?=
 =?us-ascii?Q?ILN8Zx6hehoQZZW+SuZDX/PzPdxn42n8u8nEdjyi6jh88tD8euqnF2wtQtHa?=
 =?us-ascii?Q?it+7Kbxt8CGTMIO82s6ZNfFpxU8vuN+hVcMrLaOh0gGSXVZ6BPrehih3u5zH?=
 =?us-ascii?Q?LLulPSOqD7JozxarxIb+t1BJPR1ay//+z/WvnknIm5Vrx/LRrpLrjDDEneMI?=
 =?us-ascii?Q?GIXiwGQaiA3K7cCPiOKkSO8uh7a6naKSwXAJ/WB9AMGT3EES2j1HGRqV4mpV?=
 =?us-ascii?Q?x61DUdj/VmylkSJTKUptWMJ7ypF4qccMDgigickt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bec255-ea37-4d12-2c0f-08db692395f0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:16.5190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhLIz/qZQCynjDd8t4t9FmASXBVuBnYecq6Bfls6etANpNh1b47hYQgcV8B894Xs
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

This is used when the iommu driver is taking control of the dma_ops,
currently only on S390 and power spapr. It is designed to preserve the
original ops->detach_dev() semantic that these S390 was built around.

Provide an opaque domain type and a 'default_domain' ops value that allows
the driver to trivially force any single domain as the default domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 14 +++++++++++++-
 include/linux/iommu.h |  6 ++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index bb840a818525ad..c8f6664767152d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1644,6 +1644,17 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 
 	lockdep_assert_held(&group->mutex);
 
+	/*
+	 * Allow legacy drivers to specify the domain that will be the default
+	 * domain. This should always be either an IDENTITY or PLATFORM domain.
+	 * Do not use in new drivers.
+	 */
+	if (bus->iommu_ops->default_domain) {
+		if (req_type)
+			return ERR_PTR(-EINVAL);
+		return bus->iommu_ops->default_domain;
+	}
+
 	if (req_type)
 		return __iommu_group_alloc_default_domain(bus, group, req_type);
 
@@ -1953,7 +1964,8 @@ void iommu_domain_free(struct iommu_domain *domain)
 	if (domain->type == IOMMU_DOMAIN_SVA)
 		mmdrop(domain->mm);
 	iommu_put_dma_cookie(domain);
-	domain->ops->free(domain);
+	if (domain->ops->free)
+		domain->ops->free(domain);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_free);
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index c3004eac2f88e8..ef0a0000f09326 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -64,6 +64,7 @@ struct iommu_domain_geometry {
 #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
 
 #define __IOMMU_DOMAIN_SVA	(1U << 4)  /* Shared process address space */
+#define __IOMMU_DOMAIN_PLATFORM	(1U << 5)
 
 #define IOMMU_DOMAIN_ALLOC_FLAGS ~__IOMMU_DOMAIN_DMA_FQ
 /*
@@ -81,6 +82,8 @@ struct iommu_domain_geometry {
  *				  invalidation.
  *	IOMMU_DOMAIN_SVA	- DMA addresses are shared process addresses
  *				  represented by mm_struct's.
+ *	IOMMU_DOMAIN_PLATFORM	- Legacy domain for drivers that do their own
+ *				  dma_api stuff. Do not use in new drivers.
  */
 #define IOMMU_DOMAIN_BLOCKED	(0U)
 #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
@@ -91,6 +94,7 @@ struct iommu_domain_geometry {
 				 __IOMMU_DOMAIN_DMA_API |	\
 				 __IOMMU_DOMAIN_DMA_FQ)
 #define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SVA)
+#define IOMMU_DOMAIN_PLATFORM	(__IOMMU_DOMAIN_PLATFORM)
 
 struct iommu_domain {
 	unsigned type;
@@ -256,6 +260,7 @@ struct iommu_iotlb_gather {
  * @owner: Driver module providing these ops
  * @identity_domain: An always available, always attachable identity
  *                   translation.
+ * @default_domain: If not NULL this will always be set as the default domain.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -290,6 +295,7 @@ struct iommu_ops {
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 	struct iommu_domain *identity_domain;
+	struct iommu_domain *default_domain;
 };
 
 /**
-- 
2.40.1

