Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D2C75FD7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:24:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KTFJG2W+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8n8M0j6gz3bTk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:24:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KTFJG2W+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::611; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6X2TSgz2yDb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vai1kMnFdYv6xMQz9nXv7R2rk/xqirQUT05/P2ykE3Sdbdf4hVEUQXyVhFUcLyUm3ORpI5Czu4Ivobk8Ef6XlOgbYvRUYYRfbB7fgMYIfAI+0XQrQKfWLlQXxDWWLn6aeQi0iJMzjUa9ezePL/PWMPefXIcnzNmaijU+0chNpsq6r04eNkSDnSnjZbeXllPG5XV1VR6nytwUguQ09Wyo7uofoPyoqxdsM+3JVnkbvXTsB+U/zEFDyBk5MCDts3i4p51jlE5iSOAe/IB6m9Wk26Hp27D4zC+uSFNFPA/6sux/j5L476WiVlvuUpGAIT16RjpvGyBAhYTu/2GNHtjFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iHXF79ZsLNr+U25wG96PT5wqn685MqH0c6RI6HOHFE=;
 b=D5RTRFLhU89kCKNlqQHjU7LJ1PsC53zT5W/GNb66cE9NRmhfUwAAe+VG6nhBIxWoLVEE4THFfVw3Tx4bc+FMgghp7sc0x9wlj71olq5zGem7R1pCc09Tis8NLFa7b1G8JQZrftW7fZN228HLq/YhDSei9hdxetF2QD5MpC24iES/Ej3bFbYA7pqmjEbP+Q9fm95Vffw9xg6gDOgcuv9E/glW/Vtt8LDv+zp0c7n+QyXucBKdIpMsBzsWr9L6JrMMz231hODEopDuS8PIwV9VykqrVq8aKg5unxEV/1K3DSHcoQs0WJu1mDWwyvU07x0J2J/seSd9xzx6uAEk6dfRtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iHXF79ZsLNr+U25wG96PT5wqn685MqH0c6RI6HOHFE=;
 b=KTFJG2W+zf56/kGEnotugblu7UBDNUfl3tlDYImw1x44Zs747A+Gz1nOGax1Qr0iJNACGKoDh9tkRvTbvlz6IRRMFAHsOIxyLWZ2laukOn3KSCN/sRL/ghV0H0spdtMRUNs874sVyndpjKZ6fG37fI7k4I19MHmpws7Cm7CqSdAnJ2CYEDJb8BXRgB1SQgTr1tw6BvVTRMyVpk+0/wRPtcRDqKUt4DoWHzaEuigGQ0chy08LnBR3wYMzir+id3tzXsGxB+afsvADh1Q9ro3DV8Ro9ek1953lepl/K5t2+1uyqhun2fel1K2Gz8/e1EMEW2xGf7FsnDSLEkkrHDqm3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:17 +0000
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
Subject: [PATCH v5 04/25] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
Date: Mon, 24 Jul 2023 14:21:54 -0300
Message-ID: <4-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:208:2d::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: cab6f812-c85a-4773-0a0f-08db8c6a8754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uB3bJPskIZ+5Mdwkj4kWSwhC04m9GGeDmZUPqVVS9EWDyDMzFpVAn23XUUClfxbJz/gd7nwVYRzvYcEar33DdI8pJrGR00udEJ5S+mox3KJhN5U75rmgU8YKY5VwbZlSSki5fjjfCy0BuRRRXQWQ2gqB8KT2Lzu6jHyw1r1oF+6sd97FMve/f99GqDe8MmapuGJxB2DaM7DBs7c/Xuh/tD4bNnnAWbOyI4QLKnXeX3qDt3JC1hkadLvqrDGLEEnj8Qgbw/KbpWu9rwlT8s3aq9GPX8rOQiCn7PhWTIEgWfJMbI73atmEOYp43d9aFqqqsTFHPl5ANiVlckze/XNVbfCrYifY2Mp9GWF40nry4pa0tU9QYlV0L8YKont7nzjqMhrrL4MmBOcC9Z4kcVSWXL7gYy4tQJhdB/PqoHe5EWj44MOxqhP5rNX2WNsApaIN4cak/JKJ8R/XYZV6D5sdQuTbqGefVw45DLOq78pgmGrmftCNyLWRqGzmM6q4PfMAp/jbcWvVJnTYA3c0NF+hZ2FL1phWv14w+pwDsUw+EqEGSamZz3QHxMp3A27YWPIY4YZvrp+SmPyfUnwpRpCNXRDl15vzFjCW1iLMYnAgsW6xRCq9CxhZQXbQfL4fA2e7
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(36756003)(478600001)(6512007)(6486002)(110136005)(6666004)(54906003)(6506007)(186003)(26005)(107886003)(2906002)(316002)(4326008)(66946007)(66556008)(66476007)(7416002)(7406005)(8676002)(5660300002)(8936002)(921005)(38100700002)(41300700001)(86362001)(83380400001)(2616005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?NuHWr8/e21IxXtEdt93RtGavNW6AofNutPCjsvXfyiXbzLgoe7HcdJzZ12Dh?=
 =?us-ascii?Q?DHRSeC4TqhcZg1hHXMXWurhkhqLkYiTIuKMz1tTttQjEu/rHR+U82Yw+Q+/D?=
 =?us-ascii?Q?8crAUSrsVjl6I6v9tvwOOCpvs3lJzKLTRONR9KKT66yibpJioJD2CR6ucqR0?=
 =?us-ascii?Q?EffGuZStPlNVPu/ynK7VQhrrlUxxiD0MrxPXY94dbi12NNMSEkLhQE6Rg3fl?=
 =?us-ascii?Q?tecmjCGDqi3aWX3sZZTCaDDlrTs2ZpcLa50hYMTTkvKZ8HzL/b4dVjFdiEse?=
 =?us-ascii?Q?ATwLlV4sBojOOUruYsUo8DLAWtMO8qjs8CIASVi6I4CP2GPGxnY6LAB77Iv0?=
 =?us-ascii?Q?UlB+Gi3x/KMf73hrjA4tAWvn0+Iyyq4N4PcN/UIhc1P8GfNoiBmASsYKUW9l?=
 =?us-ascii?Q?XxquiAY7jN/lXgWox5HWBddIoTi54Uz9hi01LiMR9+vWH26mIK9S1Eud4fxx?=
 =?us-ascii?Q?WFnBTEuforDDqRwDcqMCnyWuQA1TCulV5/c8UJGSGHuq6ESOt7FEGogZzARj?=
 =?us-ascii?Q?XurWa5LEvf6Lmvr3LSkP3fi9noO1eaGNCc5OVNMV/d+A4YNCX6xtAVE0eygP?=
 =?us-ascii?Q?T8+pTXLo2WnRxVoMCPw8eqgQbAjoKfy91R8LH479DJ4Ro9bX1r7Tj0gOvCWq?=
 =?us-ascii?Q?2F7zssObqjHCFmRDgmOYI+/+Q6jUKSDyXNm8aJbGoZx4f0Rwn7g1UbJHyd5f?=
 =?us-ascii?Q?ft2ICkbKQSsXCQaWVh/P5lZpMuc3xlFbggqhpYaJrQIEpVgVbkNs0vFlAY4e?=
 =?us-ascii?Q?xl8Y8FcmVM9D7IfZ6w/Ti2JsBDD6ZXUtDjGoL66b67uFXXDyUKYH134OwJEZ?=
 =?us-ascii?Q?YmvCW4vRUVW5lh5GHg4AJ+RWouVmq8w7ZqIZVjeqFnm+MKIZ365CP3qO25Hz?=
 =?us-ascii?Q?HHbZaye+V1Dv3RsmSrDJNM4mjGEd4J/PC8yjwGESYT3wBLF9yE8i3LuBAym2?=
 =?us-ascii?Q?/vTheWAKvC/XjlXVBGvDdjKXRiq5miPJ1nx7MQmPQ21i8nr19T9lT3BnTKwG?=
 =?us-ascii?Q?NbVF6fERqjcjans1V4d/3IXghfJcKUZpddd0DYgAzwxl5O4u+g6X2tXZ4OIn?=
 =?us-ascii?Q?kzMNuiiMjMxi01oOaIby1fuUo0pQS3LK1aJURh9UgfjmFdC64spTlQ/oBAwb?=
 =?us-ascii?Q?8IgHMClRlyxsEXRQrGsTwRKfb2M35pf0oGkOUJBq36BjYkVarY8orOoNxf2u?=
 =?us-ascii?Q?LrqkLj/0vaRTJVoQ0jZGLwWCUR8MX89cpOv6z4sRuSo6EMl9fbkLngQHaXBl?=
 =?us-ascii?Q?DMecIrF3f0vVtVouef2OrO6iS9xTpS02EQWiFW6a58uUb3OyH7EffCS16RWw?=
 =?us-ascii?Q?IU2qCb7i1oxSavucfRbL6k8JMQOgQZgpvVXuHIYNHC73BH8WJOVlSinFkpUi?=
 =?us-ascii?Q?a7OqQpXsAmVNaLt+PqLWWTb7t2aNGvFtZqC6JmGXGLDl1PS/zXY2brpXSuwI?=
 =?us-ascii?Q?lGPSbDBlAxdvwd+2otjVazshlF419cTrVr5V1zFRYBkw4kh7Zpw1i7XUzguT?=
 =?us-ascii?Q?4XLokPP304ua4zj+nz1ev+kD+aTEvNSSxSA/agPPJVpzEqrnu618ZGsSuLc/?=
 =?us-ascii?Q?1qQ0yR85YDvCn+kPrWu0mhHYUMBxrYdpQY6HcKxF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab6f812-c85a-4773-0a0f-08db8c6a8754
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:17.0056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlaSZ9q2yFnsXl/M07JVJuTywqICGBNLO40bbKXCGHkhPx0CKslkpBQ6MjvORs7n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
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

The PLATFORM domain will be set as the default domain and attached as
normal during probe. The driver will ignore the initial attach from a NULL
domain to the PLATFORM domain.

After this, the PLATFORM domain's attach_dev will be called whenever we
detach from an UNMANAGED domain (eg for VFIO). This is the same time the
original design would have called op->detach_dev().

This is temporary until the S390 dma-iommu.c conversion is merged.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/s390-iommu.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index fbf59a8db29b11..f0c867c57a5b9b 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -142,14 +142,31 @@ static int s390_iommu_attach_device(struct iommu_domain *domain,
 	return 0;
 }
 
-static void s390_iommu_set_platform_dma(struct device *dev)
+/*
+ * Switch control over the IOMMU to S390's internal dma_api ops
+ */
+static int s390_iommu_platform_attach(struct iommu_domain *platform_domain,
+				      struct device *dev)
 {
 	struct zpci_dev *zdev = to_zpci_dev(dev);
 
+	if (!zdev->s390_domain)
+		return 0;
+
 	__s390_iommu_detach_device(zdev);
 	zpci_dma_init_device(zdev);
+	return 0;
 }
 
+static struct iommu_domain_ops s390_iommu_platform_ops = {
+	.attach_dev = s390_iommu_platform_attach,
+};
+
+static struct iommu_domain s390_iommu_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &s390_iommu_platform_ops,
+};
+
 static void s390_iommu_get_resv_regions(struct device *dev,
 					struct list_head *list)
 {
@@ -428,12 +445,12 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 }
 
 static const struct iommu_ops s390_iommu_ops = {
+	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
 	.domain_alloc = s390_domain_alloc,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = s390_iommu_set_platform_dma,
 	.pgsize_bitmap = SZ_4K,
 	.get_resv_regions = s390_iommu_get_resv_regions,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.41.0

