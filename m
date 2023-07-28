Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C4766DD2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 15:03:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EhanGkEv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC79C1fVnz3dFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 23:03:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EhanGkEv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBxzN32Ptz30Ng
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 16:09:03 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-26824c32cfbso1103184a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690524538; x=1691129338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FDiSGFyx5bcDGIRQXZZikTHVqG6P98+z3gao7urpU8g=;
        b=EhanGkEvw7Yf3TuLgM3YQrL9iEIgpxcutjLKwt3HGpKa2H6n6gdqN5atiYjTlCZF8h
         ZjmnHW2fTtGOfHHxaNESQ7ek5NK7tt6o7+sPDGPzNJ3Wp3eOOS5YcVRXy0Y6092ROWQ/
         knxqoQpNqDy3FbjYgXgV8DviQvxd1smDjEJUw/0mInA9yI5iiPucgx7FDa/xK5b4hTxV
         1KS7FMkDpKr5WTxsn2sGr05Nr3RX4dyQZTc9aHe6Bc+8NznFP4PETO+6kb+8u4+7SX3f
         OaX258B1N9QFkJDr4pB6yqMr6ZQaWE7QWNgVwUN7Y/Xg+UDJ574+lSjxuYL00rCHC1XC
         gJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690524538; x=1691129338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDiSGFyx5bcDGIRQXZZikTHVqG6P98+z3gao7urpU8g=;
        b=HqIhfV4smC5a2cMKjbvAMfMpMVLibN7Ev5eF/NmWYFJjl32uvfoR36yM5o5y0GJ8Aw
         yaKupnQlAaZZWBpkkLc+4JDvkvgQrNGkEjp3TvIeVDqsA16R8LcCoD18gRXvXo0lP2Ir
         LHvssF+Ryo1TaAKVFlJOedVoKNIJIiXNTn8z2p+fHIhaF8cqLv2WTsm+Hrh2dbuurUW0
         j3t2Rs/7Ax30WSHFb7elksDNuIzCHr/js82iIEBPtlyhDOGPbOLvCK21qPT/2aAveejt
         guUPfwvVcWTY4pVnc3XF14nVOc8b4eEN8S+tvY8FHK+O4OT/70MdM0iEzmhVD/fwQQd0
         1rwQ==
X-Gm-Message-State: ABy/qLZNjH3GEu1GckEmog4iJi7wLEX63/2+FC+UtzAWtGkBt9nkQv4z
	aTSOP/meG0dD629N9pBxGVrl/dm2+J6oPZqhY5Q=
X-Google-Smtp-Source: APBJJlFjajdNU0aEAakjjYa4nWkR9AsP1kQfAHOCt6PFRiiqDCI7UaWsuDrJTq87UJu1UYsRYz2IZD1PnMpH0bupFs8=
X-Received: by 2002:a17:90b:1910:b0:268:2f6:61c4 with SMTP id
 mp16-20020a17090b191000b0026802f661c4mr1297665pjb.12.1690524538280; Thu, 27
 Jul 2023 23:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230727031459.571559-1-chancel.liu@nxp.com> <20230727031459.571559-3-chancel.liu@nxp.com>
In-Reply-To: <20230727031459.571559-3-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Jul 2023 14:08:46 +0800
Message-ID: <CAA+D8ANbhhyBX_wmLaeUFaR0HK+hmRGT0J70aPPSPBeTm8uh0A@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_micfil: Add fsl_micfil_check_version function
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="000000000000969f1a060185ea28"
X-Mailman-Approved-At: Fri, 28 Jul 2023 23:01:37 +1000
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000969f1a060185ea28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 11:15=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:

