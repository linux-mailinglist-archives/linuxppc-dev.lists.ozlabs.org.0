Return-Path: <linuxppc-dev+bounces-6139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF5A33000
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 20:44:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtTKt6WVSz30Vy;
	Thu, 13 Feb 2025 06:44:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739389490;
	cv=none; b=X3vFs/KzKi6fGAoapvlL+TBTU+N8zAyGdl1sdGYDc3TIhFRCKkqcvHxikCoht5Lu3nxtlo8ehu3AEBhIGFonn08XTzJcu8CQBFVcCaapA7gvBnRC5G/S67wpZ5h7Hz3+ERAfQaKnunkckzsE+Qmxcpt4na3n2VZlPKWONw1/J/JTd786gRu63AH6Fu6jlvWeDeCEM/UCVZe6PVbLCQSwQCmJNapSsGo58YwKaxL0nIIW5XCVwJ+3E1HCcLoKiwPIpZbWldMG9ppFl8av6j6QeSsnXcB5jc7gAZtCf+jQiBd83YATTkc6PJgAQVEre9BwJuHG02jQpOPkx9bJCGU2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739389490; c=relaxed/relaxed;
	bh=83/Mgh6UZ9LltSajtzxUEMRb7ehXx9tIQoYSPxwJYCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Olo6GWRvfHOgbC5US3J6LMC5cgj6CAHAIMDFviNSmm2KFnEfx4ndy0w8ETSaYtKZl3r+r64VGqTj1E6nNbWeAjzZYYlSb6FFu5r8NLqUAMMKFjxFwFq0/18FnSNL3RQugo6o5zLhhYqECJ8d5o/bq7xphuYlpJsI+4RJA5gat2FtpwHZ6JfACuuopUC+0DPV3EIW8krD3UtaJg9SFb81XWHo9wbuMsUcT8Su3+A6HNMyDHvLrtWK6zSZ+3MOcrkP/pGrtf3yF1zm/ZndYQ5/X7vgg98NjSVB3JP14YtkSk4MB+7Zu30PrF9zUm3DY5RPTTgZKk8KUIIYBZDBPNIoqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Oj8s8rQe; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Oj8s8rQe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtTKt2F0Jz30VJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 06:44:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E4B5DA419C9;
	Wed, 12 Feb 2025 19:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F4DC4CEDF;
	Wed, 12 Feb 2025 19:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739389488;
	bh=H2RGuJeh4p3PZLsKQKPNVcfG0Duy/0Y8WKyJ2Dp59WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oj8s8rQeyXI3HiYI0OHJHEumwjJXAFZetGXjJbiY2MBZzopmcHcKUK4kieSry0099
	 qNx36t4mGK0OktWld9GOqZAbfj+DEYDz5hjoqokREJb1aTsdxd+D0cVUSAKj2jXwkb
	 3Ikh8NfPF3xHwGEocZ2HwUUIauob/u7P6UYBy23gs43d4HX61Yu4L6kDfSazoHUPX9
	 dknlKOu2PHYVpYSotcaWJoEHB3rHjT04kQpWWayQrdoJJH64ADn0YGdfCxkDeRfeU/
	 NPBkKJBcXimLXoqBff+yziV//iNuFWxTlue95EVOH+6rBchwDwEvGyXEivB6zAwq2j
	 5BkKP+eNC7jZg==
Date: Wed, 12 Feb 2025 13:44:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Guenter Roeck <linux@roeck-us.net>, linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org, Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, imx@lists.linux.dev,
	linux-ide@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	dmaengine@vger.kernel.org, Scott Wood <oss@buserror.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Niklas Cassel <cassel@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Richard Weinberger <richard@nod.at>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v2 10/12] dt-bindings: memory-controllers: Add
 fsl,elbc-gpcm-uio
Message-ID: <173938948613.128569.16012047906715128997.robh@kernel.org>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-10-8137b0c42526@posteo.net>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207-ppcyaml-v2-10-8137b0c42526@posteo.net>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Fri, 07 Feb 2025 22:30:27 +0100, J. Neuschäfer wrote:
> Formalize the binding already supported by the uio_fsl_elbc_gpcm.c
> driver.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V2:
> - split out from fsl,elbc patch
> - add description
> - remove "device_type" property
> - move to bindings/memory-controllers
> ---
>  .../memory-controllers/fsl,elbc-gpcm-uio.yaml      | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


