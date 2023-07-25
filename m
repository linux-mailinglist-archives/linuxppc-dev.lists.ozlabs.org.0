Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F1A7609D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 07:53:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Fr99toB5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R95n525vVz3bx0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 15:53:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Fr99toB5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::609; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R95m82Z5gz2yGK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 15:52:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkRMeMSwdKYd/hAQC/UJuI7b5/rI6R00VJvlJf77mOO5mHLp1comOhl+uYp9RrWCijEW/gFtsqiyQWe0ZIapCNGUJ3eXRWnlmpzLc8/63IqT8ajd1SmuSTyRo3wNRTUDYEMzTP0etXu8A4KKOrpMfxDfJ42vicr2/g1+QTtXW1+UNo6mHm3BMZKv1LvXT73p+ABy/0togJPK8iqD2O53gLJamXYha1qZyBMwaL5fYV9g79y1/qqnkUlK6rB6+t6hLCaoTVzDEK3hGZ0Z9P4RtSG3WncoqWTuQXAFnRhPHxPwOzkZQ5cPC2znwIJlQw+JGLtHe3c5ZrY2BHDlyPvtiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVRsRx/qCl66tZQns7a9SAjqWphTcuxR3mogN0pmwqM=;
 b=dV90rJ0ZFFEJArMaF10RzNbk0hpKq4qN7O953DIIxLhIS1aT76/bC8iFi4/W8DpyfG0mr7kF2diNmBf1tLyRAjRomxWEu65uPMROZMvFvN0TcnXhZcq8FAN5tF2IUcP/logtdVVV5tf34HIIS8r43BgO3iWaWd3Skam7ob5toTNH0Lc3807rnda/BeNWRg8PVaxHA3MQxMfzvHcZF8bso/vPZEmxUk5Nf4+N/MJ/6m7tQzBz9oZAhiYpW7daYLoWPVd1KvisOaR2jdXLqe93Hl2538toYw+ffCytRTZCaYeaTmnGz3RPKIwq+ApurZLNac0tDTYcN2DLCsTF/eKkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVRsRx/qCl66tZQns7a9SAjqWphTcuxR3mogN0pmwqM=;
 b=Fr99toB5RJkgnIC2ok1gqM/d00m0nJA4iKY0pt8djAVt3R+hEKEItQUZK+4P2yiBdoXdzqP2gWCUtrITw23ak2RWklLFilTn9N/GlipiEtjdUKUVXgWHHcpfaoICoOpr0pUBOdFGlRWsr0aHNXsx0M+j74MtdiaOe2ErN1OgMqeaqvsWHh3EpeC0Xcmn3pqh/X9pCumWqPRJQbtJowzh9//s4cNVhQLofQgFiGqAZmH64Sg04qg3RaoagtVM5rRYuli/CHFut8Zg/ZsU842X+ilsqYR/wI6cZBM/PP6Sevq0kS6ErmlbkQ0u2nbjlJQyC/OKW4FOJNnOreEN8J7Aqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by IA1PR12MB8553.namprd12.prod.outlook.com (2603:10b6:208:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 05:52:32 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 05:52:32 +0000
References: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
 <8f293bb51a423afa71ddc3ba46e9f323ee9ffbc7.1689768831.git-series.apopple@nvidia.com>
 <87y1j4y7w8.fsf@mail.lhotse>
User-agent: mu4e 1.8.13; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 3/5] mmu_notifiers: Call invalidate_range() when
 invalidating TLBs
