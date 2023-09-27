Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA9D7AFBF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 09:25:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=CUxDSg3d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwSnB0hb6z3cDV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 17:25:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=CUxDSg3d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwSmH21HCz30D2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 17:24:29 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1DB71C0005;
	Wed, 27 Sep 2023 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695799465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7lheL/fPD30+qWF6kotkKYQgHBfzDpYHPBkU7rqwKc=;
	b=CUxDSg3duEvh2iFUudjI4nwvl79l+61/0VAmFQSu2LRxhgpcqiWvVArxluGLfvz8i5H50g
	/1E6SCgjLvpCudreDT7YjSUJNoddPGTSsaP4qgW8mWZk1r2YQFIKYrFJ/YEM0vSjcRIouF
	jAG7C/ETkfGIPjGdzUf59swSIoGJQUGcVuuayMkzk8au+5Sk7KAiVV36+GbS/U8eAaBUBo
	Pb/APoI1htl9U6jlR0NLt4TNlSJhGv0qMJmsS+9RrcsdPKtRdRr7gPHjPd+Eba7D0t9cHn
	BMVN9LDMWuIFiKvBLMP4Ihx4uyZvHi66OO4LFFFAfTsgo3N8lhrCfO7XudhEyQ==
Date: Wed, 27 Sep 2023 09:24:18 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 08/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add support for QMC HDLC
Message-ID: <20230927092418.6a5326ce@bootlin.com>
In-Reply-To: <e8ee6529-b194-4588-96c0-1459f214d005@linaro.org>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
	<20230922075913.422435-9-herve.codina@bootlin.com>
	<5efae150-3d92-81b8-5c25-68846d27132e@linaro.org>
	<20230925101703.1bf083f1@bootlin.com>
	<5b804a1a-6bfd-429d-ad84-696b7ecef72d@linaro.org>
	<20230925122758.43963736@bootlin.com>
	<e02ebde7-f208-40a4-bb10-aa5962ee9864@linaro.org>
	<20230925154929.2b6a9cab@bootlin.com>
	<e8ee6529-b194-4588-96c0-1459f214d005@linaro.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Si
 mon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On Tue, 26 Sep 2023 22:59:14 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 25/09/2023 15:50, Herve Codina wrote:
> >>>>> With these details, do you still think I need to change the child (channel)
> >>>>> compatible ?      
> >>>>
> >>>> From OS point of view, you have a driver binding to this child-level
> >>>> compatible. How do you enforce Linux driver binding based on parent
> >>>> compatible? I looked at your next patch and I did not see it.    
> >>>
> >>> We do not need to have the child driver binding based on parent.    
> >>
> >> Exactly, that's what I said.
> >>  
> >>> We have to ensure that the child handles a QMC channel and the parent provides
> >>> a QMC channel.
> >>>
> >>> A QMC controller (parent) has to implement the QMC API (include/soc/fsl/qe/qmc.h)
> >>> and a QMC channel driver (child) has to use the QMC API.    
> >>
> >> How does this solve my concerns? Sorry, I do not understand. Your driver
> >> is a platform driver and binds to the generic compatible. How do you
> >> solve regular compatibility issues (need for quirks) if parent
> >> compatible is not used?
> >>
> >> How does being QMC compliant affects driver binding and
> >> compatibility/quirks?
> >>
> >> We are back to my original question and I don't think you answered to
> >> any of the concerns.  
> > 
> > Well, to be sure that I understand correctly, do you mean that I should
> > provide a compatible for the child (HDLC) with something like this:
> > --- 8< ---
> >   compatible:
> >     items:
> >       - enum:
> >           - fsl,mpc885-qmc-hdlc
> >           - fsl,mpc866-qmc-hdlc
> >       - const: fsl,cpm1-qmc-hdlc
> >       - const: fsl,qmc-hdlc
> > --- 8< ---  
> 
> Yes, more or less, depending on actual compatibility and SoC-family.
> Maybe "fsl,cpm1-qmc-hdlc" item in the middle is not needed.

Ok,
I will keep "fsl,cpm1-qmc-hdlc". The CPM1 is the co-processor present in these
SoCs and it handles the QMC controller. So, it makes sense to have it in this
binding.

I plan to add support for other SoCs in the future and for these SoCs, the
co-processor is not the CPM1. So, it makes sense to keep "fsl,cpm1-qmc-hdlc"
to identify the co-processor.

> 
> > 
> > If so, I didn't do that because a QMC channel consumer (driver matching
> > fsl,qmc-hdlc) doesn't contains any SoC specific part.  
> 
> Just like hundreds of other drivers. :)
> 
> There is a paragraph about specific compatibles here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-schema.html
> 
> 
> > It uses the channel as a communication channel to send/receive HDLC frames
> > to/from this communication channel.
> > All the specific SoC part is handled by the QMC controller (parent) itself and
> > not by any consumer (child).  
> 
> OK, so you guarantee in 100% for this hardware and all future (including
> designs unknown currently), that they will be 100% compatible with
> existing QMC channel consumer (child, matching fsl,qmc-hdlc) driver,
> thus there will be no need for any quirk. Specifically, there will be no
> chances that it would be reasonable to re-use the same driver for child
> (currently fsl,qmc-hdlc) in different parent.

Right,
compatible strings with SoC and co-processor will be added in the next iteration.

Thanks for your feedback.

Best regards,
Hervé

> 
> P.S. If you received this email twice, apologies, I have here troubles
> with internet.
> 
> Best regards,
> Krzysztof
> 
