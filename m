Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEBE758D4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 07:43:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R9mS1j/p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5PrN6X9Gz30KG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 15:43:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R9mS1j/p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::617; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5PqR6h6hz2ys2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 15:42:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxwWjnf4xVIlUKMwdk3EPs32x5NZm3ZSsM+nEZyGp9+Lb73opMDyMLHJiaYKGsLYy2uCI/rDk4t58VLlfbFjHy/FFldljrNAzYCEWpvn8GgPoUWARaPOLT5popDS1LW5TM9jn/r5iVDYt7SdPV2Opj/Q9s4xqEUKMp4xQi6xb1aSPTjTVvwiuw1d1SY4+pYsbjcKg5ertl6cCo6fG/E9UzkHbRUCpvu0ua1F25CFKRIUSqFZwBWBCLl3nY+/zRzTt4QtL7y32y6BBw0tPf1UgSU4BK/C2fX27Li67J+NG7r22BbDcoMkBKQsbZBmgKUe/oAHbnUBNzGeifljoHhRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ug7J83PlBYKiDv89D72Y+xbTbyuEJxN0v9tsfrkv85M=;
 b=kuw2dDn40dWYSZq/LH9pSoscZwRgh/vwgH0OvY8N9fV4zYW/Zi4tktqlZjfxCk9cvhRF0F5YlXIQyYQ75TyfZ7N+cXqKrtmsQbXQebzdygARBzBQ8A0Tb4+9uWm8DKvwEite1l2lMOdj63wetq+YnijArm0nwhIelxnU9ex2eJCG/1UH9NaasJdms3GGD1EiIMGKNLTv9VAgAPWKazzCFEUZcjkFD3EtsBrZ6j111hgtc5P2nyJ0eCaDtpRAop4wepcg6vsdisHv0JjWuA5QaWr4AYYRr21VtySKIIkJCGC3geYXhHDZEm7YMN1nbjBlvxUxDEcCkPBrScDPgBHxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ug7J83PlBYKiDv89D72Y+xbTbyuEJxN0v9tsfrkv85M=;
 b=R9mS1j/punJDGK+ltdf4t4uSd8Ht7LSj+Gz+T68PZ4NiyPnbhaUdcM0uj7UKlExKBsXBCLviReHNsOrBeodvDHHkIBcqBfpL8z9vCW9F8eK5n7KGkP9Bfx7HHctghDx2eIV6HhEM67EXJ5lWHMHpTE/2iMEmgHG/VSOIMP0LkLWY/5ZOE4RfU3eHBGLpjq/vorVBjsiD/KgG6c11iWNO54Nu6y8Lzhwtpegh+S/AIiiqcug6N+7cQAqQF7KRrgJ9WUTJ84rr5MOjWTg0UleV7sq4NdUov/TwtludzfHgnglVFcU0E/9lHJN34Enp614C2y1oVBuUnvcwKr9Ih5AULQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 05:42:38 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 05:42:37 +0000
References: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
 <45fadf89-27ec-07a9-746a-e5d14aba62a3@arm.com>
 <BN9PR11MB52765F6D915656C6AFD138FF8C39A@BN9PR11MB5276.namprd11.prod.outlook.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 0/4] Invalidate secondary IOMMU TLB on permission upgrade
