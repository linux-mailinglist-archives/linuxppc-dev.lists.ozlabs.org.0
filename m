Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7AB74682B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 05:59:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YyGgvrhe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qw8FQ2Tczz3bYj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 13:59:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YyGgvrhe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qw884231fz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 13:55:15 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-55adfa61199so3793431a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jul 2023 20:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688442912; x=1691034912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rwx03+riSgIcGhZD5uDgqJNL+XswzICedgftjqxmi8w=;
        b=YyGgvrheaTlxvcr3I0f7KosN48kRGYJdOoB64Y31i/+uRTb2o5s/AmjK4gFf1gylk7
         usjhzcO5RbWFA43quUIOh1ZXdhE+P80fnP94r+65DG/ZuFLzw6D8geVhnfQ/+ys1GDRT
         jPDc2zmG6ZqcP0QzorU7h83tm5m6Fuv8v0gy2v1Zyw+As1eH9FC3aUod1AOvcVv70v8l
         zKIC17lXTGrDascs2KjOEkY+NB4dgykiuLw8Auz3GZ0kEYjmrhsHuhiChHtZpm/WSxdT
         nwPHQLM9WEOvdtL6xQHeks9KZUwkpWUQz1uB+93J5nz1sJX/yuaTeFtziCjEqAfIKdyv
         e93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688442912; x=1691034912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rwx03+riSgIcGhZD5uDgqJNL+XswzICedgftjqxmi8w=;
        b=ab46IPlAF3lshrJft2ORmYi/xz4LovMYUB1cBJWZ9Ho5h4W8BvSYX0YCIbo78oQrun
         3ritqQ09dUWQT4fxv4ns7in730igYi+8AcF6kfVUMhQO2yNh/OPkpxxgnJOV3bDonFKj
         EXnCaEqgA6cPb2RAbvw27kVDsT38xwm4ECZHH5bRfb00I+34zUYV7MLe5YXDbC5mQ3Tg
         Ngm4XtxS4qgwU8dYryP8Fahh1bAEbbOPKWRlz1wyymFbSSdMT6FRubJj5vOw+IVuKJAf
         80N8XPSsb8eD+8+WOfQoZ00hxbupr8dDKvYiacqQwlG1UWJSvQwY666/kPWCkJ7nkXEJ
         sK3A==
X-Gm-Message-State: ABy/qLY8mfOYJakLUT8nCCgdGW4RI+ax0JeQ+vSt+xvhY3OESv3YPddC
	djiLneQ963GnOJRPf+aYNQ5LbDLfLD2qReRm7xE=
X-Google-Smtp-Source: APBJJlECTqsP4VOOhEVFKTXcQ9cu/zS70LO3Sa2iX7IOYlpTvj/R73lBjP3r91snhiJsMvSM466YQTaisv6jjoddZWk=
X-Received: by 2002:a05:6a00:22cb:b0:682:616a:f910 with SMTP id
 f11-20020a056a0022cb00b00682616af910mr16501287pfj.20.1688442912125; Mon, 03
 Jul 2023 20:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com> <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de> <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
 <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl> <8735255dqn.wl-tiwai@suse.de>
In-Reply-To: <8735255dqn.wl-tiwai@suse.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Jul 2023 11:55:00 +0800
Message-ID: <CAA+D8AMFKBVEstiKq6sE0rByy4SEmSROFOj-cnJENFygVXW9xQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
To: Takashi Iwai <tiwai@suse.de>
Content-Type: multipart/alternative; boundary="00000000000000360705ffa14037"
X-Mailman-Approved-At: Tue, 04 Jul 2023 13:59:11 +1000
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Jacopo Mondi <jacopo@jmondi.org>, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000000360705ffa14037
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2023 at 9:25=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:

