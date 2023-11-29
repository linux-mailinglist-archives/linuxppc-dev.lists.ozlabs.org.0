Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6C67FD8E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 15:04:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=FCuX4ljA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=iQKmN7iP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgLfL2fb5z3d8K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 01:04:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=FCuX4ljA;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=iQKmN7iP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgLdW2RnYz3cSS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 01:03:27 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 192FC5C00FC;
	Wed, 29 Nov 2023 09:03:25 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 29 Nov 2023 09:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701266605; x=1701353005; bh=+F
	jPUdugsH0a6dOIOixL2XBuQtlNr6a5HKKtMTHQ7xw=; b=FCuX4ljA+Fy43Ox/m1
	LEsn0v4Y2l3m/XJJ5+6HnJn9taXxejL8TlcURXjeWZ3/eiGjxZp+rG2DLMHkHl0V
	Llo/vlHpkcjy2FaVfWbU0qJjGecrmOVVnVEjZ9i7hHxHQRro1w9LNZ3gsRm2Vo1o
	LYo/aaK/kNN8NfBdomARvkY4DitpsOrQeVLoqoeApBGQ/SATUE6k8OhsLeBQKqla
	TPwP11SKKISZmcbjFag2k0oGhdYLfw92mN/fEnjHlP/0sUSA06DVVlbNcEtmlRgC
	MQEgRv/nYUQhbnaselcbEqTUDI0GxmhKrO5u1c5EMMgFKodxiT26Jev+uV6rk5CF
	umFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701266605; x=1701353005; bh=+FjPUdugsH0a6
	dOIOixL2XBuQtlNr6a5HKKtMTHQ7xw=; b=iQKmN7iPhJjfJU8vroWhG5T1pKfXy
	EyfX8tbbG6ZUPyVxn29FO81ekTG7m1ZYnkoOHut7g8P5Ykcai0mc1fXHQ7CGQbk2
	9CwtyspVoBDxdZwr4vVBASvRnnfpj/WIa+PQRECVeGJod0UAU7GuiXSTL4A3QcMA
	dsYlQMD982d0E+dJH9NqLjosrag8vLv0UAbg2E+Pk3K/QVx+SQ47wLTtzcw9tajF
	V9f4ST9dK+/R24rNGVUynIQaq8NiLlM5poKAMPPGQfN8XJQn7LMoAkU+5LuH01pS
	i1hWstlV+pnbMzvG5vhJGWgdZA04XnqGOWQaXPQoMc9tsqUK5MmMFtIsA==
X-ME-Sender: <xms:q0RnZU5YS_4ZZtdyEsCkc6hRWi4TjI4nOPYI8quoO7AXmjkUYzAcyw>
    <xme:q0RnZV7JSEsTiskQAAQbkacWUgdoPFsxwCdOSQJ4yFeFjBRugIUim6_xm3XXWsMw5
    CKPEpDuanQ9Sn7Xm_U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeihedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:q0RnZTeJ8JD8iQLv97blvKOVQ88-EVdS02dqbxGpsZsXu-zGX0norw>
    <xmx:q0RnZZJCSUdSA-wU1xnKfGswTRBuDckSq5IRfijII3AzF2B5K-s1bw>
    <xmx:q0RnZYJI3GKdztSwOrzY5HqDu9fsM8IukLIUBYDEXuU2U7i8JgQhtQ>
    <xmx:rURnZV58pcd1WFAqj8Y-cSeuC46c6yPk7hW4Qk5Az-QtgJtKe4Y9xQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 39829B6008D; Wed, 29 Nov 2023 09:03:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1234-gac66594aae-fm-20231122.001-gac66594a
MIME-Version: 1.0
Message-Id: <46d0248d-c322-4856-8e9e-6468ac1b7a02@app.fastmail.com>
In-Reply-To: <20231128140818.261541-16-herve.codina@bootlin.com>
References: <20231128140818.261541-1-herve.codina@bootlin.com>
 <20231128140818.261541-16-herve.codina@bootlin.com>
Date: Wed, 29 Nov 2023 15:03:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Herve Codina" <herve.codina@bootlin.com>,
 "Qiang Zhao" <qiang.zhao@nxp.com>, "Leo Li" <leoyang.li@nxp.com>,
 "Jakub Kicinski" <kuba@kernel.org>,
 "Shengjiu Wang" <shengjiu.wang@gmail.com>, "Xiubo Li" <Xiubo.Lee@gmail.com>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Nicolin Chen" <nicoleotsuka@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 15/17] soc: fsl: cpm1: qmc: Handle timeslot entries at channel
 start() and stop()
Content-Type: text/plain
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 28, 2023, at 15:08, Herve Codina wrote:
> @@ -272,6 +274,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct 
> qmc_chan_info *info)
>  	if (ret)
>  		return ret;
> 
> +	spin_lock_irqsave(&chan->ts_lock, flags);
> +
>  	info->mode = chan->mode;
>  	info->rx_fs_rate = tsa_info.rx_fs_rate;
>  	info->rx_bit_rate = tsa_info.rx_bit_rate;
> @@ -280,6 +284,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct 
> qmc_chan_info *info)
>  	info->tx_bit_rate = tsa_info.tx_bit_rate;
>  	info->nb_rx_ts = hweight64(chan->rx_ts_mask);
> 
> +	spin_unlock_irqrestore(&chan->ts_lock, flags);
> +
>  	return 0;
>  }

I would normally use spin_lock_irq() instead of spin_lock_irqsave()
in functions that are only called outside of atomic context.

> +static int qmc_chan_start_rx(struct qmc_chan *chan);
> +
>  int qmc_chan_stop(struct qmc_chan *chan, int direction)
>  {
... 
> -static void qmc_chan_start_rx(struct qmc_chan *chan)
> +static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan);
> +
> +static int qmc_chan_start_rx(struct qmc_chan *chan)
>  {

Can you reorder the static functions in a way that avoids the
forward declarations?

     Arnd
