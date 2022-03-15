Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1228F4DA03A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 17:38:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHzck6j09z3bNr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 03:38:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MBpdFG36;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fWTJ8pVY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MBpdFG36; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fWTJ8pVY; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHzby21nnz2yn9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 03:38:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647362279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2ipbFlk5lqInrlinVKs+tHw6wDzJglC4+x65Q557sM=;
 b=MBpdFG36vqZFwQffgC4hdG4VMXqnnrRe8kG/CNZe+kNnLP4oqGY8LrZZaZBLrlL3lLE2wW
 tJ72cZrFmAOPXAt0AS7C/6jdr6y8D6Cm2IYI+9FLOHZKSOK3u9LohMzquzey6ftXq27wAC
 lqVEN3CUMRd0BtUdJaVqlh/Fgo37zsA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647362280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2ipbFlk5lqInrlinVKs+tHw6wDzJglC4+x65Q557sM=;
 b=fWTJ8pVYg7MbXxgYX/PkIUlGnQRshWUg8ILsBdrRRx5oU33rxx6qsQv1eJ2WXMZrJYZYes
 ycy7CZrWTxFwM75jqtoCTVmwPV65Gz05mi62+tZIOnLtsf8e2zlg7V+4sjhenth4nTSSEJ
 4fnwHFi6HcmLCDtSwDPYlqBAWmz1x5w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-WPIqQ8-ZPOqgxAvOtkdnCg-1; Tue, 15 Mar 2022 12:37:58 -0400
X-MC-Unique: WPIqQ8-ZPOqgxAvOtkdnCg-1
Received: by mail-wr1-f71.google.com with SMTP id
 j44-20020adf912f000000b00203a5a55817so1828929wrj.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 09:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=k2ipbFlk5lqInrlinVKs+tHw6wDzJglC4+x65Q557sM=;
 b=vsNDTBLubOjw5tS15fOpos3NqpOVWfGW2I20XfXsAVfqKLn/E+YC2607Kc7aL2EHzJ
 U+lp6Lvho9Z0c1oX0wSxBSHS4kjwGnrlzHGYSXPJEkmQkXH0/DNOb0dUXDw+s5ZGnVdT
 7/0uGK0hnd7DhOWZIufh4S3uSmzjxyJFVDoOdmU//pbYw68sE2wn2vU16PiUG3oILlXt
 GYijZJ1ej4mNNDDwNOUCgW5HNF26g4caiMqCy0lDplL3L9OOhUIpioRnChAoSv+BsPlA
 psZhBUPHp8JJpLk1BRQjGSLuKLCD6wWgXwFJwWbRBgshMMAj/61/VI51OpXO6ip0nDUD
 USxw==
X-Gm-Message-State: AOAM5330qX3gC27v3O1zO+fL7jpa7EeaMmkbKmcfih5V5x1/OGwfU1m+
 8u7+z6/b7E7GckbW4r1hLmqLTv9Fx/+YBlqfADkySeaXJUT2ZcYrNVr6dYBLdfAXpus0xETGMb2
 WBpophsL6HY0YMzY6RVIY19hJfQ==
X-Received: by 2002:adf:d1e5:0:b0:203:d609:38da with SMTP id
 g5-20020adfd1e5000000b00203d60938damr2900207wrd.675.1647362277269; 
 Tue, 15 Mar 2022 09:37:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqktz7igkc2jhfj9HwK0wpaZBKo1SRBQEWLN2nVdKLP+WSku1/PyNMTjD1G0jtbc54uPZgJw==
X-Received: by 2002:adf:d1e5:0:b0:203:d609:38da with SMTP id
 g5-20020adfd1e5000000b00203d60938damr2900167wrd.675.1647362276942; 
 Tue, 15 Mar 2022 09:37:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:1800:42bd:3cac:d22a:3c62?
 (p200300cbc708180042bd3cacd22a3c62.dip0.t-ipconnect.de.
 [2003:cb:c708:1800:42bd:3cac:d22a:3c62])
 by smtp.gmail.com with ESMTPSA id
 u4-20020adfdb84000000b001e8d8ac5394sm17229217wri.110.2022.03.15.09.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 09:37:56 -0700 (PDT)
Message-ID: <c8229082-e8f1-e605-25c2-0ec9d23efd9e@redhat.com>
Date: Tue, 15 Mar 2022 17:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-6-david@redhat.com> <20220315172102.771bd2cf@thinkpad>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 5/7] s390/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
In-Reply-To: <20220315172102.771bd2cf@thinkpad>
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

On 15.03.22 17:21, Gerald Schaefer wrote:
> On Tue, 15 Mar 2022 15:18:35 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> Let's steal one bit from the offset. While at it, document the meaning
>> of bit 62 for swap ptes.
> 
> You define _PAGE_SWP_EXCLUSIVE as _PAGE_LARGE, which is bit 52, and
> this is not part of the swap pte offset IIUC. So stealing any bit might
> actually not be necessary, see below.

Indeed, thanks for catching that. I actually intended to use bit 51 ...

