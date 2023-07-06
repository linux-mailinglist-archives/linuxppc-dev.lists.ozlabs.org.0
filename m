Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5098C749D4F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:21:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aOtY4pQJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxccC1fk2z3c5l
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 23:21:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aOtY4pQJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxYvz3D3gz3bqc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 21:19:41 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6726d5d92afso1232120b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688642379; x=1691234379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S7Au9X7NkxtrT0jnVQVc4JQ7c3LuGMAw4J5ki5nmDTQ=;
        b=aOtY4pQJTY1hbfFiaZCw8v+xyMzdLnKFqJ/7prHynKDB/+sCmMlWd/iDm7i9tEgTJu
         mcRsNbYMSyIfMCm7Alfs5HvGUFPPqsRQR+fUhbYX9W7V9RUW/9D04D3+ZCZIXm05EOv7
         jPBKS4oFA5wsiNExV3ZlQSd3JSfKY5tO/wVrPHJVuqsQlMNccz9t8E5/LlrVmKKKPmOF
         xhpuj4t9/8v4SDCCc9dxyoXEirdvkdhBhMv4bJMAo4+0p3jQ6uFjUsqNd/x2CyirHv70
         qS+nHNdEdgM113R3YBsn/c1tAxhNKqDcux8NgvL1Ep8rPdrLRP8nYjwosLSAcmHsrztL
         Uzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688642379; x=1691234379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7Au9X7NkxtrT0jnVQVc4JQ7c3LuGMAw4J5ki5nmDTQ=;
        b=QvnOaIjJCnodKgNHvS+NfLy51qCAln+tP91dThbFCojMUKwB2btICo/7nrtI6zz+f8
         Wn87YhE1Hf7gvQwa4lSYLbfTXLdQFjDfsst36jqSk3NyOuaWN9V7Vbrs3dykF6X69z0X
         Kz1DcjPEP+AgzlAbTCnsdpNe9Vxo0BOj9vgTJseO2ag+clMZmnV0y+Q2tNdnJG9zL8t2
         3KBHm3T98oSl8nCt/ZF7sA50MhqiRQKYJedwe6e8FsU+wZ7Tnk9zViRo/em3G993JHkz
         3t4lNCvVzqjnRw1XTCWFfAP32nVn6f7JBWOXPMFjBnu6iD7ZLVXX0Xy5SPye6nT5sb6s
         NWBA==
X-Gm-Message-State: ABy/qLat+NPdUpgGAm2Fjs8hOGA07/0ImqLP5vyoSnQs+lftpOgs/7ep
	qEKSCHRrpXRcRPbpV622mf+m3JNZVc2X4eNQAMs=
X-Google-Smtp-Source: APBJJlGuBOSrm41copfyuAHMoUBKp8B7KwOUqRPL2+y2WJlF8Q9LfBOzQAtN9zVSuZoBe7eqnCz3uoscwB5hMUU1528=
X-Received: by 2002:a05:6a00:1886:b0:668:7494:384a with SMTP id
 x6-20020a056a00188600b006687494384amr2892558pfh.12.1688642379213; Thu, 06 Jul
 2023 04:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
 <20230706084706.bzwsbi3zisx5m5rl@fatal.se> <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
In-Reply-To: <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 Jul 2023 19:19:28 +0800
Message-ID: <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Fabio Estevam <festevam@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002a6df105ffcfb187"
X-Mailman-Approved-At: Thu, 06 Jul 2023 23:17:34 +1000
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>, Andreas Henriksson <andreas@fatal.se>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000002a6df105ffcfb187
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2023 at 7:08=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:

