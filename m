Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E097438A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 11:49:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QjT20Boc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsrBT5TvZz3bwJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 19:49:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QjT20Boc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qsgdj6Ksgz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 13:23:52 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7659c6cae2cso110166385a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 20:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688095427; x=1690687427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IjYCS8I41AmnJ/jiB/mH47GSobNE4UeRiXT/NLT9rIk=;
        b=QjT20Bocjo7V2+WuEcEfGM9qN0KMRB0zu5rTHauEkaiizZ9CmIjWp1pJFi+gUA/Xqf
         Zo2lLKDl41qjUG6QjJIsMaK+8SruNUZvf0yaZmYDx424JVideejkaghGeEh6pPCqw8ic
         c0PncTQjc41XZtEfG42paEUL5tScFsDy65Zp8qEnz7Q0R0kZmhRmI+zo5tFg+cyaxzPl
         WljEW9lbK+14m3uiYR0Clb9DGbjGt1jdKS6vNfowxBzgQLQxv1oNfwmnNah1O91jYx9/
         XM2IY6BbMMDs++QWvZp9mpMVySQDv1nKxmd/XcJ95lwoV+CHXGyGTYdaVoeHYEm0upn+
         PEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688095427; x=1690687427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjYCS8I41AmnJ/jiB/mH47GSobNE4UeRiXT/NLT9rIk=;
        b=WGZYz4P+1p2lo1BzwNzPZAgDKj0SP5sfvdGBbQofew/DwwihY1oAHN7dP6IGgF9+S5
         SejjT26RUV7sxlGuYIWhI6piktYnxi9jAvRUMg3kYdtvg89vg8kWDzVBvh0oGtsZeHug
         VsAn2Yy5nqF+7DGhOIUYbOZguJvd/2yttvXaigxZgZXP7OV1CUjR4q1FzDxtZtLQ8U4u
         TJlv69fjSgC4zji768cgVh8rJbR/apAKPXBIyJkSaTPm0r6OZKuHIxcryhVhUS0zVhNf
         mFi2ILJL0gbMtvICaO4HVMAHYAVexAX+voTSJEkTI8LV6ZV9DoFdq3xuD/7SNMih4zE1
         Xzqw==
X-Gm-Message-State: AC+VfDwU2V9J2YtFEXJ9jAQs5epWdpVukBvsZhoPmk2eDyT8H+NZ6/LD
	CcxHmNGtYGylHfWpd1Z5WkZYEeiF9SNo3UxTEO8=
X-Google-Smtp-Source: ACHHUZ5+v+RvhrJVNX6QDozyS/EPB42R4fBJoAMAyJjZEOJYRBibA9sTI6d0WUr3KKVTQMZ2wi2evjar1gEgdFfTABw=
X-Received: by 2002:a05:620a:22c4:b0:767:1197:9a9c with SMTP id
 o4-20020a05620a22c400b0076711979a9cmr984386qki.8.1688095427431; Thu, 29 Jun
 2023 20:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-4-git-send-email-shengjiu.wang@nxp.com> <CAOMZO5DPHmm7YuHBfYHpx2-g4R6t1BQ93GBAZvyyb_rBz7+hFg@mail.gmail.com>
In-Reply-To: <CAOMZO5DPHmm7YuHBfYHpx2-g4R6t1BQ93GBAZvyyb_rBz7+hFg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jun 2023 11:23:36 +0800
Message-ID: <CAA+D8AMw+9sEcBi+H41qMnK7H1Stkip7pQ9hvWPh5ZtujGJtBQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: fsl_easrc: define functions for memory to
 memory usage
To: Fabio Estevam <festevam@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004c8f2205ff50586f"
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
Cc: alsa-devel@alsa-project.org, mchehab@kernel.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, broonie@kernel.org, perex@perex.cz, linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000004c8f2205ff50586f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 7:00=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> Hi Shengjiu,
>
> On Wed, Jun 28, 2023 at 11:10=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp=
.com>
> wrote:
> >
> > ASRC can be used on memory to memory case, define several
> > functions for m2m usage and export them as function pointer.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> Could you please explain what is the benefit of using M2M in the EASRC
> driver?
>
> Users may want to get the ASRC output in the user space, then do mixing
with
other streams before sending to DAC.
so this patch-set is to use the v4l2 API for this usage, because there is
no such
API in ASoC.


> A few weeks ago, an imx8mn user reported that the EASRC with the
> mainline kernel introduces huge delays.
>
> Does M2M help with this aspect?
>
No, M2M can't help with the delays issue.   The delay issue maybe caused
by the buffer size or the prefilled data needs by EASRC.

Best regards
wang shengjiu

>
> Thanks
>

--0000000000004c8f2205ff50586f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 29, 2023 at 7:00=E2=80=AF=
PM Fabio Estevam &lt;<a href=3D"mailto:festevam@gmail.com">festevam@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi Shengjiu,<br>
<br>
On Wed, Jun 28, 2023 at 11:10=E2=80=AFPM Shengjiu Wang &lt;<a href=3D"mailt=
o:shengjiu.wang@nxp.com" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; ASRC can be used on memory to memory case, define several<br>
&gt; functions for m2m usage and export them as function pointer.<br>
&gt;<br>
&gt; Signed-off-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@nxp.c=
om" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt;<br>
<br>
Could you please explain what is the benefit of using M2M in the EASRC driv=
er?<br>
<br></blockquote><div>Users may want to get the ASRC output in the user spa=
ce, then do mixing with</div><div>other streams before sending to DAC.=C2=
=A0</div><div>so this patch-set is to use the v4l2 API for this usage, beca=
use there is no such</div><div>API in ASoC.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
A few weeks ago, an imx8mn user reported that the EASRC with the<br>
mainline kernel introduces huge delays.<br>
<br>
Does M2M help with this aspect?<br></blockquote><div>No, M2M can&#39;t help=
 with the delays issue.=C2=A0 =C2=A0The delay issue maybe caused</div><div>=
by the buffer size or the prefilled data needs by EASRC.</div><div>=C2=A0</=
div><div>Best regards</div><div>wang shengjiu</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Thanks<br>
</blockquote></div></div>

--0000000000004c8f2205ff50586f--
