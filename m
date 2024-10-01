Return-Path: <linuxppc-dev+bounces-1715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3698C074
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 16:41:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ0y374NYz2yGY;
	Wed,  2 Oct 2024 00:41:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727793706;
	cv=none; b=ceGmYx4s7qV/Qht/TavqFuVJkpu1f/7zNpYdjjgj7+8Et2l42VeLWprSS+LJ28quCbICxVTo4M/yNynflGjHyIGN99HY3kIfg5LL34FJRq6+K01QbM1F06PxcO1xhNrOoP6SfV3/YtL9i8brKU3KK+tRbPPvnqVDduWPlul8twloqGIKXxNpBQhwtKpfuEGLa9vSRpR7XzxY0rOrUUut6WbHIKg67q6qpFNzUHTjHixvbSkYtZs7AHoLgLBpe3gjdjfvGMatA7568faAc26I7Drsn2tOihM0kXRql4B0X9BkD/2ClFdtG72e8ZB9uJAmxLSuRLo3LsGzF5tjooX4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727793706; c=relaxed/relaxed;
	bh=rrh20PeToyIPNysilQWHip8q02mKnqO1PSLwm2b+JaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Is2h1qWnkbmAUuK/GgFlLcYtmly34RcRxK/b9BFCmoHsCa1x4s8pLByleftelGcMzo43y0R6UnKpsNNO2d1V9bRYRSQAGQnTKPKVenehKHJYlE0C81JuxTJiuP/LWWh8dn36HexaAYFLNVW25hKMDXWs3csozdVFaYGHhWAC4FPKrKMR+DnxLF9DlIxnY9u7KOVCl65sFuZU+dk7NY2iRVx8uXTOZ3GG0cCnGxDiI6s3cQjeqs3091tP8vCUeSalzFeZv+1h4jB3Oseaky7JDGqNw2/fPqS1n2yk6JbQmxe+wgmDs8QQOMlHYwlmn0UCArd8GzMSiZ4AYVE3Pof5AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bN/uoF3z; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=wuhoipok@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bN/uoF3z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=wuhoipok@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ0y16y43z2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 00:41:45 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso55885431fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Oct 2024 07:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727793702; x=1728398502; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrh20PeToyIPNysilQWHip8q02mKnqO1PSLwm2b+JaM=;
        b=bN/uoF3zX5+CPtMRWsqRhfLK46OF610J91Xb6ps2qJC+duZHe6ZKbwBPq3yPmWEXbm
         lAzAF7abKIDtxce4ZUTl56DXGgp0tQoJ4YRZWYcvHVeFMpU6HBEQzKWv8St96lbVgWTd
         2CDDQlSB8tmJ0MFnS5K0pf/rYGTRRb37hFnMnjS/qVthq8xlFrt5fKOTGVfZRg1Blgn2
         oXkvrNweATob8gFpoIy8FP+52kX/3/OhQv8MSFIC1MC5lcMHcs2FffGE8JTF6zba7ceN
         iLn1DlbOjnoOMf8ou+tQJlTdbZVTc7x+0GJZq4OQHiyj5DdFd+GYbvRY5LQTEdVbxJMx
         xv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727793702; x=1728398502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrh20PeToyIPNysilQWHip8q02mKnqO1PSLwm2b+JaM=;
        b=KQdFXpJ13JOc5n0256DD9hldqtT2neZNku0qe0KDJQS0fBaZvWcN5cpumF5i+eudDI
         f4d3tVKIXbNPa0VdM8g7loSQWtRy5/hlMj/ADR+eFA+u1O51/MFZSjHFd2dRdjM40C2C
         xFmZ8Xxoq1jbTRksIZ7ydybGNUHBjwJyaAEz8c1dNUxrKy1QD89shJCoL9HoYsjN+14F
         AUhzK+kSBQ8vO8rQ4tKaTgWrB76TT4lc8DwXJLQPVHJ+Sz8I3U7OTfl6f5z3FlunvzUq
         iMWELLrRVgmIwVBQgr9Tuu7bAHAft5oWQKVd02A8r7JK83OZ6telbAj8chsGyUQfmJgr
         IHsw==
X-Forwarded-Encrypted: i=1; AJvYcCUy9OjRkw12YZssvEx+Yu4eqH4yaEVIMoNZ479HUyXYflmDhNJa4Q+OFOvUO+LUf1tBwuYI6rSXSc1Zzdc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy1GntrS9ff3NtrJls8rHYwNfPR8VNAiZJRF/+cggQBIEEs4RfF
	8+H4a4a/NfVQ6gGtqQwMq1QtOXgSipdiFrm9EEt6TeaLPbwtYM64crh9sR7bU6cfNFrhLD79tfE
	RctFRVSKvu6NkrGlZdnm2oRkCxh8=
X-Google-Smtp-Source: AGHT+IGGc8gFzH9smhq1yHsyHZ6ILkQdCoDDu18smqyOkfE6ES4TV04TjFUCC312UA1bqmbO3KHvY4d1RlzSJvLveJg=
X-Received: by 2002:a2e:bc1c:0:b0:2fa:bd56:98c5 with SMTP id
 38308e7fff4ca-2fabd569ad2mr93536981fa.33.1727793701631; Tue, 01 Oct 2024
 07:41:41 -0700 (PDT)
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
Date: Tue, 1 Oct 2024 22:41:28 +0800
Message-ID: <CANyH0kCRE93EZhL1xvBiHOG63TavUKm3ZphZ3y5_=qYmbeHj4w@mail.gmail.com>
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

I will look into this and get back to you. Thank you.


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

