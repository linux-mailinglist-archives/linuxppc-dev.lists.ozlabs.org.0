Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C402386C1E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 23:12:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464Lfc43pBzDqXK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 07:12:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.208.194; helo=mail-lj1-f194.google.com;
 envelope-from=valentin.longchamp@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=longchamp.me
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464LcF0nzZzDqpR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 07:10:04 +1000 (AEST)
Received: by mail-lj1-f194.google.com with SMTP id p17so90227521ljg.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2019 14:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=evKrNs0X1uQHFupHQ4e1H+JbvwSVldaodvk2360XbX8=;
 b=i5ueie3yssKxNNb3iw23uhhtV7oxzjYldkQx77iMSxmD+AEVhVw2rEe+PIa2xhqUBO
 YU8XhnLku8TinCoNU9N63ViarI8ma5i8Zhqj1NAmjBEcED8joG4eIPQCf2eo4+JkdJLa
 asMu5e3+hUskb8XzJ7ACgqW6lleWu9x1OaYV73AgAvAmp77lod1AUtMs2igKN2G2AqSq
 M4xb0d7v+MI80JmzSbAw+7y/7aLA8ttTKTAynxykeLF1MDvbuwOLXrvvm4WQvGc+CzX8
 72DeD8Hu5LDJx8PosBdcxlGQ44N+JhMLWITfAFhfIILnndVUbfqHxq+BFJxJ4kNjg0mG
 wffw==
X-Gm-Message-State: APjAAAVq7vtX6qmsMzzO8f9++Tct5DebSH9XtEA5ff+QyFBU4QQafiGh
 3LlyJLDtL2eNf6Q4oV/wZ/nRt3OA8y8=
X-Google-Smtp-Source: APXvYqxFm9G29l79PwlgCEYQVxpnhfrc778GBmFE5Q33/zxhqoWU6sWIGt1p9VAUERntQXrgdTcODA==
X-Received: by 2002:a2e:8085:: with SMTP id i5mr1331909ljg.23.1565298600176;
 Thu, 08 Aug 2019 14:10:00 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id p5sm4243019lfk.95.2019.08.08.14.09.59
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 14:09:59 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id x3so14124123lfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2019 14:09:59 -0700 (PDT)
X-Received: by 2002:a19:cbc4:: with SMTP id b187mr10182066lfg.27.1565298599300; 
 Thu, 08 Aug 2019 14:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190714200501.1276-1-valentin@longchamp.me>
 <CADYrJDwvwVThmOwHZ4Moqenf=-iqoHC+yJ_uxtrD8sDso33rjg@mail.gmail.com>
 <2243421e574c72c5e75d27cc0122338e2e0bde63.camel@buserror.net>
 <VI1PR04MB55679AAE8DDC3160B9CCE073ECDC0@VI1PR04MB5567.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB55679AAE8DDC3160B9CCE073ECDC0@VI1PR04MB5567.eurprd04.prod.outlook.com>
From: Valentin Longchamp <valentin@longchamp.me>
Date: Thu, 8 Aug 2019 23:09:49 +0200
X-Gmail-Original-Message-ID: <CADYrJDxsQ3H7b_BHOfmfTNb1OuXt+vzTg4k8Goj8tKPaaOMz_g@mail.gmail.com>
Message-ID: <CADYrJDxsQ3H7b_BHOfmfTNb1OuXt+vzTg4k8Goj8tKPaaOMz_g@mail.gmail.com>
Subject: Re: [PATCH] powerpc/kmcent2: update the ethernet devices' phy
 properties
