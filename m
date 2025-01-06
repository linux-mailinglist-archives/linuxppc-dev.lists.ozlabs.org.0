Return-Path: <linuxppc-dev+bounces-4680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EBCA01E58
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 04:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRKvN4x02z2yJL;
	Mon,  6 Jan 2025 14:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736135408;
	cv=none; b=l+uMgTNPzZEuRmC75Y/lDypJFlR9uMXulGwf0lOn6Xd5WNZHezuBpPWK/GzeXqTjX04rm2IhIV/LXmhMkp70Q5qJAk9LiF1cj4M/T0GeTN46D3lVQ35zrvAQMJsCLiZzn6mak6F676ec7xmQ4ReqmlGBgIrVsFMY5u02x2xrqo3sTmtZfBk3g4/Orcr6T7HAXKgw4IVvg6kccWVTPckGcc+6W5yL5aDtgoBle3ZKGEBD409X7JVBZGsARsGpNi2u0J9IKSyA1PXCEOL5jG3epkPGG7BGWSHs/cm1mOvixjrtMJo1pfF8dTBWIHieDNC1Xzvqpxxs4W9BVRbmzYjwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736135408; c=relaxed/relaxed;
	bh=M/CQCfwbCGmNbncAnjTVlLDBhrllfolDtdV4jFWfmgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VD39/6JJXOKf281kSm0Jv6bZzirQnZneP64KRV2GErxGNKQu3k5wOvoZmEQsgsXHRLhZ4H3mpL+mQiiEMDx6BEKVo+1yHySQfXpJmMKwBRfYsTz9Dn9H0Znkkf+KlP5mcdq1BHaHH5uTWC0wEQ2Lw2ZeNG7BwhXCwzNytIMYhOK0CenqnQ2RVfvfITqD8/oCnuyrgGefAAqkR36CRUpQNrirTZi37/lo5YsmI3ChVAdPteB3tsqHEn7ZtCtbDMUbDZmC8ZLgXNZ6tRd6FmJRzVYaN5QSHRxk+zOfLrvsVozSouROJ9KCwR89TlItpDs9BYtNNrtS6FOgtTfllNwjXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=M69sW6zv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=M69sW6zv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRKvK430Wz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 14:50:03 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso15664363a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jan 2025 19:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736135398; x=1736740198; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/CQCfwbCGmNbncAnjTVlLDBhrllfolDtdV4jFWfmgY=;
        b=M69sW6zvOu4P3RZaBBOujdUCXxNP+qi90xUkzqKMYyvEPY6lAb7MNUprwfLLjQWVrH
         L/UYR6xuYsjWE1E+VjWRVLoZjYoqVqnUJnkeO8eYRh0stCBlwzhQW95DCqo/mGPufThw
         N/W99ZsDxyHwMPdA+hILtjM60Mnnomq99ImLWlN5p5U1W01BEjxY9ba2cANfhE30aRyH
         rc+lYByiWzLvpbr94ZiXf+aMqFqNt9Buujmbt8jX27l8GjB+wSTl8S21EI4qzkPhcden
         aq3CK2ZYMnDF7jW+t1wwbpTiK0BReS97xxnvfmSD9tZLBYzRsG6GWql+N/sGSYx1NVhS
         bElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736135398; x=1736740198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/CQCfwbCGmNbncAnjTVlLDBhrllfolDtdV4jFWfmgY=;
        b=OLrRiZlEKHW7VMfW/CgQ88AA7CtbxkPNcCKOh/gXONZFGgZPqRDGv6BmwZX6iFduF8
         ZEoV813GUKk64fz1s4UQm5tRSfeYtrENKvKTF+NGpkNw93+pC3JMse5uTTYp+jBqo5i5
         TmOvlR6JSx5S4HG4/ReXyWTXiaqnbawfmejiH1KL/d+mlzxZZbWt5WEOE+g/+vgvQcRq
         3NG0817E+sBLZjpda4lm8NoVDhGfSYcHqpH81hPCm8LIBLpY9j9YxJyPq9m06JQuZv8f
         xTvS70dENuCoTKLS9Sn3nFA6HAyUgS9g9rTPh5kxuljDmoflmN9VpM16sJjOIewpdlZY
         2D0A==
X-Forwarded-Encrypted: i=1; AJvYcCVgbBPose8nQYXIviELhr9BOtOgyOX+yEcDFyBDnioOyyhnREYCp0dwm6kV2FNTChuwgfChCB/kWazOWTg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGNjfiqIci3hM+lGaA+4GhoCbeQT2eFj2aR0H9hQzX2jTRsjDT
	MBrZksyj5MICYZBVwegTxuxoQTWZwZXZm0nLha1YblaZzBCyp8IZu53naZiGi+4=
X-Gm-Gg: ASbGncv+pRT57yP3G8HSHCyK5HoSHp/379JUkxSGBeBswWuhX0u6L882Fwzzrj3Xqic
	QEFh08r3fJ70TRB22BwMk0IOljEOPEb+czJWgw+Dwuf8FOYnuAA2Chp/URSOXINa5/NnGTYNm/E
	LcU+ESO8eM8OGpZyz1rDNUYk1UpFcMGCw31N+I01yXqKCsCjt6eIkASvB7FPK5niBN/UH7wdMP0
	U7jGuJtPvwb0VBx0IzqNHIGVqhFgfnMMhCjHcYm3kAAlWMyCe13lh1rzmFT2L9C7SCATSXN3s3p
	aQYVjg==
