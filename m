Return-Path: <linuxppc-dev+bounces-4623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E166DA00689
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 10:13:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPdCz2jPPz30Ss;
	Fri,  3 Jan 2025 20:13:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735895615;
	cv=none; b=ce2VA+AjLEGjz35nZHrJ+Kof5MFLRDkRxBqRwC76Ppi8IqhVi39UD41e6MPoYSVaoZHxFJBlCxh12YTV5m2ys/5bKZWQyWTcutAVUuYJl6qoaDbQ5y0KBPe4fXy4v1LzdPAbotnGLrCEXCpHdYINjiwDp+HghkBMAVqosHuBTcij+LS/LOz5obrAXDT4v9XXcu+BqFcdTjkHZf/2IMMR535D6irPqvuaufW0AprDJLftFZcJweLs/PbugZBKcQ7wTs76bs4R88k0bVD0jgGM6NBegYPmnYzQBmg6lq/QEKhbVkN2GmtmENlqj3oFq/i3Yy+7c+9sSltI6RgXMLGgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735895615; c=relaxed/relaxed;
	bh=FvjXC1OjFutvGYgxD2wHa2wTk86a/9lW5eStlVFSRNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDbkSVojnMgKq+HE7Ws7Dh6mgtUU/6qFbayPBYA5EMaPqCxSoKzvQK04IeRpYun4xz/zg+NwlHjmh0/kxVHIRczGZWy8ZsCib6VPPuqpNpgyLHGEt3WrjYBs6QZkjhIwefo3yQyGotdvfFGEQWBAJHFeQA6WNVNhy8zf69paFjxeNQ0vRRu8wkPETOi/bCfMtzKG0NwsqxmGIhzp2LvNlZ+ZZUXlZ3fZFSdfHwOWnHWGgau0sXUU3s/SBIOvfxbXWkQqc9VxvUHBrSTKzhlfUVXXcu43xjUiOA6HV8T0s/GHEWjhxXFxqhb5bOH/LHmBRRiXA8elpxwOfk037nuPJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IsOL+ffr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IsOL+ffr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPdCx1ZRYz30RS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 20:13:32 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2161eb95317so171558255ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 01:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735895609; x=1736500409; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FvjXC1OjFutvGYgxD2wHa2wTk86a/9lW5eStlVFSRNE=;
        b=IsOL+ffrQ4gAzZ5H8SX/MNpkFafXa8HMNak3V88A7c6u8szjrJ6DQcnasavNQ1QDnM
         1t602h8cSzh/3yhSDIdL0DH6CnxZk+neBbdpKm6ZWSDKW4V6QtKZpu+HV2WF5cooLRCM
         J0rlEcPzdspDrOeMbuAtRXOYoj/FVPh8nIALizj2y9fIQqEe4v6gi7zMVuu+CAOkjAAs
         jE8XdMQ7HUBxhRCZM99PC4luQD585ZWJ5rURbBmLNSLFIBO0ZGom0Kc5uIoOIYoj3NlZ
         OfdPPX8UWSf0Zy2vAOYETe3riLYFkgTCC1qVmw7gsw63iI3VbSAcNAGCeEYh5OYtnK7H
         d1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895609; x=1736500409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvjXC1OjFutvGYgxD2wHa2wTk86a/9lW5eStlVFSRNE=;
        b=kB965YJBuC80gVeUairsbC1qo+AgeMGXXEXNgMzzvWPTbtw8LcGv5J4Be5PQFbIpYf
         oZyVnpS4lVVACOGjiOZy9DdRkqWMoDNRG3Qv3ovu4Q35ks/e7nwSzOjsscq31e0h+C3n
         CFvvQm4mBz+p14kSH49gFstX+JD7Yv1ZzQZORlEwuWKki4ccg7LpJOy2lGNjiPmHYHla
         f7ZmIMhx0slhFxN2N+RifC+JlWDsdvIMsxMSMHmJIev2hiKAvFJLkC1agsJm+bAHhgx1
         5e3ho76M4lXp9Z2t+U7c+DYYJtuQ66swMXOhCjTsIemC+i9L6HkJTt45Y1/Y+Dvx1p4d
         hKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGtO/Cm8TXAxlWZZdC9rzVXLaALVE1TsZoALkvzLpFZipZZB+2py4HUzGaZoJpJ11crN8nLLvHQoUdsvs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysZkE3gejpHDi6469WQER9UjuChUyWj8a3LNILbkDy5Jr5nk3Y
	FOplkp+XbMzsAdEMNT0wUR9F94L14d3IDspEl1tyW0NUSj7ogjtgPhGIk7rVSdI=
