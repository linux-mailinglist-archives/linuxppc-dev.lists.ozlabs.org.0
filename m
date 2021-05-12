Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CC537BD83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 14:57:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgFFC4lDqz3065
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 22:57:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgFDt0z36z2xgL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 22:57:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FgFDj4JDkz9sf2;
 Wed, 12 May 2021 14:57:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKX-q6AHXoOp; Wed, 12 May 2021 14:57:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FgFDj3J5cz9sf1;
 Wed, 12 May 2021 14:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DE178B7F2;
 Wed, 12 May 2021 14:57:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id r9l0ajoEPVOw; Wed, 12 May 2021 14:57:09 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CFDFF8B7EF;
 Wed, 12 May 2021 14:57:08 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Force inlining of csum_add()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <f7f4d4e364de6e473da874468b903da6e5d97adc.1620713272.git.christophe.leroy@csgroup.eu>
 <20210511105154.GJ10366@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e996ef13-c25c-5e9c-edd2-444eded88802@csgroup.eu>
Date: Wed, 12 May 2021 14:56:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511105154.GJ10366@gate.crashing.org>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 11/05/2021 à 12:51, Segher Boessenkool a écrit :
> Hi!
> 
> On Tue, May 11, 2021 at 06:08:06AM +0000, Christophe Leroy wrote:
>> Commit 328e7e487a46 ("powerpc: force inlining of csum_partial() to
>> avoid multiple csum_partial() with GCC10") inlined csum_partial().
>>
>> Now that csum_partial() is inlined, GCC outlines csum_add() when
>> called by csum_partial().
> 
>> c064fb28 <csum_add>:
>> c064fb28:	7c 63 20 14 	addc    r3,r3,r4
>> c064fb2c:	7c 63 01 94 	addze   r3,r3
>> c064fb30:	4e 80 00 20 	blr
> 
> Could you build this with -fdump-tree-einline-all and send me the
> results?  Or open a GCC PR yourself :-)

Ok, I'll forward it to you in a minute.

> 
> Something seems to have decided this asm is more expensive than it is.
> That isn't always avoidable -- the compiler cannot look inside asms --
> but it seems it could be improved here.
> 
> Do you have (or can make) a self-contained testcase?

I have not tried, and I fear it might be difficult, because on a kernel build with dozens of calls 
to csum_add(), only ip6_tunnel.o exhibits such an issue.

> 
>> The sum with 0 is useless, should have been skipped.
> 
> That isn't something the compiler can do anything about (not sure if you
> were suggesting that); it has to be done in the user code (and it tries
> to already, see below).

I was not suggesting that, only that when properly inlined the sum with 0 is skipped (because we put 
the necessary stuff in csum_add() of course).

> 
>> And there is even one completely unused instance of csum_add().
> 
> That is strange, that should never happen.

It seems that several .o include unused versions of csum_add. After the final link, one remains (in 
addition to the used one) in vmlinux.

> 
>> ./arch/powerpc/include/asm/checksum.h: In function '__ip6_tnl_rcv':
>> ./arch/powerpc/include/asm/checksum.h:94:22: warning: inlining failed in call to 'csum_add': call is unlikely and code size would grow [-Winline]
>>     94 | static inline __wsum csum_add(__wsum csum, __wsum addend)
>>        |                      ^~~~~~~~
>> ./arch/powerpc/include/asm/checksum.h:172:31: note: called from here
>>    172 |                         sum = csum_add(sum, (__force __wsum)*(const u32 *)buff);
>>        |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> At least we say what happened.  Progress!  :-)

Lol. I've seen this warning for long, that's not something new I guess.

> 
>> In the non-inlined version, the first sum with 0 was performed.
>> Here it is skipped.
> 
> That is because of how __builtin_constant_p works, most likely.  As we
> discussed elsewhere it is evaluated before all forms of loop unrolling.

But we are not talking about loop unrolling here, are we ?

It seems that the reason here is that __builtin_constant_p() is evaluated long after GCC decided to 
not inline that call to csum_add().

Christophe
