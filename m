Return-Path: <linuxppc-dev+bounces-5919-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A28CFA2B61A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 23:59:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypsx35bXPz2yZ6;
	Fri,  7 Feb 2025 09:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738882759;
	cv=none; b=Gk08IUlpfuO4Q3xEe+LwilzvInlbTaKekn+hh+v69iVJvN5qITKrI+KuQ2Xa0FyZsvF/fN9zC8bBw84rwQ7JVABH300eWE8leRv2k/wUzuoFzaKqShdu9lKjBQGjnkmgj/AserL0fgkKNu0SQd32K9tWAOjzqioXiizlmdL6tsPG660hj8CoWjMxTANYfTT1khk3ZWd82LXE5UiuAHZ7CkiABqeuFDC6WQZogNXHm7Q/oblOBfkWNHYREtypHO9chlBqvQAyrFirbE/Dab+NXoMsQ9H61UZEakFgOAJTj/14sMLVn3hPfDvzkEbgQdBj3kPFe9lyKBCdTM0xoPSunw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738882759; c=relaxed/relaxed;
	bh=Q/YkmNQHVItv+Irh/Q29Rrr169vxVSyW5yOA+KczfWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1GajAFehVCR5mjHP1qrJPTHJrIJUEUD9Is2SbTTaGyVm2RasdgJFk/RPJ3FgK5H7KxX91OaEYf5NNrHfXPBLHZnSCHjIrMVDHqoGVw2FDxc4ZpRlhLaVq0zqCBf2u/OFMAdDclopQX8hC3pzlfzlfkhvq32FxpWTPb/oeeiStO6iKreiWmxhl/D148fXiMUIj4wazHGxBPEM4mEZH1Z8RoTQEHBpBT/VBDzdl6ls1Q+7TqPhbAY7ZwC773C5aO10iq7Nwf4ZDqIA0WSBE0O6CpqpqGyuLkKeIcHieUqOvmaNs+FUdbE4//M/s/m0Hhn+bkbCGhR1fbUng9FAvNruA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=p+RkgaMV; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=p+RkgaMV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypsx12FZkz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 09:59:15 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 5CB07240108
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 23:59:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738882750; bh=0ntnTKWhZutag/x3HVhP8VZ4Ui4mFuohPb6mz+tL+nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=p+RkgaMV9VIAIT8MYZFio3VSfTcUJfYA5FEc+zjfP1EnW22lPFrmANL4PS3LwQnNT
	 602ylrOf2+AntvRiDwn14Jhfy2V1nnrN9wFBJI/kI4PU/+5npRjv6xJ5/AKy/RW6Fv
	 f2YlHOM7k210lFFssN1JAaYVF1YyIKI+GQ7tKJM9pc/jWJBzOM7DVXjYe2MOUXkiue
	 adEt/Bw2fk5rtfWCmrCQoBw9fD94uNiGGmSrUf1QNQ80AgJUDYsJdGYQqwmqTTrn2R
	 oMDGYBC4J4au3YLekaecSKppQGFujoThS8rsOtEJnu5EMXQ+xZWUsk7caf5RSxDEGG
	 7rekhBdR5x3gA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ypswl20Tqz6txc;
	Thu,  6 Feb 2025 23:59:02 +0100 (CET)
Date: Thu,  6 Feb 2025 22:59:01 +0000
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
Subject: Re: [PATCH RFC 9/9] dt-bindings: nand: Convert fsl,elbc bindings to
 YAML
Message-ID: <Z6U-tVhmbwwULuzQ@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
 <20250127042321.GA3067818-robh@kernel.org>
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
In-Reply-To: <20250127042321.GA3067818-robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 10:23:21PM -0600, Rob Herring wrote:
> On Sun, Jan 26, 2025 at 07:59:04PM +0100, J. Neuschäfer wrote:
> > Convert the Freescale localbus controller bindings from text form to
> > YAML. The list of compatible strings reflects current usage.
> > 
> > Changes compared to the txt version:
> >  - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
> >    appears in this example and nowhere else
> >  - added a new example with NAND flash
> > 
> > Remaining issues:
> >  - The localbus is not really a simple-bus: Unit addresses are not simply
> >    addresses on a memory bus. Instead, they have a format: The first cell
> >    is a chip select number, the remaining one or two cells are bus
> >    addresses.
> 
> That's every external parallel bus. See bindings/memory-controllers/*
> 
> Probably fine to leave 'simple-bus' if that's your question. It's more 
> that there is configuration for the chipselect timings that make's this 
> not a simple-bus. But the address translation should work just fine.

