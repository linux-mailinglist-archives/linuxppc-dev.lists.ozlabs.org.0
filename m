Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EF64467E6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 18:27:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm6sP4WlQz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 04:27:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm6ry2lFGz303H
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 04:27:29 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Hm6rv0p0hz9sSb;
 Fri,  5 Nov 2021 18:27:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxePGCrJqMhB; Fri,  5 Nov 2021 18:27:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Hm6rt6rSBz9sSV;
 Fri,  5 Nov 2021 18:27:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE1748B786;
 Fri,  5 Nov 2021 18:27:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id k2h3r7klAphF; Fri,  5 Nov 2021 18:27:26 +0100 (CET)
Received: from [192.168.233.150] (unknown [192.168.233.150])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 62C898B763;
 Fri,  5 Nov 2021 18:27:26 +0100 (CET)
Message-ID: <79ae1f49-f6b1-e9ad-977d-0cc7e553c7b9@csgroup.eu>
Date: Fri, 5 Nov 2021 18:27:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
Content-Language: fr-FR
To: Finn Thain <fthain@linux-m68k.org>
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
 <48c3ed15-2ecf-cc12-c287-2b61457f5fb@nippy.intranet>
 <a1e6c282-c8fd-9671-5df6-cd7ca06fdbb3@csgroup.eu>
 <de4b689-236e-505e-2632-6ce89110a1e9@linux-m68k.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <de4b689-236e-505e-2632-6ce89110a1e9@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "Christopher M. Riedl" <cmr@linux.ibm.com>,
 Stan Johnson <stanley.johnson.001@protonmail.com>,
 linuxppc-dev@lists.ozlabs.org, Riccardo Mottola <riccardo.mottola@libero.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/11/2021 à 00:36, Finn Thain a écrit :
> On Thu, 4 Nov 2021, Christophe Leroy wrote:
> 
>> Le 02/11/2021 à 03:20, Finn Thain a écrit :
>>> Hi Christopher,
>>>
>>> After many builds and tests, Stan and I were able to determine that this
>>> regression only affects builds with CONFIG_USER_NS=y. That is,
>>>
>>> d3ccc9781560  + CONFIG_USER_NS=y  -->  fail
>>> d3ccc9781560  + CONFIG_USER_NS=n  -->  okay
>>> d3ccc9781560~ + CONFIG_USER_NS=y  -->  okay
>>> d3ccc9781560~ + CONFIG_USER_NS=n  -->  okay
>>>
>>> Stan also tested a PowerMac G3 system and found that the regression is not
>>> present there. Thus far, only PowerMac G4 systems are known to be affected
>>> (Stan's Cube and Riccardo's PowerBook).
>>>
>>> I asked Stan to try v5.15-rc after reverting commit d3ccc9781560.
>>> Unexpectedly, this build had the same issue. So, it appears there are
>>> multiple bad commits that produce this Xorg failure, of which d3ccc9781560
>>> is just the first.
>>>
>>> But there's no easy way to identify the other bad commits using bisection.
>>> So I've addressed this message to you. Can you help fix this regression?
>>>
>>
>> I'm wondering if this commit is really the cause of the problem.
>>
>> Are you using GCC 11 ?
>>
>> If yes, I think it could be a false positive, fixed by
>> https://github.com/linuxppc/linux/commit/7315e457d6bc
>>
>> Can you try with GCC 10 or older ?
>>
> 
> AFAIK, all of Stan's builds were made with gcc 10.
> 
>> Can you cherry pick 7315e457d6bc ("powerpc/uaccess: Fix __get_user() with
>> CONFIG_CC_HAS_ASM_GOTO_OUTPUT") on top of d3ccc9781560 and see what happens ?
>>
> 
> $ git checkout d3ccc9781560
> $ git cherry-pick 7315e457d6bc
> Auto-merging arch/powerpc/include/asm/uaccess.h
> CONFLICT (content): Merge conflict in arch/powerpc/include/asm/uaccess.h
> error: could not apply 7315e457d6bc... powerpc/uaccess: Fix __get_user() with CONFIG_CC_HAS_ASM_GOTO_OUTPUT
> 
> There is no __get_user_asm2_goto in this tree, and __get_user_asm2 already
> has the "=&r" constraint:
> 
> #define __get_user_asm2(x, addr, err)                   \
>          __asm__ __volatile__(                           \
>                  "1:     lwz%X2 %1, %2\n"                        \
>                  "2:     lwz%X2 %L1, %L2\n"              \
>                  "3:\n"                                  \
>                  ".section .fixup,\"ax\"\n"              \
>                  "4:     li %0,%3\n"                     \
>                  "       li %1,0\n"                      \
>                  "       li %1+1,0\n"                    \
>                  "       b 3b\n"                         \
>                  ".previous\n"                           \
>                  EX_TABLE(1b, 4b)                        \
>                  EX_TABLE(2b, 4b)                        \
>                  : "=r" (err), "=&r" (x)                 \
>                  : "m" (*addr), "i" (-EFAULT), "0" (err))
> 

You are right, __get_user_asm2_goto() was added later.

I think I found the issue.

__get_user_sigset() is wrong for 32 bits.

Could you change its content  to return __get_user(*(u64*)&dst->sig[0], 
(u64 __user *)&src->sig[0]);

If it works, for the mainline also change unsafe_get_user_sigset()

Christophe
