Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE9487B85A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:12:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=W7omPnN9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwJVt6TRXz3cy9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 18:12:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=W7omPnN9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwJV85fC8z3brZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 18:12:12 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0D26FF803;
	Thu, 14 Mar 2024 07:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710400324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H5VEjuuC5AnU2gJMo8TZ6MI2cdvYkDyizNf/LUfFzY0=;
	b=W7omPnN9K0mk9NXpTw72bzIAJRdqYDOB4XIotsYwt1WH+u6qMlbVPLpEEZSwvEg4IDpL+7
	IHFiXNXdg8+0UcUURrxWX5sGoedCEAnUOidpf4on92uFdvTigr6aXeXgl1F/96AULv/dJA
	SYAGlgYzd7fLLdRQ4IwYv/Cy5K2IbS9qyup091Tge8INdmBbq1IlOTsJ4afqPAkfdN95NS
	Y/2x1IN9g1IqaU2FYIop4+XeXeoAVnv9cFViYR2HEHYTsP+lTn1n2x3ZLaWCxvMeLa+G4w
	X3XKQAWsYE/YaiUcD5zq0KbsQdKy26xMnJUIDN/Rn2KmkfoNajoaL+9T4U8FwA==
Date: Thu, 14 Mar 2024 08:12:00 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v7 1/5] net: wan: Add support for QMC HDLC
Message-ID: <20240314081200.5af62fab@bootlin.com>
In-Reply-To: <87ttl93f7i.fsf@mail.lhotse>
References: <20240307113909.227375-1-herve.codina@bootlin.com>
	<20240307113909.227375-2-herve.codina@bootlin.com>
	<87ttl93f7i.fsf@mail.lhotse>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Ratheesh Kannoth <rkannoth@marvell.com>, Yury Norov <yury.norov@gmail.com>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Thu, 14 Mar 2024 10:05:37 +1100
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Hi Herve,
> 
> Herve Codina <herve.codina@bootlin.com> writes:
...
> This breaks when building as a module (eg. ppc32_allmodconfig):
> 
>   In file included from ../include/linux/device/driver.h:21,
>                    from ../include/linux/device.h:32,
>                    from ../include/linux/dma-mapping.h:8,
>                    from ../drivers/net/wan/fsl_qmc_hdlc.c:13:
>   ../drivers/net/wan/fsl_qmc_hdlc.c:405:25: error: ‘qmc_hdlc_driver’ undeclared here (not in a function); did you mean ‘qmc_hdlc_probe’?
>     405 | MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);
>         |                         ^~~~~~~~~~~~~~~
> 
> 
> IIUIC it should be pointing to the table, not the driver, so:
> 
> diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
> index 5fd7ed325f5b..705c3681fb92 100644
> --- a/drivers/net/wan/fsl_qmc_hdlc.c
> +++ b/drivers/net/wan/fsl_qmc_hdlc.c
> @@ -402,7 +402,7 @@ static const struct of_device_id qmc_hdlc_id_table[] = {
>         { .compatible = "fsl,qmc-hdlc" },
>         {} /* sentinel */
>  };
> -MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);
> +MODULE_DEVICE_TABLE(of, qmc_hdlc_id_table);
> 
>  static struct platform_driver qmc_hdlc_driver = {
>         .driver = {
> 
> 
> Which then builds correctly.

My bad, I missed that one.
I fully agree with your modification.

Do you want me to make a patch (copy/paste of your proposed modification)
or do you plan to send the patch on your side ?

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
