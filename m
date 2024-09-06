Return-Path: <linuxppc-dev+bounces-1129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D50C396F6FF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 16:36:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0f1j1nCxz2ywR;
	Sat,  7 Sep 2024 00:36:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725633401;
	cv=none; b=Evw7LraIMM2J3YzWyag9Fm5yyQlEU0a/auBCYF22198TZR1VBgjfElYHGAfJLLxfC9x3lNNMCgLeDT+q4FkyqxyXSleCfGVyQHhzlmzseM1RJv10Y/AlGPIH6Yzjv0E8lyXcy+/oCZV7i4U1kV8bW14soTw+/yXasmOeR4T7DJaaD0YJcRj/FT7JMEB1WY/mz9AktaF4GgPT3hnfWTptVAxSoGcDCaM3vfFgMxSY0UqtthEQkx5lwzEydwizrhbCyFOBmjuk+aMNJXUDnP5dhqbnpBvN/ANtK7X5u99/LLMYg7TBHgQzRW+05iQRuG6uXkwuXXWUL5AVkSaYYXL5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725633401; c=relaxed/relaxed;
	bh=XqDf1IFSPRmnkLeOOfhEN8R37Qr25b+7q7Psmj+CwGs=;
	h=From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type; b=hxrx2zKnQnw1QJvLQcUwalNFpBqaOvELkuWS0XSyRyuG5PAnRvtpnfgTBgwQ9f65NtFMr8vHHoLKUFoLcWjCQFj9gC2HyM/eewx8hjz74m4h8UrJR1pg5XGyICz+zzSX996VTl0jWeIqCnPSHqmzXm9+1V3Rck5LlD9OWYLaW2xo0HuSV2oqdW8WbXfnlFEO1Xaab1cRuAKuvzzX24GL6sudAle7Z5m2ljkxJhndDjr6NeSMdCMEy+ZNGumf+OwUOzbNwPoHf9ytacXFI2UUP4SAUcOl3Xqa37+E+hf+CP6HDKl6aRgRwTI0LeRfiR92yk9VvVDBcdUnVmDIrLOA1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Ro3NCSWs; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CXht1XFP; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Ro3NCSWs;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CXht1XFP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0f1h25fnz2ydR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 00:36:40 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725633390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqDf1IFSPRmnkLeOOfhEN8R37Qr25b+7q7Psmj+CwGs=;
	b=Ro3NCSWstn0jOxZcaRvYcg3L1VjimheJTVlYRpu+pc35F2wAleirXJvFX1XRCEVaWtexjH
	HsilswSBvDFMSfniuHepAkMlKP6+oCtt65o9fTHnQ0QV6bTBSmPrx4GR4JU7OGrYNdjY0v
	yN1xybwLEjqDqBdlX/wv0tyvd9FZnt4fEEYtgX6wOi+uO0jffhf1oremGkKk/Eptt8sWtv
	dvUnnQUn0XUkkwfFOgFCnB7Pe23NRr+kXCNPYuNxuCdPj9JyTCkgaFXb07tDvxQTbPIvgv
	3Rb93VyOK9xl4y0pVE9krunDg+Me8U4Dx4mflWFbg5qzpGH22fOmk1jae9jAyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725633390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqDf1IFSPRmnkLeOOfhEN8R37Qr25b+7q7Psmj+CwGs=;
	b=CXht1XFPbcJsT6gCiTVJ3lnKlbCr7Kq+A4vcTy4KxP5X2zZrR00B+mIC9apOTF6PNbVS6X
	JC3lEIVhq3N4Y/CA==
To: Ma Ke <make24@iscas.ac.cn>, jochen@scram.de, andi.shyti@kernel.org,
 grant.likely@linaro.org, thierry.reding@gmail.com, rob.herring@calxeda.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ma Ke <make24@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH] of/irq: handle irq_of_parse_and_map() errors
In-Reply-To: <20240830142127.3446406-1-make24@iscas.ac.cn>
References: <20240830142127.3446406-1-make24@iscas.ac.cn>
Date: Fri, 06 Sep 2024 16:36:30 +0200
Message-ID: <87bk10etn5.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 30 2024 at 22:21, Ma Ke wrote:
> Zero and negative number is not a valid IRQ for in-kernel code and the
> irq_of_parse_and_map() function returns zero on error.  So this check for
> valid IRQs should only accept values > 0.

The subsystem prefix is wrong. This changes drivers/i2c/busses/i2c-cpm.c
and has nothing to do with of/irq. Sure, the problem has been caused
by the commit below, but that's a different thing.

> Cc: stable@vger.kernel.org
> Fixes: f7578496a671 ("of/irq: Use irq_of_parse_and_map()")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/i2c/busses/i2c-cpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> index 4794ec066eb0..41e3c95c0ef7 100644
> --- a/drivers/i2c/busses/i2c-cpm.c
> +++ b/drivers/i2c/busses/i2c-cpm.c
> @@ -435,7 +435,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
>  	init_waitqueue_head(&cpm->i2c_wait);
>  
>  	cpm->irq = irq_of_parse_and_map(ofdev->dev.of_node, 0);
> -	if (!cpm->irq)
> +	if (cpm->irq <= 0)
>  		return -EINVAL;

The function _cannot return a negative number:

extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);

So what is this actually fixing?

Thanks,

        tglx

