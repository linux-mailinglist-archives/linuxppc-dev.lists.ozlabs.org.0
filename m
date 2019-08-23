Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2939B38A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 17:39:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FQYw2GSfzDrZC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 01:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="jrdwbs49"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FQV64ndMzDrqW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 01:36:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46FQTx5xXzz9tyfQ;
 Fri, 23 Aug 2019 17:36:05 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jrdwbs49; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WDbwHxX_DhSu; Fri, 23 Aug 2019 17:36:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46FQTx4mJgz9tyfP;
 Fri, 23 Aug 2019 17:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566574565; bh=taOtIuFOLV3LderGgGTjI+WsiQvKgWM+udHMcArbX6M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jrdwbs496wJTnFOi+YyWfXwhY8qwVNB0jqtWxzq8O7jdWqAEs6fgwBupPWtqkn6tW
 We6YpPGdJoOPsuVQ8I46mS95AAi/0qZbDIltmVIynzY+r9+A1hSbpc6u8i812/EJWR
 s7P9dl9hXeNuIMQYpYOGUgCKH13wi6Ydtu5bQIR4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 475018B895;
 Fri, 23 Aug 2019 17:36:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6H3uH_qZt4h0; Fri, 23 Aug 2019 17:36:07 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 07E788B882;
 Fri, 23 Aug 2019 17:36:07 +0200 (CEST)
Subject: Re: [PATCH 3/3] powerpc: use __builtin_trap() in BUG/WARN macros.
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <a6781075192afe0c909ce7d091de7931183a5d93.1566219503.git.christophe.leroy@c-s.fr>
 <20510ce03cc9463f1c9e743c1d93b939de501b53.1566219503.git.christophe.leroy@c-s.fr>
 <20190819132313.GH31406@gate.crashing.org>
 <dbafc03a-6eda-d9a3-c451-d242f03b01d9@c-s.fr>
 <20190819143700.GK31406@gate.crashing.org>
 <44a19633-f2a9-79f9-da7c-16ba64a66600@c-s.fr>
 <20190819154531.GM31406@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <6931c0d8-8aa8-8039-fc7f-8e2026b94036@c-s.fr>
Date: Fri, 23 Aug 2019 15:35:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20190819154531.GM31406@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/19/2019 03:45 PM, Segher Boessenkool wrote:
> On Mon, Aug 19, 2019 at 05:05:46PM +0200, Christophe Leroy wrote:
>> Le 19/08/2019 à 16:37, Segher Boessenkool a écrit :
>>> On Mon, Aug 19, 2019 at 04:08:43PM +0200, Christophe Leroy wrote:
>>>> Le 19/08/2019 à 15:23, Segher Boessenkool a écrit :
>>>>> On Mon, Aug 19, 2019 at 01:06:31PM +0000, Christophe Leroy wrote:
>>>>>> Note that we keep using an assembly text using "twi 31, 0, 0" for
>>>>>> inconditional traps because GCC drops all code after
>>>>>> __builtin_trap() when the condition is always true at build time.
>>>>>
>>>>> As I said, it can also do this for conditional traps, if it can prove
>>>>> the condition is always true.
>>>>
>>>> But we have another branch for 'always true' and 'always false' using
>>>> __builtin_constant_p(), which don't use __builtin_trap(). Is there
>>>> anything wrong with that ?:
>>>
>>> The compiler might not realise it is constant when it evaluates the
>>> __builtin_constant_p, but only realises it later.  As the documentation
>>> for the builtin says:
>>>    A return of 0 does not indicate that the
>>>    value is _not_ a constant, but merely that GCC cannot prove it is a
>>>    constant with the specified value of the '-O' option.
>>
>> So you mean GCC would not be able to prove that
>> __builtin_constant_p(cond) is always true but it would be able to prove
>> that if (cond)  is always true ?
> 
> Not sure what you mean, sorry.
> 
>> And isn't there a away to tell GCC that '__builtin_trap()' is
>> recoverable in our case ?
> 
> No, GCC knows that a trap will never fall through.
> 
>>> I think it may work if you do
>>>
>>> #define BUG_ON(x) do {						\
>>> 	if (__builtin_constant_p(x)) {				\
>>> 		if (x)						\
>>> 			BUG();					\
>>> 	} else {						\
>>> 		BUG_ENTRY("", 0);				\
>>> 		if (x)						\
>>> 			__builtin_trap();			\
>>> 	}							\
>>> } while (0)
>>
>> It doesn't work:
> 
> You need to make a BUG_ENTRY so that it refers to the *following* trap
> instruction, if you go this way.
> 
>>> I don't know how BUG_ENTRY works exactly.
>>
>> It's basic, maybe too basic: it adds an inline asm with a label, and
>> adds a .long in the __bug_table section with the address of that label.
>>
>> When putting it after the __builtin_trap(), I changed it to using the
>> address before the one of the label which is always the twxx instruction
>> as far as I can see.
>>
>> #define BUG_ENTRY(insn, flags, ...)			\
>> 	__asm__ __volatile__(				\
>> 		"1:	" insn "\n"			\
>> 		".section __bug_table,\"aw\"\n"		\
>> 		"2:\t" PPC_LONG "1b, %0\n"		\
>> 		"\t.short %1, %2\n"			\
>> 		".org 2b+%3\n"				\
>> 		".previous\n"				\
>> 		: : "i" (__FILE__), "i" (__LINE__),	\
>> 		  "i" (flags),				\
>> 		  "i" (sizeof(struct bug_entry)),	\
>> 		  ##__VA_ARGS__)
> 
> #define MY_BUG_ENTRY(lab, flags)			\
> 	__asm__ __volatile__(				\
> 		".section __bug_table,\"aw\"\n"		\
> 		"2:\t" PPC_LONG "%4, %0\n"		\
> 		"\t.short %1, %2\n"			\
> 		".org 2b+%3\n"				\
> 		".previous\n"				\
> 		: : "i" (__FILE__), "i" (__LINE__),	\
> 		  "i" (flags),				\
> 		  "i" (sizeof(struct bug_entry)),	\
> 		  "i" (lab))
> 
> called as
> 
> #define BUG_ON(x) do {						\
> 	MY_BUG_ENTRY(&&lab, 0);					\
> 	lab: if (x)						\
> 		__builtin_trap();				\
> } while (0)
> 
> not sure how reliable that works -- *if* it works, I just typed that in
> without testing or anything -- but hopefully you get the idea.
> 

