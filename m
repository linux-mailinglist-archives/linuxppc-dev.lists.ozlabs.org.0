Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DFF27A30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 12:18:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458lnf5pndzDqX0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 20:18:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.194; helo=mail-oi1-f194.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458lmM5QJszDqDr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 20:17:06 +1000 (AEST)
Received: by mail-oi1-f194.google.com with SMTP id f4so3941579oib.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 03:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6IOzVc0HcwmbUV9yz2IH2jVsI5+0nbJhEhobBCM5aWE=;
 b=tw5wIoWI3ZnX08XHF8KOuPzk0t/z/JCx4roI6Tk1ujm/zm2kJ3fHxsu5A6QGBcHigG
 E4SHSXA6Q4uAZfPmGk5XViDd/ej05ORxX1q53Onp/aPz47PHSm04yfSZTDebdMHFkANl
 nOFvmsPMdFsKh7NQ4on4cF7xTABd1rizEXFUAX68AXojZ/LBpuL9IMrI7dRoZNUTblX1
 8xWIxJBWik4lpcdlSWbuOD7lSzvUIXBKs75Nqj/WXFQ0sNuiu0+CNv3WFLVZJBiN7Dbs
 SHaw2+SxXLgoI387hHx5Qh+EZv34gjSmQydjZRPUbBkUvW/K5h8y6bcFsGFj88Q5r+Ug
 wLhA==
X-Gm-Message-State: APjAAAVsANgPGrub+v+7LM9EVBADnuzi6oM2QDmdsiacEwPsr6AAbAmS
 kFtNpYSOFgfRM987vppsnyl+U1yAv7V34ucFMsSx32jQ
X-Google-Smtp-Source: APXvYqyD19V1D97zx+nANctR2xBfk68FQrztpoW3EVVP3wH3tzZ20zKjooiy8imkXi6BOTaPOrPXNcJYfnOLXKgjtdc=
X-Received: by 2002:a05:6808:98a:: with SMTP id
 a10mr156367oic.57.1558606623555; 
 Thu, 23 May 2019 03:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7wUszwugJeS_x_ExaHPUb8p23D7Zo2f2qqXfLQwr8EiLsk2g@mail.gmail.com>
 <33ab57c7-294a-6ae4-d678-1490ce5b97f1@c-s.fr>
 <CA+7wUsywReRnB1ASdbVrNRkWyPkSKhruBKo57kX--1qmU8hv7A@mail.gmail.com>
 <9b6e027e-0fa0-e088-d9a3-47b005cbc356@c-s.fr>
 <CA+7wUsxOxvtsp511c63HK-=Wm22qyEtDcg=p4rfRD+n55UQmiQ@mail.gmail.com>
 <CA+7wUszcau+OBj+ZTr007_vuTJsOmT0izZ64_W98x1=MPLU6aA@mail.gmail.com>
 <9e5ef44d-259a-1f1a-bd6a-98abdae85da0@c-s.fr>
In-Reply-To: <9e5ef44d-259a-1f1a-bd6a-98abdae85da0@c-s.fr>
From: Mathieu Malaterre <malat@debian.org>
Date: Thu, 23 May 2019 12:16:52 +0200
Message-ID: <CA+7wUsxoCrqw5MH+8QrT4kVVC0AcwdgUu3Zuy+-GGU=bU1_ezg@mail.gmail.com>
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

