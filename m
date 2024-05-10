Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 448778C1F81
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 10:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbM4d6BZBz3cgM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 18:10:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbM495ybVz3c4v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 18:09:45 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 44A87c2O030764;
	Fri, 10 May 2024 03:07:38 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 44A87bmJ030763;
	Fri, 10 May 2024 03:07:37 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 10 May 2024 03:07:37 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/3] powerpc: Check only single values are passed to CPU/MMU feature checks
Message-ID: <20240510080737.GY19790@gate.crashing.org>
References: <20240509121248.270878-1-mpe@ellerman.id.au> <20240509121248.270878-3-mpe@ellerman.id.au> <20240509163456.GX19790@gate.crashing.org> <87ikzmmage.fsf@mail.lhotse>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikzmmage.fsf@mail.lhotse>
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

On Fri, May 10, 2024 at 04:45:37PM +1000, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > On Thu, May 09, 2024 at 10:12:48PM +1000, Michael Ellerman wrote:
> >> cpu_has_feature()/mmu_has_feature() are only able to check a single
> >> feature at a time, but there is no enforcement of that.
> >> 
> >> In fact, as fixed in the previous commit, there was code that was
> >> passing multiple values to cpu_has_feature().
> >> 
> >> So add a check that only a single feature is passed using popcount.
> >> 
> >> Note that the test allows 0 or 1 bits to be set, because some code
> >> relies on cpu_has_feature(0) being false, the check with
> >> CPU_FTRS_POSSIBLE ensures that. See for example CPU_FTR_PPC_LE.
> >
> > This btw is exactly
> >
> > 	BUILD_BUG_ON(feature & (feature - 1));
> >
> > but the popcount is more readable :-)
> 
> Yeah for those of us who don't see bits cascading in our sleep I think
> the popcount is easier to understand ;)

Absolutely :-)  This is just one of the most well-known bittricks, for
seeing if x is a power of two you write

  x && x & (x-1)

but here you do not need to test for x not being zero.  Hardly ever get
to use that simpler thing, so it jumped out at me here :-)

[ For understanding the x & (x-1) thing, it is perhaps easiest if you
first consider an x with more than one bit set: x-1 will have the same
topmost set bit. ]


Segher
