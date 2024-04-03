Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB750896FE1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 15:09:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EZsUjcmo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8lSX4LqGz3vgG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 00:09:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EZsUjcmo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::701; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8lRr49HTz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 00:08:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3w25fck0Xw5esq4kGkhlplhRtKt3Bhqc5wR4rOUIYDFeDszchdOTgHojSkhQ8Q8VNNgJHgzCYIeLCtfQT+PhnWk5CYcZNTnx/VdJ6K1/g66MfE0BiOuZ38MP8ojU8YXwz5QAmCTc5dStK/Awf/o1+DxQZPJhNMYkADcQCZ2CVzHY88dHt/86DJfbLKaVHSkcRH0irw+UFElzkc8VTelNReatVwY58LVHvrWoKwXpHr/qz/pZ6EyaYcWCNOgLS9uhLkVFqw230p3FQMjDm0UFdrWKKWQOD4CSt2I7yDJ+IbEvh3RfVRLqb57c69BPGKQtoRUKU8kBwqR+I1Kj4uO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPKLtrzmN9+lHp7by/pqxBXrsMwmMThT5Y3YwTuQlGM=;
 b=R+/ISom/+zs1gxF6ifk2YxJpRCzfWk/YuHH5rg/F6xx/3WyPn5X/jmLcpTJRNR7LyCyMZLySUFIczydeXfJ0G30L/qT0U6Ux2B9JJabXXhknXJ1DJKYeDFRbYm+nx/U1IZ+CjWSYBcTj5U/0Kaz2F7c9PDatG3uewSaZxQsXZ4Eu9ccwcIKLPRilgaoVhfvrWG5vkYN1l/0RwrKxrObbpXNS5yi872f2L2UHAa1BJ5FAY4F6mOvjpVy5B9N95ut4cD4fMLlAcmWnDh9IHzfJeRhQfLRsiTCdfRVMHMJIWdQ/Eu+klXh22wSZOnzPfIL69DVpuBdfIXNqlMc+XGMY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPKLtrzmN9+lHp7by/pqxBXrsMwmMThT5Y3YwTuQlGM=;
 b=EZsUjcmokCmLxDCQkCwetwzq8kIyQ1YN146Rv726L2IOJHQcDnvuVi+KdVxZXRq7oMliaWDFDw/NqYeCycOM61p+9GMS/5Zmx+Nhk9+rZzxFa8nzibbTgsyXFcFN9mqSRyFJQghxmLSbRyr/mrFXDQiQFQO5A0433vqccwe/0Hbc7QtPncpgJ5Hl3Hx+in0ABxn4kLDXAy24WGnjYwRIKAr5f+cjjd9qUUOyXPVmIsEZ5mgPaOkDkngZyDOwFvLOn3/FgHZb3HJTabByubeSSkcbvk+F+SaL00fck/VhZcxUEGD7kszJO35GmeINHfkM766eM4yOPcwACCW4Pw2tPw==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 13:07:57 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 13:07:54 +0000
Date: Wed, 3 Apr 2024 10:07:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <20240403130752.GC1723999@nvidia.com>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
 <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
 <3da59746-8acc-4a91-a19d-79a37ac75a8e@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3da59746-8acc-4a91-a19d-79a37ac75a8e@csgroup.eu>
