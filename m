Return-Path: <linuxppc-dev+bounces-5827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B121A27DC2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 22:47:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YncR96qXnz2xnS;
	Wed,  5 Feb 2025 08:47:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738705653;
	cv=none; b=WStNAFvp79A7WACopIHzyUR9SVNHW8vQMJ0YKDrWVfkJSRniwxd9NNfl4TGtbqnC7FmVUPgX4OIM0C9nXKGqXnsny/3EgFA77MFs5IW78wXfJ2LxVNvJgGt4DQbN/zsVlL7q68ynrB4JnG/9P38bEYOmE6pqs93zKoM9rQzf2GBYvtZS9tIiUVvZsUadm+p22MW7RV/KVU53iP+9bHYWlgvXjRz1EwSRx4CqeDiLlUCAiMLRAUh+jf2l9wf/INNd6eShaHjTdhX3QQPfakVv4t1uWNpT5Zw8CdPibbg9atAGhgYs1rTyuW9sm0CHBzepLiFeG2Yb6W5wBzUFUSfr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738705653; c=relaxed/relaxed;
	bh=zQHKsaP7Rg5y2BC2Jhn7OTglMPEKc73865tLUgABAm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWlFlKZ3I8JlHzaun+/hHbAgKY7ZCJP0Lfj/muOs96+72hRmll/bB0fjcwGjelxZAOo9/yVOqo5DfpXipcZPItn9lTzrvv8rZmbu7phm5NF5mJ9RuGdVlY7X2g+g2XHywXBO6zWcOepiwtJJbeWIi/Ro4KxR31qors09w4AYVilXUanPAekDkF3GMm38e7dGWvhEePhVCWpBH572KKBmqyDQYl7BtqnCnPa59XADPHv3+ie7EiiYLw2BoaXV+P0V8p46hnlqKkfaw9RSmqWkk7vECVKSUCKIy93oRrmzWDPyX0tlWAILyM4/bPsI9z7pE1JU5HyJJAnLMVkxxahzbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=qQZ0j6GE; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=qQZ0j6GE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YncR72Wf2z2xmS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 08:47:28 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E310A240101
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 22:47:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738705641; bh=hqFrHw4SuAtLqJ59fD6Qavu3B1gXposiTbudKR0gwzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=qQZ0j6GEsv4JcDlYj8Q6u9rRWhrn5SRTH1N0uD/ZYP5qA8J/UrP92jd5g6FnOmvVD
	 W89zfbGd7UFgCDmMzmtJzoAwY//KVPRgk2c5d6g5q0Rus8hT0pmTGBikjS5mG4mwL0
	 OcIYINsOA5E7lC2zTHSIVEjTYwv6fNZOK3rnQa4NZiaTynWFJlS+VqebRR83oVM0eo
	 FHgV2NC4k2HvL6b+Ae+AwtD+zxxOkAAZ2TdKt1pFzsS9/1kVUyTteX5csGKN/vTdrt
	 ewPUNMLJi0gRHPW1twZZgZ1p8yqKZSTTXXD447GewiJw6kXbKgeWfFljHMnNuxkvqc
	 PdVfx5l9i8phw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YncQq5Wc6z9rxG;
	Tue,  4 Feb 2025 22:47:14 +0100 (CET)
Date: Tue,  4 Feb 2025 21:47:14 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Frank Li <Frank.li@nxp.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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
Subject: Re: [PATCH 5/9] dt-bindings: dma: Convert fsl,elo*-dma bindings to
 YAML
Message-ID: <Z6KK4vLsFVxMS9pS@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
 <Z5qxLxa7z22Fk+Dv@lizhi-Precision-Tower-5810>
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
In-Reply-To: <Z5qxLxa7z22Fk+Dv@lizhi-Precision-Tower-5810>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 05:52:31PM -0500, Frank Li wrote:
> On Sun, Jan 26, 2025 at 07:59:00PM +0100, J. Neuschäfer wrote:
> > The devicetree bindings for Freescale DMA engines have so far existed as
> > a text file. This patch converts them to YAML, and specifies all the
> > compatible strings currently in use in arch/powerpc/boot/dts.
> >
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 129 +++++++++++++
> >  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 105 +++++++++++
> >  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 120 ++++++++++++
> >  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
> >  4 files changed, 354 insertions(+), 204 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d1f4978a672c1217c322c27f243470b2de8c99d4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> > @@ -0,0 +1,129 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/dma/fsl,elo-dma.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale Elo DMA Controller
> > +
> > +maintainers:
> > +  - J. Neuschäfer <j.ne@posteo.net>
> > +
> > +description: |
> 
> needn't | here

Will remove.

> 
> > +  This is a little-endian 4-channel DMA controller, used in Freescale mpc83xx
> > +  series chips such as mpc8315, mpc8349, mpc8379 etc.
> > +
> > +  Note on DMA channel compatible properties: The compatible property must say
> > +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the Elo DMA
> 
> There are not 'fsl,eloplus-dma-channel' under "^dma-channel@.*$". I suggest
> remove this because 'compatible': items already show such information.

Good point, I'll trim this text down.

> > +  driver (fsldma).  Any DMA channel used by fsldma cannot be used by another
> > +  DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore, any
> > +  DMA channel that should be used for another driver should not use
> > +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drivers, for
> > +  example, the compatible property should be "fsl,ssi-dma-channel".  See
> > +  ssi.txt for more information.

I noticed fsl,ssi.txt has been converted to YAML since this text was
originally written, so I'll make reference to that.

[...]
> > +examples:
> > +  - |
> > +    dma@82a8 {
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        compatible = "fsl,mpc8349-dma", "fsl,elo-dma";
> > +        reg = <0x82a8 4>;
> 
> compatible and reg should be first two property.

Will fix.

> 
> > +        ranges = <0 0x8100 0x1a4>;
> > +        interrupt-parent = <&ipic>;
> > +        interrupts = <71 8>;
> > +        cell-index = <0>;
> 
> need space line here.

Will fix.

> > +        dma-channel@0 {
> > +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> > +            cell-index = <0>;
> > +            reg = <0 0x80>;
> > +            interrupt-parent = <&ipic>;
> > +            interrupts = <71 8>;
> > +        };
> 
> need space line here. check other's example dts

Will fix in all files.


[...]
> > +patternProperties:
> > +  "^dma-channel@.*$":
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - enum:
> > +              - fsl,mpc8540-dma-channel
> > +              - fsl,mpc8541-dma-channel
> > +              - fsl,mpc8548-dma-channel
> > +              - fsl,mpc8555-dma-channel
> > +              - fsl,mpc8560-dma-channel
> > +              - fsl,mpc8572-dma-channel
> > +          - const: fsl,eloplus-dma-channel
> 
> I think you can merge this fsl,mpc83xx-dma yaml file
> 
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,elo-dma
> +    then:
> +      patternProperties:
> +        "^dma-channel@.*$":
> +          properties:
> +            compatible:
> +              items:
> +                - enum:
> 			....
> +    else
> +      patternProperties:
> +        "^dma-channel@.*$":
> +          properties:
> +            compatible:
> +              items:
> +                - enum:
>                         ....
> +                - const: fsl,eloplus-dma-channel

I suppose that works, but I'm not entirely convinced it would help with
readability, compared to leaving the three variants separate.


Thank you for your review!

Best regards,
J. Neuschäfer

