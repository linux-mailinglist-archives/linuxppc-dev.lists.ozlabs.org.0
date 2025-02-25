Return-Path: <linuxppc-dev+bounces-6446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610BBA43514
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 07:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z26sL3rXMz2yvv;
	Tue, 25 Feb 2025 17:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740464406;
	cv=none; b=lwmcOYjdpNaCuVXGShNj9WPq1zrk5PzKKzic7+KkXNOrmHVpTzNdPrwdzU1b49zaa4WzTRIB+565vxN5OQaRlNikADZ/1aZ+MPoDFU9ZT6nwHbxBP7tt/CMzBJ5AAU+OkhAocN6KxH6VZLR7x/A+kOmvEQsBUEvCWWnFLHTKRalLPRBCDYedwoyo/RovImT01vlY1c8U+CC7gvdPvqf5TgvoDrHd6UrcD584WHbvxAqOj0hrJd0K+7U166Quu4qN163a4CFXQkU6g+gLZZWsMQEJyLu+k8+3GynP9QM5gygSUYnNceTAECTZVJlhKq+gXKK8+2X/9cUmFgdg+8idow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740464406; c=relaxed/relaxed;
	bh=vjHAsXQ5IQJ+/42mm4aDJJxzQUZsJTSwLQCYASozxz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bu0RKRwDD3S1tdERYVsTaQF9uJLu1DQhEhaeizDkIsXgS6JxWe01sLUSObJGSD6NiREpig3ZL19B8YBiJhVJOA8wOmJW6jqT+68IakKQVvdHxQYQFQ7Thq3oVw5grpA4C6yCMjjMvJJu1FM7qoVRX/AEzMVboG1hrYtmiBYyf9RHMFPCyXiMG4Mz+85+luc6GN9AkwD3wIxjTTDUMajNJNcUwJRdAOApZboGj3A5uZwwawf9XVUuWaykfb0L10E8lEMYK71kUPVoBRDrD0Ov6kq22ohR6UaZ7+/qOOuzBzpGqqVpdGZ6XOwRt6fc1deK/N65y4bHwJDdDuD6UEsmMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z26sK3v1mz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 17:20:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z26Nj44jNz9sSH;
	Tue, 25 Feb 2025 06:58:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elWzm5hk9ksV; Tue, 25 Feb 2025 06:58:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z26Nj2zRWz9sS8;
	Tue, 25 Feb 2025 06:58:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 422BB8B780;
	Tue, 25 Feb 2025 06:58:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id k1t4mJHItepu; Tue, 25 Feb 2025 06:58:45 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A74F38B77C;
	Tue, 25 Feb 2025 06:58:44 +0100 (CET)
Message-ID: <a7a135c9-c65b-48a8-a3a8-6aa98afe77d0@csgroup.eu>
Date: Tue, 25 Feb 2025 06:58:44 +0100
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
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250217-restricted-pointers-powerpc-v1-1-32c6bff63c9a@linutronix.de>
 <ffd5dd44-babc-480a-b1bc-61bd7ff1e920@csgroup.eu>
 <alpine.DEB.2.21.2502241840360.65342@angie.orcam.me.uk>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <alpine.DEB.2.21.2502241840360.65342@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 24/02/2025 à 19:54, Maciej W. Rozycki a écrit :
