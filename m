Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5083657B6A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 14:43:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnwNX2FcGz3bmW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 22:43:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K2sf2zbZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K2sf2zbZ;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnl3C4CJmz2xmg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 15:42:46 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id n18so28502199lfq.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 22:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+aL53xeHszDzXfVsqRlkFlKt1uWxXV5MXK0jzsINeM8=;
        b=K2sf2zbZ6UbHQ8IMqoiIxBfw/z2F06npJu4TRP/EyTANSofa3VS/PwhDxSkek/fDU6
         zN6txnGaWxWJj7AazYi4X8E6XhqZnKqwtuLJ7W7J9NQuMIN6F+S35ebOo69ThgvMI8ZL
         nDK9ERxiVUhg5T+Ll3IXVyJ66vSAlaz+hxBzBxKHMYrstFiof7N0AEsBuh/kFrIQlieh
         59RFXtVYFxCt5FdA23dC8bnWqO2KUK90MepFV/g2QL0iPN2PNTYJW8sR6Pnyp/BixdbX
         skIfO+Q5GGCKVkof4WPFEhO3qDzMUzSmCFWe8QrL30ZiqqKdTqw7+Sp7GyUUtb62gWlg
         81AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+aL53xeHszDzXfVsqRlkFlKt1uWxXV5MXK0jzsINeM8=;
        b=UH8fsA3wSQHp1fS0Q+xRZ/AsamwfYzPRGF6UlvFtRsV7eksViahLeDZDPNd4UNqMXY
         6WbBWGbrlcvGnRm9OM7tR4FrypGs6NmbgUujMFA61ZDA/XUJXWE1Ix5CDvkyQdVmNdk7
         emQ+jF5FyKDumZUIQraurSHK2cPplIVE3WNWyXF+J1ny8aXm8TbYQfG0HzAyXmUy5bBI
         vEm52MdZdv9PUyb8Ki7pi1jTQIS/0Qv6/ZoXHpCaDJ3G6dhXUToj/zB/9/x5DOlC/jF3
         qssYrgeQj5LbPVMrD1IRLBQrLbIOeCOSiEt8nlP72uF68DIjK/bJs2OVrpRxBvwM7Gr9
         S0iA==
X-Gm-Message-State: AJIora8H4c6RWuL871qxnUdV3v3ZNAAJoGUoZ8ksTKdnfQJPrGGHJA2t
	cPvrYLDi9lT4ybVvuFldDU2RsBs6jI6R5Kn8qi4=
X-Google-Smtp-Source: AGRyM1t3Ie1nCgCu4TCjs+FvoSxysaFjDDcvKN0+JNwIZ0/8s7qHAPvs7mGVswvUY90fJtPXGawN5k8b0KxEl99PBNg=
X-Received: by 2002:a05:6512:1153:b0:48a:201d:5f77 with SMTP id
 m19-20020a056512115300b0048a201d5f77mr13168824lfg.280.1658295760028; Tue, 19
 Jul 2022 22:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
 <1658222864-25378-3-git-send-email-shengjiu.wang@nxp.com> <f2609401c8834e8bbe926200bfc87971@AcuMS.aculab.com>
 <YtaEpf6Cd7KH7wH4@sirena.org.uk> <20cfcc8e59a74166846cff028cd2c4e8@AcuMS.aculab.com>
 <CAA+D8AO6P2AcOJ+E97Y1=P72Qa1wjtMGMneWnsP+VcdnCzzYuw@mail.gmail.com>
 <c9231becb2cd4e2999ec631f9d2171c3@AcuMS.aculab.com> <CAA+D8AMTrp3KXpDEtyJbqgbA8feYCvEcWc4CMYY8zYSMgrvW6w@mail.gmail.com>
In-Reply-To: <CAA+D8AMTrp3KXpDEtyJbqgbA8feYCvEcWc4CMYY8zYSMgrvW6w@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 20 Jul 2022 13:42:28 +0800
Message-ID: <CAA+D8AN2Mp8SjsFO6ZoKuNmx4Tv1MFzVQzveDEk+aBvv9RkuuA@mail.gmail.com>
Subject: Re: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
To: David Laight <David.Laight@aculab.com>
Content-Type: multipart/alternative; boundary="000000000000b58c3a05e4361134"
X-Mailman-Approved-At: Wed, 20 Jul 2022 22:42:51 +1000
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