X-Gm-Gg: ASbGnct+1mu+iONlOkEMUZMQi0X/1kd/uhS4PU6qFJdNHryr/IayqUAGQjv+t4b66Zv
	tMupQnkx6czwt5pQcXn/F3+0z0pRybZSnO4hV9IiAnMsIleSrZtJKtvhBjqOZxhe+nvqhMvUWtg
	pshhvKDHyCKwI1GUaou8WBn7lew6bsyo/FuMjkEt2+QzkuabUnGownj1F+Iaa1IQPyD9vbe8Fjl
	WV9et9J7gOBI8pa1SbQBkwuNsjo8nu2y8YnckyhUc1ocOto18eURLnLfi9QNrQ13upfRCbCcZED
	PLQ8Xw==
X-Google-Smtp-Source: AGHT+IEXJPN8gGhA2HYYDOMJlHA0eNtjpiDq/sKLXwKwTWFhE1ZE5FTpP/Am20/VMhak6uDuJsOrhQ==
X-Received: by 2002:a17:903:11d2:b0:215:a60d:bcc9 with SMTP id d9443c01a7336-219e6e89536mr708942765ad.2.1735895609241;
        Fri, 03 Jan 2025 01:13:29 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde19sm241412365ad.167.2025.01.03.01.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:13:27 -0800 (PST)
Message-ID: <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
Date: Fri, 3 Jan 2025 17:13:12 +0800
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
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/3 16:02, Kevin Brodsky wrote:
> On 03/01/2025 04:48, Qi Zheng wrote:
>> Hi Kevin,
>>
>> On 2025/1/3 00:53, Kevin Brodsky wrote:
>>> On 30/12/2024 10:07, Qi Zheng wrote:
>>>>    static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb,
>>>> void *pt)
>>>>    {
>>>> -    if (riscv_use_sbi_for_rfence())
>>>> +    if (riscv_use_sbi_for_rfence()) {
>>>>            tlb_remove_ptdesc(tlb, pt);
>>>> -    else
>>>> +    } else {
>>>> +        pagetable_dtor(pt);
>>>>            tlb_remove_page_ptdesc(tlb, pt);
>>>
>>> I find the imbalance pretty confusing: pagetable_dtor() is called
>>> explicitly before using tlb_remove_page() but not tlb_remove_ptdesc().
>>> Doesn't that assume that CONFIG_MMU_GATHER_HAVE_TABLE_FREE is selected?
>>> Could we not call pagetable_dtor() from __tlb_batch_free_encoded_pages()
>>> to ensure that the dtor is always called just before freeing, and remove
>>
>> In __tlb_batch_free_encoded_pages(), we can indeed detect PageTable()
>> and call pagetable_dtor() to dtor the page table pages.
>> But __tlb_batch_free_encoded_pages() is also used to free normal pages
>> (not page table pages), so I don't want to add overhead there.
> 
> Interesting, can a tlb batch refer to pages than are not PTPs then?

Yes, you can see the caller of __tlb_remove_folio_pages() or 
tlb_remove_page_size().

> 
>>
>> But now I think maybe we can do this in tlb_remove_page_ptdesc(), like
>> this:
>>
>> diff --git a/arch/csky/include/asm/pgalloc.h
>> b/arch/csky/include/asm/pgalloc.h
>> index f1ce5b7b28f22..e45c7e91dcbf9 100644
>> --- a/arch/csky/include/asm/pgalloc.h
>> +++ b/arch/csky/include/asm/pgalloc.h
>> @@ -63,7 +63,6 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>>
>>   #define __pte_free_tlb(tlb, pte, address)              \
>>   do {                                                   \
>> -       pagetable_dtor(page_ptdesc(pte));               \
>>          tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));  \
>>   } while (0)
>>
>> [...]
>>
>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>> index a96d4b440f3da..a59205863f431 100644
>> --- a/include/asm-generic/tlb.h
>> +++ b/include/asm-generic/tlb.h
>> @@ -506,6 +506,7 @@ static inline void tlb_remove_ptdesc(struct
>> mmu_gather *tlb, void *pt)
>>   /* Like tlb_remove_ptdesc, but for page-like page directories. */
>>   static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb,
>> struct ptdesc *pt)
>>   {
>> +       pagetable_dtor(pt);
>>          tlb_remove_page(tlb, ptdesc_page(pt));
>>   }
> 
> I think this is an interesting idea, it does make arch code easier to
> follow. OTOH it would have been more natural to me to call
> pagetable_dtor() from tlb_remove_page(). I can however see that this
> doesn't work, because tlb_remove_table() is defined as tlb_remove_page()
> if CONFIG_MMU_GATHER_HAVE_TABLE_FREE isn't selected. Which brings me
> back to my earlier question: in that case, aren't we missing a call to
> pagetable_dtor() when using tlb_remove_table() (or tlb_remove_ptdesc())?

