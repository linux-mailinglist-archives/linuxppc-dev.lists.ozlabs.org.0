Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7988AAD31B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 08:28:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RdXX4kKqzDqQ0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 16:28:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46RdVV5q6MzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2019 16:26:56 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84286337;
 Sun,  8 Sep 2019 23:26:53 -0700 (PDT)
Received: from [10.162.43.129] (p8cg001049571a15.blr.arm.com [10.162.43.129])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 5676C3F67D; Sun,  8 Sep 2019 23:29:08 -0700 (PDT)
Subject: Re: [PATCH 1/1] mm/pgtable/debug: Add test validating architecture
 page table helpers
To: Gerald Schaefer <gerald.schaefer@de.ibm.com>
References: <1567497706-8649-1-git-send-email-anshuman.khandual@arm.com>
 <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
 <20190904221618.1b624a98@thinkpad>
 <20e3044d-2af5-b27b-7653-cec53bdec941@arm.com>
 <20190905190629.523bdb87@thinkpad>
 <3c609e33-afbb-ffaf-481a-6d225a06d1d0@arm.com>
 <20190906210346.5ecbff01@thinkpad>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <3d5de35f-8192-1c75-50a9-03e66e3b8e5c@arm.com>
Date: Mon, 9 Sep 2019 11:56:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190906210346.5ecbff01@thinkpad>
Content-Type: text/plain; charset=utf-8
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



On 09/07/2019 12:33 AM, Gerald Schaefer wrote:
> On Fri, 6 Sep 2019 11:58:59 +0530
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> On 09/05/2019 10:36 PM, Gerald Schaefer wrote:
>>> On Thu, 5 Sep 2019 14:48:14 +0530
>>> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>>   
>>>>> [...]    
>>>>>> +
>>>>>> +#if !defined(__PAGETABLE_PMD_FOLDED) && !defined(__ARCH_HAS_4LEVEL_HACK)
>>>>>> +static void pud_clear_tests(pud_t *pudp)
>>>>>> +{
>>>>>> +	memset(pudp, RANDOM_NZVALUE, sizeof(pud_t));
>>>>>> +	pud_clear(pudp);
>>>>>> +	WARN_ON(!pud_none(READ_ONCE(*pudp)));
>>>>>> +}    
>>>>>
>>>>> For pgd/p4d/pud_clear(), we only clear if the page table level is present
>>>>> and not folded. The memset() here overwrites the table type bits, so
>>>>> pud_clear() will not clear anything on s390 and the pud_none() check will
>>>>> fail.
>>>>> Would it be possible to OR a (larger) random value into the table, so that
>>>>> the lower 12 bits would be preserved?    
>>>>
>>>> So the suggestion is instead of doing memset() on entry with RANDOM_NZVALUE,
>>>> it should OR a large random value preserving lower 12 bits. Hmm, this should
>>>> still do the trick for other platforms, they just need non zero value. So on
>>>> s390, the lower 12 bits on the page table entry already has valid value while
>>>> entering this function which would make sure that pud_clear() really does
>>>> clear the entry ?  
>>>
>>> Yes, in theory the table entry on s390 would have the type set in the last
>>> 4 bits, so preserving those would be enough. If it does not conflict with
>>> others, I would still suggest preserving all 12 bits since those would contain
>>> arch-specific flags in general, just to be sure. For s390, the pte/pmd tests
>>> would also work with the memset, but for consistency I think the same logic
>>> should be used in all pxd_clear_tests.  
>>
>> Makes sense but..
>>
>> There is a small challenge with this. Modifying individual bits on a given
>> page table entry from generic code like this test case is bit tricky. That
>> is because there are not enough helpers to create entries with an absolute
>> value. This would have been easier if all the platforms provided functions
>> like __pxx() which is not the case now. Otherwise something like this should
>> have worked.
>>
>>
>> pud_t pud = READ_ONCE(*pudp);
>> pud = __pud(pud_val(pud) | RANDOM_VALUE (keeping lower 12 bits 0))
>> WRITE_ONCE(*pudp, pud);
>>
>> But __pud() will fail to build in many platforms.
> 
> Hmm, I simply used this on my system to make pud_clear_tests() work, not
> sure if it works on all archs:
> 
> pud_val(*pudp) |= RANDOM_NZVALUE;

Which compiles on arm64 but then fails on x86 because of the way pmd_val()
has been defined there. on arm64 and s390 (with many others) pmd_val() is
a macro which still got the variable that can be used as lvalue but that is
not true for some other platforms like x86.

arch/arm64/include/asm/pgtable-types.h:	#define pmd_val(x)	((x).pmd)
arch/s390/include/asm/page.h:		#define pmd_val(x)	((x).pmd)
arch/x86/include/asm/pgtable.h:		#define pmd_val(x)       native_pmd_val(x)

static inline pmdval_t native_pmd_val(pmd_t pmd)
{
        return pmd.pmd;
}

Unless I am mistaken, the return value from this function can not be used as
lvalue for future assignments.