On Thu, May 23, 2019 at 11:45 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 23/05/2019 =C3=A0 10:53, Mathieu Malaterre a =C3=A9crit :
> > On Thu, May 23, 2019 at 10:29 AM Mathieu Malaterre <malat@debian.org> w=
rote:
> >>
> >> On Thu, May 23, 2019 at 8:39 AM Christophe Leroy
> >> <christophe.leroy@c-s.fr> wrote:
> >>>
> >>> Salut Mathieu,
> >>>
> >>> Le 23/05/2019 =C3=A0 08:24, Mathieu Malaterre a =C3=A9crit :
> >>>> Salut Christophe,
> >>>>
> >>>> On Wed, May 22, 2019 at 2:20 PM Christophe Leroy
> >>>> <christophe.leroy@c-s.fr> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> Le 22/05/2019 =C3=A0 14:15, Mathieu Malaterre a =C3=A9crit :
> >>>>>> Hi all,
> >>>>>>
> >>>>>> I have not boot my G4 in a while, today using master here is what =
I see:
> >>>>>>
> >>>>>> done
> >>>>>> Setting btext !
> >>>>>> W=3D640 H=3D488 LB=3D768 addr=3D0x9c008000
> >>>>>> copying OF device tree...
> >>>>>> starting device tree allocs at 01401000
> >>>>>> otloc_up(00100000, 0013d948)
> >>>>>>      trying: 0x01401000
> >>>>>>      trying: 0x01501000
> >>>>>>     -=E2=80=BA 01501000
> >>>>>>      alloc_bottom : 01601000
> >>>>>>      alloc_top    : 20000000
> >>>>>>      alloc_top_hi : 20000000
> >>>>>>      nmo_top      : 20000000
> >>>>>>      ram_top      : 20000000
> >>>>>> Building dt strings...
> >>>>>> Building dt structure...
> >>>>>> reserved memory map:
> >>>>>>      00d40000 - 006c1000
> >>>>>> Device tree strings 0x01502000 -> 0x00000007
> >>>>>> Device tree struct 0x01503000 -> 0x00000007
> >>>>>> Quiescing Open Firmware ...
> >>>>>> Booting Linux via __start() @ 0x001400000
> >>>>>> ->dt_headr_start=3D0x01501000
> >>>>>>
> >>>>>> Any suggestions before I start a bisect ?
> >>>>>>
> >>>>>
> >>>>> Have you tried without CONFIG_PPC_KUEP and CONFIG_PPC_KUAP ?
> >>>>
> >>>> Using locally:
> >>>>
> >>>> diff --git a/arch/powerpc/configs/g4_defconfig
> >>>> b/arch/powerpc/configs/g4_defconfig
> >>>> index 14d0376f637d..916bce8ce9c3 100644
> >>>> --- a/arch/powerpc/configs/g4_defconfig
> >>>> +++ b/arch/powerpc/configs/g4_defconfig
> >>>> @@ -32,6 +32,8 @@ CONFIG_USERFAULTFD=3Dy
> >>>>    # CONFIG_COMPAT_BRK is not set
> >>>>    CONFIG_PROFILING=3Dy
> >>>>    CONFIG_G4_CPU=3Dy
> >>>> +# CONFIG_PPC_KUEP is not set
> >>>> +# CONFIG_PPC_KUAP is not set
> >>>>    CONFIG_PANIC_TIMEOUT=3D0
> >>>>    # CONFIG_PPC_CHRP is not set
> >>>>    CONFIG_CPU_FREQ=3Dy
> >>>>
> >>>>
> >>>> Leads to almost the same error (some values have changed):
> >>>
> >>> Ok.
> >>>
> >>> When you say you are using 'master', what do you mean ? Can you give =
the
> >>> commit Id ?
> >>>
> >>> Does it boots with Kernel 5.1.4 ?
> >>
> >> I was able to boot v5.1:
> >>
> >> $ dmesg | head
> >> [    0.000000] printk: bootconsole [udbg0] enabled
> >> [    0.000000] Total memory =3D 512MB; using 1024kB for hash table (at=
 (ptrval))
> >> [    0.000000] Linux version 5.1.0+ (malat@debian.org) (gcc version
> >> 8.3.0 (Debian 8.3.0-7)) #8 Thu May 23 06:26:38 UTC 2019
> >>
> >> Commit id is:
> >>
> >> e93c9c99a629 (tag: v5.1) Linux 5.1
> >>
> >>> Did you try latest powerpc/merge branch ?
> >>
> >> Will try that next.
> >
> > I confirm powerpc/merge does not boot for me (same config). Commit id:
> >
> > a27eaa62326d (powerpc/merge) Automatic merge of branches 'master',
> > 'next' and 'fixes' into merge
>
> I see in the config you sent me that you have selected CONFIG_KASAN,
> which is a big new stuff.
>
> Can you try without it ?

With same config but CONFIG_KASAN=3Dn (on top of a27eaa62326d), I can
reproduce the boot failure (no change).

Time for bisect ?

> Christophe
>
> >
> >
> >>> Can you send your full .config ?
> >>
> >> Config is attached.
> >>
> >> Thanks,
> >>
> >>> Christophe
> >>>
> >>>>
> >>>> done
> >>>> Setting btext !
> >>>> W=3D640 H=3D488 LB=3D768 addr=3D0x9c008000
> >>>> copying OF device tree...
> >>>> starting device tree allocs at 01300000
> >>>> alloc_up(00100000, 0013d948)
> >>>>     trying: 0x01300000
> >>>>     trying: 0x01400000
> >>>>    -=E2=80=BA 01400000
> >>>>     alloc_bottom : 01500000
> >>>>     alloc_top    : 20000000
> >>>>     alloc_top_hi : 20000000
> >>>>     nmo_top      : 20000000
> >>>>     ram_top      : 20000000
> >>>> Building dt strings...
> >>>> Building dt structure...
> >>>> reserved memory map:
> >>>>     00c40000 - 006c0000
> >>>> Device tree strings 0x01401000 -> 0x00000007
> >>>> Device tree struct 0x01402000 -> 0x00000007
> >>>> Quiescing Open Firmware ...
> >>>> Booting Linux via __start() @ 0x001400000
> >>>> ->dt_headr_start=3D0x01400000
> >>>>
> >>>> Thanks anyway,
> >>>>
