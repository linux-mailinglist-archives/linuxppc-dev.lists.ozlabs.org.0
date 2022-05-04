Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C0519EC1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 14:00:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktb4n3ST9z3brp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:00:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktb4J5yL1z3bXw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 22:00:15 +1000 (AEST)
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MkYHO-1oFSpG0Xbq-00m6Zu for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 May
 2022 14:00:12 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so3066014wmb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 May 2022 05:00:11 -0700 (PDT)
X-Gm-Message-State: AOAM530Lkuha6NDAGA0wPBS8eXM8Du49ETkz4Mnk2sIol7plyLIt1fMq
 IsILWtbGU4XAM/CzVje7ClCHoL3IapOu+Y7LyK4=
X-Google-Smtp-Source: ABdhPJxa91M6kOpYUD0iTKIgWao6CfWQbX+SRQAAcnEVkI7cNck+veUzwJT66OrSTBCPZk65kSjp++m9nNZ6refLZnU=
X-Received: by 2002:a7b:cc93:0:b0:394:2622:fcd9 with SMTP id
 p19-20020a7bcc93000000b003942622fcd9mr7695473wma.20.1651665611020; Wed, 04
 May 2022 05:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
 <CAK8P3a0hy8Ras7pwF9rJADtCAfeV49K7GWkftJnzqeGiQ6j-zA@mail.gmail.com>
 <ca39c741-8d15-33c0-7bd6-635778cc436@linux.intel.com>
In-Reply-To: <ca39c741-8d15-33c0-7bd6-635778cc436@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 4 May 2022 13:59:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a33b4KvsGayDV7fXte0+1FzCJp_J60d8LuZO3P+i1NUEg@mail.gmail.com>
Message-ID: <CAK8P3a33b4KvsGayDV7fXte0+1FzCJp_J60d8LuZO3P+i1NUEg@mail.gmail.com>
Subject: Re: [PATCH 1/1] termbits: Convert octal defines to hex
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p/khEQhr+KEzvSF8sIYD6kUjQaSMzGrXHb8VQmkc1hj8fkba+Ks
 k34RZi07YfCbeqEv+K0+nzDyuNQRHDDpjKN9+hGLcxGz1u80OiZjrJxiGNRgmyO92bKDjc4
 GcCBhi9EHvcMf55IioThJpBh7egdJebz3hGHQh8NAPChxHoUwcdmC5jnwrJsi96GmZX8CpZ
 Kv7o2FAqGRXHAQleQfDsg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p9rdL/p3kqk=:tKbtsqtoerkNV3p+3DiyoH
 7cfO942Iy/8ZwqRfEu60oe2tL7EGM3fimTL9ifjCr50numDlFuhYVBihIu2j+TR3UgoE4Bpo+
 JgQ/T7z6LoG0L8evFkF7eQ9GoZP2stSO8drHxwqTf6EOqqF481cPPdoyWgfYQMxXI6/GzD0ui
 Xch7psgJ/sIp0x98dzjd02Ql/usSVZpFyNTyj1SnQFljv5rOkaGj5+40lYyERaIwme+jUTlJ8
 3NDPeSEOOnv0M0SR6HeBoFKUtgwUxiSz8XPtE5rqEX6GIrITLGs+POZRDGb1naCJaK3GNNtn4
 tGb15Mj4vu0AW62BReT26nK/vhbLhXG8S0XpNugYdi1QEDmOKtGcDJ1YV9XwlcgFGxZtW63QI
 wcrXnpS+QWaS3ylUhvEHIvvxpG2iuwYGsIPYRYKZLI5h+ng6+WC8TGi+KqAYo+kbYE/oQGhUE
 07oUtGMw5I307APEgL6fCAEoQEWxl5OXArZ7emXh0mfzj4ihGykMNM/XbyA6qmYR+fuSWqASt
 80mLxfx2vYJGu4NfwYvI+NYu26pvhvp0yFp4AmMT6WpncCw1OmgIY8VxPekN/D1WKw8K7ql9f
 A6ULPcfyDrwuGXhmw6OditMPnK3BMiOrAulujtKOywdobd89cmI7qgN0GkGjYKjf7CJNVVF+F
 xtR+qthLP6O2g0iqt2KRsaJ/ajQ5ybt9/OFCxLr1lQDrnl+59qR55jA+wL+jG//dlhTA=
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 alpha <linux-alpha@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-serial <linux-serial@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Matt Turner <mattst88@gmail.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 4, 2022 at 10:33 AM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Wed, 4 May 2022, Arnd Bergmann wrote:
> > On Wed, May 4, 2022 at 9:20 AM Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.=
intel.com> wrote:
> > >
> > After applying the patch locally, I still see a bunch of whitespace
> > differences in the
> > changed lines if I run
> >
> > vimdiff arch/*/include/uapi/asm/termbits.h include/uapi/asm-generic/ter=
mbits.h
> >
> > I think this mostly because you left the sparc version alone (it alread=
y
> > uses hex constants), but it may be nice to edit this a little more to
> > make the actual differences stick out more.
>
> I took a look on further harmonizing, however, it turned out to be not
> that simple. This is basically the pipeline I use to further cleanup the
> differences and remove comments if you want to play yourself, just remove
> stages from the tail to get the intermediate datas (gawk is required for
> --non-decimal-data):

I've played around with it some more to adjust the number of leading
zeroes and the type of whitespace. This is what I ended up with on top
of your patch: https://pastebin.com/raw/pkDPaKN1

Feel free to fold it into yours.

        Arnd
