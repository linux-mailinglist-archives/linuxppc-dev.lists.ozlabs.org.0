Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE4D75950B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 14:21:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c+31D654;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Zg14cPZz307y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 22:21:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c+31D654;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::630; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Zd55b90z2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 22:19:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b131MAFsMI4iP1G/lYIB38pTIjPC1ynPI8l1tZHeOu+nzOBJYfkReZHZ/Jzo7bOsc9vJOsz7UBhfrs4aQSfeSo2q5Es45V6r0NYfuEjM6oQs0WakHVAeqNSkkSdFv1ZhGNA500rIxHSgbXTVl9Vcb744MO8YkIQIiTtXUgjrEbvqSYpQHTTkt/RTA4yH5Vv+k8qejiWy/hpss8Or0RXgkCC1OQqAB36Mx3fMJj1aPGJwoStOBcLYxaEelUpF7Cdim5Mo/Kbj2Y3/374c9Phe+8ojHLbb59i9TodIWMPJgZa9yGDQslbSzMbmJjfOrJ9/ETpqdw6mu2Yen4C4YMqjLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppehoSrCgyLFyaJH/ZGUibIGa4K8lHOftxZoQu5p944=;
 b=BT54h5T60jYLo3H78uMPwNgtyqW8tq5/WEvk/O5wOMCae3hCzM3oFodzxt0+rtsSK4Z3S81KrIdfTz8L3NQJkg1MscQHErO5E245cm6lbhsQ3MYVaAG9YGn7OOrSbxR3vnjzBojGqWAPuU4DeLNhdU0V+tUfgJ2xWhZKNY1lErnYCAJJrRUbB6uSKcuiB5Ls2C3vemn2qrn0glUbVGWSVEl7sSlJa2+3+26qiHP5VokaQGzjyKnmW0uuTu7ZHquI54Eo01BtDNrnEDvKWRkqicn+1ImaRETtPBFxSbx+0oeQo41EJm6RR00sbwjuYlFG3iuz4P2RrI6ICBnOMmU3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppehoSrCgyLFyaJH/ZGUibIGa4K8lHOftxZoQu5p944=;
 b=c+31D6548hQuFlZ5g4sEt6JB6ljenByhRfbwshlU0wpYiN2tB3BV3lhw8WTNBD8K3vOPlfaOYTE+412Jk5myRuCHREPdb/GNf93EjKkTm/d01Ka5EybFtFclTVh5ZKxAcgUsbyFUR3wCS0KgpqgKVPzchZzcjsCUNWpQQiRtmxEhZChN1F7eTGIKrT1V845aT4MK1G0qC9sHApt7JwvaQCuRdJbYSwsKFSP2o5Ctn5oVqXDpnJ783yi2GuqOGCNWGl3wwOANtCRiYkMg1CcPUemY1bNO5Z/EnOMI35OB//AdE4zvJ5X57Ak4n0Z2jRBL9w+AvJD+/Rx+J2c4cNa2yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB5359.namprd12.prod.outlook.com (2603:10b6:5:39e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 12:19:19 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:19:19 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v2 1/5] arm64/smmu: Use TLBI ASID when invalidating entire range
