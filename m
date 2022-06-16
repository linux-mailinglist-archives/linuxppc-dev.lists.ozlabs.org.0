Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE3A54F872
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 15:46:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPgKz2fffz3c7D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 23:45:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AJ0HPsBU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AJ0HPsBU;
	dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNvZD3zg8z30LC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 17:53:55 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id v8so617029ljj.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 00:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mUkmS4Z0DyeMmdjuxEPlq2pjLfUlOJ3MsLFFXv5JaTo=;
        b=AJ0HPsBU8qRppWXekaLXqODE0k+TJQdXqyZ4pGuUPYeiOddOYh2XZhCAwrMbz8NFOL
         ICj1KXYBgBcBaO1skv/60dOkIEczwKqJaDVowVrwoFsIN3wttnQL8th/swp7YhbARB9l
         4F5GWAhr+TvBmBc/yyn2FaOWkGZVVrkwqZBO8GQMS0WPpurg+34ROUb0k4COJA6mskEW
         vC+QwlUAe0LTp5usxgXo3OqtdixoiGIo+XAhakmyhvIk+IdXE+0melSObnpVd5WUdvS9
         HT/oAZPmTcKD4NymwXssgGzOmLphfHiBd5QaxD2pQspGSFkyvAPAc3WQl3iCOPHgaQO9
         qOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mUkmS4Z0DyeMmdjuxEPlq2pjLfUlOJ3MsLFFXv5JaTo=;
        b=Vfdo1O2gL9v8sW3mErOH1gspSuI3PFVWxo8A4C0DE72gSezg5VTsS4zp5/cySBtFbx
         I5CK31ZWkD5rkHdzQkNTPQm122ThJaDMsMpSIiQ5CDbG6XvtH3MXG0/4mAhQM0WatvCV
         G3a//4SMklWZwVqxGzetz1jax8hAlJGkpYvwqw3/9U2gRdvofviIA1gE/W5GnIThYJqP
         sU5OJdrEp10XeyA0S/hT3/3RjVdBqnXxhh6TzkiTXp4FsUidWPkpJoMV84jG6CG75Sb6
         pnxnB45tm43C8B/N7s8pQBqFgQjDcq0hPGoXfa3r7KeHqwKDUiqHjjt/5wcl3l5P211R
         O9ZA==
X-Gm-Message-State: AJIora9KR+L0VMKN9PM0geRAUCjDl1bGPYFPuWH73N1K23oo4FvNpeVx
	vV7MkorxxIccAU/AedQwmt3NiW69kG0gMr0nDqU=
X-Google-Smtp-Source: AGRyM1sXa5MxZmMaYrthL9kddZQqDV6TP6OLiTEaCHASD/FfC4TEVlRpHCks6gjOsu6xXcc1trg0BfrUAfD/aoatOUc=
X-Received: by 2002:a2e:9113:0:b0:255:a3e6:93cb with SMTP id
 m19-20020a2e9113000000b00255a3e693cbmr1948076ljg.312.1655366030089; Thu, 16
 Jun 2022 00:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <1655179884-12278-1-git-send-email-shengjiu.wang@nxp.com>
 <1655179884-12278-6-git-send-email-shengjiu.wang@nxp.com> <CAOMZO5BRVBawK2PRvTazkQf-wExOuni9qD76Ha3FYmZZQyPRsg@mail.gmail.com>
In-Reply-To: <CAOMZO5BRVBawK2PRvTazkQf-wExOuni9qD76Ha3FYmZZQyPRsg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 16 Jun 2022 15:53:38 +0800
Message-ID: <CAA+D8APKt+_JbbuQ=WaK7v8FM7SFCACif-Qx=gwuaLL=fGwLQw@mail.gmail.com>
Subject: Re: [PATCH 5/7] ASoC: fsl_sai: Move res variable to be global
To: Fabio Estevam <festevam@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000032619b05e18bf01c"
X-Mailman-Approved-At: Fri, 17 Jun 2022 23:45:29 +1000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000032619b05e18bf01c
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 15, 2022 at 10:22 PM Fabio Estevam <festevam@gmail.com> wrote:

> Hi Shengjiu,
>
> On Tue, Jun 14, 2022 at 1:25 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> wrote:
> >
> > The resource info need to be accessed by hw_params()
> > function for multi fifo case, the start address may
> > be not the FIFO0. So move it to be global first.
>
> Actually, it is not global. It is being added as a member of struct
> fsl_sai.
>
> Please rephrase the Subject to:
>
> ASoC: fsl_sai: Make res a member of struct fsl_sai
>
> and then in the commit log:
>
> "So move it to be a member of struct fsl_sai."
>

Thanks, I will update them.

best regards
wang shengjiu

--00000000000032619b05e18bf01c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 10:22 PM Fabi=
o Estevam &lt;<a href=3D"mailto:festevam@gmail.com">festevam@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Sh=
engjiu,<br>
<br>
On Tue, Jun 14, 2022 at 1:25 AM Shengjiu Wang &lt;<a href=3D"mailto:shengji=
u.wang@nxp.com" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The resource info need to be accessed by hw_params()<br>
&gt; function for multi fifo case, the start address may<br>
&gt; be not the FIFO0. So move it to be global first.<br>
<br>
Actually, it is not global. It is being added as a member of struct fsl_sai=
.<br>
<br>
Please rephrase the Subject to:<br>
<br>
ASoC: fsl_sai: Make res a member of struct fsl_sai<br>
<br>
and then in the commit log:<br>
<br>
&quot;So move it to be a member of struct fsl_sai.&quot;<br></blockquote><d=
iv><br></div><div>Thanks, I will update them.=C2=A0</div><div><br></div><di=
v>best regards</div><div>wang shengjiu</div></div></div>

--00000000000032619b05e18bf01c--
