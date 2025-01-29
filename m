Return-Path: <linuxppc-dev+bounces-5687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C93C3A220AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 16:42:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjmcX4HWtz305v;
	Thu, 30 Jan 2025 02:42:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738165340;
	cv=none; b=NZylUx8+0drnapebHRkxxJmNctNCtdbWFj+gLgoqjZsZEqyaDehPWElJ7hmwDdry+91eXloygqkOX3Sf5eilakOIQl3gnCuOJbV450WtbGcIPrfhyPcetZUew2yRWC1Sk1J7YwupEmBALat/a1kSLr6o/KRcPEYuoqC0/NCJntZ5afdV5hZVr87P0C98IHwyfFb9sCXxVwrv3y/HQnMVfDUCZkRGVJTV/LxYlnN/b7aoOJv+V2mV9XcQc8MR37ZUdBdvKbRHinNKcy/ZvafbWDmULEzchCOcFckenDyTofoVHUwhwkMk7gupAzk3hZ7YrAYHc6zcPnaCtk8XtWhQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738165340; c=relaxed/relaxed;
	bh=EQvRhdtxt46AfuG6XZ1LcsPtcSreDtc3lRLpK20Kh98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARbMt16urILlQoiulTVruF19Ze27C/FSYG+Us8Uf43Wz/3G0VGGWPy6r9rEdj2xuYlyWfh1LrYmJKFVVZI6W7gqjp7aeru+3Lwl8bKJ9z4zO0r8V8kgnojXFTpyXhUyKwfhO3a8I24M3Zs5t7ZRyTh155zlC9ZarIIyfXz1DM3ZIWT+W5ltGN2jI4CQlzRS0WhU8OskMKiyI4s3gRBogPxpuFu39avWzW/8JvGE3WAVQtzIW4X/PVyjYcsDZQnmfhljIEIL18xFDOOMxYAGVYLphq6E+YYfmGywPVmcWk4rFQRKOXvkF5H27vJSoOOGnp8Y9skdCUNafCYB3NQdfXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=IU+Z0xBn; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=IU+Z0xBn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjmcR1glPz303K
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 02:42:13 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 414D3240105
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 16:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738165327; bh=fHuIzrO2wct7VL46Pzm/QKC1E0zvkFPkq1uaLyfrAgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=IU+Z0xBnnig0EhC6/GBKN71jt8XivDM3AVYyasQIpUlNY76h59cwZ/+vDfkR4fcfN
	 nsuu2mKYkn3yYGa0cMRLwNmrN2ok7JdvGiALjdFO4oWx07PiAhZBO/vaLsLckL8zsj
	 6pXbrgmqRF6TXS2Wg4+5mdwmWSTz64CB7GE7ZoaT7IoPIDBsRfs4c90I6YE4ngXWdO
	 adl5mIZ+12yhvg/Rn7aM1EtkPA7oDvfU3G8CoPftB3M8/R3va0ivVGwPJdU9Ul/Psd
	 ErT9rzxaA7bFABhuwnfHAcV7D7f+LnoIePImCl7YAEeGZUcDLj49DdJUJmQE68Ks53
	 uM3PTxFHxmkUA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yjmc71lNXz9rxB;
	Wed, 29 Jan 2025 16:41:59 +0100 (CET)
Date: Wed, 29 Jan 2025 15:41:58 +0000
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
Subject: Re: [PATCH 3/9] dt-bindings: crypto: Convert fsl,sec-2.0 binding to
 YAML
Message-ID: <Z5pMRk8WEZZK9TEL@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-3-50649f51c3dd@posteo.net>
 <20250127044128.GB3106458-robh@kernel.org>
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
In-Reply-To: <20250127044128.GB3106458-robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 10:41:28PM -0600, Rob Herring wrote:
> On Sun, Jan 26, 2025 at 07:58:58PM +0100, J. Neuschäfer wrote:
> > Convert the Freescale security engine (crypto accelerator) binding from
> > text form to YAML. The list of compatible strings reflects what was
> > previously described in prose; not all combinations occur in existing
> > devicetrees.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >  .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 139 +++++++++++++++++++++
> >  .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 ----------
> >  2 files changed, 139 insertions(+), 65 deletions(-)
[...]
> > +properties:
> > +  compatible:
> > +    description: |
> 
> Don't need '|'. I imagine there are more in the series, but will let you 
> find the rest.

Yes

> > +  fsl,num-channels:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: An integer representing the number of channels available.
> 
> minimum: 1
> maximum: ?

According to existing usage (and a cursory study of datasheets),
possible values are 1 or 4.

> 
> > +
> > +  fsl,channel-fifo-len:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      An integer representing the number of descriptor pointers each channel
> > +      fetch fifo can hold.
> 
> Constraints?

Current usage shows a typical value of 24, although I wasn't able to
find any information in the datasheets. I'll add plausible limits.

> 
> > +
> > +  fsl,exec-units-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      The bitmask representing what execution units (EUs) are available.
> > +      EU information should be encoded following the SEC's Descriptor Header
> > +      Dword EU_SEL0 field documentation, i.e. as follows:
> > +
> > +        bit 0  = reserved - should be 0
> > +        bit 1  = set if SEC has the ARC4 EU (AFEU)
> > +        bit 2  = set if SEC has the DES/3DES EU (DEU)
> > +        bit 3  = set if SEC has the message digest EU (MDEU/MDEU-A)
> > +        bit 4  = set if SEC has the random number generator EU (RNG)
> > +        bit 5  = set if SEC has the public key EU (PKEU)
> > +        bit 6  = set if SEC has the AES EU (AESU)
> > +        bit 7  = set if SEC has the Kasumi EU (KEU)
> > +        bit 8  = set if SEC has the CRC EU (CRCU)
> > +        bit 11 = set if SEC has the message digest EU extended alg set (MDEU-B)
> > +
> > +      remaining bits are reserved for future SEC EUs.
> 
> So:
> 
> maximum: 0xfff

Will add.


Thank you for your reviews.

Best regards,
J. Neuschäfer

