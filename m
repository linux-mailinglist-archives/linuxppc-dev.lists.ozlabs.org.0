Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B53C210475
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 09:05:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xXLZ3yHrzDqhS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 17:05:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xXJS4cnszDqdw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 17:03:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49xXJF6R5rz9v1xr;
 Wed,  1 Jul 2020 09:03:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lJg3lFJH2Aax; Wed,  1 Jul 2020 09:03:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49xXJF20wwz9v1xq;
 Wed,  1 Jul 2020 09:03:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C5EB48B7DE;
 Wed,  1 Jul 2020 09:03:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id o-A-Qpkw4yiK; Wed,  1 Jul 2020 09:03:41 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B87B8B75F;
 Wed,  1 Jul 2020 09:03:41 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/uaccess: Use flexible addressing with
 __put_user()/__get_user()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <c2addbd9d76212242d3d8554a2f7ff849fb08b85.1587040754.git.christophe.leroy@c-s.fr>
 <7b916759-1683-b4df-0d4b-b04b3fcd9a02@csgroup.eu>
 <878sg6862r.fsf@mpe.ellerman.id.au> <875zb98i5a.fsf@mpe.ellerman.id.au>
 <311c3471-cad7-72d5-a5e6-04cf892c5e41@csgroup.eu>
 <20200630163324.GW3598@gate.crashing.org>
 <f8819fa4-94e3-4bf9-4b60-c57d2804e529@csgroup.eu>
 <20200630211817.GZ3598@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <aaf5ac33-cd24-3b82-a034-2fc1d43d443f@csgroup.eu>
