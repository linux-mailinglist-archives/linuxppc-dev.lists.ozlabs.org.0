Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5C5911281
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 21:48:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=snFugIF/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4rcv3xwFz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 05:47:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=snFugIF/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4rc91xvsz3cSq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 05:47:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FC5062190;
	Thu, 20 Jun 2024 19:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD0CC2BD10;
	Thu, 20 Jun 2024 19:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718912838;
	bh=D+e2m26VHYUG/Lo1gKaeNxI1GFfU9WexaAsiXpn5YYI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=snFugIF/AqgJy+pEn7auwBHqcgy7Pe3AUcf+drxFEmAqZGIg4UnWBdqoK6m6CwAsz
	 EkiwhgZjP3d7GOm7e8ou0XhSc1T7L3lMeaa/T1AEIXbfpSX2iywkxq4avE0e0+m91t
	 dLOvf7FI8ULn1u+pmBL4hCtE4SXPle6UjAxOchsCgdgfWHkHmUV9bzREB8NNPkOJPP
	 5LWC2Wixht1KdskG7sSDxZfktWP8GWsK507Mj2+LEuf+K4sBHxeRyzFxXz2SDbZ0t9
	 K6+mi92KIySVFO89b+DEvfdkNsCh+2E7uNs9B8beQA9nGHp8USIGgcbWKanPLsl5s8
	 j+fvNo+PZMXHQ==
Date: Thu, 20 Jun 2024 13:47:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
In-Reply-To: <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
Message-Id: <171891283706.3289677.3213379285370562671.robh@kernel.org>
Subject: Re: [Patch v4 02/10] dt-bindings: dma: Add lpc32xx DMA mux binding
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
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Li Zetao <lizetao1@huawei.com>, Jaroslav Kysela <perex@perex.cz>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org, Russell King <linux@armlinux.org.uk>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 20 Jun 2024 19:56:33 +0200, Piotr Wojtaszczyk wrote:
> LPC32XX SoCs use pl080 dma controller which have few request signals
> multiplexed between peripherals. This binding describes how devices can
> use the multiplexed request signals.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v4:
> - This patch is new in v4
> 
>  .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  9 +++
>  2 files changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.example.dtb: /example-0/syscon@40004000: failed to match any schema with compatible: ['nxp,lpc3220-creg', 'syscon', 'simple-mfd']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240620175657.358273-3-piotr.wojtaszczyk@timesys.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

