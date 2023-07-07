Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34C74B02D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 13:46:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bWs9TF9t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyBS54ZZ3z3cBG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 21:46:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bWs9TF9t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxz540481z3bn6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 13:13:57 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6b73b839025so1328053a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 20:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688699635; x=1691291635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vbUuEtz05KYPq1z68ACCZieX8e+bUUC/V8Wy/+io9Sc=;
        b=bWs9TF9tGzCgPVnQlfZKG5+EQThQcym+kBtel/911hr42FeYBtw0WqkCivHvi/rkmX
         uQfoL5By9H726ARLj+02Xjc45ztGEQPz6J2tjSp7fl89oUQIin6rVPo0u4/Q1IVgMMaM
         lIOtS+FjpZC1FpATJwJWJ3uj/U7gsUvg+xTaJkYopnseiszEFoVYvW7NRxxCMIFpbofz
         dxDWkV95JGFF2mvtWw6xCqDKiHL9ggFjiCNzHER8ESLMygAAxCQZUPqJMqSd+9cO1YQ/
         CNkidGWopPbKcbnpnKjmwHHMa91ZLmltk0aUdX0pddkSDD2WAfxpzxt5azNVf/WoHupX
         OaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688699635; x=1691291635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbUuEtz05KYPq1z68ACCZieX8e+bUUC/V8Wy/+io9Sc=;
        b=S8aggkRnL5RDAdIHdj9wWYersb1phdUQDTFYvfqxZ4emJeymgQAurmFZaxQBEUhAJH
         grCAdXvQ5iqrnLcRaBOb9cV2FXmx/nxom+LM8Vj6duqr1vwiQRUvWBXEZPzzMx9/b2J6
         y9ajIkiL/m3SlnPxmK8OImqGa6VpUprOh/8Ty0hgUbVUV49GDIetBcZb9oXA/SM1JpsT
         NTY63tberwY4wNbOwsn5hbn4UhUjagMddkaEDHACiaxnXLvrxfwJgXP5e+gbGfDDgHNU
         7pEetlfJED9o1oqNTDA+vzyRHbJDQVTcntS8S29qw9nFRys9KfgKNVphhP0Q1AqqtJjO
         9vBQ==
X-Gm-Message-State: ABy/qLaiWjwUJUifTPhUgNXOSIX3lPNbHTiXlKqpSttnLlatgSQFp8wo
	8lTf9sB+yQ40Es2eND6CTX2Xp5OjoM9lSkiwms4=
X-Google-Smtp-Source: APBJJlFZL/u1LRgkGKUjOubHv+g9HRYJ60+hFKy09JpWIkuoWWHwXlqwj33lY/1BVuOvTHcGg+rHRtVP3qSu9O2Wq8g=
X-Received: by 2002:a05:6358:52c3:b0:131:ce9c:9971 with SMTP id
 z3-20020a05635852c300b00131ce9c9971mr5502548rwz.29.1688699634680; Thu, 06 Jul
 2023 20:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com> <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de> <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
 <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl> <090cc065-b078-4f2c-9b2d-3b0b7418461d@sirena.org.uk>
 <CAA+D8AMTnZb-Sm9gh_jDDSz3y9jXY-mD9S6vXPekAbdfCJaKHA@mail.gmail.com>
In-Reply-To: <CAA+D8AMTnZb-Sm9gh_jDDSz3y9jXY-mD9S6vXPekAbdfCJaKHA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 7 Jul 2023 11:13:43 +0800
Message-ID: <CAA+D8AMNqU0J1EC--BBVYbXMf1dRGdS-ez5hs2E8M_hYtwq60w@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
To: Mark Brown <broonie@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000db898b05ffdd05d0"
X-Mailman-Approved-At: Fri, 07 Jul 2023 21:45:28 +1000
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

--000000000000db898b05ffdd05d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark

On Tue, Jul 4, 2023 at 12:03=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.=
com>
wrote:

>
>
> On Tue, Jul 4, 2023 at 1:59=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
>> On Mon, Jul 03, 2023 at 03:12:55PM +0200, Hans Verkuil wrote:
>>
>> > My main concern is that these cross-subsystem drivers are a pain to
>> > maintain. So there have to be good reasons to do this.
>>
>> > Also it is kind of weird to have to use the V4L2 API in userspace to
>> > deal with a specific audio conversion. Quite unexpected.
>>
>> > But in the end, that's a decision I can't make.
>>
>> > So I wait for that feedback. Note that if the decision is made that th=
is
>> > can use V4L2, then there is quite a lot more that needs to be done:
>> > documentation, new compliance tests, etc. It's adding a new API, and
>> that
>> > comes with additional work...
>>
>> Absolutely, I agree with all of this - my impression was that the target
>> here would be bypass of audio streams to/from a v4l2 device, without
>> bouncing through an application layer.  If it's purely for audio usage
>> with no other tie to v4l2 then involving v4l2 does just seem like
>> complication.
>>
>
> This audio use case is using the v4l2 application layer. in the user spac=
e
> I need to call below v4l2 ioctls to implement the feature:
> VIDIOC_QUERYCAP
> VIDIOC_TRY_FMT
> VIDIOC_S_FMT
> VIDIOC_REQBUFS
> VIDIOC_QUERYBUF
> VIDIOC_STREAMON
> VIDIOC_QBUF
> VIDIOC_DQBUF
> VIDIOC_STREAMOFF
>
> why the driver was put in the ALSA, because previously we implemented
> the ASRC M2P (memory to peripheral) in ALSA,  so I think it is better to
> add M2M driver in ALSA.  The hardware IP is the same. The compatible
> string is the same.
>
>
> Could you please share more of your ideas about this patch? and could
you please check further about this implementation.

I tried to find a good interface in ALSA for this m2m request, but didn't
find one,  then I try the V4L2, find it is good this audio case.

but it needs to extend the V4L2 API.

I have no idea how to go on, could you please recommend?

best regards
wang shengjiu

>
>

--000000000000db898b05ffdd05d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mark</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jul 4, 2023 at 12:03=E2=80=AFPM Sheng=
jiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">shengjiu.wang@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 4, 2023 at 1:59=E2=80=
=AFAM Mark Brown &lt;<a href=3D"mailto:broonie@kernel.org" target=3D"_blank=
">broonie@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Mon, Jul 03, 2023 at 03:12:55PM +0200, Hans Verkuil =
wrote:<br>
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
same.=C2=A0</div><div><br></div><div><br></div></div></div></blockquote><di=
v>Could you please share more of your=C2=A0ideas about this patch? and coul=
d</div><div>you please check further about this implementation.</div><div><=
br></div><div>I tried to find a good interface in ALSA for this m2m request=
, but didn&#39;t</div><div>find one,=C2=A0 then I try the V4L2, find it is =
good this audio case.</div><div><br></div><div>but it needs to extend the V=
4L2 API.=C2=A0</div><div><br></div><div>I have no idea how to go on, could =
you please recommend?=C2=A0=C2=A0</div><div><br></div><div>best regards</di=
v><div>wang shengjiu</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=A0</div></=
div></div>
</blockquote></div></div>

--000000000000db898b05ffdd05d0--
