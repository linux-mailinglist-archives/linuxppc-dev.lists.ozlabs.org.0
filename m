Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A424D5363FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 16:23:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8n9N47njz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 00:23:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f9LNqgcF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f9LNqgcF;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8n8m247gz30Qr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 00:23:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4E35EB8253A
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 14:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001E9C34100
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653661395;
	bh=uNxUH+hPrnZb11CQFBjeceOe6V12EqBy9Sh5LQdN0I8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f9LNqgcFkJIe07M7N9HZGQotGjMMaDUfeYyf95SxtPNwMzFJhJTl5rKjUnPkHXqaK
	 fvlXclKgeOYoOj9t6Z6hTBmaW+oOa+C2bDsSPNA8SJ60jKc/3pRvpZdc5UyH+r/O9V
	 8Bh1ptGkjbhP5b9/J5IFFxSRrnWFmh88YcxowmxjiUB65n/jBK9o8JJX02Y9B1Yq0u
	 UYYuBXKZLaP8RyOsQqN7iXXz+7yYcfIzoOD7jPKpAcdiSpW1D4LudOpozk1xkqD5W7
	 kHulOkyE2NV6lqmeik637JiRtRQgB1++1gZwbiqlTj7+V+i2pRzuE2aPDDDBCkCIsQ
	 Siy4BO/qPzHiQ==
Received: by mail-pf1-f181.google.com with SMTP id bo5so4476612pfb.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 07:23:14 -0700 (PDT)
X-Gm-Message-State: AOAM53296+3Qj+/0wu0l5RFvrQRiWefS7W/GARu9dy/iiYMhakRo8S3V
	sImgpdC/+h4CeCHBHGg68U4vm+bvkvxjg7LTmA==
X-Google-Smtp-Source: ABdhPJyC9f/oNhDZ2gCxY8DjjgnlgYMkpaz81iMEa64oAKWJbQw2AYmlKLXKvwbFpyqwASa98b2bPJWqw+eITVxaGHc=
X-Received: by 2002:a05:6a00:170e:b0:519:3571:903e with SMTP id
 h14-20020a056a00170e00b005193571903emr4211750pfc.30.1653661394502; Fri, 27
 May 2022 07:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu> <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de> <OSZPR01MB7019313DCB5A79F91BE6D91CAAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <9e8dd323-4a36-abb2-568d-fe1384b1579c@xenosoft.de>
