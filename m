Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF5746857
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 06:25:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=R/GiOUH4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qw8qK0pxMz3bcJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 14:25:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=R/GiOUH4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qw8Kt497Mz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 14:03:45 +1000 (AEST)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-563439ea4a2so3396884eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jul 2023 21:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688443422; x=1691035422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ittuKIOZKCNmsU3jQyHtoNh99DGWbVOw7pW+3qCeyd0=;
        b=R/GiOUH4R0Z5OtP6eK0cirFzsk9jVyjt/EbwTyjW4bfbbFyuIcq6fq65XL+Acuzin5
         4gGutMqZXy/QI0ziTz9JWYoHjgEdc3tyOmb3hAZa766ywvv9F2185RhyO0vjAilSqqsk
         MDeha5pzZOTCBzfwGx1PaG0E1Emfavre++ZEyMtMTXQpYhSHhPhHjpAaf2KCdtkXDJf6
         ZGWxVUTSuMD5OWxuam578FXyd2PG+6VjltaXMAq6LKZLLpRsNvP/5T9d7APFZiOjTWZw
         hca+XeEYdZf60v5lsT/PkfIpNN0lTPrg3RJbkhdVcBbDk9zQLgwOeIXqE2HE6jzIMzZ7
         ydUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688443422; x=1691035422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ittuKIOZKCNmsU3jQyHtoNh99DGWbVOw7pW+3qCeyd0=;
        b=f7eXx31hYN46hfSJkvNqmaAwlZhTVHD2zXhRU5DDJEcGJlxlGh/CiQplUJLI+vr7Fi
         1134KqgTGiKS0nNXVwJojOpcg+iHqv6c9kWSemJxbISjoOqqprlRDkd2GolsEgLQD3w2
         6qtz+0MtnuhxCawIBuRH30QRysKt7wBX8D/AIFgSma01bvMyKXWjJCeixv2W4SX8GfVR
         ooAZbf6yuypEHOT1KyvcZ10J4j/2XaMPnOQRSZQvTJpDV7SJ9XEvu6bENKrzX1qce8rE
         8zDr+nbWQy2Eq7MeW5AkeFs1sdOCHoLU/3DE/uySOZxbkmvGlUsVcZWiOUi3iCNtq5/d
         9Jng==
X-Gm-Message-State: ABy/qLaJWjSHkEaBCqauiuJYj0+C92ufAUB/r4z6uC1PRDys0GyeYWVI
	Iv6pnLnMfgSiWJJ2udNDo2gkC3njud4xhuZ1TH8=
X-Google-Smtp-Source: APBJJlEwp3cvrYvZahpzCfn4BaFBYr9rUtC/LHf8sSGpuXaJxTgbAX/VvMqn7ylQ4+maVuXvf/dd2Do0whF7+4/dEtI=
X-Received: by 2002:a05:6358:ce24:b0:132:ce1f:6793 with SMTP id
 gt36-20020a056358ce2400b00132ce1f6793mr9122228rwb.21.1688443422174; Mon, 03
 Jul 2023 21:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com> <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de> <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
 <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl> <090cc065-b078-4f2c-9b2d-3b0b7418461d@sirena.org.uk>
In-Reply-To: <090cc065-b078-4f2c-9b2d-3b0b7418461d@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Jul 2023 12:03:30 +0800
Message-ID: <CAA+D8AMTnZb-Sm9gh_jDDSz3y9jXY-mD9S6vXPekAbdfCJaKHA@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
To: Mark Brown <broonie@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000066ef3b05ffa15e1e"
X-Mailman-Approved-At: Tue, 04 Jul 2023 14:25:05 +1000
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Jacopo Mondi <jacopo@jmondi.org>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Sakari Ailus <sakari.ailus@iki.fi>, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000066ef3b05ffa15e1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 4, 2023 at 1:59=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:

