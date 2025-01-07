Return-Path: <linuxppc-dev+bounces-4762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B359A03CF7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 11:51:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS7C86BgPz30gM;
	Tue,  7 Jan 2025 21:51:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736247092;
	cv=none; b=kWoHxKqV+wKCjBNktvBREGBKwWhUs1uc71saCrnkQKkRjcd4LUR1+KSYPfivbaQI3eq9pvO2byyvxswxDTcLA8D0XGFfuYxLcGXyKOaH/diKF4sWV3ysZO51lDtXN2eClSR57tYIq3plwwugAbGqJz4gP/j6qnuETbZW9L4Pi2EA27ihq8BbgpIawC6K1a4QUeUuGp+nL0Twp/HUipN9/26af76BBvAW0y+q+RQzov0nfzHnEk1nPHcswCgdrCqghrej7h7016coF2+UTSYsdJ/eFP2AXvsRlAuqc5wnLah+1F6pB4kuO/D7O+nhtFdvJyEny6T16I/g9tSzn2DFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736247092; c=relaxed/relaxed;
	bh=ubzgdL9cLh9waK09x12ru+nh0CrFzuM9srghqESdiGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QL5z/Py+WPnUpvEaPzry0VvSoasr17NC3brXWTE+OkNUpgCcSSu+L5Mf7EJfALYN1ghmNAcHSA89EIMhZioiryMG0GtZCRhBTOUNzUA5e57QuUTq+kTVuZJPHQf1dk+cLOVJMj5/CmHJqzrOn6pZncc/KdzUkOMdfa+EFn15jgVokLPOniSg1x5yvutzGsO7VB+sIeIzYz1lO6nAmhmABonF7A50bCPhurg38OwYTGu/XM6RzxV5Z0S66bOEKYtG9gBAnb2nJyRuWmp1vUZoEJtzYMTIFKr1ov4Av2TrCUvEEMQvO8tgLhXTmKr1H7GOtzxn/7rl14iijeKGH4jQGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gLuDvuC3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gLuDvuC3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS7C64sNhz30gL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 21:51:28 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2163b0c09afso222020495ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 02:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736247083; x=1736851883; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubzgdL9cLh9waK09x12ru+nh0CrFzuM9srghqESdiGM=;
        b=gLuDvuC3jugNoNqEnMyqcZ2bsGBb6GWlpbmepORqUF6i1/5ghkSdyGyFfyoEKtu4iM
         uIyX7wuMwLWtGGE0xHhjPdeZPiY+p91ElXDaFawkaB452bVSR/7tiqe2Ghmo2G2iHF1E
         DZ1v8/Cj20YDSCtdcrlCi8WFQHgZd6YjJu2o8v8jfhzai0lZc6MfBXlTdjed7Q+d/irI
         diyaxpB9zoT6xu8dFuXalQm+Swj6J9Wg9QEPHKWg5H7OikUsvovFo28dwXL4CGFYRngU
         OVYyweHulBu+oS5R7qqRG8sUHO3F4EuX1JNLC011/jotRnk3vE05MQPyCb0UqZpKkhau
         +1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247083; x=1736851883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubzgdL9cLh9waK09x12ru+nh0CrFzuM9srghqESdiGM=;
        b=uqbbTR0FZpr5oa4vmkC/JoXaxe6TNSdE3NjpcQ6VZAXvIPlaR5QRbBOWcrIYXbBsoY
         jgR5dYCzMRV9uPYEUSFJCaxgNf8nnQ7nNh+dvAmz+VkERwSzI3uY5WCUuWrLkQw6dIFP
         C6c64Oi3DIWawAy2Tqz3Ebba5XASGHrMCV+mOp6X/MRVmYVuUvHbVSUryLgyY2TBG7Fq
         Sp+U0JIZxIt6KXprCorGDGeY3GjCeI6Yy+YZo7lCktH/m+mDX3ull1DoYbvxh8jUJckS
         Bb7F+9XGQVGHnsH9lMyw84pb1zZ5Aua6YQCJocuRjySoZcl/vGM77Q0UgsSrtmlB2YQ7
         gfaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMPv/bxAqjUGBwNgveOBp6uYyhLs8AdjgjJI2IwHIc1OUNKSkjgT5VZYxFV7+Nuk7Joo7T8u7EfYBhwvs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVkA2qO25n1rTdytCMkXakcqCeWLsxnqXkoq49IbbKlW+CCsPp
	VMYuIOvFUTyDRoZ7Midq1ci7UFdYXPB1/6fRdyyY9AKpv2xuzTyIX9OyGfa9GQk=
X-Gm-Gg: ASbGncuIop42A66fbcNt2uxPGl6Lf67l/r+Ix1XW4RxDe5SSu4C/a/lnB35B2qB1kcu
	hUrMVLCtUg5ts6c7gkZoIzPb2xqqpo9aPa7BJ32y/PMEfgNQANBWORsGMpp0bobGLMV3uQ9RHwH
	LfcHN2gs9//6vMSQmk6ISRNc4n0HAoT5SDb3lNQ2e0bz9O46lv2wgtRyCzQx4x9EKjXNjLDNS+O
	8kytyy9PiTcuZqvl6XKwfBCXR3Ttih/3RJ7xZi033bJiZticvJIvlPt4tLxtKmV7kFFnI9Q6R/d
	93Em
