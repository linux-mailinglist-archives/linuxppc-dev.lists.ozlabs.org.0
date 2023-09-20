Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 899FD7A778F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 11:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrCvb2s2fz3cg2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 19:31:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.169; helo=mail-yb1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrCv34HPRz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 19:30:39 +1000 (AEST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d8164e661abso6550749276.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 02:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695202236; x=1695807036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcKwdyW9PID8T3nWdTHS9gLtWKlKQ0LLCT75T/ZuZuw=;
        b=mFM48+UGmDeXkzuGve/tPtr9uyTEJ5gZe2aJy8zao7DK3CZJ9VjYudhME8EWs11JGd
         0qd9/rMUyl4vHdkj7v+NVk1OiQdaIowAeS4iI0bQaJMNbCxQkrJ8Y8DWR3Bepi5/hjP+
         AYCL6nLxwrXgRFhZ42Tll1Xl7TXJ9Z0GI1jmJOOVQYC2yp4yeB9oP9UC7LuuggNd3lKB
         6O5L/HVrwGvflWprAGHLv0iBbmOoxICpGTfVJZWzPem/EfuCofjxHG1ezsBJckd5DOgm
         ktPxssRTL2IlfVdjcvIEbLzP60bz23vuT1N+R3EzTtRNfR23uOkq6zqje8/H3SiPDXbX
         /nxg==
X-Gm-Message-State: AOJu0YxV6hmH5UEtSnGm1QOfwI6K71ICX1kSvHWz7gcE8Vvn9WX08B7Y
	S9T8P972rLsLXDkfm4gD7mOwXyjKgYtV3A==
X-Google-Smtp-Source: AGHT+IFfb+ar+WT8qIb4udZiXwXCfMHaIrQFYeo5E+pPfhK/9+5UBdwvhj3O2tWFhaK96JNZ7sDT8Q==
X-Received: by 2002:a25:734a:0:b0:d0a:da40:638e with SMTP id o71-20020a25734a000000b00d0ada40638emr2137591ybc.12.1695202236009;
        Wed, 20 Sep 2023 02:30:36 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id g13-20020a256b0d000000b00d749bc5b169sm2506606ybc.43.2023.09.20.02.30.35
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 02:30:35 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59c0281d72dso57414537b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 02:30:35 -0700 (PDT)
X-Received: by 2002:a0d:c705:0:b0:59c:1880:18e0 with SMTP id
 j5-20020a0dc705000000b0059c188018e0mr1688724ywd.21.1695202235254; Wed, 20 Sep
 2023 02:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230918175529.19011-1-peter@n8pjl.ca> <20230918234108.GN19790@gate.crashing.org>
 <20230919000026.7409-1-peter@n8pjl.ca> <20230919151630.GO19790@gate.crashing.org>
 <20230919155832.4179-1-peter@n8pjl.ca> <CAMuHMdXQ=xpeY3tmLXe1kgJbRtmVAn62rEhvzO+VB7GCgy4F8w@mail.gmail.com>
 <20230919161535.4774-1-peter@n8pjl.ca>
In-Reply-To: <20230919161535.4774-1-peter@n8pjl.ca>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Sep 2023 11:30:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQwDzAnbQvBvt3iuL=UPxtufU=TgQM=oKjDvmgmrcy3g@mail.gmail.com>
Message-ID: <CAMuHMdWQwDzAnbQvBvt3iuL=UPxtufU=TgQM=oKjDvmgmrcy3g@mail.gmail.com>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
To: Peter Lafreniere <peter@n8pjl.ca>
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
Cc: linux-m68k@vger.kernel.org, tsbogend@alpha.franken.de, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-sh@vger.kernel.org, richard.henderson@linaro.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, richard@nod.at, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,

On Tue, Sep 19, 2023 at 6:16=E2=80=AFPM Peter Lafreniere <peter@n8pjl.ca> w=
rote:
> On Tue, Sep 19, 2023 at 12:02, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > On Tue, Sep 19, 2023 at 5:58=E2=80=AFPM Peter Lafreniere peter@n8pjl.ca=
 wrote:
> > > 2) Stops building an obsolete and largely-unused filesystem unnecessa=
rily.
> > > Some hobbyist targets like m68k and alpha may prefer to keep all file=
systems
> > > available until total removal, but others like arm and UML have no ne=
ed for
> > > ReiserFS to be built unless specifically configured.
> >
> >
> > As UML is used a lot for testing, isn't it actually counter-productive
> > to remove ReiserFS from the UML defconfig? The less testing it
> > receives, the higher the chance of introducing regressions.
>
> UML is used for testing, but in my view that makes the inclusion of
> ReiserFS in its defconfig even worse. Users of UML are trying to test a

Why?
Because you want to avoid doing any testing at all on deprecated features?

> particular function, and so tend to use ext[2-4], as those are included i=
n
> the defconfig and are well tested and stable. So there is no extra testin=
g
> being done on ReiserFS due to its inclusion in the defconfig.

I'd expect global file system testers to use something along the line of:

    for i in $(grep -v nodev /proc/filesystems ); do
        echo --- Testing $i ---
        dd if=3D/dev/zero of=3Dtestimage bs=3D1M count=3D1 seek=3D10000
        mkfs.$i testimage
        mount testimage /mnt -t $i
        [run xfstests on testimage]
        rm -f testimage
    done

> Keeping UML's defconfig as slim as possible improves build times, which i=
s
> particularly important for kernel testing and development.

Good luck testing all functionality using a "slim" kernel ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