To: Madalin-cristian Bucur <madalin.bucur@nxp.com>
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
Cc: Scott Wood <oss@buserror.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le mar. 30 juil. 2019 =C3=A0 11:44, Madalin-cristian Bucur
<madalin.bucur@nxp.com> a =C3=A9crit :
>
> > -----Original Message-----
> >
> > > Le dim. 14 juil. 2019 =C3=A0 22:05, Valentin Longchamp
> > > <valentin@longchamp.me> a =C3=A9crit :
> > > >
> > > > Change all phy-connection-type properties to phy-mode that are bett=
er
> > > > supported by the fman driver.
> > > >
> > > > Use the more readable fixed-link node for the 2 sgmii links.
> > > >
> > > > Change the RGMII link to rgmii-id as the clock delays are added by =
the
> > > > phy.
> > > >
> > > > Signed-off-by: Valentin Longchamp <valentin@longchamp.me>
> >
> > I don't see any other uses of phy-mode in arch/powerpc/boot/dts/fsl, an=
d I see
> > lots of phy-connection-type with fman.  Madalin, does this patch look O=
K?
> >
> > -Scott
>
> Hi,
>
> we are using "phy-connection-type" not "phy-mode" for the NXP (former Fre=
escale)
> DPAA platforms. While the two seem to be interchangeable ("phy-mode" seem=
s to be
> more recent, looking at the device tree bindings), the driver code in Lin=
ux seems
> to use one or the other, not both so one should stick with the variant th=
e driver
> is using. To make things more complex, there may be dependencies in bootl=
oaders,
> I see code in u-boot using only "phy-connection-type" or only "phy-mode".
>
> I'd leave "phy-connection-type" as is.

So I have finally had time to have a look and now I understand what
happens. You are right, there are bootloader dependencies: u-boot
calls fdt_fixup_phy_connection() that somehow in our case adds (or
changes if already in the device tree) the phy-connection-type
property to a wrong value ! By having a phy-mode in the device tree,
that is not changed by u-boot and by chance picked up by the kernel
fman driver (of_get_phy_mode() ) over phy-connection-mode, the below
patch fixes it for us.

I agree with you, it's not correct to have both phy-connection-type
and phy-mode. Ideally, u-boot on the board should be reworked so that
it does not perform the above wrong fixup. However, in an "unfixed"
.dtb (I have disabled fdt_fixup_phy_connection), the device tree in
the end only has either phy-connection-type or phy-mode, according to
what was chosen in the .dts file. And the fman driver works well with
both (thanks to the call to of_get_phy_mode() ). I would therefore
argue that even if all other DPAA platforms use phy-connection-type,
phy-mode is valid as well. (Furthermore we already have hundreds of
such boards in the field and we don't really support "remote" u-boot
update, so the u-boot fix is going to be difficult for us to pull).

Valentin

>
> Madalin
>
> > > > ---
> > > >  arch/powerpc/boot/dts/fsl/kmcent2.dts | 16 +++++++++++-----
> > > >  1 file changed, 11 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/arch/powerpc/boot/dts/fsl/kmcent2.dts
> > > > b/arch/powerpc/boot/dts/fsl/kmcent2.dts
> > > > index 48b7f9797124..c3e0741cafb1 100644
> > > > --- a/arch/powerpc/boot/dts/fsl/kmcent2.dts
> > > > +++ b/arch/powerpc/boot/dts/fsl/kmcent2.dts
> > > > @@ -210,13 +210,19 @@
> > > >
> > > >                 fman@400000 {
> > > >                         ethernet@e0000 {
> > > > -                               fixed-link =3D <0 1 1000 0 0>;
> > > > -                               phy-connection-type =3D "sgmii";
> > > > +                               phy-mode =3D "sgmii";
> > > > +                               fixed-link {
> > > > +                                       speed =3D <1000>;
> > > > +                                       full-duplex;
> > > > +                               };
> > > >                         };
> > > >
> > > >                         ethernet@e2000 {
> > > > -                               fixed-link =3D <1 1 1000 0 0>;
> > > > -                               phy-connection-type =3D "sgmii";
> > > > +                               phy-mode =3D "sgmii";
> > > > +                               fixed-link {
> > > > +                                       speed =3D <1000>;
> > > > +                                       full-duplex;
> > > > +                               };
> > > >                         };
> > > >
> > > >                         ethernet@e4000 {
> > > > @@ -229,7 +235,7 @@
> > > >
> > > >                         ethernet@e8000 {
> > > >                                 phy-handle =3D <&front_phy>;
> > > > -                               phy-connection-type =3D "rgmii";
> > > > +                               phy-mode =3D "rgmii-id";
> > > >                         };
> > > >
> > > >                         mdio0: mdio@fc000 {
> > > > --
> > > > 2.17.1
> > > >
> > >
> > >
>
