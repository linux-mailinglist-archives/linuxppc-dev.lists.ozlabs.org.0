Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5ED761A45
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 15:44:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AMbL0Ds+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9JD6014dz3cYC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 23:44:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AMbL0Ds+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::609; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9JBF11CYz30gM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 23:42:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5MYlfHsOOM/TgiAj4kC7ZGaBreeq8RswRZSpt44YW1i7+MwC+N9UxSKOQgLYzNJ9qdJzumLX04rCkh894Ch/jNr22SXp51wH5Te3o7BgIc6TnHIoX6w5UNnVbG2I1GAlqZfAwVbzmT4meeYjs8ZYYy7hEwFOp4KeWRXWlDq+tk0cdAqFdWf3V3MP4ucs+uRKLrLiSBQ2cL87ENGnfhFhgNElE/DIDl4pzqp5y3+lDjhxBtd5rZF3ma4riLxg7mLNbhA22hqdcfh+xEVKNWeTB+/h0FDLwS/2L+ow1YzrbIDNdPgaZzRhnHs+vUob6ZiHlMw7y+VwouL0iefB3o1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrAVgpar1B+CtuS2I5HzmH3wTKJ4n7roSxVUZcTgcDQ=;
 b=VIUTgXmB56XROCitu94jNf74YrIPKSERe3g/dux0cUYlzFTIgSBdihDSkB+0XEYESIVrrNNvS2e7vYyOL2WyZ0+FUtJLeYljXctRWu1zCtkpBvAcs4o3I/uITnpEUBc7nM8WZsHY8n58STnvgL32sgLjWJKNipS1/q6/Midz1t3niypJw31b68IcYiA7+hfq3sjWMRzKgBqZJ0VN7FV+NmvQVOkAHK0W3u4PYjMo030xBSEJTgIBH8WeZprLsi7q9+YrEHiluFtAIuzwkWtXvSev0qL7uGQ41WnugbBw70/tagiXG5bPFIajfxin6Ipw2FptPKbX6Nw9fX9Vgrhqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrAVgpar1B+CtuS2I5HzmH3wTKJ4n7roSxVUZcTgcDQ=;
 b=AMbL0Ds+6GX+qKWx88CVf8QfOWsctqmIcrGJNwSjN8t35HKQnr6ik2KRHlkeQYoXfKjyn428x+D2cdD4z0Hl39NSbJWLKJk0CLZCQojhdtcfpjD2ZImizzG09aOy6Wk4h7/sxCHpHDyo3aIFOGKf8yZddDv1BKVfJU7OvZa7PIoYZTTvhgM4pdy9Qo0p91l4eyNJMcYZZSfk5EIGciSSXoPY31LDjlWdleF07+tC7CNVHBTX9tO5WuO7wmtpnONIUdy+plOolrYOBQa2sjYyta+uK+S2yTovG4QBfL+IdfBCvxEsUzChGYhZky/8cc3eiZeazBx1RVKSa+UD9LBNyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:42:25 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 13:42:25 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v4 1/5] arm64/smmu: Use TLBI ASID when invalidating entire range
