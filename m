Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8C519FD96
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:53:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x06N32sFzDqtd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 04:53:00 +1000 (AEST)
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
 header.s=mail header.b=slRBn5fT; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wzMg1p1rzDqvh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 04:19:27 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wzMb6ZVxz9v0BM;
 Mon,  6 Apr 2020 20:19:23 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=slRBn5fT; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WPQRn9erC4S7; Mon,  6 Apr 2020 20:19:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wzMb53Pmz9v0BL;
 Mon,  6 Apr 2020 20:19:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586197163; bh=yZgIn2IQa50rMQP6WmsKiaEb+lPusPUrp+Nx/nDnY70=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=slRBn5fT//wm9OLrPXBHGltusxm9LC0swUDaHARxkWwQj9hvtfZPNC/5jxkuC01F8
 CUSf3zEDTK8xLLy+0ZWmXxsCpneAedlzp/9AcRr0qW47bUrTd5aHoe2Mipju9Fdxw1
 vMWAVmp5/MXf/hwOEVFNiRfoMv6BivHGuXJqCNbU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A3FB38B784;
 Mon,  6 Apr 2020 20:19:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G779_yM4ui7G; Mon,  6 Apr 2020 20:19:23 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B2C78B775;
 Mon,  6 Apr 2020 20:19:23 +0200 (CEST)
Subject: Re: [RFC PATCH v2 11/13] powerpc/syscall: Avoid stack frame in likely
 part of syscall_call_exception()
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, msuchanek@suse.de,
 Paul Mackerras <paulus@samba.org>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
 <fc0109635dbca7464d13451ce648ee49893711df.1586108649.git.christophe.leroy@c-s.fr>
 <1586136357.atgut3zasc.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2447d216-1948-c121-4843-6ae5cac6f377@c-s.fr>
Date: Mon, 6 Apr 2020 20:19:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1586136357.atgut3zasc.astroid@bobo.none>
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



Le 06/04/2020 à 03:29, Nicholas Piggin a écrit :
> Christophe Leroy's on April 6, 2020 3:44 am:
>> When r3 is not modified, reload it from regs->orig_r3 to free
>> volatile registers. This avoids a stack frame for the likely part
>> of syscall_call_exception()
>>
>> Before : 353 cycles on null_syscall
>> After  : 347 cycles on null_syscall
>>

[...]

>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/kernel/syscall.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
>> index 69d75fc4a5eb..630c423e089a 100644
>> --- a/arch/powerpc/kernel/syscall.c
>> +++ b/arch/powerpc/kernel/syscall.c
>> @@ -91,6 +91,8 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>   
>>   	} else if (unlikely(r0 >= NR_syscalls)) {
>>   		return -ENOSYS;
>> +	} else {
>> +		r3 = regs->orig_gpr3;
>>   	}
> 
> So this just gives enough volatiles to avoid spilling to stack? I wonder
> about other various options here if they would cause a spill anyway.
> 
> Interesting optimisation, it would definitely need a comment. Would be
> nice if we had a way to tell the compiler that a local can be reloaded
> from a particular address.

Ok, comment added.

Christophe
