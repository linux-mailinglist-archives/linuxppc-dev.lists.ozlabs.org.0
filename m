Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 106EF1DF85C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 19:02:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TqRQ33vDzDqgf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 03:02:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ravnborg.org
 (client-ip=109.247.116.14; helo=asavdk3.altibox.net;
 envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ravnborg.org
X-Greylist: delayed 418 seconds by postgrey-1.36 at bilbo;
 Sun, 24 May 2020 03:01:04 AEST
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TqPX1plfzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 03:01:04 +1000 (AEST)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 09C5B2001E;
 Sat, 23 May 2020 18:53:56 +0200 (CEST)
Date: Sat, 23 May 2020 18:53:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
Message-ID: <20200523165355.GA5570@ravnborg.org>
References: <20200521202716.193316-1-samitolvanen@google.com>
 <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
 <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
 <1590226253.lnkg0jun9x.astroid@bobo.none>
 <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8
 a=KYv34p_JZkM_z_Kwq-QA:9 a=Fnwy0QA8ZUuOD27D:21 a=D97444Hf2OcUiBNx:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Masahiro.

On Sun, May 24, 2020 at 12:12:35AM +0900, Masahiro Yamada wrote:
> Hi Nicholas,
> (+CC: Sam Ravnborg)
> 
> 
> On Sat, May 23, 2020 at 7:06 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > Excerpts from Masahiro Yamada's message of May 23, 2020 3:44 am:
> > > + Michael, and PPC ML.
> > >
> > > They may know something about the reason of failure.
> >
> > Because the linker can't put branch stubs within object code sections,
> > so when you incrementally link them too large, the linker can't resolve
> > branches into other object files.
> 
> 
> Ah, you are right.
> 
> So, this is a problem not only for PPC
> but also for ARM (both 32 and 64 bit), etc.
> 
> ARM needs to insert a veneer to jump far.
> 
> Prior to thin archive, we could not compile
> ARCH=arm allyesconfig because
> drivers/built-in.o was too large.
> 
> This patch gets us back to the too large
> incremental object situation.
> 
> With my quick compile-testing,
> ARCH=arm allyesconfig
> and ARCH=arm64 allyesconfig are broken.
> 
> 
> > This is why we added incremental linking in the first place. I suppose
> > it could be made conditional for platforms that can use this
> > optimization.
> >
> > What'd be really nice is if we could somehow build and link kallsyms
> > without relinking everything twice, and if we could do section mismatch
> > analysis without making that vmlinux.o as well. I had a few ideas but
> > not enough time to do much work on it.
> 
> 
> Right, kallsyms links 3 times. (not twice)
> 
> 
> Hmm, I think Sami's main motivation is Clang LTO.
> 
> LTO is very time-consuming.
> So, the android common kernel implements Clang LTO
> in the pre modpost stage:
> 
> 
> 1) LTO against vmlinux.o
> 
> 2) modpost against vmlinux.o
> 
> 3) Link vmlinux.o + kallsyms into vmlinux
>    (this requires linking 3 times)

We have kallsyms we had to link three times because the linking
increased the object a little in size so symbols did not match.
The last time was added more or less only to check that we did
have stable symbol addresses.

All this predates LTO stuff which we only introduced later.

The reason for doing modpost on vmlinux.o was that we had cases
where everything in drivers/ was fine but there was section mismatch
references from arch/* to drivers/*
This is back when there were much more drivers in arch/ than what we
have today.
And back then we also had much more to check ad we had cPU hotplug
that could really cause section mismatches - this is no longer the case
which is a good thing.



...
> 
> The following two commits.
> I did not fully understand the background, though.
> 
> I CC'ed Sam in case he may add some comments.
> 
> commit 85bd2fddd68e757da8e1af98f857f61a3c9ce647
> Author: Sam Ravnborg <sam@ravnborg.org>
> Date:   Mon Feb 26 15:33:52 2007 +0100
> 
>     kbuild: fix section mismatch check for vmlinux
> 
>     vmlinux does not contain relocation entries which is
>     used by the section mismatch checks.
>     Reported by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> 
>     Use the individual objects as inputs to overcome
>     this limitation.
>     In modpost check the .o files and skip non-ELF files.
> 
>     Signed-off-by: Sam Ravnborg <sam@ravnborg.org>


So we checked vmlinx - but vmlinx did have too much stripped away.
so in reality nothing was checked.
To allow the warnings to be as precise as possible move the checks
out to the indovidual .o files.
Sometimes the names was mangled a little so if warnigns was only
reported on vmlinx level in could be difficult to track down the
offender.
This would then also do the check on .o files that had all the
relocation symbols rtequired.

> 
> commit 741f98fe298a73c9d47ed53703c1279a29718581
> Author: Sam Ravnborg <sam@ravnborg.org>
> Date:   Tue Jul 17 10:54:06 2007 +0200
> 
>     kbuild: do section mismatch check on full vmlinux
> 
>     Previously we did do the check on the .o files used to link
>     vmlinux but that failed to find questionable references across
>     the .o files.
>     Create a dedicated vmlinux.o file used only for section mismatch checks
>     that uses the defualt linker script so section does not get renamed.
> 
>     The vmlinux.o may later be used as part of the the final link of vmlinux
>     but for now it is used fo section mismatch only.
>     For a defconfig build this is instant but for an allyesconfig this
>     add two minutes to a full build (that anyways takes ~2 hours).
> 
>     Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

But when we introduced check of the individual .o fiules we missed when
the references spanned outside the .o files as explained previously.
So included a link of vmlinx.o that did NOT drop the relocations
so we could use it to check for the remaining section mismatch warnings.

Remember - back when we started this we had many hundred warnings
and it was a fight to keep that number low.
But we also wanted to report as much as possible.

There was back then several discussions if this was really worth the
effort. How much was gained from discarding the memory where the
section mismatch warnigns was triggered.
In other words - how about just keeping the init code in memory so there
were no illegal references anymore.
That is something that is maybe worth to consiuder again as we have even
less memory we save by throwing away the init code.
But I think this is a topic for another mail thread.

	Sam
