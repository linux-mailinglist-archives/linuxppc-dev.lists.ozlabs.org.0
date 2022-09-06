Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB535ADDAA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 04:58:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MM97q4nSBz3bqT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 12:58:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lW+LPTis;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lW+LPTis;
	dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MM7jl0w7hz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 11:54:34 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id z6so15206994lfu.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Sep 2022 18:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zcTwaijpd2111xsDdervpJH9/9EDsphYRA2s0wo+LWI=;
        b=lW+LPTisK5EL83PlNfwHIRgyD85NBZqOEhnGqWrhWcjI4xy7mDs6KH+ClAngeTn3mQ
         o41+m6JMXXfnI3z7rXvvpHApZi2olOFeCTWeErVjcYbzHcnRO274gIKW9id9dk3LXBnh
         bbfcWOdXFd8ZBVd7IeBMigdDleaCs9ntPhGI05yA60yusbVBl/jJ/jUNgUFmratMpVWu
         o5+vAGEvo1bogvKe/e1urzLcG9AROxbJsvBd9Y7NGwPMgz/qKTRuHDO7U0IbosJy5W3b
         PgPP2rZdU0VwXPD/iKieDymxIIU7vbLOHdmY/5OhVO1y9fem2WppQEMcZ7nY5mXXR8kF
         K6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zcTwaijpd2111xsDdervpJH9/9EDsphYRA2s0wo+LWI=;
        b=InO+p2/deZ++4kbxBPIENvCwAfMqGMPi/ykNZaC+tG8ThPIwYPVMtFcpn2Rc3Y0R10
         DV+0Xt0RNTtK1bytJaRsMbFyIRmGkNtqLDQhFmQ8Nk1ZbKh5gvBtA0/dIGf9sevC8wBs
         h58U/yL8TKAFLh2Qp9vYlcXVnkQKCZASm1yJJ+PnmS5T1t/DikAGQLnxMuS0yImOwtUR
         iF7xyKqajdkc9CxB+966HJSRRXfrkfYYjkKRAucCGaS/2do6B3pCRxaiqAox4M92FnET
         kbchzzwbBV132GoloQ+LRl2T085BoQ0ndcNRqcLLbyEbOlI/xpMI672OvxQTGqoE3XS/
         EGsA==
X-Gm-Message-State: ACgBeo3Oy2d82Xlokb3liYCjfe9cYepy3a+k0/xZwpRBvGP+J8e39WDf
	NNFZwm8tH54eMW/EpEX0VZvSxX/AwMgOvFp0ii8=
X-Google-Smtp-Source: AA6agR6rpzNvrgDBOH7xaVDM/+HbHO0nMeVMUOH9wH2pSgnS+vmy/lSZkWXIl5pFi/oGBhvCu4veg5fAaBqtC69FIqE=
X-Received: by 2002:a05:6512:2211:b0:496:7767:28b with SMTP id
 h17-20020a056512221100b004967767028bmr1252696lfu.433.1662429268454; Mon, 05
 Sep 2022 18:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com> <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
In-Reply-To: <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 6 Sep 2022 09:54:16 +0800
Message-ID: <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000002b05305e7f87ac3"
X-Mailman-Approved-At: Tue, 06 Sep 2022 12:58:15 +1000
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

--00000000000002b05305e7f87ac3
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 9:15 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> On Mon, Sep 5, 2022 at 3:47 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> wrote:
> > @@ -1295,6 +1301,17 @@ static int fsl_asrc_runtime_resume(struct device
> *dev)
> >         regmap_update_bits(asrc->regmap, REG_ASRCTR,
> >                            ASRCTR_ASRCEi_ALL_MASK, asrctr);
> >
> > +       /* Wait for status of initialization for every enabled pairs */
> > +       do {
> > +               udelay(5);
> > +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
> > +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
> > +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) &&
> --retry);
> > +
> > +       /* FIXME: Doesn't treat initialization timeout as error */
> > +       if (!retry)
> > +               dev_warn(dev, "initialization isn't finished\n");
>
> Any reason why not just dev_err?


Just hesitate to use dev_err. if use dev_err, then should return an error.
May one of the pairs is finished, it still can continue.

Best regards
Wang Shengjiu

--00000000000002b05305e7f87ac3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 5, 2022 at 9:15 PM Nicoli=
n Chen &lt;<a href=3D"mailto:nicoleotsuka@gmail.com">nicoleotsuka@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Mon, Sep 5, 2022 at 3:47 AM Shengjiu Wang &lt;<a href=3D"mailto:shengjiu=
.wang@nxp.com" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt; wrote:<br>
&gt; @@ -1295,6 +1301,17 @@ static int fsl_asrc_runtime_resume(struct devic=
e *dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(asrc-&gt;regmap, R=
EG_ASRCTR,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ASRCTR_ASRCEi_ALL_MASK, asrctr);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Wait for status of initialization for e=
very enabled pairs */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(5);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_read(as=
rc-&gt;regmap, REG_ASRCFG, &amp;reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D (reg &=
gt;&gt; ASRCFG_INIRQi_SHIFT(0)) &amp; 0x7;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} while ((reg !=3D ((asrctr &gt;&gt; ASRCT=
R_ASRCEi_SHIFT(0)) &amp; 0x7)) &amp;&amp; --retry);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: Doesn&#39;t treat initialization=
 timeout as error */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!retry)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(dev, =
&quot;initialization isn&#39;t finished\n&quot;);<br>
<br>
Any reason why not just dev_err?</blockquote><div>=C2=A0</div><div>Just hes=
itate=C2=A0to use dev_err. if use dev_err, then should return an error.</di=
v><div>May one of the pairs is finished, it still can continue.</div><div><=
br></div><div>Best regards</div><div>Wang Shengjiu</div><div><br></div><div=
><br></div><div>=C2=A0</div></div></div>

--00000000000002b05305e7f87ac3--
