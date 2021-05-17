Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0203C382FB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 16:19:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkLqB6hwcz3bsC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 00:19:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=d+ScgR4y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d+ScgR4y; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkLph3ltzz2xtx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 00:18:51 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id f8so4924027qth.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z7CDwn4Z3RrKMrbWWCsrq5EqlMuh7Sh4qQd1tbXNXs4=;
 b=d+ScgR4ycbRnxWoZykRDU2LDfqhErabnJvfpKTIgRAr1AmDp0umL4CeMYzq/sv0Wet
 2liKCiBvzMq19LML/5vzrm6L81QlNwPQN+NIH2//RgWHLZQbPBIlE+NVrjEXSdQDXoe5
 tTnwZu8ffwNx65fOu01aAwihWpgLcr17so3WyFLEWJN9DQ5QMCvk6Tg/737d1ug4kXVU
 Yed+HjINWpPGIemP+UkDkS0p0JBZnvEz3HrQr+i5WtExpU3IcAWK+dg1LQbeU+HoBDi7
 iU/M9kOzuXrYQDY9GhnEv6bKyPuoJgfh29EBF2lI0JfuhilOrPdzszFlPW+KzClkwK9X
 6FdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z7CDwn4Z3RrKMrbWWCsrq5EqlMuh7Sh4qQd1tbXNXs4=;
 b=NJxnAAHat7ExYagoaohw42dodOFTG/ET/I3eDyC7AwXRt+EwEPq+CLursme8gP8Qp6
 uh5rDcKP9RAGEDh0BG+EA5ibb+M7aNns5ulAG0xVpxVLasmDQ0h5EpRnsfYZDOLuoeNm
 umdlWJoipb4A4gby+5dJljunrsXqkFA8FSXExC63UUZoqPxFwZLmPhqhta447q54U0Mb
 /BA5ptCP6QtA/21oPfucWXEGtSulqAADm9aC4LSfx0QhcYXPDUigu6MKZBWJh1Y2ng11
 yh7cSL6gAh3zcEiM0G2bfpernP44tAImr0IWrvyuPwIz0fJg5P8nM/ECuAp93OeSSYlh
 ScMw==
X-Gm-Message-State: AOAM532i+Px8HwmNdtr1ThVKMAMlPle7CL9Y7RSetYagz4gogfRbptKO
 kGfXnuddPTLfnZ/XlvigaNg=
X-Google-Smtp-Source: ABdhPJzjbNMc/kjFVZ7Bf3esLT+CT3khD0KKBjg6Zlm6WHCkoweAfgQAu7OxTQnZA0QXggjPubmoiw==
X-Received: by 2002:ac8:6605:: with SMTP id c5mr24120956qtp.21.1621261126038; 
 Mon, 17 May 2021 07:18:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q7sm10534903qki.17.2021.05.17.07.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 07:18:45 -0700 (PDT)
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
 <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
 <d830fce9-c00a-e879-4115-94a2346a806f@roeck-us.net>
 <87pmxpqxb1.fsf@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines to
 take a page walk cache flush argument
Message-ID: <a7dd34f3-7d79-c933-fb62-eaad5c83d37a@roeck-us.net>
Date: Mon, 17 May 2021 07:18:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87pmxpqxb1.fsf@linux.ibm.com>
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

On 5/17/21 6:55 AM, Aneesh Kumar K.V wrote:
> Guenter Roeck <linux@roeck-us.net> writes:
> 
>> On 5/17/21 1:40 AM, Aneesh Kumar K.V wrote:
>>> On 5/15/21 10:05 PM, Guenter Roeck wrote:
>>>> On Thu, Apr 22, 2021 at 11:13:19AM +0530, Aneesh Kumar K.V wrote:
> 
> ...
> 
>>>>    extern void radix__local_flush_all_mm(struct mm_struct *mm);
>>>>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>>>>> index 215973b4cb26..f9f8a3a264f7 100644
>>>>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
>>>>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>>>>> @@ -45,13 +45,30 @@ static inline void tlbiel_all_lpid(bool radix)
>>>>>            hash__tlbiel_all(TLB_INVAL_SCOPE_LPID);
>>>>>    }
>>>>> +static inline void flush_pmd_tlb_pwc_range(struct vm_area_struct *vma,
>>>>                    ^^^^
>>>>> +                       unsigned long start,
>>>>> +                       unsigned long end,
>>>>> +                       bool flush_pwc)
>>>>> +{
>>>>> +    if (radix_enabled())
>>>>> +        return radix__flush_pmd_tlb_range(vma, start, end, flush_pwc);
>>>>> +    return hash__flush_tlb_range(vma, start, end);
>>>>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>
>>>>> +}
>>>
>>> In this specific case we won't have  build errors because,
>>>
>>> static inline void hash__flush_tlb_range(struct vm_area_struct *vma,
>>>                        unsigned long start, unsigned long end)
>>> {
>>>
>>
>> Sorry, you completely lost me.
>>
>> Building parisc:allnoconfig ... failed
>> --------------
>> Error log:
>> In file included from arch/parisc/include/asm/cacheflush.h:7,
>>                    from include/linux/highmem.h:12,
>>                    from include/linux/pagemap.h:11,
>>                    from include/linux/ksm.h:13,
>>                    from mm/mremap.c:14:
>> mm/mremap.c: In function 'flush_pte_tlb_pwc_range':
>> arch/parisc/include/asm/tlbflush.h:20:2: error: 'return' with a value, in function returning void
> 
> As replied here
> https://lore.kernel.org/mm-commits/8eedb441-a612-1ec8-8bf7-b40184de9f6f@linux.ibm.com/
> 
> That was the generic header change in the patch. I was commenting about the
> ppc64 specific change causing build failures.
> 

Ah, sorry. I wasn't aware that the following is valid C code

void f1()
{
     return f2();
     ^^^^^^
}

as long as f2() is void as well. Confusing, but we live and learn.

Guenter
