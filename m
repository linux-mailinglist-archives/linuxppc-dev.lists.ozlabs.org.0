Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C1A255415
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 07:42:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bd7lx6ZLMzDqnB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 15:42:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bd7k028DfzDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 15:40:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bd7jn6b5gz9v1yg;
 Fri, 28 Aug 2020 07:40:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id upHeKusfPXCc; Fri, 28 Aug 2020 07:40:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bd7jn5bksz9v1yb;
 Fri, 28 Aug 2020 07:40:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A38778B783;
 Fri, 28 Aug 2020 07:40:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0-I48Y9tgLHI; Fri, 28 Aug 2020 07:40:46 +0200 (CEST)
Received: from [172.25.230.104] (po15451.idsi0.si.c-s.fr [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 765788B769;
 Fri, 28 Aug 2020 07:40:46 +0200 (CEST)
Subject: Re: [PATCH v1 4/9] powerpc/vdso: Remove unnecessary ifdefs in
 vdso_pagelist initialization
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
 <834f362626e18bc36226f46ed4113c461a3ad032.1598363608.git.christophe.leroy@csgroup.eu>
 <87ft89h2st.fsf@mpe.ellerman.id.au>
 <04a968f6-88c0-0603-43aa-202196a68df2@csgroup.eu>
 <87d03c2plb.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e9795fb5-81bc-5707-79d6-42d9dddf7ac4@csgroup.eu>
Date: Fri, 28 Aug 2020 07:40:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87d03c2plb.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/08/2020 à 15:19, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> On 08/26/2020 02:58 PM, Michael Ellerman wrote:
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
>>>> index daef14a284a3..bbb69832fd46 100644
>>>> --- a/arch/powerpc/kernel/vdso.c
>>>> +++ b/arch/powerpc/kernel/vdso.c
>>>> @@ -718,16 +710,14 @@ static int __init vdso_init(void)
>>> ...
>>>>    
>>>> -
>>>> -#ifdef CONFIG_VDSO32
>>>>    	vdso32_kbase = &vdso32_start;
>>>>    
>>>>    	/*
>>>> @@ -735,8 +725,6 @@ static int __init vdso_init(void)
>>>>    	 */
>>>>    	vdso32_pages = (&vdso32_end - &vdso32_start) >> PAGE_SHIFT;
>>>>    	DBG("vdso32_kbase: %p, 0x%x pages\n", vdso32_kbase, vdso32_pages);
>>>> -#endif
>>>
>>> This didn't build for ppc64le:
>>>
>>>     /opt/cross/gcc-8.20_binutils-2.32/powerpc64-unknown-linux-gnu/bin/powerpc64-unknown-linux-gnu-ld: arch/powerpc/kernel/vdso.o:(.toc+0x0): undefined reference to `vdso32_end'
>>>     /opt/cross/gcc-8.20_binutils-2.32/powerpc64-unknown-linux-gnu/bin/powerpc64-unknown-linux-gnu-ld: arch/powerpc/kernel/vdso.o:(.toc+0x8): undefined reference to `vdso32_start'
>>>     make[1]: *** [/scratch/michael/build/maint/Makefile:1166: vmlinux] Error 1
>>>     make: *** [Makefile:185: __sub-make] Error 2
>>>
>>> So I just put that ifdef back.
>>>
>>
>> The problem is because is_32bit() can still return true even when
>> CONFIG_VDSO32 is not set.
> 
> Hmm, you're right. My config had CONFIG_COMPAT enabled.
> 
> But that seems like a bug, if someone enables COMPAT on ppc64le they are
> almost certainly going to want VDSO32 as well.
> 
> So I think I'll do a lead up patch as below.

Ah yes, and with that then no need to consider the case where 
is_32bit_task() is true and CONFIG_VDSO32 is not selected.

I'll update my leading series accordingly.

Christophe

> 
> cheers
> 
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index d4fd109f177e..cf2da1e401ef 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -501,13 +501,12 @@ endmenu
>   
>   config VDSO32
>   	def_bool y
> -	depends on PPC32 || CPU_BIG_ENDIAN
> +	depends on PPC32 || COMPAT
>   	help
>   	  This symbol controls whether we build the 32-bit VDSO. We obviously
>   	  want to do that if we're building a 32-bit kernel. If we're building
> -	  a 64-bit kernel then we only want a 32-bit VDSO if we're building for
> -	  big endian. That is because the only little endian configuration we
> -	  support is ppc64le which is 64-bit only.
> +	  a 64-bit kernel then we only want a 32-bit VDSO if we're also enabling
> +	  COMPAT.
>   
>   choice
>   	prompt "Endianness selection"
> 
