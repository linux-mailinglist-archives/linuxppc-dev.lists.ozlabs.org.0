Return-Path: <linuxppc-dev+bounces-6189-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A089A35DB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 13:36:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvWk96NrHz3blT;
	Fri, 14 Feb 2025 23:36:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739536561;
	cv=none; b=BbegJ1/29owaXjE8V2VejeKge/dAhapbjLMpzyJBkQEMQjNEKcaQxknF1V8V87994A6d8KLfS9x7sOCkOrJudaLIHh/qVyai/MyUJQpe4jEUBzJJPkrH7dSTVX7fd4/NNcmXGXwDU6VNroqnDyfQezOz7oyge8wyR0Ks0Ax0Xeidb8pJrU7zaQ2ivfVWVmLPmUGkrseVCJmctNfFzl8nHrDeaAHIQhonbxhoC+qxHX0HCvL4wlsDq/VkQKu6ugjMBsHSV25FZkbDZbuHfAQmy9Z1JQnYdkpC7vaWwfse/z+Ge/90TjQprbFFS65RfUapQFRDVmTJPJV6Ii7UDNBvew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739536561; c=relaxed/relaxed;
	bh=WpqZQqP8YUHbi3tkjOqTUFQ2WXaAQNg9Ucs0Z4dPMDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNQqTb7xIxvHV8IXO56qafPnxDZhrWLL6585mYSxbUqtAHs53RS9zvTieO2goGa9oyoo9j6ccLLE/F7LJAqVACq/bxstZIWYMBOqP65NEIqS5yB1HiSupB4V8X7X9bhVndVDW32xJ1gXdqjg20c6GdFSJc5l1Q20Dyxb9QisIgmtQSCAAp17np4TvrDryK+Kt+fq51J7UtziUas+JNcFqHOQ/XX8Vc+/bX/6h7DRR5u4QtinFI8pI7UPwEioEOP4pFici+681i+EYg7wnwRWYY2Npc2+uc6v43yWPFoOyEmPFFlyD+mo64Yw6wm/48DIo1HS7T4Ir16jj7TRQZGBQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=GPFoCbPM; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=GPFoCbPM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvWk73stQz309v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 23:35:57 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 17765240101
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 13:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739536550; bh=DhdTMX1B/VBmrfjg4gCD28dH1z0ZeJtuCVVqdYJtLzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=GPFoCbPMdVQTIokjgL474jofn1bmBFscmSoe8+kxWm5ko43fhMHtoJPqN2d9BIlXA
	 dwHbP/kKZO9sJvqO6HVDajQNNQfx+akrH829Wf+wle4YXXiIpEmGGBjZllq8isQIhG
	 9kT8097Rx9EkU5r3oG8wECEu51TaV1ElDAbMrn6BGm+NKWOci+4vgipWP0Krzpuojb
	 d/qJ2NJEOXHLyg+vmBc72wvWhI0SG8h1wuwO21Lxsc4vJ00/3Usj/XftI/L63HBDaK
	 kezRT9NGqPebT3yNBbINZOUu2f5wZHA7xI21Rp55wodaW11/AqqsqycjHtqd+N3VMa
	 ATrufniylyoZg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YvWjq1cxCz9rxG;
	Fri, 14 Feb 2025 13:35:41 +0100 (CET)