> ***ATTENTION, Sopra Steria Group cannot confirm the identity of this email sender (SPF record failure). This might be a fake email from an attacker, if you have any doubts report and delete the email.***
> 
> ***ATTENTION, Sopra Steria Group ne peut pas confirmer l’identité de l’émetteur de ce message (SPF record failure). Il pourrait s’agir d’un faux message, à détruire si vous avez un doute ***
> 
> On Mon, 24 Feb 2025, Christophe Leroy wrote:
> 
>>> Restricted pointers ("%pK") are not meant to be used through printk().
>>> It can unintentionally expose security sensitive, raw pointer values.
>>>
>>> Use regular pointer formatting instead.
>>>
>>> Link:
>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023%40linutronix.de%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9079ef2ec60e4717ec8e08dd5504b718%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638760200949886583%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=d2QCtnssTlVmKOKR57rui%2Fq73UsAAoZrim%2FABaz5IFs%3D&reserved=0
>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>
>>> ---
>>>    arch/powerpc/kernel/eeh_driver.c | 2 +-
>>>    arch/powerpc/perf/hv-24x7.c      | 8 ++++----
>>>    2 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/eeh_driver.c
>>> b/arch/powerpc/kernel/eeh_driver.c
>>> index
>>> 7efe04c68f0fe3fb1c3c13d97d58e79e47cf103b..10ce6b3bd3b7c54f91544ae7f7fd3f32a51ee09a
>>> 100644
>>> --- a/arch/powerpc/kernel/eeh_driver.c
>>> +++ b/arch/powerpc/kernel/eeh_driver.c
>>> @@ -907,7 +907,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>>>              /* FIXME: Use the same format as dump_stack() */
>>>              pr_err("EEH: Call Trace:\n");
>>>              for (i = 0; i < pe->trace_entries; i++)
>>> -                   pr_err("EEH: [%pK] %pS\n", ptrs[i], ptrs[i]);
>>> +                   pr_err("EEH: [%p] %pS\n", ptrs[i], ptrs[i]);
>>>                      pe->trace_entries = 0;
>>>      }
> 
>   But shouldn't this be using `%px' then instead?  It would be sad if all
> the address information from error reports such as below:
> 
> EEH: Call Trace:
> EEH: [000000008985bc3b] __eeh_send_failure_event+0x78/0x150
> EEH: [000000008c4c5782] eeh_dev_check_failure+0x388/0x6b0
> EEH: [000000001fb766c1] eeh_check_failure+0x98/0x100
> EEH: [000000004b9af8c6] dfx_port_read_long+0xb0/0x130 [defxx]
> EEH: [00000000e23999c1] dfx_interrupt+0x80/0x8c0 [defxx]
> EEH: [00000000c7884fb7] __handle_irq_event_percpu+0x9c/0x2f0
> EEH: [000000008d4e9afd] handle_irq_event_percpu+0x44/0xc0
> EEH: [000000008c39ece4] handle_irq_event+0x74/0xc0
> EEH: [00000000d85114a9] handle_fasteoi_irq+0xd4/0x220
> EEH: [00000000a692ef4e] generic_handle_irq+0x54/0x80
> EEH: [00000000a6db243b] __do_irq+0x68/0x200
> EEH: [0000000040ccff9e] call_do_irq+0x14/0x24
> EEH: [00000000e8e9ddf7] do_IRQ+0x78/0xd0
> EEH: [0000000031916539] replay_soft_interrupts+0x180/0x370
> EEH: [000000001b7e5728] arch_local_irq_restore+0x48/0xc0
> EEH: [00000000088691b7] cpuidle_enter_state+0x108/0x560
> EEH: [00000000e6e26f30] cpuidle_enter+0x50/0x70
> EEH: [000000007c26474c] call_cpuidle+0x4c/0x80
> EEH: [0000000036b8a2fc] do_idle+0x360/0x3b0
> EEH: [0000000048702083] cpu_startup_entry+0x38/0x40
> EEH: [00000000d3b1fb8d] start_secondary+0x62c/0x660
> EEH: [0000000041a9a815] start_secondary_prolog+0x10/0x14
> 
> was suddenly lost from the kernel log, the access to which unprivileged
> users can be denied if so desired according to the site policy.  Whereas
> running the kernel such as to have all output from plain `%p' exposed just
> to cope with this proposed change, now that seems like a security risk.

The purpose of hashed addresses is to avoid kernel addresses to leak to 
the kernel log. Here you have function names, if you get real function 
addresses at the same time, then you know everything about kernel 
addresses and for instance KASLR becomes just pointless.

By the way, why do you need the addresses at all in addition to function 
names ? When I look at x86 dump stack, they only print function name, 
using %pBb

Christophe

