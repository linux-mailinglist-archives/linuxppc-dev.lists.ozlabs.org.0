Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E943B72A3E8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:59:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBjj58xsz3fh4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 05:59:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LX9jZhNX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::610; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LX9jZhNX;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfw5X8Xz3dx8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHv7t/uI4a1aOXtfRT4QP4ytyVEiwrDrLRF7toiBAiM58gPHJwKP32Iwyi8Aphs/Acsp0JQFGzeigqoWmXYymGA/0V5dlWJe3cSpE5HRqTFobT14R0UZnE70y3mC3RyTKXPq7/tSzd4M8libwkP2aULQw1UE1rjr9C2PCYrBFj7ANq6KeWeYYfDSGyVZ4e48/kTHoX1XNPlH0nF2WPHky7UfcEs2WLKPgu5WCE/Vm7NQIQJImFPEzYNYn/T+H5KHKnzhrtqIUUcMkht3HSzycV3XuUldTDPchhIQ8/IR52IIo+THHtZTLd1YYgbullvEovNMrgpP9e4znKnJnD8tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTIWsmIcZycPI7iiZZ7fmyAJtWycD0v37toHHV2MnwU=;
 b=oKoc1PJGp/amS6ojUn1A7ovyPAYp7dBsgjAgnbHYbzDZT8omL96rqA/WJrzybqjLib9w9trTtttyLbuZHj1to86nxQdPb6I9uSbVPmK7AcNTsJFYej7VkOnc/hVGdVN6rH0xkA+bMZk+TRnU4fg6DG52Sf+rqbSFYW69Vd83RhsXuJ/FPA82FXKZNV89VAnsYz5MrCSc9iS1Mj/avhPM2MUMafSMQ40GFOtcHlYQECr1e3k0nZ50QC1teVdFg2+SFicP19C8sPdR5weM9dAioF0gTt0bUfCFTaGn/JafHZ3uykjRCd6Qj2xl2rJZzzu54M9qI6oBvigijgDtlkBxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTIWsmIcZycPI7iiZZ7fmyAJtWycD0v37toHHV2MnwU=;
 b=LX9jZhNXINcnJsrFI/2PJTsVhjM9X/tkrLX+mUowoEll+vn5+PVor9G/XTyf+HeDjdf1PSCFcrBXHT27Dv+b544kkUVxKuZgVKm0hJheuyphTUrQOyHD9LaDwS5tUWnNzgnoXnQwZyM5pmY7ioboBb1GQM/AmBaqE08ZwzIVs/QBUkWjQ88QLtW7hJprmzTiURT8Gh5TmkCc1wf5MKHyQxnVLWn9G9xotxz9v5cxCJeegTmhliuldhvRK8dPn/po13+lM5QG0Uzvoaa6GbkaIEr6t6cOCT2ey0uYd06Iq6KI5jAZCIfoqni3jPGCHLb0vhXnzTEwGutzSlimz4F97A==
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
 19:56:19 +0000
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
Subject: [PATCH v3 01/25] iommu: Add iommu_ops->identity_domain
Date: Fri,  9 Jun 2023 16:55:49 -0300
Message-Id: <1-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: bae83ea0-2a79-4ffa-c45e-08db692397a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	i1jtHxEXZgN+HhvGQ6cIOfCMDy6bWoa3dZmZL7vEC//e/GNfu5STOCWnkwVOpUFZ9lL6g5pP4Wdq+Aa2IGJKTF69VcEuMlODXFUHjC858txAYlY2mscfLs4tn2EIU/iWhNQq50Sgefw0G4nGD8zjolvthRjql55+GvH8EO9gwiXB0NbDdX/pKsTzw3GQZhERKVnLfo56CzenarKbNTRM5M1/9p//b8OoEJ9c0YY74Jb8t0lNR/7hRRgtfXLcSIo69+zPqpC3j8kmmhzryT4i6Bb5cqpgbZAkbp2AbWaYS81u8l2o6JmagctJ//ehU7yq7/xwLYMtmlS9T8oZn6Qfg0qz2te3PLqmmb8uY1TY/YFZW3HpaLUu7UuMs5DXAytL5w5/+Zm8GIHioQSeGZ0C5s6A+l/1SGrmDeK8tR+HIBo94DH7mkS8mURHkX73k6/1cUvGVZLPWMr632vnaEVD4VRxV9hNsYeudGy18JYWsXFmaTfRcpmMOW/hy85vDQNfYcxaTJs84XRiIJ8x57pDmcRxJ+/t3ZuEs6SUIvYAfE1Iodv6b9CaECr3lylQWFY1+wQIfrpnPqapWB7Xf+WlBgTIo7fuMgeAdcB9v/ZPa2A7BrXQ6XwqZ8zo7dWxrtUE
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2906002)(83380400001)(36756003)(26005)(6512007)(6506007)(478600001)(54906003)(110136005)(107886003)(6486002)(6666004)(8936002)(7416002)(7406005)(5660300002)(2616005)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(186003)(316002)(38100700002)(921005)(86362001)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?IkgBcjw9l9kvTsh65QYgZ5yVecHw3nFsKzSC08Jbxs4bpT6kmbmuLgf8sdQs?=
 =?us-ascii?Q?WoRm8mZE/E5qv9bi5wJaIKsldxlh4MKzNQZTNafaNeupPaiqzTzo7KASs1Sc?=
 =?us-ascii?Q?pIPiO4bcigWFqhjLBB82IU74RPg4hFyofrMpSAVELU2n07ibTSHpB7J6uS5z?=
 =?us-ascii?Q?dr24fgGOOjr2Dv+CF3E6+cAoYhElXIWgx8geKIXwWVN4EVAij+W9l17q2fp/?=
 =?us-ascii?Q?iWaDyxJWqfV5VANLIhbAY9UMQYZHlJKpQwr6rCVIWk9Blxy3Ixkitrj+K8LO?=
 =?us-ascii?Q?cMs7h8GszrymUiIk/rSTZOFZO4Q0Ceq2VG1P09L6MPS4MRFBYIunBd6RU+HE?=
 =?us-ascii?Q?WJyafGHD+trXRPmFR5XcHAEE0pxibJKVKXshRh7werLw0hO5P7cd5is+RaYV?=
 =?us-ascii?Q?vdHofuVbm3k4xkZo9q/O2TKdD28SZWSh/q3LMOIYjlmjCEKy83yKv4llfkkd?=
 =?us-ascii?Q?zFzIYpgvols/WzmqXRURDZ0OCnPmKseJWIKrqUt2ETzH/kr1tHSbVVdCjpUg?=
 =?us-ascii?Q?yTQPmR7RTwpsJcU9UEDCi2eMVEPi2R7kRZXi1V1eal3fJmS4zM2e3ZhX9kll?=
 =?us-ascii?Q?kcBs4jE4wvXerxi0CWa0Nx20lUW7iVL7r7bw+tcK38S8gRY2HHhWuAk9+bbK?=
 =?us-ascii?Q?lt9G3XlPT8Jf8oTixUac1SmSzeT39os/HsV5AsLxomQZXki3P2OyPZmyUIEb?=
 =?us-ascii?Q?YYjpqi7pg3dBFeqGnsHA3EV2g1J7NVXGLKr6YBh9ourC8zIeJuSdjQW73SJz?=
 =?us-ascii?Q?Nhb+lj/AJgVA3GaOEvvOHZ6DZZKpUVShAurZRNnEprB1SoQjwjk49Zbj3vXK?=
 =?us-ascii?Q?mP1B3uk03KaxeVof9macAXlx2u+o/QWlIxxVG4QTMyWqiS+/FG6P0b1SPKxx?=
 =?us-ascii?Q?xMCSpLHYBsUSIhcFVFF3n2Gsh6dribvxXfYchAhB/rpLls++cfEoehmr6oH4?=
 =?us-ascii?Q?ZBnizzvgqxA4YHfy5WTKfFPv3zY9xfqgAHJOMyO3BDawZU/Ilvd1ojnw/ZP1?=
 =?us-ascii?Q?YUfXAYvq0qKHc7PQlao+6syNjb9SXoxNlyPOfBUlQ5RkIerUCnZ4tzSKF653?=
 =?us-ascii?Q?gLegDbD3uLB80n6WnGWa2hZgapYd4PQfBWQV2RkCdk2geXgoxfhce2dj3VqU?=
 =?us-ascii?Q?oBPAn9tBLIMHjCyyF7388JNE4h3GSrfBpN01sU9aizcR3QqgcL+aCwVraJS9?=
 =?us-ascii?Q?3FDhJ9fJePYmCM0hO1NhRWZ1wCmeW2JTYOn+VLLhRksIUvKQHRmzKICBb4gE?=
 =?us-ascii?Q?G0Z2Rasaf3sAiEzJGhVzrGULDnp7SrEMMGvLy0O6xGPEcnDbUE4pQ3KEnRBr?=
 =?us-ascii?Q?KlzlMq3dLYPmmpSINPmtJD7MPowBK4hLJqV/yPDEyCdw4B+xrUL364lBdGjB?=
 =?us-ascii?Q?KApVg44FbcyTRs6Tq8aEfLFl+vNo9GSAfr32Wu8MTP9M6TYotLK1BxaPw9O0?=
 =?us-ascii?Q?JBjoOtld7SeFN4J5AR5fpcvcOy10FWMp+rnIXToJmP2HNjWWJTLZFHpjUAEK?=
 =?us-ascii?Q?y9clQNbIWqgMcNZqN8E4QKJo2Nr+OwbdU6XEZkxa0jAFs7Sm8m3W4VK/ZvqD?=
 =?us-ascii?Q?eN/0PbNnWw91web2NsJ8JYkXCxOe9FwQOTUr9laT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae83ea0-2a79-4ffa-c45e-08db692397a6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:19.3593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n19gpCycg1/UBsHluUJMVaQr1ogB103XEBdMsLpKiAsYWRbRem9VLbPGKrIvybau
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

