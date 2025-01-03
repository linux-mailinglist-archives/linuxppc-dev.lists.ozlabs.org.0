Return-Path: <linuxppc-dev+bounces-4637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E56AA009EE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 14:27:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPksJ4jzKz30PH;
	Sat,  4 Jan 2025 00:27:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735910868;
	cv=none; b=T89+St30piA52aM9GCgRz3yXLzaPVtuMNvLbgpU86Ase5i3FWIKee4CaGl63ONFko33IWSKZBS8flVlfUL30I8SRG2z1+AKO77V1kcbuT2fkQpLRVQETOk8cD57KXNJlBrgzaWDb8EQglJlakBFIj2i+oD2s+cVGoGVXjiBOjwEUWfdlZqOEUDlzz4t45gi3ZDePU5zS8o0nsRniCeaAaNNEU9A1k5V5TZe/4oCYazgdy9YYupuTxwfVcB3EGYR+77uS2UuisBA/5o2aDsxNA0ZWTbm1Ka0RD0pqsRUb8isn6Kat8Zq3+4r2oru0Xg9B4goufm6K0aKHTtsqsvabOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735910868; c=relaxed/relaxed;
	bh=+8G2mn5XjC+6BvOgDwIaLzTXtQekFe6X8F8stkKVxBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCK7EbyGKyL9Ir0eiDdrUKG7UwnaH17wBqn+z0SJemiQ3rTDBNjxJIp2hrayggid+0j7rID0eLbYEXR0N1mofh0qsvIqxgT/UTiyZ5qbnJOTj9aEHPcTI+2W8+MLOmHUgQD0k3C0f1+V/klXDRR1UGw5ln0EPhNhLSl1adMu8ynxIZvzzEzeZ+dsQJNN8PUoQb9/S5BZIUZTRqrbXtP4fD9B81dIvXIBra+982cWXdU7V98LqERKK9D+eb5qvl6jnzNJF2uzMYTsIyFbf6XKRzMkQ46cwzfHLFS8fDYx4fXeTcsy7olYdwTv0QMx3Bzw0MJN52eLXB8Y0/7asv8oKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPksG6PSnz2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 00:27:45 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 330911480;
	Fri,  3 Jan 2025 05:27:39 -0800 (PST)
Received: from [10.44.160.93] (e126510-lin.lund.arm.com [10.44.160.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB2C23F673;
	Fri,  3 Jan 2025 05:27:02 -0800 (PST)
Message-ID: <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
Date: Fri, 3 Jan 2025 14:27:00 +0100
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
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org
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
 <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 03/01/2025 10:35, Qi Zheng wrote:
> On 2025/1/3 17:13, Qi Zheng wrote:
>> On 2025/1/3 16:02, Kevin Brodsky wrote:
>>> On 03/01/2025 04:48, Qi Zheng wrote:
>>>> [...]
>>>>
>>>> In __tlb_batch_free_encoded_pages(), we can indeed detect PageTable()
>>>> and call pagetable_dtor() to dtor the page table pages.
>>>> But __tlb_batch_free_encoded_pages() is also used to free normal pages
>>>> (not page table pages), so I don't want to add overhead there.
>>>
>>> Interesting, can a tlb batch refer to pages than are not PTPs then?
>>
>> Yes, you can see the caller of __tlb_remove_folio_pages() or
>> tlb_remove_page_size().

I had a brief look but clearly not a good enough one! I hadn't realised
that "table" in tlb_remove_table() means PTP, while "page" in
tlb_remove_page() can mean any page, and it's making more sense now.

[...]

>>
>> For arm, the call to pagetable_dtor() is indeed missed in the
>> non-MMU_GATHER_RCU_TABLE_FREE case. This needs to be fixed. But we
>> can't fix this by adding pagetable_dtor() to tlb_remove_table(),
>> because some architectures call tlb_remove_table() but don't support
>> page table statistics, like sparc.

When I investigated this for my own series, I found that the only case
where ctor/dtor are not called for page-sized page tables is 32-bit
sparc (see table at the end of [1]). However only 64-bit sparc makes use
of tlb_remove_table() (at PTE level, where ctor/dtor are already called).

So really calling pagetable_dtor() from tlb_remove_table() in the
non-MMU_GATHER_TABLE_FREE case seems to be the obvious thing to do.

Once this is done, we should be able to replace all those confusing
calls to tlb_remove_page() on PTPs with tlb_remove_table() and remove
the explicit call to pagetable_dtor(). AIUI this is essentially what
Peter suggested on v3 [2].

[1]
https://lore.kernel.org/linux-mm/20241219164425.2277022-1-kevin.brodsky@arm.com/
[2]
https://lore.kernel.org/linux-mm/20250103111457.GC22934@noisy.programming.kicks-ass.net/

[...]

> Or can we just not let tlb_remove_table() fall back to
> tlb_remove_page()? Like the following:
>
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index a59205863f431..354ffaa4bd120 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -195,8 +195,6 @@
>   *  various ptep_get_and_clear() functions.
>   */
>
> -#ifdef CONFIG_MMU_GATHER_TABLE_FREE
> -
>  struct mmu_table_batch {
>  #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
>         struct rcu_head         rcu;
> @@ -219,16 +217,6 @@ static inline void __tlb_remove_table(void *table)
>
>  extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
>
> -#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
> -
> -/*
> - * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have
> page based
> - * page directories and we can use the normal page batching to free
> them.
> - */
> -#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))

We still need a different implementation of tlb_remove_table() in this
case. We could define it inline here:

static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
{
    struct page *page = table;

    pagetable_dtor(page_ptdesc(page));
    tlb_remove_page(page);
}

- Kevin

