Return-Path: <linuxppc-dev+bounces-5748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B106A23EEC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 15:03:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkyKX6hqkz2yLJ;
	Sat,  1 Feb 2025 01:03:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738332208;
	cv=none; b=kEfSYLmodDKnwLGP5k9Wnpg/pQNK+4CiY2g/vPKjSej7l+/nyRF8HWYAe3/41nxUkLZKSxJzFnEbVOEx95GUSD+4glFBK11pkrmigzyiUmS3W3SmWP9LzRBM+GrK8QB3hPaXUxxNCDPdz02kgoOsZot7QZjq5NjQRnZi+2gLB3ptCaff+nc2EwWx4AcKQbAnurq58U6wEPNrXm+FYdvzyV768lammfpXJqufDn+hPcyH25AEvUMBvsKKBa+FvUtF2o3VIEv/P+dIk0bH4LZWLqgkI55oRjzu7qYASVIWFUM7tHsjURAI2EbMC3+6fMgyrTMjCteCxTWIULvW6zrnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738332208; c=relaxed/relaxed;
	bh=xFTui1TtNOoqCI5QawHUUAmqQyPVbfhu2Aj4ZUK2N1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GH9KxXeO5qxMZPA07mM16JEoi8gQHxmzF9IpA7JnNf8WJLONKltj/Fcxo2HseHgGbn/WeeOFreWeXMHu5l9ppETRjnZ/ZriRvlaJt3XyfKeAahHkn2El1pDYW0CCsvbZuqrznIU3vrjHbR0sjrIkV+DQgj30rybWOheusvus/XGW/lo2wWqjJjkEzD0eEksIb+KxEx0QYXgX4EU8ig7iar2WTC98PPdp81n2FDyIVqC/956KdgM5KpBSRzyXYy3VNBTvYAd8qfYCl8nD+cvhc1MXPEYS3i9EottgWizPfWEVmy5vPydw7Is0CqJpiWqU2Tt/1i4fSS1NceWhwkiadA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=U01V4Z6O; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=U01V4Z6O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkyKS6hMPz2yK7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2025 01:03:21 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5AEB4240027
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 15:03:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738332192; bh=k6iepJ3khtCHe4wAP+Co9RM2WKV6wPbtel3+iGpB+ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=U01V4Z6OZulu42RAyuhImUM7a4bKoe0MgxbzYtZ5Gtv3IQrM8v608XW6/eU8W1NPh
	 0t/gSDEdIYRPW7vnEa11pXSviVtdikX48Q82whS+CWfyd0UJeXt6rBD0fzF8KVfKTX
	 0Z03SYRn2Uu6IQP/L3bQo1aUJLI7+xN0KIfAIHVkK9eX5ItMwz6M+cxbDmy672oS74
	 Ci1CAAuttEEzIB8kkfBe89QxG3GD24LegtRlStjnbw6LmLN0kOJgA12M6XWLDU/om0
	 0GU6bntTsoAjFW2kCo3ZvOHG6G4u/oVw4TFTi6xdV9jF6Jo61OrWwlqWw5s5EDKsSb
	 1HFTZr/jTX1+Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YkyK53T11z6v08;
	Fri, 31 Jan 2025 15:03:05 +0100 (CET)
Date: Fri, 31 Jan 2025 14:03:05 +0000
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
Subject: Re: [PATCH 5/9] dt-bindings: dma: Convert fsl,elo*-dma bindings to
 YAML
Message-ID: <Z5zYGdZU-IXwIuR6@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
 <20250127044735.GD3106458-robh@kernel.org>
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
In-Reply-To: <20250127044735.GD3106458-robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 10:47:35PM -0600, Rob Herring wrote:
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
[...]
> > +patternProperties:
> > +  "^dma-channel@.*$":
> > +    type: object
> 
>        additionalProperties: false

I'll add it.

> (The tools should have highlighted this)

With dtschema 2024.11 installed, "make dt_binding_check
DT_SCHEMA_FILES=fsl,elo-dma.yaml" does not highlight this.

> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - enum:
> > +              - fsl,mpc8315-dma-channel
> > +              - fsl,mpc8323-dma-channel
> > +              - fsl,mpc8347-dma-channel
> > +              - fsl,mpc8349-dma-channel
> > +              - fsl,mpc8360-dma-channel
> > +              - fsl,mpc8377-dma-channel
> > +              - fsl,mpc8378-dma-channel
> > +              - fsl,mpc8379-dma-channel
> > +          - const: fsl,elo-dma-channel
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      cell-index:
> > +        description: DMA channel index starts at 0.
> > +
> > +      interrupts: true
> 
> You have to define how many interrupts and what they are.

Will do.

(and the same for the other two files)


Best regards,
J. Neuschäfer