X-Google-Smtp-Source: AGHT+IFtbfiI9xlsmfuUVQ2Vnnc4auVp2ktX/5YZgw6vYG9rwgEZ2ifuqdpGqVP2TXFmBqefmQU79g==
X-Received: by 2002:a17:902:ea08:b0:216:7410:7e14 with SMTP id d9443c01a7336-219e6eb5c15mr809959765ad.34.1736247082763;
        Tue, 07 Jan 2025 02:51:22 -0800 (PST)
Received: from [10.4.33.153] ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca025d1sm307318475ad.254.2025.01.07.02.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 02:51:22 -0800 (PST)
Message-ID: <07e0c05f-cb69-4263-885d-6d20d4442152@bytedance.com>
Date: Tue, 7 Jan 2025 18:51:07 +0800
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
To: Kevin Brodsky <kevin.brodsky@arm.com>
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
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 peterz@infradead.org, akpm@linux-foundation.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
 <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
 <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
 <de8756aa-dbf7-4f6f-91f0-934270397192@bytedance.com>
 <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/7 17:57, Kevin Brodsky wrote:
> On 06/01/2025 04:49, Qi Zheng wrote:
>> [...]
>>
>>> Once this is done, we should be able to replace all those confusing
>>> calls to tlb_remove_page() on PTPs with tlb_remove_table() and remove
>>> the explicit call to pagetable_dtor(). AIUI this is essentially what
>>> Peter suggested on v3 [2].
>>
>> Since this patch series is mainly for bug fix, I think that these things
>> can be done in separate patch series later.
> 
> Sure that's fair.
> 
>>
>>>
>>> [...]
>>>
>>>> Or can we just not let tlb_remove_table() fall back to
>>>> tlb_remove_page()? Like the following:
>>>>
>>>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>>>> index a59205863f431..354ffaa4bd120 100644
>>>> --- a/include/asm-generic/tlb.h
>>>> +++ b/include/asm-generic/tlb.h
>>>> @@ -195,8 +195,6 @@
>>>>     *  various ptep_get_and_clear() functions.
>>>>     */
>>>>
>>>> -#ifdef CONFIG_MMU_GATHER_TABLE_FREE
>>>> -
>>>>    struct mmu_table_batch {
>>>>    #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
>>>>           struct rcu_head         rcu;
>>>> @@ -219,16 +217,6 @@ static inline void __tlb_remove_table(void *table)
>>>>
>>>>    extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
>>>>
>>>> -#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
>>>> -
>>>> -/*
>>>> - * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have
>>>> page based
>>>> - * page directories and we can use the normal page batching to free
>>>> them.
>>>> - */
>>>> -#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
>>>
>>> We still need a different implementation of tlb_remove_table() in this
>>> case. We could define it inline here:
>>>
>>> static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
>>> {
>>>       struct page *page = table;
>>>
>>>       pagetable_dtor(page_ptdesc(page));
>>>       tlb_remove_page(page);
>>> }
>>
>> Right. As I said above, will add this to the updated patch #8.
> 
> I think it would be preferable to make it a standalone patch, because
> this is a change to generic code that could in principle impact other
> arch's too.

Agree, I have done that:

```
Author: Qi Zheng <zhengqi.arch@bytedance.com>
Date:   Fri Dec 13 17:13:48 2024 +0800

     mm: pgtable: completely move pagetable_dtor() to generic 
tlb_remove_table()

     For the generic tlb_remove_table(), it is implemented in the 
following two
     forms:

     1) CONFIG_MMU_GATHER_TABLE_FREE is enabled

     tlb_remove_table
     --> generic __tlb_remove_table()

     2) CONFIG_MMU_GATHER_TABLE_FREE is disabled

     tlb_remove_table
     --> tlb_remove_page

     For case 1), the pagetable_dtor() has already been moved to generic
     __tlb_remove_table().

     For case 2), now only arm will call 
tlb_remove_table()/tlb_remove_ptdesc()
     when CONFIG_MMU_GATHER_TABLE_FREE is disabled. Let's move 
pagetable_dtor()
     completely to generic tlb_remove_table(), so that the architectures can
     follow more easily.

     Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index b8eebdb598631..ea4fbe7b17f6f 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -34,10 +34,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, 
unsigned long addr)
  {
         struct ptdesc *ptdesc = page_ptdesc(pte);

-#ifndef CONFIG_MMU_GATHER_TABLE_FREE
-       pagetable_dtor(ptdesc);
-#endif
-
  #ifndef CONFIG_ARM_LPAE
         /*
          * With the classic ARM MMU, a pte page has two corresponding pmd
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 69de47c7ef3c5..53ae7748f555b 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -220,14 +220,20 @@ static inline void __tlb_remove_table(void *table)

  extern void tlb_remove_table(struct mmu_gather *tlb, void *table);

-#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
+#else /* !CONFIG_MMU_GATHER_TABLE_FREE */

+static inline void tlb_remove_page(struct mmu_gather *tlb, struct page 
*page);
  /*
   * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have 
page based
   * page directories and we can use the normal page batching to free them.
   */
-#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
+static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
+{
+       struct page *page = (struct page *)table;

+       pagetable_dtor(page_ptdesc(page));
+       tlb_remove_page(tlb, page);
+}
  #endif /* CONFIG_MMU_GATHER_TABLE_FREE */

  #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
```

and will send v5 later.

Thanks!

> 
> - Kevin

