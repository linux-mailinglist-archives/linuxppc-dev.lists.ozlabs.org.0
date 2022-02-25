Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C06B4C518E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 23:32:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K54Jy10GBz3cSd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Feb 2022 09:32:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K54JT3n9bz2ymc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Feb 2022 09:31:51 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 21PMSgTF022182;
 Fri, 25 Feb 2022 16:28:42 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 21PMSfPH022181;
 Fri, 25 Feb 2022 16:28:41 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 25 Feb 2022 16:28:41 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
Message-ID: <20220225222841.GS614@gate.crashing.org>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
 <CAK8P3a28XEN7aH-WdR=doBQKGskiTAeNsjbfvaD5YqEZNM=v0g@mail.gmail.com>
 <1645694174.z03tip9set.astroid@bobo.none>
 <CAK8P3a1LgZkAV2wX03hAgx527MuiFt5ABWFp1bGdsTGc=8OmMg@mail.gmail.com>
 <1645700767.qxyu8a9wl9.astroid@bobo.none>
 <20220224172948.GN614@gate.crashing.org>
 <1645748553.sa2ewgy7dr.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645748553.sa2ewgy7dr.astroid@bobo.none>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "# 3.4.x" <stable@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 25, 2022 at 10:23:07AM +1000, Nicholas Piggin wrote:
> Excerpts from Segher Boessenkool's message of February 25, 2022 3:29 am:
> > On Thu, Feb 24, 2022 at 09:13:25PM +1000, Nicholas Piggin wrote:
> >> Excerpts from Arnd Bergmann's message of February 24, 2022 8:20 pm:
> >> > Again, there should be a minimum number of those .machine directives
> >> > in inline asm as well, which tends to work out fine as long as the
> >> > entire kernel is built with the correct -march= option for the minimum
> >> > supported CPU, and stays away from inline asm that requires a higher
> >> > CPU level.
> >> 
> >> There's really no advantage to them, and they're ugly and annoying
> >> and if we applied the concept consistently for all asm they would grow 
> >> to a very large number.
> > 
> > The advantage is that you get machine code that *works*.  There are
> > quite a few mnemonics that translate to different instructions with
> > different machine options!  We like to get the intended instructions
> > instead of something that depends on what assembler options the user
> > has passed behind our backs.
> > 
> >> The idea they'll give you good static checking just doesn't really
> >> pan out.
> > 
> > That never was a goal of this at all.
> > 
> > -many was very problematical for GCC itself.  We no longer use it.
> 
> You have the wrong context. We're not talking about -many vs .machine
> here.

Okay, so you have no idea what you are talking about?  Wow.

The reason GCC uses .machine *itself* is because assembler -mmachine
options *cannot work*, for many reasons.  We hit problems often enough
that years ago we started moving away from it already.  The biggest
problems are that on one hand there are mnemonics that encode to
different instructions depending on target arch or cpu selected (like
mftb, lxvx, wait, etc.), and on the other hand GCC needs to switch that
target halfway through compilation (attribute((target(...)))).

Often these problems were hidden most of the time by us passing -many.
But not all of the time, and over time, problems became more frequent
and nasty.

Passing assembler -m options is nasty when you have to mix it with
.machine statements (and we need the latter no matter what), and it
becomes completely unpredictable if the user passes other -m options
manually.

Inline assembler is inserted textually in the generated assembler code.
This is a big part of the strength of inline assembler.  It does mean
that if you need a different target selected for your assembler code
then you need to arrange for that in your assembler code.

So yes, this very much is about -many, other -m options, and .machine .
I discourage the kernel (as well as any other project) from using -m
options, especially -many, but that is your own choice of course.  I
get sick and tired from you calling a deliberate design decision we
arrived at after years of work and weighing alternatives a "bug" though.


Segher