X-ClientProxiedBy: SA9P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::12) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|PH7PR12MB7308:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2FN5sV7ggEC4QGfJXPKiiBqIaTFE1ktvqeTVs4zje0Ra+fmuIRfTH6zQWioXqzsuz6tnnTL+kD31bhztM3zXi5FrMsLbY10BvsaG5f9tfym04f2xdYEQp0768gTs5ndUv7sfA6Li0A3QSXvXKZE1Y49GXHJ5gg1rg0ur+PH6KS0Nr+CEJ+DsYN+Xc8AEt54prP0DLph29QZ8k8ND/vz1K/LNoycgpbjlk2Nq1jHd8lLJ1SUmNK9xye4SjDwBgaB6VSMtCTW7WyQaZjBwE3ufET2Gf5XAmUvUbIVht42svTXlPKX5X8CZiTQZiXIvx4mtQiE5i1h9xgr2Fq5moPkvNkXeKxHbqwAzMnXLFilcvY/LniK/WJoyjhNCh2l1pOONIWV3s84yfkLrCnWX2jxI/a/AV7LKGvIDixUNs+M9cSWQNA+NRR8QruTSAY8Mo0lp5t8Tz/fH3cs/EGmUtXjfh8Prsd1Nd5utyDZgKue/AHyMpzvFnqsnQeDosFDcx+7PUZCQtdLishtf+OxjH/6FOawBgwJ5OT7f5jVCLxJKiDK4kNC+qzA7Jh8Vw66aokhv+o+8bS8RuaSV2N85pV8zHot+IeL9raPWLxKi9PiFalW54XdBS/XeSsmc8xO+5FbHML7GV3DspL5GaUeXh1gb6LhsiJH7FwFLBaGIkYqMik0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MVB3NkR4ckdtWHhEcVRyZVA0RWpoWFIzTjZkOWZLSUREb1Mxck95Kzh6dVdT?=
 =?utf-8?B?WU42MWg0ZW92SHI5ZlR0MHVTOEJHSnNCMDJBcnBORHlTRDBSNE01bEVrQ2Z0?=
 =?utf-8?B?WlNhdk5TYXoyMU9WaUdVUExhQmJBbThxZTV2NjFITklSYjZBTktsQmU5VjFm?=
 =?utf-8?B?N0NtRVQvZHpibVhYYkR0WDBJelpPVlh2ZDJ0c1NIZnpXdmJvRWkvelJMdzVR?=
 =?utf-8?B?YXpxUzBGcEpUS3dxc1ZrMnZDUU9mdEszdU0wK3BYRC9NYkowb0tlaExySnp1?=
 =?utf-8?B?SkMrWnlwWXlSS0tyV1VNTTFsMlM5Q05GQlZSZW5YZ2xvMDM0ZFMyTTB5a0ht?=
 =?utf-8?B?NjREMW90SnRqbGpsVEZiWkhwRzF1ZHplUUdMY0FJODNEdFFYenpiczN5L0hi?=
 =?utf-8?B?bnVOSDVsRDUyV2p3K0lKZ25hVWdMeTRDQnhZYUcvSnFTRk1PM2Y0WjFxeUM2?=
 =?utf-8?B?MzRyRUI0Z3l4a01xTmFvbWNiTVp4OTJPRzNSSXlkNks1bi9ObDAvc2lDNU9t?=
 =?utf-8?B?NzE4VUoyT3J1TzZMNko3NGsxMHN6V1F6ODhJN1pnZWJ0T2U5UktCUTUxRlJU?=
 =?utf-8?B?VlRPZDhuRzJFUnpoKzlNZ2k1RnFpSk1YWjVGWEpaRzZ5eUdlejVpQWxLVndk?=
 =?utf-8?B?cUhhMVZ3Qml2MVpOZ29EZ2NybnZWc1JUSTRBNmtOZ2FkdW5WbkpPMGpuUVRR?=
 =?utf-8?B?enNnL3lHL0tuSjVhMU91VDRyKzU1dnlxQTU3dUtyMkFETE9OaERlS2hTRUpY?=
 =?utf-8?B?bFBCdWsyRDZWbm5lbE1EcndhbVdmbTZLay9YVnRMSkM4SzAyUHFKQmVEVkJU?=
 =?utf-8?B?WW13a2Y1Z2lvdTdmRk5ZaFp2RVprRDJYUW40cmRwOHhDR2FWTzIyS09XTzNC?=
 =?utf-8?B?MFpaTHYzenhTQXZpUGFqR3NFa3RWVTd0dFFHU3Zjc0lpeDROSmpTNGhXYlFr?=
 =?utf-8?B?Yk1WbXIwWG5jWjJPUytOaitFUit2NzhWOUROeXhYaHZlZC9NV3lBOTRLSWFl?=
 =?utf-8?B?T25GYnMzaU5lRlV4NW5VZnZGME8vQzI4OFBRREVmUGdTT1NyNzdGaVZkTHc1?=
 =?utf-8?B?M0FDdGJ4NjJSOSthcEV3Q1V4QXBoRVlLaUpUQkZKM2phcHp3NjZPdFVZSjJZ?=
 =?utf-8?B?RFBWZW1QeG80b3VEdHh1ZUNCL0RQK00vQjhEK0wzQkhqOU02VkJoMVRVSHMx?=
 =?utf-8?B?V1pGN1luNU1wVDA2QThMbmUzbXNZKzNuTFJOdGdmNG1iazY1TmVhTUFwM3d3?=
 =?utf-8?B?V3BSYWpKSVpGUEhRTTI3MG96ZzJ1SWRIN2JQbDVOWnhCYm1LeXJwaDMzVnN1?=
 =?utf-8?B?WnVNbHhENndmY3FJNTVvbkJJWkpvNExLNXNDTEtjbW5LU3liRENtdUVPUTBM?=
 =?utf-8?B?a3BDVUVlUFI0MnhBTzd2STcxaG43WUJiQTZlM2FQVyt0a0dsTTJJM3BucFpS?=
 =?utf-8?B?QWlueDlpaWFaVjZqd20xS1J5NGU5VzBVTzdjaDdyak1vYWFsZFFYajMxbDht?=
 =?utf-8?B?WVk4UG91aUZ0c1d4RE1yR2NNc0JHUllFcmtHdjBGRENGUVJhT2xCazVxMXF4?=
 =?utf-8?B?SlZWdW1TOW5RcUFVeTEyR0pMYnB2eUNoWkEwOVlLd29IM1BTV2xDOCsvTTRj?=
 =?utf-8?B?d0VsSmVYOVlzcjlRRWU1ZWJkTGxQRjYzMlFnNisya01LNDR3V3FZVzhaTWRX?=
 =?utf-8?B?STUvVU94cE9sQmYwRTJGR0ZIYzVCeVQ4SmQvOXR3UkVlN3dNVFlhSEpDQ2Yx?=
 =?utf-8?B?MTVzMHNIYThxZkVmRnJDTUVia1Z1SXk2Um0zRVM5N1RmQ29zalF4VFpuRm1U?=
 =?utf-8?B?UFJRYXFURnlFSWpkenpHNWFRVkpHaWpQV0RlSmxUbkszV2lkb2liOEE0QXhR?=
 =?utf-8?B?SEhCdXpraU00MnJuUERYaUQzdXZ0c2REMHZKdmo0NXBYLzlONlZnempEUUx0?=
 =?utf-8?B?aGszRlk1K0h0T1VxY1BGc0NjNTVHQWd2TTN1b28wSWR5Q2pCL051dEhBMVdj?=
 =?utf-8?B?cDIyc201dFFub3JXbFdVakd2VXJxM0FaZFpmMmdwSTNBVkVtZ21mRWdYTnAw?=
 =?utf-8?B?TEkyMFdnRjMwakVuN1ZHUndHYW82dWNEYVlBNEE1UWtIRVhnWVhHSFJqQ0FL?=
 =?utf-8?Q?WZmjXLZHjTKALExzitY+uTAbW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc4e13c-4496-485c-17cf-08dc53df1337
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 13:07:54.6299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6oFKsgagNWFi9pA8yE6mLHKr7nCI/bWxa0QlCbovMHfTFY3OK5bntAFNu92bq5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, WANG Xuerui <kernel@xen0n.name>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, Nathan Chancellor <nathan@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "Kirill A . Shutemov" <kirill@shutemov.name>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, "linux-kernel@vger.kernel.
 org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2024 at 12:26:43PM +0000, Christophe Leroy wrote:
