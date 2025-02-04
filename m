Return-Path: <linuxppc-dev+bounces-5849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56FAA27F9C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 00:31:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ynfkv2Cnkz30H7;
	Wed,  5 Feb 2025 10:31:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738711879;
	cv=none; b=OgFVcfe21U2nnNc/4x63o/ZouUA4UECsfRZ4/RO23HIr8eODgyClcfV8WGf2E/BxnEpft6IsvVmPHHg416Ig0nw/ahMdlqPAvfm/STJtV0GLAbZSWHyOHRxXZvLcSztBaEJQbKLifqVruht1SaTf0OxArfOVBatwvvRSPm+nHppzinRLVBDrNxEKfdn8GxVP8VV2MEqn1IvbNwTgsAtNHLUnviXBXvZ1+n9lLUYDCiqHSfdc7x6xa9KFnfREaa1sAUjwNAK6HXf8/IHGBXPVUoiWoD0D2Iw4ByeohKmOJJIFCaiYI4GQTTXazDRH5LtyJWaBnyDulfuFmdnUvJnTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738711879; c=relaxed/relaxed;
	bh=Nc+QGc0iNxGUtRZrM6h+0gWZ2BfgZjuWEexRrB8jN6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvRHMhthmvM/GOLEM5f4nBzazml1i6+IacHsnZiRZAuUPv2ChQrxY9f97n8/Vj1ZNrWfuPOdnVcZpdOEjRPeMfluo72IG9JKhMqOaDZ3cY96QiRJmKMkOkgstYBPVOo4+7usLb1PEtnztkVh49zn+DU49UDFaPiHdDG5XVikFAdlA5jP83WK7SsjTUTT1jf+qzvgUG5jThtlSY381WlbmM8GIkjmupcneNy0gbMoDjDU7Ibd/t0kmxq3ez/Gs5p0yGVbudGwFL2WsBTjNuFSHCE189KtlwYhZD1RZ2lhR/kyMAsDypPQazjmZg67a7LonyTS6Yp0LhO5MZdfI1/VLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=JeH//egA; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=JeH//egA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ynfkr6qd8z30Ds
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 10:31:12 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id CD360240027
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 00:31:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738711866; bh=dJP28q5tsQaLJ5Y1dJlvwdNzH08V5OcPLoDVQOBCze0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=JeH//egAxdP/noC5RoCMUR3PiFz8ld6VUlVtNLxdHdQ8SVa0TA1wMdmTUh+Elqwc2
	 YF4XtdkaZoixuZJffID+g8XfpiuAhFGAU7d6unfcWOvhDIoZStaY3pjDbYkJXsBBKy
	 GosPqLrzztYl9ylpxFQK5ubT8pb5IttYHtOCXzS7TOSo/aiD+ceeNzAz4fMPciOouH
	 FYWhMleejDIQaZg53HWg6BONww1nKdZ6C3q8JgXjy+kHpRXkh0MdXLAhUC9Qtce/Kx
	 owEjoat9URBVHI6oDP9H4/fZSkfolngK6wRJ9x1TiXd1iPPQehe7ccX3oWIGO+a7NG
	 4D+DKLWIasuWw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YnfkX6mVsz6tvZ;
	Wed,  5 Feb 2025 00:31:00 +0100 (CET)
Date: Tue,  4 Feb 2025 23:31:00 +0000
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
Subject: Re: [PATCH 6/9] dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
Message-ID: <Z6KjNC2tM29h1Z2M@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
 <20250127045004.GE3106458-robh@kernel.org>
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
In-Reply-To: <20250127045004.GE3106458-robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 10:50:04PM -0600, Rob Herring wrote:
> On Sun, Jan 26, 2025 at 07:59:01PM +0100, J. Neuschäfer wrote:
> > Supplement Documentation/devicetree/bindings/pci/fsl,pci.txt with a more
> > formal binding in YAML format.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
[...]
> > +title: Freescale MPC83xx PCI/PCI-X/PCIe controllers
> > +
> > +description: |
> > +  Binding for the PCI/PCI-X/PCIe host bridges on MPC8xxx SoCs.
> > +  See also: Documentation/devicetree/bindings/pci/fsl,pci.txt
> 
> Can you move that information here.

Will do.

> 
> > +
> > +maintainers:
> > +  - J. Neuschäfer <j.neuschaefer@gmx.net>
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,mpc8308-pcie
> > +              - fsl,mpc8315-pcie
> > +              - fsl,mpc8377-pcie
> > +              - fsl,mpc8378-pcie
> > +          - const: fsl,mpc8314-pcie
> > +      - const: fsl,mpc8314-pcie
> > +      - items:
> > +          - const: fsl,mpc8360-pci
> > +          - const: fsl,mpc8349-pci
> > +      - const: fsl,mpc8349-pci
> > +      - items:
> > +          - const: fsl,mpc8540-pcix
> > +          - const: fsl,mpc8540-pci
> > +      - const: fsl,mpc8540-pci
> > +      - items:
> > +          - const: fsl,mpc8540-pcix
> > +          - const: fsl,mpc8540-pci
> > +      - const: fsl,mpc8548-pcie
> > +      - const: fsl,mpc8548-pcie
> > +      - const: fsl,mpc8641-pcie
> 
> Move all the single 'const' to 1 enum entry.

Will do

> > +
> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description: internal registers
> > +      - description: config space access registers
> > +
> > +  clock-frequency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Don't need a type for this.

Will change.


Thanks,
J. Neuschäfer

