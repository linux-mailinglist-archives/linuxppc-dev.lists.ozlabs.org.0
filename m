Return-Path: <linuxppc-dev+bounces-2292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 459FA99F451
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 19:44:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XShKv3rvYz2xJy;
	Wed, 16 Oct 2024 04:44:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729014243;
	cv=none; b=E/eL81+5LoBydVxqXC4nQpsKtcz8tQGsu41iD+yPdeVvJjpHNdq7KIPEfykaPrOfmhVTlBPMjcV9QCNKRSEPjTtGgWDVPH63MrnZRf/20Gt7P+xqES/srqkkXl/qbvdB1is4YpOP0CkP6b27ykmpMFQiWPR2R4D2yBTB3mCDCRJSOBuMF3PaCZPwTOfGAyym/tqtJb1vGRVDUxJYtGhVGKLjKrMff3SohDlPFpaIWBTpzaAjuL6RHXHeLbfYA0HMA6yHBgyjhgh53hiBpt2/oexwaTKkgwtbAg9Z+CSlg20A6DVDlUkoo3plbVWVoXxlUjSuliOMc6FvvyPGjaNHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729014243; c=relaxed/relaxed;
	bh=y37FJa8rEcwjL6PRTwqZw4s0uQYGUoOLL+aOsV5ACJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QeAZN4RLEnm3O2hv2PnXQTiGbhScwXumva20uQiDRkEF6j6E2sVlu7Ot0ucu89peM+rVX3XddBQik/H9X6l/8/+vm4i0FwwF2AsaJ26ysrmVlOmA9QEwq2MrCgbsTog51tW3B1+QHMAkN8D13LeeTdug4vnnJ2nbuNTXGmmsfurmWrhZlIGijAqupVMfZxZt3UrhxeXIUM/d/aKnGr7nXL5o5GzLjE4NTwuI+oCTDcf03lx8hSlM9wZZUtEVw+yCfR8ioAfufs3yC0lGjpWCsTSG2xZKGkNAGqMnol8Hw8exkMav/N4ppa/XFCf31x60IqRgWCd1t71uselhe7WxSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XShKs4wsvz2xH1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 04:44:00 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XShKn2M7jz9sPd;
	Tue, 15 Oct 2024 19:43:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVYtcATzovDT; Tue, 15 Oct 2024 19:43:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XShKn0mffz9rvV;
	Tue, 15 Oct 2024 19:43:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C58078B770;
	Tue, 15 Oct 2024 19:43:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Jsl9_4vQLh1r; Tue, 15 Oct 2024 19:43:56 +0200 (CEST)
Received: from [192.168.233.89] (unknown [192.168.233.89])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FFCA8B764;
	Tue, 15 Oct 2024 19:43:56 +0200 (CEST)
Message-ID: <e9595d8b-d1e2-4c6a-b097-6f4f08d29866@csgroup.eu>
Date: Tue, 15 Oct 2024 19:43:56 +0200
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
Subject: Re: [PATCH 1/7] powerpc/entry: convert to common and generic entry
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 jialong.yang@shingroup.cn, luming.yu@gmail.com
References: <88E2581B1D024E9A+20241012035621.1245-3-luming.yu@shingroup.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <88E2581B1D024E9A+20241012035621.1245-3-luming.yu@shingroup.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 12/10/2024 à 05:56, Luming Yu a écrit :
> convert powerpc entry code in syscall and fault to use syscall_work
> and irqentry_state as well as common calls implemented in generic
> entry infrastructure.
> 
> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> ---
>   arch/powerpc/Kconfig                   | 1 +
>   arch/powerpc/include/asm/hw_irq.h      | 5 +++++
>   arch/powerpc/include/asm/processor.h   | 6 ++++++
>   arch/powerpc/include/asm/syscall.h     | 5 +++++
>   arch/powerpc/include/asm/thread_info.h | 1 +
>   arch/powerpc/kernel/syscall.c          | 5 ++++-
>   arch/powerpc/mm/fault.c                | 3 +++
>   7 files changed, 25 insertions(+), 1 deletion(-)
> 

...

> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> index 77fedb190c93..e0338bd8d383 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -3,6 +3,7 @@
>   #include <linux/compat.h>
>   #include <linux/context_tracking.h>
>   #include <linux/randomize_kstack.h>
> +#include <linux/entry-common.h>
>   
>   #include <asm/interrupt.h>
>   #include <asm/kup.h>
> @@ -131,7 +132,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
>   		 * and the test against NR_syscalls will fail and the return
>   		 * value to be used is in regs->gpr[3].
>   		 */
> -		r0 = do_syscall_trace_enter(regs);
> +		r0 = syscall_enter_from_user_mode(regs, r0);

Can you provide details on how this works ?

For instance, do_syscall_trace_enter() was calling do_seccomp().
do_seccomp() sets regs->r3 to -ENOSYS then calls __secure_computing().

Now you call syscall_enter_from_user_mode() instead which calls 
syscall_enter_from_user_mode_work() which calls syscall_trace_enter() 
which calls  __secure_computing() but without seting regs->r3 to -ENOSYS.

So what will be returned by the below return when 
syscall_enter_from_user_mode returns -1 ?

>   		if (unlikely(r0 >= NR_syscalls))
>   			return regs->gpr[3];
>   
> @@ -184,6 +185,8 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
>   	 * So the resulting 6 or 7 bits of entropy is seen in SP[9:4] or SP[9:3].
>   	 */
>   	choose_random_kstack_offset(mftb());
> +	/*common entry*/
> +	syscall_exit_to_user_mode(regs);
>   
>   	return ret;
>   }

