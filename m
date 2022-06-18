Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48705550283
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 05:33:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ1j31pbsz3chg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 13:33:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.43; helo=out30-43.freemail.mail.aliyun.com; envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 305 seconds by postgrey-1.36 at boromir; Sat, 18 Jun 2022 13:33:09 AEST
Received: from out30-43.freemail.mail.aliyun.com (out30-43.freemail.mail.aliyun.com [115.124.30.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQ1hP3Mnxz3cCP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 13:33:08 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0VGi1ydh_1655522870;
Received: from 30.13.184.185(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VGi1ydh_1655522870)
          by smtp.aliyun-inc.com;
          Sat, 18 Jun 2022 11:27:51 +0800
Message-ID: <e8cb00ab-f617-de14-9e5c-883f56da0b5f@linux.alibaba.com>
Date: Sat, 18 Jun 2022 11:27:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/4] hugetlb: skip to end of PT page mapping when pte not
 present
To: Mike Kravetz <mike.kravetz@oracle.com>, Peter Xu <peterx@redhat.com>
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
 <20220616210518.125287-2-mike.kravetz@oracle.com>
 <YqyMhmAjrQ4C+EyA@xz-m1.local> <Yqy3LZUOdH5GsZ9j@monkey>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <Yqy3LZUOdH5GsZ9j@monkey>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com, Muchun Song <songmuchun@bytedance.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, James Houghton <jthoughton@google.com>, sparclinux@vger.kernel.org, will@kernel.org, Mina Almasry <almasrymina@google.com>, linux-s390@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/18/2022 1:17 AM, Mike Kravetz wrote:
> On 06/17/22 10:15, Peter Xu wrote:
>> Hi, Mike,
>>
>> On Thu, Jun 16, 2022 at 02:05:15PM -0700, Mike Kravetz wrote:
>>> @@ -6877,6 +6896,39 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
>>>   	return (pte_t *)pmd;
>>>   }
>>>   
>>> +/*
>>> + * Return a mask that can be used to update an address to the last huge
>>> + * page in a page table page mapping size.  Used to skip non-present
>>> + * page table entries when linearly scanning address ranges.  Architectures
>>> + * with unique huge page to page table relationships can define their own
>>> + * version of this routine.
>>> + */
>>> +unsigned long hugetlb_mask_last_page(struct hstate *h)
>>> +{
>>> +	unsigned long hp_size = huge_page_size(h);
>>> +
>>> +	switch (hp_size) {
>>> +	case P4D_SIZE:
>>> +		return PGDIR_SIZE - P4D_SIZE;
>>> +	case PUD_SIZE:
>>> +		return P4D_SIZE - PUD_SIZE;
>>> +	case PMD_SIZE:
>>> +		return PUD_SIZE - PMD_SIZE;
>>> +	default:
>>
>> Should we add a WARN_ON_ONCE() if it should never trigger?
>>
> 
> Sure.  I will add this.
> 
>>> +		break; /* Should never happen */
>>> +	}
>>> +
>>> +	return ~(0UL);
>>> +}
>>> +
>>> +#else
>>> +
>>> +/* See description above.  Architectures can provide their own version. */
>>> +__weak unsigned long hugetlb_mask_last_page(struct hstate *h)
>>> +{
>>> +	return ~(0UL);
>>
>> I'm wondering whether it's better to return 0 rather than ~0 by default.
>> Could an arch with !CONFIG_ARCH_WANT_GENERAL_HUGETLB wrongly skip some
>> valid address ranges with ~0, or perhaps I misread?
> 
> Thank you, thank you, thank you Peter!
> 
> Yes, the 'default' return for hugetlb_mask_last_page() should be 0.  If
> there is no 'optimization', we do not want to modify the address so we
> want to OR with 0 not ~0.  My bad, I must have been thinking AND instead
> of OR.
> 
> I will change here as well as in Baolin's patch.

Ah, I also overlooked this. Thanks Peter, and thanks Mike for updating.
