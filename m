Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB15244837
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 12:43:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSg5F1NT5zDqlZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 20:43:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSg3S1jP3zDqkp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 20:41:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BSg3S1DGwz8tSq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 20:41:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BSg3S0phKz9sTW; Fri, 14 Aug 2020 20:41:40 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BSg3Q2LSfz9sTH
 for <linuxppc-dev@ozlabs.org>; Fri, 14 Aug 2020 20:41:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSg3G69yHz9vCqC;
 Fri, 14 Aug 2020 12:41:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id djvwIhCVI2Je; Fri, 14 Aug 2020 12:41:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSg3G53Pxz9vBVn;
 Fri, 14 Aug 2020 12:41:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B4798B797;
 Fri, 14 Aug 2020 12:41:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id L2lJPth1_KlK; Fri, 14 Aug 2020 12:41:31 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6306B8B796;
 Fri, 14 Aug 2020 12:41:31 +0200 (CEST)
Subject: Re: [PATCH 2/4] powerpc: Introduce asm-prototypes.h
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@ozlabs.org
References: <1463534212-4879-1-git-send-email-dja@axtens.net>
 <1463534212-4879-2-git-send-email-dja@axtens.net>
 <b50b9bdd-b731-44ed-435b-e3e4b179a89a@csgroup.eu>
 <87sgcpmu4j.fsf@dja-thinkpad.axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ef4f8eca-8235-c420-e5f2-067ed18cd809@csgroup.eu>
Date: Fri, 14 Aug 2020 10:41:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87sgcpmu4j.fsf@dja-thinkpad.axtens.net>
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



On 08/14/2020 09:53 AM, Daniel Axtens wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> Le 18/05/2016 à 03:16, Daniel Axtens a écrit :
>>> Sparse picked up a number of functions that are implemented in C and
>>> then only referred to in asm code.
>>>
>>> This introduces asm-prototypes.h, which provides a place for
>>> prototypes of these functions.
>>
>> It looks like this is a mis-use of asm-prototypes.h
>>
>> On other architectures, asm-prototypes.h is there to allow MODVERSION to
>> sent versions for exported assembly functions (I checked history of that
>> file in x86 and arm64).
> 
> Hmm, I was young(er) and (more) inexperienced 4 years ago and wouldn't
> have thought to check x86 and arm64.
> 
>> It looks like you have used it on the other way round, you have declared
>> in it C functions used by ASM functions, whereas it is supposed to be
>> dedicated to declaring exported ASM functions used by C functions.
>>
>> Any plan to fix that ?
> 
> What should we call it?

I don't know but that's for sure more complex than just a rename.

