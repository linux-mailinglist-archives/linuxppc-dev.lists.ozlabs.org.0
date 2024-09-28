Return-Path: <linuxppc-dev+bounces-1672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF3A988E60
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2024 10:08:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XG0Mq11mcz2yVD;
	Sat, 28 Sep 2024 18:08:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::831"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727510919;
	cv=none; b=kn/zDC3OaUmcGrIXngIb0/8q7fjzkmQlOQF9ALKBQffyLkQl8HpBDuVQ7Ehmp1ByJf+0qy3Z1xoQTNKaA3k8SJacw6u2udyAuvMRAVUp/Y5W1Hrvwta7fyZm3nfuft/wxipIcyyCQ1R/ZGKctQSL62U+AfsaIAB3zveHOywm2OJJvvAkILGoIMwEJzzc3aflbBUBRaWBAL2LvTNTJI9+QEv2AlEwY8Lk3O/w0Wq3YJtl3m167fYelZwRiTJ702meWKYR/36kR1IaPiDzvjgUkN0uqPOnEJLZTJUep4glO8MVOorXVfx2cIJ/OPsGfcgWF+845P9aesek6rQTDcs6og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727510919; c=relaxed/relaxed;
	bh=NvnBMXGd1UczYXaOTcx5QbDJRhPzflfWI0s4UMBD7oA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9xhgIginyCsuGTCHe4JEFGJuwoNGn8UVItXR6WmW5j5WHOUf7muC2DYITrGXn0SMuAV2VjqUbMFpe6EM1poxmIn5MLxs9x3W45dUfeqUYZSMFJ4irJZQ6NCgeVU34nyVIHYumRDETqsTZfWIkIM6vF1aAi/PhOwsFtftsfWz9/B5ZSAfZIe1lvz5q29cdAFOTKbRYEgFu1+tVWqhpQCSEDWkI5RS5EsqZbGIx6UuxsWxvYvgmOYhBWE5WfOPLUt5YMEvkhG19uP8r88H7GcwEepLTVjPY62f6sNcirwh97XFj5ji8bJnVf8DAJ+7EOGBoxZw+QQv+b5h5BsHSFjCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LPByBLGc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=madskateman@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LPByBLGc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=madskateman@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XG0Mp2Vk0z2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2024 18:08:37 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-457cfc2106aso23334821cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2024 01:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727510913; x=1728115713; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NvnBMXGd1UczYXaOTcx5QbDJRhPzflfWI0s4UMBD7oA=;
        b=LPByBLGcOrkkN/oMysShHs9sgshGscZUkWIhAekYppN7+m4ORJ/umR6xfsdLBWwH/k
         18eF3QuJPxQ47hhPr7NJXEx+SHTbd+CDAFX4HKNHDUtQ6B1QJqyLhclnRJ26rovHdpoO
         5QlwUeh4SFSnXhDu7q4oySdEbWKpIN1zTb8WLJjSSMOlofrKDdEYajpR9sKIFa05Rz0C
         5nZ40YqHXG1X4z6MY5Rt9yT1UJKAZHukvQEJFmoyRq6+zeILnlQOCZ+H49VZwqJHO6zn
         sNVswKD6iV1h9fCeNydVTfEczWiqXSYp9pI5pBvHU/SCbGd3RsCCvDfij3p8W882swRI
         YJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727510913; x=1728115713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvnBMXGd1UczYXaOTcx5QbDJRhPzflfWI0s4UMBD7oA=;
        b=KFIsc1yt0d8w0E7unMd6f+1UAxkDjN7OcYhu1VO0MfJWIK8brwpUBO5NJBHxtFG1o4
         xnHLzbB+Njdvj+leW3sO0TpE7rjEVcVJ+WuDjh/1b6E2MMQyARHLhs7eAZbgnsRLb4dh
         i/pV8ONjQTt7DYWIcXhtzI0IiotcHWsD3FK0C9sSbm9otZu1e76Zl49m0cskid9itaqu
         DR/ezyTCVATdcNaWciKcDRvE3STYwbTyziw5Q3Kw5yB8X+Tg5GqXtcjUbJi0/AQz+IRN
         /GA9ZuF2lRSDVz8UsaMifS/zMj4QAB18dAiUTk18pHgKd0B1ec2xgrp79oigH0gmrtd4
         YgvA==
