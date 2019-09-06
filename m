Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F161FAB285
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 08:30:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PnkM68sWzDr8r
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 16:30:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46PnhQ3fBszDqSY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 16:29:05 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2652828;
 Thu,  5 Sep 2019 23:29:03 -0700 (PDT)
Received: from [10.162.42.101] (p8cg001049571a15.blr.arm.com [10.162.42.101])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 EE03C3F67D; Thu,  5 Sep 2019 23:31:17 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 1/1] mm/pgtable/debug: Add test validating architecture
 page table helpers
To: Gerald Schaefer <gerald.schaefer@de.ibm.com>
References: <1567497706-8649-1-git-send-email-anshuman.khandual@arm.com>
 <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
 <20190904221618.1b624a98@thinkpad>
 <20e3044d-2af5-b27b-7653-cec53bdec941@arm.com>
 <20190905190629.523bdb87@thinkpad>
Message-ID: <3c609e33-afbb-ffaf-481a-6d225a06d1d0@arm.com>
Date: Fri, 6 Sep 2019 11:58:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190905190629.523bdb87@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/05/2019 10:36 PM, Gerald Schaefer wrote:
> On Thu, 5 Sep 2019 14:48:14 +0530
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>>> [...]  
>>>> +
>>>> +#if !defined(__PAGETABLE_PMD_FOLDED) && !defined(__ARCH_HAS_4LEVEL_HACK)
>>>> +static void pud_clear_tests(pud_t *pudp)
>>>> +{
>>>> +	memset(pudp, RANDOM_NZVALUE, sizeof(pud_t));
>>>> +	pud_clear(pudp);
>>>> +	WARN_ON(!pud_none(READ_ONCE(*pudp)));
>>>> +}  
>>>
>>> For pgd/p4d/pud_clear(), we only clear if the page table level is present
>>> and not folded. The memset() here overwrites the table type bits, so
>>> pud_clear() will not clear anything on s390 and the pud_none() check will
>>> fail.
>>> Would it be possible to OR a (larger) random value into the table, so that
>>> the lower 12 bits would be preserved?  
>>
>> So the suggestion is instead of doing memset() on entry with RANDOM_NZVALUE,
>> it should OR a large random value preserving lower 12 bits. Hmm, this should
>> still do the trick for other platforms, they just need non zero value. So on
>> s390, the lower 12 bits on the page table entry already has valid value while
>> entering this function which would make sure that pud_clear() really does
>> clear the entry ?
> 
> Yes, in theory the table entry on s390 would have the type set in the last
> 4 bits, so preserving those would be enough. If it does not conflict with
> others, I would still suggest preserving all 12 bits since those would contain
> arch-specific flags in general, just to be sure. For s390, the pte/pmd tests
> would also work with the memset, but for consistency I think the same logic
> should be used in all pxd_clear_tests.

Makes sense but..

There is a small challenge with this. Modifying individual bits on a given
page table entry from generic code like this test case is bit tricky. That
is because there are not enough helpers to create entries with an absolute
value. This would have been easier if all the platforms provided functions
like __pxx() which is not the case now. Otherwise something like this should
have worked.


pud_t pud = READ_ONCE(*pudp);
pud = __pud(pud_val(pud) | RANDOM_VALUE (keeping lower 12 bits 0))
WRITE_ONCE(*pudp, pud);

But __pud() will fail to build in many platforms.

The other alternative will be to make sure memset() happens on all other
bits except the lower 12 bits which will depend on endianness. If s390
has a fixed endianness, we can still use either of them which will hold
good for others as well.

memset(pudp, RANDOM_NZVALUE, sizeof(pud_t) - 3);

OR

memset(pudp + 3, RANDOM_NZVALUE, sizeof(pud_t) - 3);

> 
> However, there is another issue on s390 which will make this only work
> for pud_clear_tests(), and not for the p4d/pgd_tests. The problem is that
> mm_alloc() will only give you a 3-level page table initially on s390.
> This means that pudp == p4dp == pgdp, and so the p4d/pgd_tests will
> both see the pud level (of course this also affects other tests).

Got it.

> 
> Not sure yet how to fix this, i.e. how to initialize/update the page table
> to 5 levels. We can handle 5 level page tables, and it would be good if
> all levels could be tested, but using mm_alloc() to establish the page
> tables might not work on s390. One option could be to provide an arch-hook
> or weak function to allocate/initialize the mm.

Sure, got it. Though I plan to do add some arch specific tests or init sequence
like the above later on but for now the idea is to get the smallest possible set
of test cases which builds and runs on all platforms without requiring any arch
specific hooks or special casing (#ifdef) to be agreed upon broadly and accepted.

Do you think this is absolutely necessary on s390 for the very first set of test
cases or we can add this later on as an improvement ?

> 
> IIUC, the (dummy) mm is really only needed to provide an mm->pgd as starting
> point, right?

Right.