Date: Wed, 19 Jul 2023 15:42:29 +1000
In-reply-to: <BN9PR11MB52765F6D915656C6AFD138FF8C39A@BN9PR11MB5276.namprd11.prod.outlook.com>
Message-ID: <87fs5klant.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYAPR01CA0025.ausprd01.prod.outlook.com (2603:10c6:1:1::13)
 To BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|SA1PR12MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c852e3-6403-4586-a24f-08db881af57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HhmV8NXVyugUsGrmfRhG/2jZ7pW51lvCvLkSCl6PEXcUS0bN/sfqjo48Ug7fnI7drVWfXljKgCJOSoXjPokcBkW1Cxc4cUsSJFSTceoeOYI2PlQNLu0eapaAj4BVAx+LcnCRVu30z7kZ7kcKhuWNYUa5GHB098XD6jCLTtuyEy2hNTdS8gVuNl+3flE+zmX9JP1/9MHK741qbKMWMW1xn5XNp+jgIxfrvn+NN64oDPvIWNo3B2CFcgUTQ0xhV4tRt457TctZmOQSNtMZYK01/yMYRFU8n/gAb6YyE2Wsn7pjWcJo0Kw0G0Sttclp6UVAevxFPlvl1kIlk2sF9Giw6ESHxW0Ic5xpopO5FGdJ5V4E8m6Ss5m9Zx8IbV1+1zY97EUx1WJIH/uGT+NMYm3bjyU1EZrPxpE7RQVPDh8K5Buq7uDA1epn7KFgHeF1HWoQiMOHpi5hU0kxlKBhxUj2Za4xuhxmQ9QI8at9IkVewkjPwTOmVZI9Vliev4DT/kiSKV7KAgU2LvCsB/JbNygQyX7AICfrUewyWPlEm3m32G4ackEekJlMw/oRTfjEbx8uxTsHj/51jXJ7lDk4ptgcEgD0QlF8lytSY1YZbgwHs/k=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(66899021)(2906002)(478600001)(54906003)(6486002)(6666004)(8676002)(7416002)(4326008)(6916009)(316002)(66556008)(66476007)(41300700001)(66946007)(8936002)(83380400001)(6512007)(38100700002)(966005)(9686003)(53546011)(86362001)(186003)(6506007)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?2K7KOLw2wkn2EMyyNlZF6F/psv425mVC0P6SfNBntUx4AC8UORfkLqEUbsxp?=
 =?us-ascii?Q?EQlvTBwNJl3xrODo8HFrrJ1skBI2md/6JLSpW84N2TGKh2CT5DHCs4ub6Pxk?=
 =?us-ascii?Q?zEF7kQh2k48zCNWwgu9a+GytmvEUIE2tkBJP0DvIc9mpgaMDNzJDgNCbJ5nz?=
 =?us-ascii?Q?CBK/u2Ti05F1D9jU86056uiQG43unwR+bh0CX+35NnZoZjvu1y3MvmI0Falb?=
 =?us-ascii?Q?QwAKl6s6eYhle6cL9XbXfMamcyqX4Z8j6QtLmrCP8zKM9CmeKBLWOXRQMDVJ?=
 =?us-ascii?Q?p/LVxZIUVj3C8G8/ycNgf6SNY6DUqTxX3h3/AwYl81CcJYCCSiuVPrzC3qsg?=
 =?us-ascii?Q?1h05f4Pcga4syedmcm4HON6qsBontJC9YkbYUu8rpnlCJ+Mg3v5jnm5kOpFZ?=
 =?us-ascii?Q?TFu2yaBKd9/GRMWPDYAS5KQXo4b18TWt+SSyAwH8Qn5qUBiyjGLG43GNI3mK?=
 =?us-ascii?Q?1nN748PJTgYlX4aWDyOEOjlqAc+otTNssSql3c9tX2HAJ4OfLXf+PFm5o3yT?=
 =?us-ascii?Q?OdR/IL4vW1symZsyeMlBQv/gU3nnUJHLLBRdK3VOZuxTFZ43U+zFMzqnxdw7?=
 =?us-ascii?Q?LFX25Ip3P+pe5uMITGrRLLMh7AZGD5p8yqmDL02jtvPsJ2cumdIw4pLCaFNG?=
 =?us-ascii?Q?B8BMt27dTQHTn/Y9lC6nAFFqmEI6RzlEMl9oT0UlFLp2Yp58SZBebepbiRu0?=
 =?us-ascii?Q?R+5vrJSmv05hLAzAQMXQsXT//RE8OYwOdiCfQxgQ5HhDb2EMN9+rYDAWud4A?=
 =?us-ascii?Q?/rwCNKAmkyDJp67dNS4nYh+N2hg2nOv7VFfj9vBxC3wGblsvfUMwyOD+tn9z?=
 =?us-ascii?Q?dKj1PKrMBRS8Wbb/eCny1L3U1T8Gg5N5o5cYo9vMf3P1kRI3wC4bvoR/+yrG?=
 =?us-ascii?Q?rLRA/O9OgB/FIeKtHKhWfrTj/ZKGZupxd+x/E+HGmlCJQH4kds55uhklQgYH?=
 =?us-ascii?Q?YFfPCNQu6YhPHujYKjGZYiB0LOt7upJ128iRWqC9ye127/KByanFHgP5KdoT?=
 =?us-ascii?Q?Uk3xYAJsg3QJB1CqpSA06TrOV8yc+WVmkj6nyecj/86xP7XcrMwNYi0YOspp?=
 =?us-ascii?Q?e4RtH62u1G1lJ5cG/eGb8tZ/ZMYrKElFqgITClSg328YT8h5S4KrZpiau9ta?=
 =?us-ascii?Q?SYk2A5vlvYlmf+wQSfShB4fFGsjmlGo5N+3VvuoCMPvWzsKoHTsRl4IHPcub?=
 =?us-ascii?Q?suS7Fg3KoTa0m1kxOiWNWrZvCRdIECdK5VYK2URsN2BsuMpp1EckGuZUVS+F?=
 =?us-ascii?Q?+uCBl6E1Yy/rB6y1Tat6YsTS8ZmTpv5UBhW51CjOlUittmONXyURaLp/i1fr?=
 =?us-ascii?Q?SEC6w55i0tWI6rjL5qdQTRTtQ//BbAsqDD6+WgcK2B6BuKBTc/KTZV52m3Kk?=
 =?us-ascii?Q?inNv0V50P/atjyxJycD6nqC63M8o8j6V5Do9GIaoYpb3SrM71DiQeoUBbteX?=
 =?us-ascii?Q?RYJXc5dQJB1C2UCYku5IshT/bU5fmlk578Q5VGcbnh370G5oMX6ejaB638Z+?=
 =?us-ascii?Q?4JnjxYgla0uRavFJKZiMwtsEAeIGhNEPJqwLgm3Ti1x1fdmYwsBesC8oom86?=
 =?us-ascii?Q?L0XQULqEkVLwFUTilaxLi/gLntt4fzP2+MZ+NOU8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c852e3-6403-4586-a24f-08db881af57f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 05:42:37.4180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNHyaRd44k9t3QIra0ZYSb+NTE2zL14hxzps/zJ8kuaEZXfohPdr08fzJh8ggwUCwhqcfxGEpRFxGjD/k9VK5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799
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
Cc: "x86@kernel.org" <x86@kernel.org>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "Christopherson,, Sean" <seanjc@google.com>, "will@kernel.org" <will@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "zhi.wang.linux@gmail.com" <zhi.wang.linux@gmail.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "fbarrat@linux.ibm.com" <fbarrat@linux.ibm.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


