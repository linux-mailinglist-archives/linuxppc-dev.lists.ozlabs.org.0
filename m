Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F84678181
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2019 22:28:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xZC85qNXzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 06:28:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xZ9953v5zDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 06:26:37 +1000 (AEST)
Received: by mail-lj1-f194.google.com with SMTP id m23so56404196lje.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 13:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xbgnZfEJSXYEqeGOYWZYFmzEbI2Hf2xWozhS6zkHcHE=;
 b=S1W/038aFScnoujkQeAJP89pYsdFgIHq2Q+uWpz5MIVJUm5HDc1Dnb+zqc9Z/rhHw4
 2Qo28IAGGI3l2QFnuNmt/N9CeD3ZtGPwhZMIyfbDL4kM9CJhgRZ6GoRWXMGSY3jrIwJS
 89KD73SPBe7BmuO9dASkpCMcA0Q3T2xcld8fZ7wn6xD9e+2ro8ugKXN+YRYbl95FBzGm
 jAIywD+JB+VRX+do2OfbN+Q9kDS6rPnrUTRS8YvFNkTGw6Iy/jBOWKHwRehkWg/MZSZD
 r8m2/p+Lajr4FLE8WqwQ+OhbcSu0b6YHWtdjvQcTgj3KQcWfcNli4+bbTTLcuSPlMZ32
 k5eQ==
X-Gm-Message-State: APjAAAUmw8jilia4qHaZjK8zjao1OmeyZ0325HsSEy8Q3pIexDHMMwfH
 IwnfZQtT6pEHti+c74NhrhE+OTxPlTU=
X-Google-Smtp-Source: APXvYqy/92ICKb7ai2UK+wY98lhxpOv04Ybz2fJc1DOknjfmHWKSLr2TRIK5/W/gH+vNHHKq6jXgXA==
X-Received: by 2002:a2e:25a:: with SMTP id 87mr56359231ljc.183.1564345593874; 
 Sun, 28 Jul 2019 13:26:33 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id 199sm12378868ljf.44.2019.07.28.13.26.32
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2019 13:26:32 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id m23so56404152lje.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 13:26:32 -0700 (PDT)
X-Received: by 2002:a2e:9003:: with SMTP id h3mr52948428ljg.194.1564345592515; 
 Sun, 28 Jul 2019 13:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190714200501.1276-1-valentin@longchamp.me>
 <CADYrJDwvwVThmOwHZ4Moqenf=-iqoHC+yJ_uxtrD8sDso33rjg@mail.gmail.com>
 <2243421e574c72c5e75d27cc0122338e2e0bde63.camel@buserror.net>
In-Reply-To: <2243421e574c72c5e75d27cc0122338e2e0bde63.camel@buserror.net>
From: Valentin Longchamp <valentin@longchamp.me>
Date: Sun, 28 Jul 2019 22:26:21 +0200
X-Gmail-Original-Message-ID: <CADYrJDxpYm+Z39iZk-k5U7=bK7BY4xcbwsC+wRRFo6cteHeQ=A@mail.gmail.com>
Message-ID: <CADYrJDxpYm+Z39iZk-k5U7=bK7BY4xcbwsC+wRRFo6cteHeQ=A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/kmcent2: update the ethernet devices' phy
 properties
To: Scott Wood <oss@buserror.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, Madalin Bucur <madalin.bucur@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le dim. 28 juil. 2019 =C3=A0 21:26, Scott Wood <oss@buserror.net> a =C3=A9c=
rit :
> On Sun, 2019-07-28 at 18:01 +0200, Valentin Longchamp wrote:
> > Le dim. 14 juil. 2019 =C3=A0 22:05, Valentin Longchamp
> > <valentin@longchamp.me> a =C3=A9crit :
> > >
> > > Change all phy-connection-type properties to phy-mode that are better
> > > supported by the fman driver.
> > >
> > > Use the more readable fixed-link node for the 2 sgmii links.
> > >
> > > Change the RGMII link to rgmii-id as the clock delays are added by th=
e
> > > phy.
> > >
> > > Signed-off-by: Valentin Longchamp <valentin@longchamp.me>
>
> I don't see any other uses of phy-mode in arch/powerpc/boot/dts/fsl, and =
I see
> lots of phy-connection-type with fman.  Madalin, does this patch look OK?

The fman driver (mac_probe()) calls of_get_phy_mode() which first
looks for phy-mode, and then phy-connection-type. Both should be the
same according to the device tree binding.

With some older kernels I remember we had issues with
phy-connection-type but not phy-mode, but this is more than 2 years
ago, I don't remember the details. phy-mode works well (tested ~2
weeks ago) with 4.14, 4.19 and 5.2, for sure.

Valentin

>
> -Scott
>
> > > ---
> > >  arch/powerpc/boot/dts/fsl/kmcent2.dts | 16 +++++++++++-----
> > >  1 file changed, 11 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/powerpc/boot/dts/fsl/kmcent2.dts
> > > b/arch/powerpc/boot/dts/fsl/kmcent2.dts
> > > index 48b7f9797124..c3e0741cafb1 100644
> > > --- a/arch/powerpc/boot/dts/fsl/kmcent2.dts
> > > +++ b/arch/powerpc/boot/dts/fsl/kmcent2.dts
> > > @@ -210,13 +210,19 @@
> > >
> > >                 fman@400000 {
> > >                         ethernet@e0000 {
> > > -                               fixed-link =3D <0 1 1000 0 0>;
> > > -                               phy-connection-type =3D "sgmii";
> > > +                               phy-mode =3D "sgmii";
> > > +                               fixed-link {
> > > +                                       speed =3D <1000>;
> > > +                                       full-duplex;
> > > +                               };
> > >                         };
> > >
> > >                         ethernet@e2000 {
> > > -                               fixed-link =3D <1 1 1000 0 0>;
> > > -                               phy-connection-type =3D "sgmii";
> > > +                               phy-mode =3D "sgmii";
> > > +                               fixed-link {
> > > +                                       speed =3D <1000>;
> > > +                                       full-duplex;
> > > +                               };
> > >                         };
> > >
> > >                         ethernet@e4000 {
> > > @@ -229,7 +235,7 @@
> > >
> > >                         ethernet@e8000 {
> > >                                 phy-handle =3D <&front_phy>;
> > > -                               phy-connection-type =3D "rgmii";
> > > +                               phy-mode =3D "rgmii-id";
> > >                         };
> > >
> > >                         mdio0: mdio@fc000 {
> > > --
> > > 2.17.1
> > >
> >
> >
>
