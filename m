Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88127B0FAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:53:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=efXZpB67;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwtjm4QN4z3cRX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:53:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=efXZpB67;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwtbC4gWqz3bwL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 09:48:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7iq84hfrs3M6WGQFvvDfd5eIeIPMWpPYtDZ7Zhze79RzoSLxlQCSIIrWB3sNq1XsMvrfky24YSEeDEYC0ggnwWH50EsGfZY9SoV8qK8KXUBQTTlTsnFIHcdPvNDTUquVR2YlmNZEiMyz/tS3pFB3g/npjFkF5+JqkrLdVb4l85y9afadopKYXT9mqAjFkdpHHPkURHd8iyQbofUZloU06eGooyweEpy9uHKbqYINqI8Uf27Sk+Ig/yzgAY/q+wz0HHCiKpz8zxRfPc4kogVobDBkCFsv6hcUNc5/2sGCoH8zjdaN0YzUlcwtSVvtqJLivufm7ZMN9SdYCE/xjRKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6f/F+3oX3DVdv7ukFG5Ga5zY2EAmoCSYx8EULKevBPs=;
 b=TxgPG4T70fe78qz78OecPO0oCrzL9dPlPb6rBnbAphS7nmRSZl9XcUcPk6b1DE6/yocC/+YH7KfIXhSUe3BpejQsI81PO8z9EsO9vpFMZRvkkAGW/xIk2MxYcAlt/gFnQQRo6+o0KjRd28Dsi7cB/ka7BeMt+TrlDeZT28sjk2aPKKlVg7IsAIDfTXDgmoHxZSfbk5/ueJXyh8K2dX0KURA8MAnMyqIYGiLUbuU6x4muz3HDX2Ocxij1gUDyVGQhp/ipN16DF2qO3S1ug8fW7AgulwklYzQJwC85BdWFB71tIQNkoP2I8P+rmKYW+3XNq9Q5a5dC2F3EJB2IANFIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6f/F+3oX3DVdv7ukFG5Ga5zY2EAmoCSYx8EULKevBPs=;
 b=efXZpB67yRFN8Up9FuGI6UJqS4wJnUMm6YAPYH0BlDKdAtju2sAawzHZJ1zmEirn9IBp0+Vr7L4Mng1857AtALWb2KoGHf0SAVfyjyn5i39dggxLYFm+nZaEKCyJ+g6yplYECSRjTn3AkQMwrFsAEzesK7HfsxfH6TZqnMwn182P9GQBajdlD79M9dGvKlbp92DGqKgi5TgzlOA9pYuyms7Letj7EJhz5fSHo4XU06Bo7Dv7VNb47xYJA9x9e12xjtdZKAYmt2KabQAeVtClou1oU5sEONAouVgaQ6AJO+Qr8+3ERKeimjP1yy4Qp3tNKyhDR2mcmU4rUbDaT8qtLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 27 Sep
 2023 23:47:44 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%5]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 23:47:44 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Hector Martin <marcan@marcan.st>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 4/9] iommufd: Convert to alloc_domain_paging()
