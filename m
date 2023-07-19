Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8997597A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 16:01:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r3u1mbbq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5ctT3Cr3z30gy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 00:01:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r3u1mbbq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5VY52D2Lz2ykb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 19:15:51 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-66f3fc56ef4so413887b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 02:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689758148; x=1690362948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4xYMJ2qwFt3ysotZG6vyN3zgxfKZNUX3IXUBQy5PH3w=;
        b=r3u1mbbqB53w+AXZUQHRVaZwpdH/uEAb82ktK3H7HPMQE/lFGH1E5UfrLNwX7BkScX
         JJcmaHoKjxNKORJV85KF6OSLq+Y/nuPeK1QK+IU3m32teZhwNzBChVHWiKkZXRz0KQZt
         1QoDu8Oc1oktDIYUIr4dMS5Bm1flQzEPEQc7akpWWL/RhXrx6Qpo24zfU87loejANJud
         H7KFHYM9jRpM0o6BWfGdYZ8cMRjoR1Mm44pEsqKfb7KlfxYGbSULS0ZzBCAevhWv/D98
         XMCxVJM9MDzihB82e+tThP5A0gG+mmJ8XenfftlpHY1zDzSf5afL7Wn6paU2WNT4hBeA
         09qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689758148; x=1690362948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xYMJ2qwFt3ysotZG6vyN3zgxfKZNUX3IXUBQy5PH3w=;
        b=fMotS9iooyH64rXnBDZIvvmbcIfGswF7CEdKk6ypWenpG070YS/mVESfE/56cbXDS4
         PrH0PvCWlHGVQALyka+diKNLdmqYtzc6JbyCDJCznj5Dv8xXi39aYdHwYkDVqa8dEZAk
         YPxHJYazOXklYo3rXZ40ncNJkYTz+DqUvG/RuXVecQI8jNziO47RNSOavIcObDlcHdKK
         i5awQQEn1WFGR9FEZRQJwfnoKPRGQzBKoL7LBFuWyFHESXFO/ieZpNLeX5UDYZL8vhNT
         hZZpWJBBcc2nPJnxbOwFRco4gWAdQRe3txIVAPuqkzsVOgnfciCkoLNS/qwR1MesItcf
         ZADw==
X-Gm-Message-State: ABy/qLZSuK4qxRoqf6LGGFRIrICQwkd9YSYg305sC4+dE+8nl9NSrVkV
	JPZwAv5mXEFF5+IB+emuZjztEj4VP2bVoT4pl8I=
X-Google-Smtp-Source: APBJJlFN9CjpCw8/0jcD6IysUeUwKyNP9eYGqm+T3UXh7ICdwsLpt8yXN7FmTeZ/HzLXjeEQcMFLjDbuLAyz6vfpfHk=
X-Received: by 2002:a17:90b:4a91:b0:253:3eb5:3ade with SMTP id
 lp17-20020a17090b4a9100b002533eb53ademr2100966pjb.8.1689758148096; Wed, 19
 Jul 2023 02:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com> <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de> <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
 <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl> <090cc065-b078-4f2c-9b2d-3b0b7418461d@sirena.org.uk>
 <CAA+D8AMTnZb-Sm9gh_jDDSz3y9jXY-mD9S6vXPekAbdfCJaKHA@mail.gmail.com> <CAA+D8AMNqU0J1EC--BBVYbXMf1dRGdS-ez5hs2E8M_hYtwq60w@mail.gmail.com>
In-Reply-To: <CAA+D8AMNqU0J1EC--BBVYbXMf1dRGdS-ez5hs2E8M_hYtwq60w@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 19 Jul 2023 17:15:36 +0800
Message-ID: <CAA+D8ANLjOOHuc5OqhsdFX1_N_=fbdDnFEAsSBs06zDGpJ8TZg@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
To: Mark Brown <broonie@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000002c76970600d37a50"
X-Mailman-Approved-At: Wed, 19 Jul 2023 23:59:42 +1000
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

--0000000000002c76970600d37a50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark

