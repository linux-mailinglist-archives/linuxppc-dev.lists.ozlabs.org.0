Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D6E25DF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 08:15:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4582S92x4ZzDqNR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 16:15:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="n4OnPrIc"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4582Qt3Hq8zDqL5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 16:14:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4582Qk4wbHz9v18H;
 Wed, 22 May 2019 08:14:22 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=n4OnPrIc; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ioT7aL_UIT9e; Wed, 22 May 2019 08:14:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4582Qk3m3Rz9v18G;
 Wed, 22 May 2019 08:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558505662; bh=6v1Wdv9UYlL4pgLUgMfY1zDB/A1ydGbiigUUi0tft6U=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=n4OnPrIc6H4nxXDgN5rHq/XTh9+9mKudN6nqaYxIt2WAYGp7102mrW8tuNO2D5laQ
 t9LjXOk4Voiq4BXNgh5a9/lfMewOiL5xbTSUXLoXV7olYLqZZ+uEB4hzXWuB2NqKaT
 ioXWMSqmezaTDssRUV2KUTzIbglvoaJlc0qrtpQw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 71DF48B819;
 Wed, 22 May 2019 08:14:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SPN2oTc9nQAy; Wed, 22 May 2019 08:14:23 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 561368B75B;
 Wed, 22 May 2019 08:14:23 +0200 (CEST)
Subject: Re: [BISECTED] kexec regression on PowerBook G4
To: Aaro Koskinen <aaro.koskinen@iki.fi>
References: <20190521221859.GC3621@darkstar.musicnaut.iki.fi>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <90f3557b-400b-60b5-9ff8-d5605adeee79@c-s.fr>
Date: Wed, 22 May 2019 08:14:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521221859.GC3621@darkstar.musicnaut.iki.fi>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aero,

Le 22/05/2019 à 00:18, Aaro Koskinen a écrit :
> Hi,
> 
> I was trying to upgrade from v5.0 -> v5.1 on PowerBook G4, but when trying
> to kexec a kernel the system gets stuck (no errors seen on the console).

Do you mean you are trying to kexec a v5.1 kernel from a v5.0 kernel, or 
do you have a working v5.1 kernel, but kexec doesn't work with it ?

> 
> Bisected to: 93c4a162b014 ("powerpc/6xx: Store PGDIR physical address
> in a SPRG"). This commit doesn't revert cleanly anymore but I tested
> that the one before works OK.

Not sure that's the problem. There was a problem with that commit, but 
it was fixed by 4622a2d43101 ("powerpc/6xx: fix setup and use of 
SPRN_SPRG_PGDIR for hash32").
You probably hit some commit between those two during bisect, that's 
likely the reason why you ended here.

Can you restart your bisect from 4622a2d43101 ?

If you have CONFIG_SMP, maybe you should also consider taking 
397d2300b08c ("powerpc/32s: fix flush_hash_pages() on SMP"). Stable 
5.1.4 includes it.

> 
> With current Linus HEAD (9c7db5004280), it gets a bit further but still
> doesn't work: now I get an error on the console after kexec "Starting
> new kernel! ... Bye!":
> 
> 	kernel tried to execute exec-protected page (...) - exploit attempt?

Interesting.

Do you have CONFIG_STRICT_KERNEL_RWX=y in your .config ? If so, can you 
retry without it ?

Thanks
Christophe

> 
> A.
> 
