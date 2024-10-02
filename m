Return-Path: <linuxppc-dev+bounces-1732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE97F98D6B8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 15:43:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJbcT4BlHz2yMv;
	Wed,  2 Oct 2024 23:43:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::231"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727876616;
	cv=none; b=e7WLLqlqdJoG84ZP1xjDuFZEesJruyf0mv9e/YmvwpNylEuc8AEib9zdTDkBZ6chWXg2b8afNecBfYDPokWX1euaJxgmzuW5aIrhEmcHMXRD14El8mXYeeUnpeKg5ofafIT/0J8ar/09rD+4l//aY7Ll9vVh06pmCYIyIZbcO7vgTKLztJlUUylgRSY+cSCSdexRHr0SlNApVXenrXuPtb+gpbTbK6v6lmqyYL7pLMa72NRw5HoobbdGfDHXKnpc1zjqae4uajlO02QQweyPKFdQK4q9uuYAR420bmWwupuc5ktN/0BcpP2w4DQ3soOIWoRjy1vDbatQ/L/OhjEl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727876616; c=relaxed/relaxed;
	bh=4U/HG7Zu+rJjch/B5zOY+UiM6d6AX6rq/Wk+vOsFihU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYZGSxUQlQfyqPvU7F0l2qwB5oMaCn2ub3vYsDotV6QqtjiPwMXEWSyM1s/zDGXLe69w5f72tEHX2TKZ2P9MLd5c1dUHWrME64ROOTF33O8yO/MmKQBuw/jGbmcH9AjGzvneMqfQL5JVZvZ1eXBFdk7lq4FUxYd+KWNCn07A/gJrCIvakjFw182oqnOtjelTi6oe8LAEWHv+6k8q2HzxzCgShGIeOci5uRxj0AjUfz/yNAd5r4VZp/AkUVDEygfqZux5/QR6DSj+7F9cNoJ9PrhiJzYAIZHCcgrsWvmvqsZndKiEiu6HyGCq/IURBGae7dZN58j3FWBV3QGqXNoKjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Nyp3e3Yw; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=wuhoipok@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Nyp3e3Yw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=wuhoipok@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJbcQ66Dcz2yLV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 23:43:33 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fadb636abaso19250531fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2024 06:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727876607; x=1728481407; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4U/HG7Zu+rJjch/B5zOY+UiM6d6AX6rq/Wk+vOsFihU=;
        b=Nyp3e3Yw8PNSaLsE/bzq9SzoJeeVQDtWl6olAMZo8BQC0CKUUS/8NPzEG24nE7AyYR
         uORJ7gaf5jOkAIl0Pbnfllp3q0BSUsEaHvSAI/G4IbBqelK8sGDOxQm69zxtORCFsl/E
         Xmwk1gn9dgBRgDMazfr7LCaGHTY741marMnKuNCrEp9mDB+8uJO5DaKP8eXKscQLBpGb
         u40dpg4+HD/LV7EqMtT5X/HlhTKBlRMhIWXzK012yV5GJ4NhyoQFWUJE2OQ2vPE3qZiN
         eJWjkOCZE/Zjibjn8X+Rzb7pq99QnSUxcBV1wl/LxsTVXaWOr0gGDwhBZznzOlwRYQ7d
         caHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727876607; x=1728481407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4U/HG7Zu+rJjch/B5zOY+UiM6d6AX6rq/Wk+vOsFihU=;
        b=vNngcMvJeAR7kH1iiERIEBP1N7ulsPml1TnMkWTC3aRp8wgZOaTMR9j8QQ9A3ihMw5
         PS2MFEcBVE+pVVeL6yCcvHjoRIzJmFqBrY5xc8VlPsD0L0SUER/BMcA/sXsuQWB65n+3
         pgjGTFxd6QggA8m7kk839BVvrKQX/ppks2sSK9jg0001r54OaKaVGEoopbHLODdncKn2
         0QUXFvNmtJOI1JXsWhEk2CceipvLtbXn8Ej74WtOVy2JKWaVxL8w3HS+YJ1xChP89Xrs
         xEJroCCalGjt/asPK1SzzDrRBwHZT9L5B6k1gUvp1JdzX7O2ErOGAZjZ0UgiQPMNE1J1
         SSjA==
X-Forwarded-Encrypted: i=1; AJvYcCVuBFUIOIXafuijMGcyesCt8xrKZv0aRaUt4/VWjAaEOSMMqKy+N7tRFLejlW11nvMXm6bGgYR68mkvc30=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxnk0bFpjpLHCFITJOWAM30tkxREY4OWhbThX7ef5/VYK7M4NUA
	ZW7eKqBX5PBIHU8yI4tGC1yEW+s8V2rzmiinxA98WR1FEKtmPDwjZwFXIpsvF2NOuEcjqtpYHDS
	6vUYRPC0BTtenSTCg75ErJddbjbI=
