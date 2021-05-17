Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8FD382D97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 15:39:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkKws6KK8z3bry
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 23:39:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JoliJRMj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JoliJRMj; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkKwL1rPQz2xvc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 23:38:41 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id o27so5675680qkj.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mSevgqLkwFjJJ3znA3S2Bzcdr9oY0/kEsDuFSkTBZYo=;
 b=JoliJRMjU6W3g7ScapsPY0yIWSoABH1V9Agb56/kOXUJJ42HAQL/+8spk0tiO8EjHn
 lnhXqJA3FC7JojyyOMdy+IVnc6hsMz0wBI2yfz5/F6CJqAaeTYNMqrRS9p/TepOtTDS2
 gre7N6DNXovrYYoZRyGyTyJvBnG0h8eTmaE5pKdLGpaM6u0gJETNkhyd3XgQQWKZ4YMy
 Bct9FsyKpIB/OsI/j5d3VjiEuP49hMyc46VmEi+RYcO/atswUwRYB5qFLzZzQsFmTrrn
 PrYgg97dAXc8YyWy54PAqbOjjJ8E10/YOkuT8BK7eHqsumGrnQ1Vl9Gqb4P1vX+WIFB8
 SG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mSevgqLkwFjJJ3znA3S2Bzcdr9oY0/kEsDuFSkTBZYo=;
 b=HEoEVF/OPO5zossF6cMqSnJJ8+NtWPUjWx8eSvDAFjCfW7hvRZlQ+TyvKRvkHRigRx
 89yJM0NN6/ZtecoHkXazki1qO3UovB5EiJNwi8GBdgCWeqvuuYUGcf7z2UzG1fIuoNdK
 RYiHgfkScNCDoVbuQQ8kwfpzSZzTuEtGRzC10JkwDEpTyEmPpAffow3uQ/7Cd8MHxaCL
 RFVsnuh50R7wFNNAKM+OU/bQe2yjwwsZnqVoZTe74N46cqFir4o2Sn1ZlymJyhnePpNc
 r+u/YXaIR85s6Td61uNTcG5BeTLa0kywojbniRATs2Bpcm/1iF/h2/MOjdIrwKGzWGfC
 ZtKg==
X-Gm-Message-State: AOAM531q8DO9vPew9seoAsqF4QB5B06WN/qbU8ZUf8B00lmobNHzmiaE
 TPpkc0MtSHdWrxNnEw0+xlU=
X-Google-Smtp-Source: ABdhPJxibVYkxZSg1rKPxlp9tnrNyS45y+0GPZ97agBX5bjFzhj1OWRQs06n4vGUdtRnP8zFmt0Xxg==
X-Received: by 2002:a05:620a:29c4:: with SMTP id
 s4mr19567637qkp.22.1621258717580; 
 Mon, 17 May 2021 06:38:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 25sm376207qtd.51.2021.05.17.06.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:38:36 -0700 (PDT)
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines to
 take a page walk cache flush argument
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
 <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d830fce9-c00a-e879-4115-94a2346a806f@roeck-us.net>
Date: Mon, 17 May 2021 06:38:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: npiggin@gmail.com, linux-mm@kvack.org, kaleshsingh@google.com,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/17/21 1:40 AM, Aneesh Kumar K.V wrote:
> On 5/15/21 10:05 PM, Guenter Roeck wrote:
>> On Thu, Apr 22, 2021 at 11:13:19AM +0530, Aneesh Kumar K.V wrote:
>>> No functional change in this patch
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   .../include/asm/book3s/64/tlbflush-radix.h    | 19 +++++++-----
>>>   arch/powerpc/include/asm/book3s/64/tlbflush.h | 23 ++++++++++++---
>>>   arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  4 +--
>>>   arch/powerpc/mm/book3s64/radix_tlb.c          | 29 +++++++------------
>>>   4 files changed, 42 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
>>> index 8b33601cdb9d..171441a43b35 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
>>> @@ -56,15 +56,18 @@ static inline void radix__flush_all_lpid_guest(unsigned int lpid)
>>>   }
>>>   #endif
>>> -extern void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
>>> -                       unsigned long start, unsigned long end);
>>> -extern void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
>>> -                     unsigned long end, int psize);
>>> -extern void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
>>> -                       unsigned long start, unsigned long end);
>>> -extern void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>> +void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
>>> +                    unsigned long start, unsigned long end,
>>> +                    bool flush_pwc);
>>> +void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
>>> +                unsigned long start, unsigned long end,
>>> +                bool flush_pwc);
>>> +void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
>>> +                      unsigned long end, int psize, bool flush_pwc);
>>> +void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>>                   unsigned long end);
>>> -extern void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
>>> +void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
>>> +
>>>   extern void radix__local_flush_tlb_mm(struct mm_struct *mm);
>>>   extern void radix__local_flush_all_mm(struct mm_struct *mm);
>>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>>> index 215973b4cb26..f9f8a3a264f7 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>>> @@ -45,13 +45,30 @@ static inline void tlbiel_all_lpid(bool radix)
>>>           hash__tlbiel_all(TLB_INVAL_SCOPE_LPID);
>>>   }
>>> +static inline void flush_pmd_tlb_pwc_range(struct vm_area_struct *vma,
>>                   ^^^^
>>> +                       unsigned long start,
>>> +                       unsigned long end,
>>> +                       bool flush_pwc)
>>> +{
>>> +    if (radix_enabled())
>>> +        return radix__flush_pmd_tlb_range(vma, start, end, flush_pwc);
>>> +    return hash__flush_tlb_range(vma, start, end);
>>          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>>> +}
> 
> In this specific case we won't have  build errors because,
> 
> static inline void hash__flush_tlb_range(struct vm_area_struct *vma,
>                       unsigned long start, unsigned long end)
> {
> 

Sorry, you completely lost me.

Building parisc:allnoconfig ... failed
--------------
Error log:
In file included from arch/parisc/include/asm/cacheflush.h:7,
                  from include/linux/highmem.h:12,
                  from include/linux/pagemap.h:11,
                  from include/linux/ksm.h:13,
                  from mm/mremap.c:14:
mm/mremap.c: In function 'flush_pte_tlb_pwc_range':
arch/parisc/include/asm/tlbflush.h:20:2: error: 'return' with a value, in function returning void

Guenter

> 
> But I agree the below is better to read.
> 
> static inline void flush_pmd_tlb_pwc_range(struct vm_area_struct *vma,
>                         unsigned long start,
>                         unsigned long end,
>                         bool flush_pwc)
> {
>      if (radix_enabled())
>          radix__flush_pmd_tlb_range(vma, start, end, flush_pwc);
>      else
>          hash__flush_tlb_range(vma, start, end);
>      return
> }
> 
>>
>>>   #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>>>   static inline void flush_pmd_tlb_range(struct vm_area_struct *vma,
>>                   ^^^^
>>>                          unsigned long start, unsigned long end)
>>> +{
>>> +    return flush_pmd_tlb_pwc_range(vma, start, end, false);
>>          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> Doesn't that cause build warnings/errors all over the place ?
>>
>> Guenter
>>
> 
> 
> -aneesh

