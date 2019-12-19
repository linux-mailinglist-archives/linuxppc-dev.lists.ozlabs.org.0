Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E94F6125E92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 11:09:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dng33cwTzDqrj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 21:09:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="AmDlgp2G"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dncy4LGrzDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 21:08:02 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47dncs1fSZz9txdZ;
 Thu, 19 Dec 2019 11:07:57 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AmDlgp2G; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FMPZ0PcMguUF; Thu, 19 Dec 2019 11:07:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47dncs0W1Mz9txdX;
 Thu, 19 Dec 2019 11:07:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576750077; bh=/4zEamhLSd+OmHEjHewPY8apoChkej0LywPcTIUtggs=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=AmDlgp2GMbsJV32BkI9L4IhcM8MXtzya6CRzWBsdrYicdCf9yTi7fBsdntr7oRiu3
 4Wnams1c1ClSYV25a95bXzT4UcP0EdhdiXTFXxwe5JppumUv2xBG+Fy3yPOl6nlP8f
 S00hCkNSWvhkYRkVdpgu1UIZ6S2IA0gzmG4yDUCY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2ACE68B7AD;
 Thu, 19 Dec 2019 11:07:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id C_K90wc5tv2M; Thu, 19 Dec 2019 11:07:58 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F0CB8B787;
 Thu, 19 Dec 2019 11:07:57 +0100 (CET)
