Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BC80060E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 09:42:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=J7QCZVt+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShRQ56SKDz3dH4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 19:42:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=J7QCZVt+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShRP525yTz3dBb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 19:41:27 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94FC0FF803;
	Fri,  1 Dec 2023 08:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701420080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3amwn1NJ1mTvbaM/76zfWCSHxT3BcZtBq0Slk1BBD5E=;
	b=J7QCZVt+qjfwtn4lkc+mRKNeWj9I7dyMQkTqCg6x3AxFrGxn6riCQlAAga7XqY3H0z4dvu
	ci6RBDDq+M64+xHcIAs+E/WwFUr1GUd8Qxu/bemppUt4V/OsVaPTk0/hdKzS/zo+6W2pnC
	27mFsOf9kA8DYdEMd4Dc93UdyLYS+PBJKdMVWFceH4fBUGeZSjQu5k9kTiHCgZXnqJqgrd
	UrXofxxypUS8Cc8+DrGRBiQ9mSKLll4xZvTwLqG4qChEGQvL5xAWBn5ntVeSWnutUArT0v
	aO4tKPgmuoj8ar/84F+YLKMMChuXD7iPKna1YgaZglNaMO8yzRZGvrUA0m169w==
Date: Fri, 1 Dec 2023 09:41:16 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH 15/17] soc: fsl: cpm1: qmc: Handle timeslot entries at
 channel start() and stop()
Message-ID: <20231201094116.65956f60@bootlin.com>
In-Reply-To: <46d0248d-c322-4856-8e9e-6468ac1b7a02@app.fastmail.com>
References: <20231128140818.261541-1-herve.codina@bootlin.com>
	<20231128140818.261541-16-herve.codina@bootlin.com>
	<46d0248d-c322-4856-8e9e-6468ac1b7a02@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Leo Li <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub
 Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Wed, 29 Nov 2023 15:03:02 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Nov 28, 2023, at 15:08, Herve Codina wrote:
> > @@ -272,6 +274,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct 
> > qmc_chan_info *info)
> >  	if (ret)
> >  		return ret;
> > 
> > +	spin_lock_irqsave(&chan->ts_lock, flags);
> > +
> >  	info->mode = chan->mode;
> >  	info->rx_fs_rate = tsa_info.rx_fs_rate;
> >  	info->rx_bit_rate = tsa_info.rx_bit_rate;
> > @@ -280,6 +284,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct 
> > qmc_chan_info *info)
> >  	info->tx_bit_rate = tsa_info.tx_bit_rate;
> >  	info->nb_rx_ts = hweight64(chan->rx_ts_mask);
> > 
> > +	spin_unlock_irqrestore(&chan->ts_lock, flags);
> > +
> >  	return 0;
> >  }  
> 
> I would normally use spin_lock_irq() instead of spin_lock_irqsave()
> in functions that are only called outside of atomic context.

I would prefer to keep spin_lock_irqsave() here.
This function is part of the API and so, its quite difficult to ensure
that all calls (current and future) will be done outside of an atomic
context.

> 
> > +static int qmc_chan_start_rx(struct qmc_chan *chan);
> > +
> >  int qmc_chan_stop(struct qmc_chan *chan, int direction)
> >  {  
> ... 
> > -static void qmc_chan_start_rx(struct qmc_chan *chan)
> > +static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan);
> > +
> > +static int qmc_chan_start_rx(struct qmc_chan *chan)
> >  {  
> 
> Can you reorder the static functions in a way that avoids the
> forward declarations?

Yes, sure.
I will do that in the next iteration.

Thanks for the review,

Best regards,
Hervé