Date: Wed, 19 Jul 2023 22:18:42 +1000
Message-Id: <082390057ec33969c81d49d35aa3024d7082b0bd.1689768831.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
References: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0059.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::10) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM4PR12MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: c6dd3030-fd0c-4978-31a7-08db88526064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2WTpq48w4mntvTdfTUQIrzTyYihN13tAWf/l47Yu7vSfX/hhDubHEQGAaBuYs7EfqS034z4EitMKFgPiZ8Wrg9jq3hJHofLDKbeBtWUhmBVG93IFQ96/hN4OUTzUN0sKqRDsSnoBwLKrPjaNzjv/kVtff0/yDnRbnm07mv/vaOnUGhtmYgUpg30ETaPPAgKiW8YjqsU8G3gWt4+ra0I4G6mjgWQDUCzQwpToVxQcvz56pxumUAr22qRQOhJtvQELq8mFNdqgzQ5jSRga50WqEVxBlsWMeUhuqaxRvbAjGuwLo7cso5Xr979jvy8Tz12W2EQjoh1JWreM4TtaW8mL5OqZacVhMzrqn+dEnKOZ6MPEQq0FDpn+0G6jbmFwW6QOMSajMYLiMUO2VNAcI1aRALz4IeSvPqYoreWpP++jno1jCTav0tkbEvG3CjeeUVKVgeC+JnL2b6d2pAMTFF0zXNgxQIXUvXkv+a4RlTC4jogX5pVIBRNlRDUt7QFsfIuvawa52phwI3PlYsEQ+5Kdd4VwR5DjfEVrWPeeDatYUCx4OEbta+A4lBwqPTM5qNGW
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(26005)(5660300002)(8936002)(478600001)(8676002)(6506007)(83380400001)(2616005)(107886003)(2906002)(6512007)(38100700002)(316002)(186003)(7416002)(66946007)(66476007)(66556008)(6666004)(6916009)(4326008)(6486002)(86362001)(66899021)(36756003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bQkov8O6vBYQf+/MADu+y2q5tsi33513Is6P38978q+2fpzMaqOK68yyxf1j?=
 =?us-ascii?Q?8io1Yd7QHVzDqErhcn3ibomWT5oE5g9wunLAotgyEbh9Ly+ZmPi6rV0nhOOK?=
 =?us-ascii?Q?o3r2S92do6Pw+4hfRCptw9QX+PHMFqwZMxw28/1IfacuQ7Z5e5phBR6dpjru?=
 =?us-ascii?Q?Abi5u3dz08bgM5Nuw82LR0zHu3dZFO9Fy9+d69TiFqKnHPberyeyjOcQrS8Q?=
 =?us-ascii?Q?UzsqOBymnG5DsS+6o7CP7KFypQs/9kSZWh82l+W5w9HA+BuEzMoo1VrzEX2T?=
 =?us-ascii?Q?bhlsbkzio0SnVwkYqOgLNPmaMms79PjYlFQySOQ7aXKH8XIwvJWDSiuVXYG0?=
 =?us-ascii?Q?AJxAoW+fddW6eNLYu2YlmleTSb2L9VOA60a5nHb84hmk5Z0U8IQqUrlzL47g?=
 =?us-ascii?Q?As3uDo9MSQb8dzWiXIOGkJvpMDDPDoP91rHx8RDjlnt0BhXtNlqHuT70m+PF?=
 =?us-ascii?Q?QPq+ASWQ1SaMi6137fWo5swc+qISbGf/yYk4C/QGZYbObUk8Pnd2TGcQWaxp?=
 =?us-ascii?Q?rJpHEGs5hdse5XhoABUayx40zy8m1Ci7c6rEbFwHRIMsARi+hRK78EeVkNtV?=
 =?us-ascii?Q?NqH9ITSBHj+///xX3F/KHPpPg+y6eKsALfCfHr6+0BMsDyNvkO7QNPvzk0vD?=
 =?us-ascii?Q?Ns+8U0GTwuu2on/A52FJ7mcsK64hTjQDtP5Ss96SXaLcdB7hg6d4VNfmiCDK?=
 =?us-ascii?Q?4WV1aXmWAJJzHGsC3R0RAQrwD7SFAqhyhR2Yx/UANDTFEzdYGpVE5jXJqdQV?=
 =?us-ascii?Q?FFsSNzlzYcXQHOBYbXzgULY8m/DF1w16TDGWBuSEmfNYIkORqGFKwpjMPc41?=
 =?us-ascii?Q?e2P1chMDbAmyX0bYvI8zi5NqV0qmpfayp45bZE6SPjrscRHrkVQwLcT1pptp?=
 =?us-ascii?Q?rYqmFyR3eVFBVDMpAnVr2NBeAyDD1BzxV0l7V7VoVkHA1Al4UfMN8muLDOOh?=
 =?us-ascii?Q?eurwlRIbq0hk3IGqSRBNGPHm5p2DrG8qkEGZhFSKRvucyZZZzrCcLGkmMacZ?=
 =?us-ascii?Q?X8V4WeRV8pkypgRu64Gy3dj9S9M+EFCq1ViDKhqQ9F5lvoZVvmUyptyv3lVV?=
 =?us-ascii?Q?IsA6GbGd8As+3O3oNH7TV2VeHfgr5EDhS6xKeXYBbIoCEtPSSfoTj55yYklt?=
 =?us-ascii?Q?VkIPu51piOOjLdOfaOwWsXS1+IQbKdFLU1Sj5s66G90K91YrjAq8MowgD/V0?=
 =?us-ascii?Q?+XChyAmC89UOGtaqE1SLuPEtDJW4u9iZxg8MHQxPTg/DzL6fHf6XHXEnNGpx?=
 =?us-ascii?Q?bl1mWMEJoxQTVL5i0v8iae3Tst7rSSYF4nkWV126U8UliZwsIpsUzZuXgAnw?=
 =?us-ascii?Q?2WULrrSTPKkZb7gilmW8v0NMbJnginGXmD+qfiYFT+OiOtGQJuK07N8pqG9V?=
 =?us-ascii?Q?uHZp7rcqjpyDHYG0jAk1PDY6ddGspVPd3USn8oSdB+pdDF7nTfKufvjYutNN?=
 =?us-ascii?Q?9hxN7EnOXZh/YJMP3rLNcQwSmJNJqM2DJSa5XPQoRsmtYZ7Hjq3dRsEXT0QA?=
 =?us-ascii?Q?PJHUeo9aTcP5/adiLSDqABCPzihSakPIg2B7AP8TOUCRZ7ppFo/8Tm+eGUN+?=
 =?us-ascii?Q?s00VcvWvks/yZtETFxDEopV5O47T/2T9ZDRt5cRr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dd3030-fd0c-4978-31a7-08db88526064
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 12:19:19.0156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McZeyUjgJe1+zjnXcVMVHF1dI6z00ev3axEmdLzDzFWbq7WtqRMAHvf64pqpOx3FxaV3qHNlCKipwFZwuyJkkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5359
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
Cc: Alistair Popple <apopple@nvidia.com>, kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, linux-mm@kvack.org, catalin.marinas@arm.com, seanjc@google.com, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, jhubbard@nvidia.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ARM SMMU has a specific command for invalidating the TLB for an
entire ASID. Currently this is used for the IO_PGTABLE API but not for
ATS when called from the MMU notifier.

The current implementation of notifiers does not attempt to invalidate
such a large address range, instead walking each VMA and invalidating
each range individually during mmap removal. However in future SMMU
TLB invalidations are going to be sent as part of the normal
flush_tlb_*() kernel calls. To better deal with that add handling to
use TLBI ASID when invalidating the entire address space.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index a5a63b1..2a19784 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -200,10 +200,20 @@ static void arm_smmu_mm_invalidate_range(struct mmu_notifier *mn,
 	 * range. So do a simple translation here by calculating size correctly.
 	 */
 	size = end - start;
+	if (size == ULONG_MAX)
+		size = 0;
+
+	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_BTM)) {
+		if (!size)
+			arm_smmu_tlb_inv_asid(smmu_domain->smmu,
+					      smmu_mn->cd->asid);
+		else
+			arm_smmu_tlb_inv_range_asid(start, size,
+						    smmu_mn->cd->asid,
+						    PAGE_SIZE, false,
+						    smmu_domain);
+	}
 
-	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_BTM))
-		arm_smmu_tlb_inv_range_asid(start, size, smmu_mn->cd->asid,
-					    PAGE_SIZE, false, smmu_domain);
 	arm_smmu_atc_inv_domain(smmu_domain, mm->pasid, start, size);
 }
 
-- 
git-series 0.9.1
