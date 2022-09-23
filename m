Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FEA5E7AA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 14:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYrv11lDFz3dqP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 22:24:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYrtc6Gx0z2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 22:24:24 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28NCMM4p016809;
	Fri, 23 Sep 2022 07:22:22 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 28NCMMFW016808;
	Fri, 23 Sep 2022 07:22:22 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 23 Sep 2022 07:22:21 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s: Fix GENERIC_CPU build flags for PPC970 / G5
Message-ID: <20220923122221.GM25951@gate.crashing.org>
References: <20220921014103.587954-1-npiggin@gmail.com> <20220921185031.GE25951@gate.crashing.org> <CN3LIJ54GWR1.LTJXTAPJG39S@bobo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CN3LIJ54GWR1.LTJXTAPJG39S@bobo>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 23, 2022 at 05:17:45PM +1000, Nicholas Piggin wrote:
> On Thu Sep 22, 2022 at 4:50 AM AEST, Segher Boessenkool wrote:
> > On Wed, Sep 21, 2022 at 11:41:02AM +1000, Nicholas Piggin wrote:
> > > Big-endian GENERIC_CPU supports 970, but builds with -mcpu=power5.
> > > POWER5 is ISA v2.02 whereas 970 is v2.01 plus Altivec. 2.02 added
> > > the popcntb instruction which a compiler might use.
> > > 
> > > Use -mcpu=power4.
> > > 
> > > Fixes: 471d7ff8b51b ("powerpc/64s: Remove POWER4 support")
> > > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >
> > Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> >
> > Thank you!
> >
> > Maybe superfluous, but some more context: GCC's -mcpu=power4 means
> > POWER4+, ISA 2.01, according to our documentation.  There is no
> > difference with ISA 2.00 (what plain POWER4 implements) for anything
> > GCC does.
> 
> Huh, okay. Well I guess we are past that point now, interesting that
> another ISA version was done for 4+ though, and then another for 5.
> I don't see a list of changes from 2.00 in the public version, I
> wonder what else changed other than mtmsrd.

I think searching for "POWER4+" will give you everything.  I cannot find
a public 2.00 either, yeah.  I listed everything I think changed
elsewhere in the thread.


Segher
