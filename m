Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE657BF508
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 09:58:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=UAlqB76M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Svf1m23z3cVR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 18:58:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=UAlqB76M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Stn408jz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 18:57:50 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7D45C0017;
	Tue, 10 Oct 2023 07:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696924659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8HGCDW6dA/uAJ0GZAXHKMPSuwZNEP4AsO/ZK/lFHFUk=;
	b=UAlqB76MFympUYcFakSns2mIOgF13pHihMAEYgL1b92u9tsMq8XEVIkpDSc2USgjXn29Dj
	teMJY1lY51yixmRurzbAu6X/It5Prspi6Id1Wa32QHK/EHhiboyV1E/GwksW+XgJBr/BD+
	gMzW3HEboeZULdc0q/po4tOFO145hK5LVo9/hA9YMl3NC5d4IgxP0MpIywwHIVhWpcYl7C
	742U/PmD0Bnm2nlDzGfyngXvb5P5pZawz1yZlpNRIWYKL94NO72XcNjZfdd26znmNKgahB
	ft3/z9/2lF6GWH7GXWiTQEQSVY54kM8V13b7SYnq1pYaTJi9zxGcx8zm4m1HJA==
Date: Tue, 10 Oct 2023 09:57:33 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v7 24/30] net: wan: Add framer framework support
Message-ID: <20231010095733.6899abbb@bootlin.com>
In-Reply-To: <20231006150810.09e2c1a9@kernel.org>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
	<20230928070652.330429-25-herve.codina@bootlin.com>
	<20231006150810.09e2c1a9@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jakub

On Fri, 6 Oct 2023 15:08:10 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 28 Sep 2023 09:06:42 +0200 Herve Codina wrote:
> > +menu "Framer Subsystem"
> > +
> > +config GENERIC_FRAMER
> > +	bool "Framer Core"
> > +	help
> > +	  Generic Framer support.
> > +	  A framer is a component in charge of an E1/T1 line interface.
> > +	  Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> > +	  frames. It also provides information related to the E1/T1 line.
> > +	  Used with HDLC, the network can be reached through the E1/T1 line.
> > +
> > +	  This framework is designed to provide a generic interface for framer
> > +	  devices present in the kernel. This layer will have the generic
> > +	  API by which framer drivers can create framer using the framer
> > +	  framework and framer users can obtain reference to the framer.
> > +	  All the users of this framework should select this config.  
> 
> maybe make the menu a menuconfig with info about framers but hide 
> the GENERIC_FRAMER symbol? The driver 'select' it anyway, what's
> the point of prompting the user..

Yes, I will change in the next iteration.

> 
> > +	if (WARN_ON(!dev))
> > +		return ERR_PTR(-EINVAL);  
> 
> no defensive programming, let the kernel crash

Will be changed.

> 
> > +	ret = framer_pm_runtime_get_sync(framer);
> > +	if (ret < 0 && ret != -EOPNOTSUPP)
> > +		goto err_pm_sync;
> > +
> > +	ret = 0; /* Override possible ret == -EOPNOTSUPP */  
> 
> This looks pointless given that ret is either overwritten or not used
> later on

Indeed. Will be removed in the next iteration.

> 
> > +	mutex_lock(&framer->mutex);
> > +	if (framer->power_count == 0 && framer->ops->power_on) {
> > +		ret = framer->ops->power_on(framer);
> > +		if (ret < 0) {
> > +			dev_err(&framer->dev, "framer poweron failed --> %d\n", ret);
> > +			goto err_pwr_on;
> > +		}
> > +	}
> > +	++framer->power_count;
> > +	mutex_unlock(&framer->mutex);
> > +	return 0;  

Best regards,
Hervé
