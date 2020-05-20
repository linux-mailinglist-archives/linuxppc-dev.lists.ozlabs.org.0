Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF0A1DAD29
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 10:23:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rm354ThdzDqNf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 18:22:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aP5ju1bh; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rm1H3rNVzDqVV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 18:21:23 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id z80so2781131qka.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GeohJKPS7M9KB2Z0UOMQZ+VWn+6x4apfiV2ZaqWSAWU=;
 b=aP5ju1bhRU9QWpsnVmHodgx/YH9viaoIrlq53IbD2Oo8bVgsZcgqSFu0+VkLaB+mu6
 XjIcAbcBDX3+4rgxSNwaI66rluDudwmhw23fcrx0iFCLDrn4INeGj5xt4W69uC22LT+z
 zshvuydRZkPnBqKzWH9AppzFimSHJKYcILP/R9Ar7C8BsDmhca6LyPhw/XShvC8eCyNE
 fRjr7auJGGf8NS0NI+0+gkFEZ224Yu3baS1r4nHx6g9W2qIWHGlVELDtT0k5CU6YKHWl
 gW7UwZqZVA8gDwrk4E6ZkocUMzlJKBJxzKhClLHIdY4LDe8mRLoSVBaAWSZDNUznsZJ/
 FNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GeohJKPS7M9KB2Z0UOMQZ+VWn+6x4apfiV2ZaqWSAWU=;
 b=PvGQhNpLhERvc9QdqxieedPty+LuzVVFzMFVMhR1CDrwC2nrpuvFih+5kZ5oQOIK8j
 mXQqHqFjt3y9d7l5gN7d42YpG854l/Vdz1KsSHgqCJZRGGYxWpzTEA8N+mDvQS0muBIh
 f++3G+ySqOUJnORifpp4mpsiqU8r3EaOKAXXLZ0fbLLivvjk6Aqbi3cWowpIXp6NjlZu
 +JpBKAi6KyzkB28nEfC1+Wm1n6e4LY5xQrFiV0RzSpoltS3ZvomY/01vYNtAbWt3F1e5
 I/ELvQW8tw+bjZISUFEtbEa6tJ50xIs7sRMfX9whWrDXMusGzk8Voz5EPN1qQE8JDmmS
 b/KA==
X-Gm-Message-State: AOAM530A/PAKnlELX4/aMTanjfPR4U1zaPErpjC6gKn6SSqsb8QMHD29
 FBRZfMO9Mrc7PZjNtrRTnt9VGB3sunqXBjJ3W3Y=
X-Google-Smtp-Source: ABdhPJzYY7WX5SvpZjR2Le4eqs31NSOpqqDD+AIItDcDtsc4sttLE1mqOlXDIimV9KUzSfqtbLesZ/hM8pwJaCmVgpM=
X-Received: by 2002:a37:a50d:: with SMTP id o13mr3477552qke.121.1589962879446; 
 Wed, 20 May 2020 01:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
In-Reply-To: <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 20 May 2020 16:20:58 +0800
Message-ID: <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 perex@perex.cz, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Tue, May 19, 2020 at 6:04 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Dienstag, den 19.05.2020, 17:41 +0800 schrieb Shengjiu Wang:
> > There are two requirements that we need to move the request
> > of dma channel from probe to open.
>
> How do you handle -EPROBE_DEFER return code from the channel request if
> you don't do it in probe?

I use the dma_request_slave_channel or dma_request_channel instead
of dmaengine_pcm_request_chan_of. so there should be not -EPROBE_DEFER
return code.

>
> > - When dma device binds with power-domains, the power will
> > be enabled when we request dma channel. If the request of dma
> > channel happen on probe, then the power-domains will be always
> > enabled after kernel boot up,  which is not good for power
> > saving,  so we need to move the request of dma channel to .open();
>
> This is certainly something which could be fixed in the dmaengine
> driver.

