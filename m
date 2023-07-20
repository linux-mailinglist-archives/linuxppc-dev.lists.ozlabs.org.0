Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6904975A3B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 02:56:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XTKp5P5w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5vQ12bCjz3c2y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 10:56:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XTKp5P5w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::61c; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5vP45vPKz2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 10:55:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNl0YIT0+Gf7JaXP2FESmRHHmhV9qsALhTkIYxHBpSt0YXfQdt8cnIaq4LcHe0UWR7C3irHBcTWJVVcku/3FR4qOzCooX/8kZjnbS3Mj6jjq2dxLir2unuFTzyc72Y/o+todByVxuJi8XfFGoOddd8vkbRD1iW8Ulfsnqh0ezuyaNs7/h9LXFHspa0vz0iJA9/DJqVbiYJr0Cczo2j/xjya7U3Fisb3kJO/Mihh8UncJKvuSzaZW/6BpSby7uCvSXfuLXGAhuFQYrSoLvVUdEceRMXwszfWVsgo1tsZY7qKINFEPhKkeu9YTnZSCWwhV1T4dsgKorh+I4VKNIAitwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmyg7VjjEbeSbEEtKUsr4fCmGkQPM428FaXfiHvAffE=;
 b=agJSiTYCiUNSd5rmmH8HG5MqszkyLt8Po0XYASycxGC17i8GZtdqztMkPMLZ36ZVQHNwJhBoB+cGA4vWAEpJEUAO9ey7oALS6zvsWtJUbh37BKqtkkZLtkf26mnr/9RDJuUTCC0fAlcneM6osklsqchtvC5DqNazDWrWz0Yj2WRPuGqIQpMApo246IxjRzuPDfj/sjR0Jo0rVJYkAPZyEi+x1aOtHLW2Aq5NsnGWEVB2vvnyKZnV3dXM8ntvqDaITrwEj84+5hjCm3rKM8orKG9SwRiWF9GhaXA0QFW8zDT4z23AlvI4hM1ocg9+OcBRpTucRNxdNalgZUYL+A+Rew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmyg7VjjEbeSbEEtKUsr4fCmGkQPM428FaXfiHvAffE=;
 b=XTKp5P5w7R/PoAY3v3vaOQGUBSRfIw3WkySHTxW2s3VrXZFA1t2kNKYTEZt/jVhZf9lA7c8WPHPg3hHwTz3Uqr45GCEy+tg1eh8j9YzrNFHDWnqRSa99nMDpMPwyO7qtaWovMGwYOBvn7ON4rFJ71ut0dx6DV0Pelda4deCGXyNeM4T+v92Cg1KTC3hues41sqKcrm/xwH0rF07Eu2FVVbs8gQkXGb2FhP+/njJp53sBkagvI9swGMdu1er9v7A6jBn78eE0dJgnKjID9ky+jpIn2hzHNICaGO/rn0gPxFPaQQJvk+dvdT+CAtvWovU2AsEBhdgYBzH6lBtWjqVkTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3179.namprd12.prod.outlook.com (2603:10b6:5:183::18)
 by DM4PR12MB6591.namprd12.prod.outlook.com (2603:10b6:8:8e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 00:54:55 +0000
Received: from DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::3eb6:cda8:4a56:25fe]) by DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::3eb6:cda8:4a56:25fe%7]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 00:54:55 +0000
References: <8f293bb51a423afa71ddc3ba46e9f323ee9ffbc7.1689768831.git-series.apopple@nvidia.com>
 <20230719225105.1934-1-sj@kernel.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH v2 3/5] mmu_notifiers: Call invalidate_range() when
 invalidating TLBs
