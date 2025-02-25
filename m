Return-Path: <linuxppc-dev+bounces-6454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EDBA43743
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 09:19:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z29W0629bz30TJ;
	Tue, 25 Feb 2025 19:19:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740471564;
	cv=none; b=oPWh2a5KPuZ7qoI/04mSOOBpk9cVa3P3tQ4UoeHoSFJ+rU8TdlPty0o+IUslCJ//+mKAyyqlanj0hLSOQH1Mw+s4KjbCq1P55kCCJ50lsXMtkOp5IORaYRDoJ1JD5H/oMoeCMx4kp4whGGxyvdV7isgsKtgzHC8fDF4CP2nPDWEA16j6ny+JMykivOEDOvECoqSoz+L6X4f/HxDvfE9WaNMg+nGZDYdXKOKWUWndzd7b59/iLNEs0K1EBdudQBEb751+9jDgrzgkcs3gaOqgXw9NwLBNL3AIx5WgTuWxZwHrfz2aVkqQ74ujh1G7AtE9jnae9DkItb+c5EJjzsFnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740471564; c=relaxed/relaxed;
	bh=MbmGE3lh0+rEmbWN8ci1bBU7IZ/e52tY6v25JTl98TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOveoE8uLbcpYyj6LEb7C7m2rIO3IcuGAWTWlyLYFyKf7d3xjdCCNH/tvV+o1fKeY+S+8lCJSFt2403ch2vZXfD4Y68rSQSLWkFLfo5PlC5Qq67NfEzql7wrXB9vcvkkb8TK6Da0gk6eGGijH/cA3gdcPYup7Yx161NFyJH0gHXPBYZ6aQo19p8KGFZQ7bg5/SpzAmFvQpoT2UZbR9+FBgEeMuk9jcTqFDPG3J4AZw0uXLLQFhVs37dd2ZXxmlYObVlsrm9GfnlLRBK7mQ2+18BBM2x4+j0BW4119LR6eWIuwcUoSu3qBttGtBpbNTtgGR5EQRioQSnGp6JeOPcP1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ETY/Jcws; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Yj/d7+Wa; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ETY/Jcws;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Yj/d7+Wa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z29Vz1b1nz30PF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 19:19:23 +1100 (AEDT)
Date: Tue, 25 Feb 2025 09:19:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740471557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MbmGE3lh0+rEmbWN8ci1bBU7IZ/e52tY6v25JTl98TM=;
	b=ETY/Jcws9iN3+iLmGHdsECVEC/bWqYwDEohdXe6fxA892cgHkwXS7icb1PQeuoVKI59psh
	eoTksaQAK5djqOSCwXRwWNNogSiJ7PxurzkYnu59biBWMxXs85kaJK0SllNrYjNDGL64zo
	GgkXWWqYVYkvGCGg6oZD6D1Pc7otPqvnI6o/z5FnMIjAJB1DCPG3OU19ROmedbt2MeTjRg
	Zy3EJVVADe12/dsB/+ZhbjRnvLbero2PYougZQ+LOpODV60hTdoF6jGTsPWWBTmb0VWSvC
	d2TiRTxmhCBR3TuCHtu286U6dkktd1qvIxu2IgwKzI5gTWcwyJ4UMEUFlASa5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740471557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MbmGE3lh0+rEmbWN8ci1bBU7IZ/e52tY6v25JTl98TM=;
	b=Yj/d7+WaDLF6XW2kHzohhFYpb9iUmVk+7t86CnWvVyGepa1QkW/dgDwRIe4OuQh5EOdLxg
	12fyjzKLV50iXxDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Don't use %pK through printk
Message-ID: <20250225091250-eac544ad-4e5b-47f7-83fc-5212c720483a@linutronix.de>
References: <20250217-restricted-pointers-powerpc-v1-1-32c6bff63c9a@linutronix.de>
 <ffd5dd44-babc-480a-b1bc-61bd7ff1e920@csgroup.eu>
 <alpine.DEB.2.21.2502241840360.65342@angie.orcam.me.uk>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2502241840360.65342@angie.orcam.me.uk>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 24, 2025 at 06:54:47PM +0000, Maciej W. Rozycki wrote:
> On Mon, 24 Feb 2025, Christophe Leroy wrote:
> 
> > > Restricted pointers ("%pK") are not meant to be used through printk().
> > > It can unintentionally expose security sensitive, raw pointer values.
> > > 
> > > Use regular pointer formatting instead.
> > > 
> > > Link:
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023%40linutronix.de%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C75a852a0fef54fa43a3608dd4f263f45%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638753747883689862%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=aUgq6pXb1ySaQ6e%2FdyM09jfc4MNLE71Njw0%2FnCg%2F6VU%3D&reserved=0
> > > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > 
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > 
> > > ---
> > >   arch/powerpc/kernel/eeh_driver.c | 2 +-
> > >   arch/powerpc/perf/hv-24x7.c      | 8 ++++----
> > >   2 files changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/kernel/eeh_driver.c
> > > b/arch/powerpc/kernel/eeh_driver.c
> > > index
> > > 7efe04c68f0fe3fb1c3c13d97d58e79e47cf103b..10ce6b3bd3b7c54f91544ae7f7fd3f32a51ee09a
> > > 100644
> > > --- a/arch/powerpc/kernel/eeh_driver.c
> > > +++ b/arch/powerpc/kernel/eeh_driver.c
> > > @@ -907,7 +907,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
> > >   		/* FIXME: Use the same format as dump_stack() */
> > >   		pr_err("EEH: Call Trace:\n");
> > >   		for (i = 0; i < pe->trace_entries; i++)
> > > -			pr_err("EEH: [%pK] %pS\n", ptrs[i], ptrs[i]);
> > > +			pr_err("EEH: [%p] %pS\n", ptrs[i], ptrs[i]);
> > >     		pe->trace_entries = 0;
> > >   	}
> 
>  But shouldn't this be using `%px' then instead?  It would be sad if all 
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

Your point makes sense.
*But* the addresses in your example are already hashed,
as indicated by the all-zero upper 32 bits.
By default, when kptr_restrict is set to 0, %pK behaves the same as %p.
The same happened for a bunch of other architectures and nobody seems
to have noticed in the past.
The symbol-relative pointers or pointer formats designed for backtraces,
as notes by Christophe, seem to be enough.

But personally I'm also fine with using %px, as my goal is to remove the
error-prone and confusing %pK.

Thomas

