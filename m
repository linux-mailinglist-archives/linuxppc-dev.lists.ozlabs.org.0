Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 347734F88AA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 22:35:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZCnW2Fxkz3blK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 06:35:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KZCn34QQQz2xrS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 06:35:18 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 237KXCj2014770;
 Thu, 7 Apr 2022 15:33:12 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 237KX9BV014769;
 Thu, 7 Apr 2022 15:33:09 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 7 Apr 2022 15:33:09 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Murilo Opsfelder =?iso-8859-1?Q?Ara=FAjo?= <muriloo@linux.ibm.com>
Subject: Re: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
Message-ID: <20220407203309.GQ614@gate.crashing.org>
References: <20220330112437.540214-1-joel@jms.id.au>
 <815770fb-3247-baab-f8ca-eed7b99213d1@gmail.com>
 <CACPK8XdremqtJBKycbFZauky9C9yCb2S7+aZDxRtZ8fU41L=Ew@mail.gmail.com>
 <167db0bd-4f10-7751-36a2-fb9ec5b136a7@gmail.com>
 <20220331234433.GB614@gate.crashing.org>
 <CACPK8XcWuFuR0zTj=tqUNZ9aQNVWEeyoDeDUOmUE3_RS_4Whxg@mail.gmail.com>
 <75f14a30-f1ad-7cdf-a8af-d1fad8647ca2@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75f14a30-f1ad-7cdf-a8af-d1fad8647ca2@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 07, 2022 at 03:43:20PM -0300, Murilo Opsfelder Araújo wrote:
> On 4/6/22 04:08, Joel Stanley wrote:
> >On Thu, 31 Mar 2022 at 23:46, Segher Boessenkool
> ><segher@kernel.crashing.org> wrote:
> >>On Thu, Mar 31, 2022 at 12:19:52PM -0300, Murilo Opsfelder Araújo wrote:
> >>>My understanding is that the default cpu type for -mcpu=powerpc64 can
> >>>change.
> >>
> >>Different subtargets (Linux, AIX, Darwin, the various BSDs, bare ELF,
> >>etc.) have different default CPUs.  It also can be set at configure time
> >>for most subtargets.
> >>
> >>Linux can be built with compilers not targetting *-linux*, so it would
> >>be best to specify a specific CPU always.
> >>
> >>>>I did a little test using my buildroot compiler which has
> >>>>with-cpu=power10. I used the presence of PCREL relocations as evidence
> >>>>that it was build for power10.
> >>>>
> >>>>$ powerpc64le-buildroot-linux-gnu-gcc -mcpu=power10 -c test.c
> >>>>$ readelf -r test.o |grep -c PCREL
> >>>>24
> >>>
> >>>It respected the -mcpu=power10 you provided.
> >>
> >>Of course.
> >>
> >>>And that's my concern.  We're relying on the compiler default cpu type.
> >>
> >>That is not the compiler default.  It is the default from who built the
> >>compiler.  It can vary wildly and unpredictably.
> >>
> >>The actual compiler default will not change so easily at all, basically
> >>only when its subtarget drops support for an older CPU.
> >>
> >>>If gcc defaults -mcpu=powerpc64le to power10, you're going to have
> >>>the same problem again.
> >>
> >>That will not happen before power10 is the minimum supported CPU.
> >>Anything else is madness.
> >
> >Murilo, does Segher's explanation address your concerns?
> 
> The comment:
> 
> "Different subtargets (Linux, AIX, Darwin, the various BSDs, bare ELF,
> etc.) have different default CPUs.  It also can be set at configure time
> for most subtargets.
> 
> Linux can be built with compilers not targetting *-linux*, so it would
> be best to specify a specific CPU always."
> 
> made me think that it's better to specify -mcpu=power8 instead of 
> -mcpu=powerpc64le
> because of such compilers not targetting *-linux*.
> 
> Did I understand Segher's comment correctly?  To be honest, I don't know
> how much concerned we should be about this scenario.

That is the long and short of it, yes.  This matters for reproducible
builds if you care for more exotic compilers (which are very common for
32 bit, but not so much for 64 bit).

> Just for the sake of consistency, if we decide to go with -mcpu=powerpc64le,
> then I think we should also change arch/powerpc/Makefile CFLAGS.
> Otherwise, we could follow what we already have in the tree and use
> -mcpu=power8 in BOOTCLAGS, too.
> 
> Practically speaking, either way works for us.  In any case:

+1

> Reviewed-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
