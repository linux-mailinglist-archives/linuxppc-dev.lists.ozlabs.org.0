Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF3F2CCD83
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 04:53:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmhlJ0W4yzDrNr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 14:53:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Mhea7zKS; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmhjK6VGNzDrDX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 14:51:47 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id q5so946028qkc.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Dec 2020 19:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SUzQs/+SoVYKqbh24yWO/KQhjnAXrlDusJdUSTJS5A8=;
 b=Mhea7zKSrwE8kuWuWy+h9M4qWmkuaGN4aIb747Gar6/nB54tO2IxYzyAY5JGJIBgFD
 4lNXCYHb96+jK8BAabG5UbTB6v+QvEBfjJ4Bu3NKUQepLKB3saaoGPMzgBSAvvAF2dGK
 DOTSmr7c4mjAX+j/vsXoRVSKJCKOW3ZsKIdPhkqZ9xqynSGNxavwDYgdOKFnNcxCDIUB
 Fhr24MF6tv758ybaKhhDZ17K3qDhsPb/0glb7vdNKf0Ihw9JAepVuoGN9K7CJGcgoj/h
 z1oJa4ibzH3I4wFno7uS5j/qBUnMpq7ogbpp+jR2XJewTmeN2Y9rGeebn7KHR7/ov8Yi
 hSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SUzQs/+SoVYKqbh24yWO/KQhjnAXrlDusJdUSTJS5A8=;
 b=arFCsEnJo9w4W741z8PhRv5s2rlgaxDY09heEe0hK3HJDAQxcphwbrPDB0YRyRiBVF
 to0OIIQelsGZDUc6awlCRiSrQQzNTEezubZAo+7gSZzo+oWTfEn50C3IUtVa1YOpS8TM
 Sa97GGeyoApPnWaeJzdkKWtGtxk+HemRfLq/0LyIasV/5F0Oks64E71nFC3yT6Dehtaj
 XZ/Tw6+gjlhDoc6VslgFeKkQXrOgNDs9PbTEuknTQdPEGyAmQx5LmyNsVoiefstbuhpn
 Dje5mEuqhKAc3HGt3iar/GFVp4xv7Mis0/JlqMp7RibbBBDYh/JcNgm1y/I0gokJZIEb
 kdVQ==
X-Gm-Message-State: AOAM531garESzun4EKUv1k4/tuwmWmy1VNvi3E5ZrqDZXkEi7oqr6NoN
 wIhh3doe1JrDgrdXZdB7JAm9ZhFyUrgf+OMbMuo=
X-Google-Smtp-Source: ABdhPJy7VJpgVDqrl8VrmWdiRB1M2O74ruT8AdiwDLEn+Mf13W/ZStOpINVSqcBacLORp6qnYaI9VhZZGC1MC4qMtf8=
X-Received: by 2002:a37:ad17:: with SMTP id f23mr1146570qkm.121.1606967502905; 
 Wed, 02 Dec 2020 19:51:42 -0800 (PST)
MIME-Version: 1.0
References: <1606455021-18882-1-git-send-email-shengjiu.wang@nxp.com>
 <1606455021-18882-2-git-send-email-shengjiu.wang@nxp.com>
 <20201202201955.GB1498@Asurada-Nvidia>