This allows a driver to set a global static to an IDENTITY domain and
the core code will automatically use it whenever an IDENTITY domain
is requested.

By making it always available it means the IDENTITY can be used in error
handling paths to force the iommu driver into a known state. Devices
implementing global static identity domains should avoid failing their
attach_dev ops.

Convert rockchip to use the new mechanism.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c          | 3 +++
 drivers/iommu/rockchip-iommu.c | 9 +--------
 include/linux/iommu.h          | 3 +++
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 9e0228ef612b85..bb840a818525ad 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1917,6 +1917,9 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	if (bus == NULL || bus->iommu_ops == NULL)
 		return NULL;
 
+	if (alloc_type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
+		return bus->iommu_ops->identity_domain;
+
 	domain = bus->iommu_ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 4054030c323795..4fbede269e6712 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1017,13 +1017,8 @@ static int rk_iommu_identity_attach(struct iommu_domain *identity_domain,
 	return 0;
 }
 
-static void rk_iommu_identity_free(struct iommu_domain *domain)
-{
-}
-
 static struct iommu_domain_ops rk_identity_ops = {
 	.attach_dev = rk_iommu_identity_attach,
-	.free = rk_iommu_identity_free,
 };
 
 static struct iommu_domain rk_identity_domain = {
@@ -1087,9 +1082,6 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
 {
 	struct rk_iommu_domain *rk_domain;
 
-	if (type == IOMMU_DOMAIN_IDENTITY)
-		return &rk_identity_domain;
-
 	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
@@ -1214,6 +1206,7 @@ static int rk_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops rk_iommu_ops = {
+	.identity_domain = &rk_identity_domain,
 	.domain_alloc = rk_iommu_domain_alloc,
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d3164259667599..c3004eac2f88e8 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -254,6 +254,8 @@ struct iommu_iotlb_gather {
  *                    will be blocked by the hardware.
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
+ * @identity_domain: An always available, always attachable identity
+ *                   translation.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -287,6 +289,7 @@ struct iommu_ops {
 	const struct iommu_domain_ops *default_domain_ops;
 	unsigned long pgsize_bitmap;
 	struct module *owner;
+	struct iommu_domain *identity_domain;
 };
 
 /**
-- 
2.40.1

