Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC523FB1B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 09:13:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyhP9534Jz2yV4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 17:13:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyhNl49pRz2xrN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 17:12:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GyhNc0NP3z9sT7;
 Mon, 30 Aug 2021 09:12:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KS3m4OP4GZGC; Mon, 30 Aug 2021 09:12:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GyhNb6Kvyz9sT6;
 Mon, 30 Aug 2021 09:12:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A9BD78B777;
 Mon, 30 Aug 2021 09:12:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id r89ZxSzcKTiE; Mon, 30 Aug 2021 09:12:47 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A8858B763;
 Mon, 30 Aug 2021 09:12:47 +0200 (CEST)
Subject: Re: [RFC PATCH 4/6] powerpc/64s: Make hash MMU code build configurable
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210827163410.1177154-1-npiggin@gmail.com>
 <20210827163410.1177154-5-npiggin@gmail.com>
 <da2863dc-f8d9-f58b-0d52-7e1bd668718c@csgroup.eu>
 <1630306319.j6p7gkgn6s.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2374bc94-f1b1-574c-ceca-4787d9ef2382@csgroup.eu>
Date: Mon, 30 Aug 2021 09:12:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630306319.j6p7gkgn6s.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/08/2021 à 08:55, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of August 28, 2021 7:59 pm:
>>
>>
>> Le 27/08/2021 à 18:34, Nicholas Piggin a écrit :
>>> Introduce a new option CONFIG_PPC_64S_HASH_MMU which allows the 64s hash
>>> MMU code to be compiled out if radix is selected and the minimum
>>> supported CPU type is POWER9 or higher, and KVM is not selected.
>>>
>>> This saves 128kB kernel image size (90kB text) on powernv_defconfig
>>> minus KVM, 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    arch/powerpc/Kconfig                          |  1 +
>>>    arch/powerpc/include/asm/book3s/64/mmu.h      | 22 +++++-
>>>    .../include/asm/book3s/64/tlbflush-hash.h     |  7 ++
>>>    arch/powerpc/include/asm/book3s/pgtable.h     |  4 ++
>>>    arch/powerpc/include/asm/mmu.h                | 38 +++++++++--
>>>    arch/powerpc/include/asm/mmu_context.h        |  2 +
>>>    arch/powerpc/include/asm/paca.h               |  8 +++
>>>    arch/powerpc/kernel/asm-offsets.c             |  2 +
>>>    arch/powerpc/kernel/dt_cpu_ftrs.c             | 10 ++-
>>>    arch/powerpc/kernel/entry_64.S                |  4 +-
>>>    arch/powerpc/kernel/exceptions-64s.S          | 16 +++++
>>>    arch/powerpc/kernel/mce.c                     |  2 +-
>>>    arch/powerpc/kernel/mce_power.c               | 10 ++-
>>>    arch/powerpc/kernel/paca.c                    | 18 ++---
>>>    arch/powerpc/kernel/process.c                 | 13 ++--
>>>    arch/powerpc/kernel/prom.c                    |  2 +
>>>    arch/powerpc/kernel/setup_64.c                |  4 ++
>>>    arch/powerpc/kexec/core_64.c                  |  4 +-
>>>    arch/powerpc/kexec/ranges.c                   |  4 ++
>>>    arch/powerpc/kvm/Kconfig                      |  1 +
>>>    arch/powerpc/mm/book3s64/Makefile             | 17 +++--
>>>    arch/powerpc/mm/book3s64/hash_pgtable.c       |  1 -
>>>    arch/powerpc/mm/book3s64/hash_utils.c         | 10 ---
>>>    .../{hash_hugetlbpage.c => hugetlbpage.c}     |  6 ++
>>>    arch/powerpc/mm/book3s64/mmu_context.c        | 16 +++++
>>>    arch/powerpc/mm/book3s64/pgtable.c            | 22 +++++-
>>>    arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 ++
>>>    arch/powerpc/mm/book3s64/slb.c                | 16 -----
>>>    arch/powerpc/mm/copro_fault.c                 |  2 +
>>>    arch/powerpc/mm/fault.c                       | 17 +++++
>>>    arch/powerpc/mm/pgtable.c                     | 10 ++-
>>>    arch/powerpc/platforms/Kconfig.cputype        | 20 +++++-
>>>    arch/powerpc/platforms/cell/Kconfig           |  1 +
>>>    arch/powerpc/platforms/maple/Kconfig          |  1 +
>>>    arch/powerpc/platforms/microwatt/Kconfig      |  2 +-
>>>    arch/powerpc/platforms/pasemi/Kconfig         |  1 +
>>>    arch/powerpc/platforms/powermac/Kconfig       |  1 +
>>>    arch/powerpc/platforms/powernv/Kconfig        |  2 +-
>>>    arch/powerpc/platforms/powernv/idle.c         |  2 +
>>>    arch/powerpc/platforms/powernv/setup.c        |  2 +
>>>    arch/powerpc/platforms/pseries/lpar.c         | 68 ++++++++++---------
>>>    arch/powerpc/platforms/pseries/lparcfg.c      |  2 +-
>>>    arch/powerpc/platforms/pseries/mobility.c     |  6 ++
>>>    arch/powerpc/platforms/pseries/ras.c          |  4 ++
>>>    arch/powerpc/platforms/pseries/reconfig.c     |  2 +
>>>    arch/powerpc/platforms/pseries/setup.c        |  6 +-
>>>    arch/powerpc/xmon/xmon.c                      |  8 ++-
>>>    47 files changed, 310 insertions(+), 111 deletions(-)
>>>    rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (95%)
>>
>> Whaou ! Huge patch.
>>
>> Several places you should be able to use IS_ENABLED() or simply radix_enabled() instead of #ifdefs
>> and rely on GCC to opt out stuff when radix_enabled() folds into 'true'.
> 
> A lot of it couldn't be done because of data structures but I'm sure I
> missed a lot. I will go over it again.
> 
>> I may do more detailed comments later when I have time.
> 
> Very much appreciated, but let me send out another version before you
> get the fine toothed comb out so I don't waste too much of your time.

One thing that would probably help reduce the size of the patch and help focus on the real changes 
would be to put pure code moves in a previous patch I think.

> If there are no objections to the idea from a high level.

I think the idea is good, I always wondered why we kept HASH and RADIX at the same time.

I did similar thing on book3s/32 when I separated 603 and 604+ so that you could build one or the 
other or both.

Christophe