Date: Fri, 14 Feb 2025 12:35:41 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Frank Li <Frank.li@nxp.com>
Cc: j.ne@posteo.net, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
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
Subject: Re: [PATCH v2 05/12] dt-bindings: dma: Convert fsl,elo*-dma to YAML
Message-ID: <Z684nUnDX4Sb98rQ@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
 <Z6pV4eauZj75+911@lizhi-Precision-Tower-5810>
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
In-Reply-To: <Z6pV4eauZj75+911@lizhi-Precision-Tower-5810>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 10, 2025 at 02:39:13PM -0500, Frank Li wrote:
> On Fri, Feb 07, 2025 at 10:30:22PM +0100, J. Neuschäfer via B4 Relay wrote:
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> >
> > The devicetree bindings for Freescale DMA engines have so far existed as
> > a text file. This patch converts them to YAML, and specifies all the
> > compatible strings currently in use in arch/powerpc/boot/dts.
> >
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >
> > V2:
> > - remove unnecessary multiline markers
> > - fix additionalProperties to always be false
> > - add description/maxItems to interrupts
> > - add missing #address-cells/#size-cells properties
> > - convert "Note on DMA channel compatible properties" to YAML by listing
> >   fsl,ssi-dma-channel as a valid compatible value
> > - fix property ordering in examples: compatible and reg come first
> > - add missing newlines in examples
> > - trim subject line (remove "bindings")
> > ---
> >  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 140 ++++++++++++++
> >  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 123 +++++++++++++
> >  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 134 ++++++++++++++
> >  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
> >  4 files changed, 397 insertions(+), 204 deletions(-)
[...]
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      DMA General Status Register, i.e. DGSR which contains status for
> > +      all the 4 DMA channels.
> 
> needn't maxItems
> items:
>   - description: DMA ...

Good point, I'll do that.

> 
> > +
> > +  cell-index:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Controller index. 0 for controller @ 0x8100.
> > +
> > +  ranges: true
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: Controller interrupt.
> 
> Needn't description because no any additional informaiton.

True.

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
[...]
> > +additionalProperties: false
> 
> Need ref to dma-common.yaml?

Sounds good, but I'm not sure what to do about the #dma-cells property,
which is required by dma-common.yaml.

There aren't many examples of DMA channels being explicitly declared in
device trees. One example that I could find is the the xilinx_dma.txt
binding:


	axi_vdma_0: axivdma@40030000 {
		compatible = "xlnx,axi-vdma-1.00.a";
		#dma_cells = <1>;
		reg = < 0x40030000 0x10000 >;
		dma-ranges = <0x00000000 0x00000000 0x40000000>;
		xlnx,num-fstores = <0x8>;
		xlnx,flush-fsync = <0x1>;
		xlnx,addrwidth = <0x20>;
		clocks = <&clk 0>, <&clk 1>, <&clk 2>, <&clk 3>, <&clk 4>;
		clock-names = "s_axi_lite_aclk", "m_axi_mm2s_aclk", "m_axi_s2mm_aclk",
			      "m_axis_mm2s_aclk", "s_axis_s2mm_aclk";
		dma-channel@40030000 {
			compatible = "xlnx,axi-vdma-mm2s-channel";
			interrupts = < 0 54 4 >;
			xlnx,datawidth = <0x40>;
		};
		dma-channel@40030030 {
			compatible = "xlnx,axi-vdma-s2mm-channel";
			interrupts = < 0 53 4 >;
			xlnx,datawidth = <0x40>;
		};
	};

	...

	vdmatest_0: vdmatest@0 {
		compatible ="xlnx,axi-vdma-test-1.00.a";
		dmas = <&axi_vdma_0 0
			&axi_vdma_0 1>;
		dma-names = "vdma0", "vdma1";
	};

It has #dma_cells (I'm sure #dma-cells was intended) on the controller.


Another example is in arch/powerpc/boot/dts/fsl/p1022si-post.dtsi:

	dma@c300 {
		dma00: dma-channel@0 {
			compatible = "fsl,ssi-dma-channel";
		};
		dma01: dma-channel@80 {
			compatible = "fsl,ssi-dma-channel";
		};
	};

	...

	ssi@15000 {
		compatible = "fsl,mpc8610-ssi";
		cell-index = <0>;
		reg = <0x15000 0x100>;
		interrupts = <75 2 0 0>;
		fsl,playback-dma = <&dma00>;
		fsl,capture-dma = <&dma01>;
		fsl,fifo-depth = <15>;
	};


There, the DMA channels are used directly and without additional
information (i.e. #dma-cells = <0>, althought it isn't specified).


> > +        dma-channel@0 {
> > +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> > +            reg = <0 0x80>;
> > +            cell-index = <0>;
> > +            interrupt-parent = <&ipic>;
> > +            interrupts = <71 8>;
> 
> '8',  use predefine MACRO for irq type.

Good catch, will do

> 
> Frank

Thanks for your review!
J. Neuschäfer