In-Reply-To: <20201202201955.GB1498@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 3 Dec 2020 11:51:32 +0800
Message-ID: <CAA+D8AOAMV4jyD0uBwER+0KkrBjJcrNPcT4zeYU8Y1WRDRXziQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl: Add imx-hdmi machine driver
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 3, 2020 at 4:23 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Fri, Nov 27, 2020 at 01:30:21PM +0800, Shengjiu Wang wrote:
> > The driver is initially designed for sound card using HDMI
> > interface on i.MX platform. There is internal HDMI IP or
> > external HDMI modules connect with SAI or AUD2HTX interface.
> > It supports both transmitter and receiver devices.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/Kconfig    |  12 ++
> >  sound/soc/fsl/Makefile   |   2 +
> >  sound/soc/fsl/imx-hdmi.c | 235 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 249 insertions(+)
> >  create mode 100644 sound/soc/fsl/imx-hdmi.c
>
> > diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
> > new file mode 100644
> > index 000000000000..ac164514b1b2
> > --- /dev/null
> > +++ b/sound/soc/fsl/imx-hdmi.c
>
> > +static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
> > +                           struct snd_pcm_hw_params *params)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +     struct imx_hdmi_data *data = snd_soc_card_get_drvdata(rtd->card);
> > +     bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +     struct snd_soc_card *card = rtd->card;
> > +     struct device *dev = card->dev;
> > +     int ret;
> > +
> > +     /* set cpu DAI configuration */
> > +     ret = snd_soc_dai_set_sysclk(cpu_dai, data->cpu_priv.sysclk_id[tx],
> > +                                  8 * data->cpu_priv.slot_width * params_rate(params),
>
> Looks like fixed 2 slots being used, judging by the set_tdm_slot
> call below. Then...why "8 *"? Probably need a line of comments?

The master clock always 256 * rate, when slot_width=32.  so use
the 8 * slot_width.  will add comments.

>
> > +                                  tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN);
> > +     if (ret && ret != -ENOTSUPP) {
> > +             dev_err(dev, "failed to set cpu sysclk: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0, 2, data->cpu_priv.slot_width);
>
> May have a local variable to cache slot_width.

ok.

>
> > +static int imx_hdmi_probe(struct platform_device *pdev)
>
> > +     data->dai.name = "i.MX HDMI";
> > +     data->dai.stream_name = "i.MX HDMI";
> > +     data->dai.cpus->dai_name = dev_name(&cpu_pdev->dev);
> > +     data->dai.platforms->of_node = cpu_np;
> > +     data->dai.ops = &imx_hdmi_ops;
> > +     data->dai.playback_only = true;
> > +     data->dai.capture_only = false;
> > +     data->dai.init = imx_hdmi_init;
> > +
> > +
> > +     if (of_property_read_bool(np, "hdmi-out")) {
> > +             data->dai.playback_only = true;
> > +             data->dai.capture_only = false;
> > +             data->dai.codecs->dai_name = "i2s-hifi";
> > +             data->dai.codecs->name = "hdmi-audio-codec.1";
> > +             data->dai.dai_fmt = data->dai_fmt |
> > +                                 SND_SOC_DAIFMT_NB_NF |
> > +                                 SND_SOC_DAIFMT_CBS_CFS;
> > +     }
> > +
> > +     if (of_property_read_bool(np, "hdmi-in")) {
> > +             data->dai.playback_only = false;
> > +             data->dai.capture_only = true;
> > +             data->dai.codecs->dai_name = "i2s-hifi";
> > +             data->dai.codecs->name = "hdmi-audio-codec.2";
> > +             data->dai.dai_fmt = data->dai_fmt |
> > +                                 SND_SOC_DAIFMT_NB_NF |
> > +                                 SND_SOC_DAIFMT_CBM_CFM;
> > +     }
> > +
> > +     if ((data->dai.playback_only && data->dai.capture_only) ||
> > +         (!data->dai.playback_only && !data->dai.capture_only)) {
> > +             dev_err(&pdev->dev, "Wrongly enable HDMI DAI link\n");
> > +             goto fail;
> > +     }
>
> Seems that this condition check can never be true, given that:
> 1. By default: playback_only=true && capture_only=false
> 2. Conditionally overwritten: playback_only=true && capture_only=false
> 3. Conditionally overwritten: playback_only=false && capture_only=true
>
> If I understand it correctly, probably should be something like:
>         bool hdmi_out = of_property_read_bool(np, "hdmi-out");
>         bool hdmi_in = of_property_read_bool(np, "hdmi-in");
>
>         if ((hdmi_out && hdmi_in) || (!hdmi_out || !hdmi_in))
>                 // "Invalid HDMI DAI link"; goto fail;
>
>         if (hdmi_out) {
>                 // ...
>         } else if (hdmi_in) {
>                 // ...
>         } else // No need of this line if two properties are exclusive
>

Good catch, will update it.

> > +     data->card.num_links = 1;
> > +     data->card.dai_link = &data->dai;
> > +
> > +     platform_set_drvdata(pdev, &data->card);
>
> Why pass card pointer?

Seems it duplicates with dev_set_drvdata(card->dev, card);
in snd_soc_register_card.  will remove it.

best regards
wang shengjiu
