Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B2BDF7DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 00:13:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xrVp5YfmzDqLV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 09:13:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xrSw30XJzDqBh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 09:11:25 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id c7so1655150otm.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 15:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AVWauA2uNxWXhbatFT0jdg/LbLg2y15EPeDl4ltv22c=;
 b=PJPj5aO2/h8k/uvfOLLsUzgtGL9j7/YbfQPZIbMkBXB6A2EEdvA4FHNXFme7Y0mEA0
 +dVxoAk8PUhXC1oRXbfPlTaiZ1H2FzoLcCYScB1U07YGAZope9yMIsHGV18/DrXTVojn
 U/7By4T5495TJ5gCScVwvFTS4SrggX/pQqsBhO3SHo5znUR+uFcmvJzZOVyPm1ONucRP
 LFJX2RX721YLERW5wnHxYKU8SNlEnwkX9HyPD11zTxvAKcDqUpXTdcMyEnScxAx7wzdX
 Wec9EfoDMhHxVoHRHk5tTIwgFXwcoko99D0Swvuk+1OAkXzkFhZbJEu0j6dXlkC+gvYB
 IpOQ==
X-Gm-Message-State: APjAAAW3Uyn1fZ9byaY7j7ONSr604e0gjf5yqinzF1isWuowVo9vRykp
 IJiGeIaFlTp9u1s3QfV/TgQOTdGt
X-Google-Smtp-Source: APXvYqwGxiKdX5UGXLjuEp6odTwBdFT94wXmvJQ7HSgc25ja11cAXJxMS/5tf8Z5up2VIO8DYKu3kg==
X-Received: by 2002:a05:6830:f:: with SMTP id c15mr151353otp.204.1571695882631; 
 Mon, 21 Oct 2019 15:11:22 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
 [209.85.167.171])
 by smtp.gmail.com with ESMTPSA id m25sm4134046oie.39.2019.10.21.15.11.22
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 15:11:22 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id i185so12445895oif.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 15:11:22 -0700 (PDT)
X-Received: by 2002:aca:d88b:: with SMTP id p133mr259539oig.51.1571695881836; 
 Mon, 21 Oct 2019 15:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <VE1PR04MB6687DA0268FAF03D3E77A23B8F6C0@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <e02fa027-9c78-3272-d2d7-7ad2b0ed3ab0@rasmusvillemoes.dk>
 <CADRPPNREUK1SVxO4P5qb2COn+T04dtYgpVEzrveKUt16hBqAtQ@mail.gmail.com>
 <679bf33b-8c05-b77a-0cb2-d79dc5bfbe75@rasmusvillemoes.dk>