In-Reply-To: <9e8dd323-4a36-abb2-568d-fe1384b1579c@xenosoft.de>
From: Rob Herring <robh@kernel.org>
Date: Fri, 27 May 2022 09:23:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
Message-ID: <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
To: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 27, 2022 at 3:33 AM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> On 27 May 2022 at 10:14 am, Prabhakar Mahadev Lad wrote:
> > Hi,
> >
> >> -----Original Message-----
> >> From: Christian Zigotzky <chzigotzky@xenosoft.de>
> >> Sent: 27 May 2022 09:06
> >> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> >> Christophe Leroy <christophe.leroy@csgroup.eu>; Rob Herring
> >> <robh@kernel.org>
> >> Cc: Darren Stevens <darren@stevens-zone.net>; linuxppc-dev <linuxppc-
> >> dev@lists.ozlabs.org>; mad skateman <madskateman@gmail.com>; R.T.Dicki=
nson
> >> <rtd2@xtra.co.nz>; Christian Zigotzky <info@xenosoft.de>
> >> Subject: [FSL P50x0] Keyboard and mouse don't work anymore after the
> >> devicetree updates for 5.19
> >>
> >> On 27 May 2022 at 09:56 am, Prabhakar Mahadev Lad wrote:
> >>> Hi,
> >>>
> >>>> -----Original Message-----
> >>>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> >>>> Sent: 27 May 2022 08:23
> >>>> To: Christian Zigotzky <chzigotzky@xenosoft.de>;
> >>>> rob.herring@calxeda.com; Prabhakar Mahadev Lad
> >>>> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>> Cc: Darren Stevens <darren@stevens-zone.net>; linuxppc-dev <linuxppc=
-
> >>>> dev@lists.ozlabs.org>; mad skateman <madskateman@gmail.com>;
> >>>> R.T.Dickinson <rtd2@xtra.co.nz>; Christian Zigotzky
> >>>> <info@xenosoft.de>
> >>>> Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after
> >>>> the devicetree updates for 5.19
> >>>>
> >>>> Hi
> >>>>
> >>>> Le 26/05/2022 =C3=A0 19:42, Christian Zigotzky a =C3=A9crit :
> >>>>> Hello,
> >>>>>
> >>>>> My keyboard and mouse don't work anymore with my Cyrus+ board with =
a
> >>>>> FSL
> >>>>> P50x0 PowerPC SoC [1] after the devicetree updates for 5.19 [2].
> >>>>> After reverting the devicetree updates, my keyboard and mouse work
> >>>>> without any problems.
> >>>>> I figured out that the issue is in the patch for the file platform.=
c
> >>>>> [3].  I created a patch for reverting the problematic code. (see
> >>>>> attachment)
> >>>>> After reverting the changes with the attached patch, the keyboard
> >>>>> and mouse work again.
> >>>>> Please check your changes in the file platform.c [3].
> >>>>>
> >>>>> Thanks,
> >>>>> Christian
> >>>>>
> >>>>> [1]
> >>>>> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
wiki.
> >>>>> amiga.org%2Findex.php%3Ftitle%3DX5000&amp;data=3D05%7C01%7Cprabhaka=
r.m
> >>>>> ah
> >>>>> adev-lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C5=
3
> >>>>> d8
> >>>>> 2571da1947e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown=
%
> >>>>> 7C
> >>>>> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
X
> >>>>> VC
> >>>>> I6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DfSABvBDi%2FYlqU1eydQB6%2F4BzxX=
kqR
> >>>>> M0
> >>>>> Ln9hdInyTp6w%3D&amp;reserved=3D0
> >>>>> [2]
> >>>>> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgit.
> >>>>> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.gi=
t
> >>>>> %2
> >>>>> Fcommit%2F%3Fid%3D86c87bea6b42100c67418af690919c44de6ede6e&amp;data=
=3D
> >>>>> 05
> >>>>> %7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.com%7C4e9c08d1e3874a3=
4
> >>>>> bd
> >>>>> 4208da3fb1c007%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6378923=
2
> >>>>> 99
> >>>>> 12063922%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
I
> >>>>> iL
> >>>>> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DENkjlza0J=
7xF
> >>>>> iI
> >>>>> aPUwMBxHBIkXJNkT%2BLTZ3xuPz%2B10Q%3D&amp;reserved=3D0
> >>>>>
> >>>>> [3]
> >>>>> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgit.
> >>>>> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.gi=
t
> >>>>> %2
> >>>>> Fdiff%2Fdrivers%2Fof%2Fplatform.c%3Fid%3D86c87bea6b42100c67418af690=
9
> >>>>> 19
> >>>>> c44de6ede6e&amp;data=3D05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.rene=
sas
> >>>>> .c
> >>>>> om%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d82571da1947e49cb4625a166=
a
> >>>>> 4a
> >>>>> 2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
w
> >>>>> Lj
> >>>>> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7=
C
> >>>>> &a
> >>>>> mp;sdata=3DyEJUK%2BGK2dzWARC5rfhsSSFSwD%2BLZm8aNNHqQhPYP7Y%3D&amp;r=
ese
> >>>>> rv
> >>>>> ed=3D0
> >>>> Based on your patch I would say the culprit commit is
> >>>> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
git
> >>>> hub.c%2F&amp;data=3D05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.=
com
> >>>> %7Cbf899ff2084643971c7908da3fb7d4b9%7C53d82571da1947e49cb4625a166a4a=
2
> >>>> a%7C0%7C1%7C637892356025845542%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
j
> >>>> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C=
&
> >>>> amp;sdata=3D%2FzI4yueF6Pc%2Fpvh7Ax9WilnaYX8ozFTRyQpiVaaacbg%3D&amp;r=
ese
> >>>> rved=3D0
> >>>> om%2Ftorvalds%2Flinux%2Fcommit%2Fa1a2b7125e1079cfcc13a116aa3af3df2f9=
e
> >>>> 002b&
> >>>> amp;data=3D05%7C01%7Cprabhakar.mahadev-
> >>>> lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d8257=
1
> >>>> da194
> >>>> 7e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZ=
s
> >>>> b3d8e
> >>>> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3
> >>>> 000%7
> >>>> C%7C%7C&amp;sdata=3DONR1CiaSID6q4%2Fo%2BI6MlPA4ij89BJphQRpEu5tQxvYQ%=
3D&
> >>>> amp;r
> >>>> eserved=3D0
> >>>>
> >>>> commit a1a2b7125e1079cfcc13a116aa3af3df2f9e002b
> >>>> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>> Date:   Wed Mar 16 20:06:33 2022 +0000
> >>>>
> >>>>        of/platform: Drop static setup of IRQ resource from DT core
> >>>>
> >>>>        Now that all the DT drivers have switched to platform_get_irq=
()
> >>>> we can now
> >>>>        safely drop the static setup of IRQ resource from DT core cod=
e.
> >>>>
> >>>>        With the above change hierarchical setup of irq domains is no
> >> longer
> >>>>        bypassed and thus allowing hierarchical interrupt domains to
> >> describe
> >>>>        interrupts using "interrupts" DT property.
> >>>>
> >>>>        Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> >>>> lad.rj@bp.renesas.com>
> >>>>        Acked-by: Marc Zyngier <maz@kernel.org>
> >>>>        Tested-by: Marc Zyngier <maz@kernel.org>
> >>>>        Signed-off-by: Rob Herring <robh@kernel.org>
> >>>>        Link:
> >>>> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lor
> >>>> e.ker%2F&amp;data=3D05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.=
com
> >>>> %7Cbf899ff2084643971c7908da3fb7d4b9%7C53d82571da1947e49cb4625a166a4a=
2
> >>>> a%7C0%7C1%7C637892356025845542%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
j
> >>>> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C=
&
> >>>> amp;sdata=3DR%2FhdNkjna6kT31Fy9L3HjrDscWR743O%2BAY8sITu9pVE%3D&amp;r=
ese
> >>>> rved=3D0
> >>>> nel.org%2Fr%2F20220316200633.28974-1-prabhakar.mahadev-
> >>>> lad.rj%40bp.renesas.com&amp;data=3D05%7C01%7Cprabhakar.mahadev-
> >>>> lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d8257=
1
> >>>> da194
> >>>> 7e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZ=
s
> >>>> b3d8e
> >>>> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3
> >>>> 000%7
> >>>> C%7C%7C&amp;sdata=3Dri76vfLpmxe7vFDAlsBjyrSSkuTMz0ydftu3XObLGLA%3D&a=
mp;
> >>>> reser
> >>>> ved=3D0
> >>>>
> >>> Looks like the driver which you are using has not been converted to u=
se
> >> platform_get_irq(), could you please check that.
> >>> Cheers,
> >>> Prabhakar
> >> Do you mean the mouse and keyboard driver?
> >>
> > No it could be your gpio/pinctrl driver assuming the keyboard/mouse are=
 using GPIO's. If you are using interrupts then it might be some hierarchal=
 irqc driver in drivers/irqchip/.
> >
> > Cheers,
> > Prabhakar
> Good to know. I only use unmodified drivers from the official Linux
> kernel so it's not an issue of the Cyrus+ board.

The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
resources to a child platform device. Can you try the following
change:

diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr=
-of.c
index 44a7e58a26e3..47d9b7be60da 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
                                        const char *name, int id)
 {
        struct platform_device *pdev;
-       const struct resource *res =3D ofdev->resource;
-       unsigned int num =3D ofdev->num_resources;
        int retval;

        pdev =3D platform_device_alloc(name, id);
@@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_device_registe=
r(
        if (retval)
                goto error;

-       if (num) {
-               retval =3D platform_device_add_resources(pdev, res, num);
-               if (retval)
-                       goto error;
-       }
+       pdev->dev.of_node =3D ofdev->dev.of_node;

        retval =3D platform_device_add(pdev);
        if (retval)
