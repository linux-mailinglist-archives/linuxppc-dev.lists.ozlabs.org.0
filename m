Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA463BD07
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 10:35:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLxyK3dNpz3bW6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 20:35:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=xVQmEFZ1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.83; helo=conssluserg-04.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=xVQmEFZ1;
	dkim-atps=neutral
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLxxP4jjtz2yxB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 20:34:17 +1100 (AEDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 2AT9Xv7S020023
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 18:33:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 2AT9Xv7S020023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1669714438;
	bh=W7/cBOhC6ZWzKLNByGDtoOjb1UE7rlpyI0vm5uWvnSw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=xVQmEFZ1CE9o3mHpfyU7Q+Ga+U8knXckkKGGpOLb/IMTb3Pq5j40cX2JZGWtePMtv
	 LJ/6uv1ZyZtlYT4A1tLP2TQi7vUr/Mh7yJTQVrTZ9QQmsYK2JjqabOpHK++rNGXIy8
	 fQWTIqVvpGcPthYl9m7iucm5qqFiSi9466FoCNZod759lFHpJU/AFK3sP52RjlvXmJ
	 V2GTEvMwhP7tOhhyZG1Ilcr9XnqOvPQTyfvZ6L/lIWu3ZHKHoNhmsgM3J+tr0yJpeJ
	 hR2PB0sEYSTfg8qGivjnm1T/kNjwQsIx87ChVX3I1jolT35Xho+tvi8/+4yfg288O4
	 DhlErQTSCiVgw==
X-Nifty-SrcIP: [209.85.167.180]
Received: by mail-oi1-f180.google.com with SMTP id m204so14544848oib.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 01:33:58 -0800 (PST)
X-Gm-Message-State: ANoB5pm2a5XKQPx0K4VAYW6RfN39Sd65x9Vg3g5A/QBSmc0yFZnlNrzL
	b4Ts8YCc1FfkJHXN9O7KTMBmjykdFFcVNMZq8sM=
X-Google-Smtp-Source: AA0mqf7vHeDdYzAXYz0tuXeexOFIFTJiCn/xCThNETAbcH1WOB0n2+wXfFWCa2ytnJNfBnXFSmMWIjoKu/QkpHjK1B8=
X-Received: by 2002:a05:6808:3009:b0:354:94a6:a721 with SMTP id
 ay9-20020a056808300900b0035494a6a721mr17933150oib.194.1669714437267; Tue, 29
 Nov 2022 01:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20221126051002.123199-1-linux@weissschuh.net> <20221126051002.123199-3-linux@weissschuh.net>
 <CAK7LNAREVSp_5d1SaFOLyBHJJrJ6zE_qxSYWAFFnfoz3d0w3-Q@mail.gmail.com>
In-Reply-To: <CAK7LNAREVSp_5d1SaFOLyBHJJrJ6zE_qxSYWAFFnfoz3d0w3-Q@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Nov 2022 18:33:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmk3_L3_QwpsBR_uKN+3kE8F5h-QdOGLz8WOSx05CFRg@mail.gmail.com>
Message-ID: <CAK7LNAQmk3_L3_QwpsBR_uKN+3kE8F5h-QdOGLz8WOSx05CFRg@mail.gmail.com>
Subject: Re: [PATCH 3/3] init/version.c: remove #include <generated/utsversion.h>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
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
Cc: Russ Weight <russell.h.weight@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 27, 2022 at 7:18 AM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> On Sat, Nov 26, 2022 at 2:10 PM Thomas Wei=C3=9Fschuh <linux@weissschuh.n=
et> wrote:
> >
> > Commit 2df8220cc511 ("kbuild: build init/built-in.a just once") moved
> > the usage of the define UTS_VERSION to the file version-timestamp.c.
>
> With s/UTS_VERSION/UTS_RELEASE/,
>
>
> Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>
>
> >
> > version-timestamp.c in turn is included from version.c but already
> > includes utsversion.h itself properly.
> >
> > The unneeded include of utsversion.h from version.c can be dropped.
> >
> > Fixes: 2df8220cc511 ("kbuild: build init/built-in.a just once")
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > ---
> >  init/version.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/init/version.c b/init/version.c
> > index 01d4ab05f0ba..f117921811b4 100644
> > --- a/init/version.c
> > +++ b/init/version.c
> > @@ -15,7 +15,6 @@
> >  #include <linux/printk.h>
> >  #include <linux/uts.h>
> >  #include <linux/utsname.h>
> > -#include <generated/utsrelease.h>
> >  #include <linux/proc_ns.h>
> >
> >  static int __init early_hostname(char *arg)
> > --
> > 2.38.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada



This patch is so confusing because the subject is also wrong.



I fixed up the commit description:



    init/version.c: remove #include <generated/utsrelease.h>

    Commit 2df8220cc511 ("kbuild: build init/built-in.a just once") moved
    the usage of the define UTS_RELEASE to the file version-timestamp.c.

    version-timestamp.c in turn is included from version.c but already
    includes utsrelease.h itself properly.

    The unneeded include of utsrelease.h from version.c can be dropped.

    Fixes: 2df8220cc511 ("kbuild: build init/built-in.a just once")
    Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
    Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>



Applied to linux-kbuild.
Thanks.






--=20
Best Regards
Masahiro Yamada