> 
> Also, bit 62 should be the soft dirty bit for normal PTEs, and this
> doesn't seem to be used for swap PTEs at all. But I might be missing
> some use case where softdirty also needs to be preserved in swap PTEs.
> 

It is, see below.

>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  arch/s390/include/asm/pgtable.h | 37 ++++++++++++++++++++++++++-------
>>  1 file changed, 30 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
>> index 008a6c856fa4..c182212a2b44 100644
>> --- a/arch/s390/include/asm/pgtable.h
>> +++ b/arch/s390/include/asm/pgtable.h
>> @@ -181,6 +181,8 @@ static inline int is_module_addr(void *addr)
>>  #define _PAGE_SOFT_DIRTY 0x000
>>  #endif
>>  
>> +#define _PAGE_SWP_EXCLUSIVE _PAGE_LARGE	/* SW pte exclusive swap bit */
>> +
>>  /* Set of bits not changed in pte_modify */
>>  #define _PAGE_CHG_MASK		(PAGE_MASK | _PAGE_SPECIAL | _PAGE_DIRTY | \
>>  				 _PAGE_YOUNG | _PAGE_SOFT_DIRTY)
>> @@ -796,6 +798,24 @@ static inline int pmd_protnone(pmd_t pmd)
>>  }
>>  #endif
>>  
>> +#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>> +static inline pte_t pte_swp_mkexclusive(pte_t pte)
>> +{
>> +	pte_val(pte) |= _PAGE_SWP_EXCLUSIVE;
>> +	return pte;
>> +}
>> +
>> +static inline int pte_swp_exclusive(pte_t pte)
>> +{
>> +	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>> +}
>> +
>> +static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>> +{
>> +	pte_val(pte) &= ~_PAGE_SWP_EXCLUSIVE;
>> +	return pte;
>> +}
>> +
>>  static inline int pte_soft_dirty(pte_t pte)
>>  {
>>  	return pte_val(pte) & _PAGE_SOFT_DIRTY;
>> @@ -1675,16 +1695,19 @@ static inline int has_transparent_hugepage(void)
>>   * information in the lowcore.
>>   * Bits 54 and 63 are used to indicate the page type.
>>   * A swap pte is indicated by bit pattern (pte & 0x201) == 0x200
>> - * This leaves the bits 0-51 and bits 56-62 to store type and offset.
>> - * We use the 5 bits from 57-61 for the type and the 52 bits from 0-51
>> + * This leaves the bits 0-50 and bits 56-61 to store type and offset.
>> + * We use the 5 bits from 57-61 for the type and the 51 bits from 0-50
>>   * for the offset.
>> - * |			  offset			|01100|type |00|
>> - * |0000000000111111111122222222223333333333444444444455|55555|55566|66|
>> - * |0123456789012345678901234567890123456789012345678901|23456|78901|23|
>> + * |			  offset		       |E|01100|type |S0|
>> + * |000000000011111111112222222222333333333344444444445|5|55555|55566|66|
>> + * |012345678901234567890123456789012345678901234567890|1|23456|78901|23|
>> + *
>> + * S (bit 62) is used for softdirty tracking.
> 
> Unless there is some use for softdirty tracking in swap PTEs, I think
> this description does not belong here, to the swap PTE layout.

See pte_swp_soft_dirty and friends. E.g., do_swap_page() has to restore
it for the ordinary PTE from the swp pte.

if (pte_swp_soft_dirty(vmf->orig_pte))
	pte = pte_mksoft_dirty(pte);

> 
>> + * E (bit 51) is used to remember PG_anon_exclusive.
> 
> It is bit 52, at least with this patch, so I guess this could all be
> done w/o stealing anything. That is, of course, only if it is allowed
> to use bit 52 in this case. The POP says bit 52 has to be 0, or else
> a "translation-specification exception" is recognized. However, I think
> it could be OK for PTEs marked as invalid, like it is the case for swap
> PTEs.

My tests with this patch worked, BUT it was under z/VM on a fairly old z
machine. At least 2MiB huge pages are supported there. I did not run
into specification exception in that setup, but that doesn't mean that
that's the case under LPAR/KVM/newer systems.

> 
> The comment here says at the beginning:
> /*
>  * 64 bit swap entry format:
>  * A page-table entry has some bits we have to treat in a special way.
>  * Bits 52 and bit 55 have to be zero, otherwise a specification
>  * exception will occur instead of a page translation exception. The
>  * specification exception has the bad habit not to store necessary
>  * information in the lowcore.
> 
> This would mean that it is not OK to have bit 52 not zero for swap PTEs.
> But if I read the POP correctly, all bits except for the DAT-protection
> would be ignored for invalid PTEs, so maybe this comment needs some update
> (for both bits 52 and also 55).
> 
> Heiko might also have some more insight.

Indeed, I wonder why we should get a specification exception when the
PTE is invalid. I'll dig a bit into the PoP.

> 
> Anyway, stealing bit 51 might still be an option, but then
> _PAGE_SWP_EXCLUSIVE would need to be defined appropriately.
> 

Indeed.

Thanks for the very-fast review!

-- 
Thanks,

David / dhildenb