X-Forwarded-Encrypted: i=1; AJvYcCXbwu9jZlBgnI+gcVyqx6PotIgODQ9q8WmwCHI7BoRZU6xNs8s5TKLCDkpw2bMXkReMFyf3HX+g0h2kVMo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyooO1RSagY6oRB5esY4uQgg6+r1ZgfzY8kgbsAIV3rl79nbBhT
	Wb9wwHmpd28wqVQrcklMX1l2rxZYcY2UXdodrH9kWFkofmd4o/BdUvpHNmH8OilLTsFVwOiZc+K
	5UCm4BTPFwGK4w5TrIJk5VUkCIzE=
X-Google-Smtp-Source: AGHT+IHaRWtv0fMmJpC8MYV0yGaOCH2LdkFFayZpQ14RcDKlzn8cY8QXgpgWhGun4oaITUndOB8GttI+VNragxAdmIw=
X-Received: by 2002:a05:622a:284:b0:458:29bf:1ab with SMTP id
 d75a77b69052e-45c9f229d53mr99158301cf.25.1727510912806; Sat, 28 Sep 2024
 01:08:32 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <CADnq5_MM6UYOwFSPkZRauAyckFaUjCRGT97cVhsK=xZ9CzuXVw@mail.gmail.com>
 <20EA4BE5-B349-4406-89EA-3D442717EC03@xenosoft.de> <48f59b5b-b26e-49c5-9b58-1c877bea394d@xenosoft.de>
In-Reply-To: <48f59b5b-b26e-49c5-9b58-1c877bea394d@xenosoft.de>
From: mad skateman <madskateman@gmail.com>
Date: Sat, 28 Sep 2024 10:08:23 +0200
Message-ID: <CAHkrCmEpi2dbOxyurJDR5LjOhYCNZ0K+tU_Mod=Ptj9ApXaMLA@mail.gmail.com>
Subject: Re: FSL P5040 board doesn't boot after DRM updates (drm-next-2024-09-19)
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	DRI developers <dri-devel@lists.freedesktop.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, 
	Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Content-Type: multipart/alternative; boundary="0000000000004db6740623297ae1"

--0000000000004db6740623297ae1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Only a p5020 here so i can't test.
Sorry..

Dave



Op za 28 sep 2024 09:40 schreef Christian Zigotzky <chzigotzky@xenosoft.de>=
:

> On 28 September 2024 at 09:21am, Christian Zigotzky wrote:
>  >
>  >> =EF=BB=BFOn Sun, Sep 22, 2024 at 12:28=E2=80=AFAM Christian Zigotzky
>  >> <chzigotzky@xenosoft.de> wrote:
>  >>>
>  >>> Hi All,
>  >>>
>  >>> The lastest Git kernel doesn't boot anymore after the latest DRM
> updates
>  >>> (drm-next-2024-09-19). [1]
>  >>>
>  >>> I tested it with an AMD Radeon HD 6970 (Cayman XT) and with an AMD
>  >>> Radeon HD 5870 (Cypress XT).
>  >>>
>  >>> I reverted the DRM updates and after that the kernel boots without a=
ny
>  >>> problems.
>  >>>
>  >>> Please note: Due to a lack of time, I can't do a bisect.
>  >>>
>  >>> Please check the latest DRM updates.
> ------------
>  >>
>  >> Can you attach your dmesg output?  There was a regression in the dma
>  >> subsystem what was fixed by this commit:
>  >>
>  >> commit b348b6d17fd1d5d89b86db602f02be
>  >> a54a754bd8
>  >> Author: Leon Romanovsky <leon@kernel.org>
>  >> Date:   Sun Sep 22 21:09:48 2024 +0300
>  >>
>  >>    dma-mapping: report unlimited DMA addressing in IOMMU DMA path
>  >>
>  >> Alex
>  >>
>
> ------------
> Hi Alex,
>
> I tested the latest Git kernel on my FSL P5040 board today and it
> doesn't boot. Our FSL P5020 boards boot without any problems.
>
> I connected my FSL P5040 board with a serial cable to my PC for getting
> error messages. Unfortunately there aren't any error messages after the
> loading of the uImage.
>
> This means, that the dma-mapping patch doesn't solve the boot issue.
>
> Please check the latest DRM updates.
>
> Thanks
>
>

