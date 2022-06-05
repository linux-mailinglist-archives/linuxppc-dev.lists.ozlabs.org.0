Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B737A53DB3F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 12:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGCLW4F3Tz3c7V
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 20:20:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGCL573b1z2yWn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jun 2022 20:20:12 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 526A6D6E;
	Sun,  5 Jun 2022 03:19:41 -0700 (PDT)
Received: from [10.163.37.253] (unknown [10.163.37.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 477943F66F;
	Sun,  5 Jun 2022 03:19:32 -0700 (PDT)
Message-ID: <0de0e896-2c4b-55e5-9860-07227a5d3ef6@arm.com>
Date: Sun, 5 Jun 2022 15:49:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] mm/mmap: Restrict generic protection_map[] array
 visibility
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20220603101411.488970-1-anshuman.khandual@arm.com>
 <20220603101411.488970-2-anshuman.khandual@arm.com>
 <cd27ea20-73c1-443a-b6ad-6d22b8b1145f@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <cd27ea20-73c1-443a-b6ad-6d22b8b1145f@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
 , "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/3/22 17:48, Christophe Leroy wrote:
> 
> 
> Le 03/06/2022 à 12:14, Anshuman Khandual a écrit :
>> Restrict generic protection_map[] array visibility only for platforms which
>> do not enable ARCH_HAS_VM_GET_PAGE_PROT. For other platforms that do define
>> their own vm_get_page_prot() enabling ARCH_HAS_VM_GET_PAGE_PROT, could have
>> their private static protection_map[] still implementing an array look up.
>> These private protection_map[] array could do without __PXXX/__SXXX macros,
>> making them redundant and dropping them off.
>>
>> But platforms which do not define their custom vm_get_page_prot() enabling
>> ARCH_HAS_VM_GET_PAGE_PROT, will still have to provide __PXXX/__SXXX macros.
>> Although this now provides a method for other willing platforms to drop off
>> __PXXX/__SXX macros completely.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: x86@kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: sparclinux@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   arch/arm64/include/asm/pgtable-prot.h | 18 ------------------
>>   arch/arm64/mm/mmap.c                  | 21 +++++++++++++++++++++
>>   arch/powerpc/include/asm/pgtable.h    |  2 ++
>>   arch/powerpc/mm/book3s64/pgtable.c    | 20 ++++++++++++++++++++
>>   arch/sparc/include/asm/pgtable_32.h   |  2 ++
>>   arch/sparc/include/asm/pgtable_64.h   | 19 -------------------
>>   arch/sparc/mm/init_64.c               | 20 ++++++++++++++++++++
>>   arch/x86/include/asm/pgtable_types.h  | 19 -------------------
>>   arch/x86/mm/pgprot.c                  | 19 +++++++++++++++++++
>>   include/linux/mm.h                    |  2 ++
>>   mm/mmap.c                             |  2 +-
>>   11 files changed, 87 insertions(+), 57 deletions(-)
>>
> 
>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>> index d564d0ecd4cd..8ed2a80c896e 100644
>> --- a/arch/powerpc/include/asm/pgtable.h
>> +++ b/arch/powerpc/include/asm/pgtable.h
>> @@ -21,6 +21,7 @@ struct mm_struct;
>>   #endif /* !CONFIG_PPC_BOOK3S */
>>   
>>   /* Note due to the way vm flags are laid out, the bits are XWR */
>> +#ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
> 
> Ok, so until now it was common to all powerpc platforms. Now you define 
> a different way whether it is a PPC_BOOK3S_64 or another platform ? 
> What's the point ?

On powerpc,

select ARCH_HAS_VM_GET_PAGE_PROT        if PPC_BOOK3S_64

Currently protection_map[] which requires __PXXX/__SXXX macros,
is applicable on all platforms, irrespective whether they enable
ARCH_HAS_VM_GET_PAGE_PROT or not. But because protection_map[]
is being made private for ARCH_HAS_VM_GET_PAGE_PROT enabling
platforms, they will not require __PXXX/__SXXX macros anymore.

In this case, PPC_BOOK3S_64 does not require the macros anymore,
where as other powerpc platforms will still require them as they
depend on the generic protection_map[].

> 
>>   #define __P000	PAGE_NONE
>>   #define __P001	PAGE_READONLY
>>   #define __P010	PAGE_COPY
>> @@ -38,6 +39,7 @@ struct mm_struct;
>>   #define __S101	PAGE_READONLY_X
>>   #define __S110	PAGE_SHARED_X
>>   #define __S111	PAGE_SHARED_X
>> +#endif
>>   
>>   #ifndef __ASSEMBLY__
>>   
>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
>> index 7b9966402b25..2cf10a17c0a9 100644
>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> @@ -551,6 +551,26 @@ unsigned long memremap_compat_align(void)
>>   EXPORT_SYMBOL_GPL(memremap_compat_align);
>>   #endif
>>   
>> +/* Note due to the way vm flags are laid out, the bits are XWR */
>> +static pgprot_t protection_map[16] __ro_after_init = {
> 
> I don't think powerpc modifies that at all. Could be const instead of 
> ro_after_init.

Sure, will change that.

> 
>> +	[VM_NONE]					= PAGE_NONE,
>> +	[VM_READ]					= PAGE_READONLY,
>> +	[VM_WRITE]					= PAGE_COPY,
>> +	[VM_WRITE | VM_READ]				= PAGE_COPY,
>> +	[VM_EXEC]					= PAGE_READONLY_X,
>> +	[VM_EXEC | VM_READ]				= PAGE_READONLY_X,
>> +	[VM_EXEC | VM_WRITE]				= PAGE_COPY_X,
>> +	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_X,
>> +	[VM_SHARED]					= PAGE_NONE,
>> +	[VM_SHARED | VM_READ]				= PAGE_READONLY,
>> +	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
>> +	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
>> +	[VM_SHARED | VM_EXEC]				= PAGE_READONLY_X,
>> +	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY_X,
>> +	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED_X,
>> +	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_X
>> +};
> 
> That's nice but it could apply to all powerpc platforms. Why restrict it 
> to book3s/64 ?

Because as mentioned earlier, others powerpc platforms do not
enable ARCH_HAS_VM_GET_PAGE_PROT.

> 
>> +
>>   pgprot_t vm_get_page_prot(unsigned long vm_flags)
>>   {
>>   	unsigned long prot = pgprot_val(protection_map[vm_flags &
>> diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
>> index 4866625da314..bca98b280fdd 100644
>> --- a/arch/sparc/include/asm/pgtable_32.h
>> +++ b/arch/sparc/include/asm/pgtable_32.h
>> @@ -65,6 +65,7 @@ void paging_init(void);
>>   extern unsigned long ptr_in_current_pgd;
>>   
>>   /*         xwr */
>> +#ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
> 
> CONFIG_ARCH_HAS_VM_GET_PAGE_PROT is selected by sparc64 only, is that 
> ifdef needed at all ?

Not really necessary, but added just to tighten up.

> 
>>   #define __P000  PAGE_NONE
>>   #define __P001  PAGE_READONLY
>>   #define __P010  PAGE_COPY
>> @@ -82,6 +83,7 @@ extern unsigned long ptr_in_current_pgd;
>>   #define __S101	PAGE_READONLY
>>   #define __S110	PAGE_SHARED
>>   #define __S111	PAGE_SHARED
>> +#endif
>>   
>>   /* First physical page can be anywhere, the following is needed so that
>>    * va-->pa and vice versa conversions work properly without performance
>> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
>> index 4679e45c8348..a779418ceba9 100644
>> --- a/arch/sparc/include/asm/pgtable_64.h
>> +++ b/arch/sparc/include/asm/pgtable_64.h
>> @@ -187,25 +187,6 @@ bool kern_addr_valid(unsigned long addr);
>>   #define _PAGE_SZHUGE_4U	_PAGE_SZ4MB_4U
>>   #define _PAGE_SZHUGE_4V	_PAGE_SZ4MB_4V
>>   
>> -/* These are actually filled in at boot time by sun4{u,v}_pgprot_init() */
>> -#define __P000	__pgprot(0)
>> -#define __P001	__pgprot(0)
>> -#define __P010	__pgprot(0)
>> -#define __P011	__pgprot(0)
>> -#define __P100	__pgprot(0)
>> -#define __P101	__pgprot(0)
>> -#define __P110	__pgprot(0)
>> -#define __P111	__pgprot(0)
>> -
>> -#define __S000	__pgprot(0)
>> -#define __S001	__pgprot(0)
>> -#define __S010	__pgprot(0)
>> -#define __S011	__pgprot(0)
>> -#define __S100	__pgprot(0)
>> -#define __S101	__pgprot(0)
>> -#define __S110	__pgprot(0)
>> -#define __S111	__pgprot(0)
>> -
>>   #ifndef __ASSEMBLY__
>>   
>>   pte_t mk_pte_io(unsigned long, pgprot_t, int, unsigned long);
>> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
>> index f6174df2d5af..6edc2a68b73c 100644
>> --- a/arch/sparc/mm/init_64.c
>> +++ b/arch/sparc/mm/init_64.c
>> @@ -2634,6 +2634,26 @@ void vmemmap_free(unsigned long start, unsigned long end,
>>   }
>>   #endif /* CONFIG_SPARSEMEM_VMEMMAP */
>>   
>> +/* These are actually filled in at boot time by sun4{u,v}_pgprot_init() */
>> +static pgprot_t protection_map[16] __ro_after_init = {
>> +	[VM_NONE]					= __pgprot(0),
>> +	[VM_READ]					= __pgprot(0),
>> +	[VM_WRITE]					= __pgprot(0),
>> +	[VM_WRITE | VM_READ]				= __pgprot(0),
>> +	[VM_EXEC]					= __pgprot(0),
>> +	[VM_EXEC | VM_READ]				= __pgprot(0),
>> +	[VM_EXEC | VM_WRITE]				= __pgprot(0),
>> +	[VM_EXEC | VM_WRITE | VM_READ]			= __pgprot(0),
>> +	[VM_SHARED]					= __pgprot(0),
>> +	[VM_SHARED | VM_READ]				= __pgprot(0),
>> +	[VM_SHARED | VM_WRITE]				= __pgprot(0),
>> +	[VM_SHARED | VM_WRITE | VM_READ]		= __pgprot(0),
>> +	[VM_SHARED | VM_EXEC]				= __pgprot(0),
>> +	[VM_SHARED | VM_EXEC | VM_READ]			= __pgprot(0),
>> +	[VM_SHARED | VM_EXEC | VM_WRITE]		= __pgprot(0),
>> +	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= __pgprot(0)
>> +};
> 
> __pgprot(0) is 0 so you don't need to initialise the fields at all, it 
> is zeroized at startup as part of BSS section.

Sure, will change.

> 
>> +
>>   static void prot_init_common(unsigned long page_none,
>>   			     unsigned long page_shared,
>>   			     unsigned long page_copy,
> 
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index bc8f326be0ce..2254c1980c8e 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -420,11 +420,13 @@ extern unsigned int kobjsize(const void *objp);
>>   #endif
>>   #define VM_FLAGS_CLEAR	(ARCH_VM_PKEY_FLAGS | VM_ARCH_CLEAR)
>>   
>> +#ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
>>   /*
>>    * mapping from the currently active vm_flags protection bits (the
>>    * low four bits) to a page protection mask..
>>    */
>>   extern pgprot_t protection_map[16];
>> +#endif
>>   
>>   /*
>>    * The default fault flags that should be used by most of the
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index 61e6135c54ef..e66920414945 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -101,6 +101,7 @@ static void unmap_region(struct mm_struct *mm,
>>    *								w: (no) no
>>    *								x: (yes) yes
>>    */
>> +#ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
>>   pgprot_t protection_map[16] __ro_after_init = {
>>   	[VM_NONE]					= __P000,
>>   	[VM_READ]					= __P001,
>> @@ -120,7 +121,6 @@ pgprot_t protection_map[16] __ro_after_init = {
>>   	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= __S111
>>   };
>>   
>> -#ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
> 
> Why not let architectures provide their protection_map[] and keep that 
> function ?

Just to understand this correctly.

All platforms provide their private protection_map[] array, drop __SXXX, __PXXX
macros which will not be required anymore, depend on generic vm_get_page_prot()
array look up, unless they need custom function via ARCH_HAS_VM_GET_PAGE_PROT ?

> 
>>   pgprot_t vm_get_page_prot(unsigned long vm_flags)
>>   {
>>   	return protection_map[vm_flags & (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)];
