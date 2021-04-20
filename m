Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55D6365A8A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 15:48:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPlQc4cVJz30Q9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 23:48:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cktiRPAQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=2a01:111:f400:7e8b::62d;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thomas.lendacky@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cktiRPAQ; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPlQ66yD9z2yhr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 23:48:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiU7xQ48iPH4BN/InlibcOmD6sOwP6+RORmB3SZY3qyWE+CLIS4I6fDcF1xiVKL4ZvEo3vGftRUTpzYKg4BIYMcsgOja5qbWbNH3AE4dP7+a0y5LJ0JoNPEdIAPCVYgAfMRmKeWdR9dnCwdtxSiv708DMW7Im7/zHJkd5Ia2VJHmSJsxh3LstLHt7ovh9kQweEuCcHIFyimSyCFCoQIfUUmHDI6GDMR9VBkqof7GBnlXSHOoD3N8uDkEKHX1yDXvioz+cvEGQ8OGks8bPRyHEtfV+vfRqPSkoDq/w1am4Oa0DF+yXa7Twi1s/iLDp30Wh7KEjy4isuj6GuswDgiEmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/ityehZ+qPGvFhfr2biLxqkIblL00wBmVeuWa6dcg0=;
 b=Mh62sOYnnG2Yed08Du+QpGEO/mFFuYmUBVaY0IzUCQNxaSoy4ZwijIqlYnVALl4WqZERH3XN9RKL8Gwfbl2gL2smycsDvPwzAliJMUBxuwiIW3k22+WzHVbudfVD6IwR3EwBivARmasYrzyhZG12of0nPGoQV8deKwZbkgDr4V72eop/KUIJX6DwJKGQY8PoghDoxeJXddaPdMrwCKE0Ku/ofmmlTelwQZPtjSjDKL7unsULe2mfEvMbice+Dmsxk9GH5OSVHSBti0MBSxp5nEpekAeAGIolG6ZqMq6oYd3SF86HinsxdPMzNHaqvM/2cjWESdNiLzrh/6bobPJgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/ityehZ+qPGvFhfr2biLxqkIblL00wBmVeuWa6dcg0=;
 b=cktiRPAQLbs6TBMNzr7h1wWbcvLkRVSVMwzPtWBq/2ueM0oCt38YiPkPJEAk3jr0PP+T7IcG1DCGwi1yv+Osv/IkwuCPqF2qyINYtsf6+LJUquqE88xhD1KWUbig4rHXrjcctESZsSk/oZzB5qk8eXLaS/NZ6HMNm1gQ5RLSwZg=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB2827.namprd12.prod.outlook.com (2603:10b6:5:7f::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.24; Tue, 20 Apr 2021 13:48:18 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4042.024; Tue, 20 Apr
 2021 13:48:18 +0000
Subject: Re: swiotlb cleanups v3
To: Christoph Hellwig <hch@lst.de>
References: <20210318161424.489045-1-hch@lst.de>
 <0349082c-59c5-20d7-f324-279981c3f6ea@amd.com>
 <20210420092312.GB26092@lst.de>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <f46d6f1a-03e1-7aad-e70d-882841661a99@amd.com>
Date: Tue, 20 Apr 2021 08:48:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210420092312.GB26092@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN4PR0201CA0013.namprd02.prod.outlook.com
 (2603:10b6:803:2b::23) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN4PR0201CA0013.namprd02.prod.outlook.com (2603:10b6:803:2b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Tue, 20 Apr 2021 13:48:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7314af2b-b171-43ae-56ea-08d90402f456
X-MS-TrafficTypeDiagnostic: DM6PR12MB2827:
X-Microsoft-Antispam-PRVS: <DM6PR12MB282721A785E3B4DF9B890662EC489@DM6PR12MB2827.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNGn7ZrrnylKJcaUIJhJVobYA3Acwd90JBB/dEe2xn2KWmFonYXBXCZBZRcfvDTjAE+kLhioAdMe7uN6QdKC8Fxheb+8VXyb+/keHjWDH802kAwZElO5IyqQDW+dDNpmLTh0yWEk8otmq0gb79x49AxUvSqj1mg7lj4AB6yW3P/854r7iDYLYY71Tlf7bLYNJbJ2zYJ2Tw+ewCciCaLUhBxSJL65Wp9jAn0LAK7W7N4PLZngFfqGA7kNXJG5jG83NewOT0JvcpOnTCVrHZSRLF7KnRFY1BcGrVRI1VKbfwb/B2x17e3h6ag2N4R8bh4aSSdUXZcfNjDBpGCNVwV7CR4zPslQCQdwFlioz31kPKBvNlpx8ABx3WKUPp5pLjXgK0thNyyfj+cLNshNCe31JPpWSCpvBEcLiAbV04UUxOur2f+Rd6Ea8jWe+OzXiRhqvOaXEbRCvUZrVQdabzyiNuIhiAKz2zg/ikmt0oA0kCWCzv7totM80VQzLrNbdIa0aA31m15nIgwjwnv8IqIJR3GsAtBA1DkXVSDoBHjWgTgpjqH7Kg+UABg1WsLj487XNVusun/WqefNY7ZhJ4uWkG2uSGCDcXbDuuRu70dtXVqPeOOmPpA55oEhO5YjpcZ6CJ9Dnfdl6IMZxxyKOthwkRAwFMBkG4NSNiA7nsb+GcR+cvfB3y4w4HIzw0a5lcht
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(186003)(31696002)(16526019)(8936002)(26005)(6512007)(38100700002)(6916009)(5660300002)(7116003)(36756003)(478600001)(8676002)(86362001)(6486002)(66556008)(66476007)(4326008)(2616005)(316002)(2906002)(956004)(83380400001)(53546011)(31686004)(66946007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aGQ5SzBoUVBxVmp4Wlh4bXlldWZtcWxKZnRkYlN2aTFBMTI0VjZLdUo1ZHhS?=
 =?utf-8?B?L2RyUzJMZHcweldkZDVya1JDcGY5TjU3QVBnclZtazRYS0lGWEM5TzkzakRY?=
 =?utf-8?B?K1hteWhkS01Mc1g5NCtZTjhKdVZ0clFLRUZ0QnNJNng3QmVyUGRlWlFtYlFv?=
 =?utf-8?B?TitBYzhMUU9yeHZscEdMeUJaV1VUSlZPY1Fta2NPUERJdkR4eWZIaE1oczFK?=
 =?utf-8?B?QytMOXZzejNFTHBkOUxDVkw3VjlIbHVGTE1tYXIzZkhocEZOOWxCR0RULyt0?=
 =?utf-8?B?Rk5yM1IrbW5JWDVSS0tRYmV5MDZnVUROWFVkbnBXOEZCMzFoczU3bjg3SVFN?=
 =?utf-8?B?d2p5U2hINnl0cndYd1NRVURwUGNacWlGbW8zeTc1OEgzTDUzNGV0YXZybjhw?=
 =?utf-8?B?RE9DWGErVmhTUUZBYlA2aDgzQm1kclZyR3ExczQ1ZmI2cDMxc3cwWkJQLzNQ?=
 =?utf-8?B?WDhuK3FSMXpIZzZpY28zZHFiTTBHWFNCM0Evc0tYYXVWWktycVphSWhGeWFu?=
 =?utf-8?B?SEhKSjNCQ0Q4MS82Q28yOHFlaVJwUi95bnFNYi82a2ZsbnYvNmg5eGQxdU15?=
 =?utf-8?B?QmFkZFgrUUNlek9tbkJUaG4rZUpqZlp2cE1KeDUyYXZiRjN0NXI5ODN0YzAy?=
 =?utf-8?B?ZXc2UVI3MkU1ZS9Kc2IrVkRaMXJjUUR5YnJwRnhVcVlJQjRJbWhFMUNXZlcr?=
 =?utf-8?B?L0c3d25kbXcwNTBGbzliWld2T2JDVERFKzU5SzFEb1IxbnQ1Z2ZiVms5KzRP?=
 =?utf-8?B?d1lITHM3djd1dElSNWVWYzhCK1c3aTgwSEsyVFYwMndwRTBEcVNGZFBTSjdj?=
 =?utf-8?B?Mm5uM25kQnFJeUFiN0VRQlYyQXZQL25xRFdJU2lJSGhYVDZtT1A3ZUhCSVZK?=
 =?utf-8?B?QWxENW1rSEVBL1J1aTJpRjVHNVpSS2pwdis3L2FhS3BrVmI2cEtxYnlqUHo0?=
 =?utf-8?B?Y2lUc3VWcnBUM1lRclJnL2ttajJ1S0hXTmVidUZNN3dkVHF3YmhSbk9mdjdN?=
 =?utf-8?B?emorSUJ0cFdoRFJqSnlKSnhkVVBxTjk1Uzl1WHUvbFlENm91QVo5b01SQnIw?=
 =?utf-8?B?WmMzRUN5RksyazZybFZjdVJBRE5jelUxWEozekIyWmYzS1c1VmpwR2RPQVZF?=
 =?utf-8?B?OXdOQ0kvU2lYVmY3ZzNoOGFUZUM5NVlLYmZDYXlPeFA2SVVoYjh4YlpXeU81?=
 =?utf-8?B?QjM2cXcxY0ZZN1htcEFYblhhWTN4OGk5UXlHU2JwcDIxTmdaZWNuTkg2ZG1U?=
 =?utf-8?B?cTRVRUNhZk94Lys2YnNmQTdsRzhqczJJTTgwSlY2ZGZuMDRtaTN0VC9ndHlx?=
 =?utf-8?B?YmdEczQvZUJoS1lwVmxDckh4NVVXbWtNcERYMVJabU5GaXVhTmtrOVpoZ1JO?=
 =?utf-8?B?ZXdqRzd2U2JoY0ljcm5YL1Z1WnZsQjNSOXV3OWZDT1hwU2hsZldqdEN1T0No?=
 =?utf-8?B?bTZTSjJyd3Z1elVSejdiN3Nja29qVHdIQWp2OGlsUVhPdVZaOFVYTmk4aTd3?=
 =?utf-8?B?MlVSZ1lZRGtDZ2FYSEduTW1taXllbktna3VVTTFHRDh4QzdKN1R3UTgrQ2NG?=
 =?utf-8?B?LzhDM25vU0ZZK213RGw0bjYxNjc2V3VHdW1jSC9sTzNWbXhpaTR3aDJGOFZO?=
 =?utf-8?B?cHpZM3MrdWluRWM4aXh2dlRINUcyNWlHeldzNUVkQkdpOWtQdG5PS3FhcGsr?=
 =?utf-8?B?U0xobW84T0FPSDVIVU0rT3hZY1lsR3RlS3pmbHpKU2JSNWZ4SytDSUI1eEJP?=
 =?utf-8?Q?y+AR+IuGbUym46Lno7wjZiayRvgXR3MfJSqX6qr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7314af2b-b171-43ae-56ea-08d90402f456
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 13:48:18.6490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQzg7wH4y+ILSh9XGHB5o9rxwO496bZ64WUcmCp5K2OnUkVb7tuIiX/oirbyJz254WNDaDGNVVRxKadAN2ogxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2827
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
Cc: xen-devel@lists.xenproject.org, konrad.wilk@oracle.com,
 dongli.zhang@oracle.com, iommu@lists.linux-foundation.org,
 tientzu@chromium.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/20/21 4:23 AM, Christoph Hellwig wrote:
> On Sat, Apr 17, 2021 at 11:39:22AM -0500, Tom Lendacky wrote:
>> Somewhere between the 1st and 2nd patch, specifying a specific swiotlb
>> for an SEV guest is no longer honored. For example, if I start an SEV
>> guest with 16GB of memory and specify swiotlb=131072 I used to get a
>> 256MB SWIOTLB. However, after the 2nd patch, the swiotlb=131072 is no
>> longer honored and I get a 982MB SWIOTLB (as set via sev_setup_arch() in
>> arch/x86/mm/mem_encrypt.c).
>>
>> I can't be sure which patch caused the issue since an SEV guest fails to
>> boot with the 1st patch but can boot with the 2nd patch, at which point
>> the SWIOTLB comes in at 982MB (I haven't had a chance to debug it and so
>> I'm hoping you might be able to quickly spot what's going on).
> 
> Can you try this patch?

Thanks, Christoph. This works for honoring the command line value with SEV
guests.

There was still a reference to default_nslabs in setup_io_tlb_npages()
that I'm not sure how you want to handle. I just commented it out for now
to let the code compile to test the intent of the patch.

Thanks,
Tom

> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 0a5b6f7e75bce6..ac81ef97df32f5 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -71,15 +71,17 @@ struct io_tlb_mem *io_tlb_default_mem;
>   */
>  static unsigned int max_segment;
>  
> -static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
> +static unsigned long swiotlb_cmdline_size;
>  
>  static int __init
>  setup_io_tlb_npages(char *str)
>  {
>  	if (isdigit(*str)) {
>  		/* avoid tail segment of size < IO_TLB_SEGSIZE */
> -		default_nslabs =
> -			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
> +		unsigned long nslabs = simple_strtoul(str, &str, 0);
> +
> +		swiotlb_cmdline_size =
> +			ALIGN(nslabs, IO_TLB_SEGSIZE) << IO_TLB_SHIFT;
>  	}
>  	if (*str == ',')
>  		++str;
> @@ -108,7 +110,9 @@ void swiotlb_set_max_segment(unsigned int val)
>  
>  unsigned long swiotlb_size_or_default(void)
>  {
> -	return default_nslabs << IO_TLB_SHIFT;
> +	if (swiotlb_cmdline_size)
> +		return swiotlb_cmdline_size;
> +	return IO_TLB_DEFAULT_SIZE;
>  }
>  
>  void __init swiotlb_adjust_size(unsigned long size)
> @@ -118,9 +122,10 @@ void __init swiotlb_adjust_size(unsigned long size)
>  	 * architectures such as those supporting memory encryption to
>  	 * adjust/expand SWIOTLB size for their use.
>  	 */
> -	size = ALIGN(size, IO_TLB_SIZE);
> -	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
> -	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
> +	if (!swiotlb_cmdline_size)
> +		swiotlb_cmdline_size = ALIGN(size, IO_TLB_SIZE);
> +	pr_info("SWIOTLB bounce buffer size adjusted to %luMB",
> +		swiotlb_cmdline_size >> 20);
>  }
>  
>  void swiotlb_print_info(void)
> @@ -209,7 +214,7 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>  void  __init
>  swiotlb_init(int verbose)
>  {
> -	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
> +	size_t bytes = PAGE_ALIGN(swiotlb_size_or_default());
>  	void *tlb;
>  
>  	if (swiotlb_force == SWIOTLB_NO_FORCE)
> @@ -219,7 +224,7 @@ swiotlb_init(int verbose)
>  	tlb = memblock_alloc_low(bytes, PAGE_SIZE);
>  	if (!tlb)
>  		goto fail;
> -	if (swiotlb_init_with_tbl(tlb, default_nslabs, verbose))
> +	if (swiotlb_init_with_tbl(tlb, bytes >> IO_TLB_SHIFT, verbose))
>  		goto fail_free_mem;
>  	return;
>  
> 
