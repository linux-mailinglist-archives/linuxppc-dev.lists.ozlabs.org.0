Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589CF57AC23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 03:21:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LndG52jX0z3cjP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 11:21:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JQyJz1AF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JQyJz1AF;
	dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnGJJ1Hw7z2xmj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 21:07:27 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id x10so16489497ljj.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KZX9OkWnyGpukIHwA9hQ3y3ysqX2GQG+zpKVgvPG8eI=;
        b=JQyJz1AFb8/gJxfSAEgJ456WAeUYQDO+2+/GwrafXtB98x0adLUGtpLAyRtr//vhJi
         ixOrCsu7XxazpbuEPnVP8e1UFpTvsOI8r1bjnGG0Mw4KeKKGCxdOKLZAdRR/XFw5MSoe
         rcpSOIeTeCrxTd8znoYMhPtusjJFBIW5+UGlv50odRpxT2oF1UUj+u8qu7cZ9BMvsK5C
         FcSUJnHslk3/DJl+AOIXWUhSzxbgQiQzQhz/StakGXZzpGDHyQ6NfJ5868J/FdTy2t/2
         mhVtVQ9yZ8AC9WSPm1ob48G+hF1YztLA2+13ZhmEJa3PWSMKMizRRlYnBNKnyvTdZL9w
         3ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KZX9OkWnyGpukIHwA9hQ3y3ysqX2GQG+zpKVgvPG8eI=;
        b=isNXDyyrmnZlMtm4I8QQWXN8dyNz7B3bkrDucz8pjr14wpjmYc3w254EGmRqdVQ65d
         8IWUcOlqAXr9pE57yLsAdyFfNXqJb4teQbIFsSsk+AHo6aUuaxemqm16xa16GvF5in8b
         gJGsDRMZNRh+XrpLGOzNOTQ7OeiEOhFZKUx+tUpO8uVxI5Sitg3Dwp2alZTQ/sJBeQE0
         0BZHO0CzgG16lZfTXPazmbukpVdkDx1l+wPHOsk49zaTHAC2wkTBTopoTPSUBYXvk3Qy
         41L1mBW+fk7BlnKp0FG7rorzdJCXeplcbNhJjlWk+LWa5cBPdcGeWTA14GJGKDz9WBxk
         j22A==
X-Gm-Message-State: AJIora8mWnqRk4cdti6jDMWH/meQ/DpUarU0+fAc4Bv3RKAZWtTtcfO7
	2g919ebHXecsJhaw3FzPpynCPdqbOEgg1sQemx0=
X-Google-Smtp-Source: AGRyM1uZo6G+pP3uxmrsV9nTWsYSjZ1BgWxXlS08BhNto12Y7m/pr6eM6an/ZqsICAvUvG1SwMPhjeyjzzyvoR6C81o=
X-Received: by 2002:a2e:8707:0:b0:25d:bbd5:c2f with SMTP id
 m7-20020a2e8707000000b0025dbbd50c2fmr3722343lji.464.1658228840068; Tue, 19
 Jul 2022 04:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
 <1658222864-25378-3-git-send-email-shengjiu.wang@nxp.com> <f2609401c8834e8bbe926200bfc87971@AcuMS.aculab.com>
 <YtaEpf6Cd7KH7wH4@sirena.org.uk> <20cfcc8e59a74166846cff028cd2c4e8@AcuMS.aculab.com>
In-Reply-To: <20cfcc8e59a74166846cff028cd2c4e8@AcuMS.aculab.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 19 Jul 2022 19:07:08 +0800
Message-ID: <CAA+D8AO6P2AcOJ+E97Y1=P72Qa1wjtMGMneWnsP+VcdnCzzYuw@mail.gmail.com>
Subject: Re: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
To: David Laight <David.Laight@aculab.com>
Content-Type: multipart/alternative; boundary="000000000000f7fbcb05e4267c1b"
X-Mailman-Approved-At: Wed, 20 Jul 2022 11:21:17 +1000
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000f7fbcb05e4267c1b
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 19, 2022 at 6:34 PM David Laight <David.Laight@aculab.com>
wrote:

