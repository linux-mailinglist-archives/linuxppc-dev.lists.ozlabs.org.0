Return-Path: <linuxppc-dev+bounces-6474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7E4A44804
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 18:29:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2PjT65Bhz2yVD;
	Wed, 26 Feb 2025 04:29:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740504557;
	cv=none; b=kDC5zftvQne+fQfPVSYR3xbeD1Llbimvpk1bMFo4ggigI2QKEjiGttOjRHt+KdyzDdkqqg9M3um/Eg0yzn1/y25JrmrUqAED94qOsmP1TQTc9Vbw5YsQIze2wIIf2s/7CiSq6APPemp/p6YU2QvU9AGSAC2aE97QnLk4UNoY1ibLBuZgQE9EuOd9LXfCZQbRLq4E/DwtCmU6JgiQMJFaBNSob9cVQe4Sd8f9iV4cPdotKMciNtO1oBNPTJ/xmEoNHiQEkgA2ZB/VgN7dSeBlh10JUnJJEchk0cZTAQBGvPBdMTXAO741cS3FtBssex4p1cQ+8jmLH/itmqb6csBXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740504557; c=relaxed/relaxed;
	bh=70O9z3qaRxdpBjJVzrogbuzKce4XcWmBH2MKTld/8hY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Mh/cWr3F3LpKCvpjS3ocAQwXk3q6PcyGb1vPJqF9Z4THSxTPWwFognAFHssSndNjbfTrNSYe8XHx0WEeCMpmvZuUnWRWK4wgDlMZgNMcPCy829lS/bxhQ2T8POY2ULlUjv/0bxRsANcJScyyoGlzX1h5grtEp0p+KE0WzmBW7rIE5OgavKkwtQLTNTKAgvtEYxGHMqGWB0WDBxhUVL/zmW7aWwqW53Zj/YL5m1SOy5s7o1OkoWg2iTD1WlWgdBYCmii+nYQiNGgQqI2Vm/3p8LftlhM7kZ7sCExa9QnQU44AdCGEOKLe3G0Z1oFqF84bu4+fQxbiK01ph+u4uMYymg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org) smtp.mailfrom=orcam.me.uk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2PjS5Bsbz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 04:29:15 +1100 (AEDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 10D1992009C; Tue, 25 Feb 2025 18:29:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0CEBB92009B;
	Tue, 25 Feb 2025 17:29:10 +0000 (GMT)
Date: Tue, 25 Feb 2025 17:29:09 +0000 (GMT)
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
In-Reply-To: <a7a135c9-c65b-48a8-a3a8-6aa98afe77d0@csgroup.eu>
Message-ID: <alpine.DEB.2.21.2502251703450.65342@angie.orcam.me.uk>
References: <20250217-restricted-pointers-powerpc-v1-1-32c6bff63c9a@linutronix.de> <ffd5dd44-babc-480a-b1bc-61bd7ff1e920@csgroup.eu> <alpine.DEB.2.21.2502241840360.65342@angie.orcam.me.uk> <a7a135c9-c65b-48a8-a3a8-6aa98afe77d0@csgroup.eu>
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
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 25 Feb 2025, Christophe Leroy wrote:

> > was suddenly lost from the kernel log, the access to which unprivileged
> > users can be denied if so desired according to the site policy.  Whereas
> > running the kernel such as to have all output from plain `%p' exposed just
> > to cope with this proposed change, now that seems like a security risk.
> 
> The purpose of hashed addresses is to avoid kernel addresses to leak to the
> kernel log. Here you have function names, if you get real function addresses
> at the same time, then you know everything about kernel addresses and for
> instance KASLR becomes just pointless.

 Why is it so important not to have kernel addresses in the kernel log?  
This defeats the purpose of having diagnostics for such fatal events.

 If your site policy so requires, you can disable access to the kernel log 
for unprivileged users, in which case once you do have one you can poke at 
/dev/mem too and have a thousand other ways to do harm.  And if you are a 
sloppy admin and have /var/log/messages world-readable where you really 
ought not to, then well, what can I say?

 From the description of `%pK' I infer it's been meant for /proc files and 
the like that may be readable to unprivileged users, and I can certainly
understand the security implications here.

> By the way, why do you need the addresses at all in addition to function names
> ? When I look at x86 dump stack, they only print function name, using %pBb

 They can be handed over to GDB, `objdump' and similar debug tools when 
working with `vmlinux'.  Function names do help, giving you assistance to 
make sure you work with matching `vmlinux'.

 NB I don't know what x86 does, I've done little in that area in the 
recent ~20 years, mostly taking care about my legacy 32-bit i486/i586 
stuff.

  Maciej

