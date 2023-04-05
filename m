Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BA96D7ABC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 13:10:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps23S5kgpz3f3n
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 21:10:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps22z3rVDz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 21:09:47 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 335B4Xi2027075;
	Wed, 5 Apr 2023 06:04:33 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 335B4V9L027074;
	Wed, 5 Apr 2023 06:04:31 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 5 Apr 2023 06:04:31 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Always build with 128-bit long double
Message-ID: <20230405110431.GG25951@gate.crashing.org>
References: <20230404102847.3303623-1-mpe@ellerman.id.au> <20230404151010.GC25951@gate.crashing.org> <87edoyki6y.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edoyki6y.fsf@mpe.ellerman.id.au>
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
Cc: dan@danny.cz, daniel@octaforge.org, amd-gfx@lists.freedesktop.org, tpearson@raptorengineering.com, alexdeucher@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Apr 05, 2023 at 03:32:21PM +1000, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > On Tue, Apr 04, 2023 at 08:28:47PM +1000, Michael Ellerman wrote:
> >> The amdgpu driver builds some of its code with hard-float enabled,
> >> whereas the rest of the kernel is built with soft-float.
> >> 
> >> When building with 64-bit long double, if soft-float and hard-float
> >> objects are linked together, the build fails due to incompatible ABI
> >> tags.
> >
> >> Currently those build errors are avoided because the amdgpu driver is
> >> gated on 128-bit long double being enabled. But that's not a detail the
> >> amdgpu driver should need to be aware of, and if another driver starts
> >> using hard-float the same problem would occur.
> >
> > Well.  The kernel driver either has no business using long double (or
> > any other floating point even) at all, or it should know exactly what is
> > used: double precision, double-double, or quadruple precision.  Both of
> > the latter two are 128 bits.
> 
> In a perfect world ... :)

Well, without it knowing what exactly it calculates, does this code have
any business running in kernel space?  Is it acceptable to just do
random things in the kernel?  I don't know the kernel code that uses
long double at all (and I'm afraid to look for fear of going blind), but
all this sounds like the 64-bit IEEE double precision floating point is
not good enough for some certain calculation, but 80-bit extended double
precision as used on x86 is.  That does make it likely that both of our
128-bit formats would work, but there are lots and lots of "buts".  To
start with, what does that code require wrt fp contraction (so, floating
multiply-add)?

All of this suggests that there should not be floating point code here
*at all*, it is harder to use it in any acceptable way than to just do
things in fixed point or scaled integer or whatever.

> >> All versions of the 64-bit ABI specify that long-double is 128-bits.
> >> However some compilers, notably the kernel.org ones, are built to use
> >> 64-bit long double by default.
> >
> > Mea culpa, I suppose?  But buildall doesn't force 64 bit explicitly.
> > I wonder how this happened?  Is it maybe a problem in the powerpc64le
> > config in GCC itself?
> 
> Not blaming anyone, just one of those things that happens.

Oh I didn't say anyone is blaming me.  I want to fix the problem, that
is all :-)

> The
> toolchains the distros (Ubuntu/Fedora) build all seem to use 128, but
> possibly that's because someone told them to configure them that way at
> some point.

No, or yes, depending on how you look at it?  Default configurations all
have 128-bit long double.  But buildall uses (almost) the same
configuration on all targets, namely:

        $GCC_SRC/configure \
        --target=$TARGET --enable-targets=all --prefix=$PREFIX \
        --enable-languages=c --without-headers --disable-bootstrap \
        --disable-nls --disable-threads --disable-shared \
        --disable-libmudflap --disable-libssp --disable-libgomp \
        --disable-decimal-float --disable-libquadmath \
        --disable-libatomic --disable-libcc1 --disable-libmpx

All of this is perfectly reasonable imnsho, but I guess the
--enable-targets=all causes the problem here?  That makes no sense, but
it is still my best guess.

> > I have a patch from summer last year (Arnd's
> > toolchains are built without it) that does
> > +       powerpc64le-*)  TARGET_GCC_CONF=--with-long-double-128
> > Unfortunately I don't remember why I did that, and I never investigated
> > what the deeper problem is :-/
> 
> Last summer (aka winter)

Oh right.  Last July :-)

> is when we first discovered this issue with the
> long double size being implicated.
> 
> See:
>   https://git.kernel.org/torvalds/c/c653c591789b3acfa4bf6ae45d5af4f330e50a91
> 
> So I guess that's what prompted your patch?

It was one day before my patch, maybe less than 12h even, so that could
be.  I don't update the kernel source automatically though (there are
50 to 100 build breaks every year, when things are in decent state I
tend to keep it for a while).  But it may have been our patches are due
to the same cause, and mine is no longer needed?  That would be nice.  I
never committed that patch (or there would be more context, sigh).

I'll dig, there is a real problem in the compiler it seems.  Thanks for
the help so far!


Segher