> From: Mark Brown
> > Sent: 19 July 2022 11:17
> >
> > On Tue, Jul 19, 2022 at 10:01:54AM +0000, David Laight wrote:
> > > From: Shengjiu Wang
> >
> > > > - ret = of_property_read_u32(np, "fsl,asrc-format",
> &asrc->asrc_format);
> > > > + ret = of_property_read_u32(np, "fsl,asrc-format", (u32
> *)&asrc->asrc_format);
> >
> > > Ugg, you really shouldn't need to do that.
> > > It means that something is badly wrong somewhere.
> > > Casting pointers to integer types is just asking for a bug.
> >
> > That's casting one pointer type to another pointer type.
>
> It is casting the address of some type to a 'u32 *'.
> This will then be dereferenced by the called function.
> So the original type better be 32 bits.
>
> I'm also guessing that sparse was complaining about endianness?
> It isn't at all clear that these casts actually fix it.
>
> The sparse is complaining about the snd_pcm_format_t cast to u32/int type.

The code in include/sound/pcm.h also does such __force cast.
#define _SNDRV_PCM_FMTBIT(fmt)          (1ULL << (__force
int)SNDRV_PCM_FORMAT_##fmt)

The change I have made does not cause an issue.

Best regards
Wang shengjiu


> (Mark: You'll be glad to hear that the office aircon is
> broken again - two weeks lead time on the spare part.)
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1
> 1PT, UK
> Registration No: 1397386 (Wales)
>
>

--000000000000f7fbcb05e4267c1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 19, 2022 at 6:34 PM David=
 Laight &lt;<a href=3D"mailto:David.Laight@aculab.com">David.Laight@aculab.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">From: Mark Brown<br>
&gt; Sent: 19 July 2022 11:17<br>
&gt; <br>
&gt; On Tue, Jul 19, 2022 at 10:01:54AM +0000, David Laight wrote:<br>
&gt; &gt; From: Shengjiu Wang<br>
&gt; <br>
&gt; &gt; &gt; - ret =3D of_property_read_u32(np, &quot;fsl,asrc-format&quo=
t;, &amp;asrc-&gt;asrc_format);<br>
&gt; &gt; &gt; + ret =3D of_property_read_u32(np, &quot;fsl,asrc-format&quo=
t;, (u32 *)&amp;asrc-&gt;asrc_format);<br>
&gt; <br>
&gt; &gt; Ugg, you really shouldn&#39;t need to do that.<br>
&gt; &gt; It means that something is badly wrong somewhere.<br>
&gt; &gt; Casting pointers to integer types is just asking for a bug.<br>
&gt; <br>
&gt; That&#39;s casting one pointer type to another pointer type.<br>
<br>
It is casting the address of some type to a &#39;u32 *&#39;.<br>
This will then be dereferenced by the called function.<br>
So the original type better be 32 bits.<br>
<br>
I&#39;m also guessing that sparse was complaining about endianness?<br>
It isn&#39;t at all clear that these casts actually fix it.<br>
<br></blockquote><div>The sparse is complaining about the=C2=A0snd_pcm_form=
at_t cast to u32/int type.<br></div><div><br></div><div>The code in=C2=A0in=
clude/sound/pcm.h also does such __force cast.</div><div>#define _SNDRV_PCM=
_FMTBIT(fmt) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1ULL &lt;&lt; (__force int)=
SNDRV_PCM_FORMAT_##fmt)<br></div><div><br></div><div>The change I have made=
 does not cause an issue.=C2=A0=C2=A0</div><div>=C2=A0</div><div>Best regar=
ds</div><div>Wang shengjiu</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
(Mark: You&#39;ll be glad to hear that the office aircon is<br>
broken again - two weeks lead time on the spare part.)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 David<br>
<br>
-<br>
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK<br>
Registration No: 1397386 (Wales)<br>
<br>
</blockquote></div></div>

--000000000000f7fbcb05e4267c1b--