> On Mon, 03 Jul 2023 15:12:55 +0200,
> Hans Verkuil wrote:
> >
> > On 03/07/2023 14:53, Mark Brown wrote:
> > > On Mon, Jul 03, 2023 at 02:07:10PM +0200, Takashi Iwai wrote:
> > >> Shengjiu Wang wrote:
> > >
> > >>> There is no such memory to memory interface defined in ALSA.  Seems
> > >>> ALSA is not designed for M2M cases.
> > >
> > >> There is no restriction to implement memory-to-memory capture in ALS=
A
> > >> framework.  It'd be a matter of the setup of PCM capture source, and
> > >> you can create a corresponding kcontrol element to switch the mode o=
r
> > >> assign a dedicated PCM substream, for example.  It's just that there
> > >> was little demand for that.
> > >
> > > Yeah, it's not a terrible idea.  We might use it more if we ever get
> > > better support for DSP audio, routing between the DSP and external
> > > devices if driven from the CPU would be a memory to memory thing.
> > >
> > >> I'm not much against adding the audio capture feature to V4L2,
> > >> though, if it really makes sense.  But creating a crafted /dev/audio=
*
> > >> doesn't look like a great idea to me, at least.
> > >
> > > I've still not looked at the code at all.
> >
> > My main concern is that these cross-subsystem drivers are a pain to
> > maintain. So there have to be good reasons to do this.
> >
> > Also it is kind of weird to have to use the V4L2 API in userspace to
> > deal with a specific audio conversion. Quite unexpected.
> >
> > But in the end, that's a decision I can't make.
> >
> > So I wait for that feedback. Note that if the decision is made that thi=
s
> > can use V4L2, then there is quite a lot more that needs to be done:
> > documentation, new compliance tests, etc. It's adding a new API, and th=
at
> > comes with additional work...
>
> All agreed.  Especially in this case, it doesn't have to be in V4L2
> API, as it seems.
>
> (Though, the support of audio on V4L2 might be useful if it's closely
> tied with the a stream.  But that's another story.)
>

audio is a stream,  for this m2m audio case, V4L2 is the best choice
I found.

I know there is API change for V4L2,  but V4L2 is a good framework
for memory to memory,  I think it is worth to do this change.

if implement this M2M case in ALSA,  we may need to create a sound
card and open it twice for playback and capture,  it is complicated
to do this,  and I am not sure if there is any other issue besides these.
I can't find an example in the ALSA framework for this case.

best regards
wang shengjiu

>
>
> thanks,
>
> Takashi
>

--00000000000000360705ffa14037
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 3, 2023 at 9:25=E2=80=AFP=
M Takashi Iwai &lt;<a href=3D"mailto:tiwai@suse.de">tiwai@suse.de</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 03=
 Jul 2023 15:12:55 +0200,<br>
Hans Verkuil wrote:<br>
&gt; <br>
&gt; On 03/07/2023 14:53, Mark Brown wrote:<br>
&gt; &gt; On Mon, Jul 03, 2023 at 02:07:10PM +0200, Takashi Iwai wrote:<br>
&gt; &gt;&gt; Shengjiu Wang wrote:<br>
&gt; &gt; <br>
&gt; &gt;&gt;&gt; There is no such memory to memory interface defined in AL=
SA.=C2=A0 Seems<br>
&gt; &gt;&gt;&gt; ALSA is not designed for M2M cases.<br>
&gt; &gt; <br>
&gt; &gt;&gt; There is no restriction to implement memory-to-memory capture=
 in ALSA<br>
&gt; &gt;&gt; framework.=C2=A0 It&#39;d be a matter of the setup of PCM cap=
ture source, and<br>
&gt; &gt;&gt; you can create a corresponding kcontrol element to switch the=
 mode or<br>
&gt; &gt;&gt; assign a dedicated PCM substream, for example.=C2=A0 It&#39;s=
 just that there<br>
&gt; &gt;&gt; was little demand for that.<br>
&gt; &gt; <br>
&gt; &gt; Yeah, it&#39;s not a terrible idea.=C2=A0 We might use it more if=
 we ever get<br>
&gt; &gt; better support for DSP audio, routing between the DSP and externa=
l<br>
&gt; &gt; devices if driven from the CPU would be a memory to memory thing.=
<br>
&gt; &gt; <br>
&gt; &gt;&gt; I&#39;m not much against adding the audio capture feature to =
V4L2,<br>
&gt; &gt;&gt; though, if it really makes sense.=C2=A0 But creating a crafte=
d /dev/audio*<br>
&gt; &gt;&gt; doesn&#39;t look like a great idea to me, at least.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve still not looked at the code at all.<br>
&gt; <br>
&gt; My main concern is that these cross-subsystem drivers are a pain to<br=
>
&gt; maintain. So there have to be good reasons to do this.<br>
&gt; <br>
&gt; Also it is kind of weird to have to use the V4L2 API in userspace to<b=
r>
&gt; deal with a specific audio conversion. Quite unexpected.<br>
&gt; <br>
&gt; But in the end, that&#39;s a decision I can&#39;t make.<br>
&gt; <br>
&gt; So I wait for that feedback. Note that if the decision is made that th=
is<br>
&gt; can use V4L2, then there is quite a lot more that needs to be done:<br=
>
&gt; documentation, new compliance tests, etc. It&#39;s adding a new API, a=
nd that<br>
&gt; comes with additional work...<br>
<br>
All agreed.=C2=A0 Especially in this case, it doesn&#39;t have to be in V4L=
2<br>
API, as it seems.<br>
<br>
(Though, the support of audio on V4L2 might be useful if it&#39;s closely<b=
r>
tied with the a stream.=C2=A0 But that&#39;s another story.)<br></blockquot=
e><div><br></div><div>audio is a stream,=C2=A0 for this m2m audio case, V4L=
2 is the best choice</div><div>I found.=C2=A0</div><div><br></div><div>I kn=
ow there is API change for V4L2,=C2=A0 but V4L2 is a good framework</div><d=
iv>for memory to memory,=C2=A0 I think it is worth to do this change.</div>=
<div><br></div><div>if implement this M2M case in ALSA,=C2=A0 we may need t=
o create a sound</div><div>card and open it twice for playback and capture,=
=C2=A0 it is complicated</div><div>to do this,=C2=A0 and I am not sure if t=
here is any other issue besides these.</div><div>I can&#39;t find an exampl=
e in the ALSA framework for this case.</div><div><br></div><div>best regard=
s</div><div>wang shengjiu</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
<br>
thanks,<br>
<br>
Takashi<br>
</blockquote></div></div>

--00000000000000360705ffa14037--
