Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE0B76DCB0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:30:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=j/dc+Ka7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGVBF1wB5z3dxS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:30:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=j/dc+Ka7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::600; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThx2z5cz3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDyxw0m+mdwMf0HRouOZZQegInVAr91zmgtrm7XQudRVQpf5/do5KIDsVOaxgnBlCAwV8o6Ph2UiIw6sjHR8stHK8wmM9K57M3844HYM03H6bay46T3antmosuC3vEp+ZgXQE5R478r65yGan1k/1JMBRlNgJu0USKfn5xAeDRNQIQMR5wLLT/awynzTeGEoAGCrGXYfhhWjBKKdynsNa1oQuTv0Wf8TikiheMGJP1HFbUk4gUGABWeEkU0chghOExtN7K5K8pObeC9ZdeYaNWxQzR3bwZ9Dlc4mi6WF30JLTIrAMrXYUPJtySUA0najn6ALcmatMY+7riNyJIWXFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnwztZzhnKcJvd0Nzn38I2MWrSZEuBXanKr9pCFpFEw=;
 b=aEcv1APH4CFwlMul4sJHfJ1orY2DD5HATJ2zYwjRzdznaKiwU8KE/AOA2IAFeHzP/MWsyW7Dph8vB1Py7kY7LxE5aBTMvOTgnpO/ZSbJ9gqmlqe1TIuFyI6fhOi2IgqxK1PsADcJTH6hTxp9Yzv6USCIAmzah/TxPbcAST4ZhLKcI/FcKFiDfMAr5sUshz5O/L/Mu7Gq8zjbGQnXCIQNWM7tdVWR1Hu544G638TbP5gMOua2rUZSrERn/14F+Sobf2G3aHmLNP7w9iCqYUUMuWHkRX4JmYSLcckLl2LCNx9JGk5gkir4xk/aPLlt4h4LIiYWxhGvQEL3a1MDNfIKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnwztZzhnKcJvd0Nzn38I2MWrSZEuBXanKr9pCFpFEw=;
 b=j/dc+Ka7A8sg1PmBT3x21yhEH0rRrlzGlt4ImK4vZ/uKUSw0xfx0yVBbM+NlgKzkg4eKiZOa0FZaeaPV3CpN0lYhC6Gp2S/MR55X9B6AHV7kbw+h0Zd3gvfvWY5ZH6c0ZvDfZo3nPd/ZwqUQYTyJgaxB7eSRZNGWawGQRKL6A2UDf1tSLiZa7urIfVY7hj0orPbAt2IpMvN7Dy3hzRf/HvQGvo0C1jq4qyT90eJ3eQ/FOeC/Dq0BiVW2nI/5CE9hTOD65PsQH9++ZTLThJp2h4O6Sw9KTW6xP52Sik4zaF7VQxQvOuFRqSZXb+1+gpi6ODL7OrBIkPMWm4uqPV8jUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 00:08:23 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:23 +0000
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
Subject: [PATCH v6 23/25] iommu: Add ops->domain_alloc_paging()
Date: Wed,  2 Aug 2023 21:08:10 -0300
Message-ID: <23-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:208:32e::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8053b1-47d7-4855-f2f9-08db93b5bc83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	utUmjRwTcHWb+V3t690C0f540rSTKZ1DkjxguZR3u589sfhhuLdlnHu62hV+JGRzD6q8VNOFdRI6psJpEI/mQGzWplBQ/uy+Dw4jCWv2NVEfwgMUpL8KdmCvO7NwYNZgUwv07YwrYWxqs4NJ9SF5d7rmFL0tfAc4QMp2KJ0TLMzlcQrS3xqR/c/t/alnaz0UAA6xT1WlZdpQj4NUdFx55Zm74hEvFkyeIy9brEzvsSRv7cJC/VwP3o2YkEpAc3e7glOrkDcc69u+OsthJPO2xFAv6oOLGyhKir5R4s58cVmhmmogImTXzVoyg09VYnvQcO/KBh8u41hYJYBefTdwOXTQH5JOuGsW/XS7pXJKCqAfnii8jppV5C5MTrMdb1YfDtAGxN0PhgC9MGgAYlLANxlWGZ1Kx7TghN70lSh0HAby0SWi9Ur6/Ko8m0NmgJ8YrjoYNDhbT6lJ3GujHm+PcqCEE3tGk3P0A+nlXuAOGxdQpXjNhOPzcmOF5V/nmUitefGVGGzoqez87wnax8QF9gizjvorFgBgYaW1RbnPOkvfMoZMvh29lxlZ1OQpPhmxYCNVYZcaYVkut2SiCUAoR1BCb750sCJ4jFk0l2KKhWcBFFcPKMUVUtktGysiKhW4y0CPRLgaV81VFd2+MEw26A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(7416002)(36756003)(86362001)(7406005)(54906003)(478600001)(110136005)(38100700002)(921005)(83380400001)(186003)(2616005)(6506007)(107886003)(26005)(41300700001)(8676002)(8936002)(6512007)(6666004)(6486002)(316002)(66476007)(66556008)(5660300002)(4326008)(2906002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?8eWN29tiBnkczuLBd9Lza6aY7qd10cJHMfge7o7ytyHC1YfQ55HyqYKy5ZmU?=
 =?us-ascii?Q?zwYObpqyMcXZz2lwMqIoHw5bqnOGQimZbte+4T4BOlWIwxQE8Tgq631fK2mB?=
 =?us-ascii?Q?loZgLrROBQj5+piZl1Q+kvfHkIFOeMZMUeUuJs3RruTYqc9zC6vdrSZoABql?=
 =?us-ascii?Q?X2tbACGnzB4UzI3EFot9ElzBdikXD7lvqmLa9GGH4BM5Vgx8CNFjj7yd5TbT?=
 =?us-ascii?Q?9srkVGfjtleAKzxzK8oncTFTL4o8KuOOQN6hulxjoIV9wUE1kELexXKwk9ZX?=
 =?us-ascii?Q?1WYQdRwJAqUQ2C65IAkBEU2fYb8AVvkoHGN95caFrRhpbfzp0CuuswoQCvZV?=
 =?us-ascii?Q?MMO4tc0D5gPor45/p693dm6vLL1yZaaqvBnaa/UUvCK9q8WjY3yWjdVL9UAL?=
 =?us-ascii?Q?SzC14wHDDAqGk5skpyt+nJoAcFMxEth4wx9kICpKqATXJxUyJn9QcK+CX8bS?=
 =?us-ascii?Q?jo/u9RT2T9YhgZ+/lj1PPosOKmLFRdqdejDhXhy7ozXm2YQ/H9QNhEzFLoba?=
 =?us-ascii?Q?TpjpZQeD3Ua0ISeBFLmvOI15mfvMNwPe5k77RtlzCQVO0CpuwIFaNM/oQw6A?=
 =?us-ascii?Q?TWS6PmBeY0n9U3lqWuMph/L5hmsQ82Z0hlt+KLMA9MFKiWLIcWA/9rnVNszO?=
 =?us-ascii?Q?Nt8JdgSZ1SIa82g5oa2i9TR4ADe4PcaXdo5tkoxQt6HIZNX415kLq/Hbr3pa?=
 =?us-ascii?Q?NKohy20r53lWXiHeB0L/U0S+C20D+8eq/rR8qjtZsmrSG7phy7Ys76022f8c?=
 =?us-ascii?Q?SLabgKpAy47LaX0LatBJ21dWJCubjvUd/TrV+9EC47EO46EwJvvxa9wvQ6VN?=
 =?us-ascii?Q?4LyZNERoj2Z9FWWLmDr/vApk8K8f8ekXJ32LHz62BeNUkfuqLCyWHphpLbdM?=
 =?us-ascii?Q?ZQpjEn3ja3+AV/rO5abD74L2SUpzdq5PeJ46lNeBz2NviFaNs2rb1E2o+7pb?=
 =?us-ascii?Q?AQvtu+JL23WMW9mJR2AqdVF3wXKeUTgYtsbjWZuhe1cHR+yRsuJh5Ku3ruoP?=
 =?us-ascii?Q?xnFb7q/oJoU963rBF+E/hIAoxzUOCIKY//qvU3dU9ZdRKY4p9FMWxLlY2V7P?=
 =?us-ascii?Q?1Ztbd4RyLE7FaTm3Di8fkK7NmJtriPSCk8edcELFsfqf68X/5++gBj3KVGcP?=
 =?us-ascii?Q?3ORbjznT+U8bpFft+JuQRlS4D/od614cDNjzRZojzz5GjSON4FeZ5eWVPaFM?=
 =?us-ascii?Q?dNwFJPPDEYkCyCMHrMJKse/sVSl4BIRxzVRFQ8htoxjxgykfUxtjT2WzIgs+?=
 =?us-ascii?Q?B4Or4FkI+wBgP+qp7V9PDLbCUm8Irv4FnkyDUkR+Af+gmMeMPNUBiC00cuzZ?=
 =?us-ascii?Q?4lQ3gubHpoa+jI2xN7D4dps5sna6y4twOx39F0Qsvdh1tacX6OBPRT/EzW7F?=
 =?us-ascii?Q?0L7aoI/wecuZl4zOBdb93gWGwKbLZtRHJrJK1LhtrgRGUADlWk8Tq6kTMs32?=
 =?us-ascii?Q?QcYViP75w2jcY8tsTo9VV9tZIno9TcYhLnRIS1lOH2bZp6GDgmOP1+p2w1ps?=
 =?us-ascii?Q?xPTMcldefG6d5RK/4M/yFMkRepYuTTI84ofZ1Z/l/7BCMZJqSjwOed9O9XUw?=
 =?us-ascii?Q?s9XZtgjSwdw44WddIRdQSDcf85pGTRfAB/RDxsGc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8053b1-47d7-4855-f2f9-08db93b5bc83
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:16.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcdtvmI7T3rbbRBIVFHd+CM5XrefydkhFlz7SGZ5zff1nw9ygNp//AGmsF3uB3NI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6085
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
 drivers/iommu/iommu.c | 13 ++++++++++---
 include/linux/iommu.h |  3 +++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index bc8b35e31b5343..5b5cf74edc7e53 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1999,6 +1999,7 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
 static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 struct device *dev,
 						 unsigned int type)
 {
 	struct iommu_domain *domain;
@@ -2006,8 +2007,13 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
 
 	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
 		return ops->identity_domain;
+	else if (type & __IOMMU_DOMAIN_PAGING && ops->domain_alloc_paging) {
+		domain = ops->domain_alloc_paging(dev);
+	} else if (ops->domain_alloc)
+		domain = ops->domain_alloc(alloc_type);
+	else
+		return NULL;
 
-	domain = ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
 
@@ -2038,14 +2044,15 @@ __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
 
 	lockdep_assert_held(&group->mutex);
 
-	return __iommu_domain_alloc(dev_iommu_ops(dev), type);
+	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, type);
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
index df54066c262db4..8f69866c868e04 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -233,6 +233,8 @@ struct iommu_iotlb_gather {
  * struct iommu_ops - iommu ops and capabilities
  * @capable: check capability
  * @domain_alloc: allocate iommu domain
+ * @domain_alloc_paging: Allocate an iommu_domain that can be used for
+ *                       UNMANAGED, DMA, and DMA_FQ domain types.
  * @probe_device: Add device to iommu driver handling
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
@@ -264,6 +266,7 @@ struct iommu_ops {
 
 	/* Domain allocation and freeing by the iommu driver */
 	struct iommu_domain *(*domain_alloc)(unsigned iommu_domain_type);
+	struct iommu_domain *(*domain_alloc_paging)(struct device *dev);
 
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
-- 
2.41.0

