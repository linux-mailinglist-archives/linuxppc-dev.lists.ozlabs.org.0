Return-Path: <linuxppc-dev+bounces-6432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A8A42C12
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 19:54:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1qfk4lRkz2ynf;
	Tue, 25 Feb 2025 05:54:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740423294;
	cv=none; b=e/s2Rxv4RfneNIVHqnSppvo8GG6kZDrmetzrcpp80V+PAvX1hC3+Zb7kD0dM3wxUvkLA2iY5ZzhaIkSEhDzpzpMkeuDoO9vPiobEo86AGqNq9su4fjKz/VtdqWnAa/C76aWG4NqUBZknO3igaL7NXTzxPked7dRLWc4g1NZfk/YYzcy+dKb4ZW1vmygMIO0LjLwBEf5JD++e7ZCX8ZK6cKRi1LfeFL4aCsBpn3tK06F1Wen6KBHNQfFNOgRfzruCjOLl0FtnnEtyUtw84NmoVAlkNedtu+xNGySOuvwTobq6+xhMLEPkZlBGWOmWD1UFYG+nBWmFuGfPE14P/UdQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740423294; c=relaxed/relaxed;
	bh=YluMPzkYsTnXYqs2SbRVlhdYZTHxCY54jT1aZdmybgE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dQLAryiGksYSeRkTn1BjAGAalzQCwMtu8ANzK/0cb/KKYeORtJJBVxdSvtgDxW5CkEKFyusp9tj/jfIHIpwltMH/bVOoTKTUbLV0cbhnP/0A2XXcNazN4pOIIHwF9PxOJyNXgmQhj3QimWmYkpebLyfhkwPe3lkFd4KhvW3Dj5gugpd7k0LyYvU5JHY0o959TQ/W6WhGPM+O6rqKNxsfP7EIo8/WPKSYVZ+x8g2jhqlQvBQTtynhNAGeTSLWYpr9ZueRnZCFoDNTVVPYJVjdP8Asx0oKwDFHLANbb/yGmAEjD3IG+zmLd52dZUmLQqyf8SJDVfwKqD6C26Qr1Pfwzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org) smtp.mailfrom=orcam.me.uk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1qfj3PNlz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 05:54:51 +1100 (AEDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6D16692009C; Mon, 24 Feb 2025 19:54:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5F97F92009B;
	Mon, 24 Feb 2025 18:54:47 +0000 (GMT)
Date: Mon, 24 Feb 2025 18:54:47 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Don't use %pK through printk
In-Reply-To: <ffd5dd44-babc-480a-b1bc-61bd7ff1e920@csgroup.eu>
Message-ID: <alpine.DEB.2.21.2502241840360.65342@angie.orcam.me.uk>
References: <20250217-restricted-pointers-powerpc-v1-1-32c6bff63c9a@linutronix.de> <ffd5dd44-babc-480a-b1bc-61bd7ff1e920@csgroup.eu>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 24 Feb 2025, Christophe Leroy wrote:

> > Restricted pointers ("%pK") are not meant to be used through printk().
> > It can unintentionally expose security sensitive, raw pointer values.
> > 
> > Use regular pointer formatting instead.
> > 
> > Link:
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023%40linutronix.de%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C75a852a0fef54fa43a3608dd4f263f45%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638753747883689862%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=aUgq6pXb1ySaQ6e%2FdyM09jfc4MNLE71Njw0%2FnCg%2F6VU%3D&reserved=0
> > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> > ---
> >   arch/powerpc/kernel/eeh_driver.c | 2 +-
> >   arch/powerpc/perf/hv-24x7.c      | 8 ++++----
> >   2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/eeh_driver.c
> > b/arch/powerpc/kernel/eeh_driver.c
> > index
> > 7efe04c68f0fe3fb1c3c13d97d58e79e47cf103b..10ce6b3bd3b7c54f91544ae7f7fd3f32a51ee09a
> > 100644
> > --- a/arch/powerpc/kernel/eeh_driver.c
> > +++ b/arch/powerpc/kernel/eeh_driver.c
> > @@ -907,7 +907,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
> >   		/* FIXME: Use the same format as dump_stack() */
> >   		pr_err("EEH: Call Trace:\n");
> >   		for (i = 0; i < pe->trace_entries; i++)
> > -			pr_err("EEH: [%pK] %pS\n", ptrs[i], ptrs[i]);
> > +			pr_err("EEH: [%p] %pS\n", ptrs[i], ptrs[i]);
> >     		pe->trace_entries = 0;
> >   	}

 But shouldn't this be using `%px' then instead?  It would be sad if all 
the address information from error reports such as below:

EEH: Call Trace:
EEH: [000000008985bc3b] __eeh_send_failure_event+0x78/0x150
EEH: [000000008c4c5782] eeh_dev_check_failure+0x388/0x6b0
EEH: [000000001fb766c1] eeh_check_failure+0x98/0x100
EEH: [000000004b9af8c6] dfx_port_read_long+0xb0/0x130 [defxx]
EEH: [00000000e23999c1] dfx_interrupt+0x80/0x8c0 [defxx]
EEH: [00000000c7884fb7] __handle_irq_event_percpu+0x9c/0x2f0
EEH: [000000008d4e9afd] handle_irq_event_percpu+0x44/0xc0
EEH: [000000008c39ece4] handle_irq_event+0x74/0xc0
EEH: [00000000d85114a9] handle_fasteoi_irq+0xd4/0x220
EEH: [00000000a692ef4e] generic_handle_irq+0x54/0x80
EEH: [00000000a6db243b] __do_irq+0x68/0x200
EEH: [0000000040ccff9e] call_do_irq+0x14/0x24
EEH: [00000000e8e9ddf7] do_IRQ+0x78/0xd0
EEH: [0000000031916539] replay_soft_interrupts+0x180/0x370
EEH: [000000001b7e5728] arch_local_irq_restore+0x48/0xc0
EEH: [00000000088691b7] cpuidle_enter_state+0x108/0x560
EEH: [00000000e6e26f30] cpuidle_enter+0x50/0x70
EEH: [000000007c26474c] call_cpuidle+0x4c/0x80
EEH: [0000000036b8a2fc] do_idle+0x360/0x3b0
EEH: [0000000048702083] cpu_startup_entry+0x38/0x40
EEH: [00000000d3b1fb8d] start_secondary+0x62c/0x660
EEH: [0000000041a9a815] start_secondary_prolog+0x10/0x14

was suddenly lost from the kernel log, the access to which unprivileged 
users can be denied if so desired according to the site policy.  Whereas 
running the kernel such as to have all output from plain `%p' exposed just 
to cope with this proposed change, now that seems like a security risk.

  Maciej

