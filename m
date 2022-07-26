Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A15808C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 02:36:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsHzP4NXwz3cjR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 10:36:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsHyy0btZz30BP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 10:36:24 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26Q0VHtb006919;
	Mon, 25 Jul 2022 19:31:17 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26Q0VFhh006916;
	Mon, 25 Jul 2022 19:31:15 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 25 Jul 2022 19:31:15 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc
Message-ID: <20220726003115.GW25951@gate.crashing.org>
References: <20220725123918.1903255-1-mpe@ellerman.id.au> <CAHk-=wihON4Ytte5zLHWNQtTapUvCpkToxY06OjX-_2B+Gq6Gg@mail.gmail.com> <1446417444.13111032.1658777648586.JavaMail.zimbra@raptorengineeringinc.com> <20220725204217.GU25951@gate.crashing.org> <5ef016a9-c1bb-91dd-454d-504d26074477@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ef016a9-c1bb-91dd-454d-504d26074477@roeck-us.net>
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
Cc: Dan =?iso-8859-1?Q?Hor=E1k?= <dan@danny.cz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, amd-gfx <amd-gfx@lists.freedesktop.org>, Timothy Pearson <tpearson@raptorengineering.com>, Alex Deucher <alexdeucher@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, Jul 25, 2022 at 03:40:40PM -0700, Guenter Roeck wrote:
> On 7/25/22 13:42, Segher Boessenkool wrote:
> >>What I'm wondering is if the compiler is getting confused between 
> >>standard and long doubles when they are both the same bit length...
> >
> >The compiler emits the same code (DFmode things, double precision float)
> >in both cases, and it itself does not see any difference anymore fairly
> >early in the pipeline.  Compare to int and long on most 32-bit targets,
> >both are SImode, the compiler will not see different types anymore:
> >there *are* no types, except in the compiler frontend.
> >
> >It only happens for powerpc64le things, and not for powerpc64 builds.
> >
> >It is probably a GCC problem.  I don't see what forces the GCC build
> >here to use 64-bit long double either btw?  Compilers build via buildall
> >have all kinds of unnecessary things disabled, but not that, not
> >directly at least.
> 
> From what little documentation I can find, there appears to be
> "--with-long-double-128" and "--with-long-double-format=ieee".
> That looks like something that would need to be enabled, not disabled.

Look in the GCC toplevel configure.ac for (some of!) the actual rules
(and some more in config.gcc, and there are more at different levels).

If your target is not *-linux* you likely end up with a 64-bit long
double by default, and if it is, you do.  But it depends on various
things configure can determine about your C library.  buildall uses
--without-headers, but something makes GCC still use 128-bit long
double on powerpc64-linux, but it uses 64-bit on powerpc64le-linux.
Curious.  I suppose things work better on Linux userland when you do
not use the spartan build flags buildall uses :-)

If you set it explicitly (--with-long-double-128) it just works.

> FWIW, depending on compiler build options such as the above for kernel
> builds seems to be a little odd to me,

Yes.  It should be (and was!) possible to build the kernel with pretty
much any compiler.  Usual were *-linux* compilers of course, but *-elf
also works, and for powerpc in particular any kind of biarch or not
"just works".

> and I am not sure I'd want to
> blame gcc if the kernel wants to be built with 128-bit floating point
> as default. At the very least, that should be documented somewhere,
> and if possible the kernel should refuse to build if the compiler build
> options don't meet the requirements.

It always was the rule that the kernel did not use floating point at
all.  If that is changed it can no longer be built on targets that use
soft float for example (they need libgcc, which the kernel build is
allergic to for some reason).  It is non-trivial to handle floating
point in the kernel itself as well of course (mostly arch stuff).

The problem here was that some objects are built with soft float and
some with hard float, incompatible ABIs that ld does not want to link
together (without further coercing).


Segher
