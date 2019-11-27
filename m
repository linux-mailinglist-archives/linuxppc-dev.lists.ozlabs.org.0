Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED6E10AF75
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 13:20:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NKbS2yGhzDqpq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 23:20:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NHvC5SzJzDqnl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 22:03:34 +1100 (AEDT)
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MHX7f-1iec532t1d-00DZp9 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov
 2019 12:03:28 +0100
Received: by mail-qv1-f43.google.com with SMTP id cg2so8667312qvb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 03:03:27 -0800 (PST)
X-Gm-Message-State: APjAAAVqMVdhrALfVGr7vqHCoZthS5XDwou1Gp458kFJgJCeaBDjpJy9
 71fUUljWfeLdPpZKvP951xnR+Cw9vIdBNhpalec=
X-Google-Smtp-Source: APXvYqwmp0jMVDNBAg5Ce+DrmGPMsvhfoXfGimwzPrdDUyP5QLgu2P8EbsdO2pJC6f5IQpMB/jWTwEPfCh84ScTptRw=
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr4010401qvp.210.1574852606738; 
 Wed, 27 Nov 2019 03:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20191108210236.1296047-1-arnd@arndb.de>
 <20191108210824.1534248-7-arnd@arndb.de>
 <4faa78cd0a86cf5d0aea9bb16d03145c5745450b.camel@codethink.co.uk>
 <CAK8P3a1nRq98ngfKnR2Du+7_vOxSRFD9AyjHyUCsAtk_gLR_Uw@mail.gmail.com>
 <20191121172529.Horde.0uDMS4xQ-xexjp4a2mIoXQ5@messagerie.si.c-s.fr>
In-Reply-To: <20191121172529.Horde.0uDMS4xQ-xexjp4a2mIoXQ5@messagerie.si.c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 Nov 2019 12:03:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1UmAYTx=Vv06xP=O-oYD8_HzNqMG0-p7GPP2xgzs+75w@mail.gmail.com>
Message-ID: <CAK8P3a1UmAYTx=Vv06xP=O-oYD8_HzNqMG0-p7GPP2xgzs+75w@mail.gmail.com>
Subject: Re: [Y2038] [PATCH 07/23] y2038: vdso: powerpc: avoid timespec
 references
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5ZafE7vAppUM+8GJ4+LBoM1wzpoHUdnkO5cgubieWisQZAJhax5
 zRIkw/n3ofgvC6e9EqRtOlTcH9Kje2f3KmqV64lTPvia1UY+raZtXR189tQ84JEnEPdJNMw
 TAfEGN+3ltyu3FYDwAx0kgT6WVfeKB4oShn6ETugj9vG1RgE11boKcKJXwN16thN5ZNbxjE
 EKVK8mV4vLPzFXvLcJqXg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z2vmUMmsBgQ=:is/80JWQBXzkwiXLfpoeTB
 pxWTKSNk/PMt/6FFCZ5xfb2OGBOrm03/ICL1uSU5tQFt/cR55D34jPN2W1fStaSKXHCLP0pWr
 OkDsL2Ei1Cl1gthGcertxT68KD5SuEk98AoZF1mNMxVwjX1ZMA+D5Y4vhcgKvnYYVzZfueZ7i
 0k5Qgh1f2rCAvs8JSQ+iTj4w0IAPA0zC9YHOESjQRsGUPlnB35+R+taHAoYDYgvE1LL7XHx0g
 Mu/yO8t4WOVW4ZlaGw72srGZw5IoM3WjkmXRs/8c6m9EI0BSt9/t4hHx6InXb6dQ375aHSBb9
 O1co1b1RAD3mqRp7YPO3WXtvlJKdfmZEQwUUZk1rmr7i/JTYersG/TPmsHEspGPewNKqxyTEh
 eNLs0ZL6BuEDlGTJqU82HZGWniJ7kymmcHyHzVYk+J59ky+h3vInI7MA6EhtUxMmpvQsbTpdj
 OndL4PmEaOrxMxM6tGHUACtjR3ZvRRV+r1f+JUmL3kDKRDBKPrFfaqZ49XaHtanHqMrxBdxXw
 n6xwnnoeReevishwMar3VpBLo5PWL8TubQBvZ3Umfacb7bVUXOodwUff4+GUehplK8snYvQZA
 uE/ls04QcznLwuI4rz+dMheeWFNOXmbxSX1/OWN0bwEFTFB3aAbzZihWcgf780HQNTzeucH7V
 sryfdpati5u2jNsbXguXRBI13IbbPq25+PyCSid8nhdpMBUf4V5OE1pYwum6Q0hAQaZ1rbvWD
 d+BsG/k47LSW7JZ/rI/YIpuokZXiV8FBoI6GmN/gqFpbrrRSOmLGQraINrWXeohM7im3Um8hJ
 2p4XLwiWRwoUWRkpeTa5AALFZJXmj8DykfOCA8U3b8h+A9JBUt4cBb11hmE3zVTWKOlLzvmmI
 UB/PXlk3gHy/9APKFA9Q==
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
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 21, 2019 at 5:25 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
> Arnd Bergmann <arnd@arndb.de> a =C3=A9crit :
> > On Wed, Nov 20, 2019 at 11:43 PM Ben Hutchings
> > <ben.hutchings@codethink.co.uk> wrote:
> >>
> >> On Fri, 2019-11-08 at 22:07 +0100, Arnd Bergmann wrote:
> >> > @@ -192,7 +190,7 @@ V_FUNCTION_BEGIN(__kernel_time)
> >> >       bl      __get_datapage@local
> >> >       mr      r9, r3                  /* datapage ptr in r9 */
> >> >
> >> > -     lwz     r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
> >> > +     lwz     r3,STAMP_XTIME_SEC+LOWPART(r9)
> >>
> >> "LOWPART" should be "LOPART".
> >>
> >
> > Thanks, fixed both instances in a patch on top now. I considered foldin=
g
> > it into the original patch, but as it's close to the merge window I'd
> > rather not rebase it, and this way I also give you credit for
> > finding the bug.
>
> Take care, might conflict with
> https://github.com/linuxppc/linux/commit/5e381d727fe8834ca5a126f510194a7a=
4ac6dd3a

Sorry for my late reply. I see this commit and no other variant of it has
made it into linux-next by now, so I assume this is not getting sent for v5=
.5
and it's not stopping me from sending my own pull request.

Please let me know if I missed something and this will cause problems.

On a related note: are you still working on the generic lib/vdso support fo=
r
powerpc? Without that, future libc implementations that use 64-bit time_t
will have to use the slow clock_gettime64 syscall instead of the vdso,
which has a significant performance impact.

       Arnd
