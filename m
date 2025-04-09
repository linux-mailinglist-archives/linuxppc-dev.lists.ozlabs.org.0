Return-Path: <linuxppc-dev+bounces-7561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB69A828A8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Apr 2025 16:50:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZXm8m4LmHz2yg0;
	Thu, 10 Apr 2025 00:50:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744210248;
	cv=none; b=bTvVKPWeT05sUOPT4F9Iu1XvYe92sxNAouuBoBih9VpFuQ1RD2y8lAYNJHyXV2cw2YiUErAMNnO8ld7YZ6TvZBZqtJXTXc/UqNV1UgV051UTfn+Z5N4hSmWsf5PNxbkEvOxkQdtEDgO5CLA8RDL0CFNZUtseM106b1vC9oikc3CQwzlrKCADuPQpJiXZS4Qnz/2soJ4g7wQ41mEVggE7T9dQGLrQ1OxqSoxmSmwfzSKU33XAbYL0W2UaH61B5AQ1MxovHAY5hlgDWyRfGmFn6vEVVPwxFwzZPygkVpK0Ol3UXirJRmGxyJ8FXwLXM92ebTpplbe1g6G//4Nv4/XAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744210248; c=relaxed/relaxed;
	bh=ysq3Coq358H4yMpQcctd5puOMXBWwelZzURuknrY7ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0v9gg8UAdrPnC3ZJVZuQwDVR+a4vi931AP0tyYuxXlwYMM1b8QodP/nfHCykMAwIWfBnRr9D9gyS4FThuTj7TBC2rVr4ls4gPetKM6mb1tVeN6pPRu80AYC1B0c4K5q9fHayg87HT+Fdc83FSyPFTtKchAcmfz921PFQZpr9V5sca1EOI9go4tM6A3IZAx85Xpk8S0S59bTrlgqGZBsPtrObfOLDzilgvgQ3aEmQ3xl6Zii4xwueAS+8OESUA7qEuHjJswSUBW3XtIUyxvXHyp4NbYG79iy53LPRcjt0os67B8B1p22E2R4VJzH21fpSagKa72740E+uwH76d42zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZXm8l3HJ7z2ySh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 00:50:45 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52F3115A1;
	Wed,  9 Apr 2025 07:50:13 -0700 (PDT)
Received: from [10.57.67.254] (unknown [10.57.67.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58A653F59E;
	Wed,  9 Apr 2025 07:50:07 -0700 (PDT)
Message-ID: <99771f33-8ad8-4ba5-9cf0-f504588d99a0@arm.com>
Date: Wed, 9 Apr 2025 16:50:04 +0200
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
Subject: Re: [PATCH v2 02/12] x86: pgtable: Always use pte_free_kernel()
To: Matthew Wilcox <willy@infradead.org>, Dave Hansen <dave.hansen@intel.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
 <20250408095222.860601-3-kevin.brodsky@arm.com>
 <409d2019-a409-4e97-a16f-6b345b0f5a38@intel.com>
 <Z_VQxyqkU8DV7QGy@casper.infradead.org>
 <9247436d-ae01-4eb8-bd5d-370b2fb2eebc@intel.com>
 <Z_VfeFgrj23Oa0fX@casper.infradead.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <Z_VfeFgrj23Oa0fX@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 08/04/2025 19:40, Matthew Wilcox wrote:
> On Tue, Apr 08, 2025 at 09:54:42AM -0700, Dave Hansen wrote:
>> On 4/8/25 09:37, Matthew Wilcox wrote:
>>> On Tue, Apr 08, 2025 at 08:22:47AM -0700, Dave Hansen wrote:
>>>> Are there any tests for folio_test_pgtable() at free_page() time? If we
>>>> had that, it would make it less likely that another free_page() user
>>>> could sneak in without calling the destructor.
>>> It's hidden, but yes:
>>>
>>> static inline bool page_expected_state(struct page *page,
>>>                                         unsigned long check_flags)
>>> {
>>>         if (unlikely(atomic_read(&page->_mapcount) != -1))
>>>                 return false;
>>>
>>> PageTable uses page_type which aliases with mapcount, so this check
>>> covers "PageTable is still set when the last refcount to it is put".
>> Huh, so shouldn't we have ended up in bad_page() for these, other than:
>>
>>         pagetable_dtor(virt_to_ptdesc(pmd));
>>         free_page((unsigned long)pmd);
> I think at this point in Kevin's series, we don't call the ctor for
> these pages, so we never set PageTable() on them. I could be wrong;

Correct, that's why I added this patch early in the series (the next
patch adds the ctor call in pte_alloc_one_kernel()).

The BUG() in v1 was indeed triggered by a page_expected_state() check [1].

> as Kevin says, this is all very twisty and confusing with exceptions and
> exceptions to exceptions.  This series should reduce the confusion.

I hope so!

- Kevin

[1] https://lore.kernel.org/oe-lkp/202503211612.e11bd73f-lkp@intel.com/

