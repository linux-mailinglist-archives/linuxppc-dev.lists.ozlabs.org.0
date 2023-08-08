Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC4D773922
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:45:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QZBb0EFg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKmx16nzcz30RV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:45:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QZBb0EFg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKmw339Pgz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:44:48 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDBB0C0011;
	Tue,  8 Aug 2023 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691484284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nUiw4hJK7/Sk678dMlTFdsFNk9UZV8JT6mDURM0k34=;
	b=QZBb0EFgqssUT+yAxk29eDTjBMqFKHe4zPB1Smvyc+r9fR/tpmYpbax2btHCBtrJ0JveOQ
	SLfeDDBlE9c33fmD8j8hb0+2e4T0kQOwo4HkFuefiM4/FTN3Qixx+U9a0Lr46Zpybcvhk/
	pzfqXkJVEK6u6AuwEp9In8Fri7fCoasFyYBjwMbGHW2x81o0rcjV7vfIV/7OGspbkZCXS2
	UrlV5ZcAPgDJe2OMs4EUsIvewgY6Zd2BHitCnMItMwzgzOZ5eNl6yKxTIuUZMuMRIDLoYX
	ZPFdIRfr4+fIGi+NiAyTBb1Q6Kip8TN6o7JB9xQlS463pwiOEXmyVfbepPKRoA==
Date: Tue, 8 Aug 2023 10:44:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 22/28] mfd: core: Ensure disabled devices are skiped
 without aborting
Message-ID: <20230808104439.6265cd01@bootlin.com>
In-Reply-To: <651ad095-8753-762e-d3f0-aec74c5794c2@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-23-herve.codina@bootlin.com>
	<651ad095-8753-762e-d3f0-aec74c5794c2@csgroup.eu>
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
Cc: Andrew Lunn <andrew@lunn.ch>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org
 >, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Aug 2023 08:13:27 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 26/07/2023 à 17:02, Herve Codina a écrit :
> > The loop searching for a matching device based on its compatible
> > string is aborted when a matching disabled device is found.
> > This abort avoid to add devices as soon as one disabled device
> > is found.  
> 
> s/avoid/prevents/

Yes, will be changed.

> 
> > 
> > Continue searching for an other device instead of aborting on the
> > first disabled one fixes the issue.
> > 
> > Fixes: 22380b65dc70 ("mfd: mfd-core: Ensure disabled devices are ignored without error")
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 

