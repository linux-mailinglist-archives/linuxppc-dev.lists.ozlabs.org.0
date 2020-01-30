Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD9514DCA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 15:15:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487j6x4QGJzDqYq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 01:15:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=qICZOrjf; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487j4l0wspzDqWQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 01:13:24 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 487j4Z2bp9z9v2Nx;
 Thu, 30 Jan 2020 15:13:18 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qICZOrjf; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uOkb5XiF-zPA; Thu, 30 Jan 2020 15:13:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 487j4Z13FJz9v2Nw;
 Thu, 30 Jan 2020 15:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580393598; bh=jiy8q+DLF/cyz8x0j+2VD0K/r6LzapCGUAMM8PPwAqg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qICZOrjfjgKU41D9G6qwOhWQ3f07+KjLwpAHo5DoCMTyruxB3bymqHi8naihrjRrd
 VNgNmAI2BgWTRJKP0fo15DiJvJYT/IAWdqQGaK6fSFCsfnDbh4zU2Oj9aR7VXIDKWw
 S5BQleimwSbi1BQRePhLQirIhOLqknAgD+VG9wXI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 606438B875;
 Thu, 30 Jan 2020 15:13:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id v9YV4qhIXl9S; Thu, 30 Jan 2020 15:13:19 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC2F68B874;
 Thu, 30 Jan 2020 15:13:16 +0100 (CET)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <68ed6488-aa25-ab41-8da6-f0ddeb15d52b@c-s.fr>
 <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
Date: Thu, 30 Jan 2020 15:13:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
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



Le 30/01/2020 à 14:04, Anshuman Khandual a écrit :
> 
> On 01/28/2020 10:35 PM, Christophe Leroy wrote:
>>
>>
>> Le 28/01/2020 à 02:27, Anshuman Khandual a écrit :
>>> diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
>>> index 0b6c4042942a..fb0e76d254b3 100644
>>> --- a/arch/x86/include/asm/pgtable_64.h
>>> +++ b/arch/x86/include/asm/pgtable_64.h
>>> @@ -53,6 +53,12 @@ static inline void sync_initial_page_table(void) { }
>>>      struct mm_struct;
>>>    +#define mm_p4d_folded mm_p4d_folded
>>> +static inline bool mm_p4d_folded(struct mm_struct *mm)
>>> +{
>>> +    return !pgtable_l5_enabled();
>>> +}
>>> +
>>
>> For me this should be part of another patch, it is not directly linked to the tests.
> 
> We did discuss about this earlier and Kirril mentioned its not worth
> a separate patch.
> 
> https://lore.kernel.org/linux-arm-kernel/20190913091305.rkds4f3fqv3yjhjy@box/

For me it would make sense to not mix this patch which implement tests, 
and changes that are needed for the test to work (or even build) on the 
different architectures.

But that's up to you.

> 
>>
>>>    void set_pte_vaddr_p4d(p4d_t *p4d_page, unsigned long vaddr, pte_t new_pte);
>>>    void set_pte_vaddr_pud(pud_t *pud_page, unsigned long vaddr, pte_t new_pte);
>>>    diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
>>> index 798ea36a0549..e0b04787e789 100644
>>> --- a/include/asm-generic/pgtable.h
>>> +++ b/include/asm-generic/pgtable.h
>>> @@ -1208,6 +1208,12 @@ static inline bool arch_has_pfn_modify_check(void)
>>>    # define PAGE_KERNEL_EXEC PAGE_KERNEL
>>>    #endif
>>>    +#ifdef CONFIG_DEBUG_VM_PGTABLE
>>
>> Not sure it is a good idea to put that in include/asm-generic/pgtable.h
> 
> Logically that is the right place, as it is related to page table but
> not something platform related.

I can't see any debug related features in that file.

> 
>>
>> By doing this you are forcing a rebuild of almost all files, whereas only init/main.o and mm/debug_vm_pgtable.o should be rebuilt when activating this config option.
> 
> I agreed but whats the alternative ? We could move these into init/main.c
> to make things simpler but will that be a right place, given its related
> to generic page table.

What about linux/mmdebug.h instead ? (I have not checked if it would 
reduce the impact, but that's where things related to CONFIG_DEBUG_VM 
seems to be).

Otherwise, you can just create new file, for instance 
<linux/mmdebug-pgtable.h> and include that file only in the init/main.c 
and mm/debug_vm_pgtable.c



> 
>>
>>> +extern void debug_vm_pgtable(void);
>>
>> Please don't use the 'extern' keyword, it is useless and not to be used for functions declaration.
> 
> Really ? But, there are tons of examples doing the same thing both in
> generic and platform code as well.

Yes, but how can we improve if we blindly copy the errors from the past 
? Having tons of 'extern' doesn't mean we must add more.

I think checkpatch.pl usually complains when a patch brings a new 
unreleval extern symbol.

