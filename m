Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8C79EA67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 16:04:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GdDvr5DY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm2Ht2wn9z3fHk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 00:04:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GdDvr5DY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::614; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1sK3Cghz3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzrRZ9O8LBvR2EFYlji4hUGIB1Q4lv13HahGRK72MoI+eBdsbUkYcMOmHwfY3/16uIBaNUiP6Qw94bOnZ+IAraIHcpAIz/gPnhfXGx+9Smi/UZadtvvlCxa3G9mz5DjF81xXKBnJcC9LwS+AqPLGYIHvU8L6cPHj37ygNfQArJnK3IFPj55mVojBFYCJ5V5zWBBVXLnEbafdtPzANPls6oQwrA3FQSAmc9EdKFkOtZN14QLn5Yj3SEJl6D1puHFA/Vnl9cYj+7GpQHldkKY4dkaC//tEuUSS2d20aaoF/8U+zs4AcPfPPdWQ8nvgjzzp5Q2CoT8QjU/2xR1AlwKVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2jv323DicUCJ6ummfabKbLpPgVIgO9GqLD5nUfu00M=;
 b=SDM7T/GrrnZid0j8uJRSdhnv96A/EJx2Jo6LOQWE71Xv1rdqCWE+08ylrW84icqR1bl89yRveunnCDhfmSet3RQb1jk2+3Wmo8rUjA0anj9Vcm71uMAssvewDp6dfF6Csvld+R5+vLYexk+vTg6DsVSOH9m3k61BT+/nDqypkkJwuZ5s8B1C9GmR+9paWHxIs3o7CSaONmK1doXLQ9/xKDOUfRFea9W9MbFYXmbwP9v3q2rdj//CWX4z9mIOd1cZN5G9eW7iFASEhTcpVVOK4yq2d/xOfwky6bfnzBvCxc34Q6XbaqeoG5yNxGoyWCKKE3ft650XeDI1LhJF4SPTnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2jv323DicUCJ6ummfabKbLpPgVIgO9GqLD5nUfu00M=;
 b=GdDvr5DY5AGMgiNoUALT16I0OsBHBix1P6ZxBtT8iXjyCbA1zt3vgrV3ta9g8pHY5HYf/DTPx0cHbdeQEwgBGyd8hZIborDE4qxDsfpUkadpelgfMIoqQlQBZceEnw145w2i07SGISl17mpDhvN8k86ZtkydGp+TC/W/Mbhs5jiYNfw4FFUw+AILAKYekPUC/htf1YRTImkCG//JphIlg+nsi5+FxZNJfw5M/qhUb5NiEdNrN3XmwfMMoL87GFEcLqzxf0zDIdDuxFDlmO2H+mzC3SdsT1xvvuZiXF5SXHsRpG+wtSYhdacJ+MO4x/6GMmjqgmmx9nsU0okM9GtAjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:44:27 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:27 +0000
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
Subject: [PATCH v8 18/24] iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed, 13 Sep 2023 10:43:51 -0300
Message-ID: <18-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:208:23a::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: e9fcf849-e1dc-4b0c-39ef-08dbb45f8c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oG9lFtN02A4uGkJDPQ5hArygFT7sToTaS/MPIE/Ye239KF8KBqOFFBrnMa5/cuCz+CLT2sHfGx9c+yS9t4UzXQPLncJJumw8b9B+PHLQT7GB+eilISXhDq6JKi1qmgcO31wcOjFFOt2YfcQQ+ZOeJNXIAX91+QU6vSZPYxKhpk3jr9rk8mSkZapalZ7NyA8K4PDn7ge66sl9UD35q0IyfwuP6QYTMYGR/PQz5VTyOAQtZ1CvKT8broPUPB6a0z5GZ8H3dJrwM99FsCgsaxjB95mvpo9CPtz6QtX6qXRSlHSHsl67V0zi0Ml9U2cx/W/tictoPNyNjZBjj9eN2FyjqHYIwI7g1UhE7YygIhrb8M9Bd5tA4Adgde76WQwInsxQq4cVtpYuShZ2GJHrjN/I09PvK5QlEgQ0N5HIh1J2xfd/bW3HgXzP3lg7opX5MNiZJ+QIpyGZTm3GyJXh4kSYwiX2OGG0R8Yx9DmiQOgvhPwVV2u9iv3wzYk7ZM9ypLqzmWlolQ2x12OsFVkmbYBXezL4x5NYLHuRNrgwqyrydoLzqrSeY501Qzbd3IUJNSXYbcrZdlirOB6IN5TsDdcZBmYRMo+2X/HeehGyaCaeOGA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(86362001)(6512007)(921005)(66946007)(110136005)(2616005)(478600001)(107886003)(6666004)(38100700002)(6506007)(6486002)(26005)(316002)(4326008)(54906003)(66476007)(8936002)(66556008)(41300700001)(36756003)(8676002)(5660300002)(2906002)(7406005)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bAWX+kDWdatX7kGBfCj9VyGX81kDriijFkEVuBV0oJQXmq+mlwWziY/L9OLy?=
 =?us-ascii?Q?h0tzwydMekS4lPY8d9vOJNMQC4IsR/z8S8wUY0TS/fcV+lJG6d/EbNST+FUY?=
 =?us-ascii?Q?I25bOkjnvHDC7wM7v+kVdM9zVejceHRHRahiIDv37I8GOhcZD25yG2U/t93M?=
 =?us-ascii?Q?DIlag+K05jx3eF2dQVyzzmkoofa0LoYuPYv/mkmwIQvg6+olUKvjSKKJ/H4i?=
 =?us-ascii?Q?MgoTaq1CA46vxQ5ZHHUJP9sYE26MH66FVi2YRNSTv2RcB8DOw88uFTr1pG6E?=
 =?us-ascii?Q?8D2yUkEYwG4akdKl3eLwqxaOgoGOEaQYHrPmxee8jWPHNiywZiSlCcaUSyXo?=
 =?us-ascii?Q?MHXgl8YOg/nX3jRDf3daUwJHYbZj+s7AArYRtd55LtUQbBu1GkPfMtD/OdnA?=
 =?us-ascii?Q?21ivCodOJ7i6vl9RAGi62Mspf72uCZk7v2zH9EkZdfKiCwO8K7OTqLYiMiEp?=
 =?us-ascii?Q?S2IVYx7JIs7U89kErcqM+DdBYigndLoi81bQig/8Hl3bKo7//N4cy2wFZKRl?=
 =?us-ascii?Q?zgJexsjKtqiKPJIe7sdGPA/LlYRrFYQqO8WVss3j/15VVUnsKhXe+fomOgXO?=
 =?us-ascii?Q?atszIaWLPtSMdX4grH2+1JGfdZlj0BPIacnYdQRoxgKiNz2GVAgjVcNuTzS2?=
 =?us-ascii?Q?ViSkwSH/0rcDafxizQ8xFaUWnc4uEUaWP3CepiaZ18fBsr1CAPs0d8fouxkB?=
 =?us-ascii?Q?xaFx1zDEKTBGRycDk6LVPOZLhkuelL12ByYq4H2CvKIQiW9M50i1iv1pTkQE?=
 =?us-ascii?Q?uwvTTJSBrE245VT3W5BengE+5A77cbNE5hPHUxFkKmFVTH6aCEMOGieWgbiw?=
 =?us-ascii?Q?6mO0NEvOhJ2tXow7Gh6/I6Biflw4h0/Ge0ZxnYGJfrktRL/98P8Go9o3UulP?=
 =?us-ascii?Q?VVEdmbsVatBHxg3G8Bzn9SNeKmfKOLymW9PYnL6sIDKGMmMWizAAx87xe+1y?=
 =?us-ascii?Q?qS+3F6Kz2qqwFbBBux5kLhleoBiMwff3qx/VymqApbAbgwIhFcKbqB+ibybd?=
 =?us-ascii?Q?MTtJs9/qSSNCIXRd/W2uOcoSGY7W7x/YIS9+JmhA8LxzpXqt+erBVjG7lVm/?=
 =?us-ascii?Q?JdXcP0d+fLcArNWpkoPEm+bZN9dkr8MnlWvozL1wDDOMm8fQJLKK0qBpc4T1?=
 =?us-ascii?Q?gN4yeqaX1fg7JAqdeaQIsp6BmBYJCFkMWQoa86APHDxbt1dqdE32RnSLkubG?=
 =?us-ascii?Q?Tnk61dtEiurn62EUAhEZDl32jgNPgfmjM9TBq2T9mkGRHFsVmYoh8LDNUAVP?=
 =?us-ascii?Q?mmw3QGDbSfsxwi770gWlOg9avX33BNz54SHhWNeIpHjJbNAU2iUBpo0g2vu8?=
 =?us-ascii?Q?4bjKgDBp9i9RvteJnIGqppa7PEHQIM5Lls/z+5HXK6FzStKPGwSdwJlCr3Zn?=
 =?us-ascii?Q?FXyCU9FWH4W6VcNnM0nbI/PBLm4EvQPbOu1X4ECirY4MnpCjbwL7H5QXnJpz?=
 =?us-ascii?Q?ozmZPATxAnjSM32aaoG6m8hMg5zHXaFehKemkuulGFakx8voPMfIs0bC18Ms?=
 =?us-ascii?Q?dwDdZttklzV4YhDD7pKZa6TvGEq9VeNVvjJ7oK+C5Np9Ic6g4JLJQ15rUvH1?=
 =?us-ascii?Q?8g6Z8yxX2Z2l+P8JvtAQzoci8IF8Mng14dgDOsYu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fcf849-e1dc-4b0c-39ef-08dbb45f8c49
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:27.2983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ad7Rp4w+9b09PX3ZxuNV8ab7kyLB0mtoeqzdKqtOcXEd9atRvd8OwBUlY0tlF66
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848
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

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/mtk_iommu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 640275873a271e..164f9759e1c039 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -777,6 +777,28 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
+static int mtk_iommu_identity_attach(struct iommu_domain *identity_domain,
+				     struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
+
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	mtk_iommu_config(data, dev, false, 0);
+	return 0;
+}
+
+static struct iommu_domain_ops mtk_iommu_identity_ops = {
+	.attach_dev = mtk_iommu_identity_attach,
+};
+
+static struct iommu_domain mtk_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &mtk_iommu_identity_ops,
+};
+
 static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			 int prot, gfp_t gfp, size_t *mapped)
@@ -996,6 +1018,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 }
 
 static const struct iommu_ops mtk_iommu_ops = {
+	.identity_domain = &mtk_iommu_identity_domain,
 	.domain_alloc	= mtk_iommu_domain_alloc,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
-- 
2.42.0

