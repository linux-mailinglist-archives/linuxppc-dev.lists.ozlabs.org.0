Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A3A4764E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 22:50:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDpnl2t9qz3cVC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 08:50:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDpnJ00G5z2ynd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 08:49:54 +1100 (AEDT)
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MzCMN-1mbQOz1Od9-00wF67 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec
 2021 22:49:50 +0100
Received: by mail-wr1-f43.google.com with SMTP id t18so40500538wrg.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 13:49:50 -0800 (PST)
X-Gm-Message-State: AOAM532mgJUUE684GneKSg3bRtMA7oG/O/hNHvLl0g/xCG0YH+08vH3b
 T6pswjK25VlhbMpp4M/zDVzL6O1KEbUAKCSdwVo=
X-Google-Smtp-Source: ABdhPJyI4sFfqi3WV9r3gOmk1U//npIrS4nf8wBAkc7GviXMWmaD3dsHGyhZUXFZ+uysDsSwkLsuIqVlj3CoEC95hIQ=
X-Received: by 2002:a5d:530e:: with SMTP id e14mr6188596wrv.12.1639604979240; 
 Wed, 15 Dec 2021 13:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
 <CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
 <CA+zEjCtajRJhs8zSdR_oFBOO3P5FWWZJ3L6N-GK+JnUjdymTiA@mail.gmail.com>
In-Reply-To: <CA+zEjCtajRJhs8zSdR_oFBOO3P5FWWZJ3L6N-GK+JnUjdymTiA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Dec 2021 22:49:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3aJJYcONV9JMcn47=mW4P4kvYFdwnTdyZfRqeo+eGndQ@mail.gmail.com>
Message-ID: <CAK8P3a3aJJYcONV9JMcn47=mW4P4kvYFdwnTdyZfRqeo+eGndQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] Cleanup after removal of configs
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:t91Z4ZWXMcSfWObWkZkyVr2AwK893zXFG3BhpSLTK0TBpOX7o20
 ZKl1OGzJkhW/Ec4h7JJ42t2LNY0S8H9OdQfqwIqcw0YCaUY7HHm/TIrGvNgDxWwqTqlovHq
 +Wm28Sgy3uhe/PyMN4lL0CjRByb3CG8OksSnrLXzdwj2svCEpUU3f2isuzA15lvgzvNjQjy
 OWazVxfitseYX3Vcuo1yw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4oGRvZjt+9U=:uLYibXEpIWC/lqQMm4DjLX
 g4e/IiuDJv492iz/Mjl3n30ef/kPH1ind+gWUMQL0NzfiwS6SnPgr+4Z9pYJyYHTJlnufxE+2
 KFxAHzqGuW3nYsn/PnN92M8mkx0aXY4C1a4aA4VF9NmuTo33CW2HbY1V227JWND9rtcVPdkbr
 8B67CrZD46/mTw1Nde1aot2kqXY8baTsc4N/Ty4faW7AglppYEAW/GQEO4U1RQbsBwv2MHJoB
 vYFyTbmw4gi4pOytGhKwduSIbmjCigCEM2pq2i3qj0FJJUFQW2hR+K5O+KDnKOo8zENFgZeCK
 OqbzxWRAx/YyDQZNJEteVqBZ7w1oEE3EEvivOHliTrJcGP34Uo/Kb6985skORSztsiqu441kv
 T1Gg3YLb4zIRMmt6jR7DJmqvC5hKn4eNGDz4/7x6B74Rab8Ggwn0pKI/uQSflYcix4HhRfrPk
 Ci7o/Xp+tmhD28QPA2nhBGDVVePsnyANQGZXt+KCE8CX3X5fohiJNVefRmITNP18aE7HY8ef6
 PHjsXrGievXgkWwj859tIGVovzWwcTn0Uoio53TJ64dkoTHWRX1XQ1LW5iIPxKjrxw9r1cuwE
 tiuQlCGCS2+AGV4wO8LcqwDaWfBuMW57lOQbYcavUwiB5esnHUSaq9L6CRUKzYucyYxnStV9w
 682BHBMkgop/Zoe49ermEazZnkmfH25Wvlwv0HAymC4GzHZMQp1BHfWwEf5NEC2djl7n1V7TT
 oN1X6wSEB52Adclt6yqGSw8a20gQIwtLq3ZVfinZzEGWHjpaecBoZbaN0gjIyXsbvjuOcrXYZ
 pf5lhFmZ28/16bNqv9J/gtC0eVtmoUzWqSOhoIZe+rdTJluY7Q=
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 samba-technical@lists.samba.org, Lee Jones <lee.jones@linaro.org>,
 linux-cifs@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jonathan Corbet <corbet@lwn.net>, Linux-sh list <linux-sh@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-cachefs@redhat.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Arnd Bergmann <arnd@arndb.de>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Kalle Valo <kvalo@codeaurora.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-power@fi.rohmeurope.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 10, 2021 at 9:38 PM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> On Fri, Nov 5, 2021 at 4:56 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, Nov 5, 2021 at 4:43 PM Alexandre Ghiti
> > <alexandre.ghiti@canonical.com> wrote:
> > >
> > > While bumping from 5.13 to 5.15, I found that a few deleted configs had
> > > left some pieces here and there: this patchset cleans that.
> > >
> > > Alexandre Ghiti (7):
> > >   Documentation, arch: Remove leftovers from fscache/cachefiles
> > >     histograms
> > >   Documentation, arch: Remove leftovers from raw device
> > >   Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
> > >   arch: Remove leftovers from mandatory file locking
> > >   Documentation, arch, fs: Remove leftovers from fscache object list
> > >   include: mfd: Remove leftovers from bd70528 watchdog
> > >   arch: Remove leftovers from prism54 wireless driver
> >
> > Looks all good to me, thanks a lot for the cleanup!
> >
> > For arch/arm/configs:
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> > assuming this goes through someone else's tree. Let me know if you need me
> > to pick up the patches in the asm-generic tree for cross-architecture work.
>
> Arnd, do you mind taking the whole series except patch 6 ("include:
> mfd: Remove leftovers from bd70528 watchdog") as this will be handled
> separately. I can ask Jonathan for the doc patches if needed.

I tried to apply them, but only three of the patches applied cleanly. Can you
resend them based on v5.16-rc1?

        Arnd
