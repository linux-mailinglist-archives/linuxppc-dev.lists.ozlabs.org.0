Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C96951DF7F8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 17:15:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Tn3t1StHzDqjl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 01:15:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.83;
 helo=conssluserg-04.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=XEiMNJ6D; 
 dkim-atps=neutral
X-Greylist: delayed 77281 seconds by postgrey-1.36 at bilbo;
 Sun, 24 May 2020 01:13:47 AEST
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Tn1m070mzDqWM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 01:13:46 +1000 (AEST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 04NFDCrR003780
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 00:13:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 04NFDCrR003780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1590246793;
 bh=xJmXTYj50sybR72Tmu0sL1rVl2NmiVU6DlqCC3wSc0I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XEiMNJ6DOrq1OLjWkeqGTh/y6ilQV+akPqWRATkxQSSUDvzYdDEMSPFdDdRR6UJa2
 Ch6rFVy8yw36X7KHFHo+H0nIpLYeqNWa8vwYYwxbpuxFcfKJtdQsKZqrOKTeap5WM7
 9uZaB294gE82R1aG7uYZSIBmHLDf+BL3bc5w6oWSPVr3iUKQqt9hslqQy4xCP9V/jI
 brrwhOoBWD5MRAZKqajhiyY/kV++BZRMsAOn9j3aARmAPVf/f5QmO2hDavXkfQqX6Z
 oqQbRYsSBsDHbBxPF9o8sD9bRoqko/kZlTW/bLPsaOFs6DAgGgo4REDCaz2vy6CRca
 sqeR90S4Ar5pA==
X-Nifty-SrcIP: [209.85.221.175]
Received: by mail-vk1-f175.google.com with SMTP id h74so1888347vka.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 08:13:12 -0700 (PDT)
X-Gm-Message-State: AOAM533r2/t6OwhJRCSzTlk5tQhmVSfD651+w30B5XqdZLRz9fhZyW7o
 R81cnHwtdOc73id82B06z3iZbkhvOyQcvlvuih0=
X-Google-Smtp-Source: ABdhPJxXuyApTJV+/vLVj3aF7laPSePeL/0+ORcYCVzUfZ7CG5bybj9ZaWHd9RNE3Ro9OuD/azIjmmmnjg/T/HhRNKo=
X-Received: by 2002:a1f:1652:: with SMTP id 79mr1180703vkw.26.1590246791400;
 Sat, 23 May 2020 08:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com>
 <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
 <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
 <1590226253.lnkg0jun9x.astroid@bobo.none>
In-Reply-To: <1590226253.lnkg0jun9x.astroid@bobo.none>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 24 May 2020 00:12:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
Message-ID: <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nicholas,
(+CC: Sam Ravnborg)


On Sat, May 23, 2020 at 7:06 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Excerpts from Masahiro Yamada's message of May 23, 2020 3:44 am:
> > + Michael, and PPC ML.
> >
> > They may know something about the reason of failure.
>
> Because the linker can't put branch stubs within object code sections,
> so when you incrementally link them too large, the linker can't resolve
> branches into other object files.


Ah, you are right.

So, this is a problem not only for PPC
but also for ARM (both 32 and 64 bit), etc.

ARM needs to insert a veneer to jump far.

Prior to thin archive, we could not compile
ARCH=arm allyesconfig because
drivers/built-in.o was too large.

This patch gets us back to the too large
incremental object situation.

With my quick compile-testing,
ARCH=arm allyesconfig
and ARCH=arm64 allyesconfig are broken.


> This is why we added incremental linking in the first place. I suppose
> it could be made conditional for platforms that can use this
> optimization.
>
> What'd be really nice is if we could somehow build and link kallsyms
> without relinking everything twice, and if we could do section mismatch
> analysis without making that vmlinux.o as well. I had a few ideas but
> not enough time to do much work on it.


Right, kallsyms links 3 times. (not twice)


Hmm, I think Sami's main motivation is Clang LTO.

LTO is very time-consuming.
So, the android common kernel implements Clang LTO
in the pre modpost stage:


1) LTO against vmlinux.o

2) modpost against vmlinux.o

3) Link vmlinux.o + kallsyms into vmlinux
   (this requires linking 3 times)



If we move LTO to 3), we need to do LTO 3 times.

And, this was how GCC LTO was implemented in 2014,
(then rejected by Linus).


How to do modpost without making vmlinux.o ?

In old days, the section mismatch analysis was done
against the final vmlinux.


85bd2fddd68e757da8e1af98f857f61a3c9ce647 changed
it to run modpost for individual .o files.

