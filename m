Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EBE4E2B7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 16:08:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMdKy1htjz3bPD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 02:08:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DVHm0uKT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DVHm0uKT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=DVHm0uKT; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=DVHm0uKT; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMdKC3L77z306R
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 02:07:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647875274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFVfxmzhaFPMubA718aiLUSwyIk5+iMjz6qfYM1xb4A=;
 b=DVHm0uKT7xW0U1TaTtwIelzGlG8+HOjJTYj57VSeAVa9JDpeDHtZKxZJknxcu2ll5vKOOH
 RsmxiSdjGUtilg+QiU+7KYpE0P6gLkYjp9zKP0+L3Uj+JliK08fcTV9sCXyvyxWQXTYXqV
 4W2al2u3raZ6uUaux/D7egF7SpnNPUs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647875274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFVfxmzhaFPMubA718aiLUSwyIk5+iMjz6qfYM1xb4A=;
 b=DVHm0uKT7xW0U1TaTtwIelzGlG8+HOjJTYj57VSeAVa9JDpeDHtZKxZJknxcu2ll5vKOOH
 RsmxiSdjGUtilg+QiU+7KYpE0P6gLkYjp9zKP0+L3Uj+JliK08fcTV9sCXyvyxWQXTYXqV
 4W2al2u3raZ6uUaux/D7egF7SpnNPUs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-kEXObzHzMpSz5BEy7K4RVQ-1; Mon, 21 Mar 2022 11:07:52 -0400
X-MC-Unique: kEXObzHzMpSz5BEy7K4RVQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r67-20020a1c4446000000b0038c8655c40eso171107wma.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 08:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZFVfxmzhaFPMubA718aiLUSwyIk5+iMjz6qfYM1xb4A=;
 b=qEsSfblOneJvTLchFr2SeRokVk9ZzFqWZf/VRjJMoHrsVSwzfa+/MLOLjqN/UO0TUH
 s6YPDFVbGki64hVZKpPHlQTUKZuKYs+u0e9X2JHJInjmjxEIkUbOIXHPhVyq13p0Ibzm
 vEZvTfS2kY5MWwtWi3pCEEDTbcVoUmKCWeVtvFdXJCmpqxsHj1Ewzj2cCM/XVbr3kSnc
 UxyXmPsTlKKzT9ndT71lPlCCpn/WKNW5hoUYbPT7aDF0o0tX7dOLBa7EFg8j1IMZZ6L/
 Hby9eOMrhsYiq4/BRz7nqjf8fNT77fqEWnXi9J55hWQ9/vgoLdj25FDCgoivICkUSXgl
 0b0g==
X-Gm-Message-State: AOAM531ts8lJ5bL+WamZDTm1TZzNhaSFFIImHhGRIvtqunulXT/B2j8N
 ++Z9eEXtkKRt++IAEL2ydY+SYNUnznbZ03pFFCF+elD//+dMaFq6j04bAvclCw5FC5WfGM3GyYk
 a8/zMg5KIGF8aFlbb0sbXWCk8KA==
X-Received: by 2002:a05:600c:4ed2:b0:38c:93ad:4825 with SMTP id
 g18-20020a05600c4ed200b0038c93ad4825mr11133390wmq.181.1647875271724; 
 Mon, 21 Mar 2022 08:07:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKoU0nGg0p5jibfOm4Ew1arWHbW+SRBIfaAS1QHWKwXAqgZDqMtY1m9j1jU9wOkm317ZDDsQ==
X-Received: by 2002:a05:600c:4ed2:b0:38c:93ad:4825 with SMTP id
 g18-20020a05600c4ed200b0038c93ad4825mr11133335wmq.181.1647875271332; 
 Mon, 21 Mar 2022 08:07:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a5d46ca000000b00203fd86e198sm7209759wrs.96.2022.03.21.08.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 08:07:50 -0700 (PDT)
Message-ID: <ea570f92-f896-7f9b-91c4-ad0a025bb340@redhat.com>
Date: Mon, 21 Mar 2022 16:07:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 4/7] arm64/pgtable: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-5-david@redhat.com> <YjIr9f9qaz4xITVd@arm.com>
 <20220321143802.GC11145@willie-the-truck>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220321143802.GC11145@willie-the-truck>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Paul Mackerras <paulus@samba.org>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Rik van Riel <riel@surriel.com>,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>,
 David Rientjes <rientjes@google.com>, Pedro Gomes <pedrodemargomes@gmail.com>,
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>,
 Heiko Carstens <hca@linux.ibm.com>, Shakeel Butt <shakeelb@google.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21.03.22 15:38, Will Deacon wrote:
> On Wed, Mar 16, 2022 at 06:27:01PM +0000, Catalin Marinas wrote:
>> On Tue, Mar 15, 2022 at 03:18:34PM +0100, David Hildenbrand wrote:
>>> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
>>> index b1e1b74d993c..62e0ebeed720 100644
>>> --- a/arch/arm64/include/asm/pgtable-prot.h
>>> +++ b/arch/arm64/include/asm/pgtable-prot.h
>>> @@ -14,6 +14,7 @@
>>>   * Software defined PTE bits definition.
>>>   */
>>>  #define PTE_WRITE		(PTE_DBM)		 /* same as DBM (51) */
>>> +#define PTE_SWP_EXCLUSIVE	(_AT(pteval_t, 1) << 2)	 /* only for swp ptes */
>>
>> I think we can use bit 1 here.
>>
>>> @@ -909,12 +925,13 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>>>  /*
>>>   * Encode and decode a swap entry:
>>>   *	bits 0-1:	present (must be zero)
>>> - *	bits 2-7:	swap type
>>> + *	bits 2:		remember PG_anon_exclusive
>>> + *	bits 3-7:	swap type
>>>   *	bits 8-57:	swap offset
>>>   *	bit  58:	PTE_PROT_NONE (must be zero)
>>
>> I don't remember exactly why we reserved bits 0 and 1 when, from the
>> hardware perspective, it's sufficient for bit 0 to be 0 and the whole
>> pte becomes invalid. We use bit 1 as the 'table' bit (when 0 at pmd
>> level, it's a huge page) but we shouldn't check for this on a swap
>> entry.
> 
> I'm a little worried that when we're dealing with huge mappings at the
> PMD level we might lose the ability to distinguish them from a pte-level
> mapping with this new flag set if we use bit 1. A similar issue to this
> was fixed a long time ago by 59911ca4325d ("ARM64: mm: Move PTE_PROT_NONE
> bit") when we used to use bit 1 for PTE_PROT_NONE.
> 
> Is something like:
> 
> 	pmd_to_swp_entry(swp_entry_to_pmd(pmd));

Note that __HAVE_ARCH_PTE_SWP_EXCLUSIVE currently only applies to actual
swap entries, not non-swap entries (migration, hwpoison, ...). So it
really only applies to PTEs -- PMDs are not applicable.

So the example you gave cannot possibly have that bit set. From what I
understand, it should be fine. But I have no real preference: I can also
just stick to the original patch, whatever you prefer.

Thanks!

-- 
Thanks,

David / dhildenb

