Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1AAE2AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 05:58:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SB8n0Vz4zDqT2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 13:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46SB6x3JRlzDqMf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 13:56:54 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D9AB28;
 Mon,  9 Sep 2019 20:56:51 -0700 (PDT)
Received: from [10.162.40.137] (p8cg001049571a15.blr.arm.com [10.162.40.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 249BA3F67D; Mon,  9 Sep 2019 20:56:40 -0700 (PDT)
Subject: Re: [PATCH 1/1] mm/pgtable/debug: Add test validating architecture
 page table helpers
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <1567497706-8649-1-git-send-email-anshuman.khandual@arm.com>
 <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
 <20190904221618.1b624a98@thinkpad>
 <20e3044d-2af5-b27b-7653-cec53bdec941@arm.com>
 <20190905190629.523bdb87@thinkpad>
 <3c609e33-afbb-ffaf-481a-6d225a06d1d0@arm.com>
 <20190906210346.5ecbff01@thinkpad>
 <3d5de35f-8192-1c75-50a9-03e66e3b8e5c@arm.com>
 <20190909151344.ghfypjbgxyosjdk3@box>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <5883d41a-8299-1584-aa3d-fac89b3d9b5b@arm.com>
Date: Tue, 10 Sep 2019 09:26:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190909151344.ghfypjbgxyosjdk3@box>
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
 linux-sh@vger.kernel.org, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 linux-snps-arc@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/09/2019 08:43 PM, Kirill A. Shutemov wrote:
> On Mon, Sep 09, 2019 at 11:56:50AM +0530, Anshuman Khandual wrote:
>>
>>
>> On 09/07/2019 12:33 AM, Gerald Schaefer wrote:
>>> On Fri, 6 Sep 2019 11:58:59 +0530
>>> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>>
>>>> On 09/05/2019 10:36 PM, Gerald Schaefer wrote:
>>>>> On Thu, 5 Sep 2019 14:48:14 +0530
>>>>> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>>>>   
>>>>>>> [...]    
>>>>>>>> +
>>>>>>>> +#if !defined(__PAGETABLE_PMD_FOLDED) && !defined(__ARCH_HAS_4LEVEL_HACK)
>>>>>>>> +static void pud_clear_tests(pud_t *pudp)
>>>>>>>> +{
>>>>>>>> +	memset(pudp, RANDOM_NZVALUE, sizeof(pud_t));
>>>>>>>> +	pud_clear(pudp);
>>>>>>>> +	WARN_ON(!pud_none(READ_ONCE(*pudp)));
>>>>>>>> +}    
>>>>>>>
>>>>>>> For pgd/p4d/pud_clear(), we only clear if the page table level is present
>>>>>>> and not folded. The memset() here overwrites the table type bits, so
>>>>>>> pud_clear() will not clear anything on s390 and the pud_none() check will
>>>>>>> fail.
>>>>>>> Would it be possible to OR a (larger) random value into the table, so that
>>>>>>> the lower 12 bits would be preserved?    
>>>>>>
>>>>>> So the suggestion is instead of doing memset() on entry with RANDOM_NZVALUE,
>>>>>> it should OR a large random value preserving lower 12 bits. Hmm, this should
>>>>>> still do the trick for other platforms, they just need non zero value. So on
>>>>>> s390, the lower 12 bits on the page table entry already has valid value while
>>>>>> entering this function which would make sure that pud_clear() really does
>>>>>> clear the entry ?  
>>>>>
>>>>> Yes, in theory the table entry on s390 would have the type set in the last
>>>>> 4 bits, so preserving those would be enough. If it does not conflict with
>>>>> others, I would still suggest preserving all 12 bits since those would contain
>>>>> arch-specific flags in general, just to be sure. For s390, the pte/pmd tests
>>>>> would also work with the memset, but for consistency I think the same logic
>>>>> should be used in all pxd_clear_tests.  
>>>>
>>>> Makes sense but..
>>>>
>>>> There is a small challenge with this. Modifying individual bits on a given
>>>> page table entry from generic code like this test case is bit tricky. That
>>>> is because there are not enough helpers to create entries with an absolute
>>>> value. This would have been easier if all the platforms provided functions
>>>> like __pxx() which is not the case now. Otherwise something like this should
>>>> have worked.
>>>>
>>>>
>>>> pud_t pud = READ_ONCE(*pudp);
>>>> pud = __pud(pud_val(pud) | RANDOM_VALUE (keeping lower 12 bits 0))
>>>> WRITE_ONCE(*pudp, pud);
>>>>
>>>> But __pud() will fail to build in many platforms.
>>>
>>> Hmm, I simply used this on my system to make pud_clear_tests() work, not
>>> sure if it works on all archs:
>>>
>>> pud_val(*pudp) |= RANDOM_NZVALUE;
>>
>> Which compiles on arm64 but then fails on x86 because of the way pmd_val()
>> has been defined there.
> 
> Use instead
> 
> 	*pudp = __pud(pud_val(*pudp) | RANDOM_NZVALUE);

Agreed.

As I had mentioned before this would have been really the cleanest approach.

> 
> It *should* be more portable.

Not really, because not all the platforms have __pxx() definitions right now.
Going with these will clearly cause build failures on affected platforms. Lets
examine __pud() for instance. It is defined only on these platforms.

arch/arm64/include/asm/pgtable-types.h:		#define __pud(x) ((pud_t) { (x) } )
arch/mips/include/asm/pgtable-64.h:		#define __pud(x) ((pud_t) { (x) })
arch/powerpc/include/asm/pgtable-be-types.h:	#define __pud(x) ((pud_t) { cpu_to_be64(x) })
arch/powerpc/include/asm/pgtable-types.h:	#define __pud(x) ((pud_t) { (x) })
arch/s390/include/asm/page.h:			#define __pud(x) ((pud_t) { (x) } )
arch/sparc/include/asm/page_64.h:		#define __pud(x) ((pud_t) { (x) } )
arch/sparc/include/asm/page_64.h:		#define __pud(x) (x)
arch/x86/include/asm/pgtable.h:			#define __pud(x) native_make_pud(x)

Similarly for __pmd()

arch/alpha/include/asm/page.h:			#define __pmd(x)  ((pmd_t) { (x) } )
arch/arm/include/asm/page-nommu.h:		#define __pmd(x)  (x)
arch/arm/include/asm/pgtable-2level-types.h:	#define __pmd(x)  ((pmd_t) { (x) } )
arch/arm/include/asm/pgtable-2level-types.h:	#define __pmd(x)  (x)
arch/arm/include/asm/pgtable-3level-types.h:	#define __pmd(x)  ((pmd_t) { (x) } )
arch/arm/include/asm/pgtable-3level-types.h:	#define __pmd(x)  (x)
arch/arm64/include/asm/pgtable-types.h:		#define __pmd(x)  ((pmd_t) { (x) } )
arch/m68k/include/asm/page.h:			#define __pmd(x)  ((pmd_t) { { (x) }, })
arch/mips/include/asm/pgtable-64.h:		#define __pmd(x)  ((pmd_t) { (x) } )
arch/nds32/include/asm/page.h:			#define __pmd(x)  (x)
arch/parisc/include/asm/page.h:			#define __pmd(x)  ((pmd_t) { (x) } )
arch/parisc/include/asm/page.h:			#define __pmd(x)  (x)
arch/powerpc/include/asm/pgtable-be-types.h:	#define __pmd(x)  ((pmd_t) { cpu_to_be64(x) })
arch/powerpc/include/asm/pgtable-types.h:	#define __pmd(x)  ((pmd_t) { (x) })
arch/riscv/include/asm/pgtable-64.h:		#define __pmd(x)  ((pmd_t) { (x) })
arch/s390/include/asm/page.h:			#define __pmd(x)  ((pmd_t) { (x) } )
arch/sh/include/asm/pgtable-3level.h:		#define __pmd(x)  ((pmd_t) { (x) } )
arch/sparc/include/asm/page_32.h:		#define __pmd(x)  ((pmd_t) { { (x) }, })
arch/sparc/include/asm/page_32.h:		#define __pmd(x)  ((pmd_t) { { (x) }, })
arch/sparc/include/asm/page_64.h:		#define __pmd(x)  ((pmd_t) { (x) } )
arch/sparc/include/asm/page_64.h:		#define __pmd(x)  (x)
arch/um/include/asm/page.h:			#define __pmd(x)  ((pmd_t) { (x) } )
arch/um/include/asm/page.h:			#define __pmd(x)  ((pmd_t) { (x) } )
arch/x86/include/asm/pgtable.h:			#define __pmd(x)  native_make_pmd(x)

Similarly for __pgd()

arch/alpha/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) } )
arch/alpha/include/asm/page.h:			#define __pgd(x)  (x)
arch/arc/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) })
arch/arc/include/asm/page.h:			#define __pgd(x)  (x)
arch/arm/include/asm/pgtable-3level-types.h:	#define __pgd(x)  ((pgd_t) { (x) } )
arch/arm/include/asm/pgtable-3level-types.h:	#define __pgd(x)  (x)
arch/arm64/include/asm/pgtable-types.h:		#define __pgd(x)  ((pgd_t) { (x) } )
arch/csky/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) })
arch/hexagon/include/asm/page.h:		#define __pgd(x)  ((pgd_t) { (x) })
arch/m68k/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) } )
arch/mips/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) } )
arch/nds32/include/asm/page.h:			#define __pgd(x)  (x)
arch/nios2/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) })
arch/openrisc/include/asm/page.h:		#define __pgd(x)  ((pgd_t) { (x) })
arch/parisc/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) } )
arch/parisc/include/asm/page.h:			#define __pgd(x)  (x)
arch/powerpc/include/asm/pgtable-be-types.h:	#define __pgd(x)  ((pgd_t) { cpu_to_be64(x) })
arch/powerpc/include/asm/pgtable-types.h:	#define __pgd(x)  ((pgd_t) { (x) })
arch/riscv/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) })
arch/s390/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) } )
arch/sh/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) } )
arch/sparc/include/asm/page_32.h:		#define __pgd(x)  ((pgd_t) { (x) } )
arch/sparc/include/asm/page_32.h:		#define __pgd(x)  (x)
arch/sparc/include/asm/page_64.h:		#define __pgd(x)  ((pgd_t) { (x) } )
arch/sparc/include/asm/page_64.h:		#define __pgd(x)  (x)
arch/um/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) } )
arch/unicore32/include/asm/page.h:		#define __pgd(x)  ((pgd_t) { (x) })
arch/unicore32/include/asm/page.h:		#define __pgd(x)  (x)
arch/x86/include/asm/pgtable.h:			#define __pgd(x)  native_make_pgd(x)
arch/xtensa/include/asm/page.h:			#define __pgd(x)  ((pgd_t) { (x) } )

Similarly for __p4d()

arch/s390/include/asm/page.h:			#define __p4d(x)  ((p4d_t) { (x) } )
arch/x86/include/asm/pgtable.h:			#define __p4d(x)  native_make_p4d(x)

The search pattern here has been "#define __pxx(". Unless I am missing something,
I dont see how we can use these without risking build failures.
