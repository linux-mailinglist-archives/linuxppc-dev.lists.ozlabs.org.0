Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD0B5394F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 18:30:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCHnb1bVqz3btl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 02:30:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=edqDYkp2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=edqDYkp2;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCHmw2RhNz2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 02:29:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1654014580;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=WAO/4zYHHx8fZmA+cTuiYATiYABIJHl9bV22Udlg/eY=;
    b=edqDYkp2MxS9saF5IQv0XxMvBeUJGrV5qS1iKHdonHOrb412G6EW0sFIeVDn2tl3p8
    vAaBY9hTwjYTXgbaWjLf1+Q93gns4PwGlHVWQRASa6fiM9LbivePQhyJZ7xJe91P2uvN
    4NOHIyEv1x0/PYpw5Fub/KwE6PdGSfoV0ExDEdahlDHSNOEVsZvjNGcdTAaWQ9/bFi45
    jyyGbbkMLlviX66lu8IsbdKpSwCRLdxt3jLcpnTGY0lNxtK4WpU9ei3FwC5aQ93pURCp
    1FokYIQZgMw0FJDsz3KgoQegoMBdIPw38jmDLbm5gq8XPrQ7rdDhtedRmXNEe+4nCS5t
    /kTw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2YgjrowkiUpei9vmYMDpVGUySXHVNo0odKTlUU="
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 47.45.0 AUTH)
    with ESMTPSA id 205ca1y4VGTcrZI
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 31 May 2022 18:29:38 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the devicetree updates for 5.19
Date: Tue, 31 May 2022 18:29:38 +0200
Message-Id: <87A6751F-9F21-4D06-A664-910F27459D5C@xenosoft.de>
References: <CAL_JsqK+OqML54Dfs_JNeM1_od9EBGf-eMH_4sXgpjqs2R-iYQ@mail.gmail.com>
In-Reply-To: <CAL_JsqK+OqML54Dfs_JNeM1_od9EBGf-eMH_4sXgpjqs2R-iYQ@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (19F77)
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



> On 31. May 2022, at 15:46, Rob Herring <robh@kernel.org> wrote:
>=20
> =EF=BB=BFOn Mon, May 30, 2022 at 12:26 AM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>>=20
>>> On 27 May 2022 at 04:23 pm, Rob Herring wrote:
>>> The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
>>> resources to a child platform device. Can you try the following
>>> change:
>>>=20
>>> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph=
-dr-of.c
>>> index 44a7e58a26e3..47d9b7be60da 100644
>>> --- a/drivers/usb/host/fsl-mph-dr-of.c
>>> +++ b/drivers/usb/host/fsl-mph-dr-of.c
>>> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_registe=
r(
>>>                                         const char *name, int id)
>>>  {
>>>         struct platform_device *pdev;
>>> -       const struct resource *res =3D ofdev->resource;
>>> -       unsigned int num =3D ofdev->num_resources;
>>>         int retval;
>>>=20
>>>         pdev =3D platform_device_alloc(name, id);
>>> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_device_regi=
ster(
>>>         if (retval)
>>>                 goto error;
>>>=20
>>> -       if (num) {
>>> -               retval =3D platform_device_add_resources(pdev, res, num)=
;
>>> -               if (retval)
>>> -                       goto error;
>>> -       }
>>> +       pdev->dev.of_node =3D ofdev->dev.of_node;
>>>=20
>>>         retval =3D platform_device_add(pdev);
>>>         if (retval)
>> Hello Rob,
>>=20
>> Thanks a lot for your patch! Unfortunately, this leads to a boot loop.
>> Do you have another idea?
>=20
> Do you have a dmesg log?

=46rom the boot loop?

>=20
> The other way to fix is creating a IRQ resource and adding it to the
> child device resources.

Good idea.
>=20
> Rob

