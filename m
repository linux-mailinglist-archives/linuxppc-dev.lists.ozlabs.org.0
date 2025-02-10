Return-Path: <linuxppc-dev+bounces-6064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3117A2FBF6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 22:25:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsHfb63F9z2xtt;
	Tue, 11 Feb 2025 08:25:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739222711;
	cv=none; b=QB84dGK4fxf6YqcMYE/qBqLUtmipPJqFcZUt9htqzzk0oAYQuDrLNBNoVbwriS1tLkBjpP+5ARNLAZqqqnf3v7b9k4NTAJFhijtyrN9PkTu1bi36PnDUew3ASQ0LjnDWjSjDUcEYC+386/CTLmS9s65hQ1mQPXChxeO4a0AYciShMMWovIJAQw5nariPjwDiK/+G0hKvRTgeuvzBkNQscC5IXX1LGZPNQea3PQLDqVnb/X0fKitcI9nB2SrbBJgcK9l66uZXgnmhNUgxOk2mV6rFFAe+PZiw+GNVH7+7UhZSmlEFJfsbFYLq8Ju1pb6iN2GYZwLdtU7cM/NrPPZQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739222711; c=relaxed/relaxed;
	bh=YrgLScithzoMfxgjJAM56hBDFdzel67DP5zRb4nc8Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrNSOzUfYvnUpKd6KRumx/YtyvNwMLKMHQr04w4Y7xZm1ZnkhylJaC00/23zU5UYuKkWqEolt5AvC6Pt2iXVq2bNjwuyZoD7R6uRqSt76QR8UA/exgpXemevn/SFrUDQDtFStK9S/UDjgLX/OIfnZniqn1bJ0AuSrXXAVydy4tD6XEVKraNXwqEuBLEKAhAbyYR9+s78vIKMaBKwWvJLscntacesSRKKtbk4vbukcJRo1xdt652okyV37d00t7y+QFqKKKYH6WFv7RtKilkYFcLPwQhv9HdSV3ZerhMUNFs6nqG4Ilu4DsVvdZHJMNPXLNO2GXrYSRbqptfdnlFXOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=okX4G/08; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=okX4G/08;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsHfZ5JTwz2xsd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 08:25:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12C99A4198C;
	Mon, 10 Feb 2025 21:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07006C4CED1;
	Mon, 10 Feb 2025 21:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739222707;
	bh=odzw75cV5CCw5F2vlG3P/t5VL3psVGoWe8Jb/yZ+oYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=okX4G/08PMaMILx+F7JidAMdoMWndseWORO9ude8E6aWFIxh17YXQ46LJnk2B5eaf
	 CsmusmqxJGdFmvFxiBt3uPj0Rk3r2oisfAITv+KHRCfLBjiL6BwomL+sTzmqCqwURA
	 l9TTcqCPGmkGodVb/N007KnsDnN5leSYWOswBK3NQ1SNmqKJnMiVqugPnYdUdoYpre
	 IF+Kyml+/75V34sBLta5+UFzTQDIfwZISfv9DJLnHSk6goxZ+SweEGrJsKADOs18/x
	 KSzQ+SLbbjMfXB81ZQ8UBYbOveDQExy9USZXdFkjmtEk9ORBlQqeTEwDSuzPL6iBCk
	 hMxOmsDQ+zv5A==
Date: Mon, 10 Feb 2025 15:25:06 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
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
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
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
Message-ID: <20250210212506.GA1036627-robh@kernel.org>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
 <Z6fxo4j5a6ro0f1w@probook>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6fxo4j5a6ro0f1w@probook>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Feb 09, 2025 at 12:06:59AM +0000, J. Neuschäfer wrote:
> On Fri, Feb 07, 2025 at 10:30:23PM +0100, J. Neuschäfer via B4 Relay wrote:
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > Formalise the binding for the PCI controllers in the Freescale MPC8xxx
> > chip family. Information about PCI-X-specific properties was taken from
> > fsl,pci.txt. The examples were taken from mpc8315erdb.dts and
> > xpedite5200_xmon.dts.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > 
> > V2:
> > - merge fsl,pci.txt into fsl,mpc8xxx-pci.yaml
> > - regroup compatible strings, list single-item values in one enum
> > - trim subject line (remove "binding")
> > - fix property order to comply with dts coding style
> > ---
> >  .../devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml   | 115 +++++++++++++++++++++
> >  Documentation/devicetree/bindings/pci/fsl,pci.txt  |  27 -----
> >  2 files changed, 115 insertions(+), 27 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml b/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..57c5503cec47e6e90ed2b09835bfad10309db927
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale MPC83xx PCI/PCI-X/PCIe controllers
> > +
> > +description: |
> > +  Binding for the PCI/PCI-X/PCIe host bridges on MPC8xxx SoCs.
> > +  See also: Documentation/devicetree/bindings/pci/fsl,pci.txt
> 
> This is obviously a bit wrong; I ended up putting the information from
> fsl,pci.txt entirely under the fsl,pci-agent-force-enum property, but
> forgot to remove the reference to the old txt file.

Looks fine other than that.

Rob


