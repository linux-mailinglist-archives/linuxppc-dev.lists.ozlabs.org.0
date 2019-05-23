Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D75322788C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 10:55:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458jxh1V3QzDqWc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 18:55:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458jw71TQPzDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 18:53:42 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id u11so4708120otq.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 01:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IgQ/bRtEOqDdDekv2xHrHuQNQBwEC6RN7d0nBiETbME=;
 b=XGkp+CFv8PWig12sQ7P8DDQcKyCHANUrhWwK4pdNs7IvNXfyxkeoRTIlduPvY5Aucg
 ovw18riGSK87UZB+kKUfMTfNkpqkmaC46DckLZYaKJB2PPdxtTx9pD+c9DaNZIIXwuZ+
 eIOK8i/s/t0t8Hil8HbjZhL3E7cJ7fWkP1QuwkyHMWOPh6rnbNUoiK1U7Fkf/4ckvJe/
 m2uMZjsn7Z15d5ejy/wkAw0mRUA6/OBAMuNnyumM/mzwJmjUnq+KnxPJFp21X194+H1e
 wdAMObWMgQItVlnMk4tPwOQgeAkcjSsjpfAKbTXIeqXBbBK5C9zC51ko3RCK3W65W5om
 4RZg==
X-Gm-Message-State: APjAAAUi+8vFV9Z0vFqv97+NQSE8SV3RRLbp+zDG+XeJxgh1WsNWwX0M
 /NQ6ZPBzDTNALL0Q0IolNAQu1r2aF5QMUicR1A8=
X-Google-Smtp-Source: APXvYqwDvxZRzlIRx6czcwd724jbKzMIgCfgL9eERTxnzDDveGA1jt21mugeKRVliN9mfMCvm8am9lTxcieIqd2Sgb0=
X-Received: by 2002:a9d:27c7:: with SMTP id c65mr56481138otb.335.1558601620848; 
 Thu, 23 May 2019 01:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7wUszwugJeS_x_ExaHPUb8p23D7Zo2f2qqXfLQwr8EiLsk2g@mail.gmail.com>
 <33ab57c7-294a-6ae4-d678-1490ce5b97f1@c-s.fr>
 <CA+7wUsywReRnB1ASdbVrNRkWyPkSKhruBKo57kX--1qmU8hv7A@mail.gmail.com>
 <9b6e027e-0fa0-e088-d9a3-47b005cbc356@c-s.fr>
 <CA+7wUsxOxvtsp511c63HK-=Wm22qyEtDcg=p4rfRD+n55UQmiQ@mail.gmail.com>
In-Reply-To: <CA+7wUsxOxvtsp511c63HK-=Wm22qyEtDcg=p4rfRD+n55UQmiQ@mail.gmail.com>
From: Mathieu Malaterre <malat@debian.org>
Date: Thu, 23 May 2019 10:53:29 +0200
Message-ID: <CA+7wUszcau+OBj+ZTr007_vuTJsOmT0izZ64_W98x1=MPLU6aA@mail.gmail.com>
Subject: Re: Failure to boot G4: dt_headr_start=0x01501000
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2019 at 10:29 AM Mathieu Malaterre <malat@debian.org> wrote=
:
>
> On Thu, May 23, 2019 at 8:39 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
> >
> > Salut Mathieu,
> >
> > Le 23/05/2019 =C3=A0 08:24, Mathieu Malaterre a =C3=A9crit :
> > > Salut Christophe,
> > >
> > > On Wed, May 22, 2019 at 2:20 PM Christophe Leroy
> > > <christophe.leroy@c-s.fr> wrote:
> > >>
> > >>
> > >>
> > >> Le 22/05/2019 =C3=A0 14:15, Mathieu Malaterre a =C3=A9crit :
> > >>> Hi all,
> > >>>
> > >>> I have not boot my G4 in a while, today using master here is what I=
 see:
