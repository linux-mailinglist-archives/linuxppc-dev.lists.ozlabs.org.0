Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE3F58931E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 22:24:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyjyG0B7cz3bPP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 06:24:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nAUJOzW2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nAUJOzW2;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxvL70PdMz2xjS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 22:23:58 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id c17so3192223lfb.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Aug 2022 05:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K8iU8kfebQDkNy2quOtfHbt5JTFBcMDWk7S1Y1FMIEA=;
        b=nAUJOzW2d7uHBTe+utSc7B5AArAmSPiNqSWk3LgVILrna8pYuTKTBFhopTkzlcj8Sp
         18UuNu3VkugB4xrsxBM3zsF0635H57j5/vnEHTiX+Rp8yQqCIPrMFTTl5STXpJFfMP9H
         OTsI/CMCppggpD+k9+NaghRqiu9weWlJjWxG6EXgGGsVh56dse4MIQpM0kAAAjdeAKt6
         /plslovwC3d5oqJj7gC5imn+Qmq/9e1PbnbGgTzMQfSKQyho0OlXJ5O6WiryvlSWm9kU
         fUynprXAKOT005duHihm9kR3AajD/IL0PiMYe/Lle4SC3+MwTlcH07KrQeIxXtLDKWNl
         9+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K8iU8kfebQDkNy2quOtfHbt5JTFBcMDWk7S1Y1FMIEA=;
        b=aRCEfnUCGlDhQHKiGo9o3CUYZzhcjwZR613Rjg1ULg5kWsn554XrkLbs7Gx9VaszAi
         q+lV4b2sReS4vxy29f+djyhYxwAYXGthY8K+6GMJkOmwNrI6CZrYYuQObgeuxgwNW3A2
         cAvzw/C79e2SS+8aXeF1akquL9L+PSMpSeNGRYpRi5S5hXN53DtQHP7lYKlpQgLYQvzV
         TyDFyEv8JF+ekkbv8F2fsBJdVY4QcDiIQu3B64g9XGvHvSrSaxH2XMvgPgJMMAf/hBhL
         5j7l+0CKivue/u6QxvTDgs6vvdGvBZNWnQxG0V/sj/lvoBhXBOo+hNCvWJtnEGskAYLm
         WEnA==
X-Gm-Message-State: AJIora8Vqt6m8uG9hMmr9eDYLNRjxkmqpRZhrK0ieU2IGWRhAEUJ7JDx
	Dz0tzFaMQqEY1WGft6OYNO1Qaa3A35rerJRoyxk=
X-Google-Smtp-Source: AGRyM1sazR2KHd2eKOWEvLs7r81gJTxkmWsTrtToJBx5aIOdSqblZ+OOPIXFjFUUVVOVLdG/k2+WLidxq4dUgqHwi0U=
X-Received: by 2002:a05:6512:3186:b0:48a:c33e:f5e with SMTP id
 i6-20020a056512318600b0048ac33e0f5emr8157688lfe.531.1659443028519; Tue, 02
 Aug 2022 05:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com> <CAGoOwPSy77PuBvA0BghsFrNgpXfO+JuFgTW5VTNOfMEQdnbrVA@mail.gmail.com>
In-Reply-To: <CAGoOwPSy77PuBvA0BghsFrNgpXfO+JuFgTW5VTNOfMEQdnbrVA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 2 Aug 2022 20:23:37 +0800
Message-ID: <CAA+D8AN3C6gN0cNF57qpiQf=p-834MRFCC4QeoEhxf95T1KURA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: Support configure sysclk for codec dai
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003d6e0805e5413097"
X-Mailman-Approved-At: Thu, 04 Aug 2022 06:23:31 +1000
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000003d6e0805e5413097
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 2, 2022 at 1:47 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> On Mon, Aug 1, 2022 at 5:42 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> wrote:
>
> >  struct imx_rpmsg {
> >         struct snd_soc_dai_link dai;
> >         struct snd_soc_card card;
> > +       unsigned int sysclk;
>
> unsigned long?
>

Seems int or long are all used in the kernel.
I am not sure which one is better?

Best regards
wang shengjiu

--0000000000003d6e0805e5413097
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 2, 2022 at 1:47 AM Nicoli=
n Chen &lt;<a href=3D"mailto:nicoleotsuka@gmail.com">nicoleotsuka@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Mon, Aug 1, 2022 at 5:42 AM Shengjiu Wang &lt;<a href=3D"mailto:shengjiu=
.wang@nxp.com" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt; wrote:<br>
<br>
&gt;=C2=A0 struct imx_rpmsg {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_soc_dai_link dai;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_soc_card card;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int sysclk;<br>
<br>
unsigned long?<br></blockquote><div><br></div><div>Seems int or long are al=
l used in the kernel.</div><div>I am not sure which one is better?</div><di=
v><br></div><div>Best regards</div><div>wang shengjiu</div></div></div>

--0000000000003d6e0805e5413097--