X-Google-Smtp-Source: AGHT+IHpHJsHb9mpdlPf1WMyDHeUmOQ71xKKXnSQB+gdiLoxCAO6i7uhLAJzOXuDIN6Nxvn4zgv7zA==
X-Received: by 2002:a17:90b:53c8:b0:2ee:c2df:5d30 with SMTP id 98e67ed59e1d1-2f452eb11e2mr54849162a91.26.1736135398510;
        Sun, 05 Jan 2025 19:49:58 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447799048sm32821110a91.10.2025.01.05.19.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 19:49:58 -0800 (PST)
Message-ID: <de8756aa-dbf7-4f6f-91f0-934270397192@bytedance.com>
Date: Mon, 6 Jan 2025 11:49:41 +0800
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
To: Kevin Brodsky <kevin.brodsky@arm.com>, peterz@infradead.org,
 akpm@linux-foundation.org
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
 <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
 <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Kevin,

On 2025/1/3 21:27, Kevin Brodsky wrote:
> On 03/01/2025 10:35, Qi Zheng wrote:
>> On 2025/1/3 17:13, Qi Zheng wrote:
>>> On 2025/1/3 16:02, Kevin Brodsky wrote:
>>>> On 03/01/2025 04:48, Qi Zheng wrote:
>>>>> [...]
>>>>>
>>>>> In __tlb_batch_free_encoded_pages(), we can indeed detect PageTable()
>>>>> and call pagetable_dtor() to dtor the page table pages.
>>>>> But __tlb_batch_free_encoded_pages() is also used to free normal pages
>>>>> (not page table pages), so I don't want to add overhead there.
>>>>
>>>> Interesting, can a tlb batch refer to pages than are not PTPs then?
>>>
>>> Yes, you can see the caller of __tlb_remove_folio_pages() or
>>> tlb_remove_page_size().
> 
> I had a brief look but clearly not a good enough one! I hadn't realised
> that "table" in tlb_remove_table() means PTP, while "page" in
> tlb_remove_page() can mean any page, and it's making more sense now.
> 
> [...]
> 
>>>
>>> For arm, the call to pagetable_dtor() is indeed missed in the
>>> non-MMU_GATHER_RCU_TABLE_FREE case. This needs to be fixed. But we
>>> can't fix this by adding pagetable_dtor() to tlb_remove_table(),
>>> because some architectures call tlb_remove_table() but don't support
>>> page table statistics, like sparc.
> 
> When I investigated this for my own series, I found that the only case
> where ctor/dtor are not called for page-sized page tables is 32-bit
> sparc (see table at the end of [1]). However only 64-bit sparc makes use
> of tlb_remove_table() (at PTE level, where ctor/dtor are already called).

Thanks for providing this information.

> 
> So really calling pagetable_dtor() from tlb_remove_table() in the
> non-MMU_GATHER_TABLE_FREE case seems to be the obvious thing to do.

Right. Currently, only powerpc, sparc and x86 will directly call
tlb_remove_table(), and all of them are in the MMU_GATHER_TABLE_FREE
case. Therefore, I think the modification you mentioned below is
feasible.

In summary, currently only arm calls tlb_remove_table() in the
non-MMU_GATHER_RCU_TABLE_FREE case. So I think we can add this fix
directly to patch #8. If I haven't missed anything, I'll send an
updated patch #8.

> 
> Once this is done, we should be able to replace all those confusing
> calls to tlb_remove_page() on PTPs with tlb_remove_table() and remove
> the explicit call to pagetable_dtor(). AIUI this is essentially what
> Peter suggested on v3 [2].

Since this patch series is mainly for bug fix, I think that these things
can be done in separate patch series later.

> 
> [1]
> https://lore.kernel.org/linux-mm/20241219164425.2277022-1-kevin.brodsky@arm.com/
> [2]
> https://lore.kernel.org/linux-mm/20250103111457.GC22934@noisy.programming.kicks-ass.net/
> 
> [...]
> 
>> Or can we just not let tlb_remove_table() fall back to
>> tlb_remove_page()? Like the following:
>>
>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>> index a59205863f431..354ffaa4bd120 100644
>> --- a/include/asm-generic/tlb.h
>> +++ b/include/asm-generic/tlb.h
>> @@ -195,8 +195,6 @@
>>    *  various ptep_get_and_clear() functions.
>>    */
>>
>> -#ifdef CONFIG_MMU_GATHER_TABLE_FREE
>> -
>>   struct mmu_table_batch {
>>   #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
>>          struct rcu_head         rcu;
>> @@ -219,16 +217,6 @@ static inline void __tlb_remove_table(void *table)
>>
>>   extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
>>
>> -#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
>> -
>> -/*
>> - * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have
>> page based
>> - * page directories and we can use the normal page batching to free
>> them.
>> - */
>> -#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
> 
> We still need a different implementation of tlb_remove_table() in this
> case. We could define it inline here:
> 
> static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
> {
>      struct page *page = table;
> 
>      pagetable_dtor(page_ptdesc(page));
>      tlb_remove_page(page);
> }

Right. As I said above, will add this to the updated patch #8.

Thanks!

> 
> - Kevin