Date: Wed, 1 Jul 2020 09:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630211817.GZ3598@gate.crashing.org>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/06/2020 à 23:18, Segher Boessenkool a écrit :
> Hi again,
> 
> Thanks for your work so far!
> 
> On Tue, Jun 30, 2020 at 06:53:39PM +0000, Christophe Leroy wrote:
>> On 06/30/2020 04:33 PM, Segher Boessenkool wrote:
>>>>> + make -s CC=powerpc64-linux-gnu-gcc -j 160
>>>>> In file included from /linux/include/linux/uaccess.h:11:0,
>>>>>                   from /linux/include/linux/sched/task.h:11,
>>>>>                   from /linux/include/linux/sched/signal.h:9,
>>>>>                   from /linux/include/linux/rcuwait.h:6,
>>>>>                   from /linux/include/linux/percpu-rwsem.h:7,
>>>>>                   from /linux/include/linux/fs.h:33,
>>>>>                   from /linux/include/linux/huge_mm.h:8,
>>>>>                   from /linux/include/linux/mm.h:675,
>>>>>                   from /linux/arch/powerpc/kernel/signal_32.c:17:
>>>>> /linux/arch/powerpc/kernel/signal_32.c: In function
>>>>> 'save_user_regs.isra.14.constprop':
>>>>> /linux/arch/powerpc/include/asm/uaccess.h:161:2: error: 'asm' operand has
>>>>> impossible constraints
>>>>>    __asm__ __volatile__(     \
>>>>>    ^
>>>>> /linux/arch/powerpc/include/asm/uaccess.h:197:12: note: in expansion of
>>>>> macro '__put_user_asm'
>>>>>      case 4: __put_user_asm(x, ptr, retval, "stw"); break; \
>>>>>              ^
>>>>> /linux/arch/powerpc/include/asm/uaccess.h:206:2: note: in expansion of
>>>>> macro '__put_user_size_allowed'
>>>>>    __put_user_size_allowed(x, ptr, size, retval);  \
>>>>>    ^
>>>>> /linux/arch/powerpc/include/asm/uaccess.h:220:2: note: in expansion of
>>>>> macro '__put_user_size'
>>>>>    __put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
>>>>>    ^
>>>>> /linux/arch/powerpc/include/asm/uaccess.h:96:2: note: in expansion of
>>>>> macro '__put_user_nocheck'
>>>>>    __put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
>>>>>    ^
>>>>> /linux/arch/powerpc/kernel/signal_32.c:120:7: note: in expansion of macro
>>>>> '__put_user'
>>>>>     if (__put_user((unsigned int)gregs[i], &frame->mc_gregs[i]))
>>>>>         ^
>>>
>>> Can we see what that was after the macro jungle?  Like, the actual
>>> preprocessed code?
>>
>> Sorry for previous misunderstanding
>>
>> Here is the code:
>>
>> #define __put_user_asm(x, addr, err, op)			\
>> 	__asm__ __volatile__(					\
>> 		"1:	" op "%U2%X2 %1,%2	# put_user\n"	\
>> 		"2:\n"						\
>> 		".section .fixup,\"ax\"\n"			\
>> 		"3:	li %0,%3\n"				\
>> 		"	b 2b\n"					\
>> 		".previous\n"					\
>> 		EX_TABLE(1b, 3b)				\
>> 		: "=r" (err)					\
>> 		: "r" (x), "m<>" (*addr), "i" (-EFAULT), "0" (err))
> 
> Yeah I don't see it.  I'll have to look at compiler debug dumps, but I
> don't have any working 4.9 around, and I cannot reproduce this with
> either older or newer compilers.

I reproduced it with 4.8.5

> 
> It is complainig that constrain_operands just does not work *at all* on
> this "m<>" constraint apparently, which doesn't make much sense.
> 

Here is a small reproducer:

#include <linux/elf.h>
#include <linux/ptrace.h>
#include <linux/uaccess.h>

struct mcontext {
	elf_gregset_t32		mc_gregs;
	elf_fpregset_t		mc_fregs;
	unsigned int		mc_pad[2];
	elf_vrregset_t32	mc_vregs __attribute__((__aligned__(16)));
	elf_vsrreghalf_t32      mc_vsregs __attribute__((__aligned__(16)));
};

int save_general_regs(struct pt_regs *regs, struct mcontext __user *frame)
{
	elf_greg_t64 *gregs = (elf_greg_t64 *)regs;
	int i;

	for (i = 0; i <= PT_RESULT; i ++) {
		if (i == 14)
			i = 32;
		if (__put_user((unsigned int)gregs[i], &frame->mc_gregs[i]))
			return -EFAULT;
	}
	return 0;
}


If you remove the "if i == 14 ..." you get no failure.

Preprocessor result:

int save_general_regs(struct pt_regs *regs, struct mcontext *frame)
{
  elf_greg_t64 *gregs = (elf_greg_t64 *)regs;
  int i;

  for (i = 0; i <= 43; i ++) {
   if (i == 14)
    i = 32;
   if (({ long __pu_err; __typeof__(*((&frame->mc_gregs[i]))) *__pu_addr 
= ((&frame->mc_gregs[i])); __typeof__(*((&frame->mc_gregs[i]))) __pu_val 
= ((__typeof__(*(&frame->mc_gregs[i])))((unsigned int)gregs[i])); 
__typeof__(sizeof(*(&frame->mc_gregs[i]))) __pu_size = 
(sizeof(*(&frame->mc_gregs[i]))); if (!(((unsigned long)__pu_addr) >= 
0x8000000000000000ul)) might_fault(); (void)0; do { 
allow_write_to_user(__pu_addr, __pu_size); do { __pu_err = 0; switch 
(__pu_size) { case 1: __asm__ __volatile__( "1:	" "stb" "%U2%X2 %1,%2	# 
put_user\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	li %0,%3\n" "	b 2b\n" 
".previous\n" ".section __ex_table,\"a\";" " " ".balign 4;" " " ".long 
(1b) - . ;" " " ".long (3b) - . ;" " " ".previous" " " : "=r" (__pu_err) 
: "r" (__pu_val), "m<>" (*__pu_addr), "i" (-14), "0" (__pu_err)); break; 
case 2: __asm__ __volatile__( "1:	" "sth" "%U2%X2 %1,%2	# put_user\n" 
"2:\n" ".section .fixup,\"ax\"\n" "3:	li %0,%3\n" "	b 2b\n" 
".previous\n" ".section __ex_table,\"a\";" " " ".balign 4;" " " ".long 
(1b) - . ;" " " ".long (3b) - . ;" " " ".previous" " " : "=r" (__pu_err) 
: "r" (__pu_val), "m<>" (*__pu_addr), "i" (-14), "0" (__pu_err)); break; 
case 4: __asm__ __volatile__( "1:	" "stw" "%U2%X2 %1,%2	# put_user\n" 
"2:\n" ".section .fixup,\"ax\"\n" "3:	li %0,%3\n" "	b 2b\n" 
".previous\n" ".section __ex_table,\"a\";" " " ".balign 4;" " " ".long 
(1b) - . ;" " " ".long (3b) - . ;" " " ".previous" " " : "=r" (__pu_err) 
: "r" (__pu_val), "m<>" (*__pu_addr), "i" (-14), "0" (__pu_err)); break; 
case 8: __asm__ __volatile__( "1:	" "std" "%U2%X2 %1,%2	# put_user\n" 
"2:\n" ".section .fixup,\"ax\"\n" "3:	li %0,%3\n" "	b 2b\n" 
".previous\n" ".section __ex_table,\"a\";" " " ".balign 4;" " " ".long 
(1b) - . ;" " " ".long (3b) - . ;" " " ".previous" " " : "=r" (__pu_err) 
: "r" (__pu_val), "m<>" (*__pu_addr), "i" (-14), "0" (__pu_err)); break; 
default: __put_user_bad(); } } while (0); 
prevent_write_to_user(__pu_addr, __pu_size); } while (0); __pu_err; }))
    return -14;
  }
  return 0;
}


Christophe
