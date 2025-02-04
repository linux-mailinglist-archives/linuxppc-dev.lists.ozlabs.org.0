Return-Path: <linuxppc-dev+bounces-5824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A250A2799A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 19:19:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnWpz4YPCz2ypP;
	Wed,  5 Feb 2025 05:19:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738693163;
	cv=none; b=JrTbcQBhVPcEWFG5fW7YqT+78I5q4VeDgTatmqpZK+nw997GZuyWeRYtEHI64shxQdMBuwLm26OUec3lM6+bYL80h59KjzSqXRDQ85Tgk97KiGSSSnxPDD/64rX8BkvHy0XpauoDSZr2dvOJNnkXUr2jCnan1CeU+rhgEJZZR6TKDhY/XrWlhTTVc1gAa4AbWL7wlxKISOEypz3EANcrxeFvZHN8uJRtnKJ9Oz1eJqDN8PEZ6TLh6iDLdHMNPBTIXE7Gyb5cJFk5xU8tVLuB1TD1FLy9xWPAOxnvUvpx/cCVtmGtNbaVkL0l4YFMzXMYlBVW0wtVwtqtUNjItGKc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738693163; c=relaxed/relaxed;
	bh=Xmqzn85gzzPEKGzkf7GSGtxFNDzx5m/hhgDgc6UxSKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alW5pgOiNRl2+5AOti/uNcXEJZX8WCPL45yjfDuxnkDWq2p0UDaYlVZ7UmE08nydoFl/FcRBfHpZ+mqZRw3X9X/Gm9eXfsPrtAXI9VMOHC8Mh0t0wghrHxD2+MsPFbvzrNFIWEKr0r5tO0Ubty5kENWFyrbtykj+7jDGDpov/TLplCHT374lVZwo8sCmd2+ePX1FaRwRZ4iFNiP9e3BQrl0qvvKBEwTXKPBSNW2ButKMQXYc0OMkRIWgRFOl7KiD0CASqlTUcwStxj6qzYx/4AXb8YZXozRBQDcqN+R7IJdSd8BmZCHMbzp4qf9Ay0FgsyL4AItD62Pglf0BUXXy+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=QLuSB3Cp; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=QLuSB3Cp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnWpw43w3z2yXd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 05:19:18 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 78793240101
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 19:19:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738693152; bh=TCqqBaH/6DxhhY4LxUIZxLWTUzfo7FZ0g9lCT/VEHVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=QLuSB3Cp5wmxvy0AcnxYAbea4vAVqLHQ2qWlm36gLR16yyS9Z6v9YRiCvyp4j4gn5
	 LgZDTviocjTkkrBZfKjqIX7HKrKmbEgZd5usiMBwfyowuAzH7n9ya5rw+1WcRG1Oim
	 61l/YRbLQ/MuqjUeCkWoQ1kkGDN+vaSKCCpYDwnidKomCYAjqhFy+gkv+aXN4VknA6
	 SHTFc7qSWaWjKRuglfENNnh6zyhAw0zuaTMO+sMLjEjkDm5sMj/UWLXt8eIducymRH
	 jcDEMinpzWrqCDL2LTwSNhNU1eiDWLfNxb9bwY4wxFJwO7H3iV26supD7Xr4Uco5Zq
	 7tomMw0Ep2Izg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YnWpc4lyZz6tw4;
	Tue,  4 Feb 2025 19:19:03 +0100 (CET)
Date: Tue,  4 Feb 2025 18:19:03 +0000
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
Message-ID: <Z6JaFxfwC0tAB4uQ@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
 <20250127044735.GD3106458-robh@kernel.org>
 <Z5zYGdZU-IXwIuR6@probook>
 <CAL_JsqJAX1QbXvG16NV2g6DGece6KiG_V-uyKQQLA618Oq9miw@mail.gmail.com>
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
In-Reply-To: <CAL_JsqJAX1QbXvG16NV2g6DGece6KiG_V-uyKQQLA618Oq9miw@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 31, 2025 at 04:16:07PM -0600, Rob Herring wrote:
> On Fri, Jan 31, 2025 at 8:03 AM J. Neuschäfer <j.ne@posteo.net> wrote:
> >
> > On Sun, Jan 26, 2025 at 10:47:35PM -0600, Rob Herring wrote:
> > > On Sun, Jan 26, 2025 at 07:59:00PM +0100, J. Neuschäfer wrote:
> > > > The devicetree bindings for Freescale DMA engines have so far existed as
> > > > a text file. This patch converts them to YAML, and specifies all the
> > > > compatible strings currently in use in arch/powerpc/boot/dts.
> > > >
> > > > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > > > ---
> > > >  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 129 +++++++++++++
> > > >  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 105 +++++++++++
> > > >  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 120 ++++++++++++
> > > >  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
> > > >  4 files changed, 354 insertions(+), 204 deletions(-)
> > [...]
> > > > +patternProperties:
> > > > +  "^dma-channel@.*$":
> > > > +    type: object
> > >
> > >        additionalProperties: false
> >
> > I'll add it.
> >
> > > (The tools should have highlighted this)
> >
> > With dtschema 2024.11 installed, "make dt_binding_check
> > DT_SCHEMA_FILES=fsl,elo-dma.yaml" does not highlight this.
> 
> Actually, it's the top-level 'addtionalProperties: true' that disables
> the check here. That should be false as well.

Noted. This did indeed help me find more errors.


Best regards,
J. Neuschäfer