mm/arch_pgtable_test.c: In function ‘pud_clear_tests’:
mm/arch_pgtable_test.c:156:17: error: lvalue required as left operand of assignment
  pud_val(*pudp) |= RANDOM_ORVALUE;
                 ^~
AFAICS pxx_val() were never intended to be used as lvalue and using it that way
might just happen to work on all those platforms which define them as macros.
They meant to just provide values for an entry as being determined by the platform.

In principle pxx_val() on an entry was not supposed to be modified directly from
generic code without going through (again) platform helpers for any specific state
change (write, old, dirty, special, huge etc). The current use case is a deviation
for that.

I originally went with memset() just to load up the entries with non-zero value so
that we know pxx_clear() are really doing the clearing. The same is being followed
for all pxx_same() checks.

Another way for fixing the problem would be to mark them with known attributes
like write/young/huge etc instead which for sure will create non-zero entries.
We can do that for pxx_clear() and pxx_same() tests and drop RANDOM_NZVALUE
completely. Does that sound good ?

> 
>>
>> The other alternative will be to make sure memset() happens on all other
>> bits except the lower 12 bits which will depend on endianness. If s390
>> has a fixed endianness, we can still use either of them which will hold
>> good for others as well.
>>
>> memset(pudp, RANDOM_NZVALUE, sizeof(pud_t) - 3);
>>
>> OR
>>
>> memset(pudp + 3, RANDOM_NZVALUE, sizeof(pud_t) - 3);
>>
>>>
>>> However, there is another issue on s390 which will make this only work
>>> for pud_clear_tests(), and not for the p4d/pgd_tests. The problem is that
>>> mm_alloc() will only give you a 3-level page table initially on s390.
>>> This means that pudp == p4dp == pgdp, and so the p4d/pgd_tests will
>>> both see the pud level (of course this also affects other tests).  
>>
>> Got it.
>>
>>>
>>> Not sure yet how to fix this, i.e. how to initialize/update the page table
>>> to 5 levels. We can handle 5 level page tables, and it would be good if
>>> all levels could be tested, but using mm_alloc() to establish the page
>>> tables might not work on s390. One option could be to provide an arch-hook
>>> or weak function to allocate/initialize the mm.  
>>
>> Sure, got it. Though I plan to do add some arch specific tests or init sequence
>> like the above later on but for now the idea is to get the smallest possible set
>> of test cases which builds and runs on all platforms without requiring any arch
>> specific hooks or special casing (#ifdef) to be agreed upon broadly and accepted.
>>
>> Do you think this is absolutely necessary on s390 for the very first set of test
>> cases or we can add this later on as an improvement ?
> 
> It can be added later, no problem. I did not expect this to work flawlessly
> on s390 right from the start anyway, with all our peculiarities, so don't
> let this hinder you. I might come up with an add-on patch later.

Sure.

> 
> Actually, using get_unmapped_area() as suggested by Kirill could also
> solve this issue. We do create a new mm with 3-level page tables on s390,
> and the dynamic upgrade to 4 or 5 levels is then triggered exactly by
> arch_get_unmapped_area(), depending on the addr. But I currently don't
> see how / where arch_get_unmapped_area() is set up for such a dummy mm
> created by mm_alloc().

Normally they are set during program loading but we can set it up explicitly
for the test mm_struct if we need to but there are some other challenges.

load_[aout|elf|flat|..]_binary()
	setup_new_exec()
		arch_pick_mmap_layout().

I did some initial experiments around get_unmapped_area(). Seems bit tricky
to get it working on a pure 'test' mm_struct. It expects a real user context
in the form of current->mm.

get_unmapped_area()
{
	....
	get_area = current->mm->get_unmapped_area;
	....
	addr = get_area(file, addr, len, pgoff, flags); {
		....
		struct mm_struct *mm = current->mm;
		....
		if (addr) {
			...
			vma = find_vma_prev(mm, addr, &prev);
		}
		....
		vm_unmapped_area() {
			struct mm_struct *mm = current->mm;
			....
			/* Walks across mm->mm_rb.rb_node */
		}
	}
	....
}	

Simple call like get_unmapped_area(NULL, 0, PAGE_SIZE, 0, 0) to get an
address fails right away on current->mm->get_unmapped_area which does
not have a valid value in the kernel context.

There might be two methods to get around this problem

1) Write a custom get_unmapped_area() imitating the real one but going
   around the problem by taking an appropriately initialized mm_struct
   instead of current->mm.

2) Create dummy user task with dummy mm, switch 'current' context before
   calling into get_unmapped_area() and switch back again. Dont know if
   this is even possible.

Wondering if this might deviate too much from the original goal of
testing the page table helpers.

Looking back again at the proposed test vaddr, wondering what will be the
real problem in case it goes beyond user address range ? Will pxx_alloc()
fail to create page table ranges at required level ? Apart from skipping
pgtable_page_ctor/dtor for page table pages, it might not really affect
any helpers as such.

VADDR_TEST (PGDIR_SIZE + [P4D_SIZE] + PUD_SIZE + PMD_SIZE + PAGE_SIZE)

OR

A random page aligned address in [FIRST_USER_ADDRESS..TASK_SIZE] range ?
