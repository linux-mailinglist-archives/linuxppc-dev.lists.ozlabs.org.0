Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE4D79EA0B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:49:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Koh7GwhM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm1yh1pz5z3djs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:49:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Koh7GwhM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::620; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s43zvJz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dhp209GRmY2SdzzncXBj/08UDA+7J8dWFpCBzNFSaqWwWVyjLjHApjhWmLgXuZOC9a5mdm54PzjyiU4k2FSgcsDGa71Ji+3gR/i1XRxAIpLoYW9xKnou0GSgYF5gOTQoXzv5IyZeN0jXuHVBXhzy3fOox6/hzvSNa0gIDti/O7a6q1ZNWzBQCIMbQGMF2TBi0momT0ZLmfpkDZ5IcMGOmIw5HN7/Ae4wXTtTY4sZDYtNxfe+UrW2PInk3AxeqHDDuIshym4OzvLt8aevu60Qm3PQIfYCboNA8G+ANeYQ16ZY0ZWEqSe4XuflxxRuljVAtHMotxMJCBz5ZiTw64l7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD0DVBSjjkpOMjmpyGW1ijl8HkGZ6shjv/AThFfPhtM=;
 b=boRbu/WCqsQKrBHolsLof21tMYo/Fb5QuzATiqGfrJNTlv2PDMwnMeVlLEG0L7yB1dClxrXhvbgyNXc/FXiPUK3czew/TMgRq8CGCF1eDHxmzTNBKHdNDjL9xfiPJBvl/N/Q0h6ctVg9h9IN1Czn7MWIJrTJ6xGVUUVA/+Xp5F5vpt9aHCBWo4FpAVEwFJ5/EfvR/2qT8SA5N2snNBMT8/g4+5ZUcN/CfPbjtT2JRXkrR+tteqTpX4i8PP7JLs+oUFT9d5lQ6srXIEX2e+PUk1omuDfAZD7//0nVCOj0lBuV7nsvWTJwbb6/YbkVQRRnYR/4OqruPg9W70GWtXz5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD0DVBSjjkpOMjmpyGW1ijl8HkGZ6shjv/AThFfPhtM=;
 b=Koh7GwhMllrAA30YsnLiwB/smALsKHlfK+5oZF2jYkr0sRaQuBgpo8HwuYCxgERJLDCyA+4YYfBJr15F2uE7sOLQolRjaF6F3O+Eapu5D2u58S8/w3gUUQqjLzEZKa+YWsba6CuDTtvgSmLBsQdgKf+sZ4K+ua7BrMwQHXRBrqL8vRmpHiYXg38bcTk0cckZtojDBKMX/9qPoITaPGgoxW4h8pWBSyIiD+iRaaK8Z2dYbS7PcfLuhVcKcbdWdA8Odx+tkzwEEaYqWfXv6Eng0CZvYfHggXynDVl9JI87tyvF8wG6AmV+JTpHQluGwAh8sSBH0CoREnaJYbTvshAbdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA3PR12MB7923.namprd12.prod.outlook.com (2603:10b6:806:317::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 13 Sep
 2023 13:44:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:03 +0000
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
Subject: [PATCH v8 13/24] iommu/omap: Implement an IDENTITY domain
Date: Wed, 13 Sep 2023 10:43:46 -0300
Message-ID: <13-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:208:23a::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA3PR12MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 80be4208-358a-493b-5b0a-08dbb45f7c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DOkoa5tZvlHnB8Knqp6/UPArS8yppbb2pyox7eY2nYhdewmlvwvZ8RJo9CACENLL7MSY4iXkTbylqDCAxKkmelEJaZ2JQi7XCrB1RRdXHqSPr020HE6fUIgYEppWS82a95pOe9zY2JugdO+jBeIpf3d3NX24toc7y4G4L5aRxTYkhfR0M4MhsqJlu4Rq0S67JS6WEX8pKsyd8CjHNJKo/J0JVgnpk8MBB2+O6FaoOOmq7wBXO2oyzC7m8KbzJ5JkivgsQlsj6mQUq5XmWvxXBtUjiz7QkyfwZjBCb2amTDa94Vi4WvD6Dfak+aTbKn9YjVo5MmB7HAw6jOxc8r8CeC1aG+Bw3dWGacsfYq1Iy2nOVax81oxce4J8E9fI3AiewUX9KhSp02fnUi87I3eGtYSiDFhZPga5R5iC4PUx4v9fK1z6+DXvdyfWSY6gYw4rS3cHmQP+x1hhmzSo7O/LNWUg+LPI6naBsEf2JPwfLjXMH7JXi2IHYzbjopfUeIOvWC/FOsQjqqB3knRjOEbdXwT5Ms4ybdmBrlHMXdSMndExIRWGp/O06hCJqk7BRD2x74zkPA8bXbXD1wuRnBTMjwzCnb37W1LjdY3Lz3I/lc4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(376002)(136003)(366004)(1800799009)(451199024)(186009)(478600001)(38100700002)(83380400001)(36756003)(6512007)(26005)(921005)(6486002)(6506007)(2616005)(6666004)(86362001)(107886003)(41300700001)(316002)(54906003)(66476007)(5660300002)(4326008)(8936002)(7416002)(7406005)(66946007)(110136005)(2906002)(8676002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mPq0rn4iCgiBrihDLxaeIj0BwbwzOgeP2fSmjkZwTvA/ZeupnEp2nMCKuphN?=
 =?us-ascii?Q?Xx5LNcN7va2cEFqdlF0/ogIX74YP4AcX5pD03zflSuwLcSqynwZmBu+49enu?=
 =?us-ascii?Q?vpsqM/mhKabVQTyreGdD+8v/CazB7SXgPL3H5Kenz+Xqgd7QKH85CXhug+iV?=
 =?us-ascii?Q?en1LpzMohJEpgcx/onx9DLdvlJpnzXZoKK9VGP5+w+hqxF7DA8KOloZ2sgF/?=
 =?us-ascii?Q?JQaT4G63oMqHpRGIQGowo3LV7YwDXye3KzyycpMiDDXPyvQZ+csbLSAnXGW7?=
 =?us-ascii?Q?KksgnZUKeH74R1/z+fK/pCfsI1JYipVjYFBW0IuDl/fXVuHeOMkSddqQnmOI?=
 =?us-ascii?Q?GN0zxSqOMjI6lJyAUrWqtkaMtyO0XEOnL+p2L/qonfsDHeRXQgyfq32Cm3da?=
 =?us-ascii?Q?SCFCR41SCB8fNIbwUfqnYDnhd/39/KB5loyEa0IZGn2IaCKClrrYTiDbo/7a?=
 =?us-ascii?Q?44Yaa1fz37EduYhUx9+dX8w7D0kqy9EbId7/g5iK4d6QDy2yNhjGmDLOpPpA?=
 =?us-ascii?Q?G592HReBZ40FvO/HJ25RuZGbuCcH80nFrrwHyerE+yAPxjJ0WJV05MlDUsio?=
 =?us-ascii?Q?dnyd9UVUc4w1DiS8LCRtop2PE+oQ97/PFC09X+/RX6wFwX7gT7AutVHSTQTn?=
 =?us-ascii?Q?CdArOkuv2oMhSiXQDtRw5LJ3WsO+KagkEOyqtS1atKegTx0baW00vG3U1y/c?=
 =?us-ascii?Q?bgJWfL7nrbyku58MHRQu2mF19JY8VzB66/mUs52xCf2cM464BmMjBhG0Cjqj?=
 =?us-ascii?Q?yN/VeePz1D1iKeq0hoyWV34fwbpV4zZB3L1tabn6vTIHfbRDg1UZMaDgaZ89?=
 =?us-ascii?Q?u7LX4FfAaEauvTuXbsBdMnrGpeW+f7sQ6KQ3oriDwVjdcw0RxlPYtYTLw98P?=
 =?us-ascii?Q?2bXo4b8X7cq0TIbFobnvdeNmDS5iMx0WLTQljosVEUErm0xoHatx8TOzCbIJ?=
 =?us-ascii?Q?/cmvXPw2Ba0Kslv9jxChfBROIKSqnhrFMegV9cT8MuyIRycnnNYB7HCqFinY?=
 =?us-ascii?Q?lDuv3vRRT5y4+ZBAPzN33k86u9m6+AbhxdIVSfjDw2eX28DC3b4w0EDLv70m?=
 =?us-ascii?Q?eLL9JiB5q7CgIN8djnd+Sxnwkd/D5CekLyGcnq9lrKlHkgviKt18Un9RRns8?=
 =?us-ascii?Q?UVx6CsunlXLfEOwgClu6luIfCokhyQF+V4pJQ7TJg68ORAZoVeR1tALFNg1C?=
 =?us-ascii?Q?RasG1xV8ndBP5A70O8WptqQ12jjfzxutZX8Du+5Rm/z3+AD1ajNI5QsLCJzG?=
 =?us-ascii?Q?5pl5j1XQOqmFF36YnyWjcXieb7lpSyviNGVCmJsTmQGYfnqVfp8bXqejzzkn?=
 =?us-ascii?Q?R1oCqaoxpcdfJK/89lffUubebmwI/8JEAmhRaBFhhUPQP+gauU7tNVB4k2HW?=
 =?us-ascii?Q?RzFHOEIAj4C8+5tQPOM3AMKR/+vHd8zd9suE7icGrTw4nhP+sUJyyWvkQcMT?=
 =?us-ascii?Q?tP/DMQ6cDv6ng55bJlHVc0e5bmDVH7XoMmBUsQsKF+tQjzxMezj+ALOZTUOw?=
 =?us-ascii?Q?sNer6G0PJolqcHuFJrCZzLh2YLF/idf34n4MppyEDpGaYpaZqkYC5bgZrUKp?=
 =?us-ascii?Q?O0sCIjZdJH5eVXlpOEI/I+utL2WyuMt5DIMg3Q+e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80be4208-358a-493b-5b0a-08dbb45f7c4c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:00.4899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88bzyXfZ7TAVPQwocI8Etj1n02P2SQMAKjUKy36C4sW5TQagoR/j4+1EFkyH1r1Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7923
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

What omap does during omap_iommu_set_platform_dma() is actually putting
the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
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
2.42.0

