Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F867AB6E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:11:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IFD9Qm8D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rsf1x55Rkz3dDZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 03:11:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IFD9Qm8D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::61b; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rsdy647NGz3cKW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 03:08:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRxDSEH/A3hq0CxQzX+DY7J1KX3fEqUAk8eE2JZceRR5vfbtNkDkCT185/Ln3tdC58O1vhjsN0dcRndSzJOQ7wA+EXXboGjWr7hCrs4BkaaUkNq/G8Vzgqaae1yD/T8BGfGuyiFr4RmCMVAactW6lLi2svfDIXqZE6owxw0Yh2koJ8MOkmaOnPRPzGoR46t0ZtFpJI6rw83Eyy8GGb6M7iAtkCbDevR5EGMyHK1IZ66l1cZe/1mhqnMdm/WZBbxLKEgKJ7smmrkpytDTsRP9nOMKRZn5Ms7ycU93XB5KX4WAfcc8M05TJq5Gwqd4Afr4tS7wtQMY6+RF0iOTw+uFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldRc0qGf3zoIOde/YqWWMBp7sNe2gJyJ0ZV7n/pJ67M=;
 b=NtYQYQl/u5QCQT6dJSgHPGdQBMaFaMRDUw2LPsMjcApJj95+0E7KB17rUuEy3K14d/MrR7LRW8wFEFRmyuSIw0CrPdbxj9L0ahgJY7KWcWYSz8iCEoIcgfSuEsXK4HDn1TaBpJhA0XLETpgH78H0eYH0NQPmPx4pkqD4tXVryXuCMgSAWY3jhZKE/uQDrIA0LYIprfQhRoPlUrky4MsBg9vCfyyxCg/Z9pxqdzaLl5jiDiGe7JUUp5kB9oHt2g9+nYEKXJuab+oTV9mC4Jwsu4L+1F33G+URysUDdD5xWDIraAxldZ3bFczT9kBXkrj4dy4/jKwzsQcaRlIasx3V8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldRc0qGf3zoIOde/YqWWMBp7sNe2gJyJ0ZV7n/pJ67M=;
 b=IFD9Qm8D/ghr3TOuMt0QcqSu7IhpdoaMmsjVxuTyEyzIJswl9+uEEwS1fiPy+f/8eU5RsFBa2aFYZS1+YTGjp3FBJwrOBOS+Ttt4zq+HZcYZFXfSVnJFb7pPmRToSwd51+9ztieEYFVp4crhYVSZiwyk9SJlwUA2wnIsqk1n8F8Iz1Ftd6s9W347i5Wk7Bc24IyIygj2iz5AptsWW43imD8x4BJbPVpSafRZf6c+dLPGTbE2dbAxhI5iY2pMlHszpEnTxFehDECeeSsvzD4QV7hbMwv9ZDneE8SFzjeOEFlt6Nq9gYcRQtS+vSBx9f61CXhTkZohRAdLpHLNrGzEew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Fri, 22 Sep
 2023 17:08:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6792.026; Fri, 22 Sep 2023
 17:08:02 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
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
Subject: [PATCH 1/8] iommu: Move IOMMU_DOMAIN_BLOCKED global statics to ops->blocked_domain
Date: Fri, 22 Sep 2023 14:07:52 -0300
Message-ID: <1-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBP288CA0015.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 48af9319-d147-4cd9-4312-08dbbb8e7a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MKRAJCq6z3nD4amXZUPm1DFcafPk2H6JntvF2Zq0OY6kWkn3S+LkKSOnW+rucJbsYAsE0xPjqzB9DDGvtgZTSWJzGliAEVv7PcpK9hovWIvVdRoCNAeNN3cmwixr8kLDckF4fZzdCAMH9XULLH6m8zdHD62h1ZBVBGj+srmMvCfbQyJCxquYRDX93nEK+TrMbjIkhlsXOhnpdAsoWNdTRU0O1cRmWKpoi6suRPL1rj6DZsU0ylspWdba3SgfL9sV/0j/lr1x78kQHB28iZcOWnS8AhR+9fVJXArZmCj6HKzIfrqUTMtL10YmctUw+8sdZmq8y3cx4xcdNgvFScDCVSgYgfDK8+2bBuoSgkDHtCXkJWg0roOZ5J8Xvd7IYETDomuoX7pJWgbxg27DH/hU+zU/SrchmeZdHwlDVTd2XSAl4A2YmEMGzbNtbQReEZt1LUeEsvYF6xpxuqvgeifWN2wjTtrpD/9hs016+h0c/bY/4MiHEYOl17AJlFgzvARY6N9pwlMt/3g8AQtvRK2ApiknYyuAUEnpiOQ/x3fGekBDdIYJyC95iXZdVGQ0veyGqzz/EEYFZVZz1KX8oo7Z66YHcWeESUib1fP/J2tKelJNhhEadj7XWlMjRCWpYVlA
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(921005)(26005)(8936002)(2616005)(8676002)(15650500001)(7416002)(83380400001)(2906002)(36756003)(86362001)(6486002)(6506007)(478600001)(6666004)(5660300002)(38100700002)(6512007)(66946007)(110136005)(41300700001)(66556008)(316002)(66476007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?U7ovb08TCe5oLYmn6ofl/stmoKs4/xjLDAohGVKXZPWNm5slhQ3r9sVILzej?=
 =?us-ascii?Q?Uh8WEFWGaHKwoqC6tg+aAapexLlPIfMblQ6dUiBRJ9xTqLl174+tm9N2QnxR?=
 =?us-ascii?Q?+/DQmqNR4fcD/9kavdewAYnBwViPsj2/6fNtJCCUaiI3RFZogPBZ4tu9H6lJ?=
 =?us-ascii?Q?4qak75Dn3ZdiGRPwR1OFCY0qefEvVV3f3zHlen8agThJ4/2XywWNkFr3j8LL?=
 =?us-ascii?Q?jR1BPbkNtY7OjKPuxWz2X/1kt8mpCenpxz//zUn+znHm61GBRu3ejhgk2eta?=
 =?us-ascii?Q?KpBqN8vv9h85tYTTTPqZZYEYafvZtnaNilGKWNevrZ6MLGjiOrECjVLo17vH?=
 =?us-ascii?Q?mznt8JgIOjA+2LWCk8N2RIXLx9nQikSDWicCjotqN4dX+m871WYFChxFYXFI?=
 =?us-ascii?Q?IVb1xdUMZF8uSO/v9+EwTYE+zLOtODj2MxsMmyOG1lrNbWXhQIZSIuNIK09Q?=
 =?us-ascii?Q?tOQhLnwt2ikzUKYIpBLDbvs8SKkuc1/HopRM2300XD7eB6zDuQ2k+6L63s6P?=
 =?us-ascii?Q?yxBE54mBdqZniko7kTt3hiIB3FEvOOBJXxF/FIlaei1yZstHcBWhlQX87L3P?=
 =?us-ascii?Q?kZue0lUoCXtES30J6fjIx0PMM+Z4UV9zROQXJE79ip5RqQrWWE9tOZGDf4M+?=
 =?us-ascii?Q?VQowdh6tg+IO6FiyX9GirOx1E3CSK5W9lMcjMy/3Ul1as+sWkdanj7wKM7pR?=
 =?us-ascii?Q?9YR4viPu8aGI9OleSeoONWvgbbM8xCzZaCDFcfyH93SundiW4hVU2OqjVtsh?=
 =?us-ascii?Q?aBpEU34+3E9np/+p75Ecr7L8lBj9lIoSwFxk77XXuIgSG3JC3f/uFJomZqxs?=
 =?us-ascii?Q?pu/axWhj/wCETRkA00iBQQNn5JZciYqcnxnMm2+QJ6KNpYX47oXJC5G2lSLB?=
 =?us-ascii?Q?+8xCy6JghNMTS70RTuSDhGJHV2garEkUp6Fp3JhhA8G24UM/geT4KJfge6pH?=
 =?us-ascii?Q?6umwKiB7Z6AbUmsGrzGgOBedBAXsm6yOgPwrvLmJXGo61UV8EC65yVZ7yDy3?=
 =?us-ascii?Q?yJv+8ZWC1Ysr/Bt6ral1mnnzSXZzRHtgHN7aQ315dKLaugJeAHgTVG+HsGAh?=
 =?us-ascii?Q?ErpcWm2uunF9MS2cdWCEQJa4BrVF58P0dC+MkajapLpEs9LdXnjR6fCFRfd3?=
 =?us-ascii?Q?n0YZPVyGarCFjaVkEDM3Hp1ZuYrOVNUXEdeazgcUWEzwPG+UzYcbs6ABlcS9?=
 =?us-ascii?Q?hu0q3c+wI3ghhXnk6mAPXUyuFG12XToP1VrbUXuU7BWaTK2WdioqC37rRkaH?=
 =?us-ascii?Q?waS3AKOUKluKkksdjEPVccEFIEVrjMhhYTonIv20lwiZCrvEAD9XSSPG7pDh?=
 =?us-ascii?Q?cQq+w6hBegV0Cxqgj1mNMM3mlCOO71PTm8t6nKiupWtKa/g/xs+dbg9dHkxg?=
 =?us-ascii?Q?D+9DfWHoBpqXZEBGT8k3d7OCVy090BZLgrsr1cdojUsdLuXq/jtkbRxwRZqr?=
 =?us-ascii?Q?+MpjGRG7a9JvguaJSImCPJSYhhzaQbL/VxHlJKwHARHqXhr78VSv3vAXpzis?=
 =?us-ascii?Q?SrZg3UB9SQ1pDjB1c2wxiUaa98uLbKtjv3/NXh3Sb6+3N5g4f1ULuVXuf5UF?=
 =?us-ascii?Q?hnAPqd4Olw6XWuvzv9wpERiogWG+GEKY32QkNpuA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48af9319-d147-4cd9-4312-08dbbb8e7a4c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:08:01.6236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZ2guhXupR+G1/xGasw3UibM96akiIc8IznRplPmItH2/QgJMoCohYMxtZu0n7+Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following the pattern of identity domains, just assign the BLOCKED domain
global statics to a value in ops. Update the core code to use the global
static directly.

Update powerpc to use the new scheme and remove its empty domain_alloc
callback.

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
index fe033043be467a..7fa53d28feca87 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2049,6 +2049,8 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
 
 	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
 		return ops->identity_domain;
+	else if (alloc_type == IOMMU_DOMAIN_BLOCKED && ops->blocked_domain)
+		return ops->blocked_domain;
 	else if (type & __IOMMU_DOMAIN_PAGING && ops->domain_alloc_paging)
 		domain = ops->domain_alloc_paging(dev);
 	else if (ops->domain_alloc)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 4f65879df853e4..6f9e0aacc4431a 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -264,6 +264,8 @@ struct iommu_iotlb_gather {
  * @owner: Driver module providing these ops
  * @identity_domain: An always available, always attachable identity
  *                   translation.
+ * @blocked_domain: An always available, always attachable blocking
+ *                  translation.
  * @default_domain: If not NULL this will always be set as the default domain.
  *                  This should be an IDENTITY/BLOCKED/PLATFORM domain.
  *                  Do not use in new drivers.
@@ -302,6 +304,7 @@ struct iommu_ops {
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 	struct iommu_domain *identity_domain;
+	struct iommu_domain *blocked_domain;
 	struct iommu_domain *default_domain;
 };
 
-- 
2.42.0

