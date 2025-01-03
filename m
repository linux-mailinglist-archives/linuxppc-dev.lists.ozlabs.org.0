Return-Path: <linuxppc-dev+bounces-4628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5231CA00713
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 10:35:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPdjg0YfLz30TN;
	Fri,  3 Jan 2025 20:35:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735896951;
	cv=none; b=ItUUyKrb9Gg/6OCk1FJoJ6gnOu+VgcPA5OkPq7F5oQzT4WoT65ZrsmtkpFZSaiqkaEQHpO6cup9PFiF4Uc9+jP7xsI/ni5o68f0HxlDjGisAcgB3nJ3c70rSMND97z6MWRznDMGAD+yXIUDN/LDFEDeuYiLeTWQhWgpkqqPZqTgrrMbo1r85Ore9Xa4ehXAnz5bh/no9VGJI0VukqfNryWmMiNbia4M/xJcrW9WkNnKxoi3DUsHhiVMkRkXII/3UHwDQeFs4nPCH3OiWPFBoVoKnZOgSzGgE9ol6AfUkvxkv5eUg7AkYx+aGlgsuWXTCHkifHZtlVWpknW7GlllzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735896951; c=relaxed/relaxed;
	bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aMEqSNTFKC6FSUKb3T4I9x/TBJhFzoS2cbJ2oIpCxITQx/UgAjHzOgmFdWjbJzNDLM8maDjTLs1HHKpgCNjjF8tl9jaE/uSCUlu4fRBOAlnJnlMjrm0ScoSHLGfjSzJerRagyrL4Gh1/jIfSuARVlTT1eAbY6H1UmykYTG8MyoVN/i/41JQLuoWWp72YAQHerRtpPcQVM7V2uMk+BAp9x3M5rLh+db80M739UudnsaSkGzabunds43UIEfD0f58cvHRkKz6Vx5ipymGfC436R1g01UoV8goekQ7YqkJtEVvYLP6eS1USYeuDEunJ8vZ0LtLQEJd32Dscx2SiShbTpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OIRkY9rk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OIRkY9rk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPdjc60Nxz30TJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 20:35:47 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21654fdd5daso156330225ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 01:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735896946; x=1736501746; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=;
        b=OIRkY9rkJd11hgRofrAbBL9iPZDDDOAhNAtNHQt2WowLhX8wXQfuMqJShfgqcIqF/g
         +1863/heaNAe266pA/+o0yd4SJxNyShW9W20JrkjRO3UqUFvOThnndHousGvSNoL7dNG
         n+YaaF92A7SuvMmggWaKAHXRBEHn3EeCg95N+9ZgnjMSUNSD4zS0LiQhBNoeZiPBtyaL
         pBnscjHAvUA9jgZ95vq32bVRVO82mowzoxCrXFVZFc+AT7PK0/x9wq/creRQTpPRlaZb
         HdXvgm6OVC46CVf/J8+HXQERk4Nz/Q95xR7yAoj1YUCUglLnwgBSMuLkOXmpXX2fQoj5
         lSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896946; x=1736501746;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=;
        b=Av1UXJ8OVT1MWobB5c8ZihoBZY9rAJcrBXLtO+Y5GcK4UwrLEUBx4x1JekPcr+W0IZ
         T/kJm6gvS0oLCBC9gFGT6etUqofbNKNTgqinosK4Rkd1lid6ipzDX9INc92pChYRKMoS
         7A3VL/CMTA+ECTeXfQqdRSH/4GxV70sLyq2l/vHvcKx7F9/1RLMnX2nX/A1gCgzPdUTm
         s9Xyug2d/sAPZHFnkWtmwBQLCT8IY0C5oZU44gnRb1skdUwbYZhu9ji6z9Kh3kB2mREy
         8ajCgpa829mM/sTsqjHonBWxLR0zdOy6DaCY5Jo0ac4/MS4nrf+9KuElEk6zIQhMBdh1
         vx5A==
X-Forwarded-Encrypted: i=1; AJvYcCUEOzTwfbSsFRXn4B9nHyDSHwgpDbCT14v6uJ4Z2tAz7U44lsvjRZG39Du79nEEf5hFUpvCnrUpl5p8W2I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwvdLF3wYgAWJcnJfpQOjU63m3b6k5SpXxxV4iB+/6r0ZfJ320E
	vt/fMJO87jnR+M4keDgwKN4bk20+j9zoru3MLr36NhcfRk9IqzLY9xolzODERMg=
