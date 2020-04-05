Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4535619ED78
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 20:55:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wNCP1tTvzDqly
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 04:55:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=eJQ3oG1e; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wN9c1MzTzDqkV
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 04:53:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wN9T41YPz9tx5x;
 Sun,  5 Apr 2020 20:53:33 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=eJQ3oG1e; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rPwFmN31zfvx; Sun,  5 Apr 2020 20:53:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wN9T2t7Vz9tx5w;
 Sun,  5 Apr 2020 20:53:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586112813; bh=90bPcvM3Kr4KjzMKiGYjpWqCbKmKJ+xpkekjY3cVUhQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eJQ3oG1ebDmiDGHzDikOxVWGvPigmsoEYiiyN/LJjcvcAHCs4LnhNB82kOiD64ME5
 Elaf5u+hqdwsLi6oguAVkE6PJtJeYrWZSxeAUWZxYNWo3NcWi/U05qkcI+PI32sk9N
 gW96UdqFlzinI2CilHJOhz7SUFwqZOxYC/XBEvE4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 11BA08B783;
 Sun,  5 Apr 2020 20:53:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QxPOLoXO54EU; Sun,  5 Apr 2020 20:53:37 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 200BC8B774;
 Sun,  5 Apr 2020 20:53:36 +0200 (CEST)
Subject: Re: [RFC WIP PATCH] powerpc/32: system call implement entry/exit
 logic in C
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, msuchanek@suse.de,
 Paul Mackerras <paulus@samba.org>
References: <bbc0a09cfaf523bc00893253a7101362c98b31eb.1585667934.git.christophe.leroy@c-s.fr>
 <059c1abd-6be2-25ea-83e0-dcd411b7951b@c-s.fr>
 <1585898897.1jwur86s6a.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <fa79eac6-49e6-bbb0-5faa-7d52662a0cbe@c-s.fr>
Date: Sun, 5 Apr 2020 20:53:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1585898897.1jwur86s6a.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/04/2020 à 09:33, Nicholas Piggin a écrit :
> Christophe Leroy's on April 1, 2020 9:48 pm:
>>
>>
>> Le 31/03/2020 à 17:22, Christophe Leroy a écrit :
>>> That's first try to port PPC64 syscall entry/exit logic in C to PPC32.
>>> I've do the minimum to get it work. I have not reworked calls
>>> to sys_fork() and friends for instance.
>>>
>>> For the time being, it seems to work more or less but:
>>> - ping reports EINVAL on recvfrom
>>> - strace shows NULL instead of strings in call like open() for instance.
>>
>> For the two above problems, that's because system_call_exception()
>> doesn't set orig_gpr3 whereas DoSycall() does in entry_32.S . Is that
>> only done on PPC32 ?
>>
>> With the following line at the begining of system_call_exception(), it
>> works perfectly:
>>
>> 	regs->orig_gpr3 = r3;
> 
> Oh great, nice work. We should be able to make some simple helpers or
> move some things a bit to reduce the amount of ifdefs in the C code.
> It doesn't look too bad though.
> 
>> I will now focus on performance to see if we can do something about it.
> 
> What's the performance difference between current asm code just with
> always saving NVGPRS vs C?

Done new measurement and sent a series. lower values now because the 
time accounting was done twice as it was still in the ASM part.

Before the series, 311 cycles for a null_syscall
If adding SAVE_NVGPRS to the entry macro, 335 cycles

First patch: 353 cycles ie +13,5%

After a few changes, including conditional saving of non volatile 
registers, I get 325 cycles that is only +4,5%. I thing that's acceptable.

Do you see a problem with still saving non volatile registers only when 
required ?

Christophe
