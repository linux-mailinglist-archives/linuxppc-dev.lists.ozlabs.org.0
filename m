Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4F581467
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 15:45:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsdTn1cvwz3cjJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 23:45:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsdTJ4ZtNz3bZY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 23:45:23 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26QDi6KA001944;
	Tue, 26 Jul 2022 08:44:06 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26QDi53k001943;
	Tue, 26 Jul 2022 08:44:05 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 26 Jul 2022 08:44:05 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Regression: Linux v5.15+ does not boot on Freescale P2020
Message-ID: <20220726134405.GX25951@gate.crashing.org>
References: <20220722090929.mwhmxxdd7yioxqpz@pali> <6b227478-73b8-2a97-1c78-89570d928739@csgroup.eu> <20220723150702.jecerkhxhy65dgww@pali> <875yjld2oe.fsf@mpe.ellerman.id.au> <20220725125256.cg6su4d2ageylvp6@pali> <e2487668-b6d9-9ddb-1bb4-9f4d37fae1a7@csgroup.eu> <20220725201009.gwuchzswcqaxntrk@pali> <20220725215416.GV25951@gate.crashing.org> <20220726083406.tcjvny6d2di6q7ar@pali> <CAK8P3a2iM+RoySWEC2e0==rwBSVrZoRa8c4ADyFNB24JZM=hkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a2iM+RoySWEC2e0==rwBSVrZoRa8c4ADyFNB24JZM=hkw@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 26, 2022 at 11:02:59AM +0200, Arnd Bergmann wrote:
> On Tue, Jul 26, 2022 at 10:34 AM Pali Rohár <pali@kernel.org> wrote:
> > On Monday 25 July 2022 16:54:16 Segher Boessenkool wrote:
> > > The EH field in larx insns is new since ISA 2.05, and some ISA 1.x cpu
> > > implementations actually raise an illegal insn exception on EH=1.  It
> > > appears P2020 is one of those.
> >
> > P2020 has e500 cores. e500 cores uses ISA 2.03. So this may be reason.
> > But in official Freescale/NXP documentation for e500 is documented that
> > lwarx supports also eh=1. Maybe it is not really supported.
> > https://www.nxp.com/files-static/32bit/doc/ref_manual/EREF_RM.pdf (page 562)

(page 6-186)

> > At least there is NOTE:
> > Some older processors may treat EH=1 as an illegal instruction.

And the architecture says
  Programming Note
  Warning: On some processors that comply with versions of the
  architecture that precede Version 2.00, executing a Load And Reserve
  instruction in which EH = 1 will cause the illegal instruction error
  handler to be invoked.

> In commit d6ccb1f55ddf ("powerpc/85xx: Make sure lwarx hint isn't set on ppc32")
> this was clarified to affect (all?) e500v1/v2,

  e500v1/v2 based chips will treat any reserved field being set in an
  opcode as illegal.

while the architecture says

  Reserved fields in instructions are ignored by the processor.

Whoops :-)  We need fixes for processor implementation bugs all the
time of course, but this is a massive *design* bug.  I'm surprised this
CPU still works as well as it does!

Even the venerable PEM (last updated in 1997) shows the EH field as
reserved, always treated as 0.

> this one apparently
> fixed it before,
> but Christophe's commit effectively reverted that change.
> 
> I think only the simple_spinlock.h file actually uses EH=1

That's right afaics.

> and this is not
> included in non-SMP kernels, so presumably the only affected machines were
> the rare dual-core e500v2 ones (p2020, MPC8572, bsc9132), which would
> explain why nobody noticed for the past 9 months.

Also people using an SMP kernel on older cores should see the problem,
no?  Or is that patched out?  Or does this use case never happen :-)


Segher
