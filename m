Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ABD87581E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:18:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=j3UVtH/f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrLFz6Jj4z3vj9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 07:17:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=j3UVtH/f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrLFD0b6nz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 07:17:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUeOorKkZ9OFfLTlobVEbbCggrzqkdw4uZPOGMNdjEkfb+TpeXGUQtrtISKJl5+t9fIMb8xo6IyqJDKzqgMl4r8ZJ2HzNrVdcqzcmD/BVLBJpq9ur5YFwzJIYheGP5jxoCly6U9pnxvYkhngaLCEWtszr6TcnI7FzyZhGF9rK+xF31vJuHTdWY1MmxNuzGmIaJCUe0o9xCMD/VwguyBQjV+vDm+cv7qpElUm/KAtrp2KBP4YM9XZmE2WuolxlwZOnEygqTeH6xYuk0BpvU8kOgDeLe5lE19QlMeZDWdSHNPRpkw0vP5a9iAjLb2OoBPcoHMXaQ5nBydrCatpyoU4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjYLYsWUwR6Os+WUro8W9GHIcP7kmbFChN+9az3aDdY=;
 b=fLA/gr4qSFjySjO9n4Tim7MvnG3xqqnymm80GGdwvrzeGGZyDSxO061x8tOdebRvjrDzGC3UAmz6mvTZsBjOEKLzMnb2BfvEi9dyc7xgUqKssUuj6VZCBIJfZkAJB6f0z427f9bdP1ohyY5/Jw0/U9ql3iTdg2/v0NgArB91kLG1DMuAkbNrH3YwTiU3rtWHLoHu9SHoj+zVHLFT/zibxxzNK8zlstjEFqsNx0d16MYywapEKVs3g0GQTASi6bsD1fFKBgaylCqXP6A/V9OvfvvxD6o9eovQ1vG3A+kS3ci7eEyOtQM3G7bzKVD96X8cV3ntxbrVNucjl7tFJRh51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjYLYsWUwR6Os+WUro8W9GHIcP7kmbFChN+9az3aDdY=;
 b=j3UVtH/fJzzkCe8JQRPxTEeyU2ZGhp//VEnnGurdy1+9Uipsl8ykUbo9JaYTle9W8eD8VQmhHQW5QVTTdxNyFFonEqKqbOzyOTPo0CEXchzC+R4B5N+rwHcaaQgjq8Qqb2om/uj9yySTtN87yU0mHh1BB55kr0xc+u72XJsBFG2ZUac3W7ChjE+3jN5/LfUf0PP/CaNKyiCmjo7XtF1G4FEpog8pp8P/jcPew+pwRISPiZu0bNsQI2Nj11Sn5+X2r2/5eUgg1J9PYJtdRCUIHrnrAz2HaGO877JCm/CxGFd1tBOO6Xk8u0l6tznIQ63byvHpNf6y9/ivnfAjVb5Mkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 20:16:57 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 20:16:57 +0000
Date: Thu, 7 Mar 2024 16:16:55 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH RFC 04/13] mm/x86: Change pXd_huge() behavior to exclude
 swap entries
Message-ID: <20240307201655.GF9179@nvidia.com>
References: <20240306104147.193052-1-peterx@redhat.com>
 <20240306104147.193052-5-peterx@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240306104147.193052-5-peterx@redhat.com>