My concern mainly stems from the resulting warnings if I allow/use simple-bus:

Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:77.23-84.15:
  Warning (simple_bus_reg): /example-1/localbus@e0005000/flash@0,0: simple-bus unit address format error, expected "0"
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:86.22-92.15:
  Warning (simple_bus_reg): /example-1/localbus@e0005000/nand@1,0: simple-bus unit address format error, expected "100000000"

Existing devicetrees specify the eLBC with compatible = ..., "simple-bus",
which lead me to include the simple-bus compatible both in the binding
itself and in the examples, which in turn leads to (correct) warnings
from DTC about node names such as nand@1,0 (it expects 100000000).
nand@1,0 was however completely correct for the eLBC bus, because it's
not one big linear address, but rather a chip select (1) and an address (0).

My current idea to resolve this contradiction is to remove simple-bus
from the binding and change affected devicetrees later.

> 
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  61 +++++++++
> >  .../bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml    |  55 ++++++++
> >  .../devicetree/bindings/powerpc/fsl/fsl,elbc.yaml  | 150 +++++++++++++++++++++
> >  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
> >  4 files changed, 266 insertions(+), 43 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..127f164443972bbaf50fd9daa80c504577ddd7bd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NAND flash attached to Freescale eLBC
> > +
> > +maintainers:
> > +  - J. Neuschäfer <j.ne@posteo.net>
> > +
> > +allOf:
> > +  - $ref: nand-chip.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> 
> Don't need oneOf.

How would I express "either one of various chip-specific strings
followed by fsl,elbc-fcm-nand, or fsl,elbc-fcm-nand alone"?

> 
> > +      - items:
> > +          - enum:
> > +              - fsl,mpc8313-fcm-nand
> > +              - fsl,mpc8315-fcm-nand
> > +              - fsl,mpc8377-fcm-nand
> > +              - fsl,mpc8378-fcm-nand
> > +              - fsl,mpc8379-fcm-nand
> > +              - fsl,mpc8536-fcm-nand
> > +              - fsl,mpc8569-fcm-nand
> > +              - fsl,mpc8572-fcm-nand
> > +              - fsl,p1020-fcm-nand
> > +              - fsl,p1021-fcm-nand
> > +              - fsl,p1025-fcm-nand
> > +              - fsl,p2020-fcm-nand
> > +          - const: fsl,elbc-fcm-nand
> > +      - const: fsl,elbc-fcm-nand
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells": true
> > +
> > +  "#size-cells": true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> 
> If you use anything from nand-chip.yaml, then you need 
> unevaluatedProperties here.

Noted, will fix.

> 
> > +
> > +examples:
> > +  - |
> > +    localbus {
> > +        #address-cells = <2>;
> > +        #size-cells = <1>;
> > +
> > +        nand@1,0 {
> > +            #address-cells = <1>;
> > +            #size-cells = <1>;
> > +            compatible = "fsl,mpc8315-fcm-nand",
> > +                         "fsl,elbc-fcm-nand";
> > +            reg = <0x1 0x0 0x2000>;
> > +        };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..60f849b79c11a4060f2fa4ab163f9fa9317df130
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/powerpc/fsl/fsl,elbc-gpcm-uio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Userspace I/O interface for Freescale eLBC devices
> > +
> > +maintainers:
> > +  - J. Neuschäfer <j.ne@posteo.net>
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,elbc-gpcm-uio
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  elbc-gpcm-br:
> > +    description: Base Register (BR) value to set
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  elbc-gpcm-or:
> > +    description: Option Register (OR) value to set
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  device_type: true
> 
> This should be dropped.

Will do


> > diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml
[...]
> > +  "#address-cells":
> > +    enum: [2, 3]
> > +    description: |
> 
> Don't need '|' unless there's some formatting.

Will remove.

> 
> > +      The first cell is the chipselect number, and the remaining cells are the
> > +      offset into the chipselect.
> > +
> > +  "#size-cells":
> > +    enum: [1, 2]
> > +    description: |
> > +      Either one or two, depending on how large each chipselect can be.
> > +
> > +  ranges:
> > +    description: |
> > +      Each range corresponds to a single chipselect, and covers the entire
> > +      access window as configured.
> > +
> > +patternProperties:
> > +  "^.*@.*$":
> 
> You should define the unit-address format here: @<chipselect>,<offset>

Will do.



Thanks,
J. Neuschäfer

