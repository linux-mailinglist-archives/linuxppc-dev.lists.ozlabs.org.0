Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A87E5814B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 16:01:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lsdr61Wszz3c42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 00:01:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M/h0WLug;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M/h0WLug;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsdqS09Drz3bZY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 00:01:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 16A49615E2;
	Tue, 26 Jul 2022 14:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20515C433D6;
	Tue, 26 Jul 2022 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658844063;
	bh=AosfRxjkoU2i+zR4aHlEc3dyzHUvSeatzF0JZdFojzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/h0WLug9KwfRBC8mTu66Uue6gyvGeCAULQ5rNjPPPm4Jihv1Ei2+xoXr7kfOkriF
	 GotTS2uWHpIWTXmTbXM0unkosb86uFyJLXM2wkF4H1jXoaI1OJdd73y5h3VoiSnnMn
	 K7Nud0LeEmyCH8NdS8JrdNeilEfGoax5x7VOyhF14xVPNBmnHvH9Q3fvoOwk87weN1
	 cBE+pRuwm4SuL0G4nl1VyD2L8NeybZrz0wMPRtZN/KkMnpNat4bi+iaQb+mjYMryXg
	 RMQKJBfPOePGoiiG79YfULiRMQKMyfnIC4pV/N7jZV8NwpqV9yDWLX8tJHHkPBF1Zn
	 dci2uheA9AdVg==
Received: by pali.im (Postfix)
	id 28EF782D; Tue, 26 Jul 2022 16:01:00 +0200 (CEST)
Date: Tue, 26 Jul 2022 16:01:00 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: Regression: Linux v5.15+ does not boot on Freescale P2020
Message-ID: <20220726140100.cfucgnhhh3yniqni@pali>
References: <6b227478-73b8-2a97-1c78-89570d928739@csgroup.eu>
 <20220723150702.jecerkhxhy65dgww@pali>
 <875yjld2oe.fsf@mpe.ellerman.id.au>
 <20220725125256.cg6su4d2ageylvp6@pali>
 <e2487668-b6d9-9ddb-1bb4-9f4d37fae1a7@csgroup.eu>
 <20220725201009.gwuchzswcqaxntrk@pali>
 <20220725215416.GV25951@gate.crashing.org>
 <20220726083406.tcjvny6d2di6q7ar@pali>
 <CAK8P3a2iM+RoySWEC2e0==rwBSVrZoRa8c4ADyFNB24JZM=hkw@mail.gmail.com>
 <20220726134405.GX25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726134405.GX25951@gate.crashing.org>
User-Agent: NeoMutt/20180716
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 26 July 2022 08:44:05 Segher Boessenkool wrote:
> On Tue, Jul 26, 2022 at 11:02:59AM +0200, Arnd Bergmann wrote:
> > On Tue, Jul 26, 2022 at 10:34 AM Pali Rohár <pali@kernel.org> wrote:
> > > On Monday 25 July 2022 16:54:16 Segher Boessenkool wrote:
> > > > The EH field in larx insns is new since ISA 2.05, and some ISA 1.x cpu
> > > > implementations actually raise an illegal insn exception on EH=1.  It
> > > > appears P2020 is one of those.
> > >
> > > P2020 has e500 cores. e500 cores uses ISA 2.03. So this may be reason.
> > > But in official Freescale/NXP documentation for e500 is documented that
> > > lwarx supports also eh=1. Maybe it is not really supported.
> > > https://www.nxp.com/files-static/32bit/doc/ref_manual/EREF_RM.pdf (page 562)
> 
> (page 6-186)
> 
> > > At least there is NOTE:
> > > Some older processors may treat EH=1 as an illegal instruction.
> 
> And the architecture says
>   Programming Note
>   Warning: On some processors that comply with versions of the
>   architecture that precede Version 2.00

But e500v2 is 2.03 and not older than 2.00...

>   executing a Load And Reserve
>   instruction in which EH = 1 will cause the illegal instruction error
>   handler to be invoked.
> 
> > In commit d6ccb1f55ddf ("powerpc/85xx: Make sure lwarx hint isn't set on ppc32")
> > this was clarified to affect (all?) e500v1/v2,
> 
>   e500v1/v2 based chips will treat any reserved field being set in an
>   opcode as illegal.
> 
> while the architecture says
> 
>   Reserved fields in instructions are ignored by the processor.
> 
> Whoops :-)  We need fixes for processor implementation bugs all the
> time of course, but this is a massive *design* bug.

I looked also in e500v2 and P2020 errata documents there is nothing
mentioned about eh flag. But it looks like a bug.

> I'm surprised this
> CPU still works as well as it does!
> 
> Even the venerable PEM (last updated in 1997) shows the EH field as
> reserved, always treated as 0.
> 
> > this one apparently
> > fixed it before,
> > but Christophe's commit effectively reverted that change.
> > 
> > I think only the simple_spinlock.h file actually uses EH=1
> 
> That's right afaics.
> 
> > and this is not
> > included in non-SMP kernels, so presumably the only affected machines were
> > the rare dual-core e500v2 ones (p2020, MPC8572, bsc9132), which would
> > explain why nobody noticed for the past 9 months.
> 
> Also people using an SMP kernel on older cores should see the problem,
> no?

Probably yes.

But most people on these machines are using stable LTS kernels and do
not upgrade too often.

So you need to wait longer time to see people starting reporting such
bugs. Need to wait at least when v4.14 and v4.19 LTS versions stops
receiving updates. v4.19 is used in Debian 10 (oldstable) and v5.4 is
used by current OpenWRT. Both distributions are still supported, so
users have not migrated to new v5.15 problematic kernel yet.

> Or is that patched out?  Or does this use case never happen :-)
> 
> 
> Segher
