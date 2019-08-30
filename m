Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C04B1A31C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 10:03:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KX6q3C8FzF0YY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 18:03:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Bxf+31Bp"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KX492tlmzDsgr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 18:01:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46KX442L0pzB09bM;
 Fri, 30 Aug 2019 10:01:24 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Bxf+31Bp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QwA2671RsViN; Fri, 30 Aug 2019 10:01:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46KX440RlJzB09bL;
 Fri, 30 Aug 2019 10:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567152084; bh=MrB0D1XRCQ1TDzjNZzXYKTbCynoXrd0Cy3NZgBAs/4I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Bxf+31BpxVR3fFhYfMDmWCPlemMdcoJ+Zq5uBcFJkVLyOoyNyD0BaIjE/2C2h2sY6
 i7ICpfLRIVFEXXwlJn1ik5kRqfm3gFXQo3BkNPzSEjVl97+/bBh5QRM4z5lnYnj90f
 oQ67+Bw3NRBJVjgIGrVRow4uV1F8JySSworxYysc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D5E78B8EB;
 Fri, 30 Aug 2019 10:01:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 77KKYpnWQWBA; Fri, 30 Aug 2019 10:01:25 +0200 (CEST)
Received: from [172.25.230.105] (po15451.idsi0.si.c-s.fr [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CA37F8B8E3;
 Fri, 30 Aug 2019 10:01:24 +0200 (CEST)
Subject: Re: [PATCH v5 3/5] powerpc/64: make buildable without CONFIG_COMPAT
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <90594004804c6a9b690b69bdf0e5c4d6c880c5f4.1567117050.git.msuchanek@suse.de>
 <8a755a692fb26b04aa4f95dccc20b076ef7dcf0c.1567146181.git.christophe.leroy@c-s.fr>
 <20190830095451.47ab750f@naga>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c5795c3b-1df4-3a69-4cd9-fc67fcc3ae5e@c-s.fr>
Date: Fri, 30 Aug 2019 10:01:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830095451.47ab750f@naga>
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
Cc: Michael Neuling <mikey@neuling.org>, Arnd Bergmann <arnd@arndb.de>,
 Nicolai Stange <nstange@suse.de>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Christian Brauner <christian@brauner.io>,
 Firoz Khan <firoz.khan@linaro.org>, Breno Leitao <leitao@debian.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/08/2019 à 09:54, Michal Suchánek a écrit :
> On Fri, 30 Aug 2019 06:35:13 +0000 (UTC)
> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
>> On 08/29/2019 10:28 PM, Michal Suchanek wrote:
>>> There are numerous references to 32bit functions in generic and 64bit
>>> code so ifdef them out.
>>>
>>> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>>> ---
>>> v2:
>>> - fix 32bit ifdef condition in signal.c
>>> - simplify the compat ifdef condition in vdso.c - 64bit is redundant
>>> - simplify the compat ifdef condition in callchain.c - 64bit is redundant
>>> v3:
>>> - use IS_ENABLED and maybe_unused where possible
>>> - do not ifdef declarations
>>> - clean up Makefile
>>> v4:
>>> - further makefile cleanup
>>> - simplify is_32bit_task conditions
>>> - avoid ifdef in condition by using return
>>> v5:
>>> - avoid unreachable code on 32bit
>>> - make is_current_64bit constant on !COMPAT
>>> - add stub perf_callchain_user_32 to avoid some ifdefs
>>> ---
>>>    arch/powerpc/include/asm/thread_info.h |  4 ++--
>>>    arch/powerpc/kernel/Makefile           |  7 +++----
>>>    arch/powerpc/kernel/entry_64.S         |  2 ++
>>>    arch/powerpc/kernel/signal.c           |  3 +--
>>>    arch/powerpc/kernel/syscall_64.c       |  6 ++----
>>>    arch/powerpc/kernel/vdso.c             |  5 ++---
>>>    arch/powerpc/perf/callchain.c          | 13 +++++++++++--
>>>    7 files changed, 23 insertions(+), 17 deletions(-)
>>>    
>> [...]
>>
>>> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
>>> index c84bbd4298a0..881be5c4e9bb 100644
>>> --- a/arch/powerpc/perf/callchain.c
>>> +++ b/arch/powerpc/perf/callchain.c
>>> @@ -15,7 +15,7 @@
>>>    #include <asm/sigcontext.h>
>>>    #include <asm/ucontext.h>
>>>    #include <asm/vdso.h>
>>> -#ifdef CONFIG_PPC64
>>> +#ifdef CONFIG_COMPAT
>>>    #include "../kernel/ppc32.h"
>>>    #endif
>>>    #include <asm/pte-walk.h>
>>> @@ -291,7 +291,8 @@ static inline int current_is_64bit(void)
>>>    	 * interrupt stack, and the thread flags don't get copied over
>>>    	 * from the thread_info on the main stack to the interrupt stack.
>>>    	 */
>>> -	return !test_ti_thread_flag(task_thread_info(current), TIF_32BIT);
>>> +	return !IS_ENABLED(CONFIG_COMPAT) ||
>>> +		!test_ti_thread_flag(task_thread_info(current), TIF_32BIT);
>>>    }
>>>    
>>>    #else  /* CONFIG_PPC64 */
>>> @@ -341,6 +342,7 @@ static inline int valid_user_sp(unsigned long sp, int is_64)
>>>    
>>>    #endif /* CONFIG_PPC64 */
>>>    
>>> +#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
>>>    /*
>>>     * Layout for non-RT signal frames
>>>     */
>>> @@ -482,6 +484,13 @@ static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>>>    		sp = next_sp;
>>>    	}
>>>    }
>>> +#else /* 32bit */
>>> +static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>>> +				   struct pt_regs *regs)
>>> +{
>>> +	(void)&read_user_stack_32; /* unused if !COMPAT */
>>
>> That looks pretty much like a hack.
>>
>> See possible alternative below.
>>
>>> +}
>>> +#endif /* 32bit */
>>>    
>>>    void
>>>    perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
>>>    
>>
>> ---
>>   arch/powerpc/perf/callchain.c | 62 +++++++++++++++++++------------------------
>>   1 file changed, 27 insertions(+), 35 deletions(-)
>>
>> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
>> index 881be5c4e9bb..1b169b32776a 100644
>> --- a/arch/powerpc/perf/callchain.c
>> +++ b/arch/powerpc/perf/callchain.c
>> @@ -165,22 +165,6 @@ static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
>>   	return read_user_stack_slow(ptr, ret, 8);
>>   }
>>   
>> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
>> -{
>> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
>> -	    ((unsigned long)ptr & 3))
>> -		return -EFAULT;
>> -
>> -	pagefault_disable();
>> -	if (!__get_user_inatomic(*ret, ptr)) {
>> -		pagefault_enable();
>> -		return 0;
>> -	}
>> -	pagefault_enable();
>> -
>> -	return read_user_stack_slow(ptr, ret, 4);
>> -}
>> -
>>   static inline int valid_user_sp(unsigned long sp, int is_64)
>>   {
>>   	if (!sp || (sp & 7) || sp > (is_64 ? TASK_SIZE : 0x100000000UL) - 32)
>> @@ -296,25 +280,10 @@ static inline int current_is_64bit(void)
>>   }
>>   
>>   #else  /* CONFIG_PPC64 */
>> -/*
>> - * On 32-bit we just access the address and let hash_page create a
>> - * HPTE if necessary, so there is no need to fall back to reading
>> - * the page tables.  Since this is called at interrupt level,
>> - * do_page_fault() won't treat a DSI as a page fault.
>> - */
>> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
>> -{
>> -	int rc;
>> -
>> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
>> -	    ((unsigned long)ptr & 3))
>> -		return -EFAULT;
>>   
>> -	pagefault_disable();
>> -	rc = __get_user_inatomic(*ret, ptr);
>> -	pagefault_enable();
>> -
>> -	return rc;
>> +static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
>> +{
>> +	return 0;


Here it is


>>   }
>>   
>>   static inline void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>> @@ -344,6 +313,30 @@ static inline int valid_user_sp(unsigned long sp, int is_64)
>>   
>>   #if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
>>   /*
>> + * On 32-bit we just access the address and let hash_page create a
>> + * HPTE if necessary, so there is no need to fall back to reading
>> + * the page tables.  Since this is called at interrupt level,
>> + * do_page_fault() won't treat a DSI as a page fault.
>> + */
>> +static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
>> +{
>> +	int rc;
>> +
>> +	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
>> +	    ((unsigned long)ptr & 3))
>> +		return -EFAULT;
>> +
>> +	pagefault_disable();
>> +	rc = __get_user_inatomic(*ret, ptr);
>> +	pagefault_enable();
>> +
>> +	if (IS_ENABLED(CONFIG_PPC32) || !rc)
>> +		return rc;
>> +
>> +	return read_user_stack_slow(ptr, ret, 4);
> Which is not declared here. This is not intended to be the final state,
> anyway.

Yes it is declared here, see above

Christophe

> 
> Thanks
> 
> Michal
>> +}
>> +
>> +/*
>>    * Layout for non-RT signal frames
>>    */
>>   struct signal_frame_32 {
>> @@ -488,7 +481,6 @@ static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>>   static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>>   				   struct pt_regs *regs)
>>   {
>> -	(void)&read_user_stack_32; /* unused if !COMPAT */
>>   }
>>   #endif /* 32bit */
>>   