Then, 741f98fe298a73c9d47ed53703c1279a29718581
introduced vmlinux.o to use it for modpost.


The following two commits.
I did not fully understand the background, though.

I CC'ed Sam in case he may add some comments.





commit 85bd2fddd68e757da8e1af98f857f61a3c9ce647
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Mon Feb 26 15:33:52 2007 +0100

    kbuild: fix section mismatch check for vmlinux

    vmlinux does not contain relocation entries which is
    used by the section mismatch checks.
    Reported by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

    Use the individual objects as inputs to overcome
    this limitation.
    In modpost check the .o files and skip non-ELF files.

    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>





commit 741f98fe298a73c9d47ed53703c1279a29718581
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Tue Jul 17 10:54:06 2007 +0200

    kbuild: do section mismatch check on full vmlinux

    Previously we did do the check on the .o files used to link
    vmlinux but that failed to find questionable references across
    the .o files.
    Create a dedicated vmlinux.o file used only for section mismatch checks
    that uses the defualt linker script so section does not get renamed.

    The vmlinux.o may later be used as part of the the final link of vmlinux
    but for now it is used fo section mismatch only.
    For a defconfig build this is instant but for an allyesconfig this
    add two minutes to a full build (that anyways takes ~2 hours).

    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>












>
> Thanks,
> Nick
>
> >
> >
> > On Sat, May 23, 2020 at 2:41 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >>
> >> On Fri, May 22, 2020 at 5:27 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >> >
> >> > Instead of linking all compilation units again each time vmlinux_link is
> >> > called, reuse vmlinux.o from modpost_link.
> >> >
> >> > With x86_64 allyesconfig, vmlinux_link is called three times and reusing
> >> > vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
> >> > in the time spent in vmlinux_link).
> >> >
> >> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> >> > ---
> >> >  scripts/link-vmlinux.sh | 5 +----
> >> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >> >
> >> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> >> > index d09ab4afbda4..c6cc4305950c 100755
> >> > --- a/scripts/link-vmlinux.sh
> >> > +++ b/scripts/link-vmlinux.sh
> >> > @@ -77,11 +77,8 @@ vmlinux_link()
> >> >
> >> >         if [ "${SRCARCH}" != "um" ]; then
> >> >                 objects="--whole-archive                        \
> >> > -                       ${KBUILD_VMLINUX_OBJS}                  \
> >> > +                       vmlinux.o                               \
> >> >                         --no-whole-archive                      \
> >> > -                       --start-group                           \
> >> > -                       ${KBUILD_VMLINUX_LIBS}                  \
> >> > -                       --end-group                             \
> >> >                         ${@}"
> >> >
> >> >                 ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
> >> >
> >> > base-commit: b85051e755b0e9d6dd8f17ef1da083851b83287d
> >> > --
> >> > 2.27.0.rc0.183.gde8f92d652-goog
> >> >
> >>
> >>
> >> I like this patch irrespective of CLANG_LTO, but
> >> unfortunately, my build test failed.
> >>
> >>
> >> ARCH=powerpc failed to build as follows:
> >>
> >>
> >>
> >>   MODPOST vmlinux.o
> >>   MODINFO modules.builtin.modinfo
> >>   GEN     modules.builtin
> >>   LD      .tmp_vmlinux.kallsyms1
> >> vmlinux.o:(__ftr_alt_97+0x20): relocation truncated to fit:
> >> R_PPC64_REL14 against `.text'+4b1c
> >> vmlinux.o:(__ftr_alt_97+0x164): relocation truncated to fit:
> >> R_PPC64_REL14 against `.text'+1cf78
> >> vmlinux.o:(__ftr_alt_97+0x288): relocation truncated to fit:
> >> R_PPC64_REL14 against `.text'+1dac4
> >> vmlinux.o:(__ftr_alt_97+0x2f0): relocation truncated to fit:
> >> R_PPC64_REL14 against `.text'+1e254
> >> make: *** [Makefile:1125: vmlinux] Error 1
> >>
> >>
> >>
> >> I used powerpc-linux-gcc
> >> available at
> >> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/9.2.0/
> >>
> >>
> >> Build command:
> >>
> >> make -j24 ARCH=powerpc  CROSS_COMPILE=powerpc-linux-  defconfig all
> >>
> >>
> >> Could you check it please?
> >>
> >>
> >>
> >> I will apply it to my test branch.
> >> Perhaps, 0-day bot may find more failure cases.
> >>
> >>
> >> --
> >> Best Regards
> >> Masahiro Yamada
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
> >



--
Best Regards
Masahiro Yamada
