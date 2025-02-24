Return-Path: <linuxppc-dev+bounces-6412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA85A41F8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 13:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1gYq26Pgz302P;
	Mon, 24 Feb 2025 23:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740401407;
	cv=none; b=DN49C6awhW4gddHdTmrG08oZqV57ppOJ1LgYi/FzeUTv59ZwBa/Mboy1swrecG9o713bbRHQh3dYYJJrxdHAcnO5g4GQxXNOCSMCpXMPUC8idR0GUNv2GRvlC/RJC2bfTyl/gSZMRS5lo8ndA+44oG/jWF+1GHJaDKwJhhXJJqAqbqnXsEEsvUC+PMILc8ycsgiw+9X1V1thVZcI9ghOHDwRhrO8xYJl0xkSM8CHya7fkP4/Jti++Eja5sU4RaM0Ra84YxM1Z0s1yYMWGtOwd8zriSw8S5oRSycXhHRtMEXWHJw3SEpLqVzeom6t/w4OBGzxKdXNnO9yRgLQuCJA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740401407; c=relaxed/relaxed;
	bh=nFyQ712EMvuMBjM9b1NNj/ywxVk7QbVt6tvxNnDjyxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8BFdxx2iU8ZeG9g7NP92I1tVhSZCpL67tO/d9s228Vnc14vwly+bhqQHMttuOWi7vSSFV20sHPQZKtL8WlZi2lMBSDRsX6iHoTrViOw98fPvJ2KWz5U6pBpRGDJrUc3+luZ2pjmT0r40+Pf418nggSNt7c3lOKG8Ful6UwmUmbti8vWgbn+EWzHsFTRDGTxsebFtROj0sI4pwQYqTx8TpXCLLtvawLD5UJEE4lYkjWEbEwlruTPh0TfJCGKxRSDjUHCmxj1hT6zMMFs/8zPPiooElpkm87mcKFe71QuMHqS0kom+qjAfl6LyB4ZFY44aqTINm5UG+JNei6RhwRssg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1gYp0Lk9z3029
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 23:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1fnL0yhnz9sSR;
	Mon, 24 Feb 2025 13:15:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-9wox-Pwuus; Mon, 24 Feb 2025 13:15:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1fnK6nYJz9sSL;
	Mon, 24 Feb 2025 13:15:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D161B8B765;
	Mon, 24 Feb 2025 13:15:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tSydbj3FVjDx; Mon, 24 Feb 2025 13:15:01 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CCE528B763;
	Mon, 24 Feb 2025 13:15:00 +0100 (CET)
Message-ID: <ffd5dd44-babc-480a-b1bc-61bd7ff1e920@csgroup.eu>
Date: Mon, 24 Feb 2025 13:15:00 +0100
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
Subject: Re: [PATCH] powerpc: Don't use %pK through printk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250217-restricted-pointers-powerpc-v1-1-32c6bff63c9a@linutronix.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250217-restricted-pointers-powerpc-v1-1-32c6bff63c9a@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 17/02/2025 à 08:39, Thomas Weißschuh a écrit :
> Restricted pointers ("%pK") are not meant to be used through printk().
> It can unintentionally expose security sensitive, raw pointer values.
> 
> Use regular pointer formatting instead.
> 
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023%40linutronix.de%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C75a852a0fef54fa43a3608dd4f263f45%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638753747883689862%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=aUgq6pXb1ySaQ6e%2FdyM09jfc4MNLE71Njw0%2FnCg%2F6VU%3D&reserved=0
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/kernel/eeh_driver.c | 2 +-
>   arch/powerpc/perf/hv-24x7.c      | 8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> index 7efe04c68f0fe3fb1c3c13d97d58e79e47cf103b..10ce6b3bd3b7c54f91544ae7f7fd3f32a51ee09a 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -907,7 +907,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>   		/* FIXME: Use the same format as dump_stack() */
>   		pr_err("EEH: Call Trace:\n");
>   		for (i = 0; i < pe->trace_entries; i++)
> -			pr_err("EEH: [%pK] %pS\n", ptrs[i], ptrs[i]);
> +			pr_err("EEH: [%p] %pS\n", ptrs[i], ptrs[i]);
>   
>   		pe->trace_entries = 0;
>   	}
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index d400fa391c2765cf201ee4dc754007e655cc74ca..f6d734431b1dcdfec3b9205c3b48577b4fc26b53 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -713,12 +713,12 @@ static ssize_t catalog_event_len_validate(struct hv_24x7_event_data *event,
>   	ev_len = be16_to_cpu(event->length);
>   
>   	if (ev_len % 16)
> -		pr_info("event %zu has length %zu not divisible by 16: event=%pK\n",
> +		pr_info("event %zu has length %zu not divisible by 16: event=%p\n",
>   				event_idx, ev_len, event);
>   
>   	ev_end = (__u8 *)event + ev_len;
>   	if (ev_end > end) {
> -		pr_warn("event %zu has .length=%zu, ends after buffer end: ev_end=%pK > end=%pK, offset=%zu\n",
> +		pr_warn("event %zu has .length=%zu, ends after buffer end: ev_end=%p > end=%p, offset=%zu\n",
>   				event_idx, ev_len, ev_end, end,
>   				offset);
>   		return -1;
> @@ -726,14 +726,14 @@ static ssize_t catalog_event_len_validate(struct hv_24x7_event_data *event,
>   
>   	calc_ev_end = event_end(event, end);
>   	if (!calc_ev_end) {
> -		pr_warn("event %zu has a calculated length which exceeds buffer length %zu: event=%pK end=%pK, offset=%zu\n",
> +		pr_warn("event %zu has a calculated length which exceeds buffer length %zu: event=%p end=%p, offset=%zu\n",
>   			event_idx, event_data_bytes, event, end,
>   			offset);
>   		return -1;
>   	}
>   
>   	if (calc_ev_end > ev_end) {
> -		pr_warn("event %zu exceeds its own length: event=%pK, end=%pK, offset=%zu, calc_ev_end=%pK\n",
> +		pr_warn("event %zu exceeds its own length: event=%p, end=%p, offset=%zu, calc_ev_end=%p\n",
>   			event_idx, event, ev_end, offset, calc_ev_end);
>   		return -1;
>   	}
> 
> ---
> base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
> change-id: 20250217-restricted-pointers-powerpc-f11876496464
> 
> Best regards,