Dma driver always call the pm_runtime_get_sync in
device_alloc_chan_resources, the device_alloc_chan_resources is
called when channel is requested. so power is enabled on channel
request.

>
> > - With FE-BE case, if the dma channel is requested in probe,
> > then there will be below issue, which is caused by that the
> > dma channel will be requested duplicately
>
> Why is this requested a second time? Is this just some missing cleanup
> on a deferred probe path?

Not relate with deferred probe.  With DMA1->ASRC->DMA2->ESAI case,
the DMA1->ASRC->DMA2 is in FE,  ESAI is in BE.  When ESAI drvier
probe,  DMA3 channel is created with ESAI's "dma:tx" (DMA3 channel
is not used in this FE-BE case).    When FE-BE startup, DMA2
channel is created, it needs the ESAI's "dma:tx", so below warning
comes out.

>
> Regards,
> Lucas
>
> > [  638.906268] sysfs: cannot create duplicate filename '/devices/soc0/soc/2000000.bus/2000000.spba-bus/2024000.esai/dma:tx'
> > [  638.919061] CPU: 1 PID: 673 Comm: aplay Not tainted 5.7.0-rc1-12956-gfc64b2585593 #287
> > [  638.927113] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> > [  638.933690] [<c0110dd8>] (unwind_backtrace) from [<c010b8ec>] (show_stack+0x10/0x14)
> > [  638.941464] [<c010b8ec>] (show_stack) from [<c0557fc0>] (dump_stack+0xe4/0x118)
> > [  638.948808] [<c0557fc0>] (dump_stack) from [<c032aeb4>] (sysfs_warn_dup+0x50/0x64)
> > [  638.956406] [<c032aeb4>] (sysfs_warn_dup) from [<c032b1a8>] (sysfs_do_create_link_sd+0xc8/0xd4)
> > [  638.965134] [<c032b1a8>] (sysfs_do_create_link_sd) from [<c05dc668>] (dma_request_chan+0xb0/0x210)
> > [  638.974120] [<c05dc668>] (dma_request_chan) from [<c05dc7d0>] (dma_request_slave_channel+0x8/0x14)
> > [  638.983111] [<c05dc7d0>] (dma_request_slave_channel) from [<c09d5548>] (fsl_asrc_dma_hw_params+0x1e0/0x438)
> > [  638.992881] [<c09d5548>] (fsl_asrc_dma_hw_params) from [<c09c1654>] (soc_pcm_hw_params+0x4a0/0x6a8)
> > [  639.001952] [<c09c1654>] (soc_pcm_hw_params) from [<c09c39d4>] (dpcm_fe_dai_hw_params+0x70/0xe4)
> > [  639.010765] [<c09c39d4>] (dpcm_fe_dai_hw_params) from [<c099b274>] (snd_pcm_hw_params+0x158/0x418)
> > [  639.019750] [<c099b274>] (snd_pcm_hw_params) from [<c099c5a0>] (snd_pcm_ioctl+0x734/0x183c)
> > [  639.028129] [<c099c5a0>] (snd_pcm_ioctl) from [<c029ff94>] (ksys_ioctl+0x2ac/0xb98)
> > [  639.035812] [<c029ff94>] (ksys_ioctl) from [<c0100080>] (ret_fast_syscall+0x0/0x28)
> > [  639.043490] Exception stack(0xec529fa8 to 0xec529ff0)
> > [  639.048565] 9fa0:                   bee84650 01321870 00000004 c25c4111 bee84650 0002000f
> > [  639.056766] 9fc0: bee84650 01321870 01321820 00000036 00001f40 00000000 0002c2f8 00000003
> > [  639.064964] 9fe0: b6f483fc bee8451c b6ee2655 b6e1dcf8
> > [  639.070339] fsl-esai-dai 2024000.esai: Cannot create DMA dma:tx symlink
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/imx-pcm-dma.c | 173 +++++++++++++++++++++++++++++++++---
> >  1 file changed, 159 insertions(+), 14 deletions(-)
> >
> > diff --git a/sound/soc/fsl/imx-pcm-dma.c b/sound/soc/fsl/imx-pcm-dma.c
> > index 04a9bc749016..dae53b384df4 100644
> > --- a/sound/soc/fsl/imx-pcm-dma.c
> > +++ b/sound/soc/fsl/imx-pcm-dma.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/dmaengine.h>
> >  #include <linux/types.h>
> >  #include <linux/module.h>
> > +#include <linux/dma-mapping.h>
> >
> >  #include <sound/core.h>
> >  #include <sound/pcm.h>
> > @@ -29,24 +30,168 @@ static bool filter(struct dma_chan *chan, void *param)
> >       return true;
> >  }
> >
> > -static const struct snd_dmaengine_pcm_config imx_dmaengine_pcm_config = {
> > -     .prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
> > -     .compat_filter_fn = filter,
> > -};
> > +static int imx_pcm_hw_params(struct snd_soc_component *component,
> > +                          struct snd_pcm_substream *substream,
> > +                          struct snd_pcm_hw_params *params)
> > +{
> > +     struct snd_pcm_runtime *runtime = substream->runtime;
> > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +     struct snd_dmaengine_dai_dma_data *dma_data;
> > +     struct dma_slave_config config;
> > +     struct dma_chan *chan;
> > +     int ret = 0;
> >
> > -int imx_pcm_dma_init(struct platform_device *pdev, size_t size)
> > +     snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
> > +     runtime->dma_bytes = params_buffer_bytes(params);
> > +
> > +     chan = snd_dmaengine_pcm_get_chan(substream);
> > +     if (!chan)
> > +             return -EINVAL;
> > +
> > +     ret = snd_hwparams_to_dma_slave_config(substream, params, &config);
> > +     if (ret)
> > +             return ret;
> > +
> > +     dma_data = snd_soc_dai_get_dma_data(cpu_dai, substream);
> > +     if (!dma_data)
> > +             return -EINVAL;
> > +
> > +     snd_dmaengine_pcm_set_config_from_dai_data(substream,
> > +                                                dma_data,
> > +                                                &config);
> > +     return dmaengine_slave_config(chan, &config);
> > +}
> > +
> > +static int imx_pcm_hw_free(struct snd_soc_component *component,
> > +                        struct snd_pcm_substream *substream)
> >  {
> > -     struct snd_dmaengine_pcm_config *config;
> > +     snd_pcm_set_runtime_buffer(substream, NULL);
> > +     return 0;
> > +}
> > +
> > +static snd_pcm_uframes_t imx_pcm_pointer(struct snd_soc_component *component,
> > +                                      struct snd_pcm_substream *substream)
> > +{
> > +     return snd_dmaengine_pcm_pointer(substream);
> > +}
> > +
> > +static int imx_pcm_trigger(struct snd_soc_component *component,
> > +                        struct snd_pcm_substream *substream, int cmd)
> > +{
> > +     return snd_dmaengine_pcm_trigger(substream, cmd);
> > +}
> > +
> > +static int imx_pcm_open(struct snd_soc_component *component,
> > +                     struct snd_pcm_substream *substream)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +     bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +     struct snd_dmaengine_dai_dma_data *dma_data;
> > +     struct device *dev = component->dev;
> > +     struct snd_pcm_hardware hw;
> > +     struct dma_chan *chan;
> > +     int ret;
> > +
> > +     ret = snd_pcm_hw_constraint_integer(substream->runtime,
> > +                                         SNDRV_PCM_HW_PARAM_PERIODS);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to set pcm hw params periods\n");
> > +             return ret;
> > +     }
> > +
> > +     dma_data = snd_soc_dai_get_dma_data(cpu_dai, substream);
> > +     if (!dma_data)
> > +             return -EINVAL;
> > +
> > +     chan = dma_request_slave_channel(cpu_dai->dev, tx ? "tx" : "rx");
> > +     if (!chan) {
> > +             /* Try to request channel using compat_filter_fn */
> > +             chan = snd_dmaengine_pcm_request_channel(filter,
> > +                                                      dma_data->filter_data);
> > +             if (!chan)
> > +                     return -ENXIO;
> > +     }
> >
> > -     config = devm_kzalloc(&pdev->dev,
> > -                     sizeof(struct snd_dmaengine_pcm_config), GFP_KERNEL);
> > -     if (!config)
> > -             return -ENOMEM;
> > -     *config = imx_dmaengine_pcm_config;
> > +     ret = snd_dmaengine_pcm_open(substream, chan);
> > +     if (ret)
> > +             goto pcm_open_fail;
> >
> > -     return devm_snd_dmaengine_pcm_register(&pdev->dev,
> > -             config,
> > -             SND_DMAENGINE_PCM_FLAG_COMPAT);
> > +     memset(&hw, 0, sizeof(hw));
> > +     hw.info = SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
> > +                     SNDRV_PCM_INFO_INTERLEAVED;
> > +     hw.periods_min = 2;
> > +     hw.periods_max = UINT_MAX;
> > +     hw.period_bytes_min = 256;
> > +     hw.period_bytes_max = dma_get_max_seg_size(chan->device->dev);
> > +     hw.buffer_bytes_max = IMX_DEFAULT_DMABUF_SIZE;
> > +     hw.fifo_size = dma_data->fifo_size;
> > +
> > +     /* Refine the hw according to caps of DMA. */
> > +     ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
> > +                                                     dma_data,
> > +                                                     &hw,
> > +                                                     chan);
> > +     if (ret < 0)
> > +             goto refine_runtime_hwparams_fail;
> > +
> > +     snd_soc_set_runtime_hwparams(substream, &hw);
> > +
> > +     /* Support allocate memory from IRAM */
> > +     ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_IRAM,
> > +                               chan->device->dev,
> > +                               hw.buffer_bytes_max,
> > +                               &substream->dma_buffer);
> > +     if (ret < 0)
> > +             goto alloc_pagas_fail;
> > +
> > +     return 0;
> > +
> > +alloc_pagas_fail:
> > +refine_runtime_hwparams_fail:
> > +     snd_dmaengine_pcm_close(substream);
> > +pcm_open_fail:
> > +     dma_release_channel(chan);
> > +
> > +     return ret;
> > +}
> > +
> > +static int imx_pcm_close(struct snd_soc_component *component,
> > +                      struct snd_pcm_substream *substream)
> > +{
> > +     if (substream) {
> > +             snd_dma_free_pages(&substream->dma_buffer);
> > +             substream->dma_buffer.area = NULL;
> > +             substream->dma_buffer.addr = 0;
> > +     }
> > +
> > +     return snd_dmaengine_pcm_close_release_chan(substream);
> > +}
> > +
> > +static int imx_pcm_new(struct snd_soc_component *component,
> > +                    struct snd_soc_pcm_runtime *rtd)
> > +{
> > +     struct snd_card *card = rtd->card->snd_card;
> > +
> > +     return dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
> > +}
> > +
> > +static const struct snd_soc_component_driver imx_pcm_component = {
> > +     .name           = "imx-pcm-dma",
> > +     .pcm_construct  = imx_pcm_new,
> > +     .open           = imx_pcm_open,
> > +     .close          = imx_pcm_close,
> > +     .hw_params      = imx_pcm_hw_params,
> > +     .hw_free        = imx_pcm_hw_free,
> > +     .trigger        = imx_pcm_trigger,
> > +     .pointer        = imx_pcm_pointer,
> > +};
> > +
> > +int imx_pcm_dma_init(struct platform_device *pdev, size_t size)
> > +{
> > +     return devm_snd_soc_register_component(&pdev->dev,
> > +                                            &imx_pcm_component, NULL, 0);
> >  }
> >  EXPORT_SYMBOL_GPL(imx_pcm_dma_init);
> >
>
