Return-Path: <linuxppc-dev+bounces-6463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BFCA43FBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 13:54:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2Hcj0xHHz30TS;
	Tue, 25 Feb 2025 23:54:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740488085;
	cv=none; b=Hq6KZEIsWyIZX2/IyaU5u42SqxOU0pAqX8p/ysQMwfQeIrUX57oACoHDCNohd+x6OEs/HUvjB0qga9DzP/60Q0iS1oZh12cIgGAalWQsl2vR4QQlmFIEpWSkYr+xm+McMPTgTketUE8zIIhKizCaZxRW4A+7kgEEESQbK1QUzQtKcGxQ7Aj6WULoLSn4VgDLsGKrZcNeoqloTJrNQvPyBXN+sMk7zjUVCOdHqQmMwWvazmpMuWs79MSJSjYFjs/Ik+0saXwX7a585E0hWKLf9pkLgFehQMqV80GwZTze+K4mt3D4YIryr50L1eJcsYMcC7XH7OiqCeM4hNCFN7DUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740488085; c=relaxed/relaxed;
	bh=pFuwJmEq0UuYCY8D1iYG23zqGHJEmvzVdSvGe2LLkKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWQ1M7UDGj83VJu08O0iw1PAfjvO4MVp380yddH9rnmKoQVG49B1xpz+2QlY7n8DTwoW7IsBmTcTrok0VF9t54C9Cd9GiWMG4UP24OC3W3DNNr7x2C60gnf95TP+jqlOmWDILzCTELap1flzNFHisRJRU+uV4sfeHfKkvPk/3blgnO/uVETv4HwTeOcZ4h59NnFZ7RorWbYRdtoCEzOg5aQ4MiamPWXhSn2HJFBkocvxUyuo+SvpR/Yu2F1YnBIvAyLSSfY+CosLdFLlo8eiIr24XFJGdB59n0tMnfiDYKDJ6y1GpOMD0fHL/Ww3oaeAHnuQKmRGprYcVeGwJXYI7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=mjILcAIk; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=mjILcAIk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2Hcf4mkqz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 23:54:40 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D83C5240101
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 13:54:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1740488073; bh=W8LIqF7kkH6cCLj3gN0Tz1ix7jTva4xQTCeEx72fA+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=mjILcAIkXqzqNKdVJx8aNZciCsFDMgWk1hSEOtkfGbO6HFVdhu5Vy04vupoKrYvbv
	 c6on3zliqSDojlPicjEIhjGdw22NRnh01nANE/3jRMwtf45rqgaGqjBEPbDvvOZQgg
	 s4Jb6KbceFTD97AcdgGFKHeQkXDlrBbwG3iChrbmjhflZJIT8e5l8aV2shsyZ4sXKo
	 6ofVmK+sYqzNywRiys2+yrDszLO59sxgwWTEXz+wqj0Y8Kj8BPrm6dHb8ttxz+aByz
	 WtF5CLyU4itMYTueMHGswR3Km+h6T3R2kOXkZBOleO2kFLusG00NHpXaxrg6YwUFTp
	 3ou6TTWtB7XpA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Z2HcG3WCTz9rxG;
	Tue, 25 Feb 2025 13:54:21 +0100 (CET)
Date: Tue, 25 Feb 2025 12:54:21 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Frank Li <Frank.li@nxp.com>, devicetree@vger.kernel.org,
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
Message-ID: <Z729fRBNLAxdYD22@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
 <Z6pV4eauZj75+911@lizhi-Precision-Tower-5810>
 <Z684nUnDX4Sb98rQ@probook>
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
In-Reply-To: <Z684nUnDX4Sb98rQ@probook>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 14, 2025 at 12:35:41PM +0000, J. Neuschäfer wrote:
> On Mon, Feb 10, 2025 at 02:39:13PM -0500, Frank Li wrote:
> > On Fri, Feb 07, 2025 at 10:30:22PM +0100, J. Neuschäfer via B4 Relay wrote:
> > > From: "J. Neuschäfer" <j.ne@posteo.net>
> > >
> > > The devicetree bindings for Freescale DMA engines have so far existed as
> > > a text file. This patch converts them to YAML, and specifies all the
> > > compatible strings currently in use in arch/powerpc/boot/dts.
> > >
> > > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > > ---
[...]
> > Need ref to dma-common.yaml?
> 
> Sounds good, but I'm not sure what to do about the #dma-cells property,
> which is required by dma-common.yaml.
> 
> There aren't many examples of DMA channels being explicitly declared in
> device trees. One example that I could find is the the xilinx_dma.txt
> binding:
> 
> 
> 	axi_vdma_0: axivdma@40030000 {
> 		compatible = "xlnx,axi-vdma-1.00.a";
> 		#dma_cells = <1>;
> 		reg = < 0x40030000 0x10000 >;
> 		dma-ranges = <0x00000000 0x00000000 0x40000000>;
> 		xlnx,num-fstores = <0x8>;
> 		xlnx,flush-fsync = <0x1>;
> 		xlnx,addrwidth = <0x20>;
> 		clocks = <&clk 0>, <&clk 1>, <&clk 2>, <&clk 3>, <&clk 4>;
> 		clock-names = "s_axi_lite_aclk", "m_axi_mm2s_aclk", "m_axi_s2mm_aclk",
> 			      "m_axis_mm2s_aclk", "s_axis_s2mm_aclk";
> 		dma-channel@40030000 {
> 			compatible = "xlnx,axi-vdma-mm2s-channel";
> 			interrupts = < 0 54 4 >;
> 			xlnx,datawidth = <0x40>;
> 		};
> 		dma-channel@40030030 {
> 			compatible = "xlnx,axi-vdma-s2mm-channel";
> 			interrupts = < 0 53 4 >;
> 			xlnx,datawidth = <0x40>;
> 		};
> 	};
> 
> 	...
> 
> 	vdmatest_0: vdmatest@0 {
> 		compatible ="xlnx,axi-vdma-test-1.00.a";
> 		dmas = <&axi_vdma_0 0
> 			&axi_vdma_0 1>;
> 		dma-names = "vdma0", "vdma1";
> 	};
> 
> It has #dma_cells (I'm sure #dma-cells was intended) on the controller.
> 
> 
> Another example is in arch/powerpc/boot/dts/fsl/p1022si-post.dtsi:
> 
> 	dma@c300 {
> 		dma00: dma-channel@0 {
> 			compatible = "fsl,ssi-dma-channel";
> 		};
> 		dma01: dma-channel@80 {
> 			compatible = "fsl,ssi-dma-channel";
> 		};
> 	};
> 
> 	...
> 
> 	ssi@15000 {
> 		compatible = "fsl,mpc8610-ssi";
> 		cell-index = <0>;
> 		reg = <0x15000 0x100>;
> 		interrupts = <75 2 0 0>;
> 		fsl,playback-dma = <&dma00>;
> 		fsl,capture-dma = <&dma01>;
> 		fsl,fifo-depth = <15>;
> 	};
> 
> 
> There, the DMA channels are used directly and without additional
> information (i.e. #dma-cells = <0>, althought it isn't specified).

I had another look at dma-common.yaml and it explicitly requires
#dma-cells to have a value of at least 1, so this second idea won't
work.


Best regards,
J. Neuschäfer

