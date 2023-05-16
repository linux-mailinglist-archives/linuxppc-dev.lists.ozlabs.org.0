Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC76470420B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:05:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxMp5sB1z3f6l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:05:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RYM4YyXM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RYM4YyXM;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGx3gN6z3bxL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUxXA1syaeZuSXqt/OG61vvKhxmaBL9EZptZ2uZ+N0eWNZJ39aREYaTafVJOudxgcHYwuBAVsapBNi0tzEZmPV2tURMgkO4IPTcBOGsgZGGJcx8XAbDhPEbxINQs631tRsOV14YIn39f+BFxHTGR/bLuLgOJYWWpcPltOHl4D+2MOxMXNGG8yms7OTXCmOIJDPujpI8OC7kMFjswfnnutqGJxU/rSWdDfFLnfT2r55beIByqDAxdVHOvHQbb8I6IZ2EvF99A0agLI633iWHRWJ3AolXIFNoQvH94ZaCa3IxsF0q/ILv+rDjJ4CVUz1Nxx3uj5418oL/fTKuf12fzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zm+Z2PUP2tMd+hkrlwueRLJj6lXRj/dm6vz9hx2EIy0=;
 b=EWFqVSs4b9xDD+Ib6iLBiO+A9VKKaN+NAgn2Nka+PtOW2fs7YyvVr/PrNAUvtxXeYgesy3XIhXbTXUmdk+kQcCD+3g6CDuKoakVxuY5akUioaF+bSBCDSll+yg7YGRl+CIT/yfGXd6BhxcTHb/OqnoVcfb5RNB8k/jv5J9bWGkylg7BscEqTE0M3t+4lEzqEtiNvxIpSIg5jODKuMdxvRKvSePb671Lwwvg7cpwU7qhX6sdUkNH1iWKzn9E7p44M5gMK47o3dkTQbqTsCw9d2PbL9WAM/gCp3cf3Z6aMSM5FU89NtdpW0lEV0CmOVQI4vUEPzTA8ZlFCpNuk8ztRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zm+Z2PUP2tMd+hkrlwueRLJj6lXRj/dm6vz9hx2EIy0=;
 b=RYM4YyXMYnMguE/8UiJo9pPcU/Mxgi/4dutQHoIq+uUZcrtDkyVNkAvkhcdcR/7KqiYoRpKvP6jS08895Cij3tr7kMR/+dF/XAnVi7TCqMCLC94efYJQeOnzrGbmaYAhAYMxEYn6ADrS+W0GyMqqyNKWklTJzwp4Y17pOux711xg6TXlaj7mcROLwenZoROaS1TQijEXa0qk6vbnmdEq/bNi6J7gSIWUjodpI27fdSrQhUjiiunDBUpauq2eyP6+KSOs/jWz61VeSCQdt7bWW2jNizMIBAWqbHYclX5t9FXQvt8dr+fAYxTYu6zw5OK7An+h4fdD7Q6AJGhcTSHFjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:03 +0000
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
Subject: [PATCH v2 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
Date: Mon, 15 May 2023 21:00:35 -0300
Message-Id: <2-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:208:239::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e6dcf6-eda8-4559-f632-08db55a0a23d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	h3Tvif0CiJElcUFhS+3l5GwaAhiBR2IGfv0+3FIdVKk3UtGUaoELgjhMtPu52erTkVzjDV/vX3fyIWEGovFv5I9euE3zLUrnS7zrpNJ39+EOyUgH7XCr982KVIwJVJvwMS1LJNHrV/RinRWEtLH/XXyEuq45US/+pXTzaZKJayH3NyUfSQdugS9NrhQC6gHQs4WdX2+ZDX8j8EH7o/5n+89dbEwDdm3MHghYVlCA/dselaOue/Tv4P45saa04oHptYEvWhkbDaN51YOvPShjMUb0uJr4BYYXCLepc5EHmjHDGUg0yVICoxmKe0vtKv2xDv98KKen8MuFJE2Ek5meaWbapPb2zEg4hKi/NhuvDdheBU8EADmOd88yOhnkzK/GszN2XFTdPYtem/rE78B+wOz15PwG7ZU9jRIfy22vGdRvkmfCKLaZlsZgwfsrL9B6/tVzbnzGzyNuMkmGhMnkNHvnG23wvqfr3N+Yf/eI50+HQp1plDU2N74lHIq9WZOHA2Eo79hBmDNu1k79cddbi8t22oBq/PvxyqVd+TK0RD0tFx0CCv4mgXxZhNOxgR09+X12X4caxSOvwp/GhYVpwPq7aceN/4nYc+3Wga/spFLZzwHQXjh32gf8W0tIjwW5
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bqTVtgb6bUPVtT2VnhRzfALEWqvzQzv2xiF4puRH7IMOggRyVHTVXtbqw2lw?=
 =?us-ascii?Q?YP6P6jyDAjqoU8O8ILmOUCuMSeG++eJGls1uNcGPYB0Q9OTvsGClRpoGqlTw?=
 =?us-ascii?Q?1RqclEeOzNlmQjSrbwX7UsoZVGPeseJEQZW/rT5V25BLu0Tk/KmQoNblYU3n?=
 =?us-ascii?Q?ZLrMQnB6PBb+zhK3xWT/pFaN5fpixxhBzId8795+fFWeXfDaMWKoMy2JsaLz?=
 =?us-ascii?Q?wuQPtFxDQDXYvaTmxt8PTiouauItQxGCRZsqxtQZu6XVIz+Uuawhvwg3az7U?=
 =?us-ascii?Q?YEVNVXBzdhUSTFTZoKqIzUzw+wLGsnBQuphRpOpGrDlVYypeY/X7nCzvZDcB?=
 =?us-ascii?Q?DU5KNNWZo9gSeZf5Lk2Y/NC8AMSPSPiVt3YnvBSsWTXbOKIVQWLVxclM+IF7?=
 =?us-ascii?Q?lrEZiYkx6LI7sEhj+aCkDFn/M7NDveab4LAXt8MSTgT59LRvOIFfIay4J/Nt?=
 =?us-ascii?Q?PwJTB3O3Qr3cu2eY0RF8+gq8i3Mgi8AIUemkI6L1Q04do3zdo458t+pRmEVD?=
 =?us-ascii?Q?e21Tj8NuIUXvtb17gc8LJRr6u4Y45MOZVp/FqOpKpx8skeEvUSKntlHvukv1?=
 =?us-ascii?Q?gCXsmMN2W6NZQVsNRzQaWADttmzLqdyUOos5owKWSJQMsGQNc0bkhgkoDIAI?=
 =?us-ascii?Q?lRtf3JJWDND327wPUTz4iSyXCK2xq/O2vug6+jpwcauQQwbmm9qs4wsLDHzV?=
 =?us-ascii?Q?XzNRvcs/lL/EGe8dSvrpHLgpTzofri2HgDgm3EWFbF9YNHaKO0O4UMPDFWPx?=
 =?us-ascii?Q?fEWd7caFdBKy3mtqhiuH/b0aYohpVEcpQPs2/dxO3YBqRrR7Nt2xKIGYU9VB?=
 =?us-ascii?Q?Cl8HUUfF5GUH1vypf/EPtvAprGO7PvrJS0Sn31dXNoMuQeunkTbNGsajI+Q0?=
 =?us-ascii?Q?LAcsh3Su777MR7TV0eGl4+bl1CeXQ9UJPJ46cLoZ/4dv61wK6msBcMWguJxA?=
 =?us-ascii?Q?+Q7XWZZLBNO/RxFOBINCTetTgxaiw+Z8IpEILszzOGB2X9so1/bcO8Wvhn8k?=
 =?us-ascii?Q?I8Pgz4SFtZKIfuNmHZy2hoq6i7zcJ1DeKrkrpRblnyHaKPfbi7W0FMUd2efk?=
 =?us-ascii?Q?b2L40QtrmaguDGkKTXVuDuhelOGVoxtDek20ABpZ5vP3uv3TzOHVdFgdcXBj?=
 =?us-ascii?Q?PksRB2xagnyh8ZUAjbeInqYlkDaKR7QKzgbSzp/0WTKRLcouogPbBAL8LXDt?=
 =?us-ascii?Q?/7ZJ15DAn1X5SwIcOSpvMgVttdenhSWIVMexmNBo8IDFz5P+VVQ6+0yPYHNW?=
 =?us-ascii?Q?SD3RuN0Omh+Nool6qFoc6vvauCYBOn4nWJBc5V2ZOtQK/hGWN7Z24EbN9z6s?=
 =?us-ascii?Q?5fY/ewF5zeU+b4WGpbr6xJ4/U2qZnbP1hKo5r+pLLDvlV7Pe9/65BD2X0mPc?=
 =?us-ascii?Q?eMK3IdTGo+6wE4ARfegC+Qe79MTYAI5enDroN6texznnvDRDErdli2yFT6LD?=
 =?us-ascii?Q?Q04l0X5Vs2936gwF12w0iXxibr/AeW3/aEeqVxPFmZOzZHzMq2PelQN7eH33?=
 =?us-ascii?Q?OpqgaxAxT/gGsufisAzAEzDLe19yOnwAZ6N3f7kiT74Qe1ug7cVKfM884FKs?=
 =?us-ascii?Q?irVLVxQQ2La/0/NwK5DCJ6wbUaeqdT4RD4I8dGv1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e6dcf6-eda8-4559-f632-08db55a0a23d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:01.0595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teW88wjL1LaKDbovBPYThRqnSsAyoX/uG0cb6ZDJsLBFDn5S+EelORFuXyI4b+uz
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
index e02bc94a6c80cc..3a72859747bae0 100644
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
 
@@ -1952,7 +1963,8 @@ void iommu_domain_free(struct iommu_domain *domain)
 	if (domain->type == IOMMU_DOMAIN_SVA)
 		mmdrop(domain->mm);
 	iommu_put_dma_cookie(domain);
-	domain->ops->free(domain);
+	if (domain->ops->free)
+		domain->ops->free(domain);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_free);
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 2823b0b23e6cb5..ddd284f8e5b768 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -64,6 +64,7 @@ struct iommu_domain_geometry {
 #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
 
 #define __IOMMU_DOMAIN_SVA	(1U << 4)  /* Shared process address space */
+#define __IOMMU_DOMAIN_PLATFORM	(1U << 5)
 
 /*
  * This are the possible domain-types
@@ -80,6 +81,8 @@ struct iommu_domain_geometry {
  *				  invalidation.
  *	IOMMU_DOMAIN_SVA	- DMA addresses are shared process addresses
  *				  represented by mm_struct's.
+ *	IOMMU_DOMAIN_PLATFORM	- Legacy domain for drivers that do their own
+ *				  dma_api stuff. Do not use in new drivers.
  */
 #define IOMMU_DOMAIN_BLOCKED	(0U)
 #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
@@ -90,6 +93,7 @@ struct iommu_domain_geometry {
 				 __IOMMU_DOMAIN_DMA_API |	\
 				 __IOMMU_DOMAIN_DMA_FQ)
 #define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SVA)
+#define IOMMU_DOMAIN_PLATFORM	(__IOMMU_DOMAIN_PLATFORM)
 
 struct iommu_domain {
 	unsigned type;
@@ -250,6 +254,7 @@ struct iommu_iotlb_gather {
  * @owner: Driver module providing these ops
  * @identity_domain: An always available, always attachable identity
  *                   translation.
+ * @default_domain: If not NULL this will always be set as the default domain.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -284,6 +289,7 @@ struct iommu_ops {
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 	struct iommu_domain *identity_domain;
+	struct iommu_domain *default_domain;
 };
 
 /**
-- 
2.40.1

