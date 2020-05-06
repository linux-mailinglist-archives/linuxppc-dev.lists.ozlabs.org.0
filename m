Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B71C798B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 20:37:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HQLc58pQzDqlW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 04:37:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HPmN4Kx6zDqSx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 04:11:12 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49HPmF4SHWz9tydw;
 Wed,  6 May 2020 20:11:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id MSwJMDiKYnKC; Wed,  6 May 2020 20:11:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49HPmF3L1qz9tydv;
 Wed,  6 May 2020 20:11:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 832418B7C3;
 Wed,  6 May 2020 20:11:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 22Wr2QyqA4Bj; Wed,  6 May 2020 20:11:09 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A0ED88B777;
 Wed,  6 May 2020 20:11:08 +0200 (CEST)
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <23e680624680a9a5405f4b88740d2596d4b17c26.1587143308.git.christophe.leroy@c-s.fr>
 <87sggecv81.fsf@mpe.ellerman.id.au>
 <20200505153245.GN31009@gate.crashing.org>
 <87pnbhdgkw.fsf@mpe.ellerman.id.au>
 <20200506175849.GT31009@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bd336b0f-9cf7-e2ce-e0a8-1891599638d1@csgroup.eu>
Date: Wed, 6 May 2020 20:10:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506175849.GT31009@gate.crashing.org>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/05/2020 à 19:58, Segher Boessenkool a écrit :
> On Wed, May 06, 2020 at 10:58:55AM +1000, Michael Ellerman wrote:
>>>> The "m<>" here is breaking GCC 4.6.3, which we allegedly still support.
>>>
>>> [ You shouldn't use 4.6.3, there has been 4.6.4 since a while.  And 4.6
>>>    is nine years old now.  Most projects do not support < 4.8 anymore, on
>>>    any architecture.  ]
>>
>> Moving up to 4.6.4 wouldn't actually help with this though would it?
> 
> Nope.  But 4.6.4 is a bug-fix release, 91 bugs fixed since 4.6.3, so you
> should switch to it if you can :-)
> 
>> Also I have 4.6.3 compilers already built, I don't really have time to
>> rebuild them for 4.6.4.
>>
>> The kernel has a top-level minimum version, which I'm not in charge of, see:
>>
>> https://www.kernel.org/doc/html/latest/process/changes.html?highlight=gcc
> 
> Yes, I know.  And it is much preferred not to have stricter requirements
> for Power, I know that too.  Something has to give though :-/
> 
>> There were discussions about making 4.8 the minimum, but I'm not sure
>> where they got to.
> 
> Yeah, just petered out I think?
> 
> All significant distros come with a 4.8 as system compiler.
> 
>>>> Plain "m" works, how much does the "<>" affect code gen in practice?
>>>>
>>>> A quick diff here shows no difference from removing "<>".
>>>
>>> It will make it impossible to use update-form instructions here.  That
>>> probably does not matter much at all, in this case.
>>>
>>> If you remove the "<>" constraints, also remove the "%Un" output modifier?
>>
>> So like this?
>>
>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
>> index 62cc8d7640ec..ca847aed8e45 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -207,10 +207,10 @@ do {								\
>>   
>>   #define __put_user_asm_goto(x, addr, label, op)			\
>>   	asm volatile goto(					\
>> -		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
>> +		"1:	" op "%X1 %0,%1	# put_user\n"		\
>>   		EX_TABLE(1b, %l2)				\
>>   		:						\
>> -		: "r" (x), "m<>" (*addr)				\
>> +		: "r" (x), "m" (*addr)				\
>>   		:						\
>>   		: label)
> 
> Like that.  But you will have to do that to *all* places we use the "<>"
> constraints, or wait for more stuff to fail?  And, there probably are
> places we *do* want update form insns used (they do help in some loops,
> for example)?
> 

AFAICT, git grep "m<>" provides no result.

However many places have %Ux:

arch/powerpc/boot/io.h:	__asm__ __volatile__("lbz%U1%X1 %0,%1; twi 
0,%0,0; isync"
arch/powerpc/boot/io.h:	__asm__ __volatile__("stb%U0%X0 %1,%0; sync"
arch/powerpc/boot/io.h:	__asm__ __volatile__("lhz%U1%X1 %0,%1; twi 
0,%0,0; isync"
arch/powerpc/boot/io.h:	__asm__ __volatile__("sth%U0%X0 %1,%0; sync"
arch/powerpc/boot/io.h:	__asm__ __volatile__("lwz%U1%X1 %0,%1; twi 
0,%0,0; isync"
arch/powerpc/boot/io.h:	__asm__ __volatile__("stw%U0%X0 %1,%0; sync"
arch/powerpc/include/asm/atomic.h:	__asm__ __volatile__("lwz%U1%X1 
%0,%1" : "=r"(t) : "m"(v->counter));
arch/powerpc/include/asm/atomic.h:	__asm__ __volatile__("stw%U0%X0 
%1,%0" : "=m"(v->counter) : "r"(i));
arch/powerpc/include/asm/atomic.h:	__asm__ __volatile__("ld%U1%X1 %0,%1" 
: "=r"(t) : "m"(v->counter));
arch/powerpc/include/asm/atomic.h:	__asm__ __volatile__("std%U0%X0 
%1,%0" : "=m"(v->counter) : "r"(i));
arch/powerpc/include/asm/book3s/32/pgtable.h:		stw%U0%X0 %2,%0\n\
arch/powerpc/include/asm/book3s/32/pgtable.h:		stw%U0%X0 %L2,%1"
arch/powerpc/include/asm/io.h:	__asm__ __volatile__("sync;"#insn"%U1%X1 
%0,%1;twi 0,%0,0;isync"\
arch/powerpc/include/asm/io.h:	__asm__ __volatile__("sync;"#insn"%U0%X0 
%1,%0"			\
arch/powerpc/include/asm/nohash/pgtable.h:			stw%U0%X0 %2,%0\n\
arch/powerpc/include/asm/nohash/pgtable.h:			stw%U0%X0 %L2,%1"
arch/powerpc/kvm/powerpc.c:	asm ("lfs%U1%X1 0,%1; stfd%U0%X0 0,%0" : 
"=m" (fprd) : "m" (fprs)
arch/powerpc/kvm/powerpc.c:	asm ("lfd%U1%X1 0,%1; stfs%U0%X0 0,%0" : 
"=m" (fprs) : "m" (fprd)


Christophe