> fsl_micfil_check_version can help to parse the version info in VERID
> and PARAM registers. Since the two registers are added only on i.MX93
> platform, a member flag called check_version is introduced to soc data
> structure which indicates need to check version.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  sound/soc/fsl/fsl_micfil.c | 76 +++++++++++++++++++++++++++++++++++++-
>  sound/soc/fsl/fsl_micfil.h | 36 ++++++++++++++++++
>  2 files changed, 110 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index b15febf19c02..46eda6e8c4b6 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -56,6 +56,8 @@ struct fsl_micfil {
>         int vad_init_mode;
>         int vad_enabled;
>         int vad_detected;
> +       struct fsl_micfil_verid verid;
> +       struct fsl_micfil_param param;
>  };
>
>  struct fsl_micfil_soc_data {
> @@ -64,6 +66,7 @@ struct fsl_micfil_soc_data {
>         unsigned int dataline;
>         bool imx;
>         bool use_edma;
> +       bool check_version;
>

Maybe using "use_verid" is better? for in the future
there will be "use_fsync_ctrl" added?

best regards
wang shengjiu

>         u64  formats;
>  };
>
> @@ -90,6 +93,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 =3D =
{
>         .dataline =3D  0xf,
>         .formats =3D SNDRV_PCM_FMTBIT_S32_LE,
>         .use_edma =3D true,
> +       .check_version =3D true,
>  };
>
>  static const struct of_device_id fsl_micfil_dt_ids[] =3D {
> @@ -356,6 +360,49 @@ static const struct snd_kcontrol_new
> fsl_micfil_snd_controls[] =3D {
>         SOC_SINGLE_BOOL_EXT("VAD Detected", 0, hwvad_detected, NULL),
>  };
>
> +static int fsl_micfil_check_version(struct device *dev)
> +{
> +       struct fsl_micfil *micfil =3D dev_get_drvdata(dev);
> +       unsigned int val;
> +       int ret;
> +
> +       if (!micfil->soc->check_version)
> +               return 0;
> +
> +       ret =3D regmap_read(micfil->regmap, REG_MICFIL_VERID, &val);
> +       if (ret < 0)
> +               return ret;
> +
> +       dev_dbg(dev, "VERID: 0x%016X\n", val);
> +
> +       micfil->verid.version =3D val &
> +               (MICFIL_VERID_MAJOR_MASK | MICFIL_VERID_MINOR_MASK);
> +       micfil->verid.version >>=3D MICFIL_VERID_MINOR_SHIFT;
> +       micfil->verid.feature =3D val & MICFIL_VERID_FEATURE_MASK;
> +
> +       ret =3D regmap_read(micfil->regmap, REG_MICFIL_PARAM, &val);
> +       if (ret < 0)
> +               return ret;
> +
> +       dev_dbg(dev, "PARAM: 0x%016X\n", val);
> +
> +       micfil->param.hwvad_num =3D (val & MICFIL_PARAM_NUM_HWVAD_MASK) >=
>
> +               MICFIL_PARAM_NUM_HWVAD_SHIFT;
> +       micfil->param.hwvad_zcd =3D val & MICFIL_PARAM_HWVAD_ZCD;
> +       micfil->param.hwvad_energy_mode =3D val &
> MICFIL_PARAM_HWVAD_ENERGY_MODE;
> +       micfil->param.hwvad =3D val & MICFIL_PARAM_HWVAD;
> +       micfil->param.dc_out_bypass =3D val & MICFIL_PARAM_DC_OUT_BYPASS;
> +       micfil->param.dc_in_bypass =3D val & MICFIL_PARAM_DC_IN_BYPASS;
> +       micfil->param.low_power =3D val & MICFIL_PARAM_LOW_POWER;
> +       micfil->param.fil_out_width =3D val & MICFIL_PARAM_FIL_OUT_WIDTH;
> +       micfil->param.fifo_ptrwid =3D (val & MICFIL_PARAM_FIFO_PTRWID_MAS=
K)
> >>
> +               MICFIL_PARAM_FIFO_PTRWID_SHIFT;
> +       micfil->param.npair =3D (val & MICFIL_PARAM_NPAIR_MASK) >>
> +               MICFIL_PARAM_NPAIR_SHIFT;
> +
> +       return 0;
> +}
> +
>  /* The SRES is a self-negated bit which provides the CPU with the
>   * capability to initialize the PDM Interface module through the
>   * slave-bus interface. This bit always reads as zero, and this
> @@ -1037,6 +1084,9 @@ static irqreturn_t hwvad_err_isr(int irq, void
> *devid)
>         return IRQ_HANDLED;
>  }
>
> +static int fsl_micfil_runtime_suspend(struct device *dev);
> +static int fsl_micfil_runtime_resume(struct device *dev);
> +
>  static int fsl_micfil_probe(struct platform_device *pdev)
>  {
>         struct device_node *np =3D pdev->dev.of_node;
> @@ -1156,6 +1206,25 @@ static int fsl_micfil_probe(struct platform_device
> *pdev)
>         platform_set_drvdata(pdev, micfil);
>
>         pm_runtime_enable(&pdev->dev);
> +       if (!pm_runtime_enabled(&pdev->dev)) {
> +               ret =3D fsl_micfil_runtime_resume(&pdev->dev);
> +               if (ret)
> +                       goto err_pm_disable;
> +       }
> +
> +       ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +       if (ret < 0)
> +               goto err_pm_get_sync;
> +
> +       /* Get micfil version */
> +       ret =3D fsl_micfil_check_version(&pdev->dev);
> +       if (ret < 0)
> +               dev_warn(&pdev->dev, "Error reading MICFIL version: %d\n"=
,
> ret);
> +
> +       ret =3D pm_runtime_put_sync(&pdev->dev);
> +       if (ret < 0 && ret !=3D -ENOSYS)
> +               goto err_pm_get_sync;
> +
>         regcache_cache_only(micfil->regmap, true);
>
>         /*
> @@ -1180,6 +1249,9 @@ static int fsl_micfil_probe(struct platform_device
> *pdev)
>
>         return ret;
>
> +err_pm_get_sync:
> +       if (!pm_runtime_status_suspended(&pdev->dev))
> +               fsl_micfil_runtime_suspend(&pdev->dev);
>  err_pm_disable:
>         pm_runtime_disable(&pdev->dev);
>
> @@ -1191,7 +1263,7 @@ static void fsl_micfil_remove(struct platform_devic=
e
> *pdev)
>         pm_runtime_disable(&pdev->dev);
>  }
>
> -static int __maybe_unused fsl_micfil_runtime_suspend(struct device *dev)
> +static int fsl_micfil_runtime_suspend(struct device *dev)
>  {
>         struct fsl_micfil *micfil =3D dev_get_drvdata(dev);
>
> @@ -1203,7 +1275,7 @@ static int __maybe_unused
> fsl_micfil_runtime_suspend(struct device *dev)
>         return 0;
>  }
>
> -static int __maybe_unused fsl_micfil_runtime_resume(struct device *dev)
> +static int fsl_micfil_runtime_resume(struct device *dev)
>  {
>         struct fsl_micfil *micfil =3D dev_get_drvdata(dev);
>         int ret;
> diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
> index b3c392ef5daf..231a52aff024 100644
> --- a/sound/soc/fsl/fsl_micfil.h
> +++ b/sound/soc/fsl/fsl_micfil.h
> @@ -174,4 +174,40 @@
>  #define MICFIL_HWVAD_ENVELOPE_MODE     0
>  #define MICFIL_HWVAD_ENERGY_MODE       1
>
> +/**
> + * struct fsl_micfil_verid - version id data
> + * @version: version number
> + * @feature: feature specification number
> + */
> +struct fsl_micfil_verid {
> +       u32 version;
> +       u32 feature;
> +};
> +
> +/**
> + * struct fsl_micfil_param - parameter data
> + * @hwvad_num: the number of HWVADs
> + * @hwvad_zcd: HWVAD zero-cross detector is active
> + * @hwvad_energy_mode: HWVAD energy mode is active
> + * @hwvad: HWVAD is active
> + * @dc_out_bypass: points out if the output DC remover is disabled
> + * @dc_in_bypass: points out if the input DC remover is disabled
> + * @low_power: low power decimation filter
> + * @fil_out_width: filter output width
> + * @fifo_ptrwid: FIFO pointer width
> + * @npair: number of microphone pairs
> + */
> +struct fsl_micfil_param {
> +       u32 hwvad_num;
> +       bool hwvad_zcd;
> +       bool hwvad_energy_mode;
> +       bool hwvad;
> +       bool dc_out_bypass;
> +       bool dc_in_bypass;
> +       bool low_power;
> +       bool fil_out_width;
> +       u32 fifo_ptrwid;
> +       u32 npair;
> +};
> +
>  #endif /* _FSL_MICFIL_H */
> --
> 2.25.1
>
>

--000000000000969f1a060185ea28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 27, 2023 at 11:15=E2=80=
=AFAM Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nx=
p.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">fsl_micfil_check_version can help to parse the version info in VERID<b=
r>
and PARAM registers. Since the two registers are added only on i.MX93<br>
platform, a member flag called check_version is introduced to soc data<br>
structure which indicates need to check version.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br>
---<br>
=C2=A0sound/soc/fsl/fsl_micfil.c | 76 +++++++++++++++++++++++++++++++++++++=
-<br>
=C2=A0sound/soc/fsl/fsl_micfil.h | 36 ++++++++++++++++++<br>
=C2=A02 files changed, 110 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c<br>
index b15febf19c02..46eda6e8c4b6 100644<br>
--- a/sound/soc/fsl/fsl_micfil.c<br>
+++ b/sound/soc/fsl/fsl_micfil.c<br>
@@ -56,6 +56,8 @@ struct fsl_micfil {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vad_init_mode;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vad_enabled;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vad_detected;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct fsl_micfil_verid verid;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct fsl_micfil_param param;<br>
=C2=A0};<br>
<br>
=C2=A0struct fsl_micfil_soc_data {<br>
@@ -64,6 +66,7 @@ struct fsl_micfil_soc_data {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int dataline;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool imx;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool use_edma;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool check_version;<br></blockquote><div><br></=
div><div>Maybe using &quot;use_verid&quot; is better? for in the future</di=
v><div>there will be &quot;use_fsync_ctrl&quot; added?</div><div><br></div>=
<div>best regards</div><div>wang shengjiu=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u64=C2=A0 formats;<br>
=C2=A0};<br>
<br>
@@ -90,6 +93,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .dataline =3D=C2=A0 0xf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .formats =3D SNDRV_PCM_FMTBIT_S32_LE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .use_edma =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.check_version =3D true,<br>
=C2=A0};<br>
<br>
=C2=A0static const struct of_device_id fsl_micfil_dt_ids[] =3D {<br>
@@ -356,6 +360,49 @@ static const struct snd_kcontrol_new fsl_micfil_snd_co=
ntrols[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC_SINGLE_BOOL_EXT(&quot;VAD Detected&quot;, 0=
, hwvad_detected, NULL),<br>
=C2=A0};<br>
<br>
+static int fsl_micfil_check_version(struct device *dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct fsl_micfil *micfil =3D dev_get_drvdata(d=
ev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!micfil-&gt;soc-&gt;check_version)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(micfil-&gt;regmap, REG_MICF=
IL_VERID, &amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(dev, &quot;VERID: 0x%016X\n&quot;, val)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;verid.version =3D val &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(MICFIL_VERID_MAJOR=
_MASK | MICFIL_VERID_MINOR_MASK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;verid.version &gt;&gt;=3D MICFIL_VER=
ID_MINOR_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;verid.feature =3D val &amp; MICFIL_V=
ERID_FEATURE_MASK;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(micfil-&gt;regmap, REG_MICF=
IL_PARAM, &amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(dev, &quot;PARAM: 0x%016X\n&quot;, val)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;param.hwvad_num =3D (val &amp; MICFI=
L_PARAM_NUM_HWVAD_MASK) &gt;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MICFIL_PARAM_NUM_HW=
VAD_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;param.hwvad_zcd =3D val &amp; MICFIL=
_PARAM_HWVAD_ZCD;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;param.hwvad_energy_mode =3D val &amp=
; MICFIL_PARAM_HWVAD_ENERGY_MODE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;param.hwvad =3D val &amp; MICFIL_PAR=
AM_HWVAD;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;param.dc_out_bypass =3D val &amp; MI=
CFIL_PARAM_DC_OUT_BYPASS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;param.dc_in_bypass =3D val &amp; MIC=
FIL_PARAM_DC_IN_BYPASS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;param.low_power =3D val &amp; MICFIL=
_PARAM_LOW_POWER;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;param.fil_out_width =3D val &amp; MI=
CFIL_PARAM_FIL_OUT_WIDTH;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;param.fifo_ptrwid =3D (val &amp; MIC=
FIL_PARAM_FIFO_PTRWID_MASK) &gt;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MICFIL_PARAM_FIFO_P=
TRWID_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;param.npair =3D (val &amp; MICFIL_PA=
RAM_NPAIR_MASK) &gt;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MICFIL_PARAM_NPAIR_=
SHIFT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0/* The SRES is a self-negated bit which provides the CPU with the<br>
=C2=A0 * capability to initialize the PDM Interface module through the<br>
=C2=A0 * slave-bus interface. This bit always reads as zero, and this<br>
@@ -1037,6 +1084,9 @@ static irqreturn_t hwvad_err_isr(int irq, void *devid=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IRQ_HANDLED;<br>
=C2=A0}<br>
<br>
+static int fsl_micfil_runtime_suspend(struct device *dev);<br>
+static int fsl_micfil_runtime_resume(struct device *dev);<br>
+<br>
=C2=A0static int fsl_micfil_probe(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *np =3D pdev-&gt;dev.of_node=
;<br>
@@ -1156,6 +1206,25 @@ static int fsl_micfil_probe(struct platform_device *=
pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, micfil);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_enable(&amp;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pm_runtime_enabled(&amp;pdev-&gt;dev)) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fsl_micfil_=
runtime_resume(&amp;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto err_pm_disable;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pm_runtime_resume_and_get(&amp;pdev-&gt=
;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_pm_get_syn=
c;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get micfil version */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fsl_micfil_check_version(&amp;pdev-&gt;=
dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;pdev-=
&gt;dev, &quot;Error reading MICFIL version: %d\n&quot;, ret);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pm_runtime_put_sync(&amp;pdev-&gt;dev);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0 &amp;&amp; ret !=3D -ENOSYS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_pm_get_syn=
c;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 regcache_cache_only(micfil-&gt;regmap, true);<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
@@ -1180,6 +1249,9 @@ static int fsl_micfil_probe(struct platform_device *p=
dev)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
+err_pm_get_sync:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pm_runtime_status_suspended(&amp;pdev-&gt;=
dev))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsl_micfil_runtime_=
suspend(&amp;pdev-&gt;dev);<br>
=C2=A0err_pm_disable:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
<br>
@@ -1191,7 +1263,7 @@ static void fsl_micfil_remove(struct platform_device =
*pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
=C2=A0}<br>
<br>
-static int __maybe_unused fsl_micfil_runtime_suspend(struct device *dev)<b=
r>
+static int fsl_micfil_runtime_suspend(struct device *dev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct fsl_micfil *micfil =3D dev_get_drvdata(d=
ev);<br>
<br>
@@ -1203,7 +1275,7 @@ static int __maybe_unused fsl_micfil_runtime_suspend(=
struct device *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-static int __maybe_unused fsl_micfil_runtime_resume(struct device *dev)<br=
>
+static int fsl_micfil_runtime_resume(struct device *dev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct fsl_micfil *micfil =3D dev_get_drvdata(d=
ev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h<br>
index b3c392ef5daf..231a52aff024 100644<br>
--- a/sound/soc/fsl/fsl_micfil.h<br>
+++ b/sound/soc/fsl/fsl_micfil.h<br>
@@ -174,4 +174,40 @@<br>
=C2=A0#define MICFIL_HWVAD_ENVELOPE_MODE=C2=A0 =C2=A0 =C2=A00<br>
=C2=A0#define MICFIL_HWVAD_ENERGY_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
<br>
+/**<br>
+ * struct fsl_micfil_verid - version id data<br>
+ * @version: version number<br>
+ * @feature: feature specification number<br>
+ */<br>
+struct fsl_micfil_verid {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 version;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 feature;<br>
+};<br>
+<br>
+/**<br>
+ * struct fsl_micfil_param - parameter data<br>
+ * @hwvad_num: the number of HWVADs<br>
+ * @hwvad_zcd: HWVAD zero-cross detector is active<br>
+ * @hwvad_energy_mode: HWVAD energy mode is active<br>
+ * @hwvad: HWVAD is active<br>
+ * @dc_out_bypass: points out if the output DC remover is disabled<br>
+ * @dc_in_bypass: points out if the input DC remover is disabled<br>
+ * @low_power: low power decimation filter<br>
+ * @fil_out_width: filter output width<br>
+ * @fifo_ptrwid: FIFO pointer width<br>
+ * @npair: number of microphone pairs<br>
+ */<br>
+struct fsl_micfil_param {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 hwvad_num;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool hwvad_zcd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool hwvad_energy_mode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool hwvad;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool dc_out_bypass;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool dc_in_bypass;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool low_power;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool fil_out_width;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 fifo_ptrwid;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 npair;<br>
+};<br>
+<br>
=C2=A0#endif /* _FSL_MICFIL_H */<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000969f1a060185ea28--