> > >>>
> > >>> done
> > >>> Setting btext !
> > >>> W=3D640 H=3D488 LB=3D768 addr=3D0x9c008000
> > >>> copying OF device tree...
> > >>> starting device tree allocs at 01401000
> > >>> otloc_up(00100000, 0013d948)
> > >>>     trying: 0x01401000
> > >>>     trying: 0x01501000
> > >>>    -=E2=80=BA 01501000
> > >>>     alloc_bottom : 01601000
> > >>>     alloc_top    : 20000000
> > >>>     alloc_top_hi : 20000000
> > >>>     nmo_top      : 20000000
> > >>>     ram_top      : 20000000
> > >>> Building dt strings...
> > >>> Building dt structure...
> > >>> reserved memory map:
> > >>>     00d40000 - 006c1000
> > >>> Device tree strings 0x01502000 -> 0x00000007
> > >>> Device tree struct 0x01503000 -> 0x00000007
> > >>> Quiescing Open Firmware ...
> > >>> Booting Linux via __start() @ 0x001400000
> > >>> ->dt_headr_start=3D0x01501000
> > >>>
> > >>> Any suggestions before I start a bisect ?
> > >>>
> > >>
> > >> Have you tried without CONFIG_PPC_KUEP and CONFIG_PPC_KUAP ?
> > >
> > > Using locally:
> > >
> > > diff --git a/arch/powerpc/configs/g4_defconfig
> > > b/arch/powerpc/configs/g4_defconfig
> > > index 14d0376f637d..916bce8ce9c3 100644
> > > --- a/arch/powerpc/configs/g4_defconfig
> > > +++ b/arch/powerpc/configs/g4_defconfig
> > > @@ -32,6 +32,8 @@ CONFIG_USERFAULTFD=3Dy
> > >   # CONFIG_COMPAT_BRK is not set
> > >   CONFIG_PROFILING=3Dy
> > >   CONFIG_G4_CPU=3Dy
> > > +# CONFIG_PPC_KUEP is not set
> > > +# CONFIG_PPC_KUAP is not set
> > >   CONFIG_PANIC_TIMEOUT=3D0
> > >   # CONFIG_PPC_CHRP is not set
> > >   CONFIG_CPU_FREQ=3Dy
> > >
> > >
> > > Leads to almost the same error (some values have changed):
> >
> > Ok.
> >
> > When you say you are using 'master', what do you mean ? Can you give th=
e
> > commit Id ?
> >
> > Does it boots with Kernel 5.1.4 ?
>
> I was able to boot v5.1:
>
> $ dmesg | head
> [    0.000000] printk: bootconsole [udbg0] enabled
> [    0.000000] Total memory =3D 512MB; using 1024kB for hash table (at (p=
trval))
> [    0.000000] Linux version 5.1.0+ (malat@debian.org) (gcc version
> 8.3.0 (Debian 8.3.0-7)) #8 Thu May 23 06:26:38 UTC 2019
>
> Commit id is:
>
> e93c9c99a629 (tag: v5.1) Linux 5.1
>
> > Did you try latest powerpc/merge branch ?
>
> Will try that next.

I confirm powerpc/merge does not boot for me (same config). Commit id:

a27eaa62326d (powerpc/merge) Automatic merge of branches 'master',
'next' and 'fixes' into merge


> > Can you send your full .config ?
>
> Config is attached.
>
> Thanks,
>
> > Christophe
> >
> > >
> > > done
> > > Setting btext !
> > > W=3D640 H=3D488 LB=3D768 addr=3D0x9c008000
> > > copying OF device tree...
> > > starting device tree allocs at 01300000
> > > alloc_up(00100000, 0013d948)
> > >    trying: 0x01300000
> > >    trying: 0x01400000
> > >   -=E2=80=BA 01400000
> > >    alloc_bottom : 01500000
> > >    alloc_top    : 20000000
> > >    alloc_top_hi : 20000000
> > >    nmo_top      : 20000000
> > >    ram_top      : 20000000
> > > Building dt strings...
> > > Building dt structure...
> > > reserved memory map:
> > >    00c40000 - 006c0000
> > > Device tree strings 0x01401000 -> 0x00000007
> > > Device tree struct 0x01402000 -> 0x00000007
> > > Quiescing Open Firmware ...
> > > Booting Linux via __start() @ 0x001400000
> > > ->dt_headr_start=3D0x01400000
> > >
> > > Thanks anyway,
> > >