--000000000000b58c3a05e4361134
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David

On Tue, Jul 19, 2022 at 9:35 PM Shengjiu Wang <shengjiu.wang@gmail.com>
wrote:

>
>
> On Tue, Jul 19, 2022 at 8:39 PM David Laight <David.Laight@aculab.com>
> wrote:
>
>> grrr... top-posting because outluck is really stupid :-(
>>
>>
>>
>> The definition seems to be:
>>
>> typedef int __bitwise
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__bitwise>
>> snd_pcm_format_t
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>;
>>
>> #define SNDRV_PCM_FORMAT_S8
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FORMAT_S8>
>> ((__force <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__force>
>> snd_pcm_format_t
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>) 0=
)
>>
>> #define SNDRV_PCM_FORMAT_U8
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FORMAT_U8>
>> ((__force <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__force>
>> snd_pcm_format_t
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>) 1=
)
>>
>> #define SNDRV_PCM_FORMAT_S16_LE
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FORMAT_S16=
_LE>
>> ((__force <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__force>
>> snd_pcm_format_t
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>) 2=
)
>>
>> ...
>>
>> (goes away and looks up __bitwIse)
>>
>>
>>
>> I think I=E2=80=99d add:
>>
>> #define snd_pcm_format(val) ((__force snd_pcm_format_t)(val))
>>
>
> Where is this definition? Which header file?
> Thanks.
>
>
Here is the change based on your proposal.
Not sure if there is misunderstanding.
Not sure if the definition can be put in pcm.h.

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 26523cfe428d..93e53b195ef9 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1477,6 +1477,8 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t
pcm_format)
        return 1ULL << (__force int) pcm_format;
 }

