Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B0B82E03C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 19:50:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UD6NHVoP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDLmg1PMYz3vss
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 05:50:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UD6NHVoP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::600; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDLln1086z3vlS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 05:49:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EftCtHw1ouSxiI33ipl+QAn4uT/T5pkHtVLImHGe2Vrak+fhVfpJaxB23dBLXIbwYlGXnktn7Hpr9+GdK9KHgbzdbq3UnNrVIUVpL1A1owE2OiXtn3k89HcfJ48CCm6qCygn+ZD3WuMF6Gy798U/afWA9s6fsqCQEuI0n+Il5gesfXAXSBy2O/L3+WivPgY0FdZM5ZcFVCKjpRDWpl64hM8Uy4/XprbbIbl9b64a3xv/dug3Q7DgSzYKlQvfltv/yu7r/4OixF/sDt8GohJvGo17c7D5Q4LmmDEMem7iUiyFvs9hTlpa3SFqRp0xCEb2NRwo7R0IrAHDdbMnFrZtRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMEteKoefsg/B6DYISqjwDpYoPWCilc8deuZZQd6xTs=;
 b=ircoqMJKsneh4rro5udtSXd6gLc+BNhKYjWJ66kjJ2V1p0BaW8bBFe9KUvpwaHrVo8vCYTdryCmYSbbd23K/BPHW16EnCwCsf+YCHI+gdCSwpZj00fXN1OSfibmotGbMycLCvSF/uEZRGBgbGO2yJHQkHaIR9GD8pp/DjwKiIdEYEJDqEP5deX7nswERCd4bUKsbgtCMjcP0GZMJJZhwTL1rVED1aVqUc2camlOEle/RS35VQ/+QFb/kXXBmNXDmevgn6PYcY+mCrwHJplszVZIW6MCuLIAZ2VQQE1DWg9wUSXn7iZPY/3EIaj97J89CWyCMo5JvPq1Cb1yNVmjuLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMEteKoefsg/B6DYISqjwDpYoPWCilc8deuZZQd6xTs=;
 b=UD6NHVoPfxI8XOU96ZcAgsapsWZbcsxtmY1LOC1heEBLaOx05PHQOBdg8e0gRe2Qpr3U2W8044wEbRmH+85X6bzdQzpSHupcR2LyZalnKH5qQUGW6IoRU7Vdw8cQ5EI8rVve+zxZK6uIXvwzhFh5r2E8lB62eXry03vaVpN3RpGXMjXSmdRS2N4kofZgTMYEoLQtqbAPcVzwVFapjQrsaPl0OJoAXZ6weyW3DvlBzSWlhQ5VeZZQxbibEv5BqeTJnptNiTV1emRLSEs1PkjG07crRdW5kK+nUvPt6gsPMr8Gxnm/Y0mYWaN31a6pEi/V+FAbKXfYC7GtYSgJkmF/WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5769.namprd12.prod.outlook.com (2603:10b6:8:60::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.21; Mon, 15 Jan 2024 18:49:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 18:49:02 +0000
Date: Mon, 15 Jan 2024 14:49:00 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 10/13] mm/gup: Handle huge pud for follow_pud_mask()
Message-ID: <20240115184900.GV734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-11-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103091423.400294-11-peterx@redhat.com>
X-ClientProxiedBy: BL1P222CA0012.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df37c85-ec0d-4449-fd25-08dc15faa454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5rMXHldge6YBjMMsjPwt7tvwN9+mbiDdf/UGr13mhrWm9S9TnboN2t4e7NcJw3V/iZ8DplcFuc2q8TG40Tv8tI5c+tCVBTrK+A+rjvJPZTyd7POl105zJAR9Q478YfHbKgbzIp+V65frshLt2jAo4ZWp9ai6NA1nHk3+biYXV7G6X4OTVfnM7ZhXMO781l/N5DkGRJiCIFE1kOeoIcxCAXOzbYh5FJXj13Wtwdf8BDy40DilmO38UxDkSBSpRtddF3Ol2KS2NvKIhtJFJOIgdJEdwP+mGGXq9kvrF3iOA0FvVU+L1jAiMUBhgjIK+oN+x+FpI53j/lO/zabgt1F+u+ccy22srQG7EzX3KF4ogajabiTkwLOBVqEBRVYjR7W7j0S7YsKY0HhhYEEeYwV3lztO5iQ31nM7qC58ajrHJCQ0Qv6hmN6SuCpr4KpM494lye7mZwbm47plZvEHUcDa9Gurcm2PrkxksrB7IKK2DUy62ZDR7d4Po16yRkIYTgVPmWklqePneJpuMYUUc73TN5WI2yppDn0ihPgm3c34xQb6yq8i5GkChgyct5PxvuwJN1+fNZz0gOGzAG15+fz+A+iLLIte497/dXdLEzBgXyeTVlhlCZUpvhElWOUvLyZV
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66946007)(36756003)(316002)(66556008)(6916009)(66476007)(54906003)(6506007)(6512007)(478600001)(6486002)(41300700001)(8936002)(8676002)(4326008)(2906002)(7416002)(38100700002)(83380400001)(5660300002)(33656002)(26005)(1076003)(86362001)(2616005)(27376004)(14583001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Xbawbzfm98gnNL2b1C7Y1xfdrPC94p9mJt5uYRvvx3olbf6JeeYXYxIY1gqM?=
 =?us-ascii?Q?KwHBWQD7lLxCTll3qavOzkMeInfj31f8e9QGgdXQqh85m7OVRaEhdL2USuaE?=
 =?us-ascii?Q?HZ718tmFt/TBZapr3diLksMNnXW8zYyMfouP2lx/hgyxcgIXa37k9AOxALhI?=
 =?us-ascii?Q?wEK1EAd7U6IN5RiZV+mDHtMkOnYw/lDmq0dq8etHMYbJEf8ZQHfDx8X5d/Ng?=
 =?us-ascii?Q?XsDr1PFeQFvnK2Ow86uT2oz8HsMc5zNVr5GdV+4NO4ekUhHfW7qrNFBiyftB?=
 =?us-ascii?Q?ncEItTe8crRWnWFOSElGPzlbqvZv6DYaqT+JzVZ2byew1Jrl/XQ/azHslzYb?=
 =?us-ascii?Q?QohpBXpcXK4m3lZlvfhUzDRbhHBmHmdp+ELgypARuU+Fmq+Ms9mo+gioy06W?=
 =?us-ascii?Q?QOgtARqAjcP8DYRwGYxvOtg2Huw6LDCCnPgr2T39YZqzZjh5PHj+iLgAVofA?=
 =?us-ascii?Q?GLxFzT3CCNX01eIHcbmzs8BCTWO7HUgflXfAzfH/JB3N4K0U09LuR0gEvmfU?=
 =?us-ascii?Q?KOC15Q4EJjU0hV3LV/chqeb56svSAv8mKNKmTmG70EyuziXGiGrOFI+9bujV?=
 =?us-ascii?Q?QPMPjrIWXNNi9NVaE/o1SNIlis7LopHp8bmdiTVIX6azN1P7uFLJrZGKGMao?=
 =?us-ascii?Q?n6kNSwB1wYw/F7ogb0NMlAf609DQeoRa/QHu6+V9L9wTF6Dp0VazUL6c2a/i?=
 =?us-ascii?Q?uX+rztMqpk5G+w7N7rhXV7lywGIpR7eygyA8QquDbqTq5v7pFRDyCT+SNFJs?=
 =?us-ascii?Q?X2LL0Au80KztxRkNj0auhVxOYEpDysKVHayrNc79MAVow7cIOsYgtY3GfWmk?=
 =?us-ascii?Q?xBj+u6S3THlBK5GP940obRfc/FVzcLvXxlIGKBKeNecislg4p2iJNNYklg8H?=
 =?us-ascii?Q?hmAmFUA2xOlhTFyMUNRYWnqOure5c+mPHyfmtYMYSu8B3plQWg/l2oNWkLXd?=
 =?us-ascii?Q?394kXIpkpPvCksew0F2kqyePIpa86ButQohzVNKgnQU8EGR6SQkmIUjCmc9f?=
 =?us-ascii?Q?0CPdmTbgcVTVum6jpBcRxW93P/E9tE2Dr9o7lmwIAiVZgl/98H0Rftau1Qlf?=
 =?us-ascii?Q?XZWddXkrJ1tMfB/jvQd4GCBezrwcw5POaXnuA9eaOsYOjJf9+e/HQAwB6fGF?=
 =?us-ascii?Q?cIL0SUFoalMnJJIt4PWQClXp0LYTPyfQ+JAalrJyjuZK+GvOr9dSbFOXztVW?=
 =?us-ascii?Q?3EjU0XIRkmVsSdNzkEScZIqn+mYQPrJ9OC2m74fzan0+G0d2jc4xzsmWfMfn?=
 =?us-ascii?Q?9/ZSdTBBb1t+2348BvBLpqtzFQCAQfG6XBsqJmHqDoCJ89c824CgjdkMgR4m?=
 =?us-ascii?Q?1pImngL8iQAHOuJVSIxbTugycyNKrbBgnQwItCJsgo429RLfC43GBblqqFcy?=
 =?us-ascii?Q?kZaDVR/HQXTwl1Q2veGHhMPhzsIIWSPT+LF51DX/BFac73tZ96Vz1mUruXRX?=
 =?us-ascii?Q?4fMK6z/yDh5M2CT4log3toW2FeC5xSAgMJv1XhVocL8By301gvxoFxUAana4?=
 =?us-ascii?Q?NIOeNaB+Xm1TXIXRZkH5QdlVAE4j9f2qrnEzFHAu4Emw4ODDBUcmsv2Mv+/X?=
 =?us-ascii?Q?cDEGQIq4qHIXd13ZZxaAkxgbUEMIQH70QUmVXSWF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df37c85-ec0d-4449-fd25-08dc15faa454
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 18:49:02.3876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mapq9JFYBeeRd0N7JKlP1GSn4tML8UzLriThEAs7LONP73z6fRPwPkPF7Dhb53p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5769
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 03, 2024 at 05:14:20PM +0800, peterx@redhat.com wrote:
> diff --git a/mm/gup.c b/mm/gup.c
> index 63845b3ec44f..760406180222 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -525,6 +525,70 @@ static struct page *no_page_table(struct vm_area_struct *vma,
>  	return NULL;
>  }
>  
> +#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
> +static struct page *follow_huge_pud(struct vm_area_struct *vma,
> +				    unsigned long addr, pud_t *pudp,
> +				    int flags, struct follow_page_context *ctx)
> +{
> +	struct mm_struct *mm = vma->vm_mm;
> +	struct page *page;
> +	pud_t pud = *pudp;
> +	unsigned long pfn = pud_pfn(pud);
> +	int ret;
> +
> +	assert_spin_locked(pud_lockptr(mm, pudp));
> +
> +	if ((flags & FOLL_WRITE) && !pud_write(pud))
> +		return NULL;
> +
> +	if (!pud_present(pud))
> +		return NULL;
> +
> +	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
> +
> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> +	if (pud_devmap(pud)) {

Can this use IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) ?

> +		/*
> +		 * device mapped pages can only be returned if the caller
> +		 * will manage the page reference count.
> +		 *
> +		 * At least one of FOLL_GET | FOLL_PIN must be set, so
> +		 * assert that here:
> +		 */
> +		if (!(flags & (FOLL_GET | FOLL_PIN)))
> +			return ERR_PTR(-EEXIST);
> +
> +		if (flags & FOLL_TOUCH)
> +			touch_pud(vma, addr, pudp, flags & FOLL_WRITE);
> +
> +		ctx->pgmap = get_dev_pagemap(pfn, ctx->pgmap);
> +		if (!ctx->pgmap)
> +			return ERR_PTR(-EFAULT);
> +	}
> +#endif	/* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
> +	page = pfn_to_page(pfn);
> +
> +	if (!pud_devmap(pud) && !pud_write(pud) &&
> +	    gup_must_unshare(vma, flags, page))
> +		return ERR_PTR(-EMLINK);
> +
> +	ret = try_grab_page(page, flags);
> +	if (ret)
> +		page = ERR_PTR(ret);
> +	else
> +		ctx->page_mask = HPAGE_PUD_NR - 1;
> +
> +	return page;
> +}
> +#else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
> +static struct page *follow_huge_pud(struct vm_area_struct *vma,
> +				    unsigned long addr, pud_t *pudp,
> +				    int flags, struct follow_page_context *ctx)
> +{
> +	return NULL;
> +}
> +#endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
> +
>  static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
>  		pte_t *pte, unsigned int flags)
>  {
> @@ -760,11 +824,11 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
>  
>  	pudp = pud_offset(p4dp, address);
>  	pud = READ_ONCE(*pudp);
> -	if (pud_none(pud))
> +	if (pud_none(pud) || !pud_present(pud))
>  		return no_page_table(vma, flags, address);

Isn't 'pud_none() || !pud_present()' redundent? A none pud is
non-present, by definition?

> -	if (pud_devmap(pud)) {
> +	if (pud_huge(pud)) {
>  		ptl = pud_lock(mm, pudp);
> -		page = follow_devmap_pud(vma, address, pudp, flags, &ctx->pgmap);
> +		page = follow_huge_pud(vma, address, pudp, flags, ctx);
>  		spin_unlock(ptl);
>  		if (page)
>  			return page;

Otherwise it looks OK to me

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
