Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B20024DB21B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 15:01:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJX5C4KtYz308F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 01:01:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B24tq8rj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B24tq8rj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=B24tq8rj; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=B24tq8rj; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJX4P4XXQz2yxP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 01:01:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647439263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMpVeSfbG0vYOwXEGda9QD6+H/leXcAIfJEoqpZjB6U=;
 b=B24tq8rjrBQW2xUixAs9ExWUXedqWqA2JQk6CjgfxoYJ9V5AePO9YAanEJJkfRTL4YpGhc
 j2Msi1iYdNpeSKg4gXulGfxEAygt0N6An+/ZkBQg1d700YLz8hCymG4m/JR3sOURy8pnwB
 b1eGaiNm2KTxsOq+aJ3WbkgYHk9pqgM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647439263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMpVeSfbG0vYOwXEGda9QD6+H/leXcAIfJEoqpZjB6U=;
 b=B24tq8rjrBQW2xUixAs9ExWUXedqWqA2JQk6CjgfxoYJ9V5AePO9YAanEJJkfRTL4YpGhc
 j2Msi1iYdNpeSKg4gXulGfxEAygt0N6An+/ZkBQg1d700YLz8hCymG4m/JR3sOURy8pnwB
 b1eGaiNm2KTxsOq+aJ3WbkgYHk9pqgM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-DpjiFjbSOLqNVQF2bnLX3A-1; Wed, 16 Mar 2022 10:01:02 -0400
X-MC-Unique: DpjiFjbSOLqNVQF2bnLX3A-1
Received: by mail-wm1-f72.google.com with SMTP id
 q6-20020a1cf306000000b0038c5726365aso1092131wmq.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 07:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rMpVeSfbG0vYOwXEGda9QD6+H/leXcAIfJEoqpZjB6U=;
 b=lMcLFhiI0i6Tzfwsd69n2miYDJ2TwyF5l0zzHWwuHtZcKWpAnNJwiZy0NCdqK0lVeb
 QgJYViUrGhZy5+E8nQMyb7Qr7X8WeINH7uUPGZlAjGzUiNXQVCWXKorH3A0JFPN7pp/F
 QY/XTWiplOVs1Y4UNiH5jFPA4Smka0UeBfMXAC/O3LnRslh67tWczXH8WY12bv27zT6J
 XU/VKx0J+l+0MuWBAvv2ZDFHXlcrLJ1ksZjuNwhyrWiqjaxNtGP8e0totIWQQ/VLtzV7
 akvtXehLVqfPtoBXFQU6SkozQAbPS1mlY0aZFmPnW3RzK4GPEl+ozP1JqaxursR++kMx
 YwxQ==
X-Gm-Message-State: AOAM530gZoupZ1GBJ1QSVtLgydL2ibMkKzE8nuRJbpXn8lXflfUiTk5w
 6PsLUpAyrjstAxlJLXejVVPTzzj1wd8OTBo62uW5Gl4GZZ9dUGPWhOi7iQg0pqRKHWJ/baAUJ2A
 1LcXQWFxOgP/BTA1Hyc6lSg+KAQ==
X-Received: by 2002:a1c:7303:0:b0:37c:9270:2ff4 with SMTP id
 d3-20020a1c7303000000b0037c92702ff4mr7476461wmb.99.1647439260665; 
 Wed, 16 Mar 2022 07:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO6Wob+Yz/s8DwlWw/pZDGixGE+kjeQrFpxYz95br1U4eXTeFc9jYH4XUYuhLvMOMgIv537Q==
X-Received: by 2002:a1c:7303:0:b0:37c:9270:2ff4 with SMTP id
 d3-20020a1c7303000000b0037c92702ff4mr7476436wmb.99.1647439260364; 
 Wed, 16 Mar 2022 07:01:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:f900:aa79:cd25:e0:32d1?
 (p200300cbc706f900aa79cd2500e032d1.dip0.t-ipconnect.de.
 [2003:cb:c706:f900:aa79:cd25:e0:32d1])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4348000000b00203dbfa4ff2sm1758365wrr.34.2022.03.16.07.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 07:00:59 -0700 (PDT)
