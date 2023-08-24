Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE60786EB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 14:09:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWhhP0FKBz3cSf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 22:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mbosol.com (client-ip=2a01:111:f400:7e1a::723; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=mika.penttila@mbosol.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20723.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWcpY0z1Cz2yTc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 19:14:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAwtd9P3AilnZWrloOWWut86HNIfM+iz74bPv8dArYqFXpsn48AJ9hS/qRog2+BkveysH7pq34OjFJ0vMaugWKHJgNC+fQDPd83xy51KXUF8fklKUiyLv7kGdrkZFjeWOAMhyjmO0VfAHD7NmW0kVn2LChTKzbeWh9t+rnmuR0IXJfC7OYOj6IrwnSWWNN+v72VYMQ5gB1DwScl39gw3PB6aWu5/l3xs5fsqKFLEx0kX1DA+eXWaWOrbGxyZV/v3eu4tuRv05ryoXOuoI7AGorPKqCHszH4qduDyFGU7r+D0pkvLCpHYkS7AztbqOkyFJ3FC/bFssebxijQiUbSjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmx4NQus/Iu9Is79WFKz6s/f889ZvIm44iYp3MU3WoY=;
 b=H6BTLW0toso+R8WgIjOUClNPFfTVSA8kwgZ4k78ykEdqraHXMF9Yh7sS6AQ0h/Hb9D8PR9eIj7bKfsFVjagmW1JAcLBqwVqZZBamc1r47Ck3oK0lyGSNC+nyRb500jmIWU7ERtq54+w7LDcwKGHQieYhm0H0BAlv7kyHgp6pmElbMJlfmRlfuHINUOy803PK6ZynjZ0P4/EB1QeWze0GgMz947dGYXM8q7pM+6rba8u6iXojkTvTBVT1F8XjKQYfBigkexwDhbEd7fecPSoCDMTRErXftLhE1V7fNI8IrlzmYwgiAtpu2OBKmwVsBZjKWYWRpnrVEHmbOmVXQt8/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mbosol.com; dmarc=pass action=none header.from=mbosol.com;
 dkim=pass header.d=mbosol.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mbosol.com;
Received: from VE1P192MB0544.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:169::7)
 by AS4P192MB1549.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:4b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Thu, 24 Aug
 2023 09:13:45 +0000