> Hi Andreas,
>
> On Thu, Jul 6, 2023 at 5:47=E2=80=AFAM Andreas Henriksson <andreas@fatal.=
se>
> wrote:
>
> > We've been working on an i.MX8MP where MCLK needs to be input and found
> > that this enables the MCLK as output despite not having set the
> > `fsl,sai-mclk-direction-output;` devicetree property in our DT.
> > Reverting the patch fixes the issues for us.
> >
> > I have to say that the code comment made me a bit confused, but once
> > I found the commit message I understood why this code existed.
> > If this is really i.MX8MM specific maybe mention that in the code
> > comment and please make the code actually only trigger on i.MX8MM.
> > It seems to me like these all fulfill the current criteria:
> > imx7ulp, imx8mq, imx8mm, imx8mp, imx8ulp, imx93
> >
> > Should I report this in bugzilla.kernel.org ?
>
> Should we do a fix like this?
>
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1453,7 +1453,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>
>         /* Select MCLK direction */
>         if (sai->mclk_direction_output &&
> -           sai->soc_data->max_register >=3D FSL_SAI_MCTL) {
> +           sai->soc_data->max_register >=3D FSL_SAI_MCTL &&
> sai->mclk_direction_output) {
>                 regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
>                                    FSL_SAI_MCTL_MCLK_EN,
> FSL_SAI_MCTL_MCLK_EN);
>         }
>

No, this is the code in probe().
The code with the issue is in fsl_sai_set_bclk().

The clean way for fixing is to remove the code in fsl_sai_set_bclk()
and add "fsl,sai-mclk-direction-output;" property in dts for some
node.

best regards
wang shengjiu

--0000000000002a6df105ffcfb187
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 6, 2023 at 7:08=E2=80=AFP=
M Fabio Estevam &lt;<a href=3D"mailto:festevam@gmail.com">festevam@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi Andreas,<br>
<br>
On Thu, Jul 6, 2023 at 5:47=E2=80=AFAM Andreas Henriksson &lt;<a href=3D"ma=
ilto:andreas@fatal.se" target=3D"_blank">andreas@fatal.se</a>&gt; wrote:<br=
>
<br>
&gt; We&#39;ve been working on an i.MX8MP where MCLK needs to be input and =
found<br>
&gt; that this enables the MCLK as output despite not having set the<br>
&gt; `fsl,sai-mclk-direction-output;` devicetree property in our DT.<br>
&gt; Reverting the patch fixes the issues for us.<br>
&gt;<br>
&gt; I have to say that the code comment made me a bit confused, but once<b=
r>
&gt; I found the commit message I understood why this code existed.<br>
&gt; If this is really i.MX8MM specific maybe mention that in the code<br>
&gt; comment and please make the code actually only trigger on i.MX8MM.<br>
&gt; It seems to me like these all fulfill the current criteria:<br>
&gt; imx7ulp, imx8mq, imx8mm, imx8mp, imx8ulp, imx93<br>
&gt;<br>
&gt; Should I report this in <a href=3D"http://bugzilla.kernel.org" rel=3D"=
noreferrer" target=3D"_blank">bugzilla.kernel.org</a> ?<br>
<br>
Should we do a fix like this?<br>
<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -1453,7 +1453,7 @@ static int fsl_sai_probe(struct platform_device *pdev=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Select MCLK direction */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sai-&gt;mclk_direction_output &amp;&amp;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;soc_data-&gt;max_register=
 &gt;=3D FSL_SAI_MCTL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;soc_data-&gt;max_register=
 &gt;=3D FSL_SAI_MCTL &amp;&amp;<br>
sai-&gt;mclk_direction_output) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(=
sai-&gt;regmap, FSL_SAI_MCTL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FSL_SAI_MCTL_MCLK_EN, F=
SL_SAI_MCTL_MCLK_EN);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>No, this =
is the code in probe().</div><div>The code with the issue is in=C2=A0<span =
style=3D"color:rgb(80,0,80)">fsl_sai_set_bclk().</span><br></div><div><span=
 style=3D"color:rgb(80,0,80)"><br></span></div><div><span style=3D"color:rg=
b(80,0,80)">The clean way for fixing is to remove the code in=C2=A0</span><=
span style=3D"color:rgb(80,0,80)">fsl_sai_set_bclk()</span></div><div><span=
 style=3D"color:rgb(80,0,80)">and add &quot;</span>fsl,sai-mclk-direction-o=
utput;&quot; property in dts for some</div><div>node.</div><div><span style=
=3D"color:rgb(80,0,80)"><br></span></div><div><span style=3D"color:rgb(80,0=
,80)">best regards</span></div><div><span style=3D"color:rgb(80,0,80)">wang=
 shengjiu</span></div><div><span style=3D"color:rgb(80,0,80)"><br></span></=
div></div></div>

--0000000000002a6df105ffcfb187--
