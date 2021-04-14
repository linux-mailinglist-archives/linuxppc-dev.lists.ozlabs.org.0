Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7506C35F827
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 17:49:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL6Nm2kbqz3c01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 01:49:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=l.stach@pengutronix.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 962 seconds by postgrey-1.36 at boromir;
 Thu, 15 Apr 2021 01:49:26 AEST
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL6NQ5zBDz2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 01:49:25 +1000 (AEST)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lWhVq-0004Hr-0V; Wed, 14 Apr 2021 17:33:06 +0200
Message-ID: <50ef17a2d57b022c48bbca71fd4e074cc3ca9be5.camel@pengutronix.de>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
From: Lucas Stach <l.stach@pengutronix.de>
To: Robin Gong <yibin.gong@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 14 Apr 2021 17:33:03 +0200
In-Reply-To: <VE1PR04MB66387217EDE5133FD2D8F793894E9@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <VE1PR04MB66387217EDE5133FD2D8F793894E9@VE1PR04MB6638.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "S.j.
 Wang" <shengjiu.wang@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "perex@perex.cz" <perex@perex.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Robin,

Am Mittwoch, dem 14.04.2021 um 14:33 +0000 schrieb Robin Gong:
> On 2020/05/20 17:43 Lucas Stach <l.stach@pengutronix.de> wrote:
> > Am Mittwoch, den 20.05.2020, 16:20 +0800 schrieb Shengjiu Wang:
> > > Hi
> > > 
> > > On Tue, May 19, 2020 at 6:04 PM Lucas Stach <l.stach@pengutronix.de>
> > wrote:
> > > > Am Dienstag, den 19.05.2020, 17:41 +0800 schrieb Shengjiu Wang:
> > > > > There are two requirements that we need to move the request of dma
> > > > > channel from probe to open.
> > > > 
> > > > How do you handle -EPROBE_DEFER return code from the channel request
> > > > if you don't do it in probe?
> > > 
> > > I use the dma_request_slave_channel or dma_request_channel instead of
> > > dmaengine_pcm_request_chan_of. so there should be not -EPROBE_DEFER
> > > return code.
> > 
> > This is a pretty weak argument. The dmaengine device might probe after you
> > try to get the channel. Using a function to request the channel that doesn't
> > allow you to handle probe deferral is IMHO a bug and should be fixed, instead
> > of building even more assumptions on top of it.
> > 
> > > > > - When dma device binds with power-domains, the power will be
> > > > > enabled when we request dma channel. If the request of dma channel
> > > > > happen on probe, then the power-domains will be always enabled
> > > > > after kernel boot up,  which is not good for power saving,  so we
> > > > > need to move the request of dma channel to .open();
> > > > 
> > > > This is certainly something which could be fixed in the dmaengine
> > > > driver.
> > > 
> > > Dma driver always call the pm_runtime_get_sync in
> > > device_alloc_chan_resources, the device_alloc_chan_resources is called
> > > when channel is requested. so power is enabled on channel request.
> > 
> > So why can't you fix the dmaengine driver to do that RPM call at a later time
> > when the channel is actually going to be used? This will allow further power
> > savings with other slave devices than the audio PCM.
> Hi Lucas,
>   Thanks for your suggestion. I have tried to implement runtime autosuspend in
> fsl-edma driver on i.mx8qm/qxp with delay time (2 sec) for this feature as below
> (or you can refer to drivers/dma/qcom/hidma.c), and pm_runtime_get_sync/
> pm_runtime_put_autosuspend in all dmaengine driver interface like
> device_alloc_chan_resources/device_prep_slave_sg/device_prep_dma_cyclic/
> device_tx_status...
> 
> 
>                 pm_runtime_use_autosuspend(fsl_chan->dev);
>                 pm_runtime_set_autosuspend_delay(fsl_chan->dev, 2000);
> 
> That could resolve this audio case since the autosuspend could suspend runtime after
> 2 seconds if there is no further dma transfer but only channel request(device_alloc_chan_resources).
> But unfortunately, it cause another issue. As you know, on our i.mx8qm/qxp, 
> power domain done by scfw (drivers/firmware/imx/scu-pd.c) over mailbox:
>  imx_sc_pd_power()->imx_scu_call_rpc()-> imx_scu_ipc_write()->mbox_send_message()
> which means have to 'waits for completion', meanwhile, some driver like tty will call dmaengine
> interfaces in non-atomic case as below, 
> 
> static int uart_write(struct tty_struct *tty, const unsigned char *buf, int count)
> {
>    .......
> 	    port = uart_port_lock(state, flags);
>    ......
>         __uart_start(tty);  //call start_tx()->dmaengine_prep_slave_sg...
>         uart_port_unlock(port, flags);
>         return ret;
> }
> 
> Thus dma runtime resume may happen in that timing window and cause kernel alarm. 
> I'm not sure whether there are similar limitations on other driver subsystem. But for me,
> It looks like the only way to resolve the contradiction between tty and scu-pd (hardware
> limitation on i.mx8qm/qxp) is to give up autosuspend and keep pm_runtime_get_sync
> only in device_alloc_chan_resources because request channel is a safe non-atomic phase. 
> Do you have any idea? Thanks in advance. 