Message-ID: <75d6cccd-ce22-bdf9-68d5-0792cec39ab7@redhat.com>
Date: Wed, 16 Mar 2022 15:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 5/7] s390/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-6-david@redhat.com> <20220315172102.771bd2cf@thinkpad>
 <c8229082-e8f1-e605-25c2-0ec9d23efd9e@redhat.com>
 <8b13b6c0-78d4-48e3-06f0-ec0680d013a9@redhat.com>
 <55b6b582-51ca-b869-2055-674fe4c563e6@redhat.com>
 <20220316115654.12823b78@thinkpad>
 <6f7b208b-ec38-571d-cd24-b9bfa79d1f40@linux.ibm.com>
 <20220316142722.76c691d2@thinkpad>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220316142722.76c691d2@thinkpad>
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Oded Gabbay <oded.gabbay@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nadav Amit <namit@vmware.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16.03.22 14:27, Gerald Schaefer wrote:
> On Wed, 16 Mar 2022 14:01:07 +0100
> Christian Borntraeger <borntraeger@linux.ibm.com> wrote:
> 
>>
>>
>> Am 16.03.22 um 11:56 schrieb Gerald Schaefer:
>>> On Tue, 15 Mar 2022 18:12:16 +0100
>>> David Hildenbrand <david@redhat.com> wrote:
>>>
>>>> On 15.03.22 17:58, David Hildenbrand wrote:
>>>>>
>>>>>>> This would mean that it is not OK to have bit 52 not zero for swap PTEs.
>>>>>>> But if I read the POP correctly, all bits except for the DAT-protection
>>>>>>> would be ignored for invalid PTEs, so maybe this comment needs some update
>>>>>>> (for both bits 52 and also 55).
>>>>>>>
>>>>>>> Heiko might also have some more insight.
>>>>>>
>>>>>> Indeed, I wonder why we should get a specification exception when the
>>>>>> PTE is invalid. I'll dig a bit into the PoP.
>>>>>
>>>>> SA22-7832-12 6-46 ("Translation-Specification Exception") is clearer
>>>>>
>>>>> "The page-table entry used for the translation is
>>>>> valid, and bit position 52 does not contain zero."
>>>>>
>>>>> "The page-table entry used for the translation is
>>>>> valid, EDAT-1 does not apply, the instruction-exe-
>>>>> cution-protection facility is not installed, and bit
>>>>> position 55 does not contain zero. It is model
>>>>> dependent whether this condition is recognized."
>>>>>
>>>>
>>>> I wonder if the following matches reality:
>>>>
>>>> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
>>>> index 008a6c856fa4..6a227a8c3712 100644
>>>> --- a/arch/s390/include/asm/pgtable.h
>>>> +++ b/arch/s390/include/asm/pgtable.h
>>>> @@ -1669,18 +1669,16 @@ static inline int has_transparent_hugepage(void)
>>>>   /*
>>>>    * 64 bit swap entry format:
>>>>    * A page-table entry has some bits we have to treat in a special way.
>>>> - * Bits 52 and bit 55 have to be zero, otherwise a specification
>>>> - * exception will occur instead of a page translation exception. The
>>>> - * specification exception has the bad habit not to store necessary
>>>> - * information in the lowcore.
>>>>    * Bits 54 and 63 are used to indicate the page type.
>>>>    * A swap pte is indicated by bit pattern (pte & 0x201) == 0x200
>>>> - * This leaves the bits 0-51 and bits 56-62 to store type and offset.
>>>> - * We use the 5 bits from 57-61 for the type and the 52 bits from 0-51
>>>> - * for the offset.
>>>> - * |                     offset                        |01100|type |00|
>>>> + * |                     offset                        |XX1XX|type |S0|
>>>>    * |0000000000111111111122222222223333333333444444444455|55555|55566|66|
>>>>    * |0123456789012345678901234567890123456789012345678901|23456|78901|23|
>>>> + *
>>>> + * Bits 0-51 store the offset.
>>>> + * Bits 57-62 store the type.
>>>> + * Bit 62 (S) is used for softdirty tracking.
>>>> + * Bits 52, 53, 55 and 56 (X) are unused.
>>>>    */
>>>>   
>>>>   #define __SWP_OFFSET_MASK      ((1UL << 52) - 1)
>>>>
>>>>
>>>> I'm not sure why bit 53 was indicated as "1" and bit 55 was indicated as
>>>> "0". At least for 52 and 55 there was a clear description.
>>>
>>> Bit 53 is the invalid bit, and that is always 1 for swap ptes, in addition
>>> to protection bit 54. Bit 55, along with bit 52, has to be zero according
>>> to the (potentially deprecated) comment.
>>>
>>> It is interesting that bit 56 seems to be unused, at least according
>>> to the comment, but that would also mention bit 62 as unused, so that
>>> clearly needs some update.
>>>
>>> If bit 56 could be used for _PAGE_SWP_EXCLUSIVE, that would be better
>>> than stealing a bit from the offset, or using potentially dangerous
>>> bit 52. It is defined as _PAGE_UNUSED and only used for kvm, not sure
>>> if this is also relevant for swap ptes, similar to bit 62.
>>>
>>> Adding Christian on cc, maybe he has some insight on _PAGE_UNUSED
>>> bit 56 and swap ptes.
>>
>> I think _PAGE_UNUSED is not used for swap ptes. It is used _before_ swapping
>> to decide whether we swap or discard the page.
>>
>> Regarding bit 52, the POP says in chapter 3 for the page table entry
>>
>> [..]
>> Page-Invalid Bit (I): Bit 53 controls whether the
>> page associated with the page-table entry is avail-
>> able. When the bit is zero, address translation pro-
>> ceeds by using the page-table entry. When the bit is
>> one, the page-table entry cannot be used for transla-
>> tion.
>>
>>
>> -->When the page-invalid bit is one, all other bits in the
>> -->page-table entry are available for use by program-
>> -->ming.
>>
>> this was added with the z14 POP, but I guess it was just a clarification
>> and should be valid for older machines as well.
>> So 52 and 56 should be ok, with 52 probably the better choice.
> 
> Ok, bit 55 would then also be an option IIUC, since execution protection
> should not be relevant for swap ptes. And Davids clean-up removing the
> restriction for bit 52 and 55 in the comment would make sense.
> 
> I would also favor bit 52 though (PAGE_LARGE), as in Davids initial patch
> version, since this is never used for any real ptes. The PAGE_LARGE flag
> is only set in the "virtual" large ptes that the hugetlb code is seeing
> from huge_ptep_get(). But it will (and must) never be written as a valid
> pte, or else it will generate an exception. IIRC, we only set it to detect
> such possible bugs, e.g. hugetlb code writing a pte (which really is a
> pmd/pud) directly, instead of using set_huge_pte_at().
> 

Agreed. I'll include the doc cleanup patch and a fixed-up version of
this patch (still using bit 52, not messing with the offset bits) in the
next version.

Thanks all!

-- 
Thanks,

David / dhildenb

