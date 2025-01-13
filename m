Return-Path: <linuxppc-dev+bounces-5182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E75CA0BF30
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 18:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX0CL6bBKz3cc0;
	Tue, 14 Jan 2025 04:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736790606;
	cv=none; b=FYeJ6LBN72k9xpinidDzy+vz8nYmcnpNFmEkstFKm4tKZESbLne/f97fbzI2J5ERYiJdsTIjTk0ihbgHUlqQwF5DAb+7eugVqkTC3QZ/Q95oZFPrxVHIKIP/bUOFOb5ldUyXQKTPp96IH+mxV2+TSKdYRw9mZTarCPC0tCW+LZXnWq0bB6/4Ot1RQoYAx8Y42kgpnqCdWU1odKkMM8lY1hes8nr5vBYkrMg4AsNBXF25WhzK2jp5ewn57iZYhwe1LVxIXv4kETiC62Tus1VURDGf60ksuG2FOJlM9YtvdwvYxM3RwickH96j5U5Dszv7sli/Vju1Cs02cw5drKcDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736790606; c=relaxed/relaxed;
	bh=rGaYhU6SOqCDR5KQn+mVlZLPi+gzFrOm5ljEkEWlGuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7ViSfMCGlrWOk7xlztAL+BHK4r6XELRgvnM/HhwEH1tQDnOLU9DHBrYEF1z0XdJPhkXqY8ANJOi2cFxtB81l/nuOqwC2+wuZZOYFl1DZSHJVqKl+w7RYiQpeIvCohsXaAVZddMQX/CIF0Co5TQOrYshFdV7wLkYQBcFWbyqklZShvLh188hFyWR4zeXEQMSRxiAieNlyOq7E9apmF2LLI8BQNq3eHkT8gNxIwvKeuyFQ0zZ3SPIx1PVS7M/PRYjdRTjwyt4xQqSWO30585PRk0rzi5liDwtCRUJ41KlJ7d94tQKjlfp9njr814qL+U7ZlRX/9JwoqifJU2MPZ5GHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX0CK52LTz3cYh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 04:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YWzsl0knNz9sS7;
	Mon, 13 Jan 2025 18:34:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQe7aT3g5CqG; Mon, 13 Jan 2025 18:34:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YWzsd6c22z9sRk;
	Mon, 13 Jan 2025 18:34:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C46E08B76C;
	Mon, 13 Jan 2025 18:34:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id JGvQgK_t-4vp; Mon, 13 Jan 2025 18:34:45 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 39FCA8B768;
	Mon, 13 Jan 2025 18:34:45 +0100 (CET)
Message-ID: <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
Date: Mon, 13 Jan 2025 18:34:44 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
To: "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: Eugene Syromyatnikov <evgsyr@gmail.com>,
 Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>,
 Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250113171054.GA589@strace.io>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250113171054.GA589@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 13/01/2025 à 18:10, Dmitry V. Levin a écrit :
> Bring syscall_set_return_value() in sync with syscall_get_error(),
> and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
> 
> This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
> syscall_set_return_value()").

There is a clear detailed explanation in that commit of why it needs to 
be done.

If you think that commit is wrong you have to explain why with at least 
the same level of details.

> 
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> ---
>   arch/powerpc/include/asm/syscall.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 3dd36c5e334a..422d7735ace6 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -82,7 +82,11 @@ static inline void syscall_set_return_value(struct task_struct *task,
>   		 */
>   		if (error) {
>   			regs->ccr |= 0x10000000L;
> -			regs->gpr[3] = error;
> +			/*
> +			 * In case of an error regs->gpr[3] contains
> +			 * a positive ERRORCODE.
> +			 */
> +			regs->gpr[3] = -error;
>   		} else {
>   			regs->ccr &= ~0x10000000L;
>   			regs->gpr[3] = val;