X-Gm-Gg: ASbGnct2OW1SMz9uiAiDenF4+SFWaTGInR0yaBPH8k8wu+Q9HM0IfytfQHL9+qYMpjL
	i43vDEa3XXUT24+NopFG9wdx0moOuTMF6dhWX3JoV5MP3ROL4YyamIbNSOorLwYV09pd7FtfPRA
	vdW+EduVYRQfi60hp5RHnGX9jzaoRqlc3DqJ7odt9wq2ZSuVS/RR/8U1tyREmcJURWzwnyzQ2Eh
	9xgK5BB7oBQCsLuof0jzGRmJR+F7xXhJtpl1sfKaW0KI67QSmWmxoa1PQPWs4CcBgooAqqNh0sS
	BiakLw==
X-Google-Smtp-Source: AGHT+IE9O96BS3RyGLgD9ozZE9cvlEJyEf8vCWPZNZOt2fNtD1RyepOtwaueaYCtTF24hvZZQqYEyw==
X-Received: by 2002:a17:902:d481:b0:215:6fcd:6cd1 with SMTP id d9443c01a7336-219e6e8c508mr551854195ad.7.1735896945927;
        Fri, 03 Jan 2025 01:35:45 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cddf2sm241537305ad.166.2025.01.03.01.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:35:45 -0800 (PST)