Date: Tue, 25 Jul 2023 23:42:03 +1000
Message-Id: <ba5f0ec5fbc2ab188797524d3687e075e2412a2b.1690292440.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1eca029b8603ef4eebe5b41eae51facfc5920c41.1690292440.git-series.apopple@nvidia.com>
References: <cover.1eca029b8603ef4eebe5b41eae51facfc5920c41.1690292440.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0042.ausprd01.prod.outlook.com
 (2603:10c6:10:1f8::14) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 88254ad6-a240-4724-a4c8-08db8d14fb14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4GSVUR+TEFPTu3RvwBuYstVW2dEtKl6CjhB+qegzO1NvJlPZ9rjbPiDtvKuYPsRYaZ6QCL7Mx3M7rDKpVgZs7GjqC+DubNrSD1YqHFJm204y2T5/XDNm40nsxDejFpBLDzFOkrrRzu/eY0lVwHo8rb2h4WqU7YXNGIGMQKsdF8jqpGth7Btw/ftVq15t1NAPUKc/CEgKmq5CVQCf8TQPYx+e1679uFiNfIluYd6L7+pBXgwGP6i22ZPt2ZQnd90qDqAn/WC+x/BvwoIaSF2j/R+NsQgOqfMkROgiIoJ7156IFtZyuH+XXs9ZOEKK949St509iJB/bUjiKZG3lyJ6njLUxukzbyEFYhN5xqkWpuBdqgFEVUlBp59MXfIUSUTS4T7MjKdmpxoQwzxAm6IZTQDJlM8+Yox2/0RBZnNRZNbswupgqFQNMlqBe+ObbSJ3iSMvHbk9egjJcxdbvrsEmPAKxdDVE9ryCiWyxywWpt0EHimZIuIjQ57Rwr0aHvXRkuFIoqhPxvjcN/fjShBgcbOmwwk9aLkhVmqwvXIvCGzr0S/t4uypP7LaL2y7RiSi
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(6512007)(66899021)(186003)(2616005)(26005)(6506007)(107886003)(316002)(41300700001)(66556008)(36756003)(6486002)(66476007)(7416002)(5660300002)(66946007)(38100700002)(2906002)(4326008)(6916009)(8676002)(8936002)(83380400001)(54906003)(478600001)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?wmMO/tYgFBiAPcuu3NVUkGIoW/mnorpkUaqMoDv4JcjuoclVC9tlrvW5MNpG?=
 =?us-ascii?Q?U23JGSPPQegTJTHErQx81HYbMXyEXsvXO8TmGKaz3D8UvaTySWlatDLlEvCM?=
 =?us-ascii?Q?biGoRCEcmN5GZeS98tU7dJNaX4WFjWOHNlj55i7e1XSHX03pytPrj93hj4n9?=
 =?us-ascii?Q?mdb5HPIs+HYK9o2ZunpT4QCXVvCpMRKTAdtBBix3Nex417wdFDz7lUG3u6p+?=
 =?us-ascii?Q?qMklnatiX0tZeBs3cL80tY2cuz3ABUCdWd+zRddi7cvrdA3u8CUMZoO9+RaM?=
 =?us-ascii?Q?uhbZxL79JZg1/CVXwbKShRsBMTMJcVS6/NchoYQY6tmq16/h1yPrGpjZ/DHi?=
 =?us-ascii?Q?rGcwlLvslY/2xvHhmu4PqkNiBPbpqwS1AtBWwS/guPxj/FQAuJVsj3/6QEWa?=
 =?us-ascii?Q?47AP6fKswexwxreEK+uIM3tW2Ryf5i2ULe64CFEOuO38pit5q2KhcEO5tIJb?=
 =?us-ascii?Q?1IBw5MX+NhEJYOMmXTCVoMDux0M6PMW6C5VbLsoiUb+Q22mD8LesQVbqPOvq?=
 =?us-ascii?Q?7o4vXwFlbyNqvNW0Wgsw7FcJTJ/vGLWSaZpgNgNyLZwXy+LyFJJTxMjmf8uI?=
 =?us-ascii?Q?qtzvERIYdb6kJyVi95QubGxjCdvQ4BRmt6cHC27syjf4EvoFBGO8lPfXDNVg?=
 =?us-ascii?Q?R8Cy7VQhuKrDOV0QyVI2AnVGj8x7QTexJeQ5EfD6b/bVFJMlG3sfHJaCyuEG?=
 =?us-ascii?Q?P4W6WFNWsof7bCP84MPG9dNSQ3+kN8VDVosuI2bdB5gsgDzDXk4U8K7bCAWn?=
 =?us-ascii?Q?IMdVUtrLF7mqVi79p8oxMd7RJyMIdkCsdYeNCLvgfztgqn1SZXqREQxlOYG5?=
 =?us-ascii?Q?sEu90ZmRWZP+JeCsJvg9+MdM2tLPVT0eEHoc+sqobrYr8sgBKh/MJIhY5WtU?=
 =?us-ascii?Q?4CWpgxDdY/G3SLbizaMw81wfX280W/oFej6ms0jTEgp+nrK8A8sZdEA5v1Tz?=
 =?us-ascii?Q?dFkuMbGAXfUzg/sUihcHsIlpk7QI+scZOIQ6/7Xtkv4kwtkADcYkGlcYKXxk?=
 =?us-ascii?Q?L5/zd0TlYortWCg2fcxma0j1Xfk8rnxOp6/juk5Ckb4vTG3T7lOHy6a9hFap?=
 =?us-ascii?Q?SUH5lIqL8TphDMTWXzDZoqnr3suCQxSDnnAEWIOmArAa6+j9X3wZUFb5Lobl?=
 =?us-ascii?Q?nAeAI7k9I5w4gGolt7LKot/e8SqnLRIRBNpXGrR5QJNJACjnY1oODZZbSpw9?=
 =?us-ascii?Q?tSd4Nh1fNW8eUgGY30AeAo1GXWkfuuqoOt85HngrjUO1gHjVNMVbGlXXOeNr?=
 =?us-ascii?Q?EpK4tw3tfxg2/Y4qfZ5iKxNhWsvOhaYTt7QaWyZNOSVZUXcH167DRiw9Z0mA?=
 =?us-ascii?Q?7ITCRmOWQf1XfJ3FgEBt3czBzByq60zpevdFxSDo9gdJsGLDDdocfvr95vk9?=
 =?us-ascii?Q?HF5XKIhDVX0KR3QB+2tusnYmHmGfLh2E7UXIuWq33mDnxR+V7AGS9HwqcRnY?=
 =?us-ascii?Q?WrCTjXYISBLtOWSrmDGqzgSwrh3ntF7nNkKpl6ak3T2cGA7QZ7n3vJacOEkJ?=
 =?us-ascii?Q?i+oic/TT/183vbQy8aZJhcEHYDCGr/y+ypDCe+5IzBXnlSy5SDTbcwt/dt2O?=
 =?us-ascii?Q?VuiB2JhujPU3fXni55+mU3s5/imFGRgqeUvDQRqu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88254ad6-a240-4724-a4c8-08db8d14fb14
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:42:25.5347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhEEdmntSW4YuqFX1PBciLerTnFPudZgH3cZytQZMXQhxVg9Srq6WNV1zNEB6oFsBiDvhYKWv8YXSi9YrgQszg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327
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
Cc: Alistair Popple <apopple@nvidia.com>, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, x86@kernel.org, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, intel-gfx@lists.freedesktop.org, robin.murphy@arm.com, npiggin@gmail.com, chaitanya.kumar.borah@intel.com, linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, rtummala@nvidia.com, linuxppc-dev@lists.ozlabs.org
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
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