Date: Tue, 25 Jul 2023 15:51:45 +1000
In-reply-to: <87y1j4y7w8.fsf@mail.lhotse>
Message-ID: <871qgwzgfa.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0078.ausprd01.prod.outlook.com
 (2603:10c6:10:3::18) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|IA1PR12MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 6872f7de-13c4-45dc-8cf4-08db8cd35683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eSCyyHILk5M/wZ25f+GZ5hyEyHJ7f6Dlw65NSaY3DsD86E6sXB2QFFU+PG8SpJFi4/BHF7JJrk/9gi24gsfjJglO3dcIC9KZAf2hFtkJvcTkLSt2jziZP588p4KHA5iGqJrZzwZQ8y7EDklP5Dq5bpLy3Q2Nxhbkb6oIqnLIbIK3hbsoXzLhFtXYQWLIetMwMgQASc9bXakPzQmF4dygXjLpHlEsfxE76Rm5JkhcCl6r0H+j7q0djsjQUHGAFbUnPIIAt3HUPq+hJi7E1u3EysmfFobR+/JTPeupNc0gU4PPb9QDAyjjYG9UUl1nYOaDlj+aRRDDi4mDV8M/sMRuv3P9zWnqriZRmMsEqsNsb7Izz/AgUW87wM8F+Bt+DeAFL1/AprFubduhWlVHSjjffl/syvgYsQ05AfjD25iiJG6cqMs6cTTaYpHt9mo4p/kJKKm9K4a9ZtAeWBpd0uMLIGL893coedtYD08osHAJ68I632ZsbcTKCKEKGFzWjky9yLgEcJ/EpxX0u9tRtweUjdfeuiSjosoyzIJI84zgQQTALxPa1vBaDWoSVGS35N9k
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(186003)(6506007)(26005)(83380400001)(478600001)(6666004)(86362001)(6486002)(316002)(41300700001)(4326008)(66946007)(66556008)(66476007)(6916009)(38100700002)(2906002)(8676002)(8936002)(5660300002)(7416002)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?umweCAJ7PqN6IM+z9GCVFDt2lQL1rTjIWH3TFF18HB9hlyw13wmZLuySyzP2?=
 =?us-ascii?Q?WD3vot6u5vg/tbdw+wmhMPNG/zvv5UlJbYRPFPagLE+OA8m8ncL1pn9MCvBw?=
 =?us-ascii?Q?zkN6iFOJUHDXESsiRo79cVpWkKVKSv9mB9UuP1bQgfFl0/H9hAjISdZS4cdG?=
 =?us-ascii?Q?cgrc6hAtqGaEGoHzsCGFzf0LyPqWbi3DBHLx7DDdyhQA/7cNJxIPBnec7+N/?=
 =?us-ascii?Q?KmD5MdaW839YsBVDUbcS4hgYWlQd6opFjby1vrMqXhYg/22qcA6fZzxcH5QN?=
 =?us-ascii?Q?Ze6pQ1ajErAlrnSNwZ1bxNt7jRYbx5SDQynxLTPa/MSAuxJQhoaribfGbgly?=
 =?us-ascii?Q?ugpmN+5e16W0AFfYaeNh5v1TuPuH33tvq9H/7yfh+4ABMQNGRrD7HYgXTB4L?=
 =?us-ascii?Q?iLmeplwLZTOPgx3713arCQ6w4MIMoJ5YqATklXgzGcMevrMQgL0liYBIXd72?=
 =?us-ascii?Q?VvVevTVC+uMJ+DqTB2Zk2qYLLFO2eRdBmLVPeQGBFoEvkKdBdNgNJtX2dUNK?=
 =?us-ascii?Q?W2QmEyQutNG4z0rbNf56Buip6rbP0y68V4jecjkR9ENjtjgR7LLJTOLzggBf?=
 =?us-ascii?Q?LsWKk8v5xGsSXGXCqWvvinKGot+ipXBheifVZV47uK94N4WIHld6RsriII+1?=
 =?us-ascii?Q?aDQ3sJfT9X317dkcjQ/ovEU3+gJoJkulKIp/MfMy7QRhChBdV9glfG8YxTS0?=
 =?us-ascii?Q?ICGoGtOSeoi2X8Yydf/8RY7wQfY+fec6I5IgD4yzv2XkCoDrrt7EtuKI81FE?=
 =?us-ascii?Q?nQGTnVThtXNmYGskIzBDP7k7W38nJMcseznOaDBMyuISakUNilEN0rSmVkIS?=
 =?us-ascii?Q?QMxoFvUsa223Zu63f9aDemtDA+WIWfvDbkeCmK0Jh9MFQl5D/YBYNO5gPzhI?=
 =?us-ascii?Q?xqi0pBqVwmO02y+uFLGZPYAip0g6mGy70MtQRBc9JWxQpg++ZDGv90ph5CJy?=
 =?us-ascii?Q?KT1PWeAxglNnUf4WW3KlhVrJ5nBt4b6so0rkJmDiJiUQWS/N3hGgadsuedeq?=
 =?us-ascii?Q?XG0dcOcczDIpGCrriiPdtGITmiPTkINNHoyMA0/DqAZZe1uSmxIzpVvhohgp?=
 =?us-ascii?Q?ajlyfb4vpHDX+mlsbAGylfSlO9pDXFv+VUPeVDmrq6rTXWHVavNjc5EE4F6l?=
 =?us-ascii?Q?jtfgCC0FRMIjw5ZwrP1GiU6XWEmr49GSqF60ChOPcxLMLRmvuUoBtfyizlsy?=
 =?us-ascii?Q?NTAArwjq+2ytgafh/T3PudMmrMoisdB9+/0vWLNT7Ui8FIqLA31MEdPfE7MO?=
 =?us-ascii?Q?OyCCl3kviAJ5iiJ+fa5puoFJO7wwUPaBXacvup++71x2EHRfXXKVaFCsHokr?=
 =?us-ascii?Q?f3NEflSTjIybw8baBxqn5Gtneg1wS6WwinizZYDOExcyCHxV3qOwExlu9WBY?=
 =?us-ascii?Q?pxykdscqwbxGPcv7ilkcJqPv28VSEM/yTakJhAAAo7rRYOaVcZieZHsO/qn7?=
 =?us-ascii?Q?8yK/kNOqIbI16fKARD9rI97Klv7bn1H/6+i6UtbyZDJcDkwg24LAdtCIupIa?=
 =?us-ascii?Q?8W6Y1Jq80vdqKj+WNsJVuP2Hne5Cja4Od/LVH487AQkORTqZIjUPcSCjivCS?=
 =?us-ascii?Q?WpqdL21itfhKd5pl58/LRaFb+lkGTTm+nhXFce8p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6872f7de-13c4-45dc-8cf4-08db8cd35683
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 05:52:32.2949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B56+fTPImOKdKhpcWTtAhSNZX5zycA+alLFiSTYno1+gVWV5tDK6TSqLkYuH0XPZYLNzAphcpk93en6+ETFpDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8553
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


