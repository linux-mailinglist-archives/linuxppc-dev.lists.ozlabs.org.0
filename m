Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC764A309F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 09:17:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KW5s1mpSzF0PS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 17:17:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="BS0mtFoK"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KW3J46xHzDq6K
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 17:15:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46KW3D0ccGzB09b8;
 Fri, 30 Aug 2019 09:15:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=BS0mtFoK; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2C6Rtg4AawvA; Fri, 30 Aug 2019 09:15:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46KW3C6ZyRzB09b5;
 Fri, 30 Aug 2019 09:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567149335; bh=vSEytOVoZ5keHAZCvAZ/DinQj7vIgFYcS1io54Z3+tU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BS0mtFoKnRJMesbXjxNGLSIvPsi98iQW/vYk/eEoM/T4IvUO81vMSExUigyRLmm2i
 pf6Einld3hQhIqFE0wxO0isMLL5SMCAPaQjnBMWpTexWafyHd2RtPgP1RArWG+8Gkt
 +bheON78Wg0Yx1g970Shcz91Z4+PB7cZOAIbadvA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E05118B8E5;
 Fri, 30 Aug 2019 09:15:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xl3wQ1xbNZLj; Fri, 30 Aug 2019 09:15:36 +0200 (CEST)
Received: from [172.25.230.105] (po15451.idsi0.si.c-s.fr [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 88A2F8B8E3;
 Fri, 30 Aug 2019 09:15:36 +0200 (CEST)
Subject: Re: [PATCH v5 5/5] powerpc/perf: split callchain.c by bitness
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <c77eec3d99fd0251edf725a3d9e1b79f396eba6e.1567117050.git.msuchanek@suse.de>
 <4d996b0a225ca5b7d287ae46825d7da4a1d6e509.1567146554.git.christophe.leroy@c-s.fr>
 <20190830084225.527f4265@naga> <20190830091212.4d1d619f@naga>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d6272d53-69a7-9238-d717-17574c859ce7@c-s.fr>
Date: Fri, 30 Aug 2019 09:15:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830091212.4d1d619f@naga>
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



Le 30/08/2019 à 09:12, Michal Suchánek a écrit :
> On Fri, 30 Aug 2019 08:42:25 +0200
> Michal Suchánek <msuchanek@suse.de> wrote:
> 
>> On Fri, 30 Aug 2019 06:35:11 +0000 (UTC)
>> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>
>>> On 08/29/2019 10:28 PM, Michal Suchanek wrote:
> 
>>>   obj-$(CONFIG_PPC_PERF_CTRS)	+= core-book3s.o bhrb.o
>>> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
>>> index 0bd4484eddaa..17c43ae03084 100644
>>> --- a/arch/powerpc/perf/callchain_32.c
>>> +++ b/arch/powerpc/perf/callchain_32.c
>>> @@ -15,50 +15,13 @@
>>>   #include <asm/sigcontext.h>
>>>   #include <asm/ucontext.h>
>>>   #include <asm/vdso.h>
>>> -#ifdef CONFIG_PPC64
>>> -#include "../kernel/ppc32.h"
>>> -#endif
>>>   #include <asm/pte-walk.h>
>>>   
>>>   #include "callchain.h"
>>>   
>>>   #ifdef CONFIG_PPC64
>>> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
>>> -{
>>> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
>>> -	    ((unsigned long)ptr & 3))
>>> -		return -EFAULT;
>>> -
>>> -	pagefault_disable();
>>> -	if (!__get_user_inatomic(*ret, ptr)) {
>>> -		pagefault_enable();
>>> -		return 0;
>>> -	}
>>> -	pagefault_enable();
>>> -
>>> -	return read_user_stack_slow(ptr, ret, 4);
>>> -}
>>> -#else /* CONFIG_PPC64 */
>>> -/*
>>> - * On 32-bit we just access the address and let hash_page create a
>>> - * HPTE if necessary, so there is no need to fall back to reading
>>> - * the page tables.  Since this is called at interrupt level,
>>> - * do_page_fault() won't treat a DSI as a page fault.
>>> - */
>>> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
>>> -{
>>> -	int rc;
>>> -
>>> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
>>> -	    ((unsigned long)ptr & 3))
>>> -		return -EFAULT;
>>> -
>>> -	pagefault_disable();
>>> -	rc = __get_user_inatomic(*ret, ptr);
>>> -	pagefault_enable();
>>> -
>>> -	return rc;
>>> -}
>>> +#include "../kernel/ppc32.h"
>>> +#else
>>>   
>>>   #define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
>>>   #define sigcontext32		sigcontext
>>> @@ -95,6 +58,30 @@ struct rt_signal_frame_32 {
>>>   	int			abigap[56];
>>>   };
>>>   
>>> +/*
>>> + * On 32-bit we just access the address and let hash_page create a
>>> + * HPTE if necessary, so there is no need to fall back to reading
>>> + * the page tables.  Since this is called at interrupt level,
>>> + * do_page_fault() won't treat a DSI as a page fault.
>>> + */
>>> +static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
>>> +{
>>> +	int rc;
>>> +
>>> +	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
>>> +	    ((unsigned long)ptr & 3))
>>> +		return -EFAULT;
>>> +
>>> +	pagefault_disable();
>>> +	rc = __get_user_inatomic(*ret, ptr);
>>> +	pagefault_enable();
>>> +
>>> +	if (IS_ENABLED(CONFIG_PPC32) || !rc)
>>> +		return rc;
>>> +
>>> +	return read_user_stack_slow(ptr, ret, 4);
>>> +}
>>> +
>>>   static int is_sigreturn_32_address(unsigned int nip, unsigned int fp)
>>>   {
>>>   	if (nip == fp + offsetof(struct signal_frame_32, mctx.mc_pad))
>>
>> I will leave consolidating this function to somebody who knows what the
>> desired semantic is. With a short ifdef section at the top of the file
>> it is a low-hanging fruit.
> 
> It looks ok if done as a separate patch.

Yes, doing it as a separate patch is good.

And if you do it before patch 3, then you don't need anymore this ugly 
hack to hide read_user_stack_32()

Christphe

> 
> Thanks
> 
> Michal
> 
