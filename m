Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B5E4E2270
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:47:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMStQ2Y9qz30Lq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:47:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.51; helo=mail-qv1-f51.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMSt03lYjz305p
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:47:18 +1100 (AEDT)
Received: by mail-qv1-f51.google.com with SMTP id kj22so509455qvb.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 01:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5gk+/j84Xzw+Bz6trp5c4rDqGZSiryYy0T6cty9/gyU=;
 b=UuJSpDgO/9HuTxkAuSccmXcQVm3JcO8okcacIlATmAvdcYDQSiR6rpucjiiwbzq5ST
 eW5d7eVW6lXXtvEwrFrQ+jQH3cS3xNBAPByPqDxjqzaG5IbdihWHtCUdhntO5l+Y65l2
 ADRV86ZOjP4thfXqnNvMAIbEA6wKJayRHDX0L+nJPwNlcwUCiCwdEgKzB53PWXbrtTgo
 Qj9216OAvM/5GM3hN/rVdWaqAylFovyjxMlmxJZPWFZD2lnnE9U9u2gz7v/yLKOw1ZeM
 tPGLiW9LyKlCQiLge0UdysZweaFFZFia046WYlu9xexqjLyInnXB5rJpp85teTQP2jTn
 k1Hw==
X-Gm-Message-State: AOAM532W6ONbB4+xS20fLOKA+lXz8X8NsH3k4zVBAp3JPxyjx76SwBsI
 roVpPJF6cavFIEggF1iSB4+jIU4iZl7O3Q==
X-Google-Smtp-Source: ABdhPJwhrw1ZVosgctBr1uTZxFLCw3YhS4EEmCD4ov2miNAX/HmQ8An//bBaDOH4j+0OHHY+r+T3aw==
X-Received: by 2002:ad4:594b:0:b0:441:1578:6200 with SMTP id
 eo11-20020ad4594b000000b0044115786200mr5706971qvb.36.1647852434065; 
 Mon, 21 Mar 2022 01:47:14 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 s131-20020a37a989000000b0067d2e3c51e8sm7586722qke.58.2022.03.21.01.47.13
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 01:47:13 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2e5757b57caso147160997b3.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 01:47:13 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr23075844ywb.132.1647852433271; Mon, 21
 Mar 2022 01:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <d987663bbed18d7dbf106db6066a759040b4e57a.1647837028.git.fthain@linux-m68k.org>
 <5291a177-9a67-b23a-515f-7faa3cc887e8@csgroup.eu>
 <e8398356-8ba3-e9de-8da0-3591907340b5@linux-m68k.org>
In-Reply-To: <e8398356-8ba3-e9de-8da0-3591907340b5@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Mar 2022 09:47:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqzWo1+gAfEjOQEZHeprbPEzWyCaUqLKx0_4nrDG+5Uw@mail.gmail.com>
Message-ID: <CAMuHMdXqzWo1+gAfEjOQEZHeprbPEzWyCaUqLKx0_4nrDG+5Uw@mail.gmail.com>
Subject: Re: [PATCH] macintosh/via-pmu: Fix build failure when CONFIG_INPUT is
 disabled
To: Finn Thain <fthain@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Finn,

On Mon, Mar 21, 2022 at 9:29 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Mon, 21 Mar 2022, Christophe Leroy wrote:
> > Le 21/03/2022 =C3=A0 05:30, Finn Thain a =C3=A9crit :
> > > drivers/macintosh/via-pmu-event.o: In function `via_pmu_event':
> > > via-pmu-event.c:(.text+0x44): undefined reference to `input_event'
> > > via-pmu-event.c:(.text+0x68): undefined reference to `input_event'
> > > via-pmu-event.c:(.text+0x94): undefined reference to `input_event'
> > > via-pmu-event.c:(.text+0xb8): undefined reference to `input_event'
> > > drivers/macintosh/via-pmu-event.o: In function `via_pmu_event_init':
> > > via-pmu-event.c:(.init.text+0x20): undefined reference to `input_allo=
cate_device'
> > > via-pmu-event.c:(.init.text+0xc4): undefined reference to `input_regi=
ster_device'
> > > via-pmu-event.c:(.init.text+0xd4): undefined reference to `input_free=
_device'
> > > make[1]: *** [Makefile:1155: vmlinux] Error 1
> > > make: *** [Makefile:350: __build_one_by_one] Error 2
> > >
> > > Don't call into the input subsystem unless CONFIG_INPUT is built-in.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Cc: Randy Dunlap <rdunlap@infradead.org>
> > > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > > ---
> > > This is equivalent to the patch I sent a couple of days ago. This one
> > > is slightly longer and adds a new symbol so that Kconfig logic can be=
en
> > > used instead of Makefile logic in case reviewers prefer that.
> > > ---
> > >   drivers/macintosh/Kconfig   | 5 +++++
> > >   drivers/macintosh/Makefile  | 3 ++-
> > >   drivers/macintosh/via-pmu.c | 2 ++
> > >   3 files changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
> > > index 5cdc361da37c..b9102f051bbb 100644
> > > --- a/drivers/macintosh/Kconfig
> > > +++ b/drivers/macintosh/Kconfig
> > > @@ -67,6 +67,11 @@ config ADB_PMU
> > >       this device; you should do so if your machine is one of those
> > >       mentioned above.
> > >
> > > +config ADB_PMU_EVENT
> > > +   bool
> > > +   depends on ADB_PMU && INPUT=3Dy
> > > +   default y
> >
> > Could be reduced to
> >
> > config ADB_PMU_EVENT
> >       def_bool y if ADB_PMU && INPUT=3Dy
>
> That's great but my question remains unanswered: why the aversion to
> conditionals in Makefiles, when that would be simpler (no new symbol)?

While conditionals in Makefiles do exist, they are far less common, and
can be confusing.  They're also harder to grep for.
E.g. "git grep via-pmu-event.o" after your alternative patch would
give:

    obj-$(CONFIG_ADB_PMU)          +=3D via-pmu-event.o

but would miss the important surrounding part:

    ifeq ($(CONFIG_INPUT), y)
    obj-$(CONFIG_ADB_PMU)          +=3D via-pmu-event.o
    endif

Keeping configuration logic in a single place (the Kconfig file)
avoids that.  The extra symbol is invisible, so it doesn't hurt much.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