Michael Ellerman <mpe@ellerman.id.au> writes:

> Alistair Popple <apopple@nvidia.com> writes:
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
>> arahitecutre specific ptep_set_access_flags() which calls
>   ^
>   architecture

Oh. I'd forgotten to apt install codespell ;-)
  
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
>> 
> ...
>
>> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
>> index 0bd4866..9724b26 100644
>> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
>> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
>> @@ -752,6 +752,8 @@ void radix__local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmadd
>>  		return radix__local_flush_hugetlb_page(vma, vmaddr);
>>  #endif
>>  	radix__local_flush_tlb_page_psize(vma->vm_mm, vmaddr, mmu_virtual_psize);
>> +	mmu_notifier_invalidate_range(vma->vm_mm, vmaddr,
>> +						vmaddr + mmu_virtual_psize);
>>  }
>>  EXPORT_SYMBOL(radix__local_flush_tlb_page);
>
> I think we can skip calling the notifier there? It's explicitly a local flush.

I suspect you're correct. It's been a while since I last worked on PPC
TLB invalidation code though and it's changed a fair bit since then so
was being conservative and appreciate any comments there. Was worried I
may have missed some clever optimisation that detects a local flush is
all that's needed, but I see OCXL calls mm_context_add_copro() though so
that should be ok. Will respin and drop it.

> cheers

