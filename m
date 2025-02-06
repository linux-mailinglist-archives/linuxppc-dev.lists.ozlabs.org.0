Return-Path: <linuxppc-dev+bounces-5920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79270A2B622
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 23:59:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypsxn0DhSz2yyD;
	Fri,  7 Feb 2025 09:59:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738882796;
	cv=none; b=QR1vOSR1HITL23iIJyqmFp3OwDGy5OUzXmJEl5cbpRoL/Pn1Cg0LU0tevH0P/OcP7pkaSglzUeGZjOnoYaKdePvGdPKEe3iUkhuTYovRDEJetAjlonrvn3bBUk8i9t74vC0qWbyUQETx/4/0VRpaTGhK7AyQXJSz3uklDVqel/F9L/2/NmvwFYk5JUoz4083K7JOp3RT1hV3Sjth1qiqJm+++jZ4uMZ2ad1iSpIVMcEmW3Ic6wOps5oRib0uOcPsjvI5F6JcL9Z+SxdRWt2WWcmQpFEbdqaU9zte6LIbnbG03BzoAU8MYSOC5d4jPAat6ezLTL4m+m7K9VDmTSA+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738882796; c=relaxed/relaxed;
	bh=s90gX5+H8I/eZfCumMlHuYAqyLhC5ownJOCo9+MHK6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFwwRQWOPKAu3d12Bjza7Bzb19AdHlaWHy6M9JOjst6pSyXkM3mtds7l4trhPnn87OMq0j2cJXQCdbQExdE62ceO/gi2uuajGF6xbgLKFoFpWHrsEWl7H3YkU44lMy/ePjIWW4UYtXuNVQwLCPek6kzxEwV/wV8Pfxj6keJzczqHSdZ03SLS4SGa+4SUdAmKhGc3Qtl90xqls+K9F86q2eJSgeN9Dg4kWuTJ8CFufLV0olIeXqLF8LQoUVmKkCuqRYq1gUaNmr5O5uycMFxyLdf7cQyDc+IS3I/mHuEjSPFSsvkTXzotZR9Zi8waCsLbvCVaXIrZa3eoLJ2FJ9T2nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=f5fZ5dxc; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=f5fZ5dxc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypsxm03Mrz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 09:59:55 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 70D07240103
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 23:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738882792; bh=8wEjDCTuOvcktBrfjhLQ0lipXUb5sf39X+VV2LrhSa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=f5fZ5dxc+yiDR/WQT0Po4+rbJRF/txKc1K68b+9pnLBawItBAJwI2Z+S2x4Y1a6dX
	 3o9+6n8Ac6zOKWwBStCcVuzT4EfA0PH63bkmdao7A9yMOyDhJLdUvKZn+fvhstXL9L
	 0eQBvnQV4jdarLr3kJ2yWQtio5/V7D4cf2HNmkQN4XUTDviSnDQU7R+xCWplMukXe9
	 +/rP6AcoIJq9HCiegXVNIG3oaULtkuSzrOyxk3NmiwBryyj79VZfhfrWtcJpkaWkFz
	 qbpUtlZoAlUOyOFhP/QKs6fx1h+aRBctKN8niJcY4kyyQox7dY+X47sFoQ99SfrYy8
	 UeOGQqYnODnjQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ypsxb3GYrz9rxD;
	Thu,  6 Feb 2025 23:59:47 +0100 (CET)
Date: Thu,  6 Feb 2025 22:59:43 +0000
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
Subject: Re: [PATCH RFC 9/9] dt-bindings: nand: Convert fsl,elbc bindings to
 YAML
Message-ID: <Z6U-38ONJ0F3ILCo@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
 <Z5qzMH1t7jIr39Ce@lizhi-Precision-Tower-5810>
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
In-Reply-To: <Z5qzMH1t7jIr39Ce@lizhi-Precision-Tower-5810>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 06:01:04PM -0500, Frank Li wrote:
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
[...]
> > +  "#address-cells": true
> 
> should limit to a number set like
> 
> 	- const: 2

Will do

> > +
> > +  "#size-cells": true
> 
> the same as #address-cells.

Will do


Thanks,
J. Neuschäfer

