Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5BF363F1C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 11:46:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP25p3v36z3c2k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 19:46:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=l.stach@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (unknown
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP25T2pP4z2yyj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 19:46:34 +1000 (AEST)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lYQTz-0008Uf-0A; Mon, 19 Apr 2021 11:46:19 +0200
Message-ID: <97262466d537402ad4032098ef277d6d47734f1f.camel@pengutronix.de>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
From: Lucas Stach <l.stach@pengutronix.de>
To: Robin Gong <yibin.gong@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Apr 2021 11:46:15 +0200
In-Reply-To: <VE1PR04MB6638EE85485768351755557B89499@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <VE1PR04MB66387217EDE5133FD2D8F793894E9@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <50ef17a2d57b022c48bbca71fd4e074cc3ca9be5.camel@pengutronix.de>
 <VE1PR04MB6638EE85485768351755557B89499@VE1PR04MB6638.eurprd04.prod.outlook.com>
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

Am Montag, dem 19.04.2021 um 07:17 +0000 schrieb Robin Gong:
> Hi Lucas,
> 
> On 2021/04/14 Lucas Stach <l.stach@pengutronix.de> wrote:
> > Hi Robin,
> > 
> > Am Mittwoch, dem 14.04.2021 um 14:33 +0000 schrieb Robin Gong:
> > > On 2020/05/20 17:43 Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > Am Mittwoch, den 20.05.2020, 16:20 +0800 schrieb Shengjiu Wang:
> > > > > Hi
> > > > > 
> > > > > On Tue, May 19, 2020 at 6:04 PM Lucas Stach
> > > > > <l.stach@pengutronix.de>
> > > > wrote:
> > > > > > Am Dienstag, den 19.05.2020, 17:41 +0800 schrieb Shengjiu Wang:
> > > > > > > There are two requirements that we need to move the request of
> > > > > > > dma channel from probe to open.
> > > > > > 
> > > > > > How do you handle -EPROBE_DEFER return code from the channel
> > > > > > request if you don't do it in probe?
> > > > > 
> > > > > I use the dma_request_slave_channel or dma_request_channel instead
> > > > > of dmaengine_pcm_request_chan_of. so there should be not
> > > > > -EPROBE_DEFER return code.
> > > > 
> > > > This is a pretty weak argument. The dmaengine device might probe
> > > > after you try to get the channel. Using a function to request the
> > > > channel that doesn't allow you to handle probe deferral is IMHO a
> > > > bug and should be fixed, instead of building even more assumptions on top
> > of it.
> > > > 
> > > > > > > - When dma device binds with power-domains, the power will be
> > > > > > > enabled when we request dma channel. If the request of dma
> > > > > > > channel happen on probe, then the power-domains will be always
> > > > > > > enabled after kernel boot up,  which is not good for power
> > > > > > > saving,  so we need to move the request of dma channel to
> > > > > > > .open();
> > > > > > 
> > > > > > This is certainly something which could be fixed in the
> > > > > > dmaengine driver.
> > > > > 
> > > > > Dma driver always call the pm_runtime_get_sync in
> > > > > device_alloc_chan_resources, the device_alloc_chan_resources is
> > > > > called when channel is requested. so power is enabled on channel
> > request.
> > > > 
> > > > So why can't you fix the dmaengine driver to do that RPM call at a
> > > > later time when the channel is actually going to be used? This will
> > > > allow further power savings with other slave devices than the audio PCM.
> > > Hi Lucas,
> > >   Thanks for your suggestion. I have tried to implement runtime
> > > autosuspend in fsl-edma driver on i.mx8qm/qxp with delay time (2 sec)
> > > for this feature as below (or you can refer to
> > > drivers/dma/qcom/hidma.c), and pm_runtime_get_sync/
> > > pm_runtime_put_autosuspend in all dmaengine driver interface like
> > > device_alloc_chan_resources/device_prep_slave_sg/device_prep_dma_cycli
> > > c/
> > > device_tx_status...
> > > 
> > > 
> > >                 pm_runtime_use_autosuspend(fsl_chan->dev);
> > >                 pm_runtime_set_autosuspend_delay(fsl_chan->dev,
> > 2000);
> > > 
> > > That could resolve this audio case since the autosuspend could suspend
> > > runtime after
> > > 2 seconds if there is no further dma transfer but only channel
> > request(device_alloc_chan_resources).
> > > But unfortunately, it cause another issue. As you know, on our
> > > i.mx8qm/qxp, power domain done by scfw (drivers/firmware/imx/scu-pd.c)
> > over mailbox:
> > >  imx_sc_pd_power()->imx_scu_call_rpc()->
> > > imx_scu_ipc_write()->mbox_send_message()
> > > which means have to 'waits for completion', meanwhile, some driver
> > > like tty will call dmaengine interfaces in non-atomic case as below,
> > > 
> > > static int uart_write(struct tty_struct *tty, const unsigned char
> > > *buf, int count) {
> > >    .......
> > > 	    port = uart_port_lock(state, flags);
> > >    ......
> > >         __uart_start(tty);  //call start_tx()->dmaengine_prep_slave_sg...
> > >         uart_port_unlock(port, flags);
> > >         return ret;
> > > }
> > > 
> > > Thus dma runtime resume may happen in that timing window and cause
> > kernel alarm.
> > > I'm not sure whether there are similar limitations on other driver
> > > subsystem. But for me, It looks like the only way to resolve the
> > > contradiction between tty and scu-pd (hardware limitation on
> > > i.mx8qm/qxp) is to give up autosuspend and keep pm_runtime_get_sync
> > only in device_alloc_chan_resources because request channel is a safe
> > non-atomic phase.
> > > Do you have any idea? Thanks in advance.
> > 
> > If you look closely at the driver you used as an example (hidma.c) it looks like
> > there is already something in there, which looks very much like what you need
> > here:
> > 
> > In hidma_issue_pending() the driver tries to get the device to runtime resume.
> > If this doesn't work, maybe due to the power domain code not being able to
> > be called in atomic context, the actual work of waking up the dma hardware
> > and issuing the descriptor is shunted to a tasklet.
> > 
> > If I'm reading this right, this is exactly what you need here to be able to call the
> > dmaengine code from atomic context: try the rpm get and issue immediately
> > when possible, otherwise shunt the work to a non- atomic context where you
> > can deal with the requirements of scu-pd.
> Yes, I can schedule_work to worker to runtime resume edma channel by calling scu-pd.
> But that means all dmaengine interfaces should be taken care, not only issue_pending()
> but also dmaengine_terminate_all()/dmaengine_pause()/dmaengine_resume()/
> dmaengine_tx_status(). Not sure why hidma only take care issue_pending. Maybe
> their user case is just for memcpy/memset so that no further complicate case as ALSA
> or TTY.
> Besides, for autosuspend in cyclic, we have to add pm_runtime_get_sync into interrupt
> handler as qcom/bam_dma.c. but how could resolve the scu-pd's non-atmoic limitation
> in interrupt handler?  

Sure, this all needs some careful analysis on how those functions are
called and what to do about atomic callers, but it should be doable. I
don't see any fundamental issues here.

I don't see why you would ever need to wake the hardware in an
interrupt handler. Surely the hardware is already awake, as it wouldn't
signal an interrupt otherwise. And for the issue with scu-pd you only
care about the state transition of suspended->running. If the hardware
is already running/awake, the runtime pm state handling is nothing more
than bumping a refcount, which is atomic safe. Putting the HW in
suspend is already handled asynchronously in a worker, so this is also
atomic safe.

Regards,
Lucas

