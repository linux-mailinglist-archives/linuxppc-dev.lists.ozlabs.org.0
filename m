Return-Path: <linuxppc-dev+bounces-6582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D20A4A3C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 21:15:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4KFW13Vhz3bwJ;
	Sat,  1 Mar 2025 07:15:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740773710;
	cv=none; b=faWIjj6q5exFib0vgMKwwD8G2km6xvVb9wDWkT+fkAQW8TFY88kpdTHojTEwYT+fq9V+9+0THDkDN5kUByY6g987GukBLVjaubnYqx4VDSInIUdv9xphItAiu0jR5fyllCG53u+6r6kSaZ9linXgTCQ2QQH6YXBnZhR1ICoPBCAYWSPv9QCSYhhor6zf3cwJ0IjkanQ6WeRvSJQp5l/IGxHst7Fx8Q+gYhffbpZ2obY7oq5V/YilJGIrFMwNXga32v4WTNBkKpm1DS3hYVEJQDuHhI05RhcRYhzGrC2uacSj2/qi0atzU0WtDU9nRBRKG2XhdB0bM0/bJGPg/VJqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740773710; c=relaxed/relaxed;
	bh=uaOoox6EzS+ZSvY0NPXbuKnpFyjgwP5eG1tc6RcpKao=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FuF22OKd1FTt3CVaQbi405JDbaelRpTw3KWIu96mVQhTYmeXlnNjKf/hJDAK7fVukCvjj0D5IuKZrgd0gi8kp0L/Lw6J3PXhPLZQpxFhdWFPdavvigKi6+6M7OfSDl2aVbjd2Zjh0yxoGbBdW7k2Q3gbecVffQ8c8+yrVOZarcsHRkN9/M7ucxR9SzrY15xIqKD5XP/K7yDOK6EoJNPzafPhauMlhVkPKjge+UVdaR6HAMeT5D+mnVHizT+9E79kX35H/KsXL1tzfqRR8foqjq+Xq8+FdGo25TcnetXPVQgaU6dfp55G6ZO/PX5C7V/qCBMH2wAAAqHNJVQV8IQQWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org) smtp.mailfrom=orcam.me.uk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4KFT2nkyz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 07:15:06 +1100 (AEDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9817A92009E; Fri, 28 Feb 2025 21:15:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 912CB92009C;
	Fri, 28 Feb 2025 20:15:02 +0000 (GMT)
Date: Fri, 28 Feb 2025 20:15:02 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Don't use %pK through printk
In-Reply-To: <20250226105757-e935ee3e-f70d-4e0e-83bb-61307722a186@linutronix.de>
Message-ID: <alpine.DEB.2.21.2502281957310.12637@angie.orcam.me.uk>
References: <20250217-restricted-pointers-powerpc-v1-1-32c6bff63c9a@linutronix.de> <ffd5dd44-babc-480a-b1bc-61bd7ff1e920@csgroup.eu> <alpine.DEB.2.21.2502241840360.65342@angie.orcam.me.uk> <20250225091250-eac544ad-4e5b-47f7-83fc-5212c720483a@linutronix.de>
 <alpine.DEB.2.21.2502251654370.65342@angie.orcam.me.uk> <20250226105757-e935ee3e-f70d-4e0e-83bb-61307722a186@linutronix.de>
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

On Wed, 26 Feb 2025, Thomas Weißschuh wrote:

> > > By default, when kptr_restrict is set to 0, %pK behaves the same as %p.
> > > The same happened for a bunch of other architectures and nobody seems
> > > to have noticed in the past.
> > > The symbol-relative pointers or pointer formats designed for backtraces,
> > > as notes by Christophe, seem to be enough.
> > 
> >  I do hope so.
> 
> As mentioned before, personally I am fine with using %px here.

 Glad to hear!

> The values are in the register dumps anyways and security sensitive deployments
> will panic on WARN(), making the information disclosure useless.

 And even more so, I wasn't aware of this feature.  But this code doesn't 
make use of the WARN() facility, it just prints at the heightened KERN_ERR 
priority.

> > > But personally I'm also fine with using %px, as my goal is to remove the
> > > error-prone and confusing %pK.
> > 
> >  It's clear that `%pK' was meant to restrict access to /proc files and the 
> > like that may be accessible by unprivileged users:
> 
> Then let's stop abusing it. For something that is clear, it is
> misunderstood very often.

 Absolutely, I haven't questioned the removal of `%pK', but the switch to 
`%p' rather than `%px' specifically for this single hunk of your patch.

> > "
> > kptr_restrict
> > =============
> > 
> > This toggle indicates whether restrictions are placed on
> > exposing kernel addresses via ``/proc`` and other interfaces.
> > "
> > 
> > and not the kernel log, the information in which may come from rare events 
> > that are difficult to trigger and hard to recover via other means.  Sigh. 
> > Once you've got access to the kernel log, you may as well wipe the system 
> > or do any other harm you might like.
> 
> As I understand it, both the security and printk maintainers don't want the
> kernel log in general to be security sensitive and restricted.
> My goal here is not to push site-specific policy into the kernel but make life
> easier for kernel developers by removing the confusing and error-prone %pK
> altogether.

 Let me ask a different question then: is your approach to bulk-switch all 
instances of `%pK' to `%p' as the safe default and let other people figure 
out afterwards whether a different conversion specifier ought to be used 
instead on a case-by-case basis and then follow up with another patch, or 
will you consider these alternatives right away?

> Security is only one aspect.

 I think it's important enough though for us to ensure we don't compromise 
it by chance.

  Maciej

