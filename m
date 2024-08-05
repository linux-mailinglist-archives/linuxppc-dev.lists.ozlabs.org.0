Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3067B947588
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 08:44:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=IXLmoly7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wcn3V10DPz3cYr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 16:44:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=IXLmoly7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wcn2q180fz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2024 16:43:43 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFDDC1C0002;
	Mon,  5 Aug 2024 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722840218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s6fMI2V+iIFbdGWfpib0kcCfB4Ujnw6ekS2SGu24ZM8=;
	b=IXLmoly7c+mkZ12TUUfRtD0urpAI6pYYj6CpO3u/i0qOFDFoRxuqZ0HC1OjG7eH85J9rTo
	x0d0IAx+cNPoQhJ6Xr60DHpi6DNheT0MYKzydw30FNz1JF1C4ukhseAtn+cnJpIT+pTqwu
	e/tvCO6s8fohLAxRwb4JaCP83KjGXCI5tAGwN/aYP8Ur+1Rcu73wDaX1I2xRI73LOiYlwP
	1snstTXoGK6K9zVE9UmDw8UELLwGpUmAlwh+qx58+ovo6AVfq20bqeRoPWyuwfg0ExluoI
	DD7qWBxzZgHtKOtnvZU3/ASkSEvjgFG1aEhBxaqNgAKRtb4STCjEwkHpS85sKg==
Date: Mon, 5 Aug 2024 08:43:36 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 23/36] dt-bindings: soc: fsl: cpm_qe: Add QUICC
 Engine (QE) QMC controller
Message-ID: <20240805084336.4e711102@bootlin.com>
In-Reply-To: <20240730193635.GA2017245-robh@kernel.org>
References: <20240729142107.104574-1-herve.codina@bootlin.com>
	<20240729142107.104574-24-herve.codina@bootlin.com>
	<20240730193635.GA2017245-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Tue, 30 Jul 2024 13:36:35 -0600
Rob Herring <robh@kernel.org> wrote:

...
> > +
> > +patternProperties:
> > +  '^channel@([0-9]|[1-5][0-9]|6[0-3])$':  
> 
> Unit-addresses are typically in hex.

I thought it was more related to the reg value.
In our case, the reg value is just the channel number from 0 to 63.

Should I change to a hex format?

...
> > +
> > +      compatible:  
> 
> compatible goes first in the list.

Yes, I will move it to the first position in the next iteration.

> 
> > +        items:
> > +          - enum:
> > +              - fsl,mpc8321-ucc-qmc-hdlc
> > +          - const: fsl,qe-ucc-qmc-hdlc
> > +          - const: fsl,qmc-hdlc  
> 
> Really need 3 compatibles?
> 

The QMC is handled by the QUICC Engine (QE) companion. The QE can be available
in several SOCs.

The first one is the exact device (SOC MPC8321 + UCC QMC)
The second one references the QUICC Engine family instead of the SOC.
The last one is the fallback one just referencing the QMC. This one matches
all QMCs whatever the SOC and the companion.

On QMC handled by the CPM1 companion, we have these tree compatibles:
 - fsl,mpc885-scc-qmc-hdlc or fsl,mpc866-scc-qmc-hdlc
 - fsl,cpm1-scc-qmc-hdlc
 - fsl,qmc-hdlc

IMHO, I think it makes sense to have the 3 compatibles.

Best regards,
Hervé
