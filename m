Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42683318EAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 16:33:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dc0y24KYvzDwqd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 02:32:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dc0vq5lknzDsmr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 02:30:58 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dc0vc6K5Qz9v2d4;
 Thu, 11 Feb 2021 16:30:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id m1UjKObhpiWS; Thu, 11 Feb 2021 16:30:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dc0vc5RNmz9v2cL;
 Thu, 11 Feb 2021 16:30:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DC3F8B835;
 Thu, 11 Feb 2021 16:30:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yyfwVSJuFaDI; Thu, 11 Feb 2021 16:30:54 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DAFEB8B82E;
 Thu, 11 Feb 2021 16:30:53 +0100 (CET)
Subject: Re: [PATCH] powerpc/bug: Remove specific powerpc BUG_ON()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <694c7195c81d1bcc781b3c14f452886683d6c524.1613029237.git.christophe.leroy@csgroup.eu>
 <20210211114910.GA28121@gate.crashing.org>
 <6126ca14-419a-9e15-7ffa-b295f26a552e@csgroup.eu>
 <20210211143059.GE28121@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a1835710-06aa-4821-4e53-fec49e701dbc@csgroup.eu>
Date: Thu, 11 Feb 2021 16:30:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211143059.GE28121@gate.crashing.org>
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



Le 11/02/2021 à 15:30, Segher Boessenkool a écrit :
> On Thu, Feb 11, 2021 at 03:09:43PM +0100, Christophe Leroy wrote:
>> Le 11/02/2021 à 12:49, Segher Boessenkool a écrit :
>>> On Thu, Feb 11, 2021 at 07:41:52AM +0000, Christophe Leroy wrote:
>>>> powerpc BUG_ON() is based on using twnei or tdnei instruction,
>>>> which obliges gcc to format the condition into a 0 or 1 value
>>>> in a register.
>>>
>>> Huh?  Why is that?
>>>
>>> Will it work better if this used __builtin_trap?  Or does the kernel only
>>> detect very specific forms of trap instructions?
>>
>> We already made a try with __builtin_trap() 1,5 year ago, see
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20510ce03cc9463f1c9e743c1d93b939de501b53.1566219503.git.christophe.leroy@c-s.fr/
>>
>> The main problems encountered are:
>> - It is only possible to use it for BUG_ON, not for WARN_ON because GCC
>> considers it as noreturn. Is there any workaround ?
> 
> A trap is noreturn by definition:
> 
>   -- Built-in Function: void __builtin_trap (void)
>       This function causes the program to exit abnormally.
> 
>> - The kernel (With CONFIG_DEBUG_BUGVERBOSE) needs to be able to identify
>> the source file and line corresponding to the trap. How can that be done
>> with __builtin_trap() ?
> 
> The DWARF debug info should be sufficient.  Perhaps you can post-process
> some way?
> 
> You can create a trap that falls through yourself (by having a trap-on
> condition with a condition that is always true, but make the compiler
> not see that).  This isn't efficient though.
> 
> Could you file a feature request (in bugzilla)?  It is probably useful
> for generic code as well, but we could implement this for powerpc only
> if needed.
> 

Ok I will.


For sure using __builtin_trap() would be the best.

unsigned long test1(unsigned long msr)
{
	WARN_ON((msr & (MSR_DR | MSR_IR | MSR_RI)) != (MSR_DR | MSR_IR | MSR_RI));

	return msr;
}

unsigned long test2(unsigned long msr)
{
	if ((msr & (MSR_DR | MSR_IR | MSR_RI)) != (MSR_DR | MSR_IR | MSR_RI))
		__builtin_trap();

	return msr;
}

000003c0 <test1>:
  3c0:	70 69 00 32 	andi.   r9,r3,50
  3c4:	69 29 00 32 	xori    r9,r9,50
  3c8:	31 49 ff ff 	addic   r10,r9,-1
  3cc:	7d 2a 49 10 	subfe   r9,r10,r9
  3d0:	0f 09 00 00 	twnei   r9,0
  3d4:	4e 80 00 20 	blr

000003d8 <test2>:
  3d8:	70 69 00 32 	andi.   r9,r3,50
  3dc:	0f 09 00 32 	twnei   r9,50
  3e0:	4e 80 00 20 	blr

Christophe
