Return-Path: <linuxppc-dev+bounces-5996-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8737AA2D9EC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 01:07:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yr7Lc3thPz2ysZ;
	Sun,  9 Feb 2025 11:07:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739059640;
	cv=none; b=ob6GKLUt5G2w+kYWN7o7RkyrlPogNo6K0Bvo4zskd7bUOjhTROWtOf9yiYK7PYEJgmnPwLp4TglkTXL95Hd/UIzZBGNqVNge9xZDl4eNztaVasxW5aRJnMs1K0U+XzUVKOyjpxgneJkJMje40+9VJxvEaG6maqFrPOAUyUleH0fAEx5VTuqYdA7J0RibC14fiLtnwCUWZmiUoAIAd0VBOiI+IIwW9SurqN/3lJuKndxF5xXqXGt3EZd8p4nAy8VajSpayEyfBtBNaRDX6T2ebbcqmX7NMyBo6iRoX/zLvIdVOTgXflRtU1SoCQKOhEgLwD8vp4ckW8xbKRdQDar4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739059640; c=relaxed/relaxed;
	bh=It1UhZIIqDQuZN8dQflR4iHGk9WcvMqPGTqII7yVkyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5XOns8Lhr0O1l8oa2/lmGC8dye1D4BbouOBqgiRxlSCC+BXsFwI8/GPNMkDPT6S3qIAnoTL9CgthawbUCVvNRjBLEk/rqFda/mCn6cRin8ST+wM38rdk3yXar7xtN3Y5q01NYW3VmszpSh/koQdXpF6Gt7AzxIPdWfgK8OKFQEMtZpunPzfZLSx1ggZ9cTwe1874owUQxY7SKfErzAh/tr7JuFdf9qY6dS2whJ5IPePJd/mvGETRsaDT7orPOqVieqcbCWvz5s+/xsKwP1vU3vPakZj4svgIGkzmnp/ksup9Z5goK3SVuIB8On1FChncGotgpUpzTE08Zjb13S1Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=SR2TmtIo; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=SR2TmtIo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yr7LX6sWGz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 11:07:15 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id EAB2E240027
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 01:07:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739059628; bh=Rnod+Cv9JGN27bc74JTeUwsZwKe+/eQ5wUgORPxiuzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=SR2TmtIo67z05s4kxF0Ofa2/igGTbKkcbZPByXWXy8i6zm9KWjhNMQ/3Vaqi5EU6A
	 JkqODKQmGafdbjTgaw6zvXIjbwCea1icwXx7XJkKGwDvjrw6cOwzih3KjdBWDEkmeQ
	 TAV2d8GBB+HcI8v0XRjQ89eked08X5Fnl4rHWmiAxvOraVLYfkyXf4raGqN9z9w9Gy
	 VmloYIu+RyuefxPplg8tyDFctF4eRcBdw1kFlC36JnybCRp/IEQgKYg+M3g7QvpWUG
	 ohkM9bj5pnzu735rDicaTmq0dj+A2G8d9R/pUbzadWaJ8mfgVociMnpq9oukqQgHOv
	 /dTErrwHPl7Ag==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yr7LD23pfz6v0D;
	Sun,  9 Feb 2025 01:06:59 +0100 (CET)
Date: Sun,  9 Feb 2025 00:06:59 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 06/12] dt-bindings: pci: Convert fsl,mpc83xx-pcie to
 YAML
Message-ID: <Z6fxo4j5a6ro0f1w@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 10:30:23PM +0100, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
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
> diff --git a/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml b/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..57c5503cec47e6e90ed2b09835bfad10309db927
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MPC83xx PCI/PCI-X/PCIe controllers
> +
> +description: |
> +  Binding for the PCI/PCI-X/PCIe host bridges on MPC8xxx SoCs.
> +  See also: Documentation/devicetree/bindings/pci/fsl,pci.txt

This is obviously a bit wrong; I ended up putting the information from
fsl,pci.txt entirely under the fsl,pci-agent-force-enum property, but
forgot to remove the reference to the old txt file.

> +properties:
[...]
> +  fsl,pci-agent-force-enum:
> +    type: boolean
> +    description:
> +      Typically any Freescale PCI-X bridge hardware strapped into Agent mode is
> +      prevented from enumerating the bus. The PrPMC form-factor requires all
> +      mezzanines to be PCI-X Agents, but one per system may still enumerate the
> +      bus.
> +
> +      This property allows a PCI-X bridge to be used for bus enumeration
> +      despite being strapped into Agent mode.
> +
> +required:
> +  - reg
> +  - compatible

