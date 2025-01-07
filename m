Return-Path: <linuxppc-dev+bounces-4770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ED8A03F27
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 13:31:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS9QZ6bSPz30ft;
	Tue,  7 Jan 2025 23:31:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736253094;
	cv=none; b=Q4OhAMgVPDytz/hJxF82w9BnIU4hhLC/StlOxQzFBSCVYWYvnP1jtSOIezZ5WN9eC1adRjCP/ynq0oEBPwCXuv2gC84axsfHiIAYH2H93AedGMUrSDXlSL30b1E684JtDXUShF1mOogO+10VV9oZZpbnTOzH/TsJqtg/xad8GpGo2NaMqJ/flnNt7j4Mb62W89QC2NLNfYZiAlT2rxQXfM61i+6lYGDvIKvZqxGLDqvt4U0H+YrTGj5134D7I+qXAEMVgaxK6SOHwkepVvs3rOAecxzYlwIzzDdP3fSz+zOLwKh15U4rycpiYiM3LHm9L1PkAZ0E0Zd9Bd61C1RCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736253094; c=relaxed/relaxed;
	bh=j2Sg0kNPwV4gGCFeUvrc0oDDUwUGkE4XjlNGrPro8W4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tj93DPm/oqPuyGj3N0CD8mHpr4lgdCChn3zf7HYkvcEqz5HvwPA2IsTZYNt0cnTbGoXMl727/dV1+KKUcoN5pduaevPF/fWlq3wk8eb40vNjNID3fm7OboMitZJwSBgsgKzU3OSQWLqayuS8HKCRtjflaK3xX7rRJZcMm2ybsXF186lQiVT7xcuZrs2oYoE7XnC38TW+onbDQp3etwOaM9Tkx2IgzwL/XDt324xFaijync+fLrSSi3FgC0kUqLKeAAl/YWhWlbX1Xqq3cGDZpPV5XvdfwZlI+aev9h2wGU4su8I/8lshHJFE6eI5F/Q0VywND5hTIqER5/rcDt1q0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Aos9/H0o; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Aos9/H0o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS9QX0fWPz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 23:31:30 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21619108a6bso209716755ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 04:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736253088; x=1736857888; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2Sg0kNPwV4gGCFeUvrc0oDDUwUGkE4XjlNGrPro8W4=;
        b=Aos9/H0oLIZE/YkNHaaCWnCiSeb9XKTCaRbsfca/Z4i9fiaC+6xq+V9bL9NxEYqrKO
         Gt6r/WaN/vAzH34vRX4SRWS6Dy0efSZkGlNJToeHzPDG8IWIvzr63XBN8TRpuW1x2SUa
         /OX1F03eYv03jmLUuuYbU21WehcBzKyPfAZXbxTgUbLpGQrE06aFa3Gg37MVbZTja7Mn
         p69wMY48Hucmkbu1AAzp8FsON/iNvtXWGx8LkkrwsWdl43GxsHUqLP71JEjiOcydx0am
         FcyRckoMP4XgX4LdDqLTiMJMuuIF0ldYm7sPk34UEw0tBUERsXMawq24ZAc6NWr0mghd
         cnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736253088; x=1736857888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2Sg0kNPwV4gGCFeUvrc0oDDUwUGkE4XjlNGrPro8W4=;
        b=LQSGEAOyI5yAaWzievcsu7/LQnLk7sYh6UzCjJiCRGKT5aVnCzwQHp8ZemCyzHfKcl
         ppp45eH0a8v5jvUT7X3fTpAVae5DeGWIZZ2U2ltdByEqyr9Hhvm4O2nnuLAfF6dcvkzU
         3jFOcVVY/20wgR8gdV8dVpRxkALZLVx5XYEMWmJ2s2fROtb1hIENaWztSF6hvxapANPn
         mOiLCFOs9Hi6gVPiuoJikZh6RZ2/xVHFdIosHl0jqUV4LAIR4vQRvyCRNhp/BCuRtw8X
         NXT6rMuuWMVPCrT9nmYueN8+memdtAGMmNysZKZApvbY24Cscgx8+SJLQuxyNaWZrfD8
         4Apg==
X-Forwarded-Encrypted: i=1; AJvYcCXMZKdjlxFFtG11e1k+fI0IXx2fz8Ij3Wj7YGyj2gr+EXwwRSrHTiX6fK25t3GgXKEBWL9eg3U8aURzzQE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzC89Y/GCefq9inyBxmiQgOEar998qPbv4hbeDiEK5UZEiYo9+q
	hK/x/9AfcMVTKxfC0iO8qo6vJHwfyUAL33alawjTIrtwt1koNIUI1iFT+NgW0+o=
