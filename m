Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3622987BFCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 16:22:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xkazfv+g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwWMQ71zYz3vbM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 02:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xkazfv+g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwWLd1LyVz3dXX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 02:21:27 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e6aa5c5a6fso1215774b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710429684; x=1711034484; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7sWNt577aBHDyddBZ3kkUFNs3z9eJyKWD9qgLbpckE=;
        b=Xkazfv+gBGeTB/Mwf50SofqoFixymmm7531atvw4Hrgwsn6TdNQmjZZ5p7WRCkXNzO
         M+2EkuGOrUi1CmRaudp41egHzekXOQ2DePeL034Np2Jngli/+vZoJ9duF41yIW1DCD+v
         Wox7GYXTJlWzo/9SDw81MpyjDRe7NM8l+kCu0IQhAZ2q2vXzaI889PbdPwto8+TBYKKJ
         sDGZFmaOyBQvUT+/6UK8ucRfSxsR+XRUOmiYmlAXAsChWYh/lowF3rmPB8olJzZQAw4E
         P0rhOWkOYcGjLN3aETUPAtOpDQWYacfkjK8IXf/5O3H1zQ6L9NTW3IXopaQciOVXff0F
         BZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429684; x=1711034484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7sWNt577aBHDyddBZ3kkUFNs3z9eJyKWD9qgLbpckE=;
        b=QpULxQ6A3dauzGtVrykdBaGVK/4OZJRxhSBs3KHxWaHLpIKuucqXM8TwB3qeN2Opd8
         sGICsr5AhLGrNO/IIMxkDlPATEc7DZInNuAX8ZH6gF+EDmOsQQghDACIJSg41xWhuc/4
         dLjdEnum6XlFLjhOGbkoGOwgfZa/XY92Rd0u/Ab/fOLstW2gyx+d0nxTlpZcA97vXC4n
         WSmi6nRJGH/UhAuxuf13+Kv5lCPmhyUAPeb5JQTKbLuqBxZYA4Ee3jJrqt1Bk1bnUC7O
         MXTgMkX1BvkIpYb/lHA5BQwdchTMSENMYU1sqWuM2pOqew3YgBmNy54W1ymeTAAgKlwR
         OoUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Zxd/00vlZDUfNugXo1MY52YXXXkjiqAasqiHayIYyMajctZv3XLPQwCVtj5MGWvJjcrM9Yqj8VXK9YibTEOOBXppFkr2IriL8psqmA==
X-Gm-Message-State: AOJu0Yxb2nVd0QFdy/Mse7aX26MlCvSc8nl+AuZo3T9qYuRoJAaygRjd
	ZfEI7ft6qm28FHtfrv+/ckjHcn89QDwe2ilLDCOrX1C1RBHw4Mb9
X-Google-Smtp-Source: AGHT+IE976LiIs3J+wZRKHFMiWO2GPc/z1HYI5pokfTUW/WlvRcrsBtERWAE0daVU3yJUtEiJynjHA==
X-Received: by 2002:a05:6a00:2312:b0:6e5:eab8:4db8 with SMTP id h18-20020a056a00231200b006e5eab84db8mr2351181pfh.17.1710429684285;
        Thu, 14 Mar 2024 08:21:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y1-20020aa793c1000000b006e6795932a4sm1618767pff.80.2024.03.14.08.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:21:23 -0700 (PDT)
Date: Thu, 14 Mar 2024 08:21:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v9 07/27] net: wan: Add support for QMC HDLC
Message-ID: <bd7b7714-1e73-444a-a175-675039d4f6e4@roeck-us.net>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
 <20231115144007.478111-8-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115144007.478111-8-herve.codina@bootlin.com>
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

On Wed, Nov 15, 2023 at 03:39:43PM +0100, Herve Codina wrote:
> The QMC HDLC driver provides support for HDLC using the QMC (QUICC
> Multichannel Controller) to transfer the HDLC data.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> ---
[ ... ]

> +
> +static const struct of_device_id qmc_hdlc_id_table[] = {
> +	{ .compatible = "fsl,qmc-hdlc" },
> +	{} /* sentinel */
> +};
> +MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);

I am a bit puzzled. How does this even compile ?

Building powerpc:ppc32_allmodconfig ... failed
--------------
Error log:
In file included from include/linux/device/driver.h:21,
                 from include/linux/device.h:32,
                 from include/linux/dma-mapping.h:8,
                 from drivers/net/wan/fsl_qmc_hdlc.c:14:
drivers/net/wan/fsl_qmc_hdlc.c:783:25: error: 'qmc_hdlc_driver' undeclared here (not in a function); did you mean 'qmc_hdlc_probe'?
  783 | MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);

Guenter

> +
> +static struct platform_driver qmc_hdlc_driver = {
> +	.driver = {
> +		.name = "fsl-qmc-hdlc",
> +		.of_match_table = qmc_hdlc_id_table,
> +	},
> +	.probe = qmc_hdlc_probe,
> +	.remove = qmc_hdlc_remove,
> +};
> +module_platform_driver(qmc_hdlc_driver);
> +
> +MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
> +MODULE_DESCRIPTION("QMC HDLC driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.41.0
> 
