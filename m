Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CEF45E86E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 08:21:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0mQ20V6kz3cSP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 18:21:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0mPY1P2Mz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 18:21:02 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0mPR3715z9sSM;
 Fri, 26 Nov 2021 08:20:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xS4T5dDlRt_V; Fri, 26 Nov 2021 08:20:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0mPR2Pckz9sS3;
 Fri, 26 Nov 2021 08:20:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3FC888B77D;
 Fri, 26 Nov 2021 08:20:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vnqXbkxxx_fy; Fri, 26 Nov 2021 08:20:59 +0100 (CET)
Received: from [192.168.204.6] (unknown [192.168.204.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EF1B58B763;
 Fri, 26 Nov 2021 08:20:58 +0100 (CET)
Message-ID: <9b7e25dc-1ec6-2553-3fb4-d443f0d82fe8@csgroup.eu>
Date: Fri, 26 Nov 2021 08:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 00/17] powerpc: Make hash MMU code build configurable
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211125125025.1472060-1-npiggin@gmail.com>
 <27f9cddf-44db-1d1f-17e0-fd8252c7a1c9@csgroup.eu>
 <d792e8a6-de81-1f93-8938-d1d9d6a1e748@csgroup.eu>
 <1637887917.uatiybce4e.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1637887917.uatiybce4e.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/11/2021 à 01:55, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of November 26, 2021 3:35 am:
>>
>>
>> Le 25/11/2021 à 17:35, Christophe Leroy a écrit :
>>>
>>>
>>> Le 25/11/2021 à 13:50, Nicholas Piggin a écrit :
>>>> Now that there's a platform that can make good use of it, here's
>>>> a series that can prevent the hash MMU code being built for 64s
>>>> platforms that don't need it.
>>>
>>> # CONFIG_PPC_64S_HASH_MMU is not set
>>>
>>>
>>> <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented
>>> [-Wcpp]
>>> arch/powerpc/platforms/cell/spu_base.c: In function '__spu_kernel_slb':
>>> arch/powerpc/platforms/cell/spu_base.c:215:38: error: 'mmu_linear_psize'
>>> undeclared (first use in this function); did you mean 'mmu_virtual_psize'?
>>>     215 |                 llp = mmu_psize_defs[mmu_linear_psize].sllp;
>>>         |                                      ^~~~~~~~~~~~~~~~
>>>         |                                      mmu_virtual_psize
>>> arch/powerpc/platforms/cell/spu_base.c:215:38: note: each undeclared
>>> identifier is reported only once for each function it appears in
>>> make[3]: *** [scripts/Makefile.build:287:
>>> arch/powerpc/platforms/cell/spu_base.o] Error 1
>>> make[2]: *** [scripts/Makefile.build:549: arch/powerpc/platforms/cell]
>>> Error 2
>>> make[1]: *** [scripts/Makefile.build:549: arch/powerpc/platforms] Error 2
>>> make: *** [Makefile:1846: arch/powerpc] Error 2
>>>
>>>
>>
>>
>> With CONFIG_SPU_BASE removed, the above voids and I get to the final
>> link with the following errors:
> 
> This is building cell platform with POWER9 CPU and !HASH?

I took ppc64_defconfig, changed CPU to POWER9 and removed VIRTUALIZATION 
and removed CONFIG_PPC_64S_HASH_MMU.

> 
> We don't have to make that build, just prevent the config. I had that in
> a previous version which also had platforms select hash, but we went to
> just CPU. But now there's no constraint that prevents cell+POWER9 even
> though it doesn't make sense.
> 
> Not sure the best way to fix it. I'll think about it.
> 

Force selection of CONFIG_PPC_64S_HASH_MMU by the CELL platform ?
