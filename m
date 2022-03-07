Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB95A4CFFAF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 14:11:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBzPC4mLcz3bfh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 00:11:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBzNj568Bz2xrj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 00:10:59 +1100 (AEDT)
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MWiYo-1ngjqx3lzE-00X0J3 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Mar
 2022 14:10:55 +0100
Received: by mail-wr1-f50.google.com with SMTP id j26so12827972wrb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Mar 2022 05:10:55 -0800 (PST)
X-Gm-Message-State: AOAM532nhpQO4eUtO5RLr7gOEF0cUdBU6GqCDLmaD/9ExuXFWx/Mt8+A
 jQmDVR7zk+y8aZzcupeRNcq7pztLs1F58vk4pQE=
X-Google-Smtp-Source: ABdhPJwTx34jmJfLDWjOnHVKhEip3RUgR+Mvrr67EPb6dzbty95WKubHaZ11Yl2wZxrMue9sQ0pwft5xMjMOGBUclZU=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr8692015wrh.407.1646658654942; Mon, 07
 Mar 2022 05:10:54 -0800 (PST)
MIME-Version: 1.0
References: <20220305123116.26828-1-yuehaibing@huawei.com>
 <860002a4-4e52-c399-fda6-054fa64df3ce@csgroup.eu>
In-Reply-To: <860002a4-4e52-c399-fda6-054fa64df3ce@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Mar 2022 14:10:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2p+Yryg1y5h=kTLP72WGYc2d4qctFuW+opR6F=1uYJPw@mail.gmail.com>
Message-ID: <CAK8P3a2p+Yryg1y5h=kTLP72WGYc2d4qctFuW+opR6F=1uYJPw@mail.gmail.com>
Subject: Re: [PATCH -next] powerpc/spufs: Fix build warning when
 CONFIG_PROC_FS=n
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7ksqIlYmSmOGSbm8LTfG8m8NKAfdVq6Lmhqrrji282F+ibzQh74
 8je1UyKvdOP8CUZNORgItOB9+VCJV1gRyokYTgN1QZ329Xag3TJuXe4CNoCogOM8bpx6SI2
 PkLDqgsKMg9aRTzYLWBahNxFce8OyuRDLTcCJZxHBAi0nX4NLh0tXCg2lYAbhSKkmfRDd2G
 qNQCE/oamgnz8iXrlrEjQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tx0snvrhp9Y=:iAKzaw9U4x+WxwAWfs6yw2
 cH+7TKTxCHcVC7uz17U0c9GTdAgReZKljcg+mUhcKpOQkdzbTcOBy3ZMU+H8yQDFvYTr01yEy
 FowXAdd9JRZZ42ndXFqz63e5pEGNhznq1XkB3peLJ6GoQdObsSorZj0xqueztC6M9Xazemn+E
 WOuyw/2rNlN9mLkeQzMuLIiYi4xw/OyLtc8bxGfuu8U2dYgJxqVJY13xZE/U65W4FrK5FVwht
 d28sDNtxHSZuvko8DL4ouruMOLLyRCoit052V5NZFFWVlIDplLpQzNGGzCBwBkACnuH0Jg4PV
 Kbd2LOH7nf738eArPtQnMgyYUf3a7p3ANoUAWHrW6oJsJ5u3oTZ9xFTNgNvCy3jSmbNtMya21
 1izZMxNs2BPs52bkG0M3YbfAfRWkLnHbjYyOV1rTiImxV/ee9uUPWhjfyi+2IkYKZPGDRjhmT
 XNJqRqWBdG7O/hRNWIeENGBl/caYO0d897qoo7PMlLGKkQzndAexv/xnBtsqGH7L7k2KiiPoR
 8CyMhTHUlw/sack004agmZP4sqrqzqELsfbOmSNgWxdFo3z16pimcnLFQuWeiupg4UXBhTaOI
 9WRLhDu4VoTWco+jbytIs7dBsmgdvw9T93KmHxO5llOuyqklxE1iBqqp3YGH35SpYL5uO/TDI
 RynO9QIx5NV+WoOEICYodiIl4MSlZxyN5Z1x2g7Hxcbetn8s8oVQ18YRhQuCjjq3ljJJOk3hW
 sFOchjC6iNRyptsMRRpBUO6UvAl1mAtIl4YFobgNOdmrYTayA4PnswClzmemmO7eYJczUQLjS
 D24WMwvt6QXBniZdbVLcqpZ/+zdtiv1yWBmqMK13omoz0w9daY=
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
Cc: "arnd@arndb.de" <arnd@arndb.de>, YueHaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paulus@samba.org" <paulus@samba.org>, "jk@ozlabs.org" <jk@ozlabs.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 6, 2022 at 9:04 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 05/03/2022 =C3=A0 13:31, YueHaibing a =C3=A9crit :
> > arch/powerpc/platforms/cell/spufs/sched.c:1055:12: warning: =E2=80=98sh=
ow_spu_loadavg=E2=80=99 defined but not used [-Wunused-function]
> >   static int show_spu_loadavg(struct seq_file *s, void *private)
> >              ^~~~~~~~~~~~~~~~
> >
> > Mark this as __maybe_unused to fix this.
>
> Marking it as __maybe_unused doesn't fix it. It just pushes the dust
> under the carpet.
>
> proc_create_single macro should be fix to avoid that warning.

We discussed that when proc_create_single() was introduced, but ended up
not doing it that way because there were already a lot of files using an #i=
fdef
around the function definitions. To change it back, one would have to audit
every user of proc_create_single() and remove the #ifdefs.

        Arnd