Date: Wed, 27 Sep 2023 20:47:34 -0300
Message-ID: <4-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0012.namprd22.prod.outlook.com
 (2603:10b6:208:238::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: a28d9417-088c-4c77-6fd5-08dbbfb4235f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	BtXoGu+NWXbb3YDC1ND5pULotK179CuyC2TmnhYdoTIfDferZK4MS/vW2l8wlHVt+OC+jLPlGu28ERdjtMhWi9RyU7YS8LHE38O5wp0yNRCYpotHG7GXkJW5zDHGWgmgalbspMKHCgEpJ276ZSDgxOQodTGK046bgUGR5pRAThrwmGZvRDLmxWizOZ5aV5K36oQgJtzlGxRJlj1FA1F14NovmomFcCuNTjnTNSEuKEqRBR7FuljdZ1h/zLuWhWkFrqkAfklKigDnbRjXWMqsvuCms8W00sSUi7qvkQbDvrcxQKm6rwDCOfxR4hqWb1bgzueFyiHRDMvlrAekEzba4qiQqWRwX/g48FmScICsMtQs19ICgdfQZ4c+26OBJaZVdCEbbR4MHhcBPQDu8idD2pamLSDugkQv4r22b9pzHQvFgXJFGKbscIm5KkbAeUrmny9Sdr8Ue36nZzBfxDzecucCNrx1CpCkJyGW92lTjJfXHq9idLJwZIkP55t2JpfM/HJCeECGQ141aa2o/JxkVaOiJK8Pn9idGIcUPJDmmJDV72kawP8LQ4wqXBA0yTtGdnzshlM1dHrCsOPTOl49ts9bkDHpfvsvxuKmrExrjYb8QFw2UWzgw3zAEud3rtxg
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(6486002)(6666004)(478600001)(921005)(38100700002)(86362001)(2906002)(7416002)(41300700001)(83380400001)(6512007)(26005)(2616005)(36756003)(54906003)(5660300002)(66556008)(66946007)(316002)(110136005)(66476007)(4326008)(8676002)(8936002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?F/LztvZJRiOd6tJ3zTDq3yosx5yqInU64fVJFJoKeWUI173NbNfMn2v1Diez?=
 =?us-ascii?Q?I598ivYZLJpGNuL/EHkEjZ8zDTKwDXuVxOk2gnuumUpdXNWb+lU3gAjVR+9r?=
 =?us-ascii?Q?HmgZv7Hpnct3YilGRIbFxoQyNyRvnP9MrHFkIFKKxHTgw+h1Hof6n1Q9BgA/?=
 =?us-ascii?Q?6OdJVU9Ttf4SicT4zq44fp6Bh4CeowQtf09fU+mwk0T5psCx0aGK8rqxecul?=
 =?us-ascii?Q?qhFbqzF3lpr1PhdiT3fCZ36aDLDl5ti2oiRGXj1sDbNpCiZ3am+0uVGaePaJ?=
 =?us-ascii?Q?yg+woiNSXLSu5dFYVYU8jnCtnHGHGaKJ7mSfHJE1x3t5nRBOCvm+fCJXJS+x?=
 =?us-ascii?Q?keBw7vnXW6fxGX7dp5/JI9PjeR0VzoQ0sgFBTMpkmQKcwcIoI2qLBjHfk+23?=
 =?us-ascii?Q?kKLXBWWQt8Q+NTNDILtrCqjscfzHeMb1TMFGQ7XmShlnC0Txk2GSUavpITEC?=
 =?us-ascii?Q?W34AlOL2odPKVj/MDKy96UW/NaZtwgQT6etclwAieYv4dvPyXDk/wxlqfIEe?=
 =?us-ascii?Q?KnnoAcpqIvn3/ViMkd4r+cZqg43ilDrRPX8yLT8hhyjGcPQxhdoip0i+Bq1j?=
 =?us-ascii?Q?Bv/Tnlis+Six6nxn1kTW3Z5TAQrDftyRsvr4KywziLX9hBR+hfS6f8r0afJ1?=
 =?us-ascii?Q?3IcZnDeUp1XZCb10/oq+UuX+wnVrJjghzzv4KMeC18eUhAyvtAdfiPN2ETrT?=
 =?us-ascii?Q?JubPoauMXSb7o+5+larU/1kPSpe5h9ppPWaTFfhQrd0Kdw+A9fUcUwQzRU0x?=
 =?us-ascii?Q?SnmvDTxzhklUERwxxaBIPvJM9zjieNaZzgPUdsUBPr6lKG1Z2Cpu0H2Bsrti?=
 =?us-ascii?Q?U7MYq18vEaMkIpaTbE8stuKZx7byTNlJ8Uj4TqOKZOtN6SK4vAv43GNWiMKB?=
 =?us-ascii?Q?coiuNVb4P2UVGzTXzxv0Zsq4wB8PrpekUaOZkDi7K0uPADR8gB2A45fXbU9k?=
 =?us-ascii?Q?pUtjI27g8f9Y3TGNVlq3KVaqx6ZrAAS7A3+sViHH8vZriTUI/DbdU58/nSLw?=
 =?us-ascii?Q?SfSGg5F8mAFoLIRj6LQmaSFrZYuqN5ukI7PkeXiRHyf+8dUwmncKJmlpRc62?=
 =?us-ascii?Q?Qn4zxZlTEajyvisTY9xYWxX3GlWXT9McMv+Rdhh72KsqWH/wvW2Nj+WbNAdJ?=
 =?us-ascii?Q?CtScKLm1+44sonv9+crWgFMUkFKPui45B3SSJvjSjZRc0D5jP7oV7MCnxuaz?=
 =?us-ascii?Q?CoIR8VvhQjQm8yWZa7VUvdjSIG9ozsHzN4R62toHN98vmy0UBMCcBYI7zUhB?=
 =?us-ascii?Q?9MjC2ybHQ0Gp3WkH1Xu7uCacaSEwUciZgPQwwI2/UOjiLFJdKpAJY+oU5Gpy?=
 =?us-ascii?Q?ssv+FmKqmNi71jPM0BQYL8FGhDtE27UbMEOpb/JwiUz3kRhlGl/GtdmSWwJ7?=
 =?us-ascii?Q?rgq504wZ2MwYtove2QuXxDwgTAtk64YbgB6VcWXRcddQwlzLekf4K83BHcJ1?=
 =?us-ascii?Q?lgqQfVrkLH66LG3C9o6sJYWSWTIoB29E/iY8I1+cj/b6D2LS7IVove7aRmog?=
 =?us-ascii?Q?rMSrcUxC3DJ49u5ID8Y6Msq+alx2WVDkDlcPo7C3Td0nFB4Zm/abvMZI8pWh?=
 =?us-ascii?Q?OC9foaBjsthD3PPkbyiGfd0X8j/luYh1QMtYn6ZC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28d9417-088c-4c77-6fd5-08dbbfb4235f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:47:41.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGrn44j6fcQ+reiExMYvosFdMGs56Msddp2uZpKMhL/+a1rdfZaNkT+CF0/whGul
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921
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
Cc: Janne Grunau <j@jannau.net>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the global static blocked domain to the ops and convert the unmanaged
domain to domain_alloc_paging.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommufd/selftest.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index fb981ba97c4e87..ee607984709102 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -141,16 +141,10 @@ static void *mock_domain_hw_info(struct device *dev, u32 *length, u32 *type)
 	return info;
 }
 
-static struct iommu_domain *mock_domain_alloc(unsigned int iommu_domain_type)
+static struct iommu_domain *mock_domain_alloc_paging(struct device *dev)
 {
 	struct mock_iommu_domain *mock;
 
-	if (iommu_domain_type == IOMMU_DOMAIN_BLOCKED)
-		return &mock_blocking_domain;
-
-	if (iommu_domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	mock = kzalloc(sizeof(*mock), GFP_KERNEL);
 	if (!mock)
 		return NULL;
@@ -295,10 +289,11 @@ static const struct iommu_ops mock_ops = {
 	 * because it is zero.
 	 */
 	.default_domain = &mock_blocking_domain,
+	.blocked_domain = &mock_blocking_domain,
 	.owner = THIS_MODULE,
 	.pgsize_bitmap = MOCK_IO_PAGE_SIZE,
 	.hw_info = mock_domain_hw_info,
-	.domain_alloc = mock_domain_alloc,
+	.domain_alloc_paging = mock_domain_alloc_paging,
 	.capable = mock_domain_capable,
 	.device_group = generic_device_group,
 	.probe_device = mock_probe_device,
-- 
2.42.0