"Tian, Kevin" <kevin.tian@intel.com> writes:

>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>> Sent: Wednesday, July 19, 2023 11:04 AM
>> 
>> On 7/18/23 13:26, Alistair Popple wrote:
>> > The main change is to move secondary TLB invalidation mmu notifier
>> > callbacks into the architecture specific TLB flushing functions. This
>> > makes secondary TLB invalidation mostly match CPU invalidation while
>> > still allowing efficient range based invalidations based on the
>> > existing TLB batching code.
>> >
>> > ==========
>> > Background
>> > ==========
>> >
>> > The arm64 architecture specifies TLB permission bits may be cached and
>> > therefore the TLB must be invalidated during permission upgrades. For
>> > the CPU this currently occurs in the architecture specific
>> > ptep_set_access_flags() routine.
>> >
>> > Secondary TLBs such as implemented by the SMMU IOMMU match the CPU
>> > architecture specification and may also cache permission bits and
>> > require the same TLB invalidations. This may be achieved in one of two
>> > ways.
>> >
>> > Some SMMU implementations implement broadcast TLB maintenance
>> > (BTM). This snoops CPU TLB invalidates and will invalidate any
>> > secondary TLB at the same time as the CPU. However implementations are
>> > not required to implement BTM.
>> 
>> So, the implementations with BTM do not even need a MMU notifier callback
>> for secondary TLB invalidation purpose ? Perhaps mmu_notifier_register()
>> could also be skipped for such cases i.e with ARM_SMMU_FEAT_BTM
>> enabled ?
>> 

A notifier callback is still required to send the PCIe ATC request to
devices. As I understand it BTM means just that SMMU TLB maintenance
isn't required. In other words SMMU with BTM will snoop CPU TLB
invalidates to maintain the SMMU TLB but still won't generate ATC
requests based on snooping.

> Out of curiosity. How does BTM work with device tlb? Can SMMU translate
> a TLB broadcast request (based on ASID) into a set of PCI ATS invalidation
> requests (based on PCI requestor ID and PASID) in hardware?

See above but I don't think so.

> If software intervention is required then it might be the reason why mmu
> notifier cannot be skipped. With BTM enabled it just means the notifier
> callback can skip iotlb invalidation...

Right. If you look at the implementation for
arm_smmu_mm_arch_invalidate_secondary_tlbs() you can see
arm_smmu_tlb_inv_range_asid() is only called if BTM is not supported to
invalidate SMMU TLB vs. arm_smmu_atc_inv_domain() which is always called
to send the invalidations down to the devices.

>> Based on feedback from Jason [2] the proposed solution to the bug is
>> to move the calls to mmu_notifier_arch_invalidate_secondary_tlbs()
>> closer to the architecture specific TLB invalidation code. This
>> ensures the secondary TLB won't miss invalidations, including the
>> existing invalidation in the ARM64 code to deal with permission
>> upgrade.
>
> ptep_set_access_flags() is the only problematic place where this issue
> is being reported ? If yes, why dont fix that instead of moving these
> into platform specific callbacks ? OR there are other problematic areas
> I might be missing.

See the previous feedback, and in particular this thread -
https://lore.kernel.org/all/5d8e1f752051173d2d1b5c3e14b54eb3506ed3ef.1684892404.git-series.apopple@nvidia.com/.

TLDR - I don't think there are any other problematic areas, but it's
hard to reason about when TLB notifiers should be called when it all
happens out of band and it's easy to miss. For example this bug would
not have been possible had they been called from the TLB flushing code.

Ideally I think most kernel code should call some generic TLB flushing
function that could call this. However at the moment no intermediate
functions exist - kernel calls the architecture specific implementations
directly. Adding a layer of indirection seems like it would be a lot of
churn with possible performance implications as well.
