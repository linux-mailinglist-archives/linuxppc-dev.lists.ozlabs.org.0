Return-Path: <linuxppc-dev+bounces-6617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA426A4BD76
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:08:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5wzC4WwWz30VJ;
	Mon,  3 Mar 2025 22:08:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000103;
	cv=none; b=VB6Ux7i8HnKngyWK9px1fyysFHqpmztRkza90+KVpSSnI75Aq8x76B3XDaEtUN7GACF543xce3syZArnoPdcrL3i2YqnoCWZSXWtpKWRsFCZalEeCUNVXV4KtT0zKh9NNXar5B4pvzSpigCD8Dixi8LValkxi/kFQQkylNBmYAJEmVTXrI+MmXKlk9PNBliwTL8SF8+C+lWQqShDeqAdxWyOlIy3RiitcPvT4sXQp2w/m6eMdN77oIWt2Wd00idPABvXjX8a2BSqe7bDN/rbVCttxVEUhvQUX5S+oQAuyZHrZFBGRVObD2yprfeKKf8YeCkeMHi+v260thTBxaBwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000103; c=relaxed/relaxed;
	bh=L1D+CnraKUZCvWBX2D//PKQHKSwg0AKuuuoMcb0rgws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8Nq98xaLV5qb97mVbzNw/Rc3bIXEZG9UrJchhzdLLI9c5HFqxsFET8iCHI7Zt+Fu1h6qyuH5oGbHJFmHTL0D8QSEygv9tSC9JQ5sSHFD2stN3cBnHS6K+WSZBx0tTwAoE1tQS3mc3wQfrvgO+fC6baETWSUBiDI87+l0aRX/S5L2qLYOoGpGff446XWX9Tpq7Tat02wVUOo1lFRGAqt0B3x9P9FK6ZJ38z5fcn2SKgTy3FnrMLrLklm9v5lLAk3ItRqlRWyIudOVeYFcQCwH3eiO2sBy3p/gG3cIPjaP1iPHG8jtLi8n3ZGFXEtnDZ1/9o5c8JD2d10AwNlA5MMlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WY3Bcvwq; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=weIS7mWu; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WY3Bcvwq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=weIS7mWu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5wz960Z6z30Tq
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:08:21 +1100 (AEDT)
Date: Mon, 3 Mar 2025 12:08:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1D+CnraKUZCvWBX2D//PKQHKSwg0AKuuuoMcb0rgws=;
	b=WY3BcvwqJfY3+izuTEss/XpsgEDHLEaBomUNon3BENJfcWrR9vFNFyQh+HE0Ng0LU3VJOV
	cLOhtw/pgT7QEX5+3fnLR+WZEgEEcg3m057qcuRhitc8b9EcjiVXxSGEPipOy8QaGULV1n
	FMbP+++SB7bbOd7OkE0/sSp4nfRb0wC4D7ObJZEGhDxnn4HFPIo8zIjBr/GQxQbrg2xuvt
	5WE3Frj635yzpVKORmTTpXTuUOjDnfpWeDu2kxbXbUTDFlKe+gziyLP4TogcUvzKudOl5W
	3x7WOYHzmQj0qAjeL1jcBmDr20VHXPT/KIhn4zIP8CiDsVlxRfYPzTlnFhKPRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1D+CnraKUZCvWBX2D//PKQHKSwg0AKuuuoMcb0rgws=;
	b=weIS7mWuYbNKbYzEpacOGd7w6cmMf55sMrM4/Mj2I5nQ/q7V+crriNXkCP2mUClA/2cbkK
	328REvnkCOCCwFDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Don't use %pK through printk
Message-ID: <20250303115007-beb39d5b-71f5-458a-82fe-9e82c9ab720e@linutronix.de>
References: <20250217-restricted-pointers-powerpc-v1-1-32c6bff63c9a@linutronix.de>
 <ffd5dd44-babc-480a-b1bc-61bd7ff1e920@csgroup.eu>
 <alpine.DEB.2.21.2502241840360.65342@angie.orcam.me.uk>
 <20250225091250-eac544ad-4e5b-47f7-83fc-5212c720483a@linutronix.de>
 <alpine.DEB.2.21.2502251654370.65342@angie.orcam.me.uk>
 <20250226105757-e935ee3e-f70d-4e0e-83bb-61307722a186@linutronix.de>
 <alpine.DEB.2.21.2502281957310.12637@angie.orcam.me.uk>
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
In-Reply-To: <alpine.DEB.2.21.2502281957310.12637@angie.orcam.me.uk>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 28, 2025 at 08:15:02PM +0000, Maciej W. Rozycki wrote:
> On Wed, 26 Feb 2025, Thomas Weißschuh wrote:
> 
> > > > By default, when kptr_restrict is set to 0, %pK behaves the same as %p.
> > > > The same happened for a bunch of other architectures and nobody seems
> > > > to have noticed in the past.
> > > > The symbol-relative pointers or pointer formats designed for backtraces,
> > > > as notes by Christophe, seem to be enough.
> > > 
> > >  I do hope so.
> > 
> > As mentioned before, personally I am fine with using %px here.
> 
>  Glad to hear!
> 
> > The values are in the register dumps anyways and security sensitive deployments
> > will panic on WARN(), making the information disclosure useless.
> 
>  And even more so, I wasn't aware of this feature.  But this code doesn't 
> make use of the WARN() facility, it just prints at the heightened KERN_ERR 
> priority.

Indeed, I got confused with some other patches where WARN() is used mostly.
This makes it a bit murkier.

> > > > But personally I'm also fine with using %px, as my goal is to remove the
> > > > error-prone and confusing %pK.
> > > 
> > >  It's clear that `%pK' was meant to restrict access to /proc files and the 
> > > like that may be accessible by unprivileged users:
> > 
> > Then let's stop abusing it. For something that is clear, it is
> > misunderstood very often.
> 
>  Absolutely, I haven't questioned the removal of `%pK', but the switch to 
> `%p' rather than `%px' specifically for this single hunk of your patch.

Sure. It would be great if one of the maintainers could confirm this preference.

> > > "
> > > kptr_restrict
> > > =============
> > > 
> > > This toggle indicates whether restrictions are placed on
> > > exposing kernel addresses via ``/proc`` and other interfaces.
> > > "
> > > 
> > > and not the kernel log, the information in which may come from rare events 
> > > that are difficult to trigger and hard to recover via other means.  Sigh. 
> > > Once you've got access to the kernel log, you may as well wipe the system 
> > > or do any other harm you might like.
> > 
> > As I understand it, both the security and printk maintainers don't want the
> > kernel log in general to be security sensitive and restricted.
> > My goal here is not to push site-specific policy into the kernel but make life
> > easier for kernel developers by removing the confusing and error-prone %pK
> > altogether.
> 
>  Let me ask a different question then: is your approach to bulk-switch all 
> instances of `%pK' to `%p' as the safe default and let other people figure 
> out afterwards whether a different conversion specifier ought to be used 
> instead on a case-by-case basis and then follow up with another patch, or 
> will you consider these alternatives right away?

I am considering on a case-by-case basis. But mostly the decision is that %p is
enough, because by default %pK has been the same as %p anyways.
Also the current wave of replacements does not touch valid users of %pK.
They will stay and later be replaced with a new and better API.

> > Security is only one aspect.
> 
>  I think it's important enough though for us to ensure we don't compromise 
> it by chance.

Agreed.