Because after you created the file, people have started using it for 
what it is, see for instance following commits:
- 9e5f68842276 ("powerpc: Fix missing CRCs, add more asm-prototypes.h 
declarations") or commit
- 99ad503287da ("powerpc: Add a prototype for mcount() so it can be 
versioned")
- 43a8888f0a70 ("powerpc: Fix missing CRCs, add more asm-prototypes.h 
declarations")

But for instance, for function kexec_copy_flush(), I'd have included it 
is asm/kexec.c
For function __trace_opal_entry() and __trace_opal_exit(), I would have 
added them in asm/opal.h
Etc ...

Christophe


> 
> Kind regards,
> Daniel
>>
>> Christophe
>>
>>>
>>> This silences some sparse warnings.
>>>
>>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>>> ---
>>>    arch/powerpc/include/asm/asm-prototypes.h         | 79 +++++++++++++++++++++++
>>>    arch/powerpc/kernel/machine_kexec_64.c            |  1 +
>>>    arch/powerpc/kernel/smp.c                         |  1 +
>>>    arch/powerpc/kernel/traps.c                       |  1 +
>>>    arch/powerpc/lib/vmx-helper.c                     |  1 +
>>>    arch/powerpc/platforms/powernv/opal-tracepoints.c |  1 +
>>>    arch/powerpc/platforms/pseries/lpar.c             |  1 +
>>>    7 files changed, 85 insertions(+)
>>>    create mode 100644 arch/powerpc/include/asm/asm-prototypes.h
>>>
>>> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
>>> new file mode 100644
>>> index 000000000000..6ee0a9d80bbc
>>> --- /dev/null
>>> +++ b/arch/powerpc/include/asm/asm-prototypes.h
>>> @@ -0,0 +1,79 @@
>>> +/*
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License, version 2, as
>>> + * published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + * Copyright IBM Corp. 2016
>>> + *
>>> + * Authors: Daniel Axtens <dja@axtens.net>
>>> + */
>>> +
>>> +/*
>>> + * This file is for prototypes of C functions that are only called
>>> + * from asm, and any associated variables.
>>> + */
>>> +
>>> +#include <linux/threads.h>
>>> +#include <linux/kprobes.h>
>>> +
>>> +/* SMP */
>>> +extern struct thread_info *current_set[NR_CPUS];
>>> +extern struct thread_info *secondary_ti;
>>> +void start_secondary(void *unused);
>>> +
>>> +/* kexec */
>>> +struct paca_struct;
>>> +struct kimage;
>>> +extern struct paca_struct kexec_paca;
>>> +void kexec_copy_flush(struct kimage *image);
>>> +
>>> +/* pSeries hcall tracing */
>>> +extern struct static_key hcall_tracepoint_key;
>>> +void __trace_hcall_entry(unsigned long opcode, unsigned long *args);
>>> +void __trace_hcall_exit(long opcode, unsigned long retval,
>>> +			unsigned long *retbuf);
>>> +/* OPAL tracing */
>>> +#ifdef HAVE_JUMP_LABEL
>>> +extern struct static_key opal_tracepoint_key;
>>> +#endif
>>> +
>>> +void __trace_opal_entry(unsigned long opcode, unsigned long *args);
>>> +void __trace_opal_exit(long opcode, unsigned long retval);
>>> +
>>> +/* VMX copying */
>>> +int enter_vmx_usercopy(void);
>>> +int exit_vmx_usercopy(void);
>>> +int enter_vmx_copy(void);
>>> +void * exit_vmx_copy(void *dest);
>>> +
>>> +/* Traps */
>>> +long machine_check_early(struct pt_regs *regs);
>>> +long hmi_exception_realmode(struct pt_regs *regs);
>>> +void SMIException(struct pt_regs *regs);
>>> +void handle_hmi_exception(struct pt_regs *regs);
>>> +void instruction_breakpoint_exception(struct pt_regs *regs);
>>> +void RunModeException(struct pt_regs *regs);
>>> +void __kprobes single_step_exception(struct pt_regs *regs);
>>> +void __kprobes program_check_exception(struct pt_regs *regs);
>>> +void alignment_exception(struct pt_regs *regs);
>>> +void StackOverflow(struct pt_regs *regs);
>>> +void nonrecoverable_exception(struct pt_regs *regs);
>>> +void kernel_fp_unavailable_exception(struct pt_regs *regs);
>>> +void altivec_unavailable_exception(struct pt_regs *regs);
>>> +void vsx_unavailable_exception(struct pt_regs *regs);
>>> +void fp_unavailable_tm(struct pt_regs *regs);
>>> +void altivec_unavailable_tm(struct pt_regs *regs);
>>> +void vsx_unavailable_tm(struct pt_regs *regs);
>>> +void facility_unavailable_exception(struct pt_regs *regs);
>>> +void TAUException(struct pt_regs *regs);
>>> +void altivec_assist_exception(struct pt_regs *regs);
>>> +void unrecoverable_exception(struct pt_regs *regs);
>>> +void kernel_bad_stack(struct pt_regs *regs);
>>> +void system_reset_exception(struct pt_regs *regs);
>>> +void machine_check_exception(struct pt_regs *regs);
>>> +void __kprobes emulation_assist_interrupt(struct pt_regs *regs);
>>> diff --git a/arch/powerpc/kernel/machine_kexec_64.c b/arch/powerpc/kernel/machine_kexec_64.c
>>> index b8c202d63ecb..50bf55135ef8 100644
>>> --- a/arch/powerpc/kernel/machine_kexec_64.c
>>> +++ b/arch/powerpc/kernel/machine_kexec_64.c
>>> @@ -29,6 +29,7 @@
>>>    #include <asm/prom.h>
>>>    #include <asm/smp.h>
>>>    #include <asm/hw_breakpoint.h>
>>> +#include <asm/asm-prototypes.h>
>>>    
>>>    #ifdef CONFIG_PPC_BOOK3E
>>>    int default_machine_kexec_prepare(struct kimage *image)
>>> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
>>> index 55c924b65f71..f1adc3c4f4ca 100644
>>> --- a/arch/powerpc/kernel/smp.c
>>> +++ b/arch/powerpc/kernel/smp.c
>>> @@ -53,6 +53,7 @@
>>>    #include <asm/vdso.h>
>>>    #include <asm/debug.h>
>>>    #include <asm/kexec.h>
>>> +#include <asm/asm-prototypes.h>
>>>    
>>>    #ifdef DEBUG
>>>    #include <asm/udbg.h>
>>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>>> index 9229ba63c370..11d15e7270e0 100644
>>> --- a/arch/powerpc/kernel/traps.c
>>> +++ b/arch/powerpc/kernel/traps.c
>>> @@ -60,6 +60,7 @@
>>>    #include <asm/switch_to.h>
>>>    #include <asm/tm.h>
>>>    #include <asm/debug.h>
>>> +#include <asm/asm-prototypes.h>
>>>    #include <sysdev/fsl_pci.h>
>>>    
>>>    #if defined(CONFIG_DEBUGGER) || defined(CONFIG_KEXEC)
>>> diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
>>> index b27e030fc9f8..bf925cdcaca9 100644
>>> --- a/arch/powerpc/lib/vmx-helper.c
>>> +++ b/arch/powerpc/lib/vmx-helper.c
>>> @@ -21,6 +21,7 @@
>>>    #include <linux/uaccess.h>
>>>    #include <linux/hardirq.h>
>>>    #include <asm/switch_to.h>
>>> +#include <asm/asm-prototypes.h>
>>>    
>>>    int enter_vmx_usercopy(void)
>>>    {
>>> diff --git a/arch/powerpc/platforms/powernv/opal-tracepoints.c b/arch/powerpc/platforms/powernv/opal-tracepoints.c
>>> index e11273b2386d..1e496b780efd 100644
>>> --- a/arch/powerpc/platforms/powernv/opal-tracepoints.c
>>> +++ b/arch/powerpc/platforms/powernv/opal-tracepoints.c
>>> @@ -1,6 +1,7 @@
>>>    #include <linux/percpu.h>
>>>    #include <linux/jump_label.h>
>>>    #include <asm/trace.h>
>>> +#include <asm/asm-prototypes.h>
>>>    
>>>    #ifdef HAVE_JUMP_LABEL
>>>    struct static_key opal_tracepoint_key = STATIC_KEY_INIT;
>>> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
>>> index 7f6100d91b4b..03ff9867a610 100644
>>> --- a/arch/powerpc/platforms/pseries/lpar.c
>>> +++ b/arch/powerpc/platforms/pseries/lpar.c
>>> @@ -45,6 +45,7 @@
>>>    #include <asm/plpar_wrappers.h>
>>>    #include <asm/kexec.h>
>>>    #include <asm/fadump.h>
>>> +#include <asm/asm-prototypes.h>
>>>    
>>>    #include "pseries.h"
>>>    
>>>