X-Google-Smtp-Source: AGHT+IEJ6f4uGOKEroxtjURr/U02X8Am0TD9em6KyzlCinzdT0JnlbDBuypuv1SdsH3NYin0rH96Dcj8V9kt0PH/U3c=
X-Received: by 2002:a05:651c:150a:b0:2fa:cf5b:1ea7 with SMTP id
 38308e7fff4ca-2fae0ffccd0mr19283841fa.6.1727876606397; Wed, 02 Oct 2024
 06:43:26 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <CADnq5_PB8zUfCN-NcNpgHqzAv8A55o2hsYHAdnSBhEy525NLfA@mail.gmail.com>
 <D01B31B5-0609-4106-ABF4-B549CDBA362B@xenosoft.de> <CANyH0kBnWZMZCG7K9vGt2a8Svr30U=PVOwrhwn-Q-CN9PZc=Sw@mail.gmail.com>
 <77d49375-8eac-45cf-83b7-c3334ed6d665@csgroup.eu>
In-Reply-To: <77d49375-8eac-45cf-83b7-c3334ed6d665@csgroup.eu>
From: Hoi Pok Wu <wuhoipok@gmail.com>
Date: Wed, 2 Oct 2024 21:43:15 +0800
Message-ID: <CANyH0kD1Q8PvRaMkBr=0x7QHzkUFheaMfL5LVeDaaj3FrBm5XA@mail.gmail.com>
Subject: Re: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Alex Deucher <alexdeucher@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
	developers DRI <dri-devel@lists.freedesktop.org>, mad skateman <madskateman@gmail.com>, 
	"R.T.Dickinson" <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Thanks to Christophe.
I have figured out what happened.
The connector is registered before the device,
where drm_connector_register() states that,
drm_dev_register() has to be called before it.

Assuming this is the fix, I will send the patch for testing soon.

