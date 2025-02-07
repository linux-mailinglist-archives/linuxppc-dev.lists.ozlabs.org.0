Return-Path: <linuxppc-dev+bounces-5970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D727DA2D1AA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 00:45:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqVvP3T6Wz2yZN;
	Sat,  8 Feb 2025 10:45:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738971905;
	cv=none; b=bLF81+KS0jMf9rV2A/xbznDrW5auElwYbHwL3AB4EId6PIESzFYnPj0fqjEzQBmtvymoj8cddunv7zaqomTHfxvS1lnzIhj+x2bm9gfoO1+SnfJYDlXkAd4t/xR9RKKg8154d1rm7x5aaZ/876miduDEbKuogVrKC5OSWDlrLXd8jST7p1ylvGzhLJJk9fqqXeFoit1kiVkwOlw7jQ3yaXvcaVxIeIITyn63M0W9iYeRKx9LLnfI3FZRxY2HxFvyHvppZK4wdvoReM4FX9dBBRLOfo1b8EAitx4XmlXYJ34nKZ9KJatNBSgrOHolPk/wIhEwo/szal+Q34/pAE+mug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738971905; c=relaxed/relaxed;
	bh=L0B3pU+1GYJV5GzZcklj9d1it+o9vFdza7lSgi60ClE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=JhzK5AEHjr1qwog6JfrblA4JWT1lpZOO1+xSzXgObxOHaGyLIfqsg/JysJ4ykiFY9OuMOT9wch+fbsy4LpORDdGVEIe3+sH+qgO/R3HkRVFCs2ABB0I64dPcoh/Czumd9Yj4OEj2iHET9us0+oD4ev8aKiYkwwKiL9MiGV9gtELpOo4oYzKONWqtBZBKAcYZUQl7u11JpB7sykPqGAwKXiXvL/t6fedCZh8BI8IJtfE5aD8YK4svpo3POIT1qEtQmI9rF4l5i/URbvGgvu8A9c15BL/WTSttEG2elGph/kvAPQOnT9itfibc2DyEDmQupwaGVd0okezS4COtDVsrmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G8ojqiQ5; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G8ojqiQ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqVvN11vjz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 10:45:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 795EB5C6F70;
	Fri,  7 Feb 2025 23:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BB2C4CEE7;
	Fri,  7 Feb 2025 23:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738971902;
	bh=tBmrobeWDK6+aWiDeO0VVX8TfLiyt8/pAlurKL5A7RE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=G8ojqiQ5opUcLh9s5PIYTf2xPkT83yWsGUUHMXZl5lHvU6Mn89nnfv1wXOW49TcSk
	 35SMUuUZOOgoJLT1UHJm98Nw4GgaIdcRaplBWxiW/VtIYdY+P/3lZT6Jz1vLQF/gwj
	 svxuttRP4HEgFQyLjnmsLgdlQ5bdZOjF91Twr0GobeyOz0U6GD0yldmMLdu7tdpkor
	 CpqoqihaNPN8X+975ECarsF0RKSWGwgPsmlC82hEz5wGp7SdFyUWd36Ps+rMzrTvTC
	 qmr/9q3CQmDhFTduB9v0s+gIIMBo+p73n2Liv87lB/04iL03xko1aXY72hB7noSMrT
	 AodCA/oLktTDA==
Date: Fri, 07 Feb 2025 17:45:00 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Guenter Roeck <linux@roeck-us.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Richard Weinberger <richard@nod.at>, Lee Jones <lee@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, linux-pci@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, imx@lists.linux.dev, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Scott Wood <oss@buserror.net>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Damien Le Moal <dlemoal@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Niklas Cassel <cassel@kernel.org>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250207-ppcyaml-v2-11-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-11-8137b0c42526@posteo.net>
Message-Id: <173897189774.2630698.330205726613217230.robh@kernel.org>
Subject: Re: [PATCH v2 11/12] dt-bindings: nand: Add fsl,elbc-fcm-nand
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Fri, 07 Feb 2025 22:30:28 +0100, J. Neuschäfer wrote:
> Formalize the binding already supported by the fsl_elbc_nand.c driver
> and used in several device trees in arch/powerpc/boot/dts/.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V2:
> - split out from fsl,elbc binding patch
> - constrain #address-cells and #size-cells
> - add a general description
> - use unevaluatedProperties=false instead of additionalProperties=false
> - fix property order to comply with dts coding style
> - include raw-nand-chip.yaml instead of nand-chip.yaml
> ---
>  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.example.dtb: nand@1,0: $nodename:0: 'nand@1,0' does not match '^nand@[a-f0-9]$'
	from schema $id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: nand@1,0: $nodename:0: 'nand@1,0' does not match '^nand@[a-f0-9]$'
	from schema $id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207-ppcyaml-v2-11-8137b0c42526@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


