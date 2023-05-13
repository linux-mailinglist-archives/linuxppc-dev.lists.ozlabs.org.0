Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0E70182A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 18:16:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QJW3M6nb6z3fWs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 May 2023 02:16:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UzeUzpMk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com; envelope-from=alexdeucher@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UzeUzpMk;
	dkim-atps=neutral
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QJW2T0lFLz3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 02:15:44 +1000 (AEST)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-54fb3ef9c53so2103851eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683994540; x=1686586540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAwewp2kthWWSif09t8xwGEOcMXmK89hPwkmMo5Is8o=;
        b=UzeUzpMkVve/6x5RUROzP/Pr5G/uJ2wpTGBpSqFq3m33qS0mqNnW7Cqftq97NZfHqV
         DjMoLczD9/vL/YNfUpD9ThJ/dQv1asxhZByVhrnpJE1pCFmRlmCGgenZJrlzwP0Cr2LU
         xYWsKzbWXUvm6ANZ4oTPEmAXH4Dhb3jL3cp4p1Ke/xjERpKxuHRbCCSdhyiUtvT9zNHl
         +AIIGndzn2TXDGJmmHPjQBoK2OIpW6NRz6bSonKBZvZhhqhszU5T1Rzz+UI7nGcINhB2
         yR6DFmoI3i69TgKNuSv7cBx/EsmB/litG19WXpII47sKjZYVMv5+kRy1z6PwQmdGVLXr
         Wg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683994540; x=1686586540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAwewp2kthWWSif09t8xwGEOcMXmK89hPwkmMo5Is8o=;
        b=llLcdMRa18TFejkxqfibRu0xpCYCDNYAjxcfrQPuCDfPsnfFt3ofYdl3VN6PlrTV+p
         mB4QcnWKlL+pqR7ixIvvvMxHsoglRLUAmP7jYA0fj95EZMOOXpr10b0I0diJjy+GeK8k
         Pqif+VbzBGV5Z65Puno/QES2IXBTTRQmp7J4zFCyZidwysKk1+lvHOWXyRT0e+wIBd35
         Y6CK+uvK0xKcT9pvklizviuKLIZrmSDAIQHeaP3DHC/Zzoxqzrihrp4hb0ejMa7iy9Dg
         N3OjJhL5QMxSixyFA28Dlvd7/121CxwBvxW4TXqIQlQnN6f5HIPdvNpRadAPCWjFImJB
         ZC5A==
X-Gm-Message-State: AC+VfDz2MXR9B7Hkk6xjisLxRIMadoQHEYv8eoFujmAKVtKlY0W0kS8p
	ZlljZwM7JF5x8LeaSP/DbXrOOrpbgRHRaXOQkyM=
X-Google-Smtp-Source: ACHHUZ4JwIaY02RrtBZwd7KHuPZBw7jqM0UkUh1Tb9GM7JscTzR1I4ronR9NBKH6BvNHjh5sREtms0J7+SCs4+C7Ido=
X-Received: by 2002:a4a:d218:0:b0:546:bf26:49c7 with SMTP id
 c24-20020a4ad218000000b00546bf2649c7mr8214553oos.8.1683994538269; Sat, 13 May
 2023 09:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
 <3e5548e4-5a3e-9346-ec58-3617e1947186@gmail.com> <a50537d1f1af34104793218acb954a61@linuxsystems.it>
 <3383ba6e-e62b-cd9b-8a61-39b0de8af579@csgroup.eu> <57100be6-d379-0bc7-6d45-228cd46f9c81@csgroup.eu>
 <2023051353-epiphany-retorted-4ad1@gregkh>
In-Reply-To: <2023051353-epiphany-retorted-4ad1@gregkh>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sat, 13 May 2023 12:15:26 -0400
Message-ID: <CADnq5_OqgEP1S25VfnuptWiOvicXyX3Waq8rq_62rQsqeJTXYQ@mail.gmail.com>
Subject: Re: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to
 read user page (1128) - exploit attempt? (uid: 0)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Linux Regressions <regressions@lists.linux.dev>, Qingqing Zhuo <qingqing.zhuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, Linux AMDGPU <amd-gfx@lists.freedesktop.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Linux for PowerPC <linuxppc-dev@lists.ozlabs.org>, =?UTF-8?Q?Niccol=C3=B2_Belli?= <darkbasic@linuxsystems.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 13, 2023 at 12:11=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 12, 2023 at 03:25:47PM +0000, Christophe Leroy wrote:
> >
> >
> > Le 12/05/2023 =C3=A0 17:16, Christophe Leroy a =C3=A9crit :
> > >
> > >
> > > Le 11/05/2023 =C3=A0 19:25, Niccol=C3=B2 Belli a =C3=A9crit :
> > >> [Vous ne recevez pas souvent de courriers de
> > >> darkbasic@linuxsystems.it. D?couvrez pourquoi ceci est important ?
> > >> https://aka.ms/LearnAboutSenderIdentification ]
> > >>
> > >> Il 2023-05-12 10:32 Bagas Sanjaya ha scritto:
> > >>> #regzbot introduced: f4f3b7dedbe849
> > >>> #regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/2553
> > >>
> > >> It doesn't look like the aforementioned patch made its way into 6.3 =
yet:
> > >>
> > >> niko@talos2 ~/devel/linux-stable $ git branch
> > >> * linux-6.3.y
> > >>    master
> > >> niko@talos2 ~/devel/linux-stable $ git show f4f3b7dedbe8 | patch -p1
> > >> patching file
> > >> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > >> Hunk #1 succeeded at 227 (offset 15 lines).
> > >> Hunk #2 succeeded at 269 with fuzz 2 (offset 19 lines).
> > >> patching file
> > >> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> > >> Hunk #1 succeeded at 49 with fuzz 2 (offset 15 lines).
> > >
> > > As far as I can see that patch has no Fixes: tag, so it will unlikely=
 be
> > > automatically merged into stable.
> > >
> > > Has anybody requested greg/sasha to get it into 6.3 ?
> > >
> >
> > In fact, it seems that patch is already part of 6.3:
> >
> > $ git tag --contains f4f3b7dedbe8
> > v6.3
> > v6.3-rc5
> > v6.3-rc6
> > v6.3-rc7
> > v6.3.1
> > v6.3.2
> > v6.4-rc1
>
> And that commit is already in the following releases:
>         5.10.177 5.15.106 6.1.23 6.2.10 6.3
>
> So what needs to be done here?

Nothing needs to be done here.  We still don't know what the problem
is.  We are working on the issue on:
https://gitlab.freedesktop.org/drm/amd/-/issues/2553
Let's just track it there.  This email thread is just causing confusion.

Alex

>
> confused,
>
> greg k-h
