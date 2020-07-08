Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A403E218CC9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 18:19:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B24Hm5xNSzDqLr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 02:19:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B24Fj0XgnzDqDN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 02:17:12 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B24FY6Y6nz9txls;
 Wed,  8 Jul 2020 18:17:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OdgSlxrAs2n9; Wed,  8 Jul 2020 18:17:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B24FY4bFFz9txlr;
 Wed,  8 Jul 2020 18:17:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B6ABD8B804;
 Wed,  8 Jul 2020 18:17:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sRhk4bgMl8Ky; Wed,  8 Jul 2020 18:17:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4EC9E8B803;
 Wed,  8 Jul 2020 18:17:05 +0200 (CEST)
Subject: Re: powerpc: Incorrect stw operand modifier in __set_pte_at
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Kumar Gala <galak@kernel.crashing.org>
References: <873469922.2744.1594219513228.JavaMail.zimbra@efficios.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <582c7ca7-a7a4-9861-cd53-8e34ff10c942@csgroup.eu>
Date: Wed, 8 Jul 2020 18:16:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <873469922.2744.1594219513228.JavaMail.zimbra@efficios.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/07/2020 à 16:45, Mathieu Desnoyers a écrit :
> Hi,
> 
> Reviewing use of the patterns "Un%Xn" with lwz and stw instructions
> (where n should be the operand number) within the Linux kernel led
> me to spot those 2 weird cases:
> 
> arch/powerpc/include/asm/nohash/pgtable.h:__set_pte_at()
> 
>                  __asm__ __volatile__("\
>                          stw%U0%X0 %2,%0\n\
>                          eieio\n\
>                          stw%U0%X0 %L2,%1"
>                  : "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
>                  : "r" (pte) : "memory");
> 
> I would have expected the stw to be:
> 
>                          stw%U1%X1 %L2,%1"
> 
> and:
> arch/powerpc/include/asm/book3s/32/pgtable.h:__set_pte_at()
> 
>          __asm__ __volatile__("\
>                  stw%U0%X0 %2,%0\n\
>                  eieio\n\
>                  stw%U0%X0 %L2,%1"
>          : "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
>          : "r" (pte) : "memory");
> 
> where I would have expected:
> 
>                  stw%U1%X1 %L2,%1"
> 
> Is it a bug or am I missing something ?

Well spotted. I guess it's definitly a bug.

Introduced 12 years ago by commit 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9bf2b5cd 
("powerpc: Fixes for CONFIG_PTE_64BIT for SMP support").

It's gone unnoticed until now it seems.

Can you submit a patch for it ?

Christophe