X-ClientProxiedBy: SN4PR0501CA0069.namprd05.prod.outlook.com
 (2603:10b6:803:41::46) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|MW3PR12MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5be981-b8a3-4f7f-016a-08dc3ee38a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NJ8HhtV0wbDGRgbqsFpHWrL0TsNjgen6EOcqvzAwj1i+rknyc4iW+GjuROKcYGZ2InjINyjuJFn6arn9/u/outX9LkV4Kkp+h2wFho6BWXqozGFHnpomOiiLzKh0+K2OwTpJE9/l2lshCFytUlUEANeckfu2Abwhj/F9D9P+VqUYXVArGYXYbp6NuoVAfgAWWrh3hCNTrADdizHWo9ZGUR/K5ZSeef8I8/y6Z1l2fOKj4IKyaPisYNaoSOt5zB2bPIayMRpNx7MKbCDLOnoqbBTJCzambgx+XD46uLMHvY4P/3PdQmbxC0Im7XaP6XPxdPuN9ACFuVoLlZMWlbqLELqic8+19OtI7IF74/MhFSje/7Ea7E3TvwF62zjXWVNjiYcpDxVgUVMGblec1rdUZZtqK55qEL9d9htu/jZR7X+6UbSQpVTyMqZKp+51NCqR3+6CuIEzvZeTPK7deTE7fUyxcvf26NvKZzmiKYEvL7NRA9vqRU8m/M7/+b16kRuVGFySGfJlzh9mhbw4kJleM80czkHWI3rl3ne9QVA7+nEl+WZ8Y1eBEe7yQHHKelCjaLENOeSyF5XINxM3I3PpO+BPv+qBTy2oJ9bjYEAPw3mETRySDUoTJ5eyq4qFDsvOH64a+P6IrCGSj4CoeYtHTORv/pajhfEeSkblmzS8jvs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?U0pwSFhuZklCNENRWS9mVVNlOUFOVDBPdnFyOEJkYVV5cTJlL0VmNjVBZlpj?=
 =?utf-8?B?UWZDMVY3SDdWZnptNFlrYjJoajVFNC9JSVFhdDBPZm5ZNE1ITjVtNzlxaS9O?=
 =?utf-8?B?cVAzcU5OUFZXYis0Y1NnZm1wbFJqMHI3S1VYdktCMDhUaXhLbSthc0tiTHdD?=
 =?utf-8?B?RkdjUzk3MTM1SFBzekxVdVJjZ3A5WjhkS3Fxa0N6eWo0emtoT1gvMG5yMG5J?=
 =?utf-8?B?cWlvdnFPZXFLTytnNTAwOHYxUzFjMGlIRGxGY0RtdThTR2JsQlNqQytwMEtr?=
 =?utf-8?B?dWpSOGVicWxkdEdyRXpad3NaU2I5Zktvcjd5QWJnSW5PUkR1aU5RdGtNNVh5?=
 =?utf-8?B?elRCVVdnQ0Y5b2cxZURwSGNPZi91V2NCNjY3N3RUMnAyRnpVZXYzb1cySjds?=
 =?utf-8?B?Rm91Vkl0YXdZbHFYbmoranAwWWM3TEF5a3hHOEkvMExCSDRrNmlnOHhna05m?=
 =?utf-8?B?UEhVdVd6Vzc1UXRQdmdNMTJZaGptdlpFeEs2Q3ZJNjB2Wlh2S0IvZjNxSUFR?=
 =?utf-8?B?dCtGd1VrT0RFREFMYTI4eTZIbjM2N2twUXFYWjNwMmw5U1cyeXNrY0xya2xY?=
 =?utf-8?B?elM3SDVTWUxDUk5iZG1JL1lkZ2loMzlkNmZVaGhIcXY4QUJicXpWTlRKYnl5?=
 =?utf-8?B?d2QxQjRDbDArZUcwK0RpM1RCa21aaCswZGdPRldLVXVtaGVRdDdmSWxGTm5K?=
 =?utf-8?B?SVNJQk9CYkNMT2pCUXIzdXo0cWI2cERURUp6VXVZS1NsWVVWWE1xTEpybGR6?=
 =?utf-8?B?aTdBU0pLK1lMbkxReTh6U2F6SUpONkFNRXUyZEFyNytFS0grNXF0MHlOT1pL?=
 =?utf-8?B?Vi8zclUwMG93MXF0ZDlsRk9JYUVhNXFhRGp6UnJTOGk1Qkppb0tHZUllRVR6?=
 =?utf-8?B?RmFRR1B3WStuMDJHZUdZZnNBN25xSzJKZEVmOW9oeVd1aW92ejRVWXErZDJL?=
 =?utf-8?B?MnVpN0pLdWU1eVBTT1ROQjZBOFM5TysxcTB3TXM0WU1iemxIRlcrdXlLTWZu?=
 =?utf-8?B?WmdSZlZScHo4OXdaR0kvM0lkZzFvTXhteWhkaDhKRTJJK1N4eTNGUDZqNmxM?=
 =?utf-8?B?clJkQ3NYbHJlblFWSFd6V205UWhqVm53VUZTTzZvaWxpQndCbVZydXNnQkxr?=
 =?utf-8?B?amF3Mkhlcmc3bGNIbkJnQjRIUVRQWFJlVWh4NVBNUUlBYzJUcXJ6dWJiMWVD?=
 =?utf-8?B?MkdwaXR2UHhWU2tDa1dMWTEvdWk4S3l1OUIwVFYzRElmOUFabHFmYjZ5czBk?=
 =?utf-8?B?MEZMS0F6RTg1Rk02SUNYdzh4enBFUWF6NGxFZjZaVU9nVjQrc2NxUTRYQi9h?=
 =?utf-8?B?S04xYkNZaDdQQ1dpU3pZQ3U0WlhQM0NWUHk3cjM4SGUvUXlGczVKVzM3WUFC?=
 =?utf-8?B?Mm1BcStNNW9YNVhXTld6OWdlVzlWN1RIdnFwZ3RoNFhLQUtXYkFRcHJTQWo2?=
 =?utf-8?B?TmMybU5xaWdwdjErUmI5S3FRRmphZjJUbVpNUXRyM01vU2pjUEtqR003YmxL?=
 =?utf-8?B?NEIwNGdtallXWWtXN0M5N3ZMbTVCMjdhSTlmMFJZK3hQWWV0RWdpeUZJbW5G?=
 =?utf-8?B?UnF5TW9KVExINFcwMHhsYWVtOE82VHFoajVGRW5DV1UxeExlMURYQ3UvY2tV?=
 =?utf-8?B?ZDJXdlpXektTeUhVTlpObC9kZ0JLOGZzZkdWTXZEUmx5K1JnQUU1TDZEd0pI?=
 =?utf-8?B?WXNUNXZJalhBN21yUjVodnhTdUlVb0tFMk1HN0lqS1pZUUtBSUUxaHFoOGF5?=
 =?utf-8?B?THhyYUl5b1NEWkYrRW1wZytRRVAvWFNYczJ2ZVdseWM2SGg5YnBnNGVMQ3NI?=
 =?utf-8?B?cDJlSzRaOCtVSk9MNW9uMmhpbUpsR0ZGeE1MajAyU3RFa0NnVHYrWGowTmtl?=
 =?utf-8?B?aVFoMk1yb2wwaVRUSG5NOFJsNFNCREdTMnFzeWdKZWJ1bTBhVlVGeURJYVhR?=
 =?utf-8?B?a21NVkE0Q3R3RHhydmp6dXcxeGQyMko0YnFpdjZoTVprRVIvc3N5YnFYWXk4?=
 =?utf-8?B?d3hTY1hYenc1ekFnU29UbWpEdVdxbUJFcUNqSVVncHNpSklVemFpTnpUVFZB?=
 =?utf-8?B?eUdXV3ZTblkwU2F6T1RSNUwwb1JPcjd0dTA0MGthM3pyQ1ZCQnRKazFwNUJ4?=
 =?utf-8?Q?w/zQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5be981-b8a3-4f7f-016a-08dc3ee38a08
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 20:16:57.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5+PuvTjZrLgdSDdJIvRa5G12f22nrcc9yreOm+GTWyDuyBejV1Cd0ZX5bcGF6GP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396
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
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Muchun Song <muchun.song@linux.dev>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 06, 2024 at 06:41:38PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> This patch partly reverts below commits:
> 
> 3a194f3f8ad0 ("mm/hugetlb: make pud_huge() and follow_huge_pud() aware of non-present pud entry")
> cbef8478bee5 ("mm/hugetlb: pmd_huge() returns true for non-present hugepage")
> 
> Right now, pXd_huge() definition across kernel is unclear. We have two
> groups that think differently on swap entries:
> 
>   - x86/sparc:     Allow pXd_huge() to accept swap entries
>   - all the rest:  Doesn't allow pXd_huge() to accept swap entries
> 
> This is so confusing.  Since the sparc helpers seem to be added in 2016,
> which is after x86's (2015), so sparc could have followed a trend.  x86
> proposed such swap handling in 2015 to resolve hugetlb swap entries hit in
> GUP, but now GUP guards swap entries with !pXd_present() in all layers so
> we should be safe.
> 
> We should define this API properly, one way or another, rather than keep
> them defined differently across archs.
> 
> Gut feeling tells me that pXd_huge() shouldn't include swap entries, and it
> turns out that I am not the only one thinking so, the question was raised
> when the current pmd_huge() for x86 was proposed by Ville Syrjälä:
> 
> https://lore.kernel.org/all/Y2WQ7I4LXh8iUIRd@intel.com/
> 
>   I might also be missing something obvious, but why is it even necessary
>   to treat PRESENT==0+PSE==0 as a huge entry?
> 
> It is also questioned when Jason Gunthorpe reviewed the other patchset on
> swap entry handlings:
> 
> https://lore.kernel.org/all/20240221125753.GQ13330@nvidia.com/
> 
> Revert its meaning back to original.  It shouldn't have any functional
> change as we should be ready with guards on !pXd_present() explicitly
> everywhere.
> 
> Note that I also dropped the "#if CONFIG_PGTABLE_LEVELS > 2", it was there
> probably because it was breaking things when 3a194f3f8ad0 was proposed,
> according to the report here:
> 
> https://lore.kernel.org/all/Y2LYXItKQyaJTv8j@intel.com/
> 
> Now we shouldn't need that.
> 
> Instead of reverting to _PAGE_PSE raw check, leverage pXd_leaf().
> 
> Cc: Naoya Horiguchi <naoya.horiguchi@nec.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/x86/mm/hugetlbpage.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)

I think this is the right thing to do, callers should be more directly
sensitive to swap entries not back into it indirectly from a helper
like this.

Jason