+#define snd_pcm_format(val) ((__force snd_pcm_format_t)(val))
+
 /**
  * pcm_for_each_format - helper to iterate for each format type
  * @f: the iterator variable in snd_pcm_format_t type
diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 544395efd605..dcfdfb6b3472 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1066,6 +1066,7 @@ static int fsl_asrc_probe(struct platform_device
*pdev)
        struct resource *res;
        void __iomem *regs;
        int irq, ret, i;
+       u32 asrc_fmt =3D 0;
        u32 map_idx;
        char tmp[16];
        u32 width;
@@ -1174,7 +1175,8 @@ static int fsl_asrc_probe(struct platform_device
*pdev)
                return ret;
        }

-       ret =3D of_property_read_u32(np, "fsl,asrc-format", (u32
*)&asrc->asrc_format);
+       ret =3D of_property_read_u32(np, "fsl,asrc-format", &asrc_fmt);
+       asrc->asrc_format =3D snd_pcm_format(asrc_fmt);
        if (ret) {
                ret =3D of_property_read_u32(np, "fsl,asrc-width", &width);
                if (ret) {
@@ -1197,7 +1199,7 @@ static int fsl_asrc_probe(struct platform_device
*pdev)
                }
        }

-       if (!(FSL_ASRC_FORMATS & (1ULL << (__force u32)asrc->asrc_format)))
{
+       if (!(FSL_ASRC_FORMATS & pcm_format_to_bits(asrc->asrc_format))) {
                dev_warn(&pdev->dev, "unsupported width, use default
S24_LE\n");
                asrc->asrc_format =3D SNDRV_PCM_FORMAT_S24_LE;

best regards
wang shengjiu

>
> and use that to remove most of the casts.
>>
> But the ones where you have (u32 *)&xxx are only valid because u32 and in=
t
>> are the same size.
>>
>> That does sort of happen to be true, but someone might look at all the
>> values and
>>
>> decide that u8 is big enough.
>>
>> After which the code will still compile, but the data areas get corrupte=
d.
>>
>> So you really need to use a u32 =E2=80=98temp=E2=80=99 variable.
>>
>>
>>
>> It would all be slightly less problematic if the =E2=80=98force=E2=80=99=
 casts could be
>> sparse only
>>
>> (ie not seen by the compiler) =E2=80=93 so the compiler would do the typ=
e
>> checking.
>>
>>
>>
>>                 David
>>
>>
>>
>> *From:* Shengjiu Wang <shengjiu.wang@gmail.com>
>> *Sent:* 19 July 2022 12:07
>> *To:* David Laight <David.Laight@ACULAB.COM>
>> *Cc:* Mark Brown <broonie@kernel.org>; Shengjiu Wang <
>> shengjiu.wang@nxp.com>; Xiubo.Lee@gmail.com; festevam@gmail.com;
>> nicoleotsuka@gmail.com; lgirdwood@gmail.com; perex@perex.cz;
>> tiwai@suse.com; alsa-devel@alsa-project.org;
>> linuxppc-dev@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> *Subject:* Re: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the
>> asrc_format type
>>
>>
>>
>>
>>
>>
>>
>> On Tue, Jul 19, 2022 at 6:34 PM David Laight <David.Laight@aculab.com>
>> wrote:
>>
>> From: Mark Brown
>> > Sent: 19 July 2022 11:17
>> >
>> > On Tue, Jul 19, 2022 at 10:01:54AM +0000, David Laight wrote:
>> > > From: Shengjiu Wang
>> >
>> > > > - ret =3D of_property_read_u32(np, "fsl,asrc-format",
>> &asrc->asrc_format);
>> > > > + ret =3D of_property_read_u32(np, "fsl,asrc-format", (u32
>> *)&asrc->asrc_format);
>> >
>> > > Ugg, you really shouldn't need to do that.
>> > > It means that something is badly wrong somewhere.
>> > > Casting pointers to integer types is just asking for a bug.
>> >
>> > That's casting one pointer type to another pointer type.
>>
>> It is casting the address of some type to a 'u32 *'.
>> This will then be dereferenced by the called function.
>> So the original type better be 32 bits.
>>
>> I'm also guessing that sparse was complaining about endianness?
>> It isn't at all clear that these casts actually fix it.
>>
>> The sparse is complaining about the snd_pcm_format_t cast to u32/int typ=
e.
>>
>>
>>
>> The code in include/sound/pcm.h also does such __force cast.
>>
>> #define _SNDRV_PCM_FMTBIT(fmt)          (1ULL << (__force
>> int)SNDRV_PCM_FORMAT_##fmt)
>>
>>
>>
>> The change I have made does not cause an issue.
>>
>>
>>
>> Best regards
>>
>> Wang shengjiu
>>
>>
>>
>> (Mark: You'll be glad to hear that the office aircon is
>> broken again - two weeks lead time on the spare part.)
>>
>>         David
>>
>> -
>> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK=
1
>> 1PT, UK
>> Registration No: 1397386 (Wales)
>>
>>
>>
>> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK=
1
>> 1PT, UK
>> Registration No: 1397386 (Wales)
>>
>> P *Please consider the environment and don't print this e-mail unless
>> you really need to*
>>
>

--000000000000b58c3a05e4361134
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi David</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jul 19, 2022 at 9:35 PM Shengjiu Wang=
 &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">shengjiu.wang@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 19, 2022 at 8:39 PM David Lai=
ght &lt;<a href=3D"mailto:David.Laight@aculab.com" target=3D"_blank">David.=
Laight@aculab.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">



<div lang=3D"EN-GB">
<div>
<p class=3D"MsoNormal"><span>grrr... top-posting because outluck is really =
stupid :-(<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span>The definition seems to be:<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">typedef int
<a href=3D"https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__bitwise" ta=
rget=3D"_blank">__bitwise</a>
<a href=3D"https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_forma=
t_t" target=3D"_blank">snd_pcm_format_t</a>;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">#define
<a href=3D"https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FOR=
MAT_S8" target=3D"_blank">
SNDRV_PCM_FORMAT_S8</a>=C2=A0=C2=A0=C2=A0 ((<a href=3D"https://elixir.bootl=
in.com/linux/v5.19-rc7/C/ident/__force" target=3D"_blank">__force</a>
<a href=3D"https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_forma=
t_t" target=3D"_blank">snd_pcm_format_t</a>) 0)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">#define
<a href=3D"https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FOR=
MAT_U8" target=3D"_blank">
SNDRV_PCM_FORMAT_U8</a>=C2=A0=C2=A0=C2=A0 ((<a href=3D"https://elixir.bootl=
in.com/linux/v5.19-rc7/C/ident/__force" target=3D"_blank">__force</a>
<a href=3D"https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_forma=
t_t" target=3D"_blank">snd_pcm_format_t</a>) 1)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">#define
<a href=3D"https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FOR=
MAT_S16_LE" target=3D"_blank">
SNDRV_PCM_FORMAT_S16_LE</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((<a =
href=3D"https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__force" target=
=3D"_blank">__force</a>
<a href=3D"https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_forma=
t_t" target=3D"_blank">snd_pcm_format_t</a>) 2)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">...<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span>(goes away and looks up __bitwIse)<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span>I think I=E2=80=99d add:<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span>#define snd_pcm_format(val) ((__force snd_pcm_=
format_t)(val))</span></p></div></div></blockquote><div><br></div><div>Wher=
e is this definition? Which header file?</div><div>Thanks.</div><div><br></=
div></div></div></blockquote><div><br></div><div>Here is the change based o=
n your proposal.=C2=A0=C2=A0<br></div><div>Not sure if there is misundersta=
nding.</div><div>Not sure if the definition can be put in pcm.h.=C2=A0</div=
><div><br></div>diff --git a/include/sound/pcm.h b/include/sound/pcm.h<br>i=
ndex 26523cfe428d..93e53b195ef9 100644<br>--- a/include/sound/pcm.h<br>+++ =
b/include/sound/pcm.h<br>@@ -1477,6 +1477,8 @@ static inline u64 pcm_format=
_to_bits(snd_pcm_format_t pcm_format)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 1ULL &lt;&lt; (__force int) pcm_format;<br>=C2=A0}<br><br>+#define snd_pcm=
_format(val) ((__force snd_pcm_format_t)(val))<br>+<br>=C2=A0/**<br>=C2=A0 =
* pcm_for_each_format - helper to iterate for each format type<br>=C2=A0 * =
@f: the iterator variable in snd_pcm_format_t type<br>diff --git a/sound/so=
c/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c<br>index 544395efd605..dcfdfb6b=
3472 100644<br>--- a/sound/soc/fsl/fsl_asrc.c<br>+++ b/sound/soc/fsl/fsl_as=
rc.c<br>@@ -1066,6 +1066,7 @@ static int fsl_asrc_probe(struct platform_dev=
ice *pdev)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct resource *res;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 void __iomem *regs;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 int=
 irq, ret, i;<br>+ =C2=A0 =C2=A0 =C2=A0 u32 asrc_fmt =3D 0;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u32 map_idx;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 char tmp[16];=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 width;<br>@@ -1174,7 +1175,8 @@ static =
int fsl_asrc_probe(struct platform_device *pdev)<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br><br>- =C2=A0 =C2=A0 =C2=A0 ret =3D of_property_read_u32(np, &quot;=
fsl,asrc-format&quot;, (u32 *)&amp;asrc-&gt;asrc_format);<br>+ =C2=A0 =C2=
=A0 =C2=A0 ret =3D of_property_read_u32(np, &quot;fsl,asrc-format&quot;, &a=
mp;asrc_fmt);<br>+ =C2=A0 =C2=A0 =C2=A0 asrc-&gt;asrc_format =3D snd_pcm_fo=
rmat(asrc_fmt);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D of_property_read_u32(np, =
&quot;fsl,asrc-width&quot;, &amp;width);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>@@ -1197,7 +1199,7 @@ static int fsl=
_asrc_probe(struct platform_device *pdev)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br>- =C2=
=A0 =C2=A0 =C2=A0 if (!(FSL_ASRC_FORMATS &amp; (1ULL &lt;&lt; (__force u32)=
asrc-&gt;asrc_format))) {<br>+ =C2=A0 =C2=A0 =C2=A0 if (!(FSL_ASRC_FORMATS =
&amp; pcm_format_to_bits(asrc-&gt;asrc_format))) {<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_warn(&amp;pdev-&gt;dev, &quot;unsupp=
orted width, use default S24_LE\n&quot;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 asrc-&gt;asrc_format =3D SNDRV_PCM_FORMAT_S24_L=
E;<br><div>=C2=A0</div><div>best regards</div><div>wang shengjiu</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_quote"><div></div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div lang=3D"EN-GB"><div><p class=3D"MsoNormal"><span><u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span>and use that to remove most of the casts.</spa=
n>=C2=A0</p></div></div></blockquote><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div lang=3D"EN-GB"><div><p class=3D"MsoNormal"><span><u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span>But the ones where you have (u32 *)&amp;xxx ar=
e only valid because u32 and int are the same size.<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span>That does sort of happen to be true, but someo=
ne might look at all the values and<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span>decide that u8 is big enough.<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span>After which the code will still compile, but t=
he data areas get corrupted.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span>So you really need to use a u32 =E2=80=98temp=
=E2=80=99 variable.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span>It would all be slightly less problematic if t=
he =E2=80=98force=E2=80=99 casts could be sparse only<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span>(ie not seen by the compiler) =E2=80=93 so the=
 compiler would do the type checking.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 David<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com" ta=
rget=3D"_blank">shengjiu.wang@gmail.com</a>&gt;
<br>
<b>Sent:</b> 19 July 2022 12:07<br>
<b>To:</b> David Laight &lt;<a href=3D"mailto:David.Laight@ACULAB.COM" targ=
et=3D"_blank">David.Laight@ACULAB.COM</a>&gt;<br>
<b>Cc:</b> Mark Brown &lt;<a href=3D"mailto:broonie@kernel.org" target=3D"_=
blank">broonie@kernel.org</a>&gt;; Shengjiu Wang &lt;<a href=3D"mailto:shen=
gjiu.wang@nxp.com" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt;; <a href=
=3D"mailto:Xiubo.Lee@gmail.com" target=3D"_blank">Xiubo.Lee@gmail.com</a>; =
<a href=3D"mailto:festevam@gmail.com" target=3D"_blank">festevam@gmail.com<=
/a>; <a href=3D"mailto:nicoleotsuka@gmail.com" target=3D"_blank">nicoleotsu=
ka@gmail.com</a>; <a href=3D"mailto:lgirdwood@gmail.com" target=3D"_blank">=
lgirdwood@gmail.com</a>; <a href=3D"mailto:perex@perex.cz" target=3D"_blank=
">perex@perex.cz</a>; <a href=3D"mailto:tiwai@suse.com" target=3D"_blank">t=
iwai@suse.com</a>; <a href=3D"mailto:alsa-devel@alsa-project.org" target=3D=
"_blank">alsa-devel@alsa-project.org</a>; <a href=3D"mailto:linuxppc-dev@li=
sts.ozlabs.org" target=3D"_blank">linuxppc-dev@lists.ozlabs.org</a>;
 <a href=3D"mailto:linux-kernel@vger.kernel.org" target=3D"_blank">linux-ke=
rnel@vger.kernel.org</a><br>
<b>Subject:</b> Re: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_f=
ormat type<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, Jul 19, 2022 at 6:34 PM David Laight &lt;<a =
href=3D"mailto:David.Laight@aculab.com" target=3D"_blank">David.Laight@acul=
ab.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">From: Mark Brown<br>
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
It isn&#39;t at all clear that these casts actually fix it.<u></u><u></u></=
p>
</blockquote>
<div>
<p class=3D"MsoNormal">The sparse is complaining about the=C2=A0snd_pcm_for=
mat_t cast to u32/int type.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">The code in=C2=A0include/sound/pcm.h also does such =
__force cast.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">#define _SNDRV_PCM_FMTBIT(fmt) =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(1ULL &lt;&lt; (__force int)SNDRV_PCM_FORMAT_##fmt)<u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">The change I have made does not cause an issue.=C2=
=A0=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Best regards<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Wang shengjiu<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">(Mark: You&#39;ll be gl=
ad to hear that the office aircon is<br>
broken again - two weeks lead time on the spare part.)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 David<br>
<br>
-<br>
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK<br>
Registration No: 1397386 (Wales)<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>


<br><br><div><span style=3D"color:rgb(72,72,48);font-family:Tahoma;font-siz=
e:xx-small">Registered Address Lakeside, Bramley Road, Mount Farm, Milton K=
eynes, MK1 1PT, UK<br>Registration No: 1397386 (Wales)</span></div>
<div>
<p><span style=3D"color:rgb(0,128,0);font-family:Arial"><span style=3D"font=
-size:xx-small"><span style=3D"font-family:Webdings">P </span><strong>Pleas=
e consider the environment and don&#39;t print this e-mail unless you reall=
y need to</strong></span></span></p>
</div></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000b58c3a05e4361134--