X-Gm-Gg: ASbGncvXuP2UE1Rdss6FLIG1lbsC+onL+busmwWwwF/zqLpu3Dmsg73OAzYnbCbb4gE
	fpLFbHllJEKsxtUqSKzQppfrAyKpUgtJIQK++eC90MHnl2BzOlWVvG/3wM9GNSWq0o8PTOeN7AN
	UeG5RbNHsVCFrhqQQKm8XXx5zPDyUvNjwV6XRIbwr0PfrZxhlf2yBMMlnS8hln6ZAmDnq/A2k+h
	uuA4q7R10otZpVI+0VRuhaVJzA4hKJ1VazPwV8I2IcnpD0hPOl0tTOf7B1Y8hevjMdRpBO+GUDS
	ONEM
X-Google-Smtp-Source: AGHT+IHdrC/g0o4yqle0rmLjmhkyYNUhmDJ4pfXjCTmOvwgBk4798gzhlJqtML37UPom2J/Tnd9DQg==
X-Received: by 2002:a17:902:ce81:b0:216:282d:c692 with SMTP id d9443c01a7336-219e6ec1499mr788151455ad.34.1736253087824;
        Tue, 07 Jan 2025 04:31:27 -0800 (PST)
Received: from [10.4.33.153] ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca006fasm309326755ad.227.2025.01.07.04.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:31:27 -0800 (PST)
Message-ID: <fca0d7de-b563-4d11-9ed8-c6b8290c4cf9@bytedance.com>
Date: Tue, 7 Jan 2025 20:31:10 +0800
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
 <07e0c05f-cb69-4263-885d-6d20d4442152@bytedance.com>
 <4a0b5edb-6fc7-4df4-93d9-ca834e6a760b@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <4a0b5edb-6fc7-4df4-93d9-ca834e6a760b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/7 19:58, Kevin Brodsky wrote:
> On 07/01/2025 11:51, Qi Zheng wrote:
>> [...]
>>
>> Author: Qi Zheng <zhengqi.arch@bytedance.com>
>> Date:   Fri Dec 13 17:13:48 2024 +0800
>>
>>      mm: pgtable: completely move pagetable_dtor() to generic
>> tlb_remove_table()
>>
>>      For the generic tlb_remove_table(), it is implemented in the
>> following two
>>      forms:
>>
>>      1) CONFIG_MMU_GATHER_TABLE_FREE is enabled
>>
>>      tlb_remove_table
>>      --> generic __tlb_remove_table()
>>
>>      2) CONFIG_MMU_GATHER_TABLE_FREE is disabled
>>
>>      tlb_remove_table
>>      --> tlb_remove_page
>>
>>      For case 1), the pagetable_dtor() has already been moved to generic
>>      __tlb_remove_table().
>>
>>      For case 2), now only arm will call
>> tlb_remove_table()/tlb_remove_ptdesc()
>>      when CONFIG_MMU_GATHER_TABLE_FREE is disabled. Let's move
>> pagetable_dtor()
>>      completely to generic tlb_remove_table(), so that the
>> architectures can
>>      follow more easily.
>>
>>      Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

I missed your Suggested-by, will add it in v5.

>>
>> diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
>> index b8eebdb598631..ea4fbe7b17f6f 100644
>> --- a/arch/arm/include/asm/tlb.h
>> +++ b/arch/arm/include/asm/tlb.h
>> @@ -34,10 +34,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t
>> pte, unsigned long addr)
>>   {
>>          struct ptdesc *ptdesc = page_ptdesc(pte);
>>
>> -#ifndef CONFIG_MMU_GATHER_TABLE_FREE
>> -       pagetable_dtor(ptdesc);
>> -#endif
> 
> I guess this hunk will disappear since this call isn't present to start
> with.

Yes, I plan to add this in the patch #8, and remove it in this patch.

> 
>> -
>>   #ifndef CONFIG_ARM_LPAE
>>          /*
>>           * With the classic ARM MMU, a pte page has two corresponding pmd
>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>> index 69de47c7ef3c5..53ae7748f555b 100644
>> --- a/include/asm-generic/tlb.h
>> +++ b/include/asm-generic/tlb.h
>> @@ -220,14 +220,20 @@ static inline void __tlb_remove_table(void *table)
>>
>>   extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
>>
>> -#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
>> +#else /* !CONFIG_MMU_GATHER_TABLE_FREE */
> 
> Good catch!
> 
>>
>> +static inline void tlb_remove_page(struct mmu_gather *tlb, struct
>> page *page);
> 
> Nit: might be better to move the declaration up, e.g. above #ifdef
> CONFIG_MMU_GATHER_TABLE_FREE.

Now only the tlb_remove_table() below calls it, maybe it's better to
keep the impact to minimum?

> 
>>   /*
>>    * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have
>> page based
>>    * page directories and we can use the normal page batching to free
>> them.
>>    */
>> -#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
>> +static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
>> +{
>> +       struct page *page = (struct page *)table;
>>
>> +       pagetable_dtor(page_ptdesc(page));
>> +       tlb_remove_page(tlb, page);
>> +}
>>   #endif /* CONFIG_MMU_GATHER_TABLE_FREE */
>>
>>   #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
> 
> Looks good to me otherwise.

I will add your Reviewed-by to all patches (except yours) in v5, can
I also add it to this new added patch? (if we agree with the discussion
above) ;)

Thanks!

> 
> - Kevin

