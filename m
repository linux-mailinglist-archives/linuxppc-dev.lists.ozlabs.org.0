Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B15EF1B6D7E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 07:51:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497jwG4VsWzDrBs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 15:51:26 +1000 (AEST)
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
 header.s=mail header.b=NTI2QR7T; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497js52kMtzDrB1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 15:48:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 497js06b8qz9txyr;
 Fri, 24 Apr 2020 07:48:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=NTI2QR7T; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4X1lg0f7G_A7; Fri, 24 Apr 2020 07:48:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 497js05Cywz9txyq;
 Fri, 24 Apr 2020 07:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587707316; bh=cZQkW+Y58ZRO8tjt7cTqj1sSHFk5R4wVIsrFQWlKZIw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NTI2QR7TKfBvduozSqg2+d+f4DNwrWZfpSe2WaF9uBhapSa2TTOtwtg5+P9IUtA6/
 o/i9Q7f2weg4R6Uzvh/lVwM3KAH7iCBdkRol0NOCPUOWmDmDmzOUuptd040xt3cLHw
 PQKKiKLOP9Mv7IEGE5og9jB5UpliTIoljouq0bgk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F5708B775;
 Fri, 24 Apr 2020 07:48:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JHr5gnaN85CB; Fri, 24 Apr 2020 07:48:37 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC91D8B75E;
 Fri, 24 Apr 2020 07:48:34 +0200 (CEST)
Subject: Re: [PATCH v3 13/16] powerpc/watchpoint: Prepare handler to handle
 more than one watcnhpoint
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20200414031659.58875-1-ravi.bangoria@linux.ibm.com>
 <20200414031659.58875-14-ravi.bangoria@linux.ibm.com>
 <67349339-03df-091a-47f0-78c1b14c5981@c-s.fr>
 <f571127c-89b0-a333-be71-18f411dc6586@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <10ce2343-7fab-8cf8-488b-9768dbc8889a@c-s.fr>
Date: Fri, 24 Apr 2020 07:48:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f571127c-89b0-a333-be71-18f411dc6586@linux.ibm.com>
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
Cc: apopple@linux.ibm.com, mikey@neuling.org, peterz@infradead.org,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, fweisbec@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ravi,

Le 24/04/2020 à 05:32, Ravi Bangoria a écrit :
> Hi Christophe,
> 
>>> @@ -101,14 +129,20 @@ static bool is_ptrace_bp(struct perf_event *bp)
>>>    */
>>>   void arch_unregister_hw_breakpoint(struct perf_event *bp)
>>>   {
>>> +    int i;
>>> +
>>
>> This declaration should be in the block using it.
>>
>>>       /*
>>>        * If the breakpoint is unregistered between a 
>>> hw_breakpoint_handler()
>>>        * and the single_step_dabr_instruction(), then cleanup the 
>>> breakpoint
>>>        * restoration variables to prevent dangling pointers.
>>>        * FIXME, this should not be using bp->ctx at all! Sayeth peterz.
>>>        */
>>> -    if (bp->ctx && bp->ctx->task && bp->ctx->task != ((void *)-1L))
>>> -        bp->ctx->task->thread.last_hit_ubp = NULL;
>>> +    if (bp->ctx && bp->ctx->task && bp->ctx->task != ((void *)-1L)) {
>>
>> Add declaration of 'int i' here.
> 
> How will that help? Keeping declaration at the start of function is also
> common practice and I don't see any recommendation to move them inside
> conditional block.

Reducing the scope of local variables increases readability, you don't 
have to scroll all up to the top of the function to see the declaration 
of the variable.

common practice ? Are you sure ? Just have a look at fs/io_uring.c or 
many other files in the kernel to see how uncommon your practice is.

Christophe
