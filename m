Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2247438AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 11:50:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MdD9GNu7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsrCR4CG2z3c3c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 19:50:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MdD9GNu7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qsgxh63gpz305g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 13:37:43 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-765a7768f1dso135944385a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 20:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688096260; x=1690688260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2vp1WxV1X+3awcRK1E83g4O6ghnsdCU3yjKhzsqaIy0=;
        b=MdD9GNu7sZzTrO/Wii7ecDZek1ixOHCfNdnLc7sTuyUOtdGWj3sojyHFgRQ4xvw3yQ
         a8r49oDexRV3yLeAL/QvoCA+H8S00GzoWsG1HG/hZg+nkFBEP9pSGXMvO9DNl4dxZTCK
         Qk+SB+WvcVm2iZFMaJELJFqFg86P2f5NtWVyE9XSFV9EJtUVzso7CzCLtCd68iI4VnmG
         5KeSqz/hep3dJj12pur/2dZemGZDogEGJGCIY4nlQNuWwtDzs8p+miD6fA+jkuTDBamf
         HmovSUaNQTj9ZHufOdZe5VLr0dAuYLreqnJ0bGLVHxhmIMvQ3+DcM52erwJQ/VFoYNHx
         oyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688096260; x=1690688260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vp1WxV1X+3awcRK1E83g4O6ghnsdCU3yjKhzsqaIy0=;
        b=GadEY3MU3mWVpjQxccz+jVzwd5/pZ1NCJCm2Qo4BjRFizpQ4h7jydekHqSj5LwZbFe
         DQC5kcsDso9/+Fckz4RFHx0vx64jgM9K9bBr23bnKbmsbjVIsebl9wpVofi69XT2P5rb
         vD6dJRCSdZna+IW3Mig+J2czVb7sanqiQW4pkg02W5Yq1by3Zvzxx/kNViZF6grv4voj
         oPjocWx80zHmxD5AgHcPhw9EN16F67kdDXKYDJVsGJdcXryF0+E+uopEqEZl23OeAlXj
         Qoh/ka9jKrNqGyRB1FV2nxMInagphbNR5vxMXXYzq8fgAsUwfYw3qeq4FR4Rsl6trUxO
         DVrA==
X-Gm-Message-State: ABy/qLbwcA7bw+pUzmx451sROCLn0CTK4RcHZu18lpdD6B8iQUFJ7gcE
	ywPGbsPjarQSZVy+suPtaexRFloa2bYGTcJwb3DQs+EmXLY=
X-Google-Smtp-Source: APBJJlFT8Jj143WWzJfRmgE75w9CVGXnb+cPsWTuEXJIzGZgDnRszVIt2ay4Hq6w9HuFogT4UgL9dU21voR3z25NXt8=
X-Received: by 2002:a05:620a:ccb:b0:765:7c13:134f with SMTP id
 b11-20020a05620a0ccb00b007657c13134fmr976720qkj.69.1688096260599; Thu, 29 Jun
 2023 20:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-5-git-send-email-shengjiu.wang@nxp.com> <f6598cb0-6773-4475-85e1-5dfacaa16de3@sirena.org.uk>
In-Reply-To: <f6598cb0-6773-4475-85e1-5dfacaa16de3@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jun 2023 11:37:29 +0800
Message-ID: <CAA+D8ANbMYr9ATSfWnbq69ECHOPNTiOBc7QACEeHomCC+rTHng@mail.gmail.com>
Subject: Re: [PATCH 4/6] ASoC: fsl_asrc: Add memory to memory driver
To: Mark Brown <broonie@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000f5b50805ff5089a9"
X-Mailman-Approved-At: Fri, 30 Jun 2023 19:48:38 +1000
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
Cc: alsa-devel@alsa-project.org, mchehab@kernel.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, perex@perex.cz, linux-media@vger.kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000f5b50805ff5089a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 7:39=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> On Thu, Jun 29, 2023 at 09:37:51AM +0800, Shengjiu Wang wrote:
> > Implement the ASRC memory to memory function using
> > the v4l2 framework, user can use this function with
> > v4l2 ioctl interface.
> >
> > User send the output and capture buffer to driver and
> > driver store the converted data to the capture buffer.
> >
> > This feature can be shared by ASRC and EASRC drivers
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/Kconfig        |  13 +
> >  sound/soc/fsl/Makefile       |   2 +
> >  sound/soc/fsl/fsl_asrc_m2m.c | 878 +++++++++++++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_asrc_m2m.h |  48 ++
>
> This feels like the bit where we interface v4l to ASoC should be a
> separate library, there shouldn't be anything device specific about
> getting an audio stream into a block of memory.  I'm thinking something
> like the way we handle dmaengine here.
>
> I've not dug into the code yet though.
>

Users may want to get the ASRC output in the user space, then
do mixing with other streams before sending to ALSA.

As there is no such API in ASoC,  the best interface I found is
the V4L2, but I need to do a little modification of the V4L2 API,

extend it for audio usage.

Could you please suggest more about the "separate library"?
Should I place this "sound/soc/fsl/fsl_asrc_m2m.c" in another folder?

best regards
wang shengjiu

--000000000000f5b50805ff5089a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 29, 2023 at 7:39=E2=80=AF=
PM Mark Brown &lt;<a href=3D"mailto:broonie@kernel.org">broonie@kernel.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Thu, Jun 29, 2023 at 09:37:51AM +0800, Shengjiu Wang wrote:<br>
&gt; Implement the ASRC memory to memory function using<br>
&gt; the v4l2 framework, user can use this function with<br>
&gt; v4l2 ioctl interface.<br>
&gt; <br>
&gt; User send the output and capture buffer to driver and<br>
&gt; driver store the converted data to the capture buffer.<br>
&gt; <br>
&gt; This feature can be shared by ASRC and EASRC drivers<br>
&gt; <br>
&gt; Signed-off-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@nxp.c=
om" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 sound/soc/fsl/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +<br=
>
&gt;=C2=A0 sound/soc/fsl/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02=
 +<br>
&gt;=C2=A0 sound/soc/fsl/fsl_asrc_m2m.c | 878 +++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 sound/soc/fsl/fsl_asrc_m2m.h |=C2=A0 48 ++<br>
<br>
This feels like the bit where we interface v4l to ASoC should be a<br>
separate library, there shouldn&#39;t be anything device specific about<br>
getting an audio stream into a block of memory.=C2=A0 I&#39;m thinking some=
thing<br>
like the way we handle dmaengine here.<br>
<br>
I&#39;ve not dug into the code yet though.<br></blockquote><div><br></div><=
div><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:C=
alibri,sans-serif">Users may want to get the ASRC output in the user space,=
 then <br>do mixing with other streams before sending to ALSA. <br><br>As t=
here is no such API in ASoC, =C2=A0the best interface I found is<br>the V4L=
2, but I need to do a little modification of the V4L2 API,</p><p class=3D"M=
soNormal" style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif=
">extend it for audio usage.<br><br>Could you please suggest more about the=
 &quot;separate library&quot;?<br>Should I place this &quot;sound/soc/fsl/f=
sl_asrc_m2m.c&quot; in another folder?<br><br>best regards<br>wang shengjiu=
<br></p></div></div></div>

--000000000000f5b50805ff5089a9--