In-Reply-To: <679bf33b-8c05-b77a-0cb2-d79dc5bfbe75@rasmusvillemoes.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 21 Oct 2019 17:11:10 -0500
X-Gmail-Original-Message-ID: <CADRPPNSiMUy77Dhxjg03sHDxyZzWf_BP8a5+fCncbynyO_cNGg@mail.gmail.com>
Message-ID: <CADRPPNSiMUy77Dhxjg03sHDxyZzWf_BP8a5+fCncbynyO_cNGg@mail.gmail.com>
Subject: Re: [PATCH 0/7] towards QE support on ARM
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jslaby@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 21, 2019 at 3:46 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On 18/10/2019 23.52, Li Yang wrote:
> > On Fri, Oct 18, 2019 at 3:54 PM Rasmus Villemoes
> > <linux@rasmusvillemoes.dk> wrote:
> >>
> >> On 18/10/2019 22.16, Leo Li wrote:
> >>>
> >>>>
> >>>> There have been several attempts in the past few years to allow building the
> >>>> QUICC engine drivers for platforms other than PPC. This is (the beginning of)
> >>>> yet another attempt. I hope I can get someone to pick up these relatively
> >>>> trivial patches (I _think_ they shouldn't change functionality at all), and then
> >>>> I'll continue slowly working towards removing the PPC32 dependency for
> >>>> CONFIG_QUICC_ENGINE.
> >>>
> >>> Hi Rasmus,
> >>>
> >>> I don't fully understand the motivation of this work.  As far as I know the QUICC ENGINE is only used on PowerPC based SoCs.
> >>
> >> Hm, you're not the Leo Li that participated in this thread
> >> <https://lore.kernel.org/lkml/AM3PR04MB11857AE8D2B0BE56121B97D391C90@AM3PR04MB1185.eurprd04.prod.outlook.com/T/#u>?
> >
> > Oops, I totally forgot about this discussion which is just three years
> > ago.  :)  The QE-HDLC on LS1021a is kind of a special case.
> >
> >>
> >>
> >>  Can you give an example on how is it used on ARM system?
> >>
> >> LS1021A, for example, which is the one I'm aiming for getting fully
> >> supported in mainline.
> >> <https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/layerscape-communication-process/qoriq-layerscape-1021a-dual-core-communications-processor-with-lcd-controller:LS1021A>
> >>
> >> The forks at https://github.com/qoriq-open-source/linux.git have various
> >> degrees of support (grep for commits saying stuff like "remove PPCisms"
> >> - some versions can be found on
> >> <https://lore.kernel.org/lkml/?q=remove+ppcisms>). Our current kernel is
> >> based on commits from the now-vanished 4.1 branch, and unfortunately at
> >> least the 4.14 branch (LSDK-18.06-V4.14) trivially doesn't build on ARM,
> >> despite the PPC32 dependency having been removed from CONFIG_QUICC_ENGINE.
> >
> > Can you try the 4.14 branch from a newer LSDK release?  LS1021a should
> > be supported platform on LSDK.  If it is broken, something is wrong.
>
> What newer release? LSDK-18.06-V4.14 is the latest -V4.14 tag at
> https://github.com/qoriq-open-source/linux.git, and identical to the

That tree has been abandoned for a while, we probably should state
that in the github.  The latest tree can be found at
https://source.codeaurora.org/external/qoriq/qoriq-components/linux/

> linux-4.14 branch. And despite commit 4c33e2d0576b removing the PPC32
> dependency from QUICC_ENGINE, it clearly hasn't been built on arm, since
> back around v4.12, mainline's qe.c grew a call to pvr_version_is which
> is ppc-only. So from that I sort of assumed that NXP had dropped trying
> to support the LS1021A even in their own kernels.
>
> In any case, we have zero interest in running an NXP kernel. Maybe I
> should clarify what I meant by "based on commits from" above: We're
> currently running a mainline 4.14 kernel on LS1021A, with a few patches
> inspired from the NXP 4.1 branch applied on top - but also with some
> manual fixes for e.g. the pvr_version_is() issue. Now we want to move
> that to a 4.19-based kernel (so that it aligns with our MPC8309 platform).

We also provide 4.19 based kernel in the codeaurora repo.  I think it
will be helpful to reuse patches there if you want to make your own
tree.

>
> >> This is just some first few steps, and I'm not claiming
> >> that this is sufficient to make the QE drivers build on ARM yet. But I
> >> have a customer with both mpc8309-based and ls1021a-based platforms, and
> >> they want to run the same, as-close-to-mainline-as-possible, kernel on
> >> both. So I will take a piecemeal approach, and try to make sure I don't
> >> break the ppc boards in the process (just building and booting one board
> >> is of course not sufficient, but better than nothing). Once I get to
> >> actually build some of the QE drivers for ARM, I'll of course also test
> >> them.
> >
> > Understood.  Zhao Qiang also maintains some patches similar to your
> > patchset and I think they are tested on ARM.  But the review of these
> > patches from last submission didn't finish.  It looks like your
> > patches are better divided but not really verified on ARM.  Zhao
> > Qiang's patches are tested but maybe need some final touch for
> > cleaning up.  I will let you guys decide what is the best approach to
> > make this upstreamed.
>
> Yes, as I said, I wanted to try a fresh approach since Zhao
> Qiang's patches seemed to be getting nowhere. Splitting the patches into
> smaller pieces is definitely part of that - for example, the completely
> trivial whitespace fix in patch 1 is to make sure the later coccinelle
> generated patch is precisely that (i.e., a later respin can just rerun
> the coccinelle script, with zero manual fixups). I also want to avoid
> mixing the ppcism cleanups with other things (e.g. replacing some
> of_get_property() by of_property_read_u32()). And the "testing on ARM"
> part comes once I get to actually building on ARM. But there's not much
> point doing all that unless there's some indication that this can be
> applied to some tree that actually feeds into Linus', which is why I
> started with a few trivial patches and precisely to start this discussion.

Right.  I'm really interested in getting this applied to my tree and
make it upstream.  Zhao Qiang, can you help to review Rasmus's patches
and comment?

Regards,
Leo
