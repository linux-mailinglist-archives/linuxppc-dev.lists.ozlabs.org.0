Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC052DBA98
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 06:25:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cwk9q2YlfzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 16:25:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cwk8C53rdzDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 16:24:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=nZDI7Jnc; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4Cwk8C3ZZXz8t0b
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 16:24:27 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4Cwk8C37X0z9sT6; Wed, 16 Dec 2020 16:24:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.83;
 helo=conssluserg-04.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=nZDI7Jnc; 
 dkim-atps=neutral
X-Greylist: delayed 40832 seconds by postgrey-1.36 at bilbo;
 Wed, 16 Dec 2020 16:24:25 AEDT
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Cwk8923Fbz9sRR
 for <linuxppc-dev@ozlabs.org>; Wed, 16 Dec 2020 16:24:24 +1100 (AEDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 0BG5Nx8d028132
 for <linuxppc-dev@ozlabs.org>; Wed, 16 Dec 2020 14:23:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0BG5Nx8d028132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1608096240;
 bh=mMRG1LGnfWOmEWxwhxUsNuknWgR/M4rj8bj+quv0/Ok=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nZDI7JncJ120XCJzsPy/mwuAV5dJMJR5glPxuHcUIhWAnXibfOtRCsiBbipMLtG3c
 vO2InhErTXxjjHHoYPLURG5wpcokOeIB/h2RM/Y1x04KvNmY14fD49+7Dkqm1frueV
 sgByBC76NyL63zljy0QFSOTlJMmz+JmOuUdn1W9fF63C4plLwFeu3eWQ+6fW0ZYSZj
 vkgOJpGpEc1XtAGYJnZ464KH4RqPzMzEol/tqIENvKx9UtCvLQjzR4lsIKTfJTSQKH
 N0DOAQsORtP9YjfIl/CsHpyGtpDDpoA/972eM0GciVJFjvUcb3mMo+jsiCKHzsXkfM
 Km9sQh6XPDodA==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id hk16so921799pjb.4
 for <linuxppc-dev@ozlabs.org>; Tue, 15 Dec 2020 21:23:59 -0800 (PST)
X-Gm-Message-State: AOAM533d1jc+60p2Os6YKF8jxMiI6vvj3dwjf6k6gEpKyJoX3ezys/yR
 XZ9zBNgtrhX9R0HHf5U98E9RhAGEZ3hlHwDgjhE=
X-Google-Smtp-Source: ABdhPJwisgw4ljAzAtNpe0NQuQiqJtqinlg2Gz2Q7Oas2Nm7XsSoM6GR+jsGi0lXd0ed1FbjYY5SJjObofwn0E62Ork=
X-Received: by 2002:a17:90a:fa0c:: with SMTP id
 cm12mr1721057pjb.87.1608096238839; 
 Tue, 15 Dec 2020 21:23:58 -0800 (PST)
MIME-Version: 1.0
References: <20201215032906.473460-1-mpe@ellerman.id.au>
 <CAK7LNASJcp=U9sKo9FVdkGNWXu7TGDL2zE-hFQymtfvUhY5+wA@mail.gmail.com>
 <87zh2exyjp.fsf@mpe.ellerman.id.au>
In-Reply-To: <87zh2exyjp.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 16 Dec 2020 14:23:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrDUMqWW32+BjepoutnV52vYC3TQLp-aHLobaCc1+ejg@mail.gmail.com>
Message-ID: <CAK7LNARrDUMqWW32+BjepoutnV52vYC3TQLp-aHLobaCc1+ejg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: Fix build of dts/fsl
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 16, 2020 at 11:41 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > On Tue, Dec 15, 2020 at 12:29 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >>
> >> The lkp robot reported that some configs fail to build, for example
> >> mpc85xx_smp_defconfig, with:
> >>
> >>   cc1: fatal error: opening output file arch/powerpc/boot/dts/fsl/.mpc8540ads.dtb.dts.tmp: No such file or directory
> >>
> >> This bisects to:
> >>   cc8a51ca6f05 ("kbuild: always create directories of targets")
> >>
> >> Although that commit claims to be about in-tree builds, it somehow
> >> breaks out-of-tree builds. But presumably it's just exposing a latent
> >> bug in our Makefiles.
> >>
> >> We can fix it by adding to targets for dts/fsl in the same way that we
> >> do for dts.
> >>
> >> Fixes: cc8a51ca6f05 ("kbuild: always create directories of targets")
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> >> ---
> >>  arch/powerpc/boot/Makefile | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> >> index 68a7534454cd..c3e084cceaed 100644
> >> --- a/arch/powerpc/boot/Makefile
> >> +++ b/arch/powerpc/boot/Makefile
> >> @@ -372,6 +372,8 @@ initrd-y := $(filter-out $(image-y), $(initrd-y))
> >>  targets        += $(image-y) $(initrd-y)
> >>  targets += $(foreach x, dtbImage uImage cuImage simpleImage treeImage, \
> >>                 $(patsubst $(x).%, dts/%.dtb, $(filter $(x).%, $(image-y))))
> >> +targets += $(foreach x, dtbImage uImage cuImage simpleImage treeImage, \
> >> +               $(patsubst $(x).%, dts/fsl/%.dtb, $(filter $(x).%, $(image-y))))
> >>
> >>  $(addprefix $(obj)/, $(initrd-y)): $(obj)/ramdisk.image.gz
> >>
> >
> >
> > Some freescale dts files are right under arch/powerpc/boot/dts/,
> > but some are in the fsl/ subdirectory.
> > I do not understand the policy.
>
> There isn't a policy. Best I can tell Kumar felt like it would be
> cleaner to have a separate directory for (some of) the Freescale DTS
> files, when he initially submitted them ~9 years ago.
>
>
> > If "fsl/" is a very special case,
> > I just thought we could add a new syntax, fslimage-y,
> > but I do not mind either way.
>
> OK. If you don't mind I'll merge my patch as a quick fix for now.
>
> Then we can probably move all the fsl/ files up one level and avoid the
> problem entirely in future.


Yes. I think it is OK.

As for PPC, most of the DT files are freescale.

Even if you separated DT files in vendor directories,
the majority would go into fsl/.



> > fslimage-$(CONFIG_MPC8540_ADS) += cuImage.mpc8540ads
> >
> > targets += $(foreach x, dtbImage uImage cuImage simpleImage treeImage, \
> >                $(patsubst $(x).%, dts/fsl/%.dtb, $(filter $(x).%,
> > $(fslimage-y))))
> >
> >
> > This Makefile is wrong over-all anyway.
>
> Excellent.

You can pass V=2 to see why targets under arch/powerpc/boot/
are needlessly rebuilt.

This Makefile is already too cluttered, and I do not have
much time to look into it.






-- 
Best Regards
Masahiro Yamada
