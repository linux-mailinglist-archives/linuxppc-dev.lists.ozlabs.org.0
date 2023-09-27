Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D847B0FA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:51:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=o1vZg3VN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwtfw1WtXz2yjD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:51:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=o1vZg3VN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwtbB6bXlz3bv3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 09:48:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXgrFispsVUra9pGd0/KH74MRvTm+tC90x2Ztjh28ES1bGGvtE9nZIg+dRdjPRHEac4PKJGFvh7azhTajruXSJZMy5XihuZ3V7FZS7a/zrqQytpSOlVXVtJ4X0wkuJBBsD60LF/YP3ZdHqM3SWNH5etccUi9wfZ9F24qiJ0kbp6ZXKNVx943KHHmHND0Ke0BFfO9SXZQYTakKIN79YtsfWWqqlfTO1ZHGxk+X6ju103u/jEclDRSFpqevOMGz9tzLV4HN4+UzZ/yT225vBDgJbeJGhx4ECwTvpuI7ZTNp6r/diQszFa9YyfK8BcC7sLQWE/JiJKYbDl2Mm5LZ4NakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wUB7bJKNDPUkPphYVe5/f77h9BwYWMFAjSvsmrFMCM=;
 b=IT/LDlc5P21XDcCCqIyZWaGdALzXF0xqPFq7r+vjtjPKxFCcHVUO0oQ25/rRASJslNw+3fn3UK8Sxk+hY7pQAoYG58StvYb1C41c7WfeKN2c9dAwwHj5Q0AdofdvO6I0qL/wXdJO5lt1gxtSbsvZTh6GTu7Z8rZQlqLfxJuLN2Qcms/9cQTeHmkslejSAwutFFuczBqiqt2FsHCMh9znegnFB0Hd3qub1krv9KGmh2ZHjyzkNfwO29sKHiH+QTRnKKf/eUyHaWS/S9HF7TIAcvlNDMUE5hVtlnv9mlohC1yx8BPAZgo+qdOyn8SG7JsbbjNZfyzcAdBrgzj3APXTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wUB7bJKNDPUkPphYVe5/f77h9BwYWMFAjSvsmrFMCM=;
 b=o1vZg3VNTFM6tGrwRN43Fl7gT8fmFefEgqeJ9lleyRHKa+n81zecCZGlf7xUV5bcy/KdWxZ9FrZ+1osUmkZ+Q+dlqH8MEODS9DMGSi4U7M86Aps9qkvV1eYbxVkm4cv5lnH1zh9Wpq23thU+qKQ7DF1+iW3lvEA2lSPV12dNLCYkDJPOe7E5nIS+dnihhZ05cGaPuZXjDMLET7EIFdhvIp/jnnzoLt9pS8FTUP+22B3wypP3BYiRCo2YEcfBS6VIWrKyLr+ytgz629L191YMpPMKzWKqf76N9gDfW2bbX6AaiT/Snqp/0U49mh3fPoe3xvV1Rd1LnzTjvAYeXWXb7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 27 Sep
 2023 23:47:42 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%5]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 23:47:42 +0000
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
Subject: [PATCH v2 1/9] iommu: Move IOMMU_DOMAIN_BLOCKED global statics to ops->blocked_domain
Date: Wed, 27 Sep 2023 20:47:31 -0300
Message-ID: <1-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0013.namprd22.prod.outlook.com
 (2603:10b6:208:238::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb40ba0-f4d1-4196-3715-08dbbfb42345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3X2Dl51TzqQKRLqKjtK1U0yCw4AknnU1el+ZzewqIefRxL1v+fG3GLkCqDhmbZ7PQ3OpFWGpQ9ZaokhZCcs/SxuwQC55iUQ2zQWu3b3tlVQ8RkAsZeyKfUAToLEWzWXTtLklRJmVsMsZzlIgZH8kGFI5wFinu2250BgVFjmThRezmUrl582MdO/SZJcq1dDglJloggDJ+XUvbKE1rFs104EwiuJsyImKmeUkk86TRr/uoV9I1NI5S6SEgMgnVqB2OXOAfqiRrBAro/HzGpG/3QDIHHm4cqn7NfQ23qOJoCT7WN556nIGFl+YKqdznbr8pdpVVDzenUf4HCg3DA7UQC4cgcGvDhvoYnrIziN8j0/sQkzinp5oS3jby2dxZoDlBAZeWegm2YNF6t9HkssireNCIrqc7QfKWYo/xHGHoIa+SGuqu0dAxwpwDl9dp9gHd79sV+AVMMkSMcozu4GhdwgWlL7oxg9PUwhVNi0ZKkMi16MxM05tRjWdTOrBvtYa/Md1EPoDuqzQrL0faxm+F6T/2Rj+YlyDo2vVNe5wv064BEfauRiBCJzmk4jO4OANFgqllCMyuw2bb3SXtwq5kNfROC8K2OBOaxtYdEeWL/xAJij4cNWS9EFBo7z6RzI+
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(6486002)(6666004)(478600001)(921005)(38100700002)(86362001)(2906002)(7416002)(41300700001)(83380400001)(6512007)(26005)(2616005)(36756003)(15650500001)(54906003)(5660300002)(66556008)(66946007)(316002)(110136005)(66476007)(4326008)(8676002)(8936002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?qTdPL8s8Nr7jLOQi2na9b4rvtMNFl372Px0tQBziO5URhdtkmYuAq4kVbVMA?=
 =?us-ascii?Q?AbWowxlXvAJTdywuFo/eEJ/pPvL6glI0CkAKdeK3edhqQwCPbJg9K0k/F+c0?=
 =?us-ascii?Q?+c3SVOT6b2EHh2ptxgLKl4HBs3p7f4naeB2HLiH/Uq9tcr8s/oSMh+E3IaBN?=
 =?us-ascii?Q?9IcwLbueHi4txIFeTcGDwktRgEKWM91Mafa4mpL598H4iuQz4eZODIoVCV6B?=
 =?us-ascii?Q?zxDS5bKBOuSM3c46dXH9aXVjSSoxiQHhH5lQOBuvPoJHFMAfETgEns4RiFtn?=
 =?us-ascii?Q?DeBdV34VSIocJK54Ozkdy32li5JnQLr/GFAJ+PbKnYPh0fJ1qBT3LsapngMy?=
 =?us-ascii?Q?MUEUWduaVMMTypvLA7fPJYbWeJQ9uBxjngTaid9zlRh/s5tuPHePJlPPeZf9?=
 =?us-ascii?Q?Ppjx9Te5ytUSXFsQMo0rSj2q4RYYURgJApf+4sjTYOa8l3meNWoODZqCNWwd?=
 =?us-ascii?Q?fAlN4peBflpH+/xf7D3UG1q+UdGL0ookOhbSo3NLlTRHx6Tau84YMDEBX52W?=
 =?us-ascii?Q?zMRAYkb6Kagu1aZ3jzthXf2Gyk3nS2oxXhILt3MGS/khft73Z6MTLXW179NB?=
 =?us-ascii?Q?Cj4GCaIRiY691dGfNPgKBJKUDA+xQNOGeGjO8YjcWtqGyge85Rd6YvEGLA+k?=
 =?us-ascii?Q?iVwVIWkgjPwklPmQCFmCtE91ob/n98Jt8BArMCJNYGiJUs74KNjIupKM3SPR?=
 =?us-ascii?Q?18xCGQRshX/Ew66iQVPohfaaOapV3lXtoWnwbydEUyGAGsBZ6srVxqGeOIvD?=
 =?us-ascii?Q?3r4yrGm9+iJ8IVbij4R03DkfJrnFriIFE6Trza/6a3ZMGZApFz/z+3ZKm9kz?=
 =?us-ascii?Q?+GrVhtlbNeNHkon8Mkq3+EKlm9VhA1THV8CEB32nNJkx3zEPUd6VHZmHDM6A?=
 =?us-ascii?Q?6k4w3FmiXppwFN+hrI0fSqUSBZRb15M/+dytLBqRbIqetV3W3gnRn23Lgkt2?=
 =?us-ascii?Q?7WgUjkLeJYFT1Fc6ZcQp2fphlCaHBilYZoo0Yy2umubdb9A1kvRQvzuPJSf8?=
 =?us-ascii?Q?7OeaROydClbHVLmFAmrp89gtX4PFHEbvyO9rgoIVw3tI9K8ve9mZQy0gFTJ/?=
 =?us-ascii?Q?n+1pGsdz6TK/Lr2paf2qH6t6SVQ8CuH9pv9u2EWhGTmWdRZ+1uhXuyLOtZAr?=
 =?us-ascii?Q?1Y4XGUdHaw0NXVANOTxDUY5eSh5i1kRGweP43rXXZl5O/9E4ID0q+RIaGIL6?=
 =?us-ascii?Q?XXzNLdUljqeAhTQ2eBKFTvtkTokelVrrqf3QF97uCpiyh2clG5JSitC4yYBq?=
 =?us-ascii?Q?dF1mb5ndzLvV4KhA5Pmbb+EdDimt+Esz3p7jTfdAb5JdmhiGvGukQKWBQF/f?=
 =?us-ascii?Q?gwsF+GaFuc2+Sfboc9M67AXVBFNSFx/7ulKYMywBXZH/IxcaENOavfdwHLlC?=
 =?us-ascii?Q?hnRkoTfMU5yNxn8g86gSnX+DL6xAb/qrdY3708WmBh2eoHenAReeoak8j/ym?=
 =?us-ascii?Q?cao2HEmvvI/K5mdIBrPKFytWe9HL5D8+0nVIuc0lF4AtitxManUTblAcCWGe?=
 =?us-ascii?Q?Y8nw7XzLtwe7AAL7ofbK7BKqZsaCEewWNenAfB3Dry5cJ0N7AoZTtD04Bh+v?=
 =?us-ascii?Q?e97CMIxXeZq3KAyCeTVze5z96Gh5LPD57/sYexGY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb40ba0-f4d1-4196-3715-08dbbfb42345
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:47:41.0759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwuZTqDXVlR0bgXswpQW+VNK0bHM8C8RuRjCRmdERrz2sLYfB7OEkK5mWszO0pll
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

Following the pattern of identity domains, just assign the BLOCKED domain
global statics to a value in ops. Update the core code to use the global
static directly.

Update powerpc to use the new scheme and remove its empty domain_alloc
callback.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/kernel/iommu.c | 9 +--------
 drivers/iommu/iommu.c       | 2 ++
 include/linux/iommu.h       | 3 +++
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index d6ad3fde85a212..3c1d10be19c4c7 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1327,13 +1327,6 @@ static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
 	return false;
 }
 
-static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
-{
-	if (type != IOMMU_DOMAIN_BLOCKED)
-		return NULL;
-	return &spapr_tce_blocked_domain;
-}
-
 static struct iommu_device *spapr_tce_iommu_probe_device(struct device *dev)
 {
 	struct pci_dev *pdev;
@@ -1368,8 +1361,8 @@ static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
 
 static const struct iommu_ops spapr_tce_iommu_ops = {
 	.default_domain = &spapr_tce_platform_domain,
+	.blocked_domain = &spapr_tce_blocked_domain,
 	.capable = spapr_tce_iommu_capable,
-	.domain_alloc = spapr_tce_iommu_domain_alloc,
 	.probe_device = spapr_tce_iommu_probe_device,
 	.release_device = spapr_tce_iommu_release_device,
 	.device_group = spapr_tce_iommu_device_group,
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 1ecac2b5c54f4a..89db35e2c21771 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2074,6 +2074,8 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
 
 	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
 		return ops->identity_domain;
+	else if (alloc_type == IOMMU_DOMAIN_BLOCKED && ops->blocked_domain)
+		return ops->blocked_domain;
 	else if (type & __IOMMU_DOMAIN_PAGING && ops->domain_alloc_paging)
 		domain = ops->domain_alloc_paging(dev);
 	else if (ops->domain_alloc)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 64bd20142cbed0..e1a4c2c2c34d42 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -265,6 +265,8 @@ struct iommu_iotlb_gather {
  * @owner: Driver module providing these ops
  * @identity_domain: An always available, always attachable identity
  *                   translation.
+ * @blocked_domain: An always available, always attachable blocking
+ *                  translation.
  * @default_domain: If not NULL this will always be set as the default domain.
  *                  This should be an IDENTITY/BLOCKED/PLATFORM domain.
  *                  Do not use in new drivers.
@@ -303,6 +305,7 @@ struct iommu_ops {
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 	struct iommu_domain *identity_domain;
+	struct iommu_domain *blocked_domain;
 	struct iommu_domain *default_domain;
 };
 
-- 
2.42.0

