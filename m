Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855AE5591E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 07:37:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTm9S37cQz3chV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 15:37:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTm924gdlz2yn5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 15:37:25 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17FB9176C;
	Thu, 23 Jun 2022 22:36:54 -0700 (PDT)
Received: from [10.162.41.7] (unknown [10.162.41.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D519B3F66F;
	Thu, 23 Jun 2022 22:36:46 -0700 (PDT)
Message-ID: <e536bd05-dbfd-466b-582e-8a220421a8dc@arm.com>
Date: Fri, 24 Jun 2022 11:06:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V4 07/26] mm/mmap: Build protect protection_map[] with
 ARCH_HAS_VM_GET_PAGE_PROT
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-8-anshuman.khandual@arm.com>
 <10aca763-2313-84bf-9200-6a6037fd748c@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <10aca763-2313-84bf-9200-6a6037fd748c@csgroup.eu>
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
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-snps
 -arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/24/22 10:52, Christophe Leroy wrote:
> 
> 
> Le 24/06/2022 à 06:43, Anshuman Khandual a écrit :
>> protection_map[] has already been moved inside those platforms which enable
> 
> Usually "already" means before your series.
> 
> Your series is the one that moves protection_map[] so I would have just 
> said "Now that protection_map[] has been moved inside those platforms 
> which enable ...."

Got it, will update the commit message.

> 
>> ARCH_HAS_VM_GET_PAGE_PROT. Hence generic protection_map[] array now can be
>> protected with CONFIG_ARCH_HAS_VM_GET_PAGE_PROT intead of __P000.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   include/linux/mm.h | 2 +-
>>   mm/mmap.c          | 5 +----
>>   2 files changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 237828c2bae2..70d900f6df43 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -424,7 +424,7 @@ extern unsigned int kobjsize(const void *objp);
>>    * mapping from the currently active vm_flags protection bits (the
>>    * low four bits) to a page protection mask..
>>    */
>> -#ifdef __P000
>> +#ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
>>   extern pgprot_t protection_map[16];
> 
> Is this declaration still needed ? I have the feeling that 
> protection_map[] is only used in mm/mmap.c now.

At this point generic protection_map[] array is still being used via
this declaration on many (!ARCH_HAS_VM_GET_PAGE_PROT) platforms such
as mips, m68k, arm etc.

> 
>>   #endif
>>   
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index 55c30aee3999..43db3bd49071 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -101,7 +101,7 @@ static void unmap_region(struct mm_struct *mm,
>>    *								w: (no) no
>>    *								x: (yes) yes
>>    */
>> -#ifdef __P000
>> +#ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
>>   pgprot_t protection_map[16] __ro_after_init = {
> 
> Should this be static, as it seems to now be used only in this file ?

This is being used in some platforms as mentioned before.

> And it could also be 'const' instead of __ro_after_init.

Then should be able to be a 'const' wrt  mips, m68k, arm platforms.
But should this even be changed, if this is going to be dropped off
eventually ?

> 
>>   	[VM_NONE]					= __P000,
>>   	[VM_READ]					= __P001,
>> @@ -120,9 +120,6 @@ pgprot_t protection_map[16] __ro_after_init = {
>>   	[VM_SHARED | VM_EXEC | VM_WRITE]		= __S110,
>>   	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= __S111
>>   };
>> -#endif
>> -
>> -#ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
>>   DECLARE_VM_GET_PAGE_PROT
>>   #endif	/* CONFIG_ARCH_HAS_VM_GET_PAGE_PROT */
>>   
