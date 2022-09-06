Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E14115AF77E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 23:58:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMfQp0bpJz3c4B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 07:58:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=khPzVTI6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=khPzVTI6;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMRjn5vwdz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 23:55:39 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id p7so17525964lfu.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 06:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9/i7m1vSaW1LQaPczLwKSI2TpE8iLJQt7sa+CqIM8FY=;
        b=khPzVTI69w+JT9PVk+B9mYe6u+7wAQh+/khwSEvFBhYwOw05w2i3NC9672i6KYNNDQ
         mFDxvghmc0dFzilBfcwJsYdW8TXbRTbIhr18bAfAgupS1aaID9uHVpymp1cloD76a/2Q
         n5Oyd56npVznVy0U3nB+oka8sPEH4wZ8Xmucv+aac34g58da2zDm1nFiAbtGD/rzD6MZ
         KoWa5Mz4AXVIuzFjGA4GOcXWvYgaozm/92zYbHcbNW7eCJ2qpVGJRC4ffKgOUB4XrGJ3
         MdnFmmTnKq7N/n9P67u19KaFRJt+BqaV0NCZEaB4bWq2nK8WRghWhQcnTkrWF21+LqgR
         Dtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9/i7m1vSaW1LQaPczLwKSI2TpE8iLJQt7sa+CqIM8FY=;
        b=K9UzpA6dXQG+F94G+sSnTzX17mhF3sGKW0aHARWLlYLGoBC0FjdxFQZdNPBWBSP9Mi
         +jqnUtEp/Zr2cBhBSUS3LxdWlI/oss/CPB2ni6ifOTOwbCeOAUiiK75JEgmZ3YoGLAN8
         VuCHvTyKvOls8JukGRCOvTIL0zjEXO9sr2/QSJMNB2NwhUeevKylRTtmEBWHely9Jv5g
         NmXroUnadEcvC7cUrhDVvwJQRW38WEfboAdcG+stf+EsGhQpP4LUKzJx40aIN6K5iXtv
         +FZLKw51M80H0W3rcYC1zCVFYxEenmirfrCJGnWrlScljbVSIwfH3wD1pNCVoSozUiDh
         vVhg==
X-Gm-Message-State: ACgBeo26B+Me8eygNh02TbaOMHIMlpz+myMJAn1gSjQcYIoYPfqrpAMf
	vknJT/0kJJIU3qDqnZDzzuZaRzzlULFWsiEnnsw=
X-Google-Smtp-Source: AA6agR7fXY6JLLMiGgiL+UZI+kW9OWzrlIqGs89l0h0PB2WzxGmc1MSJuLS8cf1dRYrCY1GG460oNXb7qw/dZd4LgiU=
X-Received: by 2002:a05:6512:33cb:b0:494:69e3:5421 with SMTP id
 d11-20020a05651233cb00b0049469e35421mr12981941lfg.283.1662472531096; Tue, 06
 Sep 2022 06:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
 <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com>
 <CAGoOwPQfkT2ptdt6mBTAgPfN0NOoR4KfdLE9B2AoL+Qn6bWdFw@mail.gmail.com>
 <CAA+D8AMYrQsu-nM_WdrBtB4iPU2UYNDhPW-zdY_Z+-9L03gu1Q@mail.gmail.com> <CAGoOwPSOEmLN+0esj2QfoadN7JZ=TJeZymxcp3MPqP4oLok70w@mail.gmail.com>
In-Reply-To: <CAGoOwPSOEmLN+0esj2QfoadN7JZ=TJeZymxcp3MPqP4oLok70w@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 6 Sep 2022 21:55:19 +0800
Message-ID: <CAA+D8ANu11Y5m1jJLEm8==45x5-z7C468JS-u6oMmmsYs1okbg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000aa399a05e8028c8b"
X-Mailman-Approved-At: Wed, 07 Sep 2022 07:57:55 +1000
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

--000000000000aa399a05e8028c8b
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 6, 2022 at 7:42 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> On Tue, Sep 6, 2022 at 3:50 AM Shengjiu Wang <shengjiu.wang@gmail.com>
> wrote:
> >> >> > +       /* Wait for status of initialization for every enabled
> pairs */
> >> >> > +       do {
> >> >> > +               udelay(5);
> >> >> > +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
> >> >> > +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
> >> >> > +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) &
> 0x7)) && --retry);
> >> >> > +
> >> >> > +       /* FIXME: Doesn't treat initialization timeout as error */
> >> >> > +       if (!retry)
> >> >> > +               dev_warn(dev, "initialization isn't finished\n");
> >> >>
> >> >> Any reason why not just dev_err?
> >> >
> >> > Just hesitate to use dev_err. if use dev_err, then should return an
> error.
> >> > May one of the pairs is finished, it still can continue.
> >>
> >> Makes sense. In that case, why "FIXME" :)
>
> > Just want to have a record/note here, need to care about this warning.
>
> "FIXME" feels like something is wrong and literally means that it is
> waiting for a fix/solution. In your case, it's not waiting for a fix
> at all, but just an annotation? So, shouldn't it be just "Note:"?
>

ok, let me update it.

best regards
wang shengjiu

--000000000000aa399a05e8028c8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 6, 2022 at 7:42 PM Nicoli=
n Chen &lt;<a href=3D"mailto:nicoleotsuka@gmail.com">nicoleotsuka@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Tue, Sep 6, 2022 at 3:50 AM Shengjiu Wang &lt;<a href=3D"mailto:shengjiu=
.wang@gmail.com" target=3D"_blank">shengjiu.wang@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Wait for status of in=
itialization for every enabled pairs */<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0udelay(5);<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0regmap_read(asrc-&gt;regmap, REG_ASRCFG, &amp;reg);<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0reg =3D (reg &gt;&gt; ASRCFG_INIRQi_SHIFT(0)) &amp; 0x7;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} while ((reg !=3D ((asr=
ctr &gt;&gt; ASRCTR_ASRCEi_SHIFT(0)) &amp; 0x7)) &amp;&amp; --retry);<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: Doesn&#39;t tr=
eat initialization timeout as error */<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!retry)<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0dev_warn(dev, &quot;initialization isn&#39;t finished\n&quot;);<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Any reason why not just dev_err?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Just hesitate to use dev_err. if use dev_err, then should ret=
urn an error.<br>
&gt;&gt; &gt; May one of the pairs is finished, it still can continue.<br>
&gt;&gt;<br>
&gt;&gt; Makes sense. In that case, why &quot;FIXME&quot; :)<br>
<br>
&gt; Just want to have a record/note here, need to care about this warning.=
<br>
<br>
&quot;FIXME&quot; feels like something is wrong and literally means that it=
 is<br>
waiting for a fix/solution. In your case, it&#39;s not waiting for a fix<br=
>
at all, but just an annotation? So, shouldn&#39;t it be just &quot;Note:&qu=
ot;?<br></blockquote><div><br></div><div>ok, let me update it.=C2=A0</div><=
div><br></div><div>best regards</div><div>wang shengjiu</div></div></div>

--000000000000aa399a05e8028c8b--
