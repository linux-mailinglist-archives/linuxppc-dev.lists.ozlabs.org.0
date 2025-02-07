Return-Path: <linuxppc-dev+bounces-5968-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 287F4A2D19C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 00:45:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqVvL3NNDz2ykc;
	Sat,  8 Feb 2025 10:45:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738971902;
	cv=none; b=hOpprq6ardul5Dn6dmbbGKzZPALgvPBXX0RBRmMDzGEPFnySAS87XbjRh5oIIFVZ/bskaa1mYqBdwyVVguzwxkSn6dUfhMbI1IvZEl/s6hxX5b5dHGfYPERV9HvkWtIblTTYjcZqQElmLi0mBsfG4GSGmT+RN1kBpNKE0MZol7eAihcCgYPuLXebfSFh76eQRdc8s/q4h4XoTCcO3pnNUvMEx7LYo57JUOO4F29G5epusYtIIKQk5A9DlzBprdnalGRbbXOA/GI6pWL+vOCUjm2GkaFb/n8DO9gMFpXBgK+qxPLRSsa9kZeGVrSBD30BFvApX+7tCaccQpSV6INNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738971902; c=relaxed/relaxed;
	bh=KJq2hHT1aLnoC06mdgPsmCYQ32dQMG7oin75hRw9mdY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CKSm9dYphyGSGdaRQ74GyMw3Y4xn2dGHlUDnEuwEpehic/Kc+PZA0xlkI0LvJYFlFwxuK4jDQNGedWdQRYPJUFOu0/0x9eFM6BRtHJSe7yBQOgUcKzOwo2q98wE8FxzDhDAHoD+FQe0iXnapH3zvGkzLeJ6PeYn8szhOnKPQvcEdhHLx/XHs5oIdgEvVhHRzq0W7p2iX8ydA4gnL9muJEeu6whQh5vCNwubBQwjqSmIu6Y8H/rYX8UK8e2T/5fGs/oK1D7zUSvpt10MY6zJYqzeLNj2zkKdWd21utwoWy0arCkIVgo2LEeyJvBgIJtdoWP6tptrMmDROPQQRhkD76g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FcFD7E6x; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FcFD7E6x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqVvK44CTz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 10:45:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76F94A43C61;
	Fri,  7 Feb 2025 23:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7666C4CED1;
	Fri,  7 Feb 2025 23:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738971899;
	bh=0OcYIgMuhOEeKZ02PL/wKdLJvCr/x2GC0bB/FCHa3js=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FcFD7E6x/lq9R9GSbnFWQ84X6jA3wHn8MV9k9BwUEU5Jy3GduQqYEh0TAxZg84hd6
	 U/1mtO4DOlNDyWNaUYLvCvf330mxj9hdZo3Ap9AdXSFLJzN989NVrfwM7hrblNq5Vg
	 rBgXMw5MXP4WKs2vld+G4/TK0CCvjuFMv45Pt2rv7LGomPO/wwwhXgaUbVlAhiwJ0k
	 FKpaEdfJWr8j/V+qutaVdWXkjF/AlONGhMFLYgFT7+ApRz3JHy5WCCZbmTdYAil683
	 nEtQYHSdNFhl0ynU/NrzOmE9kS6c2Mv3qEwGLvCA6rIlaSL+WsaycsHH/XLRHNOch/
	 7FrFsFlmciVrg==
Date: Fri, 07 Feb 2025 17:44:57 -0600
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
Cc: Richard Weinberger <richard@nod.at>, linux-pci@vger.kernel.org, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-crypto@vger.kernel.org, 
 imx@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 linuxppc-dev@lists.ozlabs.org, linux-spi@vger.kernel.org, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Vinod Koul <vkoul@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Naveen N Rao <naveen@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Damien Le Moal <dlemoal@kernel.org>, devicetree@vger.kernel.org, 
 dmaengine@vger.kernel.org, Scott Wood <oss@buserror.net>, 
 Guenter Roeck <linux@roeck-us.net>, "David S. Miller" <davem@davemloft.net>, 
 Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-watchdog@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 linux-mtd@lists.infradead.org
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
Message-Id: <173897189562.2630598.5483742714479681257.robh@kernel.org>
Subject: Re: [PATCH v2 06/12] dt-bindings: pci: Convert fsl,mpc83xx-pcie to
 YAML
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Fri, 07 Feb 2025 22:30:23 +0100, J. Neuschäfer wrote:
> Formalise the binding for the PCI controllers in the Freescale MPC8xxx
> chip family. Information about PCI-X-specific properties was taken from
> fsl,pci.txt. The examples were taken from mpc8315erdb.dts and
> xpedite5200_xmon.dts.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V2:
> - merge fsl,pci.txt into fsl,mpc8xxx-pci.yaml
> - regroup compatible strings, list single-item values in one enum
> - trim subject line (remove "binding")
> - fix property order to comply with dts coding style
> ---
>  .../devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml   | 115 +++++++++++++++++++++
>  Documentation/devicetree/bindings/pci/fsl,pci.txt  |  27 -----
>  2 files changed, 115 insertions(+), 27 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml references a file that doesn't exist: Documentation/devicetree/bindings/pci/fsl,pci.txt
Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml: Documentation/devicetree/bindings/pci/fsl,pci.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207-ppcyaml-v2-6-8137b0c42526@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


