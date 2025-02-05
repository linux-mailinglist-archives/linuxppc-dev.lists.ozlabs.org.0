Return-Path: <linuxppc-dev+bounces-5867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E666A28FCB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 15:29:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yp2gH6Gmfz2yyx;
	Thu,  6 Feb 2025 01:29:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738765771;
	cv=none; b=iezxOuG1y3op+0dw0CWfAcn29PyOzncAprH8RVcitHUi32OePVrQfDJL8t240TczHI7apBPh2liNbAROvSqevAGkODxqPpJpgRL42O6aZw3LM1y+6k4oVsb+37Bou2/uXfAuFn9Igi6gYkQdfEjD84E+JgsHQlUqgPJDOsDeyPGqb2JFUXu/nwNTtmu8rEZDC/7ewpNEmrQoTINTldZaLPbBffWpEmRQlVjHlN41bqhjU2DmY7DW+a4dSmVeILFEW0UHUehxD9D/Rw0+1FJrmW3WlnYZMmXjLWq/10jcrO6SM4x9wnIviOB1Td0wj5xxtTxe7WUOnzOikGc6cZonzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738765771; c=relaxed/relaxed;
	bh=o7SSsQlWsrss/UCQ1/IqoEaMcm37gC+GF0xSYADmnHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtRIzaKVIG+LnP4fQ5FAu/AlbDQYlcyT7HJZ0+uDO2MbpeKD3NYwL3yX/2Qp/JAqAZHOFwEcdKbs6i6kH0lAuSjrZcMSx9cLy/928b2ExRzRnFmVwMfLkwDJhtBOhyAypt8tCFK9cTP2Eioe9kNwlU0JhG7+6c9hkIlluWE2OYa09ozi6BkCOmi1FImuzkAoqMrmkbLAbLAbLU23ZZrrjX+qA5Pdys3XGVvXVTLfxbdgygQrltfq/8LJvbRZ58bE4Bdk9Xg25Z+x1r9Dwq69sLoqTZfP4NI6j1HDmHik/tSTLmqtzyiEVyWttIeLhSqOGWTsepo6czmeBGpXZVqMhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=PACWVV/B; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=PACWVV/B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yp2gD4lxDz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 01:29:27 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B58A7240101
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 15:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738765761; bh=e42SIVOUhhbdor72mrNuSIArnji9rVNQMG+KjSfReLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=PACWVV/B2zEXa/3zM3iFyWGMCvq1ep2tJrc4lnPcQd3vMa6GfKW9yWUGJflhWkzB6
	 mdwFgQnP74Q/JsCwaMpTD/CjCuigxBwGIzzFxwKWVOeHk4MaYvlikd7rp62zTC36An
	 Agq7QhuBJJS77HdFXurVKxgAqrp2UMVQuGlfqmMXwEUvTE2X+Q7vjO9yeuFfneWNi4
	 UzFkZdRD0ItU6gs7hUevNamTNwgpLFYRa/IWNqQMQfGMroi2NGU2e/DlG3TmQlVncm
	 PLI6VUrrsbH50E1C83K8fRG84DpnJGcwKJONJ/5Rq2M0DazTqmw5sg53lAryZJ//tS
	 +5vr8gbAqJFJA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yp2fz0fXhz9rxQ;
	Wed,  5 Feb 2025 15:29:14 +0100 (CET)
Date: Wed,  5 Feb 2025 14:29:14 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
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
Subject: Re: [PATCH 8/9] dt-bindings: spi: Convert Freescale SPI bindings to
 YAML
Message-ID: <Z6N1uqg4Dji4Pt3X@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-8-50649f51c3dd@posteo.net>
 <20250127050901.GB3127337-robh@kernel.org>
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
In-Reply-To: <20250127050901.GB3127337-robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 11:09:01PM -0600, Rob Herring wrote:
> On Sun, Jan 26, 2025 at 07:59:03PM +0100, J. Neuschäfer wrote:
> > fsl-spi.txt contains the bindings for the fsl,spi and fsl,espi
> > contollers. Convert them to YAML.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >  .../devicetree/bindings/spi/fsl,espi.yaml          | 56 +++++++++++++++++
> >  Documentation/devicetree/bindings/spi/fsl,spi.yaml | 71 ++++++++++++++++++++++
> >  Documentation/devicetree/bindings/spi/fsl-spi.txt  | 62 -------------------
> >  3 files changed, 127 insertions(+), 62 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/fsl,espi.yaml b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..350275760210c5763af0c7b1e1522ccbfb97eec7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
> > @@ -0,0 +1,56 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spi/fsl,espi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale eSPI (Enhanced Serial Peripheral Interface) controller
> > +
> > +maintainers:
> > +  - J. Neuschäfer <j.ne@posteo.net>
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,mpc8536-espi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts: true
> 
> How many?
> 
> > +
> > +  fsl,espi-num-chipselects:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: The number of the chipselect signals.
> 
> Constraints?
> 
> > +
> > +  fsl,csbef:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Chip select assertion time in bits before frame starts
> 
> Constraints?
> 
> > +
> > +  fsl,csaft:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Chip select negation time in bits after frame ends
> 
> Constraints?

I'll add appropriate constraints to all of these.


> > diff --git a/Documentation/devicetree/bindings/spi/fsl,spi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi.yaml
[...]
> > +  clock-frequency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Don't need a type.

Will remove

> 
> > +    description: input clock frequency to non FSL_SOC cores
> > +
> > +  cs-gpios: true
> > +
> > +  fsl,spisel_boot:
> > +    $ref: /schemas/types.yaml#/definitions/flag

I do wonder, what's the difference between
$ref: /schemas/types.yaml#/definitions/flag and type: boolean?



Thanks for your review.

Best regards,
J. Neuschäfer