On Fri, Jul 7, 2023 at 11:13=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail.=
com>
wrote:

> Hi Mark
>
> On Tue, Jul 4, 2023 at 12:03=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmai=
l.com>
> wrote:
>
>>
>>
>> On Tue, Jul 4, 2023 at 1:59=E2=80=AFAM Mark Brown <broonie@kernel.org> w=
rote:
>>
>>> On Mon, Jul 03, 2023 at 03:12:55PM +0200, Hans Verkuil wrote:
>>>
>>> > My main concern is that these cross-subsystem drivers are a pain to
>>> > maintain. So there have to be good reasons to do this.
>>>
>>> > Also it is kind of weird to have to use the V4L2 API in userspace to
>>> > deal with a specific audio conversion. Quite unexpected.
>>>
>>> > But in the end, that's a decision I can't make.
>>>
>>> > So I wait for that feedback. Note that if the decision is made that
>>> this
>>> > can use V4L2, then there is quite a lot more that needs to be done:
>>> > documentation, new compliance tests, etc. It's adding a new API, and
>>> that
>>> > comes with additional work...
>>>
>>> Absolutely, I agree with all of this - my impression was that the targe=
t
>>> here would be bypass of audio streams to/from a v4l2 device, without
>>> bouncing through an application layer.  If it's purely for audio usage
>>> with no other tie to v4l2 then involving v4l2 does just seem like
>>> complication.
>>>
>>
>> This audio use case is using the v4l2 application layer. in the user spa=
ce
>> I need to call below v4l2 ioctls to implement the feature:
>> VIDIOC_QUERYCAP
>> VIDIOC_TRY_FMT
>> VIDIOC_S_FMT
>> VIDIOC_REQBUFS
>> VIDIOC_QUERYBUF
>> VIDIOC_STREAMON
>> VIDIOC_QBUF
>> VIDIOC_DQBUF
>> VIDIOC_STREAMOFF
>>
>> why the driver was put in the ALSA, because previously we implemented
>> the ASRC M2P (memory to peripheral) in ALSA,  so I think it is better to
>> add M2M driver in ALSA.  The hardware IP is the same. The compatible
>> string is the same.
>>
>>
>> Could you please share more of your ideas about this patch? and could
> you please check further about this implementation.
>
> I tried to find a good interface in ALSA for this m2m request, but didn't
> find one,  then I try the V4L2, find it is good this audio case.
>
> but it needs to extend the V4L2 API.
>
> I have no idea how to go on, could you please recommend?
>
>
Should I implement the asrc m2m driver as a separate v4l2 driver?
And move it to the /driver/media folder ? In ALSA part, just need
register the platform device.

The bridge between ALSA and V4L2 framework can be the header
file in /include/sound/

Does it sound better?

Best regards
Wang Shengjiu

--0000000000002c76970600d37a50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mark</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jul 7, 2023 at 11:13=E2=80=AFAM Sheng=
jiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">shengjiu.wang@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div>Hi Mark</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 4, 2023 at 12:03=E2=80=AFPM Sh=
engjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com" target=3D"_blank=
">shengjiu.wang@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul =
4, 2023 at 1:59=E2=80=AFAM Mark Brown &lt;<a href=3D"mailto:broonie@kernel.=
org" target=3D"_blank">broonie@kernel.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Mon, Jul 03, 2023 at 03:12:55PM=
 +0200, Hans Verkuil wrote:<br>
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
you please recommend?=C2=A0=C2=A0</div><div><br></div></div></div></blockqu=
ote><div><br></div><div>Should I implement the asrc m2m driver as a separat=
e v4l2 driver?</div><div>And move it to the /driver/media folder ? In ALSA =
part, just need</div><div>register the platform device.</div><div><br></div=
><div>The bridge between ALSA and V4L2 framework can be the header</div><di=
v>file in /include/sound/=C2=A0</div><div><br></div><div>Does it sound bett=
er?=C2=A0<br></div><div><br></div><div>Best regards</div><div>Wang Shengjiu=
</div></div></div>

--0000000000002c76970600d37a50--