> On Mon, Jul 03, 2023 at 03:12:55PM +0200, Hans Verkuil wrote:
>
> > My main concern is that these cross-subsystem drivers are a pain to
> > maintain. So there have to be good reasons to do this.
>
> > Also it is kind of weird to have to use the V4L2 API in userspace to
> > deal with a specific audio conversion. Quite unexpected.
>
> > But in the end, that's a decision I can't make.
>
> > So I wait for that feedback. Note that if the decision is made that thi=
s
> > can use V4L2, then there is quite a lot more that needs to be done:
> > documentation, new compliance tests, etc. It's adding a new API, and th=
at
> > comes with additional work...
>
> Absolutely, I agree with all of this - my impression was that the target
> here would be bypass of audio streams to/from a v4l2 device, without
> bouncing through an application layer.  If it's purely for audio usage
> with no other tie to v4l2 then involving v4l2 does just seem like
> complication.
>

This audio use case is using the v4l2 application layer. in the user space
I need to call below v4l2 ioctls to implement the feature:
VIDIOC_QUERYCAP
VIDIOC_TRY_FMT
VIDIOC_S_FMT
VIDIOC_REQBUFS
VIDIOC_QUERYBUF
VIDIOC_STREAMON
VIDIOC_QBUF
VIDIOC_DQBUF
VIDIOC_STREAMOFF

why the driver was put in the ALSA, because previously we implemented
the ASRC M2P (memory to peripheral) in ALSA,  so I think it is better to
add M2M driver in ALSA.  The hardware IP is the same. The compatible
string is the same.

Best regards
Wang Shengjiu

--00000000000066ef3b05ffa15e1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 4, 2023 at 1:59=E2=80=AFA=
M Mark Brown &lt;<a href=3D"mailto:broonie@kernel.org">broonie@kernel.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Mon, Jul 03, 2023 at 03:12:55PM +0200, Hans Verkuil wrote:<br>
<br>
&gt; My main concern is that these cross-subsystem drivers are a pain to<br=
>
&gt; maintain. So there have to be good reasons to do this.<br>
<br>
&gt; Also it is kind of weird to have to use the V4L2 API in userspace to<b=
r>
&gt; deal with a specific audio conversion. Quite unexpected.<br>
<br>
&gt; But in the end, that&#39;s a decision I can&#39;t make.<br>
<br>
&gt; So I wait for that feedback. Note that if the decision is made that th=
is<br>
&gt; can use V4L2, then there is quite a lot more that needs to be done:<br=
>
&gt; documentation, new compliance tests, etc. It&#39;s adding a new API, a=
nd that<br>
&gt; comes with additional work...<br>
<br>
Absolutely, I agree with all of this - my impression was that the target<br=
>
here would be bypass of audio streams to/from a v4l2 device, without<br>
bouncing through an application layer.=C2=A0 If it&#39;s purely for audio u=
sage<br>
with no other tie to v4l2 then involving v4l2 does just seem like<br>
complication.<br></blockquote><div><br></div><div>This audio use case is us=
ing the v4l2 application layer. in the user space</div><div>I need to call =
below v4l2 ioctls to implement the feature:=C2=A0</div><div>VIDIOC_QUERYCAP=
<br></div><div>VIDIOC_TRY_FMT<br></div><div>VIDIOC_S_FMT<br></div><div>VIDI=
OC_REQBUFS<br></div><div>VIDIOC_QUERYBUF<br></div><div>VIDIOC_STREAMON<br><=
/div><div>VIDIOC_QBUF<br></div><div>VIDIOC_DQBUF<br></div><div>VIDIOC_STREA=
MOFF<br></div><div><br></div><div>why the driver was put in the ALSA, becau=
se previously we implemented</div><div>the ASRC M2P (memory to peripheral) =
in ALSA,=C2=A0 so I think it is better to</div><div>add M2M driver in ALSA.=
=C2=A0 The hardware IP is the same. The compatible</div><div>string is the =
same.=C2=A0</div><div><br></div><div>Best regards</div><div>Wang Shengjiu</=
div><div><br></div><div><br></div><div><br></div><div>=C2=A0</div></div></d=
iv>

--00000000000066ef3b05ffa15e1e--