Date: Thu, 20 Jul 2023 10:52:59 +1000
In-reply-to: <20230719225105.1934-1-sj@kernel.org>
Message-ID: <877cqvl7vr.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYYP282CA0005.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:b4::15) To DM6PR12MB3179.namprd12.prod.outlook.com
 (2603:10b6:5:183::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3179:EE_|DM4PR12MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf73474-776a-4d34-3e32-08db88bbeebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3yYUF7XlX1Ops4WUoWw/OZpfLoYypiHnWdebTi8VWm3ESrv/ISdjuoq949NlRSkHhdl/qyNGreIkYXZ+B2pxt8vxTeBI8vZJ4FpoSYEoumXRxSpfvStm3lmOEVqevclbPkoURvwTUjBRQgnewFScKSzb4tr67fCihp5UYUYfaQFrU3tVHfMLYPRo12xLuJOns3QouUtddEZuuoEDZa10rYfZmNMFzQlVBSdRsCHnjn2esKxTqqhKq7LikyGS2PIQjvw/qQey7Aj2sAvcjSthH5FfJqbcX8kBErP8TZfga66JMe4M/kZEphOZktvXXhBEcft5hKw3czAEulipfLKFxtOCsgLogukhUuSaMAjsBKZ7FDmLtt+u/cBDMSM//JBOoqllxOUH6yKyzJMVMJk0o+OhsLYUJAqCvJM+ACHCBdjZOent3/O5xdAHdga4cQFlJ2S2ufUZ5W8ZxHgVLiQHhlEwkjYC0ykugI0JF+MMBWPyJLyUDzH0EoRvVIgDVAKll7+liwOExv/99Qe1YZtWY/GKyi40le/+6HIux9JnYsNO/QVQ9+IVuuT+qgqygbjr
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(86362001)(478600001)(83380400001)(186003)(38100700002)(41300700001)(26005)(6916009)(8676002)(8936002)(7416002)(316002)(2906002)(4326008)(6512007)(9686003)(66556008)(66946007)(6486002)(66476007)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lGPBsBwQQ3NsQzVO67L6jU59ZiwgvSa2O05piHAZRhJDKErK1R5Eg1j/Crpb?=
 =?us-ascii?Q?CBuizy/rH4+c+IBuilXH5AyFfdQFMVGjWAzqLIxgOeHBHHZuFRqQ1dQjRLW6?=
 =?us-ascii?Q?qU5cu265ytoSDuJJAy/yWshfHgLRkDyuECSibwWeHVA6JeUf/rNM0shvJ5J6?=
 =?us-ascii?Q?AVHyZmRgvl+9EcHoRicSKq64bXtmr8BZd/yqMwdbthbUlpbCkTG8TWXF9lxH?=
 =?us-ascii?Q?8dYUozvxMkRILsniDpqITzh6pZ07GoqyIv9HbCxoz2DXzm2HpjxpURzVu4gf?=
 =?us-ascii?Q?Hb0CbQB5xjUxh/TQkSyJC0PJ3UdPeejpgcTNFCcyzYmuf5TjxyBZMoPgxdyI?=
 =?us-ascii?Q?Vh1+kdTt+AGsPQHr6YMD6FXDp+mZstKeQzTpu/iT9g9S4ZB/43NjdN6ZDWYz?=
 =?us-ascii?Q?kRWaUWvkYkljj+3U7PV/sHTiLoMshAyHjmHTQi/BcS1nbcGmMAE0ezCLoKoQ?=
 =?us-ascii?Q?r+01M9yVOTu3Emss7ZyxTObOqkUvPyM8bW8VadrMxUDvhoccv4QPURfChPND?=
 =?us-ascii?Q?OudRxtIImV78ZU1E/rppFZTXt+7BYUqikFpXKAYsH+T+GMaUzb4C3tKiNG5v?=
 =?us-ascii?Q?02Eh5nNeZWKAtpMLqIZJgcErJAauo6bUYcvki9KyWIXFEKx1oNAyDL11ZTE7?=
 =?us-ascii?Q?zFn8aha/Lw+0GAYqOQihl7KCJV+iZTnKPZ7A3opOIZgls8yJA8hb/NaZRHZs?=
 =?us-ascii?Q?FznLODKfUy4i6LgwrIaXsvbyzptiuedv7VPjVbM5yzdzsQFC7BibOf9b/19N?=
 =?us-ascii?Q?8brYcJsvP6AnZtpRXIhXn4TxhAWM0WByTzkRoN6P8/BvAVXvi61bp0p6pShW?=
 =?us-ascii?Q?hdwufMf+20sRFjHdDoWzTJ1NoFFbUWCnXpKqIHe58cpkqf6ZlHXaTpiwWCoj?=
 =?us-ascii?Q?NK9AQB+bCUqO6QGL+hSky0tnbKCMoPvnUiIMXRrbGpny53SMaJWqtGih0Ipn?=
 =?us-ascii?Q?LrJ8uq/Aga+xyqN1w+VKUdvMGex/KvqRSCpYkw/SvTiFR+GGweEmHms9VDOQ?=
 =?us-ascii?Q?q3Z4zEzj8AY3DpQ4JzmX2Tr5cy3z1hxCYWpKA+JiSB5LmemrbkPpc3erxULy?=
 =?us-ascii?Q?HDhH0NlrNGyqVp4V9SAuhxmNlHUnie8ENCU6PdnxJbFJkZkhAZeJTi6k1oks?=
 =?us-ascii?Q?zu6quNw9tjfbPhSx8y5b+wR7SODHQyr6G32TWLpgH/DR9GUychcupKUjbAEn?=
 =?us-ascii?Q?Zh0pQxRVuMWEWF2HCpUBZJ/XLCFhZntSaQu+9Aadwn/zYuMGSma0f4D5c6Jl?=
 =?us-ascii?Q?g3DMHEwShbiSV+D9c4mwKlTCbcxU3ZSzJ+ouSr9zYNI0oM1hS2KSPoo7mywG?=
 =?us-ascii?Q?VIxCkO8mQDMjIexjEIwLjDy5OGK2pXOdhFyXFL+vsqWQl/g1mgVYy/0nBk/Q?=
 =?us-ascii?Q?7D4+24+X8AmZ/HVlD1CDpU8nGtRg1HNa7/Q+1fKG+CVvIjQcECdTXIyH6pZQ?=
 =?us-ascii?Q?pBHZ5kfVRgrAskZn8fO8D+6QHfzuNkuYt6gXgZNJE/ihQubOOJyGFMDLJ0kD?=
 =?us-ascii?Q?11Zwb8+3ObnF8pmq8skPgGsKLbPMB88TwAwrqg00/5xRGb/eSHIXiXoBLXh/?=
 =?us-ascii?Q?ZE81ITWEK+CkyUUIFka2uOen4s3ID5309ViqhbCq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf73474-776a-4d34-3e32-08db88bbeebd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 00:54:55.0488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5IwbuDIsWK3wskAeufn7VBH26V8VcBJ5Erc/t3sr1d4rc3sqTRR/gy4Irk76duA3eT4/aNRvK0u74fk9siDSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6591
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
Cc: kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, linux-mm@kvack.org, catalin.marinas@arm.com, seanjc@google.com, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, jhubbard@nvidia.com, fbarrat@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


SeongJae Park <sj@kernel.org> writes:

> Hi Alistair,
>
> On Wed, 19 Jul 2023 22:18:44 +1000 Alistair Popple <apopple@nvidia.com> wrote:
>
>> The invalidate_range() is going to become an architecture specific mmu
>> notifier used to keep the TLB of secondary MMUs such as an IOMMU in
>> sync with the CPU page tables. Currently it is called from separate
>> code paths to the main CPU TLB invalidations. This can lead to a
>> secondary TLB not getting invalidated when required and makes it hard
>> to reason about when exactly the secondary TLB is invalidated.
>> 
>> To fix this move the notifier call to the architecture specific TLB
>> maintenance functions for architectures that have secondary MMUs
>> requiring explicit software invalidations.
>> 
>> This fixes a SMMU bug on ARM64. On ARM64 PTE permission upgrades
>> require a TLB invalidation. This invalidation is done by the
>> architecutre specific ptep_set_access_flags() which calls
>> flush_tlb_page() if required. However this doesn't call the notifier
>> resulting in infinite faults being generated by devices using the SMMU
>> if it has previously cached a read-only PTE in it's TLB.
>> 
>> Moving the invalidations into the TLB invalidation functions ensures
>> all invalidations happen at the same time as the CPU invalidation. The
>> architecture specific flush_tlb_all() routines do not call the
>> notifier as none of the IOMMUs require this.
>> 
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
>
> I found below kernel NULL-dereference issue on latest mm-unstable tree, and
> bisect points me to the commit of this patch, namely
> 75c400f82d347af1307010a3e06f3aa5d831d995.
>
> To reproduce, I use 'stress-ng --bigheap $(nproc)'.  The issue happens as soon
> as it starts reclaiming memory.  I didn't dive deep into this yet, but
> reporting this issue first, since you might have an idea already.

Thanks for the report SJ!

I see the problem - current->mm can (obviously!) be NULL which is what's
leading to the NULL dereference. Instead I think on x86 I need to call
the notifier when adding the invalidate to the tlbbatch in
arch_tlbbatch_add_pending() which is equivalent to what ARM64 does.

The below should fix it. Will do a respin with this.

---

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 837e4a50281a..79c46da919b9 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -4,6 +4,7 @@
 
 #include <linux/mm_types.h>
 #include <linux/sched.h>
+#include <linux/mmu_notifier.h>
 
 #include <asm/processor.h>
 #include <asm/cpufeature.h>
@@ -282,6 +283,7 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
 static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 0b990fb56b66..2d253919b3e8 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1265,7 +1265,6 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 
 	put_flush_tlb_info();
 	put_cpu();
-	mmu_notifier_arch_invalidate_secondary_tlbs(current->mm, 0, -1UL);
 }
 
 /*
