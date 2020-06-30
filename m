Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5232120F7C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 16:59:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x6vN5BhMzDqlB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 00:59:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x6pp6KSkzDqk5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 00:55:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49x6pZ5Tr4z9twdq;
 Tue, 30 Jun 2020 16:55:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DW2g8NlcVvk7; Tue, 30 Jun 2020 16:55:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49x6pZ0L9vz9tvrw;
 Tue, 30 Jun 2020 16:55:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 269198B7E4;
 Tue, 30 Jun 2020 16:55:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yCXNo6XMiDNf; Tue, 30 Jun 2020 16:55:04 +0200 (CEST)
Received: from [10.25.210.22] (po15451.idsi0.si.c-s.fr [10.25.210.22])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D96818B7DE;
 Tue, 30 Jun 2020 16:55:03 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/uaccess: Use flexible addressing with
 __put_user()/__get_user()
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com,
 segher@kernel.crashing.org
References: <c2addbd9d76212242d3d8554a2f7ff849fb08b85.1587040754.git.christophe.leroy@c-s.fr>
 <7b916759-1683-b4df-0d4b-b04b3fcd9a02@csgroup.eu>
 <878sg6862r.fsf@mpe.ellerman.id.au> <875zb98i5a.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <311c3471-cad7-72d5-a5e6-04cf892c5e41@csgroup.eu>
Date: Tue, 30 Jun 2020 16:55:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <875zb98i5a.fsf@mpe.ellerman.id.au>
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



Le 30/06/2020 à 03:19, Michael Ellerman a écrit :
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Hi Michael,
>>>
>>> I see this patch is marked as "defered" in patchwork, but I can't see
>>> any related discussion. Is it normal ?
>>
>> Because it uses the "m<>" constraint which didn't work on GCC 4.6.
>>
>> https://github.com/linuxppc/issues/issues/297
>>
>> So we should be able to pick it up for v5.9 hopefully.
> 
> It seems to break the build with the kernel.org 4.9.4 compiler and
> corenet64_smp_defconfig:

Looks like 4.9.4 doesn't accept "m<>" constraint either.
Changing it to "m" make it build.

Christophe

> 
> + make -s CC=powerpc64-linux-gnu-gcc -j 160
> In file included from /linux/include/linux/uaccess.h:11:0,
>                   from /linux/include/linux/sched/task.h:11,
>                   from /linux/include/linux/sched/signal.h:9,
>                   from /linux/include/linux/rcuwait.h:6,
>                   from /linux/include/linux/percpu-rwsem.h:7,
>                   from /linux/include/linux/fs.h:33,
>                   from /linux/include/linux/huge_mm.h:8,
>                   from /linux/include/linux/mm.h:675,
>                   from /linux/arch/powerpc/kernel/signal_32.c:17:
> /linux/arch/powerpc/kernel/signal_32.c: In function 'save_user_regs.isra.14.constprop':
> /linux/arch/powerpc/include/asm/uaccess.h:161:2: error: 'asm' operand has impossible constraints
>    __asm__ __volatile__(     \
>    ^
> /linux/arch/powerpc/include/asm/uaccess.h:197:12: note: in expansion of macro '__put_user_asm'
>      case 4: __put_user_asm(x, ptr, retval, "stw"); break; \
>              ^
> /linux/arch/powerpc/include/asm/uaccess.h:206:2: note: in expansion of macro '__put_user_size_allowed'
>    __put_user_size_allowed(x, ptr, size, retval);  \
>    ^
> /linux/arch/powerpc/include/asm/uaccess.h:220:2: note: in expansion of macro '__put_user_size'
>    __put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
>    ^
> /linux/arch/powerpc/include/asm/uaccess.h:96:2: note: in expansion of macro '__put_user_nocheck'
>    __put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
>    ^
> /linux/arch/powerpc/kernel/signal_32.c:120:7: note: in expansion of macro '__put_user'
>     if (__put_user((unsigned int)gregs[i], &frame->mc_gregs[i]))
>         ^
> /linux/scripts/Makefile.build:280: recipe for target 'arch/powerpc/kernel/signal_32.o' failed
> make[3]: *** [arch/powerpc/kernel/signal_32.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> In file included from /linux/include/linux/uaccess.h:11:0,
>                   from /linux/include/linux/sched/task.h:11,
>                   from /linux/include/linux/sched/signal.h:9,
>                   from /linux/include/linux/rcuwait.h:6,
>                   from /linux/include/linux/percpu-rwsem.h:7,
>                   from /linux/include/linux/fs.h:33,
>                   from /linux/include/linux/huge_mm.h:8,
>                   from /linux/include/linux/mm.h:675,
>                   from /linux/arch/powerpc/kernel/signal_64.c:12:
> /linux/arch/powerpc/kernel/signal_64.c: In function '__se_sys_swapcontext':
> /linux/arch/powerpc/include/asm/uaccess.h:319:2: error: 'asm' operand has impossible constraints
>    __asm__ __volatile__(    \
>    ^
> /linux/arch/powerpc/include/asm/uaccess.h:359:10: note: in expansion of macro '__get_user_asm'
>    case 1: __get_user_asm(x, (u8 __user *)ptr, retval, "lbz"); break; \
>            ^
> /linux/arch/powerpc/include/asm/uaccess.h:370:2: note: in expansion of macro '__get_user_size_allowed'
>    __get_user_size_allowed(x, ptr, size, retval);  \
>    ^
> /linux/arch/powerpc/include/asm/uaccess.h:393:3: note: in expansion of macro '__get_user_size'
>     __get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
>     ^
> /linux/arch/powerpc/include/asm/uaccess.h:94:2: note: in expansion of macro '__get_user_nocheck'
>    __get_user_nocheck((x), (ptr), sizeof(*(ptr)), true)
>    ^
> /linux/arch/powerpc/kernel/signal_64.c:672:9: note: in expansion of macro '__get_user'
>        || __get_user(tmp, (u8 __user *) new_ctx + ctx_size - 1))
>           ^
> /linux/scripts/Makefile.build:280: recipe for target 'arch/powerpc/kernel/signal_64.o' failed
> make[3]: *** [arch/powerpc/kernel/signal_64.o] Error 1
> /linux/scripts/Makefile.build:497: recipe for target 'arch/powerpc/kernel' failed
> make[2]: *** [arch/powerpc/kernel] Error 2
> /linux/Makefile:1756: recipe for target 'arch/powerpc' failed
> make[1]: *** [arch/powerpc] Error 2
> Makefile:185: recipe for target '__sub-make' failed
> make: *** [__sub-make] Error 2
> 
> 
> cheers
> 
