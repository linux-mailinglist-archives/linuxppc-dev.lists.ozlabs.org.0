Return-Path: <linuxppc-dev+bounces-6475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 177ABA44822
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 18:32:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2Pmt58C5z2yhG;
	Wed, 26 Feb 2025 04:32:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740504734;
	cv=none; b=fRojxlhDiuIB/2zr4svPYKs7S8d9eMPRRTOegU8+aK1/pbWeMNrWW7TIsCQ37+hNNJVICeqqLtHNR3prWuKU7PxHXmGXG7LLc3HoMd3chyCSRVEBPdSz67OXJMG4evBdRdRVmsz1x/Kl6eKwfEuHeeUD/GIOJNFA9akE13wY8xt35ysNEQBnXGx41II8zrjy+vGAWG0djpLMu22x3TifBHGaiP/pYk/oZuRLsO12S7w2Chl59z29QUDJXEDDmWL2uR4AB2vdXdXZnyR8KqaQS90rB4hy9zZKgdVo0msEXag+uQo7WtmJLKPW7a1zRRzI7OSGfNz/9XGgAI/5wuEMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740504734; c=relaxed/relaxed;
	bh=dU+14QRmWLwq2qUVeRhBWFrs6XgEYM/WpaAtMrF9O6g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Zxgygv2h3dsgwMPW/JwJ6GlIXPZs+OgpIQJC0/3JBRUCvTkYvLUNpTR2nfd91dkNysBDsvl+HE6vlGJ0sC35y3PEgveMasoivcZDRCYViuyIWWwau4NYbfcpKBBNVMxzTgpdLp4GkMUxAspbejbuFEGGX4Ly9UIFJO3WYKdoR51UrRZ47QZiUur0MR0aBOxDFc5yANtWN4mAorSHwRDO4dt9vyF3LkUdvystJogrwlsM3Iz1T98GYZL44ze/DAHDKMor2pRnrgyWUDdcpOe4jYNu3s6d659sYE7Phq8BzyMJLGzhiSJlCDzVJUgdTUQ1swQVJw91eak+ZiP29GNY8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org) smtp.mailfrom=orcam.me.uk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2Pms707mz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 04:32:13 +1100 (AEDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3AC7B92009C; Tue, 25 Feb 2025 18:32:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 3651F92009B;
	Tue, 25 Feb 2025 17:32:12 +0000 (GMT)
Date: Tue, 25 Feb 2025 17:32:12 +0000 (GMT)
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
In-Reply-To: <20250225091250-eac544ad-4e5b-47f7-83fc-5212c720483a@linutronix.de>
Message-ID: <alpine.DEB.2.21.2502251654370.65342@angie.orcam.me.uk>
References: <20250217-restricted-pointers-powerpc-v1-1-32c6bff63c9a@linutronix.de> <ffd5dd44-babc-480a-b1bc-61bd7ff1e920@csgroup.eu> <alpine.DEB.2.21.2502241840360.65342@angie.orcam.me.uk> <20250225091250-eac544ad-4e5b-47f7-83fc-5212c720483a@linutronix.de>
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

On Tue, 25 Feb 2025, Thomas Weißschuh wrote:

> > was suddenly lost from the kernel log, the access to which unprivileged 
> > users can be denied if so desired according to the site policy.  Whereas 
> > running the kernel such as to have all output from plain `%p' exposed just 
> > to cope with this proposed change, now that seems like a security risk.
> 
> Your point makes sense.
> *But* the addresses in your example are already hashed,
> as indicated by the all-zero upper 32 bits.

 Darn it!

> By default, when kptr_restrict is set to 0, %pK behaves the same as %p.
> The same happened for a bunch of other architectures and nobody seems
> to have noticed in the past.
> The symbol-relative pointers or pointer formats designed for backtraces,
> as notes by Christophe, seem to be enough.

 I do hope so.

> But personally I'm also fine with using %px, as my goal is to remove the
> error-prone and confusing %pK.

 It's clear that `%pK' was meant to restrict access to /proc files and the 
like that may be accessible by unprivileged users:

"
kptr_restrict
=============

This toggle indicates whether restrictions are placed on
exposing kernel addresses via ``/proc`` and other interfaces.
"

and not the kernel log, the information in which may come from rare events 
that are difficult to trigger and hard to recover via other means.  Sigh. 
Once you've got access to the kernel log, you may as well wipe the system 
or do any other harm you might like.

  Maciej

