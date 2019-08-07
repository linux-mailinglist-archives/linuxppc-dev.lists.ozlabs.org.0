Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF9385037
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 17:47:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463bVR57j5zDqlX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 01:47:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="CZnBhtCc"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463bSP41kTzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 01:45:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 463bSJ4YGsz9v1rf;
 Wed,  7 Aug 2019 17:45:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=CZnBhtCc; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LYvJ3l9XWudI; Wed,  7 Aug 2019 17:45:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 463bSJ3Q5Tz9v1rd;
 Wed,  7 Aug 2019 17:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565192736; bh=2zAbkzyFY7Pds8cbijyFQH7Lyb8kWT7NvvPvhHUU+ho=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CZnBhtCcV9ej58qricz6lJMGdY11s36VbEbnlPwotyO0wF6iUyf8k8qBqFHKDAkFG
 oX+QHyv1kFZZSf9N5mzo1ooMT5dzyTXVUbN8sgkX396mzBjAUv5Vz44De63h9UrVDW
 gK5YDeL57tK3D6NUTgi0EXqpPKlz2J9Ffgfd5UzI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C62258B835;
 Wed,  7 Aug 2019 17:45:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FlmSyZb7ox5o; Wed,  7 Aug 2019 17:45:37 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3ABB58B832;
 Wed,  7 Aug 2019 17:45:37 +0200 (CEST)
Subject: Re: [PATCH 0/4] powerpc: KASAN for 64-bit Book3S on Radix
To: Daniel Axtens <dja@axtens.net>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
References: <20190806233827.16454-1-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <fe758b6c-93ec-7069-5151-a395c8666844@c-s.fr>
Date: Wed, 7 Aug 2019 17:45:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806233827.16454-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/08/2019 à 01:38, Daniel Axtens a écrit :
> Building on the work of Christophe, Aneesh and Balbir, I've ported
> KASAN to 64-bit Book3S kernels running on the Radix MMU.
> 
> It builds on top Christophe's work on 32bit. It also builds on my
> generic KASAN_VMALLOC series, available at:
> https://patchwork.kernel.org/project/linux-mm/list/?series=153209

Would be good to send that one to the powerpc list as well.

> 
> This provides full inline instrumentation on radix, but does require
> that you be able to specify the amount of memory on the system at
> compile time. More details in patch 4.
> 
> Notable changes from the RFC:
> 
>   - I've dropped Book3E 64-bit for now.
> 
>   - Now instead of hacking into the KASAN core to disable module
>     allocations, we use KASAN_VMALLOC.
> 
>   - More testing, including on real hardware. This revealed that
>     discontiguous memory is a bit of a headache, at the moment we
>     must disable memory not contiguous from 0.
>     
>   - Update to deal with kasan bitops instrumentation that landed
>     between RFC and now.

This is rather independant and also applies to PPC32. Could it be a 
separate series that Michael could apply earlier ?

Christophe

> 
>   - Documentation!
> 
>   - Various cleanups and tweaks.
> 
> I am getting occasional problems on boot of real hardware where it
> seems vmalloc space mappings don't get installed in time. (We get a
> BUG that memory is not accessible, but by the time we hit xmon the
> memory then is accessible!) It happens once every few boots. I haven't
> yet been able to figure out what is happening and why. I'm going to
> look in to it, but I think the patches are in good enough shape to
> review while I work on it.
> 
> Regards,
> Daniel
> 
> Daniel Axtens (4):
>    kasan: allow arches to provide their own early shadow setup
>    kasan: support instrumented bitops with generic non-atomic bitops
>    powerpc: support KASAN instrumentation of bitops
>    powerpc: Book3S 64-bit "heavyweight" KASAN support
> 
>   Documentation/dev-tools/kasan.rst            |   7 +-
>   Documentation/powerpc/kasan.txt              | 111 ++++++++++++++
>   arch/powerpc/Kconfig                         |   4 +
>   arch/powerpc/Kconfig.debug                   |  21 +++
>   arch/powerpc/Makefile                        |   7 +
>   arch/powerpc/include/asm/bitops.h            |  25 ++--
>   arch/powerpc/include/asm/book3s/64/radix.h   |   5 +
>   arch/powerpc/include/asm/kasan.h             |  35 ++++-
>   arch/powerpc/kernel/process.c                |   8 ++
>   arch/powerpc/kernel/prom.c                   |  57 +++++++-
>   arch/powerpc/mm/kasan/Makefile               |   1 +
>   arch/powerpc/mm/kasan/kasan_init_book3s_64.c |  76 ++++++++++
>   include/asm-generic/bitops-instrumented.h    | 144 ++++++++++---------
>   include/linux/kasan.h                        |   2 +
>   lib/Kconfig.kasan                            |   3 +
>   mm/kasan/init.c                              |  10 ++
>   16 files changed, 431 insertions(+), 85 deletions(-)
>   create mode 100644 Documentation/powerpc/kasan.txt
>   create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3s_64.c
> 
