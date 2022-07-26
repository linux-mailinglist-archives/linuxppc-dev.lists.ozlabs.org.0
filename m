Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BA5814EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 16:16:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lsf9H49Mzz3c5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 00:16:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lsf8k4h6kz30D8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 00:16:06 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26QEEwrC003781;
	Tue, 26 Jul 2022 09:14:59 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26QEEwrK003780;
	Tue, 26 Jul 2022 09:14:58 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 26 Jul 2022 09:14:58 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: Regression: Linux v5.15+ does not boot on Freescale P2020
Message-ID: <20220726141458.GY25951@gate.crashing.org>
References: <20220723150702.jecerkhxhy65dgww@pali> <875yjld2oe.fsf@mpe.ellerman.id.au> <20220725125256.cg6su4d2ageylvp6@pali> <e2487668-b6d9-9ddb-1bb4-9f4d37fae1a7@csgroup.eu> <20220725201009.gwuchzswcqaxntrk@pali> <20220725215416.GV25951@gate.crashing.org> <20220726083406.tcjvny6d2di6q7ar@pali> <CAK8P3a2iM+RoySWEC2e0==rwBSVrZoRa8c4ADyFNB24JZM=hkw@mail.gmail.com> <20220726134405.GX25951@gate.crashing.org> <20220726140100.cfucgnhhh3yniqni@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726140100.cfucgnhhh3yniqni@pali>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 26, 2022 at 04:01:00PM +0200, Pali Rohár wrote:
> On Tuesday 26 July 2022 08:44:05 Segher Boessenkool wrote:
> > And the architecture says
> >   Programming Note
> >   Warning: On some processors that comply with versions of the
> >   architecture that precede Version 2.00
> 
> But e500v2 is 2.03 and not older than 2.00...

Yes.  And it does not implement reserved fields in instructions (*any*
reserved fields in instructions, apparently!) correctly at all.

> >   e500v1/v2 based chips will treat any reserved field being set in an
> >   opcode as illegal.
> > 
> > while the architecture says
> > 
> >   Reserved fields in instructions are ignored by the processor.
> > 
> > Whoops :-)  We need fixes for processor implementation bugs all the
> > time of course, but this is a massive *design* bug.
> 
> I looked also in e500v2 and P2020 errata documents there is nothing
> mentioned about eh flag. But it looks like a bug.

The bug is if it does this for any reserved field (and it apparently
does it for all even).

> > Also people using an SMP kernel on older cores should see the problem,
> > no?
> 
> Probably yes.
> 
> But most people on these machines are using stable LTS kernels and do
> not upgrade too often.

Yeah.

> So you need to wait longer time to see people starting reporting such
> bugs. Need to wait at least when v4.14 and v4.19 LTS versions stops
> receiving updates. v4.19 is used in Debian 10 (oldstable) and v5.4 is
> used by current OpenWRT. Both distributions are still supported, so
> users have not migrated to new v5.15 problematic kernel yet.

That's not a reasonable timeline for kernel development of course.

We see the same thing with the compiler...  Although GCC has a much
slower release cadence (one new major version every year), it often
takes two or three or more years before we get bug reports that
something was broken.  If stuff isn't tested, we cannot really support
it at all.


Segher