I've not been able to make it work. GCC puts the label (.L2 and .L6) 
outside of the function, so the instruction preceding the label is blr, 
not the trap.

#define _EMIT_BUG_ENTRY				\
	".section __bug_table,\"aw\"\n"		\
	"2:\t" PPC_LONG "%4, %0\n"		\
	"\t.short %1, %2\n"			\
	".org 2b+%3\n"				\
	".previous\n"

#define BUG_ENTRY(flags, label)				\
	__asm__ __volatile__(				\
		_EMIT_BUG_ENTRY				\
		: : "i" (__FILE__), "i" (__LINE__),	\
		  "i" (flags),				\
		  "i" (sizeof(struct bug_entry)),	\
		  "i" (label - 4))

#define __recoverable_trap()	asm volatile ("twi 31, 0, 0;");

#define __WARN_FLAGS(flags) do {				\
	__label__ label;					\
	BUG_ENTRY(BUGFLAG_WARNING | (flags), &&label);		\
	__recoverable_trap();					\
	label: ;						\
} while (0)

#define WARN_ON(x) ({						\
	int __ret_warn_on = !!(x);				\
	if (__builtin_constant_p(__ret_warn_on)) {		\
		if (__ret_warn_on)				\
			__WARN_TAINT(TAINT_WARN);		\
	} else {						\
		__label__ label;				\
		BUG_ENTRY(BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN), &&label);	\
		if (__ret_warn_on)				\
			__builtin_trap();			\
		label: ;					\
	}							\
	unlikely(__ret_warn_on);				\
})

void test_warn1(unsigned long long a)
{
	WARN_ON(a);
}

void test_warn2(unsigned long a)
{
	WARN_ON(a);
}

00000000 <test_warn1>:
    0:	7c 63 23 78 	or      r3,r3,r4
    4:	0f 03 00 00 	twnei   r3,0
    8:	4e 80 00 20 	blr

0000000c <test_warn2>:
    c:	0f 03 00 00 	twnei   r3,0
   10:	4e 80 00 20 	blr

RELOCATION RECORDS FOR [__bug_table]:
OFFSET   TYPE              VALUE
00000000 R_PPC_ADDR32      .text+0x00000008
00000004 R_PPC_ADDR32      .rodata.str1.4
0000000c R_PPC_ADDR32      .text+0x00000010
00000010 R_PPC_ADDR32      .rodata.str1.4


	.file	"test.c"
	.section	".text"
.Ltext0:
	.align 2
	.globl test_warn1
	.type	test_warn1, @function
test_warn1:
.LFB598:
	.file 1 "arch/powerpc/mm/test.c"
	.loc 1 34 0
.LBB2:
.LBB3:
	.loc 1 35 0
#APP
  # 35 "arch/powerpc/mm/test.c" 1
	.section __bug_table,"aw"
2:	.long .L2-4, .LC0
	.short 35, 2305
.org 2b+12
.previous

  # 0 "" 2
#NO_APP
	or 3,3,4
	twnei 3,0
	blr
.L3:
.L2:
.LBE3:
.LBE2:
.LFE598:
	.size	test_warn1, .-test_warn1
	.align 2
	.globl test_warn2
	.type	test_warn2, @function
test_warn2:
.LFB599:
	.loc 1 39 0
.LBB4:
.LBB5:
	.loc 1 40 0
#APP
  # 40 "arch/powerpc/mm/test.c" 1
	.section __bug_table,"aw"
2:	.long .L6-4, .LC0
	.short 40, 2305
.org 2b+12
.previous

  # 0 "" 2
#NO_APP
	twnei 3,0
	blr
.L7:
.L6:
.LBE5:
.LBE4:
.LFE599:

Any idea ?

Christophe
