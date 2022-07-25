Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233765805E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 22:47:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsBv959n7z3c2g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 06:47:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsBtm6kYKz3bZC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 06:47:26 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26PKgJnT031642;
	Mon, 25 Jul 2022 15:42:19 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26PKgHLw031641;
	Mon, 25 Jul 2022 15:42:17 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 25 Jul 2022 15:42:17 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc
Message-ID: <20220725204217.GU25951@gate.crashing.org>
References: <20220725123918.1903255-1-mpe@ellerman.id.au> <CAHk-=wihON4Ytte5zLHWNQtTapUvCpkToxY06OjX-_2B+Gq6Gg@mail.gmail.com> <1446417444.13111032.1658777648586.JavaMail.zimbra@raptorengineeringinc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446417444.13111032.1658777648586.JavaMail.zimbra@raptorengineeringinc.com>
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
Cc: Dan =?iso-8859-1?Q?Hor=E1k?= <dan@danny.cz>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, amd-gfx <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexdeucher@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 25, 2022 at 02:34:08PM -0500, Timothy Pearson wrote:
> >> Further digging shows that the build failures only occur with compilers
> >> that default to 64-bit long double.
> > 
> > Where the heck do we have 'long double' things anywhere in the kernel?
> > 
> > I tried to grep for it, and failed miserably. I found some constants
> > that would qualify, but they were in the v4l colorspaces-details.rst
> > doc file.
> > 
> > Strange.
> 
> We don't, at least not that I can see.  The affected code uses standard doubles.
> 
> What I'm wondering is if the compiler is getting confused between standard and long doubles when they are both the same bit length...

The compiler emits the same code (DFmode things, double precision float)
in both cases, and it itself does not see any difference anymore fairly
early in the pipeline.  Compare to int and long on most 32-bit targets,
both are SImode, the compiler will not see different types anymore:
there *are* no types, except in the compiler frontend.

It only happens for powerpc64le things, and not for powerpc64 builds.

It is probably a GCC problem.  I don't see what forces the GCC build
here to use 64-bit long double either btw?  Compilers build via buildall
have all kinds of unnecessary things disabled, but not that, not
directly at least.


Segher
