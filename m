Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2589B73E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 07:44:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1yWZ8c3a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCdMr6zhzz3dXN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 15:44:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1yWZ8c3a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCdM84SThz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 15:44:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD655CE0C61;
	Mon,  8 Apr 2024 05:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D56FC433F1;
	Mon,  8 Apr 2024 05:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712555054;
	bh=vMTO+JCxJ/pC8pUOQVFfrJmUCn0gHKZBHp2mN8vrUkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1yWZ8c3afHE2SqsjmwsiwlagPW2l0wHd6orMPdWrLRaIm4oevC51UhVuVWvEMsD78
	 HMK8Rnmq2St49ROmoMrJe9eqkhIJClsPRUAFWerMk3yzPPSzyhGZ5mpq7FhIV13v0r
	 NAYbYrf+vMkX3iWja7ouU1FF3yCxfW+KqwaKWPbE=
Date: Mon, 8 Apr 2024 07:44:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq
 flood
Message-ID: <2024040843-plug-thirstily-e478@gregkh>
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain>
 <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
 <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com>
 <87y19s7bk6.fsf@mail.lhotse>
 <4bddf8ec-97f1-07f6-9c0a-523c102c0a1b@linux-m68k.org>
 <87v84sbexv.fsf@mail.lhotse>
 <b1553164-18db-4f5c-b1a5-28a393d64941@kernel.org>
 <3adf561b-2d6b-47be-8fca-2a26ee738670@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3adf561b-2d6b-47be-8fca-2a26ee738670@kernel.org>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Finn Thain <fthain@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 08, 2024 at 07:37:22AM +0200, Jiri Slaby wrote:
> On 08. 04. 24, 7:32, Jiri Slaby wrote:
> > On 08. 04. 24, 7:29, Michael Ellerman wrote:
> > > Many maintainers won't drop Cc: tags if they are there in the submitted
> > > patch. So I agree with Andy that we should encourage folks not to add
> > > them in the first place.
> > 
> > But fix the docs first.
> > 
> > I am personally not biased to any variant (as in: I don't care where CCs
> > live in a patch).
> 
> OTOH, as a submitter, it's a major PITA to carry CCs in notes (to have those
> under the --- line). Esp. when I have patches in a queue for years.

Agreed, let's keep them where they are in the signed-off-by area, it's
not hurting or harming anything to have them there.

thanks,

greg k-h
