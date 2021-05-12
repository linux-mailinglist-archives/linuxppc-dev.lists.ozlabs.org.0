Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4637C085
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 16:44:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgHc93kcpz308f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 00:44:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgHbq0HHrz2xv1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 00:43:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FgHbh5mDJz9sdw;
 Wed, 12 May 2021 16:43:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XhpERfMAMcjt; Wed, 12 May 2021 16:43:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FgHbh4nsRz9sdc;
 Wed, 12 May 2021 16:43:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 83D6C8B7F4;
 Wed, 12 May 2021 16:43:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KNm8b5FGVtrW; Wed, 12 May 2021 16:43:44 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 10B2E8B7F3;
 Wed, 12 May 2021 16:43:44 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Force inlining of csum_add()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <f7f4d4e364de6e473da874468b903da6e5d97adc.1620713272.git.christophe.leroy@csgroup.eu>
 <20210511105154.GJ10366@gate.crashing.org>
 <e996ef13-c25c-5e9c-edd2-444eded88802@csgroup.eu>
 <20210512143105.GW10366@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2623fe98-7a73-f7a2-bcba-2d668d00ffd0@csgroup.eu>
Date: Wed, 12 May 2021 16:43:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210512143105.GW10366@gate.crashing.org>
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



Le 12/05/2021 à 16:31, Segher Boessenkool a écrit :
> On Wed, May 12, 2021 at 02:56:56PM +0200, Christophe Leroy wrote:
>> Le 11/05/2021 à 12:51, Segher Boessenkool a écrit :
>>> Something seems to have decided this asm is more expensive than it is.
>>> That isn't always avoidable -- the compiler cannot look inside asms --
>>> but it seems it could be improved here.
>>>
>>> Do you have (or can make) a self-contained testcase?
>>
>> I have not tried, and I fear it might be difficult, because on a kernel
>> build with dozens of calls to csum_add(), only ip6_tunnel.o exhibits such
>> an issue.
> 
> Yeah.  Sometimes you can force some of the decisions, but that usually
> requires knowing too many GCC internals :-/
> 
>>>> And there is even one completely unused instance of csum_add().
>>>
>>> That is strange, that should never happen.
>>
>> It seems that several .o include unused versions of csum_add. After the
>> final link, one remains (in addition to the used one) in vmlinux.
> 
> But it is a static function, so it should not end up in any object file
> where it isn't used.

Well .... did I dream ?

Now I only find one extra .o with unused csum_add() : That's net/ipv6/exthdrs.o
It matches the one found in vmlinux.

Are you interested in -fdump-tree-einline-all for that one as well ?

Christophe