> 
> 
> Le 03/04/2024 à 14:08, Jason Gunthorpe a écrit :
> > On Tue, Apr 02, 2024 at 07:35:45PM -0400, Peter Xu wrote:
> >> On Tue, Apr 02, 2024 at 07:53:20PM -0300, Jason Gunthorpe wrote:
> >>> On Tue, Apr 02, 2024 at 06:43:56PM -0400, Peter Xu wrote:
> >>>
> >>>> I actually tested this without hitting the issue (even though I didn't
> >>>> mention it in the cover letter..).  I re-kicked the build test, it turns
> >>>> out my "make alldefconfig" on loongarch will generate a config with both
> >>>> HUGETLB=n && THP=n, while arch/loongarch/configs/loongson3_defconfig has
> >>>> THP=y (which I assume was the one above build used).  I didn't further
> >>>> check how "make alldefconfig" generated the config; a bit surprising that
> >>>> it didn't fetch from there.
> >>>
> >>> I suspect it is weird compiler variations.. Maybe something is not
> >>> being inlined.
> >>>
> >>>> (and it also surprises me that this BUILD_BUG can trigger.. I used to try
> >>>>   triggering it elsewhere but failed..)
> >>>
> >>> As the pud_leaf() == FALSE should result in the BUILD_BUG never being
> >>> called and the optimizer removing it.
> >>
> >> Good point, for some reason loongarch defined pud_leaf() without defining
> >> pud_pfn(), which does look strange.
> >>
> >> #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
> >>
> >> But I noticed at least MIPS also does it..  Logically I think one arch
> >> should define either none of both.
> > 
> > Wow, this is definately an arch issue. You can't define pud_leaf() and
> > not have a pud_pfn(). It makes no sense at all..
> > 
> > I'd say the BUILD_BUG has done it's job and found an issue, fix it by
> > not defining pud_leaf? I don't see any calls to pud_leaf in loongarch
> > at least
> 
> As far as I can see it was added by commit 303be4b33562 ("LoongArch: mm: 
> Add p?d_leaf() definitions").

That commit makes it sounds like the arch supports huge PUD's through
the hugepte mechanism - it says a LTP test failed so something
populated a huge PUD at least??

So maybe this?

#define pud_pfn pte_pfn

> Not sure it was added for a good reason, and I'm not sure what was added 
> is correct because arch/loongarch/include/asm/pgtable-bits.h has:
> 
> #define	_PAGE_HUGE_SHIFT	6  /* HUGE is a PMD bit */
> 
> So I'm not sure it is correct to use that bit for PUD, is it ?

Could be, lots of arches repeat the bit layouts in each radix
level.. It is essentially why the hugepte trick of pretending every
level is a pte works.
 
Jason
