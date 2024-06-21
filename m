Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEBE912B06
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 18:12:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KEVFLsDx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5Mp20ylcz3cdM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 02:12:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KEVFLsDx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5MnG1SqYz30Vh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 02:11:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718986323; x=1750522323;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BUMfaAo/KwHaw6iSwPgLnlv+IyqhQhDWdAdRUyVOJXc=;
  b=KEVFLsDxe1Bk/xEKj4FQRKAngnelGOsX+KQN9N1wwk4gfUMrdhzBUlP+
   +a3HanfeKUtQGaNfpoBRD8pGvLWqHM6bLez/wIM6fvJN60MdL06T5H9l9
   tuaOKekeO+lRIyr6hYzKpa48jrmk8+T9flP8cRIWLU64J1cL2RWZam9Xh
   qi0zfLwjfeqAbG/1cPD980rlRLEBGpJcHnkrU6Gtp0+2CsDAHx+xXeP0Y
   8BTQHSff47CCONLElj6mb7E+Cei60nZ/bgLXd63gF/t3oN1uGqdLR4g7B
   jWDmgJVHAJc7LJfihaHDAX5o9b0lEXgmXX1GvOrPoZ/3prGbPisw14Yj9
   w==;
X-CSE-ConnectionGUID: CndNgTFnTx2Mvl761I1zJg==
X-CSE-MsgGUID: +Isye0QcT4CUnWrbir+Xqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="19840015"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="19840015"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 09:11:56 -0700
X-CSE-ConnectionGUID: Vq656qevQCOneX+OEz/oVw==
X-CSE-MsgGUID: xTH7aQt2SYGS+mPlibylGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="42598166"
Received: from bmurrell-mobl.amr.corp.intel.com (HELO [10.124.221.70]) ([10.124.221.70])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 09:11:56 -0700
Message-ID: <5daa82f5-b5ea-42d7-a074-122734ad99db@intel.com>
Date: Fri, 21 Jun 2024 09:11:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] mm/x86: Add missing pud helpers
To: Peter Xu <peterx@redhat.com>
References: <20240621142504.1940209-1-peterx@redhat.com>
 <20240621142504.1940209-7-peterx@redhat.com>
 <4fb4b087-cae2-4516-a34e-cb4c72be13eb@intel.com> <ZnWgG7WmZWS-xWJU@x1n>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <ZnWgG7WmZWS-xWJU@x1n>
Content-Type: text/plain; charset=UTF-8
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/21/24 08:45, Peter Xu wrote:
> On Fri, Jun 21, 2024 at 07:51:26AM -0700, Dave Hansen wrote:
...
>> But, still, what if you take a Dirty=1,Write=1 pud and pud_modify() it
>> to make it Dirty=1,Write=0?  What prevents that from being
>> misinterpreted by the hardware as being a valid 1G shadow stack mapping?
> 
> Thanks for pointing that out.  I think I was thinking it will only take
> effect on VM_SHADOW_STACK first, so it's not?
> 
> I was indeed trying to find more information on shadow stack at that time
> but I can't find as much on the pgtable implications, on e.g. whether "D=1
> + W=0" globally will be recognized as shadow stack.  At least on SDM March
> 2024 version Vol3 Chap4 pgtable entries still don't explain these details,
> or maybe I missed it.  Please let me know if there's suggestion on what I
> can read before I post a v2.

It's in the "Determination of Access Rights" section.

	A linear address is a shadow-stack address if the following are
	true of the translation of the linear address: (1) the R/W flag
	(bit 1) is 0 and the dirty flag (bit 6) is 1 in the paging-
	structure entry that maps the page containing the linear
	address; and (2) the R/W flag is 1 in every other paging-
	structure entry controlling the translation of the linear
	address.

> So if it's globally taking effect, indeed we'll need to handle them in PUDs
> too.
> 
> Asides, not sure whether it's off-topic to ask here, but... why shadow
> stack doesn't reuse an old soft-bit to explicitly mark "this is shadow
> stack ptes" when designing the spec?  Now it consumed bit 58 anyway for
> caching dirty. IIUC we can avoid all these "move back and forth" issue on
> dirty bit if so.

The design accommodates "other" OSes that are using all the software
bits for other things.

For Linux, you're right, we just ended up consuming a software bit
_anyway_ so we got all the complexity of the goofy permissions *AND*
lost a bit in the end.  Lose, lose.

>>>  /*
>>>   * mprotect needs to preserve PAT and encryption bits when updating
>>>   * vm_page_prot
>>> @@ -1377,10 +1398,25 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>>>  }
>>>  #endif
>>>  
>>> +static inline pud_t pudp_establish(struct vm_area_struct *vma,
>>> +		unsigned long address, pud_t *pudp, pud_t pud)
>>> +{
>>> +	if (IS_ENABLED(CONFIG_SMP)) {
>>> +		return xchg(pudp, pud);
>>> +	} else {
>>> +		pud_t old = *pudp;
>>> +		WRITE_ONCE(*pudp, pud);
>>> +		return old;
>>> +	}
>>> +}
>>
>> Why is there no:
>>
>> 	page_table_check_pud_set(vma->vm_mm, pudp, pud);
>>
>> ?  Sure, it doesn't _do_ anything today.  But the PMD code has it today.
>>  So leaving it out creates a divergence that honestly can only serve to
>> bite us in the future and will create a head-scratching delta for anyone
>> that is comparing PUD and PMD implementations in the future.
> 
> Good question, I really don't remember why I didn't have that, since I
> should have referenced the pmd helper.  I'll add them and see whether I'll
> hit something otherwise.
> 
> Thanks for the review.

One big thing I did in this review was make sure that the PMD and PUD
helpers were doing the same thing.  Would you mind circling back and
double-checking the same before you repost this?

