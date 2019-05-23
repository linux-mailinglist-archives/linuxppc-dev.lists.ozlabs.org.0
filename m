Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D2275E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 08:11:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458fKP2TZQzDqJH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 16:11:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="KIibV85s"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458fJ36jHjzDqSS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 16:10:42 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458fHx5dVhz9v1QY;
 Thu, 23 May 2019 08:10:37 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=KIibV85s; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DwnaUkC2PeVT; Thu, 23 May 2019 08:10:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458fHx4Vfcz9v1QW;
 Thu, 23 May 2019 08:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558591837; bh=mEtzr68QIZ6n04SJViNreCwFTR7jtAU3pf67FXKkQtI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KIibV85s8K5MNt0SLIhahGEiyWGkxer08Bb+AgochJjCjYHIOWNIfdvv9PtEA7Nj2
 Tcal7TRbVtStDcenjlBB+LVdLJ/SOgUFbrQSrnKJrv11/NPcOjC6bTmfqQnQJnEoyG
 HU5L5Mvv//7TndXuiI48sQHCYXfYvWe25Pfpqu0g=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E7268B75A;
 Thu, 23 May 2019 08:10:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pNwkkhka3wQq; Thu, 23 May 2019 08:10:38 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 569268B77D;
 Thu, 23 May 2019 08:10:37 +0200 (CEST)
Subject: Re: [RFC PATCH 0/7] powerpc: KASAN for 64-bit 3s radix
To: Daniel Axtens <dja@axtens.net>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
References: <20190523052120.18459-1-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <584b6b5b-7051-e2de-ca4e-a686c5491aad@c-s.fr>
Date: Thu, 23 May 2019 08:10:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523052120.18459-1-dja@axtens.net>
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

Hi Daniel,

Le 23/05/2019 à 07:21, Daniel Axtens a écrit :
> Building on the work of Christophe, Aneesh and Balbir, I've ported
> KASAN to Book3S radix.
> 
> It builds on top Christophe's work on 32bit, and includes my work for
> 64-bit Book3E (3S doesn't really depend on 3E, but it was handy to
> have around when developing and debugging).
> 
> This provides full inline instrumentation on radix, but does require
> that you be able to specify the amount of memory on the system at
> compile time. More details in patch 7.
> 
> Regards,
> Daniel
> 
> Daniel Axtens (7):
>    kasan: do not open-code addr_has_shadow
>    kasan: allow architectures to manage the memory-to-shadow mapping
>    kasan: allow architectures to provide an outline readiness check
>    powerpc: KASAN for 64bit Book3E

I see you are still hacking the core part of KASAN.

Did you have a look at my RFC patch 
(https://patchwork.ozlabs.org/patch/1068260/) which demonstrate that 
full KASAN can be implemented on book3E/64 without those hacks ?

Christophe

>    kasan: allow arches to provide their own early shadow setup
>    kasan: allow arches to hook into global registration
>    powerpc: Book3S 64-bit "heavyweight" KASAN support
> 
>   arch/powerpc/Kconfig                         |   2 +
>   arch/powerpc/Kconfig.debug                   |  17 ++-
>   arch/powerpc/Makefile                        |   7 ++
>   arch/powerpc/include/asm/kasan.h             | 116 +++++++++++++++++++
>   arch/powerpc/kernel/prom.c                   |  40 +++++++
>   arch/powerpc/mm/kasan/Makefile               |   2 +
>   arch/powerpc/mm/kasan/kasan_init_book3e_64.c |  50 ++++++++
>   arch/powerpc/mm/kasan/kasan_init_book3s_64.c |  67 +++++++++++
>   arch/powerpc/mm/nohash/Makefile              |   5 +
>   include/linux/kasan.h                        |  13 +++
>   mm/kasan/generic.c                           |   9 +-
>   mm/kasan/generic_report.c                    |   2 +-
>   mm/kasan/init.c                              |  10 ++
>   mm/kasan/kasan.h                             |   6 +-
>   mm/kasan/report.c                            |   6 +-
>   mm/kasan/tags.c                              |   3 +-
>   16 files changed, 345 insertions(+), 10 deletions(-)
>   create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3e_64.c
>   create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3s_64.c
> 
