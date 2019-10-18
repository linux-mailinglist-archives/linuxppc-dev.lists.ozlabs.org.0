Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC5DDD168
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 23:54:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46w0Dg5d7mzDqlg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 08:54:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46w0Bv1gLbzDqjN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 08:52:52 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id z6so6230875otb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 14:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HvighmfITJLDYGeaiDUTpHYE/uCdU2psCtkCA9EvB0w=;
 b=oyW/A8G1QjjSr6Ev59ndPcOvzauFAQ+WO4yBpFxRGMWpKIDsShkzUgO9cfc9TACEgM
 1V0WK3u2KBlG/x0sGpw/0K8nAdrofQhBovc0m5InjD6UCtW6KESmyiFaSF6WTNGs3saR
 QKyE3chffeJ3ajLLFUZKETEB0c0UhZOst5TH0vj2yEC0CbtTrucuf0mhKw72gA98ADv3
 41wKPPFg59MQhkKHaZAWWGC4AVvbAXT4f7nV+MPXBtQ+xbk9rfDMo2oEolEsFcYa+B5e
 XWPUJNXapnVKJT+31BR9zYbigLqKvAN12Vv+7pUi+5Qh308AFV0DHnCou23zBv9xxWMC
 wNSg==
X-Gm-Message-State: APjAAAWQf2fuV1GStdbZzGRsiNsuHUgEmIx9kaYzm94TLYBHB8US5nTp
 FZ0UrP/1tUvVb5Hxs9Tx8BXhR7Ob
X-Google-Smtp-Source: APXvYqze1DUBk2BDbIEdXbcnIg0tzY6dRbbnVMSBvmTX0HfC8EJTsEXQuKcrHO/NOjVB9E91J9/gVA==
X-Received: by 2002:a05:6830:f:: with SMTP id
 c15mr9659854otp.204.1571435569406; 
 Fri, 18 Oct 2019 14:52:49 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
 [209.85.210.50])
 by smtp.gmail.com with ESMTPSA id i13sm1866920otj.58.2019.10.18.14.52.48
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 14:52:48 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 21so6181992otj.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 14:52:48 -0700 (PDT)
X-Received: by 2002:a9d:4d0d:: with SMTP id n13mr9769808otf.74.1571435568401; 
 Fri, 18 Oct 2019 14:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <VE1PR04MB6687DA0268FAF03D3E77A23B8F6C0@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <e02fa027-9c78-3272-d2d7-7ad2b0ed3ab0@rasmusvillemoes.dk>
In-Reply-To: <e02fa027-9c78-3272-d2d7-7ad2b0ed3ab0@rasmusvillemoes.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 18 Oct 2019 16:52:37 -0500
X-Gmail-Original-Message-ID: <CADRPPNREUK1SVxO4P5qb2COn+T04dtYgpVEzrveKUt16hBqAtQ@mail.gmail.com>
Message-ID: <CADRPPNREUK1SVxO4P5qb2COn+T04dtYgpVEzrveKUt16hBqAtQ@mail.gmail.com>
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

On Fri, Oct 18, 2019 at 3:54 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On 18/10/2019 22.16, Leo Li wrote:
> >
> >>
> >> There have been several attempts in the past few years to allow building the
> >> QUICC engine drivers for platforms other than PPC. This is (the beginning of)
> >> yet another attempt. I hope I can get someone to pick up these relatively
> >> trivial patches (I _think_ they shouldn't change functionality at all), and then
> >> I'll continue slowly working towards removing the PPC32 dependency for
> >> CONFIG_QUICC_ENGINE.
> >
> > Hi Rasmus,
> >
> > I don't fully understand the motivation of this work.  As far as I know the QUICC ENGINE is only used on PowerPC based SoCs.
>
> Hm, you're not the Leo Li that participated in this thread
> <https://lore.kernel.org/lkml/AM3PR04MB11857AE8D2B0BE56121B97D391C90@AM3PR04MB1185.eurprd04.prod.outlook.com/T/#u>?

Oops, I totally forgot about this discussion which is just three years
ago.  :)  The QE-HDLC on LS1021a is kind of a special case.

>
>
>  Can you give an example on how is it used on ARM system?
>
> LS1021A, for example, which is the one I'm aiming for getting fully
> supported in mainline.
> <https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/layerscape-communication-process/qoriq-layerscape-1021a-dual-core-communications-processor-with-lcd-controller:LS1021A>
>
> The forks at https://github.com/qoriq-open-source/linux.git have various
> degrees of support (grep for commits saying stuff like "remove PPCisms"
> - some versions can be found on
> <https://lore.kernel.org/lkml/?q=remove+ppcisms>). Our current kernel is
> based on commits from the now-vanished 4.1 branch, and unfortunately at
> least the 4.14 branch (LSDK-18.06-V4.14) trivially doesn't build on ARM,
> despite the PPC32 dependency having been removed from CONFIG_QUICC_ENGINE.

Can you try the 4.14 branch from a newer LSDK release?  LS1021a should
be supported platform on LSDK.  If it is broken, something is wrong.

>
> >>
> >> Tested on an MPC8309-derived board.
> >
> > MPC8309 is also PPC based.
>
> True, of course. This is just some first few steps, and I'm not claiming
> that this is sufficient to make the QE drivers build on ARM yet. But I
> have a customer with both mpc8309-based and ls1021a-based platforms, and
> they want to run the same, as-close-to-mainline-as-possible, kernel on
> both. So I will take a piecemeal approach, and try to make sure I don't
> break the ppc boards in the process (just building and booting one board
> is of course not sufficient, but better than nothing). Once I get to
> actually build some of the QE drivers for ARM, I'll of course also test
> them.

Understood.  Zhao Qiang also maintains some patches similar to your
patchset and I think they are tested on ARM.  But the review of these
patches from last submission didn't finish.  It looks like your
patches are better divided but not really verified on ARM.  Zhao
Qiang's patches are tested but maybe need some final touch for
cleaning up.  I will let you guys decide what is the best approach to
make this upstreamed.

Regards,
Leo