On Tue, Oct 1, 2024 at 8:23=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi All,
>
> Le 01/10/2024 =C3=A0 14:09, Hoi Pok Wu a =C3=A9crit :
> > [Vous ne recevez pas souvent de courriers de wuhoipok@gmail.com. D=C3=
=A9couvrez pourquoi ceci est important =C3=A0 https://aka.ms/LearnAboutSend=
erIdentification ]
> >
> > Hi Thomas,
> >
> > Could you help on this issue?
> > I do not have access to the hardware now.
> > Thank you.
>
> The OOPS is from function drm_dp_aux_register(), exactly here below:
>
> static inline const char *dev_name(const struct device *dev)
> {
>         /* Use the init name until the kobject becomes available */
>         if (dev->init_name)
>
>      1ae0:      e8 89 00 50     ld      r4,80(r9)
>
>
> As you see in registers dump, r9 register is NULL. That's dev which is NU=
LL:
>
> GPR00: c0000000005b74f0 c0000000800daf10 c0000000015a3600 c00000008033f7e=
c
> GPR04: 0000000000000000 c000000001908f18 c000000080460c80 ffffffffc0c0c0c=
0
> GPR08: c000000080f74008 0000000000000000 0000000000000003 c000000080f7400=
8
> GPR12: 0000000048000828 c00000003fffeac0 0000000000000003 000000000100000=
0
> GPR16: c0000000804eaeca 0000000000000013 0000000000003113 000000000000000=
0
> GPR20: 0000000000000008 c0000000800db208 000000000000000a c0000000014d686=
8
> GPR24: 0000000000000000 0000000000000001 c0000000800db29c c0000000800db25=
0
> GPR28: c000000080bd8040 0000000000000001 c000000080f74000 c00000008033f4a=
0
>
> Full dump below:
>
> 0000000000001a5c <drm_dp_aux_register>:
> {
>      1a5c:      3c 4c 00 00     addis   r2,r12,0
>                         1a5e: R_PPC64_REL16_HA  .TOC.+0x2
>      1a60:      38 42 00 00     addi    r2,r2,0
>                         1a62: R_PPC64_REL16_LO  .TOC.+0x6
>      1a64:      7c 08 02 a6     mflr    r0
>      1a68:      fb e1 ff f8     std     r31,-8(r1)
>      1a6c:      f8 01 00 10     std     r0,16(r1)
>      1a70:      7c 7f 1b 78     mr      r31,r3
>      1a74:      f8 21 ff d1     stdu    r1,-48(r1)
>         WARN_ON_ONCE(!aux->drm_dev);
>      1a78:      e9 23 03 38     ld      r9,824(r3)
>      1a7c:      2f a9 00 00     cmpdi   cr7,r9,0
>      1a80:      41 de 00 90     beq-    cr7,1b10 <drm_dp_aux_register+0xb=
4>
>         if (!aux->ddc.algo)
>      1a84:      e9 3f 00 18     ld      r9,24(r31)
>      1a88:      2f a9 00 00     cmpdi   cr7,r9,0
>      1a8c:      41 de 00 74     beq-    cr7,1b00 <drm_dp_aux_register+0xa=
4>
>         strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev)=
,
>      1a90:      e8 9f 00 00     ld      r4,0(r31)
>         aux->ddc.owner =3D THIS_MODULE;
>      1a94:      39 40 00 00     li      r10,0
>         aux->ddc.dev.parent =3D aux->dev;
>      1a98:      e9 3f 03 30     ld      r9,816(r31)
>         strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev)=
,
>      1a9c:      38 7f 02 74     addi    r3,r31,628
>         aux->ddc.owner =3D THIS_MODULE;
>      1aa0:      f9 5f 00 08     std     r10,8(r31)
>         strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev)=
,
>      1aa4:      2f a4 00 00     cmpdi   cr7,r4,0
>         aux->ddc.dev.parent =3D aux->dev;
>      1aa8:      f9 3f 00 b8     std     r9,184(r31)
>         strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev)=
,
>      1aac:      41 de 00 34     beq-    cr7,1ae0 <drm_dp_aux_register+0x8=
4>
>      1ab0:      38 a0 00 30     li      r5,48
>      1ab4:      48 00 00 01     bl      1ab4 <drm_dp_aux_register+0x58>
>                         1ab4: R_PPC64_REL24     sized_strscpy
>      1ab8:      60 00 00 00     nop
>         ret =3D i2c_add_adapter(&aux->ddc);
>      1abc:      38 7f 00 08     addi    r3,r31,8
>      1ac0:      48 00 00 01     bl      1ac0 <drm_dp_aux_register+0x64>
>                         1ac0: R_PPC64_REL24     i2c_add_adapter
>      1ac4:      60 00 00 00     nop
> }
>      1ac8:      38 21 00 30     addi    r1,r1,48
>      1acc:      e8 01 00 10     ld      r0,16(r1)
>      1ad0:      eb e1 ff f8     ld      r31,-8(r1)
>      1ad4:      7c 08 03 a6     mtlr    r0
>      1ad8:      4e 80 00 20     blr
>      1adc:      60 00 00 00     nop
>   * Return: The kobject name of the device, or its initial name if
> unavailable.
>   */
> static inline const char *dev_name(const struct device *dev)
> {
>         /* Use the init name until the kobject becomes available */
>         if (dev->init_name)
>      1ae0:      e8 89 00 50     ld      r4,80(r9)
>      1ae4:      2f a4 00 00     cmpdi   cr7,r4,0
>      1ae8:      40 fe ff c8     bne+    cr7,1ab0 <drm_dp_aux_register+0x5=
4>
>                 return dev->init_name;
>
>         return kobject_name(&dev->kobj);
>      1aec:      e8 89 00 00     ld      r4,0(r9)
>      1af0:      4b ff ff c0     b       1ab0 <drm_dp_aux_register+0x54>
>      1af4:      60 00 00 00     nop
>      1af8:      60 00 00 00     nop
>      1afc:      60 00 00 00     nop
>                 drm_dp_aux_init(aux);
>      1b00:      7f e3 fb 78     mr      r3,r31
>      1b04:      48 00 00 01     bl      1b04 <drm_dp_aux_register+0xa8>
>                         1b04: R_PPC64_REL24     drm_dp_aux_init
>      1b08:      4b ff ff 88     b       1a90 <drm_dp_aux_register+0x34>
>      1b0c:      60 00 00 00     nop
>         WARN_ON_ONCE(!aux->drm_dev);
>      1b10:      0f e0 00 00     twui    r0,0
>      1b14:      4b ff ff 70     b       1a84 <drm_dp_aux_register+0x28>
>
>
>
> >
> > Regards,
> > Wu Hoi Pok
> >
> >
> > On Tue, Oct 1, 2024 at 12:26=E2=80=AFPM Christian Zigotzky
> > <chzigotzky@xenosoft.de> wrote:
> >>
> >> On 30 September 2024 3:27pm, Alex Deucher <alexdeucher@gmail.com> wrot=
e:
> >>
> >> =EF=BB=BF+ Wu Hoi Pok
> >>
> >> This is likely related to the drm device rework.
> >>
> >> Alex
> >>
> >> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
> >>
> >> Hi All,
> >>
> >> I was able to revert the drm-next-2024-09-19 updates for the RC1 of ke=
rnel 6.12.
> >>
> >> This kernel works on all machines without any problems.
> >>
> >> This means, the new Radeon DRM driver is unreliable after the DRM rewo=
rk.
> >>
> >> Please fix this issue because we can=E2=80=99t deliver the kernels wit=
h the new Radeon DRM driver.
> >>
> >> Error log: https://eur01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fwww.xenosoft.de%2FPuTTY_P5040_U-Boot.log&data=3D05%7C02%7Cchristop=
he.leroy%40csgroup.eu%7C9b40f906e2f2493cb25908dce211ee23%7C8b87af7d86474dc7=
8df45f69a2011bb5%7C0%7C0%7C638633814783011669%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C=
%7C&sdata=3DfgAj0osIOyJtNrzUKp%2Bpq0NN1sGW2bqGm8nXYj88Ne0%3D&reserved=3D0
> >>
> >> Thanks,
> >> Christian