Subject: Re: [PATCH v4 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
References: <20191219003630.31288-1-dja@axtens.net>
 <20191219003630.31288-5-dja@axtens.net>
 <c4d37067-829f-cd7d-7e94-0ec2223cce71@c-s.fr>
 <87bls4tzjn.fsf@dja-thinkpad.axtens.net>
 <4f2fffb3-5fb6-b5ea-a951-a7910f2439b8@c-s.fr>
Message-ID: <76c5aa20-7993-9501-514d-10e0b6d882d1@c-s.fr>
Date: Thu, 19 Dec 2019 10:07:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <4f2fffb3-5fb6-b5ea-a951-a7910f2439b8@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/19/2019 10:05 AM, Christophe Leroy wrote:
> 
> 
> Le 19/12/2019 à 10:50, Daniel Axtens a écrit :
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>
>>> On 12/19/2019 12:36 AM, Daniel Axtens wrote:
>>>> KASAN support on Book3S is a bit tricky to get right:
>>>>
>>>>    - It would be good to support inline instrumentation so as to be 
>>>> able to
>>>>      catch stack issues that cannot be caught with outline mode.
>>>>
>>>>    - Inline instrumentation requires a fixed offset.
>>>>
>>>>    - Book3S runs code in real mode after booting. Most notably a lot 
>>>> of KVM
>>>>      runs in real mode, and it would be good to be able to 
>>>> instrument it.
>>>>
>>>>    - Because code runs in real mode after boot, the offset has to 
>>>> point to
>>>>      valid memory both in and out of real mode.
>>>>
>>>>       [ppc64 mm note: The kernel installs a linear mapping at effective
>>>>       address c000... onward. This is a one-to-one mapping with 
>>>> physical
>>>>       memory from 0000... onward. Because of how memory accesses 
>>>> work on
>>>>       powerpc 64-bit Book3S, a kernel pointer in the linear map 
>>>> accesses the
>>>>       same memory both with translations on (accessing as an 'effective
>>>>       address'), and with translations off (accessing as a 'real
>>>>       address'). This works in both guests and the hypervisor. For more
>>>>       details, see s5.7 of Book III of version 3 of the ISA, in 
>>>> particular
>>>>       the Storage Control Overview, s5.7.3, and s5.7.5 - noting that 
>>>> this
>>>>       KASAN implementation currently only supports Radix.]
>>>>
>>>> One approach is just to give up on inline instrumentation. This way all
>>>> checks can be delayed until after everything set is up correctly, 
>>>> and the
>>>> address-to-shadow calculations can be overridden. However, the 
>>>> features and
>>>> speed boost provided by inline instrumentation are worth trying to do
>>>> better.
>>>>
>>>> If _at compile time_ it is known how much contiguous physical memory a
>>>> system has, the top 1/8th of the first block of physical memory can 
>>>> be set
>>>> aside for the shadow. This is a big hammer and comes with 3 big
>>>> consequences:
>>>>
>>>>    - there's no nice way to handle physically discontiguous memory, 
>>>> so only
>>>>      the first physical memory block can be used.
>>>>
>>>>    - kernels will simply fail to boot on machines with less memory than
>>>>      specified when compiling.
>>>>
>>>>    - kernels running on machines with more memory than specified when
>>>>      compiling will simply ignore the extra memory.
>>>>
>>>> Implement and document KASAN this way. The current implementation is 
>>>> Radix
>>>> only.
>>>>
>>>> Despite the limitations, it can still find bugs,
>>>> e.g. http://patchwork.ozlabs.org/patch/1103775/
>>>>
>>>> At the moment, this physical memory limit must be set _even for outline
>>>> mode_. This may be changed in a later series - a different 
>>>> implementation
>>>> could be added for outline mode that dynamically allocates shadow at a
>>>> fixed offset. For example, see 
>>>> https://patchwork.ozlabs.org/patch/795211/
>>>>
>>>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>>>> Cc: Balbir Singh <bsingharora@gmail.com> # ppc64 out-of-line radix 
>>>> version
>>>> Cc: Christophe Leroy <christophe.leroy@c-s.fr> # ppc32 version
>>>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>>>>
>>>> ---
>>>> Changes since v3:
>>>>    - Address further feedback from Christophe.
>>>>    - Drop changes to stack walking, it looks like the issue I 
>>>> observed is
>>>>      related to that particular stack, not stack-walking generally.
>>>>
>>>> Changes since v2:
>>>>
>>>>    - Address feedback from Christophe around cleanups and docs.
>>>>    - Address feedback from Balbir: at this point I don't have a good 
>>>> solution
>>>>      for the issues you identify around the limitations of the 
>>>> inline implementation
>>>>      but I think that it's worth trying to get the stack 
>>>> instrumentation support.
>>>>      I'm happy to have an alternative and more flexible outline mode 
>>>> - I had
>>>>      envisoned this would be called 'lightweight' mode as it imposes 
>>>> fewer restrictions.
>>>>      I've linked to your implementation. I think it's best to add it 
>>>> in a follow-up series.
>>>>    - Made the default PHYS_MEM_SIZE_FOR_KASAN value 1024MB. I think 
>>>> most people have
>>>>      guests with at least that much memory in the Radix 64s case so 
>>>> it's a much
>>>>      saner default - it means that if you just turn on KASAN without 
>>>> reading the
>>>>      docs you're much more likely to have a bootable kernel, which 
>>>> you will never
>>>>      have if the value is set to zero! I'm happy to bikeshed the 
>>>> value if we want.
>>>>
>>>> Changes since v1:
>>>>    - Landed kasan vmalloc support upstream
>>>>    - Lots of feedback from Christophe.
>>>>
>>>> Changes since the rfc:
>>>>
>>>>    - Boots real and virtual hardware, kvm works.
>>>>
>>>>    - disabled reporting when we're checking the stack for exception
>>>>      frames. The behaviour isn't wrong, just incompatible with KASAN.
>>>>
>>>>    - Documentation!
>>>>
>>>>    - Dropped old module stuff in favour of KASAN_VMALLOC.
>>>>
>>>> The bugs with ftrace and kuap were due to kernel bloat pushing
>>>> prom_init calls to be done via the plt. Because we did not have
>>>> a relocatable kernel, and they are done very early, this caused
>>>> everything to explode. Compile with CONFIG_RELOCATABLE!
>>>> ---
>>>>    Documentation/dev-tools/kasan.rst            |   8 +-
>>>>    Documentation/powerpc/kasan.txt              | 112 
>>>> ++++++++++++++++++-
>>>>    arch/powerpc/Kconfig                         |   2 +
>>>>    arch/powerpc/Kconfig.debug                   |  21 ++++
>>>>    arch/powerpc/Makefile                        |  11 ++
>>>>    arch/powerpc/include/asm/book3s/64/hash.h    |   4 +
>>>>    arch/powerpc/include/asm/book3s/64/pgtable.h |   7 ++
>>>>    arch/powerpc/include/asm/book3s/64/radix.h   |   5 +
>>>>    arch/powerpc/include/asm/kasan.h             |  21 +++-
>>>>    arch/powerpc/kernel/prom.c                   |  61 +++++++++-
>>>>    arch/powerpc/mm/kasan/Makefile               |   1 +
>>>>    arch/powerpc/mm/kasan/init_book3s_64.c       |  70 ++++++++++++
>>>>    arch/powerpc/platforms/Kconfig.cputype       |   1 +
>>>>    13 files changed, 316 insertions(+), 8 deletions(-)
>>>>    create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c
>>>>
>>>> diff --git a/arch/powerpc/include/asm/kasan.h 
>>>> b/arch/powerpc/include/asm/kasan.h
>>>> index 296e51c2f066..f18268cbdc33 100644
>>>> --- a/arch/powerpc/include/asm/kasan.h
>>>> +++ b/arch/powerpc/include/asm/kasan.h
>>>> @@ -2,6 +2,9 @@
>>>>    #ifndef __ASM_KASAN_H
>>>>    #define __ASM_KASAN_H
>>>> +#include <asm/page.h>
>>>> +#include <asm/pgtable.h>
>>>
>>> What do you need asm/pgtable.h for ?
>>>
>>> Build failure due to circular inclusion of asm/pgtable.h:
>>
>> I see there's a lot of ppc32 stuff, I clearly need to bite the bullet
>> and get a ppc32 toolchain so I can squash these without chewing up any
>> more of your time. I'll sort that out and send a new spin.
>>
> 
> I'm using a powerpc64 toolchain to build both ppc32 and ppc64 kernels 
> (from https://mirrors.edge.kernel.org/pub/tools/crosstool/ )
> 
> 
> Another thing, did you test PTDUMP stuff with KASAN ? It looks like 
> KASAN address markers don't depend on PPC32, but are only initialised by 
> populate_markers() for PPC32.
> 
> Regarding kasan.h, I think we should be able to end up with something 
> where the definition of KASAN_SHADOW_OFFSET should only depend on the 
> existence of CONFIG_KASAN_SHADOW_OFFSET, and where only 
> KASAN_SHADOW_SIZE should depend on the target (ie PPC32 or BOOK3S64)
> Everything else should be common. KASAN_END should be START+SIZE.
> 
> It looks like what you have called KASAN_SHADOW_SIZE is not similar to 
> what is called KASAN_SHADOW_SIZE for PPC32, as yours only covers the 
> SHADOW_SIZE for linear mem while PPC32 one covers the full space.
> 

More or less something like that:

/* SPDX-License-Identifier: GPL-2.0 */
#ifndef __ASM_KASAN_H
#define __ASM_KASAN_H

#include <asm/page.h>

#ifdef CONFIG_KASAN
#define _GLOBAL_KASAN(fn)	_GLOBAL(__##fn)
#define _GLOBAL_TOC_KASAN(fn)	_GLOBAL_TOC(__##fn)
#define EXPORT_SYMBOL_KASAN(fn)	EXPORT_SYMBOL(__##fn)
#else
#define _GLOBAL_KASAN(fn)	_GLOBAL(fn)
#define _GLOBAL_TOC_KASAN(fn)	_GLOBAL_TOC(fn)
#define EXPORT_SYMBOL_KASAN(fn)
#endif

#ifndef __ASSEMBLY__

#define KASAN_SHADOW_SCALE_SHIFT	3

#define KASAN_SHADOW_START	(KASAN_SHADOW_OFFSET + \
				 (PAGE_OFFSET >> KASAN_SHADOW_SCALE_SHIFT))

#define KASAN_SHADOW_END	(KASAN_SHADOW_START + KASAN_SHADOW_SIZE)


#ifdef CONFIG_KASAN_SHADOW_OFFSET
#define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
#endif

#ifdef CONFIG_PPC32
#define KASAN_SHADOW_SIZE	((-PAGE_OFFSET) >> KASAN_SHADOW_SCALE_SHIFT)
#endif

#ifdef CONFIG_PPC_BOOK3S_64
#define KASAN_SHADOW_SIZE (ASM_CONST(CONFIG_PHYS_MEM_SIZE_FOR_KASAN) * 
SZ_1G) >> \
			   KASAN_SHADOW_SCALE_SHIFT)
#endif


#ifdef CONFIG_KASAN
void kasan_early_init(void);
void kasan_mmu_init(void);
void kasan_init(void);
#else
static inline void kasan_init(void) { }
static inline void kasan_mmu_init(void) { }
#endif

#endif /* __ASSEMBLY */
#endif



Christophe