Thank you for pointing this out!

Now, there are the following architectures selected 
CONFIG_MMU_GATHER_RCU_TABLE_FREE:

1. arm: select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
2. arm64: select MMU_GATHER_RCU_TABLE_FREE
3. powerpc: select MMU_GATHER_RCU_TABLE_FREE
4. riscv: select MMU_GATHER_RCU_TABLE_FREE if SMP && MMU
5. s390: select MMU_GATHER_RCU_TABLE_FREE
6. sparc: select MMU_GATHER_RCU_TABLE_FREE if SMP
7. x86: select MMU_GATHER_RCU_TABLE_FREE	if PARAVIRT

If CONFIG_MMU_GATHER_TABLE_FREE is selected, an architecture is expected
to provide __tlb_remove_table(). This patch series modifies the
__tlb_remove_table() in arm, arm64, riscv, s390 and x86. Among them,
arm64 and s390 unconditionally select MMU_GATHER_RCU_TABLE_FREE, so we
only need to double-check arm, riscv and x86.

For x86, it was called tlb_remove_page() in the non-PARAVIRT case, and I
added pagetable_dtor() for it explicitly (see patch #11), so this should
be no problem.

For riscv, it will only call tlb_remove_ptdesc() in the case of
SMP && MMU, so this should be no problem.

For arm, the call to pagetable_dtor() is indeed missed in the
non-MMU_GATHER_RCU_TABLE_FREE case. This needs to be fixed. But we
can't fix this by adding pagetable_dtor() to tlb_remove_table(),
because some architectures call tlb_remove_table() but don't support
page table statistics, like sparc.

So a more direct fix might be:

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index a59205863f431..0a131444a18ca 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -500,6 +500,9 @@ static inline void tlb_remove_page(struct mmu_gather 
*tlb, struct page *page)

  static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
  {
+#ifndef CONFIG_MMU_GATHER_TABLE_FREE
+       pagetable_dtor(pt);
+#endif
         tlb_remove_table(tlb, pt);
  }

Or fix it directly in arm? Like the following:

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ea4fbe7b17f6f..cf5d0ca021440 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -43,6 +43,9 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, 
unsigned long addr)
         __tlb_adjust_range(tlb, addr - PAGE_SIZE, 2 * PAGE_SIZE);
  #endif

+#ifndef CONFIG_MMU_GATHER_TABLE_FREE
+       pagetable_dtor(ptdesc);
+#endif
         tlb_remove_ptdesc(tlb, ptdesc);
  }

Thanks,
Qi

> 
> - Kevin