> 
>>
>>> +#else
>>> +static inline void debug_vm_pgtable(void) { }
>>> +#endif
>>> +
>>>    #endif /* !__ASSEMBLY__ */
>>>      #ifndef io_remap_pfn_range
>>> diff --git a/init/main.c b/init/main.c
>>> index da1bc0b60a7d..5e59e6ac0780 100644
>>> --- a/init/main.c
>>> +++ b/init/main.c
>>> @@ -1197,6 +1197,7 @@ static noinline void __init kernel_init_freeable(void)
>>>        sched_init_smp();
>>>          page_alloc_init_late();
>>> +    debug_vm_pgtable();
>>
>> Wouldn't it be better to call debug_vm_pgtable() in kernel_init() between the call to async_synchronise_full() and ftrace_free_init_mem() ?
> 
> IIRC, proposed location is the earliest we could call debug_vm_pgtable().
> Is there any particular benefit or reason to move it into kernel_init() ?

It would avoid having it lost in the middle of drivers logs, would be 
close to the end of init, at a place we can't miss it, close to the 
result of other tests like CONFIG_DEBUG_RODATA_TEST for instance.

At the moment, you have to look for it to be sure the test is done and 
what the result is.

> 
>>
>>>        /* Initialize page ext after all struct pages are initialized. */
>>>        page_ext_init();
>>>    diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>>> index 5ffe144c9794..7cceae923c05 100644
>>> --- a/lib/Kconfig.debug
>>> +++ b/lib/Kconfig.debug
>>> @@ -653,6 +653,12 @@ config SCHED_STACK_END_CHECK
>>>          data corruption or a sporadic crash at a later stage once the region
>>>          is examined. The runtime overhead introduced is minimal.
>>>    +config ARCH_HAS_DEBUG_VM_PGTABLE
>>> +    bool
>>> +    help
>>> +      An architecture should select this when it can successfully
>>> +      build and run DEBUG_VM_PGTABLE.
>>> +
>>>    config DEBUG_VM
>>>        bool "Debug VM"
>>>        depends on DEBUG_KERNEL
>>> @@ -688,6 +694,22 @@ config DEBUG_VM_PGFLAGS
>>>            If unsure, say N.
>>>    +config DEBUG_VM_PGTABLE
>>> +    bool "Debug arch page table for semantics compliance"
>>> +    depends on MMU
>>> +    depends on DEBUG_VM
>>
>> Does it really need to depend on DEBUG_VM ?
> 
> No. It seemed better to package this test along with DEBUG_VM (although I
> dont remember the conversation around it) and hence this dependency.

Yes but it perfectly work as standalone. The more easy it is to activate 
and the more people will use it. DEBUG_VM obliges to rebuild the kernel 
entirely and could modify the behaviour. Could the helpers we are 
testing behave differently when DEBUG_VM is not set ? I think it's good 
the test things as close as possible to final config.

> 
>> I think we could make it standalone and 'default y if DEBUG_VM' instead.
> 
> Which will yield the same result like before but in a different way. But
> yes, this test could go about either way but unless there is a good enough
> reason why change the current one.

I think if we want people to really use it on other architectures it 
must be possible to activate it without having to modify Kconfig. 
Otherwise people won't even know the test exists and the architecture 
fails the test.

The purpose of a test suite is to detect bugs. If you can't run the test 
until you have fixed the bugs, I guess nobody will ever detect the bugs 
and they will never be fixed.

So I think:
- the test should be 'default y' when ARCH_HAS_DEBUG_VM_PGTABLE is selected
- the test should be 'default n' when ARCH_HAS_DEBUG_VM_PGTABLE is not 
selected, and it should be user selectable if EXPERT is selected.

Something like:

config DEBUG_VM_PGTABLE
     bool "Debug arch page table for semantics compliance" if 
ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
     depends on MMU
     default 'n' if !ARCH_HAS_DEBUG_VM_PGTABLE
     default 'y' if DEBUG_VM


> 
>>
>>> +    depends on ARCH_HAS_DEBUG_VM_PGTABLE
>>> +    default y
>>> +    help
>>> +      This option provides a debug method which can be used to test
>>> +      architecture page table helper functions on various platforms in
>>> +      verifying if they comply with expected generic MM semantics. This
>>> +      will help architecture code in making sure that any changes or
>>> +      new additions of these helpers still conform to expected
>>> +      semantics of the generic MM.
>>> +
>>> +      If unsure, say N.
>>> +
>>
>> Does it make sense to make it 'default y' and say 'If unsure, say N' ?
> 
> No it does. Not when it defaults 'y' unconditionally. Will drop the last
> sentence "If unsure, say N". Nice catch, thank you.

Well I was not asking if 'default y' was making sense but only if 'If 
unsure say N' was making sense due to the 'default y'. You got it.

Christophe
