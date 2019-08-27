Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F99EAD8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 16:24:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HrjN4jD4zDqDy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 00:24:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Q4TAHeuy"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HrB82sSmzDqBy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 00:00:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Hr9z5JHlz9tybv;
 Tue, 27 Aug 2019 16:00:39 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Q4TAHeuy; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EgjXK9U-T5Ct; Tue, 27 Aug 2019 16:00:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Hr9z42PVz9tybt;
 Tue, 27 Aug 2019 16:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566914439; bh=0yfGZyBBviwG3ioKo+s7iGmImXKC2KyeWWdBnEk2MOE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Q4TAHeuyYB2ZzexRxjZI1WfZqoj9R3lRJ5sdqzusG4rMuUjpy2S5rEKMUSMr7gn6V
 rF3voIMwviI9zMk/J9IQmEJNjTSqOGlId4tJaYPSS2m0XJVS+npRZQB/ztFfWVnaBH
 Zu/PeDyEQtZpTFLJDoiajNpdlLowYZU0bLihc8d0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 094F48B839;
 Tue, 27 Aug 2019 16:00:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bUZf9ScwzC1Y; Tue, 27 Aug 2019 16:00:40 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BDBA38B835;
 Tue, 27 Aug 2019 16:00:40 +0200 (CEST)
Subject: Re: [PATCH 1/4] powerpc: convert to copy_thread_tls
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190827033010.28090-1-npiggin@gmail.com>
 <20190827033010.28090-2-npiggin@gmail.com>
 <70171357-45e3-3fde-9713-d93b95cc1beb@c-s.fr>
 <1566900777.qmrn17gypm.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <fd410ecf-faa9-5227-d4d4-39b222621141@c-s.fr>
Date: Tue, 27 Aug 2019 16:00:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566900777.qmrn17gypm.astroid@bobo.none>
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



Le 27/08/2019 à 12:13, Nicholas Piggin a écrit :
> Christophe Leroy's on August 27, 2019 4:07 pm:
>>
>>
>> Le 27/08/2019 à 05:30, Nicholas Piggin a écrit :
>>> Commit 3033f14ab78c3 ("clone: support passing tls argument via C rather
>>> than pt_regs magic") introduced the HAVE_COPY_THREAD_TLS option. Use it
>>> to avoid a subtle assumption about the argument ordering of clone type
>>> syscalls.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    arch/powerpc/Kconfig          | 1 +
>>>    arch/powerpc/kernel/process.c | 9 +++++----
>>>    2 files changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index d8dcd8820369..7477a3263225 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -182,6 +182,7 @@ config PPC
>>>    	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
>>>    	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
>>>    	select HAVE_CONTEXT_TRACKING		if PPC64
>>> +	select HAVE_COPY_THREAD_TLS
>>>    	select HAVE_DEBUG_KMEMLEAK
>>>    	select HAVE_DEBUG_STACKOVERFLOW
>>>    	select HAVE_DYNAMIC_FTRACE
>>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
>>> index 8fc4de0d22b4..24621e7e5033 100644
>>> --- a/arch/powerpc/kernel/process.c
>>> +++ b/arch/powerpc/kernel/process.c
>>> @@ -1600,8 +1600,9 @@ static void setup_ksp_vsid(struct task_struct *p, unsigned long sp)
>>>    /*
>>>     * Copy architecture-specific thread state
>>>     */
>>> -int copy_thread(unsigned long clone_flags, unsigned long usp,
>>> -		unsigned long kthread_arg, struct task_struct *p)
>>> +int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
>>> +		unsigned long kthread_arg, struct task_struct *p,
>>> +		unsigned long tls)
>>>    {
>>>    	struct pt_regs *childregs, *kregs;
>>>    	extern void ret_from_fork(void);
>>> @@ -1642,10 +1643,10 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
>>>    		if (clone_flags & CLONE_SETTLS) {
>>>    #ifdef CONFIG_PPC64
>>
>> is_32bit_task() exists and always returns 1 on PPC32 so this gross ifdef
>> in the middle of an if/else is pointless, it should be dropped.
> 
> I could do that as another patch in the series.


Yes, would be good, because if I do an independant patch for that it 
will conflict with your series.

Thanks
Christophe
