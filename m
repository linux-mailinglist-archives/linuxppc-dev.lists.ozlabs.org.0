Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEE7CF4C1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 10:14:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nVWY2QWXzDqNy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 19:14:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46nVTk6gM2zDqDL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2019 19:13:13 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C2581570;
 Tue,  8 Oct 2019 01:13:11 -0700 (PDT)
Received: from [10.162.40.139] (p8cg001049571a15.blr.arm.com [10.162.40.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 28D403F6C4; Tue,  8 Oct 2019 01:12:58 -0700 (PDT)
Subject: Re: [PATCH V4 2/2] mm/pgtable/debug: Add test validating architecture
 page table helpers
To: "Kirill A. Shutemov" <kirill@shutemov.name>, Ingo Molnar <mingo@kernel.org>
References: <1570427124-21887-1-git-send-email-anshuman.khandual@arm.com>
 <1570427124-21887-3-git-send-email-anshuman.khandual@arm.com>
 <20191007130617.GB56546@gmail.com> <20191007132607.4q537nauwfn5thol@box>
 <20191007135158.GA36360@gmail.com> <20191007140058.um5g44rvxyzyiref@box>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <881796fc-c35e-3790-a1ee-7031c6cdb38d@arm.com>
Date: Tue, 8 Oct 2019 13:43:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191007140058.um5g44rvxyzyiref@box>
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
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
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



On 10/07/2019 07:30 PM, Kirill A. Shutemov wrote:
> On Mon, Oct 07, 2019 at 03:51:58PM +0200, Ingo Molnar wrote:
>>
>> * Kirill A. Shutemov <kirill@shutemov.name> wrote:
>>
>>> On Mon, Oct 07, 2019 at 03:06:17PM +0200, Ingo Molnar wrote:
>>>>
>>>> * Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>>>
>>>>> This adds a test module which will validate architecture page table helpers
>>>>> and accessors regarding compliance with generic MM semantics expectations.
>>>>> This will help various architectures in validating changes to the existing
>>>>> page table helpers or addition of new ones.
>>>>>
>>>>> Test page table and memory pages creating it's entries at various level are
>>>>> all allocated from system memory with required alignments. If memory pages
>>>>> with required size and alignment could not be allocated, then all depending
>>>>> individual tests are skipped.
>>>>
>>>>> diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
>>>>> index 52e5f5f2240d..b882792a3999 100644
>>>>> --- a/arch/x86/include/asm/pgtable_64_types.h
>>>>> +++ b/arch/x86/include/asm/pgtable_64_types.h
>>>>> @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
>>>>>  #define pgtable_l5_enabled() 0
>>>>>  #endif /* CONFIG_X86_5LEVEL */
>>>>>  
>>>>> +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
>>>>> +
>>>>>  extern unsigned int pgdir_shift;
>>>>>  extern unsigned int ptrs_per_p4d;
>>>>
>>>> Any deep reason this has to be a macro instead of proper C?
>>>
>>> It's a way to override the generic mm_p4d_folded(). It can be rewritten
>>> as inline function + define. Something like:
>>>
>>> #define mm_p4d_folded mm_p4d_folded
>>> static inline bool mm_p4d_folded(struct mm_struct *mm)
>>> {
>>> 	return !pgtable_l5_enabled();
>>> }
>>>
>>> But I don't see much reason to be more verbose here than needed.
>>
>> C type checking? Documentation? Yeah, I know it's just a one-liner, but 
>> the principle of the death by a thousand cuts applies here.
> 
> Okay, if you think it worth it. Anshuman, could you fix it up for the next
> submission?

Sure, will do.

> 
> 
>> BTW., any reason this must be in the low level pgtable_64_types.h type 
>> header, instead of one of the API level header files?
> 
> I defined it next pgtable_l5_enabled(). What is more appropriate place to
> you? pgtable_64.h? Yeah, it makes sense.


Needs to be moved to arch/x86/include/asm/pgtable_64.h as well ?
