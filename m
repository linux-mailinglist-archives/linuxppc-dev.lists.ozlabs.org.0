Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6336A5AE7F4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 14:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMPgz1kCxz3c18
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 22:23:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KLzYWgzL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KLzYWgzL;
	dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMMcG1b5Cz2yJ5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 20:50:35 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id c10so2347734ljj.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 03:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/OsXzUKuq1cC2zAcl0nrr1kHva2xFCkM0jP3L63CyEc=;
        b=KLzYWgzLxJ0kzxoY9Y+KTb/4Cmky+PM+vyhq17QxHJuDERk4PkA3tUm1nBYMllUwwg
         36pjGufYrzS3bK+heDXUxmf71peRbNVtnWuKLzXIUU2zvZWFuQGnvmJYira9OQ4YM5tB
         lbqWu+UACrbDgtJ+4MFnzl1shIVltZfL6H2JIS8LLWFPVhzbgTCTruFylqmtylse0TB4
         EDnmIHhDK+j/IpFFZzaLVr8jVA8XGZqqKO21ba8SMmPeox5o2F+QzOawvNJafa/EXwfn
         F1tA67pN8tJebmRtOUZoAQRdh1bFelAHuVzfjCxUnpa8xN4vAOTaQg6+CNg3zvZp+QOy
         zNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/OsXzUKuq1cC2zAcl0nrr1kHva2xFCkM0jP3L63CyEc=;
        b=7LKKwsLo0C1nLg+9+pXNcVMJ6G/bdyzTma6HbWU1K0pBjNjtXf+tiUlmgC1tQA3z45
         c4ACoNrJXOxG1zBFVMIad0wtj8WOW42n5hqGsWSiBa1UQsj9PIFPZcU3sVzue2MbFboR
         8TagFZm/uwgaqGTxB++Wot1hivR4w1+gCHqRRnUuZZt7sX4ll4OEq62wpfXHlkRYXNUl
         kNXNyn7n+MRMnm5cW1TxEwbhVFNVnLiA+WhAA/JGBWz9HhxFnZjJtQcxfQrse8kprISI
         wk7U10H6ZkLtQPHgVkmXf0OJEYY/Y//y9/FlsfKFJWpYrKKKi1GhR0i9MniM0KlajF46
         X9YA==
X-Gm-Message-State: ACgBeo0izfF9jcL97R9ccVYksI3BrZA5nf7XZs8emIaLUwCKTasALV92
	m52TByzGmJhSlIY6sCwSDwFwAN7suwE5DkJ2WUM=
X-Google-Smtp-Source: AA6agR73x2co/hxB1kNHeG+9A0jIaZGzPM1ptVAglIj0+20rFor1kXVIRg5AeAe+d88614KXCREEWTzqzFNYm3ULofo=
X-Received: by 2002:a2e:b747:0:b0:268:f837:27b9 with SMTP id
 k7-20020a2eb747000000b00268f83727b9mr5166064ljo.129.1662461431379; Tue, 06
 Sep 2022 03:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
 <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com> <CAGoOwPQfkT2ptdt6mBTAgPfN0NOoR4KfdLE9B2AoL+Qn6bWdFw@mail.gmail.com>
In-Reply-To: <CAGoOwPQfkT2ptdt6mBTAgPfN0NOoR4KfdLE9B2AoL+Qn6bWdFw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 6 Sep 2022 18:50:19 +0800
Message-ID: <CAA+D8AMYrQsu-nM_WdrBtB4iPU2UYNDhPW-zdY_Z+-9L03gu1Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000011fb5405e7fff769"
X-Mailman-Approved-At: Tue, 06 Sep 2022 22:23:28 +1000
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

--00000000000011fb5405e7fff769
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 6, 2022 at 5:50 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> On Mon, Sep 5, 2022 at 6:54 PM Shengjiu Wang <shengjiu.wang@gmail.com>
> wrote:
>
> >> > +       /* Wait for status of initialization for every enabled pairs
> */
> >> > +       do {
> >> > +               udelay(5);
> >> > +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
> >> > +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
> >> > +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7))
> && --retry);
> >> > +
> >> > +       /* FIXME: Doesn't treat initialization timeout as error */
> >> > +       if (!retry)
> >> > +               dev_warn(dev, "initialization isn't finished\n");
> >>
> >> Any reason why not just dev_err?
> >
> > Just hesitate to use dev_err. if use dev_err, then should return an
> error.
> > May one of the pairs is finished, it still can continue.
>
> Makes sense. In that case, why "FIXME" :)
>

Just want to have a record/note here, need to care about this warning.

Best regards
Wang shengjiu

--00000000000011fb5405e7fff769
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 6, 2022 at 5:50 PM Nicoli=
n Chen &lt;<a href=3D"mailto:nicoleotsuka@gmail.com">nicoleotsuka@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Mon, Sep 5, 2022 at 6:54 PM Shengjiu Wang &lt;<a href=3D"mailto:shengjiu=
.wang@gmail.com" target=3D"_blank">shengjiu.wang@gmail.com</a>&gt; wrote:<b=
r>
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Wait for status of initializat=
ion for every enabled pairs */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udela=
y(5);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regma=
p_read(asrc-&gt;regmap, REG_ASRCFG, &amp;reg);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =
=3D (reg &gt;&gt; ASRCFG_INIRQi_SHIFT(0)) &amp; 0x7;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} while ((reg !=3D ((asrctr &gt;&=
gt; ASRCTR_ASRCEi_SHIFT(0)) &amp; 0x7)) &amp;&amp; --retry);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: Doesn&#39;t treat initi=
alization timeout as error */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!retry)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_w=
arn(dev, &quot;initialization isn&#39;t finished\n&quot;);<br>
&gt;&gt;<br>
&gt;&gt; Any reason why not just dev_err?<br>
&gt;<br>
&gt; Just hesitate to use dev_err. if use dev_err, then should return an er=
ror.<br>
&gt; May one of the pairs is finished, it still can continue.<br>
<br>
Makes sense. In that case, why &quot;FIXME&quot; :)<br></blockquote><div><b=
r></div><div>Just want to have a record/note here, need to care about this =
warning.=C2=A0</div><div><br></div><div>Best regards</div><div>Wang shengji=
u</div></div></div>

--00000000000011fb5405e7fff769--
