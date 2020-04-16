Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0751AB78D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 07:52:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492pJZ4BgpzDrLs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 15:51:58 +1000 (AEST)
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
 header.s=mail header.b=igTopo3N; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492pGW48j2zDrL3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 15:50:10 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 492pGN2TZVz9tymG;
 Thu, 16 Apr 2020 07:50:04 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=igTopo3N; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PtXMNzHK3n0W; Thu, 16 Apr 2020 07:50:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 492pGN1Q6Pz9tymB;
 Thu, 16 Apr 2020 07:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587016204; bh=N4ayq2OQWh2ZYIlUh/X2JW+6xQidyN4B0Sfy2P2aRR8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=igTopo3NsYZk4jzEOW552mqvJXc551JWByVueOri7QTQrrwNA2wq4tFimK7ll97m+
 p/dA4U2VVre1NBuutmQJ177ExMyOL2tEoneFyYoHJOF1GZc8ZS2uyWyfEGeMIkWFWt
 p8mCZLiLjncG2q0FkQHvcybBXoQK3aIBpMIjGO0s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 41A1E8B778;
 Thu, 16 Apr 2020 07:50:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xRLvXbBNUkpJ; Thu, 16 Apr 2020 07:50:05 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 813AD8B756;
 Thu, 16 Apr 2020 07:50:04 +0200 (CEST)
Subject: Re: [PATCH] powerpc/uaccess: Use flexible addressing with
 __put_user()/__get_user()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <4fdc2aba6f5e51887d1cd0fee94be0989eada2cd.1586942312.git.christophe.leroy@c-s.fr>
 <20200415220652.GW26902@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1f5a7975-3b32-3a14-e03e-7c875df57aa3@c-s.fr>
Date: Thu, 16 Apr 2020 07:50:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415220652.GW26902@gate.crashing.org>
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

Hi,

Le 16/04/2020 à 00:06, Segher Boessenkool a écrit :
> Hi!
> 
> On Wed, Apr 15, 2020 at 09:20:26AM +0000, Christophe Leroy wrote:
>> At the time being, __put_user()/__get_user() and friends only use
>> register indirect with immediate index addressing, with the index
>> set to 0. Ex:
>>
>> 	lwz	reg1, 0(reg2)
> 
> This is called a "D-form" instruction, or sometimes "offset addressing".
> Don't talk about an "index", it confuses things, because the *other*
> kind is called "indexed" already, also in the ISA docs!  (X-form, aka
> indexed addressing, [reg+reg], where D-form does [reg+imm], and both
> forms can do [reg]).

In the "Programming Environments Manual for 32-Bit Implementations of 
the PowerPC™ Architecture", they list the following addressing modes:

Load and store operations have three categories of effective address 
generation that depend on the
operands specified:
• Register indirect with immediate index mode
• Register indirect with index mode
• Register indirect mode


> 
>> Give the compiler the opportunity to use other adressing modes
>> whenever possible, to get more optimised code.
> 
> Great :-)
> 
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -114,7 +114,7 @@ extern long __put_user_bad(void);
>>    */
>>   #define __put_user_asm(x, addr, err, op)			\
>>   	__asm__ __volatile__(					\
>> -		"1:	" op " %1,0(%2)	# put_user\n"		\
>> +		"1:	" op "%U2%X2 %1,%2	# put_user\n"	\
>>   		"2:\n"						\
>>   		".section .fixup,\"ax\"\n"			\
>>   		"3:	li %0,%3\n"				\
>> @@ -122,7 +122,7 @@ extern long __put_user_bad(void);
>>   		".previous\n"					\
>>   		EX_TABLE(1b, 3b)				\
>>   		: "=r" (err)					\
>> -		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
>> +		: "r" (x), "m" (*addr), "i" (-EFAULT), "0" (err))
> 
> %Un on an "m" operand doesn't do much: you need to make it "m<>" if you
> want pre-modify ("update") insns to be generated.  (You then will want
> to make sure that operand is used in a way GCC can understand; since it
> is used only once here, that works fine).

Ah ? Indeed I got the idea from include/asm/io.h where there is:

#define DEF_MMIO_IN_D(name, size, insn)				\
static inline u##size name(const volatile u##size __iomem *addr)	\
{									\
	u##size ret;							\
	__asm__ __volatile__("sync;"#insn"%U1%X1 %0,%1;twi 0,%0,0;isync"\
		: "=r" (ret) : "m" (*addr) : "memory");			\
	return ret;							\
}

It should be "m<>" there as well ?

> 
>> @@ -130,8 +130,8 @@ extern long __put_user_bad(void);
>>   #else /* __powerpc64__ */
>>   #define __put_user_asm2(x, addr, err)				\
>>   	__asm__ __volatile__(					\
>> -		"1:	stw %1,0(%2)\n"				\
>> -		"2:	stw %1+1,4(%2)\n"			\
>> +		"1:	stw%U2%X2 %1,%2\n"			\
>> +		"2:	stw%U2%X2 %L1,%L2\n"			\
>>   		"3:\n"						\
>>   		".section .fixup,\"ax\"\n"			\
>>   		"4:	li %0,%3\n"				\
>> @@ -140,7 +140,7 @@ extern long __put_user_bad(void);
>>   		EX_TABLE(1b, 4b)				\
>>   		EX_TABLE(2b, 4b)				\
>>   		: "=r" (err)					\
>> -		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
>> +		: "r" (x), "m" (*addr), "i" (-EFAULT), "0" (err))
> 
> Here, it doesn't work.  You don't want two consecutive update insns in
> any case.  Easiest is to just not use "m<>", and then, don't use %Un
> (which won't do anything, but it is confusing).

Can't we leave the Un on the second stw ?

> 
> Same for the reads.
> 
> Rest looks fine, and update should be good with that fixed as said.
> 
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> 
> 
> Segher
> 

Thanks for the review
Christophe