--0000000000004db6740623297ae1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Only a p5020 here so i can&#39;t test.<div dir=3D"auto">S=
orry..</div><div dir=3D"auto"><br></div><div dir=3D"auto">Dave</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Op za 28 sep 2024 09:40 sc=
hreef Christian Zigotzky &lt;<a href=3D"mailto:chzigotzky@xenosoft.de">chzi=
gotzky@xenosoft.de</a>&gt;:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 28 S=
eptember 2024 at 09:21am, Christian Zigotzky wrote:<br>
=C2=A0&gt;<br>
=C2=A0&gt;&gt; =EF=BB=BFOn Sun, Sep 22, 2024 at 12:28=E2=80=AFAM Christian =
Zigotzky<br>
=C2=A0&gt;&gt; &lt;<a href=3D"mailto:chzigotzky@xenosoft.de" target=3D"_bla=
nk" rel=3D"noreferrer">chzigotzky@xenosoft.de</a>&gt; wrote:<br>
=C2=A0&gt;&gt;&gt;<br>
=C2=A0&gt;&gt;&gt; Hi All,<br>
=C2=A0&gt;&gt;&gt;<br>
=C2=A0&gt;&gt;&gt; The lastest Git kernel doesn&#39;t boot anymore after th=
e latest DRM <br>
updates<br>
=C2=A0&gt;&gt;&gt; (drm-next-2024-09-19). [1]<br>
=C2=A0&gt;&gt;&gt;<br>
=C2=A0&gt;&gt;&gt; I tested it with an AMD Radeon HD 6970 (Cayman XT) and w=
ith an AMD<br>
=C2=A0&gt;&gt;&gt; Radeon HD 5870 (Cypress XT).<br>
=C2=A0&gt;&gt;&gt;<br>
=C2=A0&gt;&gt;&gt; I reverted the DRM updates and after that the kernel boo=
ts without any<br>
=C2=A0&gt;&gt;&gt; problems.<br>
=C2=A0&gt;&gt;&gt;<br>
=C2=A0&gt;&gt;&gt; Please note: Due to a lack of time, I can&#39;t do a bis=
ect.<br>
=C2=A0&gt;&gt;&gt;<br>
=C2=A0&gt;&gt;&gt; Please check the latest DRM updates.<br>
------------<br>
=C2=A0&gt;&gt;<br>
=C2=A0&gt;&gt; Can you attach your dmesg output?=C2=A0 There was a regressi=
on in the dma<br>
=C2=A0&gt;&gt; subsystem what was fixed by this commit:<br>
=C2=A0&gt;&gt;<br>
=C2=A0&gt;&gt; commit b348b6d17fd1d5d89b86db602f02be<br>
=C2=A0&gt;&gt; a54a754bd8<br>
=C2=A0&gt;&gt; Author: Leon Romanovsky &lt;<a href=3D"mailto:leon@kernel.or=
g" target=3D"_blank" rel=3D"noreferrer">leon@kernel.org</a>&gt;<br>
=C2=A0&gt;&gt; Date:=C2=A0=C2=A0 Sun Sep 22 21:09:48 2024 +0300<br>
=C2=A0&gt;&gt;<br>
=C2=A0&gt;&gt;=C2=A0=C2=A0=C2=A0 dma-mapping: report unlimited DMA addressi=
ng in IOMMU DMA path<br>
=C2=A0&gt;&gt;<br>
=C2=A0&gt;&gt; Alex<br>
=C2=A0&gt;&gt;<br>
<br>
------------<br>
Hi Alex,<br>
<br>
I tested the latest Git kernel on my FSL P5040 board today and it <br>
doesn&#39;t boot. Our FSL P5020 boards boot without any problems.<br>
<br>
I connected my FSL P5040 board with a serial cable to my PC for getting <br=
>
error messages. Unfortunately there aren&#39;t any error messages after the=
 <br>
loading of the uImage.<br>
<br>
This means, that the dma-mapping patch doesn&#39;t solve the boot issue.<br=
>
<br>
Please check the latest DRM updates.<br>
<br>
Thanks<br>
<br>
</blockquote></div>

--0000000000004db6740623297ae1--

