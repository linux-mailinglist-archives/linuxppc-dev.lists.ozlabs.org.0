Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0A876B064
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 12:08:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=j0ab26/L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFW5j3sdZz30fF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 20:08:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=j0ab26/L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFW4q2bcdz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 20:07:38 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67785C0007;
	Tue,  1 Aug 2023 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690884455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWt1iHAsmrfK3BwrkrMdjb6oetsmwYgFvyU2cU/2Gk8=;
	b=j0ab26/LBkhJu/rDBUgxTxpfUHsrUu+mfwFrtSgmX9T5+Pk0LuHAPLV/9JflTk/bXN78Iw
	GxNpsOf5oXmOU1WefL+SDb12OMzJALhot9d8BpXmrOJkwqiKU9u+qM4F6K1E5nj0lBfb7+
	gLCrL+TlVu1b+Du7sMnHz75yki1Sho1tzxFptk2CFoK+gEUyxpzLNZKbZLUIg8VILRvTNC
	jA293aUHVMzqAS7Ih35p4vP9mjBeznj8kVMegn7AU6mm6wBKKsHMvIdoaGgWGc0lnAr6VS
	XUP/Egyc8NGdUCrdAPow0ErAFNIpObFqtVsobYB9grq6Ebj8meCevmKJMnRnDw==
Date: Tue, 1 Aug 2023 12:07:30 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 06/28] net: wan: Add support for QMC HDLC
Message-ID: <20230801120730.64e5b58e@bootlin.com>
In-Reply-To: <80341a96-c40f-4a45-9bad-359a890edfc4@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-7-herve.codina@bootlin.com>
	<80341a96-c40f-4a45-9bad-359a890edfc4@lunn.ch>
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
Cc: alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Aug 2023 11:31:32 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
> > +{
> > +	return (struct qmc_hdlc *)dev_to_hdlc(netdev)->priv;  
> 
> priv is a void *, so you don't need the cast.
> 

Right, I will change in the next iteration.

Regards,
Hervé
