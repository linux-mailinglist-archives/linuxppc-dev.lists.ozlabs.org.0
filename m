Return-Path: <linuxppc-dev+bounces-3447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F59D3915
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 12:05:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtdnS73PXz2y8W;
	Wed, 20 Nov 2024 22:05:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::222"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732100732;
	cv=none; b=k2psxirBfCuN5WabhllPMZRT4A8ZxRkNiFeb8uA+D5izSz8+pMAkAOf0xs1WVK2ex+9XXZENKlv+F3bcxmhAN6uUqCYRusMZMtcWUBIZuFoxJ/PdMvgFNJCMnkXZMnURVX1wBXd9PsO0UJNBFdwICnOthKxpz2+qLnTt2GA7+8hJuEoKHPZpFtfwGaHjLd0+RoES9XGSKWSou90MMoG5nSq/ATTOi7dhbC5efidM+5a1ldLDEWqQZBhAkvhxreQuk/GYftY8O7VK+7izYo/vMQPz7+ju9BuP3DBPfGaCuMx0LLALQ3F7lYrrOq30oRG7P8V5E1nGWa2mjJQb1hKj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732100732; c=relaxed/relaxed;
	bh=WHuBRMLIL29GAZ5LZO3x3+zO6QGTv1rbdszqFlYCwMw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J354iicN/YncWfXqdAHDs1byQ+OE8fMlqzwSkxz3tKJsd5qVnN7lKAlT0NN1jqhY6zF8wtOVUuE5rx44rzRDT/N+ivnAPfZcOPCdkV9/P0ntnl2Qw3DzUV36irtdqeh33iRUSUepVTlTgSHTyvw0J0SR9noqXNOLeU1Ee8I03oYmEWxlUeA2Y0XLxjl2tSm5VaHh+3snRn7X2tsWh9NNg2X4/zV6FU7kNjcFnRHl38muFduS5nHa6rqfXcftANpnHNow7JqGoczV7pf4CK/3AftJ8SrGfkaSl7+nkZ3/tPVkvrV9W14SvbNszaUZCTmkwtdvo1ELl7XKVTKmVtrtOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=S0MgJUCW; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=S0MgJUCW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtdnN15F3z2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 22:05:22 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75BCD40004;
	Wed, 20 Nov 2024 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732100709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WHuBRMLIL29GAZ5LZO3x3+zO6QGTv1rbdszqFlYCwMw=;
	b=S0MgJUCWK/hcEdorN+Ily5SoZbyEWyWj+oErjdHBG8ap9hv9H0fe6+A4QCEjVFwA8haEnB
	C9et6y7PU2jtkrQ4DPutuCVYwdmGoeyJ87eO4gEGivzVzdhGNBL+QwusqPO10pBJqTK3MW
	6/0ePlZAV1aVusLl0qQVHHIUdNBF0OS+Eadm2tzsIfeuIky6jlhBTYMvRf0jTYbaaG0XMt
	AHje/ZS2DFjVMT0aT7ViqJKwotLV6YJxiG5kl9ggWU2Wsmk+vhK/v/2HAjvmTWvsn0Os59
	phsx0GsOJYe74r1KoDnsl6nR+IXOY4vecAqKUFds2OwXpO9j5MQlTNjkbn5KHw==
Date: Wed, 20 Nov 2024 12:05:06 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: qiang.zhao@nxp.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dan.carpenter@linaro.org, xiaopeitux@foxmail.com
Subject: Re: [PATCH] soc: fsl: cpm1: qmc: Fix qmc_probe() warn missing error
 code ret
Message-ID: <20241120120506.077d3388@bootlin.com>
In-Reply-To: <82d8c18da160b9e0a73c5c5e2eb25ad2831cc6f9.1732095360.git.xiaopei01@kylinos.cn>
References: <bac2dc94-1bf3-4dcf-b776-cd78ef992d28@suswa.mountain>
	<82d8c18da160b9e0a73c5c5e2eb25ad2831cc6f9.1732095360.git.xiaopei01@kylinos.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Pei,

On Wed, 20 Nov 2024 17:38:20 +0800
Pei Xiao <xiaopei01@kylinos.cn> wrote:

> platform_get_irq() may failed,but ret still equals to 0,
> will cacuse qmc_probe() return 0 but fail.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202411051350.KNy6ZIWA-lkp@intel.com/
> Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/soc/fsl/qe/qmc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 19cc581b06d0..a78768cd6007 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -2004,8 +2004,10 @@ static int qmc_probe(struct platform_device *pdev)
>  
>  	/* Set the irq handler */
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> +	if (irq < 0) {
> +		ret = -EINVAL;
>  		goto err_exit_xcc;
> +	}
>  	ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
>  	if (ret < 0)
>  		goto err_exit_xcc;

I already send a fix:
https://lore.kernel.org/all/20241105145623.401528-1-herve.codina@bootlin.com/

And it is available in the following PR done by Christophe:
https://lore.kernel.org/all/c3c4961b-fe2a-4fcc-a7a1-f8b5352e09a2@csgroup.eu/

Best regards,
Hervé