Message-ID: <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
Date: Fri, 3 Jan 2025 17:35:30 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Content-Language: en-US
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, peterz@infradead.org
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
In-Reply-To: <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/3 17:13, Qi Zheng wrote:
> 
> 
> On 2025/1/3 16:02, Kevin Brodsky wrote:
>> On 03/01/2025 04:48, Qi Zheng wrote:
>>> Hi Kevin,
>>>
>>> On 2025/1/3 00:53, Kevin Brodsky wrote:
>>>> On 30/12/2024 10:07, Qi Zheng wrote:
>>>>>    static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb,
>>>>> void *pt)
>>>>>    {
>>>>> -    if (riscv_use_sbi_for_rfence())
>>>>> +    if (riscv_use_sbi_for_rfence()) {
>>>>>            tlb_remove_ptdesc(tlb, pt);
>>>>> -    else
>>>>> +    } else {
>>>>> +        pagetable_dtor(pt);
>>>>>            tlb_remove_page_ptdesc(tlb, pt);
>>>>
>>>> I find the imbalance pretty confusing: pagetable_dtor() is called
>>>> explicitly before using tlb_remove_page() but not tlb_remove_ptdesc().
>>>> Doesn't that assume that CONFIG_MMU_GATHER_HAVE_TABLE_FREE is selected?
>>>> Could we not call pagetable_dtor() from 
>>>> __tlb_batch_free_encoded_pages()
>>>> to ensure that the dtor is always called just before freeing, and 
>>>> remove
>>>
>>> In __tlb_batch_free_encoded_pages(), we can indeed detect PageTable()
>>> and call pagetable_dtor() to dtor the page table pages.
>>> But __tlb_batch_free_encoded_pages() is also used to free normal pages
>>> (not page table pages), so I don't want to add overhead there.
>>
>> Interesting, can a tlb batch refer to pages than are not PTPs then?
> 
> Yes, you can see the caller of __tlb_remove_folio_pages() or 
> tlb_remove_page_size().
> 
>>
>>>
>>> But now I think maybe we can do this in tlb_remove_page_ptdesc(), like
>>> this:
>>>
>>> diff --git a/arch/csky/include/asm/pgalloc.h
>>> b/arch/csky/include/asm/pgalloc.h
>>> index f1ce5b7b28f22..e45c7e91dcbf9 100644
>>> --- a/arch/csky/include/asm/pgalloc.h
>>> +++ b/arch/csky/include/asm/pgalloc.h
>>> @@ -63,7 +63,6 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>>>
>>>   #define __pte_free_tlb(tlb, pte, address)              \
>>>   do {                                                   \
>>> -       pagetable_dtor(page_ptdesc(pte));               \
>>>          tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));  \
>>>   } while (0)
>>>
>>> [...]
>>>
>>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>>> index a96d4b440f3da..a59205863f431 100644
>>> --- a/include/asm-generic/tlb.h
>>> +++ b/include/asm-generic/tlb.h
>>> @@ -506,6 +506,7 @@ static inline void tlb_remove_ptdesc(struct
>>> mmu_gather *tlb, void *pt)
>>>   /* Like tlb_remove_ptdesc, but for page-like page directories. */
>>>   static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb,
>>> struct ptdesc *pt)
>>>   {
>>> +       pagetable_dtor(pt);
>>>          tlb_remove_page(tlb, ptdesc_page(pt));
>>>   }
>>
>> I think this is an interesting idea, it does make arch code easier to
>> follow. OTOH it would have been more natural to me to call
>> pagetable_dtor() from tlb_remove_page(). I can however see that this
>> doesn't work, because tlb_remove_table() is defined as tlb_remove_page()
>> if CONFIG_MMU_GATHER_HAVE_TABLE_FREE isn't selected. Which brings me
>> back to my earlier question: in that case, aren't we missing a call to
>> pagetable_dtor() when using tlb_remove_table() (or tlb_remove_ptdesc())?
> 
> Thank you for pointing this out!
> 
> Now, there are the following architectures selected 
> CONFIG_MMU_GATHER_RCU_TABLE_FREE:
> 
> 1. arm: select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
> 2. arm64: select MMU_GATHER_RCU_TABLE_FREE
> 3. powerpc: select MMU_GATHER_RCU_TABLE_FREE
> 4. riscv: select MMU_GATHER_RCU_TABLE_FREE if SMP && MMU
> 5. s390: select MMU_GATHER_RCU_TABLE_FREE
> 6. sparc: select MMU_GATHER_RCU_TABLE_FREE if SMP
> 7. x86: select MMU_GATHER_RCU_TABLE_FREE    if PARAVIRT
> 
> If CONFIG_MMU_GATHER_TABLE_FREE is selected, an architecture is expected
> to provide __tlb_remove_table(). This patch series modifies the
> __tlb_remove_table() in arm, arm64, riscv, s390 and x86. Among them,
> arm64 and s390 unconditionally select MMU_GATHER_RCU_TABLE_FREE, so we
> only need to double-check arm, riscv and x86.
> 
> For x86, it was called tlb_remove_page() in the non-PARAVIRT case, and I
> added pagetable_dtor() for it explicitly (see patch #11), so this should
> be no problem.
> 
> For riscv, it will only call tlb_remove_ptdesc() in the case of
> SMP && MMU, so this should be no problem.
> 
> For arm, the call to pagetable_dtor() is indeed missed in the
> non-MMU_GATHER_RCU_TABLE_FREE case. This needs to be fixed. But we
> can't fix this by adding pagetable_dtor() to tlb_remove_table(),
> because some architectures call tlb_remove_table() but don't support
> page table statistics, like sparc.
> 
> So a more direct fix might be:
> 
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index a59205863f431..0a131444a18ca 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -500,6 +500,9 @@ static inline void tlb_remove_page(struct mmu_gather 
> *tlb, struct page *page)
> 
>   static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
>   {
> +#ifndef CONFIG_MMU_GATHER_TABLE_FREE
> +       pagetable_dtor(pt);
> +#endif
>          tlb_remove_table(tlb, pt);
>   }
> 
> Or fix it directly in arm? Like the following:
> 
> diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
> index ea4fbe7b17f6f..cf5d0ca021440 100644
> --- a/arch/arm/include/asm/tlb.h
> +++ b/arch/arm/include/asm/tlb.h
> @@ -43,6 +43,9 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, 
> unsigned long addr)
>          __tlb_adjust_range(tlb, addr - PAGE_SIZE, 2 * PAGE_SIZE);
>   #endif
> 
> +#ifndef CONFIG_MMU_GATHER_TABLE_FREE
> +       pagetable_dtor(ptdesc);
> +#endif
>          tlb_remove_ptdesc(tlb, ptdesc);
>   }

Or can we just not let tlb_remove_table() fall back to
tlb_remove_page()? Like the following:

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index a59205863f431..354ffaa4bd120 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -195,8 +195,6 @@
   *  various ptep_get_and_clear() functions.
   */

-#ifdef CONFIG_MMU_GATHER_TABLE_FREE
-
  struct mmu_table_batch {
  #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
         struct rcu_head         rcu;
@@ -219,16 +217,6 @@ static inline void __tlb_remove_table(void *table)

  extern void tlb_remove_table(struct mmu_gather *tlb, void *table);

-#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
-
-/*
- * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have 
page based
- * page directories and we can use the normal page batching to free them.
- */
-#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
-
-#endif /* CONFIG_MMU_GATHER_TABLE_FREE */
-
  #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
  /*
   * This allows an architecture that does not use the linux page-tables for

> 
> Thanks,
> Qi
> 
>>
>> - Kevin

