Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67EC6752DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 11:59:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyxNC1CDfz3fJf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 21:59:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyxMf4ljJz3c69
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 21:59:25 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 30KArkBe026992;
	Fri, 20 Jan 2023 04:53:46 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 30KArgxi026991;
	Fri, 20 Jan 2023 04:53:42 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 20 Jan 2023 04:53:41 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Rob Landley <rob@landley.net>
Subject: Re: Calculating array sizes in C - was: Re: Build regressions/improvements in v6.2-rc1
Message-ID: <20230120105341.GI25951@gate.crashing.org>
References: <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg> <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de> <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com> <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de> <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com> <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de> <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com> <0d238f02-4d78-6f14-1b1b-f53f0317a910@physik.fu-berlin.de> <1732342f-49fe-c20e-b877-bc0a340e1a50@fu-berlin.de> <0f51dac4-836b-0ff2-38c6-5521745c1c88@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f51dac4-836b-0ff2-38c6-5521745c1c88@landley.net>
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
Cc: linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, "Michael.Karcher" <Michael.Karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, kasan-dev@googlegroups.com, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 19, 2023 at 09:31:21PM -0600, Rob Landley wrote:
> On 1/19/23 16:11, Michael.Karcher wrote:
> > I don't see a clear bug at this point. We are talking about the C expression
> > 
> >    __same_type((void*)0, (void*)0)? 0 : sizeof((void*)0)/sizeof(*((void*0))

(__same_type is a kernel macro, it expands to something with
__builtin_compatible_type()).

> *(void*) is type "void" which does not have a size.

It has size 1, in GCC, so that you can do arithmetic on pointers to
void.  This is a long-standing and very widely used GCC extension.

"""
6.24 Arithmetic on 'void'- and Function-Pointers
================================================

In GNU C, addition and subtraction operations are supported on pointers
to 'void' and on pointers to functions.  This is done by treating the
size of a 'void' or of a function as 1.

 A consequence of this is that 'sizeof' is also allowed on 'void' and on
function types, and returns 1.

 The option '-Wpointer-arith' requests a warning if these extensions are
used.
"""

> The problem is gcc "optimizing out" an earlier type check, the same way it
> "optimizes out" checks for signed integer math overflowing, or "optimizes out" a
> comparison to pointers from two different local variables from different
> function calls trying to calculate the amount of stack used, or "optimizes out"

Are you saying something in the kernel code here is invalid code?
Because your other examples are.

> using char *x = (char *)1; as a flag value and then doing "if (!(x-1)) because
> it can "never happen"...

Like here.  And no, this is not allowed by -fno-strict-aliasing.

> > I suggest to file a bug against gcc complaining about a "spurious 
> > warning", and using "-Werror -Wno-error-sizeof-pointer-div" until gcc is 
> > adapted to not emit the warning about the pointer division if the result 
> > is not used.

Yeah.  If the first operand of a conditional operator is non-zero, the
second operand is not evaluated, and if the first is zero, the third
operand is not evaluated.  It is better if we do not warn about
something we do not evaluate.  In cases like here where it is clear at
compile time which branch is taken, that shouldn't be too hard.

Can someone please file a GCC PR?  With reduced testcase preferably.


Segher
