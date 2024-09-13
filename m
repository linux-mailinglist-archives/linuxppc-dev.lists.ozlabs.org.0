Return-Path: <linuxppc-dev+bounces-1311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FA1977902
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 08:54:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4lQx0DBJz2yZ4;
	Fri, 13 Sep 2024 16:54:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726210456;
	cv=none; b=hq4iYAZic9j7fyQ9Mj9EyhySG4FD+yM8bA7CHBFXuEdEp87WzjbYGDN9J+NEOQBfHRW7TIs357Gk7XQLZDjxMN6xUaiiRVnK68dCv/NyyT1Mk26JoChIGILokHxk0HjAnTihlakFIvydUIOF6OIbvQrEovvHH/slr0v3g6cnGiLVx0NYBx+honxtJ9QXcRjmxN0mpfDtDr+G8S/72lAgMWWeiw8y9kk4K5O5a6zOe1n1rwyIC/L2h0cf2KDVWJlxFXDx4/p6jHSqgAS1m9Gxnhz13gb/TcxrZQRpZe+7lOGex2IdOj1ZAjaHiiFj6MUfESNREc4A1iO/NShqKeqiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726210456; c=relaxed/relaxed;
	bh=8SvU7I62HvfMFyPLnS1qjjeTZi56XbsvpoqcTu3wp88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7V8pSE1pFpa9b4ZZKilYTKEU8lkqGYxE8dFtoMkVZeqDwHqUq3aT96Yvhb+wo/avBS+Biz31tg48406FxlK2NTKWMI5jyLmrFJZIOQ72KNXbkGQtdlhsvsxgkt7fdSgfItVG7S8UknHlfo5MmjrPzYygz+3iWTAXE/S6v8bKii0Ca/eKG8Tkzd7Jao4Vld01cxwjLEkWAZt2IkwchcjpaNLyQhg8s7ZmLw/pO2MVQxRgKQu06yV6j95mTa3nIWzS2pY9D319HgbSjPTmgB/5DYZ6FaRVypM3z+o0v5KDKecAfPR++Nr3sE2CV3DrjAFv3gJZ6p8+wvp0eLKNbe2hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4lQw54Nbz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 16:54:15 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X4lQs0pJ2z9scR;
	Fri, 13 Sep 2024 08:54:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kL0iLXdYMHHv; Fri, 13 Sep 2024 08:54:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X4lQr6zCrz9sX6;
	Fri, 13 Sep 2024 08:54:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DD4FF8B77A;
	Fri, 13 Sep 2024 08:54:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Acd_6_kLEZSa; Fri, 13 Sep 2024 08:54:12 +0200 (CEST)
Received: from [192.168.233.70] (unknown [192.168.233.70])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 751288B766;
	Fri, 13 Sep 2024 08:54:12 +0200 (CEST)
Message-ID: <95ced963-b584-4ccf-ba34-8f2ba99172f4@csgroup.eu>
Date: Fri, 13 Sep 2024 08:54:12 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc/entry: convert to common and generic entry
To: Luming Yu <luming.yu@shingroup.cn>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, jialong.yang@shingroup.cn,
 luming.yu@gmail.com
References: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
 <fc509bcd-5ca0-4dc2-962e-766a01cbe4fb@csgroup.eu>
 <153FD6B5CE4F97D9+ZuOYDQ-iHIIwJjbh@HX09040029.powercore.com.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <153FD6B5CE4F97D9+ZuOYDQ-iHIIwJjbh@HX09040029.powercore.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/09/2024 à 03:40, Luming Yu a écrit :
> On Thu, Sep 12, 2024 at 12:23:29PM +0200, Christophe Leroy wrote:
>>
>>
>> Le 12/09/2024 à 10:24, Luming Yu a écrit :
>>> From: Yu Luming <luming.yu@gmail.com>
>>>
>>> convert powerpc entry code in syscall and fault to use syscall_work
>>> and irqentry_state as well as common calls from generic entry infrastructure.
>>>
>>> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
>>> ---
>>>    arch/powerpc/Kconfig                   | 1 +
>>>    arch/powerpc/include/asm/hw_irq.h      | 5 +++++
>>>    arch/powerpc/include/asm/processor.h   | 6 ++++++
>>>    arch/powerpc/include/asm/syscall.h     | 5 +++++
>>>    arch/powerpc/include/asm/thread_info.h | 1 +
>>>    arch/powerpc/kernel/syscall.c          | 6 +++++-
>>>    arch/powerpc/mm/fault.c                | 5 +++++
>>>    7 files changed, 28 insertions(+), 1 deletion(-)
>>
>> There is another build problem:
>>
>>    CC      kernel/entry/common.o
>> kernel/entry/common.c: In function 'irqentry_exit':
>> kernel/entry/common.c:335:21: error: implicit declaration of function
>> 'regs_irqs_disabled'; did you mean 'raw_irqs_disabled'?
>> [-Werror=implicit-function-declaration]
>>    335 |         } else if (!regs_irqs_disabled(regs)) {
>>        |                     ^~~~~~~~~~~~~~~~~~
>>        |                     raw_irqs_disabled
>>
>>
>> You have put regs_irqs_disabled() in a section dedicated to PPC64, so it
>> fails on PPC32.
>>
>>
>> After fixing this problem and providing an empty asm/entry-common.h it is
>> now possible to build the kernel. But that's not enough, the board is stuck
>> after:
>>
>> ...
>> [    2.871391] Freeing unused kernel image (initmem) memory: 1228K
>> [    2.877990] Run /init as init process
> 
> Thanks for these questions. :-)
> I haven't gotten chance to run it in ppc32 qemu.
> the common syscall trace enter lost this hunk
> -       if (!is_32bit_task())
> -               audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
> -                                   regs->gpr[5], regs->gpr[6]);
> -       else
> -               audit_syscall_entry(regs->gpr[0],
> -                                   regs->gpr[3] & 0xffffffff,
> -                                   regs->gpr[4] & 0xffffffff,
> -                                   regs->gpr[5] & 0xffffffff,
> -                                   regs->gpr[6] & 0xffffffff);
> which I don't understand whether we need a arch callbacks for it.

I don't thing so.

As far as I can see, audit_syscall_entry() is called by 
syscall_enter_audit() in kernel/entry/common.c

And the masking of arguments based on is_32bit_task() is done in 
syscall_get_arguments() with is called by
syscall_enter_audit() just before calling audit_syscall_entry() and 
which is an arch callback that does the same as the removed hunk.
> 
> Before I sent out the RFC patch set, the very limited compile and boot test goes well with a ppc64 qemu VM. Surely, there will be a lot of test, debug and following up patch set update that is necessary to make it a complete convert.

Even on ppc64 it doesn't build, at the first place because 
arch/powerpc/include/asm/entry-common.h is missing in your patch. Did 
you forget to 'git add' it ?

And same as with PPC32, when I build PPC64 with an empty 
asm/entry-common.h, it doesn't work. So, I guess you had some needed 
code in that file and you have to send it.