If you look closely at the driver you used as an example (hidma.c) it
looks like there is already something in there, which looks very much
like what you need here:

In hidma_issue_pending() the driver tries to get the device to runtime
resume. If this doesn't work, maybe due to the power domain code not
being able to be called in atomic context, the actual work of waking up
the dma hardware and issuing the descriptor is shunted to a tasklet.

If I'm reading this right, this is exactly what you need here to be
able to call the dmaengine code from atomic context: try the rpm get
and issue immediately when possible, otherwise shunt the work to a non-
atomic context where you can deal with the requirements of scu-pd.

Also you don't need the runtime resume in all of the functions you
mentioned. From a quick look into the edma driver it looks like for
example the prep_slave_dma() function only touches data structures in
memory, so you don't actually need the device to be awake at that
point. Only later in the flow when you write registers in the dma
hardware and actually issue the transfer you need to wake the device
from sleep.

Regards,
Lucas

>   
> 
> 
> 
> 
> > 
> > > > > - With FE-BE case, if the dma channel is requested in probe, then
> > > > > there will be below issue, which is caused by that the dma channel
> > > > > will be requested duplicately
> > > > 
> > > > Why is this requested a second time? Is this just some missing
> > > > cleanup on a deferred probe path?
> > > 
> > > Not relate with deferred probe.  With DMA1->ASRC->DMA2->ESAI case, the
> > > DMA1->ASRC->DMA2 is in FE,  ESAI is in BE.  When ESAI drvier probe,
> > > DMA3 channel is created with ESAI's "dma:tx" (DMA3 channel
> > > is not used in this FE-BE case).    When FE-BE startup, DMA2
> > > channel is created, it needs the ESAI's "dma:tx", so below warning
> > > comes out.
> > > 
> > > > Regards,
> > > > Lucas
> > > > 
> > > > > [  638.906268] sysfs: cannot create duplicate filename
> > '/devices/soc0/soc/2000000.bus/2000000.spba-bus/2024000.esai/dma:tx'
> > > > > [  638.919061] CPU: 1 PID: 673 Comm: aplay Not tainted
> > > > > 5.7.0-rc1-12956-gfc64b2585593 #287 [  638.927113] Hardware name:
> > > > > Freescale i.MX6 Quad/DualLite (Device Tree) [  638.933690]
> > > > > [<c0110dd8>] (unwind_backtrace) from [<c010b8ec>]
> > > > > (show_stack+0x10/0x14) [  638.941464] [<c010b8ec>] (show_stack)
> > > > > from [<c0557fc0>] (dump_stack+0xe4/0x118) [  638.948808]
> > > > > [<c0557fc0>] (dump_stack) from [<c032aeb4>]
> > > > > (sysfs_warn_dup+0x50/0x64) [  638.956406] [<c032aeb4>]
> > > > > (sysfs_warn_dup) from [<c032b1a8>]
> > > > > (sysfs_do_create_link_sd+0xc8/0xd4)
> > > > > [  638.965134] [<c032b1a8>] (sysfs_do_create_link_sd) from
> > > > > [<c05dc668>] (dma_request_chan+0xb0/0x210) [  638.974120]
> > > > > [<c05dc668>] (dma_request_chan) from [<c05dc7d0>]
> > > > > (dma_request_slave_channel+0x8/0x14)
> > > > > [  638.983111] [<c05dc7d0>] (dma_request_slave_channel) from
> > > > > [<c09d5548>] (fsl_asrc_dma_hw_params+0x1e0/0x438)
> > > > > [  638.992881] [<c09d5548>] (fsl_asrc_dma_hw_params) from
> > > > > [<c09c1654>] (soc_pcm_hw_params+0x4a0/0x6a8) [  639.001952]
> > > > > [<c09c1654>] (soc_pcm_hw_params) from [<c09c39d4>]
> > > > > (dpcm_fe_dai_hw_params+0x70/0xe4) [  639.010765] [<c09c39d4>]
> > > > > (dpcm_fe_dai_hw_params) from [<c099b274>]
> > > > > (snd_pcm_hw_params+0x158/0x418) [  639.019750] [<c099b274>]
> > > > > (snd_pcm_hw_params) from [<c099c5a0>]
> > (snd_pcm_ioctl+0x734/0x183c) [  639.028129] [<c099c5a0>] (snd_pcm_ioctl)
> > from [<c029ff94>] (ksys_ioctl+0x2ac/0xb98) [  639.035812] [<c029ff94>]
> > (ksys_ioctl) from [<c0100080>] (ret_fast_syscall+0x0/0x28) [  639.043490]
> > Exception stack(0xec529fa8 to 0xec529ff0)
> > > > > [  639.048565] 9fa0:                   bee84650 01321870
> > 00000004 c25c4111 bee84650 0002000f
> > > > > [  639.056766] 9fc0: bee84650 01321870 01321820 00000036
> > 00001f40
> > > > > 00000000 0002c2f8 00000003 [  639.064964] 9fe0: b6f483fc bee8451c
> > > > > b6ee2655 b6e1dcf8 [  639.070339] fsl-esai-dai 2024000.esai: Cannot
> > > > > create DMA dma:tx symlink
> > > > > 
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > ---
> > > > >  sound/soc/fsl/imx-pcm-dma.c | 173
> > > > > +++++++++++++++++++++++++++++++++---
> > > > >  1 file changed, 159 insertions(+), 14 deletions(-)
> > > > > 
> > > > > diff --git a/sound/soc/fsl/imx-pcm-dma.c
> > > > > b/sound/soc/fsl/imx-pcm-dma.c index 04a9bc749016..dae53b384df4
> > > > > 100644
> > > > > --- a/sound/soc/fsl/imx-pcm-dma.c
> > > > > +++ b/sound/soc/fsl/imx-pcm-dma.c
> > > > > @@ -11,6 +11,7 @@
> > > > >  #include <linux/dmaengine.h>
> > > > >  #include <linux/types.h>
> > > > >  #include <linux/module.h>
> > > > > +#include <linux/dma-mapping.h>
> > > > > 
> > > > >  #include <sound/core.h>
> > > > >  #include <sound/pcm.h>
> > > > > @@ -29,24 +30,168 @@ static bool filter(struct dma_chan *chan, void
> > *param)
> > > > >       return true;
> > > > >  }
> > > > > 
> > > > > -static const struct snd_dmaengine_pcm_config
> > imx_dmaengine_pcm_config = {
> > > > > -     .prepare_slave_config =
> > snd_dmaengine_pcm_prepare_slave_config,
> > > > > -     .compat_filter_fn = filter,
> > > > > -};
> > > > > +static int imx_pcm_hw_params(struct snd_soc_component
> > *component,
> > > > > +                          struct snd_pcm_substream *substream,
> > > > > +                          struct snd_pcm_hw_params *params) {
> > > > > +     struct snd_pcm_runtime *runtime = substream->runtime;
> > > > > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > > > > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > > > > +     struct snd_dmaengine_dai_dma_data *dma_data;
> > > > > +     struct dma_slave_config config;
> > > > > +     struct dma_chan *chan;
> > > > > +     int ret = 0;
> > > > > 
> > > > > -int imx_pcm_dma_init(struct platform_device *pdev, size_t size)
> > > > > +     snd_pcm_set_runtime_buffer(substream,
> > &substream->dma_buffer);
> > > > > +     runtime->dma_bytes = params_buffer_bytes(params);
> > > > > +
> > > > > +     chan = snd_dmaengine_pcm_get_chan(substream);
> > > > > +     if (!chan)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     ret = snd_hwparams_to_dma_slave_config(substream, params,
> > &config);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     dma_data = snd_soc_dai_get_dma_data(cpu_dai, substream);
> > > > > +     if (!dma_data)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     snd_dmaengine_pcm_set_config_from_dai_data(substream,
> > > > > +                                                dma_data,
> > > > > +                                                &config);
> > > > > +     return dmaengine_slave_config(chan, &config); }
> > > > > +
> > > > > +static int imx_pcm_hw_free(struct snd_soc_component *component,
> > > > > +                        struct snd_pcm_substream *substream)
> > > > >  {
> > > > > -     struct snd_dmaengine_pcm_config *config;
> > > > > +     snd_pcm_set_runtime_buffer(substream, NULL);
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static snd_pcm_uframes_t imx_pcm_pointer(struct snd_soc_component
> > *component,
> > > > > +                                      struct snd_pcm_substream
> > > > > +*substream) {
> > > > > +     return snd_dmaengine_pcm_pointer(substream);
> > > > > +}
> > > > > +
> > > > > +static int imx_pcm_trigger(struct snd_soc_component *component,
> > > > > +                        struct snd_pcm_substream *substream, int
> > > > > +cmd) {
> > > > > +     return snd_dmaengine_pcm_trigger(substream, cmd); }
> > > > > +
> > > > > +static int imx_pcm_open(struct snd_soc_component *component,
> > > > > +                     struct snd_pcm_substream *substream) {
> > > > > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > > > > +     bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> > > > > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > > > > +     struct snd_dmaengine_dai_dma_data *dma_data;
> > > > > +     struct device *dev = component->dev;
> > > > > +     struct snd_pcm_hardware hw;
> > > > > +     struct dma_chan *chan;
> > > > > +     int ret;
> > > > > +
> > > > > +     ret = snd_pcm_hw_constraint_integer(substream->runtime,
> > > > > +
> > SNDRV_PCM_HW_PARAM_PERIODS);
> > > > > +     if (ret < 0) {
> > > > > +             dev_err(dev, "failed to set pcm hw params periods\n");
> > > > > +             return ret;
> > > > > +     }
> > > > > +
> > > > > +     dma_data = snd_soc_dai_get_dma_data(cpu_dai, substream);
> > > > > +     if (!dma_data)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     chan = dma_request_slave_channel(cpu_dai->dev, tx ? "tx" : "rx");
> > > > > +     if (!chan) {
> > > > > +             /* Try to request channel using compat_filter_fn */
> > > > > +             chan = snd_dmaengine_pcm_request_channel(filter,
> > > > > +
> > dma_data->filter_data);
> > > > > +             if (!chan)
> > > > > +                     return -ENXIO;
> > > > > +     }
> > > > > 
> > > > > -     config = devm_kzalloc(&pdev->dev,
> > > > > -                     sizeof(struct snd_dmaengine_pcm_config),
> > GFP_KERNEL);
> > > > > -     if (!config)
> > > > > -             return -ENOMEM;
> > > > > -     *config = imx_dmaengine_pcm_config;
> > > > > +     ret = snd_dmaengine_pcm_open(substream, chan);
> > > > > +     if (ret)
> > > > > +             goto pcm_open_fail;
> > > > > 
> > > > > -     return devm_snd_dmaengine_pcm_register(&pdev->dev,
> > > > > -             config,
> > > > > -             SND_DMAENGINE_PCM_FLAG_COMPAT);
> > > > > +     memset(&hw, 0, sizeof(hw));
> > > > > +     hw.info = SNDRV_PCM_INFO_MMAP |
> > SNDRV_PCM_INFO_MMAP_VALID |
> > > > > +                     SNDRV_PCM_INFO_INTERLEAVED;
> > > > > +     hw.periods_min = 2;
> > > > > +     hw.periods_max = UINT_MAX;
> > > > > +     hw.period_bytes_min = 256;
> > > > > +     hw.period_bytes_max =
> > dma_get_max_seg_size(chan->device->dev);
> > > > > +     hw.buffer_bytes_max = IMX_DEFAULT_DMABUF_SIZE;
> > > > > +     hw.fifo_size = dma_data->fifo_size;
> > > > > +
> > > > > +     /* Refine the hw according to caps of DMA. */
> > > > > +     ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
> > > > > +
> > dma_data,
> > > > > +                                                     &hw,
> > > > > +                                                     chan);
> > > > > +     if (ret < 0)
> > > > > +             goto refine_runtime_hwparams_fail;
> > > > > +
> > > > > +     snd_soc_set_runtime_hwparams(substream, &hw);
> > > > > +
> > > > > +     /* Support allocate memory from IRAM */
> > > > > +     ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_IRAM,
> > > > > +                               chan->device->dev,
> > > > > +                               hw.buffer_bytes_max,
> > > > > +                               &substream->dma_buffer);
> > > > > +     if (ret < 0)
> > > > > +             goto alloc_pagas_fail;
> > > > > +
> > > > > +     return 0;
> > > > > +
> > > > > +alloc_pagas_fail:
> > > > > +refine_runtime_hwparams_fail:
> > > > > +     snd_dmaengine_pcm_close(substream);
> > > > > +pcm_open_fail:
> > > > > +     dma_release_channel(chan);
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > > +static int imx_pcm_close(struct snd_soc_component *component,
> > > > > +                      struct snd_pcm_substream *substream) {
> > > > > +     if (substream) {
> > > > > +             snd_dma_free_pages(&substream->dma_buffer);
> > > > > +             substream->dma_buffer.area = NULL;
> > > > > +             substream->dma_buffer.addr = 0;
> > > > > +     }
> > > > > +
> > > > > +     return snd_dmaengine_pcm_close_release_chan(substream);
> > > > > +}
> > > > > +
> > > > > +static int imx_pcm_new(struct snd_soc_component *component,
> > > > > +                    struct snd_soc_pcm_runtime *rtd) {
> > > > > +     struct snd_card *card = rtd->card->snd_card;
> > > > > +
> > > > > +     return dma_coerce_mask_and_coherent(card->dev,
> > > > > +DMA_BIT_MASK(32)); }
> > > > > +
> > > > > +static const struct snd_soc_component_driver imx_pcm_component = {
> > > > > +     .name           = "imx-pcm-dma",
> > > > > +     .pcm_construct  = imx_pcm_new,
> > > > > +     .open           = imx_pcm_open,
> > > > > +     .close          = imx_pcm_close,
> > > > > +     .hw_params      = imx_pcm_hw_params,
> > > > > +     .hw_free        = imx_pcm_hw_free,
> > > > > +     .trigger        = imx_pcm_trigger,
> > > > > +     .pointer        = imx_pcm_pointer,
> > > > > +};
> > > > > +
> > > > > +int imx_pcm_dma_init(struct platform_device *pdev, size_t size) {
> > > > > +     return devm_snd_soc_register_component(&pdev->dev,
> > > > > +
> > &imx_pcm_component,
> > > > > +NULL, 0);
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(imx_pcm_dma_init);
> > > > > 
> 