Received: from VE1P192MB0544.EURP192.PROD.OUTLOOK.COM
 ([fe80::5e94:a582:401e:1c70]) by VE1P192MB0544.EURP192.PROD.OUTLOOK.COM
 ([fe80::5e94:a582:401e:1c70%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 09:13:45 +0000
Message-ID: <23d545e8-bf66-bb3c-ebd0-5b4feca91cb6@mbosol.com>
Date: Thu, 24 Aug 2023 12:13:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 5/8] KVM: x86/mmu: Don't pass FOLL_GET to
 __kvm_follow_pfn
Content-Language: en-US
To: David Stevens <stevensd@chromium.org>,
 Sean Christopherson <seanjc@google.com>
References: <20230824080408.2933205-1-stevensd@google.com>
 <20230824080408.2933205-6-stevensd@google.com>
From: =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@mbosol.com>
In-Reply-To: <20230824080408.2933205-6-stevensd@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0045.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::17) To VE1P192MB0544.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:800:169::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1P192MB0544:EE_|AS4P192MB1549:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd0c6fb-8dd0-476f-9440-08dba4826ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	krEIPkkhoi5fNszH+7fM9q4pU8OEHtpZLpsrJz8HBy3ZABELoLb/ul7liGZZb1Pxm+VFO9rsOCUvG7Aoy7czpfqbMH+Yzn0hXgWhGJGCad8GgmWfAdtZRlmVuI/LBsp6O/XvcxD+EHb6E3T8Ucu1wi8OqwUsxXpWkeibZ40xGAk+T1BDcOeQLvUut2W865/gRdwWdObw6RReDT3b2AOYvVUiSj5jMmiKdXhKSxWpmHu6u9kx+v0qdoXM6kOg87K+RMfl2seZKZUkgbv6J2mWz4gXqt48lgXfB8om+joTt1s76dUKsJu1BM8d67vTKwjm7/SuF8Yoo702IqfaYX1GQXweeYQkGLNvpG7hm6ydKYGw3YxY3aFrI6ikAb/GSgMovxEi+B7IE1ebDXwWzwaYlaj97MkSDu9HqqpNhToy1MMVXMQ3U5EzNz2DypZkl0LyzkBIVMlhdFT9khqyflZ+TzKeFv24votWuE7f5we9h/q5WS9padxRZdzl61joWOEn5zfeV3GbLord9Zz2WpPjMT+tLXsPKaIvkLEvltjEWH+YPPzhkLtd3geUykiNZCxOsDNKlrio1Jnoxqn9AAIXCIYLfsCawspa+BL9feNkZk+Dd55SiF6XyRasvgJqwbneXC6ZuiDnfzPXyyVCnmnBFk6lPGSiT3y4PslFd1OLJeo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1P192MB0544.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(39830400003)(376002)(346002)(136003)(366004)(1800799009)(451199024)(186009)(2616005)(83380400001)(30864003)(7416002)(2906002)(66899024)(6486002)(316002)(66476007)(6506007)(66556008)(53546011)(54906003)(52116002)(110136005)(6666004)(66946007)(478600001)(31696002)(86362001)(36756003)(31686004)(5660300002)(26005)(38350700002)(8676002)(41300700001)(6512007)(8936002)(38100700002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Qjl3dTl3eFczZm9OMm1lZTlNTjQwRExiR1p6Y2RpaE9mUDUzc0xvRzZPdnBz?=
 =?utf-8?B?Q1djcVNwVytQa2pzWFpCVERGeWVNWEszbHNZWjI2a0xKMWVCd0g1QkZDK2Jq?=
 =?utf-8?B?L1BxT1p4eERvL3JyUjlvd3hNUE1Gd2p3ZjdZVEVaZFhjT1lHSk1hU0J3SXhy?=
 =?utf-8?B?QjRhSDRHL0QyUkxUbHYwVDJjMW4zVkpDMUxZK2VWby9ZcUtwYXd3RW5jZCtr?=
 =?utf-8?B?aitmS0k2dStzNnJDRnBNVEZHQi9reFpxbmM5YitOeUZRb0hMNWlrOUlIRkpP?=
 =?utf-8?B?eE40VnhvYThmOWR6Um1QdFVRK1AvNTJSbWh5RytOTGEyd1RKbVpRaWxtbDZu?=
 =?utf-8?B?TUFCV1lOR21XQVc5ckNwcDBOdXdIT0lKMWtObkx0QTgvdldUallaczhWMUU4?=
 =?utf-8?B?dlBEMEI1UTR2OWxCVU9qbEtYSmpXQXovMmFUT0tOVHp6a0dzZWFyeXQvSCt0?=
 =?utf-8?B?UjZPWWRIVmZxWndZclI1WmxieTQ2UU1rSy9iWlJQUE93U3htSUdiRWZXRWR2?=
 =?utf-8?B?VnFPYW15alM0bVZEWkFUTWg2L2E2TDZ3Y1RsUzAvWHk0dkdSeDg4NjhRU0x4?=
 =?utf-8?B?REszektybEl6VTBIQ3BCSzB0TzlxbGdFaGo0TGFUYW9TenpwRDZQNlZyMHND?=
 =?utf-8?B?Vm5oRkxwNHB4OVFudzVIN09SS3N3OEIyNXhiUXphZzNnZVZ0SEJQNi9oNWhK?=
 =?utf-8?B?dXZPa1hxcThHQXhhZEN5ZXRpcE5uRHEwTytaeXdETnQvZktLQnZDYm1NVkR0?=
 =?utf-8?B?bnlzZGNhRVBkZXNoL3hzZWVwQ05MaXY0d0RCcG9VSDZ6R0hsSXVZNTdjN29y?=
 =?utf-8?B?cUJXdFc3akFBS1VYQ0VmalhybGdoVW0rWDBkajcrWjFEU3ZTUDFlU1pTdzFH?=
 =?utf-8?B?bnlnanhlak1POW9tbTRxcFJWN241TDZFUDlvbnBoeHNaSm94SmxmalVZL3JP?=
 =?utf-8?B?QnErL1U3bmk5TERkWDRpSXRETnhEMTJBczhpSjFDRTdBWUhNd25ZSk1PQVdv?=
 =?utf-8?B?YUhqalpicHA3cXlISHBBR045S1BybjJtWFVDMitDZy9NbWJhbGVGYUxVWXlt?=
 =?utf-8?B?cFpYUG5tVXFhMVI2OURwMlN2WEF2QVZrOXpxeG9QMTduek5PdWhzZ2FLSTIr?=
 =?utf-8?B?TmJxREJ6OU5FOVNBQVYyTVYxNzBVS3JFK0t0OVl4SXZYK1QxRTREZXluU1dl?=
 =?utf-8?B?NlhoeVY4OEd5MStTdGNNS3kxY241T3pSZ0E3cXNYWWhEOFBiTTVQQXhocU96?=
 =?utf-8?B?ZEV3V2hpck9LSmw4NXg2SzluMTJYWGdTYXo3TXBLREU1ZkhPWlgyamdHbTVm?=
 =?utf-8?B?czhJclJCMjZjcEhzSmxZYnhmcWp0a2V6VjY4K2VKMk04a2xFWUZrNUJDZXVm?=
 =?utf-8?B?UWpmV2UrU0J1NkJaZjVjUmhEQkNsVjIyUm9Uanc5dndqTURrQ0YrWVZueG1r?=
 =?utf-8?B?aWdOdHZ0UFU2bzBQajhvK2VqWk5NSjBSeXc1QkREWFpWV0l4RlIwQ0U1c2ZZ?=
 =?utf-8?B?ZW9SYnl3QitBdWNYYllpdVVqd2hoVWRwL3VYZU9EYlByZGJWUTh2ZGRkZjlG?=
 =?utf-8?B?dm5lcUR1cUpWSldKaUM0NGFnMmJWQTNON0d0N3J6S2hmdVVrYkZKc29jcFZZ?=
 =?utf-8?B?Z3d3RkMyMzNoeGFOdTVvdE5jelJza1ltL1lQajVJTVIrK1Rra0FKWEk2eHcw?=
 =?utf-8?B?KytnU2QxNE13eGFmVDlLVllWVHk1c2hhcFQ4UmtyNjRyV2d4MEEySGVZa0xh?=
 =?utf-8?B?RDJTSDZEbTBUamhoa2ppNTdwK083Sm9ONzBGRkFMcUxlU1BQMWFrVWZtcWVt?=
 =?utf-8?B?Z29SenZQNnIzdFpueDAyVXMrV0t1TVNIeHdvaHNUR1BaUEhxMWgwbWsxQXgw?=
 =?utf-8?B?UUloczZJNXIySlNjWXhOOFJZRWdycm52NGRnZHZVZjRzT2VmOU5qYjA1OUg4?=
 =?utf-8?B?Vm9YQ1E5T3g2Wms4YmY3VjhBaTFhL2Uvd00vNTdDN1YwVFNwQXRkSEFMZXdU?=
 =?utf-8?B?VEY1UWRyVUtqY1Nhbm1hUFJEN2UvcDdMcEYrQU5IR1hmSUlFZTRyN0pUcEd4?=
 =?utf-8?B?aTMxWmdmVG95Y1FnODYvUWtQelNPSjR4bEFiaG1rNlhPWnl2YWNFSTYySEpZ?=
 =?utf-8?B?YjE1dFNXWEY5Vis2TklHSUZPZHlPdEpDUU5sRC9UWW01T3V5NmF3MEVZK0Nv?=
 =?utf-8?B?bkE9PQ==?=
X-OriginatorOrg: mbosol.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd0c6fb-8dd0-476f-9440-08dba4826ad5
X-MS-Exchange-CrossTenant-AuthSource: VE1P192MB0544.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 09:13:44.9567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 571b6760-44e0-4aae-b783-84984ac780c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/YhCjh8zWnK7/BYnIgF1zv9TSYEnhnjr47BuwzMVSuQbEV4aSynLPKC4SlISdG4gncXDC7t89JzMzubKTh0c0ZxeKSl7WqvvC+Z18KwdTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1549
X-Mailman-Approved-At: Thu, 24 Aug 2023 22:08:43 +1000
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/24/23 11:04, David Stevens wrote:
> From: David Stevens <stevensd@chromium.org>
>
> Stop passing FOLL_GET to __kvm_follow_pfn. This allows the host to map
> memory into the guest that is backed by un-refcounted struct pages - for
> example, the tail pages of higher order non-compound pages allocated by
> the amdgpu driver via ttm_pool_alloc_page.
>
> The bulk of this change is tracking the is_refcounted_page flag so that
> non-refcounted pages don't trigger page_count() == 0 warnings. This is
> done by storing the flag in an unused bit in the sptes. This only bit is
> not available in PAE SPTEs, so FOLL_GET is only omitted for TDP on
> x86-64.
>
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>   arch/x86/kvm/mmu/mmu.c          | 55 +++++++++++++++++++++++----------
>   arch/x86/kvm/mmu/mmu_internal.h |  1 +
>   arch/x86/kvm/mmu/paging_tmpl.h  |  8 +++--
>   arch/x86/kvm/mmu/spte.c         |  4 ++-
>   arch/x86/kvm/mmu/spte.h         | 12 ++++++-
>   arch/x86/kvm/mmu/tdp_mmu.c      | 22 +++++++------
>   include/linux/kvm_host.h        |  3 ++
>   virt/kvm/kvm_main.c             |  6 ++--
>   8 files changed, 79 insertions(+), 32 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index dabae67f198b..4f5d33e95c6e 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -553,12 +553,14 @@ static bool mmu_spte_update(u64 *sptep, u64 new_spte)
>   
>   	if (is_accessed_spte(old_spte) && !is_accessed_spte(new_spte)) {
>   		flush = true;
> -		kvm_set_pfn_accessed(spte_to_pfn(old_spte));
> +		if (is_refcounted_page_pte(old_spte))
> +			kvm_set_page_accessed(pfn_to_page(spte_to_pfn(old_spte)));
>   	}
>   
>   	if (is_dirty_spte(old_spte) && !is_dirty_spte(new_spte)) {
>   		flush = true;
> -		kvm_set_pfn_dirty(spte_to_pfn(old_spte));
> +		if (is_refcounted_page_pte(old_spte))
> +			kvm_set_page_dirty(pfn_to_page(spte_to_pfn(old_spte)));
>   	}
>   
>   	return flush;
> @@ -596,14 +598,18 @@ static u64 mmu_spte_clear_track_bits(struct kvm *kvm, u64 *sptep)
>   	 * before they are reclaimed.  Sanity check that, if the pfn is backed
>   	 * by a refcounted page, the refcount is elevated.
>   	 */
> -	page = kvm_pfn_to_refcounted_page(pfn);
> -	WARN_ON(page && !page_count(page));
> +	if (is_refcounted_page_pte(old_spte)) {
> +		page = kvm_pfn_to_refcounted_page(pfn);
> +		WARN_ON(!page || !page_count(page));
> +	}
>   
> -	if (is_accessed_spte(old_spte))
> -		kvm_set_pfn_accessed(pfn);
> +	if (is_refcounted_page_pte(old_spte)) {
> +		if (is_accessed_spte(old_spte))
> +			kvm_set_page_accessed(pfn_to_page(pfn));
>   
> -	if (is_dirty_spte(old_spte))
> -		kvm_set_pfn_dirty(pfn);
> +		if (is_dirty_spte(old_spte))
> +			kvm_set_page_dirty(pfn_to_page(pfn));
> +	}
>   
>   	return old_spte;
>   }
> @@ -639,8 +645,8 @@ static bool mmu_spte_age(u64 *sptep)
>   		 * Capture the dirty status of the page, so that it doesn't get
>   		 * lost when the SPTE is marked for access tracking.
>   		 */
> -		if (is_writable_pte(spte))
> -			kvm_set_pfn_dirty(spte_to_pfn(spte));
> +		if (is_writable_pte(spte) && is_refcounted_page_pte(spte))
> +			kvm_set_page_dirty(pfn_to_page(spte_to_pfn(spte)));
>   
>   		spte = mark_spte_for_access_track(spte);
>   		mmu_spte_update_no_track(sptep, spte);
> @@ -1278,8 +1284,8 @@ static bool spte_wrprot_for_clear_dirty(u64 *sptep)
>   {
>   	bool was_writable = test_and_clear_bit(PT_WRITABLE_SHIFT,
>   					       (unsigned long *)sptep);
> -	if (was_writable && !spte_ad_enabled(*sptep))
> -		kvm_set_pfn_dirty(spte_to_pfn(*sptep));
> +	if (was_writable && !spte_ad_enabled(*sptep) && is_refcounted_page_pte(*sptep))
> +		kvm_set_page_dirty(pfn_to_page(spte_to_pfn(*sptep)));
>   
>   	return was_writable;
>   }
> @@ -2937,6 +2943,11 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
>   	bool host_writable = !fault || fault->map_writable;
>   	bool prefetch = !fault || fault->prefetch;
>   	bool write_fault = fault && fault->write;
> +	/*
> +	 * Prefetching uses gfn_to_page_many_atomic, which never gets
> +	 * non-refcounted pages.
> +	 */
> +	bool is_refcounted = !fault || fault->is_refcounted_page;
>   
>   	pgprintk("%s: spte %llx write_fault %d gfn %llx\n", __func__,
>   		 *sptep, write_fault, gfn);
> @@ -2969,7 +2980,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
>   	}
>   
>   	wrprot = make_spte(vcpu, sp, slot, pte_access, gfn, pfn, *sptep, prefetch,
> -			   true, host_writable, &spte);
> +			   true, host_writable, is_refcounted, &spte);
>   
>   	if (*sptep == spte) {
>   		ret = RET_PF_SPURIOUS;
> @@ -4296,11 +4307,19 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
>   static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>   {
>   	struct kvm_memory_slot *slot = fault->slot;
> +	/*
> +	 * We only allow non-refcounted pages if we can track whether or not
> +	 * pages are refcounted via an SPTE bit. This bit is not available
> +	 * in PAE SPTEs, so pass FOLL_GET if we may have to deal with those.
> +	 */
> +	unsigned int get_flag = (tdp_enabled && IS_ENABLED(CONFIG_X86_64)) ?
> +		0 : FOLL_GET;
>   	struct kvm_follow_pfn foll = {
>   		.slot = slot,
>   		.gfn = fault->gfn,
> -		.flags = FOLL_GET | (fault->write ? FOLL_WRITE : 0),
> +		.flags = (fault->write ? FOLL_WRITE : 0) | get_flag,
>   		.try_map_writable = true,
> +		.guarded_by_mmu_notifier = true,
>   	};
>   
>   	/*
> @@ -4317,6 +4336,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>   			fault->slot = NULL;
>   			fault->pfn = KVM_PFN_NOSLOT;
>   			fault->map_writable = false;
> +			fault->is_refcounted_page = false;
>   			return RET_PF_CONTINUE;
>   		}
>   		/*
> @@ -4372,6 +4392,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>   success:
>   	fault->hva = foll.hva;
>   	fault->map_writable = foll.writable;
> +	fault->is_refcounted_page = foll.is_refcounted_page;
>   	return RET_PF_CONTINUE;
>   }
>   
> @@ -4456,8 +4477,9 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>   	r = direct_map(vcpu, fault);
>   
>   out_unlock:
> +	if (fault->is_refcounted_page)
> +		kvm_set_page_accessed(pfn_to_page(fault->pfn));
>   	write_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(fault->pfn);

Should we check FOLL_GET is actually omitted to skip the kvm_release_pfn_clean() ?


>   	return r;
>   }
>   
> @@ -4534,8 +4556,9 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
>   	r = kvm_tdp_mmu_map(vcpu, fault);
>   
>   out_unlock:
> +	if (fault->is_refcounted_page)
> +		kvm_set_page_accessed(pfn_to_page(fault->pfn));
>   	read_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(fault->pfn);
>   	return r;
>   }
>   #endif
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index d39af5639ce9..55790085884f 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -240,6 +240,7 @@ struct kvm_page_fault {
>   	kvm_pfn_t pfn;
>   	hva_t hva;
>   	bool map_writable;
> +	bool is_refcounted_page;
>   
>   	/*
>   	 * Indicates the guest is trying to write a gfn that contains one or
> diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
> index 0662e0278e70..4ffcebc0c3ce 100644
> --- a/arch/x86/kvm/mmu/paging_tmpl.h
> +++ b/arch/x86/kvm/mmu/paging_tmpl.h
> @@ -828,8 +828,9 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>   	r = FNAME(fetch)(vcpu, fault, &walker);
>   
>   out_unlock:
> +	if (fault->is_refcounted_page)
> +		kvm_set_page_accessed(pfn_to_page(fault->pfn));
>   	write_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(fault->pfn);
>   	return r;
>   }
>   
> @@ -883,7 +884,7 @@ static gpa_t FNAME(gva_to_gpa)(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
>    */
>   static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
>   {
> -	bool host_writable;
> +	bool host_writable, is_refcounted;
>   	gpa_t first_pte_gpa;
>   	u64 *sptep, spte;
>   	struct kvm_memory_slot *slot;
> @@ -940,10 +941,11 @@ static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int
>   	sptep = &sp->spt[i];
>   	spte = *sptep;
>   	host_writable = spte & shadow_host_writable_mask;
> +	is_refcounted = spte & SPTE_MMU_PAGE_REFCOUNTED;
>   	slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
>   	make_spte(vcpu, sp, slot, pte_access, gfn,
>   		  spte_to_pfn(spte), spte, true, false,
> -		  host_writable, &spte);
> +		  host_writable, is_refcounted, &spte);
>   
>   	return mmu_spte_update(sptep, spte);
>   }
> diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
> index cf2c6426a6fc..5b13d9143d56 100644
> --- a/arch/x86/kvm/mmu/spte.c
> +++ b/arch/x86/kvm/mmu/spte.c
> @@ -138,7 +138,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
>   	       const struct kvm_memory_slot *slot,
>   	       unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
>   	       u64 old_spte, bool prefetch, bool can_unsync,
> -	       bool host_writable, u64 *new_spte)
> +	       bool host_writable, bool is_refcounted, u64 *new_spte)
>   {
>   	int level = sp->role.level;
>   	u64 spte = SPTE_MMU_PRESENT_MASK;
> @@ -188,6 +188,8 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
>   
>   	if (level > PG_LEVEL_4K)
>   		spte |= PT_PAGE_SIZE_MASK;
> +	if (is_refcounted)
> +		spte |= SPTE_MMU_PAGE_REFCOUNTED;
>   
>   	if (shadow_memtype_mask)
>   		spte |= static_call(kvm_x86_get_mt_mask)(vcpu, gfn,
> diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
> index 1279db2eab44..be93dd061ae3 100644
> --- a/arch/x86/kvm/mmu/spte.h
> +++ b/arch/x86/kvm/mmu/spte.h
> @@ -95,6 +95,11 @@ static_assert(!(EPT_SPTE_MMU_WRITABLE & SHADOW_ACC_TRACK_SAVED_MASK));
>   /* Defined only to keep the above static asserts readable. */
>   #undef SHADOW_ACC_TRACK_SAVED_MASK
>   
> +/*
> + * Indicates that the SPTE refers to a page with a valid refcount.
> + */
> +#define SPTE_MMU_PAGE_REFCOUNTED        BIT_ULL(59)
> +
>   /*
>    * Due to limited space in PTEs, the MMIO generation is a 19 bit subset of
>    * the memslots generation and is derived as follows:
> @@ -332,6 +337,11 @@ static inline bool is_dirty_spte(u64 spte)
>   	return dirty_mask ? spte & dirty_mask : spte & PT_WRITABLE_MASK;
>   }
>   
> +static inline bool is_refcounted_page_pte(u64 spte)
> +{
> +	return spte & SPTE_MMU_PAGE_REFCOUNTED;
> +}
> +
>   static inline u64 get_rsvd_bits(struct rsvd_bits_validate *rsvd_check, u64 pte,
>   				int level)
>   {
> @@ -462,7 +472,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
>   	       const struct kvm_memory_slot *slot,
>   	       unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
>   	       u64 old_spte, bool prefetch, bool can_unsync,
> -	       bool host_writable, u64 *new_spte);
> +	       bool host_writable, bool is_refcounted, u64 *new_spte);
>   u64 make_huge_page_split_spte(struct kvm *kvm, u64 huge_spte,
>   		      	      union kvm_mmu_page_role role, int index);
>   u64 make_nonleaf_spte(u64 *child_pt, bool ad_disabled);
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 512163d52194..a9b1b14d2e26 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -474,6 +474,7 @@ static void handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
>   	bool was_leaf = was_present && is_last_spte(old_spte, level);
>   	bool is_leaf = is_present && is_last_spte(new_spte, level);
>   	bool pfn_changed = spte_to_pfn(old_spte) != spte_to_pfn(new_spte);
> +	bool is_refcounted = is_refcounted_page_pte(old_spte);
>   
>   	WARN_ON(level > PT64_ROOT_MAX_LEVEL);
>   	WARN_ON(level < PG_LEVEL_4K);
> @@ -538,9 +539,9 @@ static void handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
>   	if (is_leaf != was_leaf)
>   		kvm_update_page_stats(kvm, level, is_leaf ? 1 : -1);
>   
> -	if (was_leaf && is_dirty_spte(old_spte) &&
> +	if (was_leaf && is_dirty_spte(old_spte) && is_refcounted &&
>   	    (!is_present || !is_dirty_spte(new_spte) || pfn_changed))
> -		kvm_set_pfn_dirty(spte_to_pfn(old_spte));
> +		kvm_set_page_dirty(pfn_to_page(spte_to_pfn(old_spte)));
>   
>   	/*
>   	 * Recursively handle child PTs if the change removed a subtree from
> @@ -552,9 +553,9 @@ static void handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
>   	    (is_leaf || !is_present || WARN_ON_ONCE(pfn_changed)))
>   		handle_removed_pt(kvm, spte_to_child_pt(old_spte, level), shared);
>   
> -	if (was_leaf && is_accessed_spte(old_spte) &&
> +	if (was_leaf && is_accessed_spte(old_spte) && is_refcounted &&
>   	    (!is_present || !is_accessed_spte(new_spte) || pfn_changed))
> -		kvm_set_pfn_accessed(spte_to_pfn(old_spte));
> +		kvm_set_page_accessed(pfn_to_page(spte_to_pfn(old_spte)));
>   }
>   
>   /*
> @@ -988,8 +989,9 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
>   		new_spte = make_mmio_spte(vcpu, iter->gfn, ACC_ALL);
>   	else
>   		wrprot = make_spte(vcpu, sp, fault->slot, ACC_ALL, iter->gfn,
> -					 fault->pfn, iter->old_spte, fault->prefetch, true,
> -					 fault->map_writable, &new_spte);
> +				   fault->pfn, iter->old_spte, fault->prefetch, true,
> +				   fault->map_writable, fault->is_refcounted_page,
> +				   &new_spte);
>   
>   	if (new_spte == iter->old_spte)
>   		ret = RET_PF_SPURIOUS;
> @@ -1205,8 +1207,9 @@ static bool age_gfn_range(struct kvm *kvm, struct tdp_iter *iter,
>   		 * Capture the dirty status of the page, so that it doesn't get
>   		 * lost when the SPTE is marked for access tracking.
>   		 */
> -		if (is_writable_pte(iter->old_spte))
> -			kvm_set_pfn_dirty(spte_to_pfn(iter->old_spte));
> +		if (is_writable_pte(iter->old_spte) &&
> +		    is_refcounted_page_pte(iter->old_spte))
> +			kvm_set_page_dirty(pfn_to_page(spte_to_pfn(iter->old_spte)));
>   
>   		new_spte = mark_spte_for_access_track(iter->old_spte);
>   		iter->old_spte = kvm_tdp_mmu_write_spte(iter->sptep,
> @@ -1626,7 +1629,8 @@ static void clear_dirty_pt_masked(struct kvm *kvm, struct kvm_mmu_page *root,
>   		trace_kvm_tdp_mmu_spte_changed(iter.as_id, iter.gfn, iter.level,
>   					       iter.old_spte,
>   					       iter.old_spte & ~dbit);
> -		kvm_set_pfn_dirty(spte_to_pfn(iter.old_spte));
> +		if (is_refcounted_page_pte(iter.old_spte))
> +			kvm_set_page_dirty(pfn_to_page(spte_to_pfn(iter.old_spte)));
>   	}
>   
>   	rcu_read_unlock();
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 713fc2d91f95..292701339198 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1157,6 +1157,9 @@ unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
>   void kvm_release_page_clean(struct page *page);
>   void kvm_release_page_dirty(struct page *page);
>   
> +void kvm_set_page_accessed(struct page *page);
> +void kvm_set_page_dirty(struct page *page);
> +
>   struct kvm_follow_pfn {
>   	const struct kvm_memory_slot *slot;
>   	gfn_t gfn;
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 963b96cd8ff9..fa1848c6c84f 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2949,17 +2949,19 @@ static bool kvm_is_ad_tracked_page(struct page *page)
>   	return !PageReserved(page);
>   }
>   
> -static void kvm_set_page_dirty(struct page *page)
> +void kvm_set_page_dirty(struct page *page)
>   {
>   	if (kvm_is_ad_tracked_page(page))
>   		SetPageDirty(page);
>   }
> +EXPORT_SYMBOL_GPL(kvm_set_page_dirty);
>   
> -static void kvm_set_page_accessed(struct page *page)
> +void kvm_set_page_accessed(struct page *page)
>   {
>   	if (kvm_is_ad_tracked_page(page))
>   		mark_page_accessed(page);
>   }
> +EXPORT_SYMBOL_GPL(kvm_set_page_accessed);
>   
>   void kvm_release_page_clean(struct page *page)
>   {
