Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A614BA3C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 15:55:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzyZ136mgz3cZc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 01:55:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzyYW2pNkz3cBv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 01:55:25 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JzyYQ5rB1z9sSZ;
 Thu, 17 Feb 2022 15:55:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TsOvGGPTaGjN; Thu, 17 Feb 2022 15:55:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JzyYP59kZz9sSW;
 Thu, 17 Feb 2022 15:55:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A04598B77C;
 Thu, 17 Feb 2022 15:55:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jCpsHyiEQc1l; Thu, 17 Feb 2022 15:55:21 +0100 (CET)
Received: from [192.168.6.239] (unknown [192.168.6.239])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 158D78B763;
 Thu, 17 Feb 2022 15:55:21 +0100 (CET)
Message-ID: <9b8ef186-c7fe-822c-35df-342c9e86cc88@csgroup.eu>
Date: Thu, 17 Feb 2022 15:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH net v3] net: Force inlining of checksum functions in
 net/checksum.h
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: David Laight <David.Laight@ACULAB.COM>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
References: <978951d76d8cb84bab347c7623bc163e9a038452.1645100305.git.christophe.leroy@csgroup.eu>
 <35bcd5df0fb546008ff4043dbea68836@AcuMS.aculab.com>
 <d38e5e1c-29b6-8cc6-7409-d0bdd5772f23@csgroup.eu>
In-Reply-To: <d38e5e1c-29b6-8cc6-7409-d0bdd5772f23@csgroup.eu>
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/02/2022 à 15:50, Christophe Leroy a écrit :
> Adding Ingo, Andrew and Nick as they were involved in the subjet,
> 
> Le 17/02/2022 à 14:36, David Laight a écrit :
>> From: Christophe Leroy
>>> Sent: 17 February 2022 12:19
>>>
>>> All functions defined as static inline in net/checksum.h are
>>> meant to be inlined for performance reason.
>>>
>>> But since commit ac7c3e4ff401 ("compiler: enable
>>> CONFIG_OPTIMIZE_INLINING forcibly") the compiler is allowed to
>>> uninline functions when it wants.
>>>
>>> Fair enough in the general case, but for tiny performance critical
>>> checksum helpers that's counter-productive.
>>
>> There isn't a real justification for allowing the compiler
>> to 'not inline' functions in that commit.
> 
> Do you mean that the two following commits should be reverted:
> 
> - 889b3c1245de ("compiler: remove CONFIG_OPTIMIZE_INLINING entirely")
> - 4c4e276f6491 ("net: Force inlining of checksum functions in 
> net/checksum.h")

Of course not the above one (copy/paste error), but:
- ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING forcibly")


> 
>>
>> It rather seems backwards.
>> The kernel sources don't really have anything marked 'inline'
>> that shouldn't always be inlined.
>> If there are any such functions they are few and far between.
>>
>> I've had enough trouble (elsewhere) getting gcc to inline
>> static functions that are only called once.
>> I ended up using 'always_inline'.
>> (That is 4k of embedded object code that will be too slow
>> if it ever spills a register to stack.)
>>
> 
> I agree with you that that change is a nightmare with many small 
> functions that we really want inlined, and when we force inlining we 
> most of the time get a smaller binary.
> 
> And it becomes even more problematic when we start adding 
> instrumentation like stack protector.
> 
> According to the original commits however this was supposed to provide 
> real benefit:
> 
> - 60a3cdd06394 ("x86: add optimized inlining")
> - 9012d011660e ("compiler: allow all arches to enable 
> CONFIG_OPTIMIZE_INLINING")
> 
> But when I build ppc64le_defconfig + CONFIG_CC_OPTIMISE_FOR_SIZE I get:
>      112 times  queued_spin_unlock()
>      122 times  mmiowb_spin_unlock()
>      151 times  cpu_online()
>      225 times  __raw_spin_unlock()
> 
> 
> So I was wondering, would we have a way to force inlining of functions 
> marked inline in header files while leaving GCC handling the ones in C 
> files the way it wants ?
> 
> Christophe
