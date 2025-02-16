Return-Path: <linuxppc-dev+bounces-6218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE237A37556
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2025 17:00:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ywr8x2Bt9z2xQ8;
	Mon, 17 Feb 2025 03:00:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739721617;
	cv=none; b=QMLrjqRXtoHv/s8yXNS87VBAywTIHreB0kn01Y9Hi6MZLkp55fsQcgiA7pHWR4rMipC30LHluYoqYPdOWYZQ41gxYrTzfvr1Ie/FzWduoVejlFSn94gs4ifu50EcNPNn+5qNRgd/RaNYWvpj08YVdnZKOoH/ekjdXNzd8uj+hdKcZ9YbOmBEpaI89qkpdBIJCP/I+NFAR3Wjxgs+xd8KBTZ1ZzoMWp3T7FNItHeJjVsMYjURDRj3rvsq0WzaHax2bPsx8LUstd/MKxDzSlrBeP1o3OC8bG2USjYW/9YECZYcmVMNevta39ZDoyZUDi3w+wLGD2TttUcwljradyDqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739721617; c=relaxed/relaxed;
	bh=U4Hpvn/puGC7pLf7h/gsjiJvZ/EPgviBoavaLq4rqj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTSf2pREInWUSPtpnNgtnow2h06JzsVzDsm+0BbK05kPlH99WW68BbngIM0Y1PRgIJNyez34/mzuJOmh1Voy5yvSCVPQUrO6ojS9HntrJVVFwuVGSGPnMZizXFfoZlWDqPjemwbjrXuhuA0FrvTFAKGs+UhTwylA8BM8mhvKeLY2kBG6o30xIxBTr0jTvtQWVij0BwEgkUNey2I5/cxfg4PKHQNCc4moVYB8qs361KOs5TUsNn6n2W8igotWvcykmuB8xx22qNcUfrwAvcqyZuLNFqpYvKmtvINzxRb0rMiT0mQndO4EPD7WmLU/5SiGVlihwkadQfkbzFMKCUokVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=lo5x3VWI; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=lo5x3VWI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ywr8t5Z4Cz2xGp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 03:00:13 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 21347240101
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2025 17:00:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739721605; bh=EF26j1suwLuBzziUeMgwWp0X8x4RpIgeD8Jxuuo4ULs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=lo5x3VWIhi8sKEvyrajrRfqSD+ZmAX6jHeV4EBj5EdAhxjQn8VPKOx2I6wvg2Fb+O
	 CaRc/K5p2vQnqZa8Y5URg4/Gi7Y7A/Cmn69DYFx+UuP5RFASqmPUlUYFDoUqZzWt7S
	 oLt/qqd6HGTwfyW3vWq+4n8jM4zkUMLjnMyLd+rfGXV+HEz3atsSNtnZH9HQ/NAtvl
	 2NsOCAZ7MNNzAjClL6pPW6Y5eXLnco3JwxXyXEIJFyICKG0rqucN2a+5SYckcIF07c
	 ADgg4mbURCw+qsn9+KFVJuXnwUekdHSM2TwW/qYXbKcnpjG5eRQ/hqFFNC+RDqEZhF
	 ZVlJCxaSlGXHA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ywr8V6Vlfz9rxW;
	Sun, 16 Feb 2025 16:59:54 +0100 (CET)
Date: Sun, 16 Feb 2025 15:59:54 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: Crystal Wood <oss@buserror.net>, j.ne@posteo.net,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
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
	linux-mtd@lists.infradead.org, Li Yang <leoyang.li@nxp.com>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
Message-ID: <Z7ILej_AJYot_wKP@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <Z6kQpuQf5m-bXTyt@buserror.net>
 <20250210215324.GA1040564-robh@kernel.org>
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
In-Reply-To: <20250210215324.GA1040564-robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 10, 2025 at 03:53:24PM -0600, Rob Herring wrote:
> On Sun, Feb 09, 2025 at 02:31:34PM -0600, Crystal Wood wrote:
> > On Fri, Feb 07, 2025 at 10:30:26PM +0100, J. Neuschäfer via B4 Relay wrote:
> > > From: "J. Neuschäfer" <j.ne@posteo.net>
> > > 
> > > Convert the Freescale localbus controller bindings from text form to
> > > YAML. The updated list of compatible strings reflects current usage
> > > in arch/powerpc/boot/dts/, except that many existing device trees
> > > erroneously specify "simple-bus" in addition to fsl,*elbc.
> > > 
> > > Changes compared to the txt version:
> > >  - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
> > >    appears in this example and nowhere else
> > >  - added a new example with NAND flash
> > >  - updated list of compatible strings
> > > 
> > > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > > ---
> > > 
> > > V2:
> > > - fix order of properties in examples, according to dts coding style
> > > - move to Documentation/devicetree/bindings/memory-controllers
> > > - clarify the commit message a tiny bit
> > > - remove unnecessary multiline markers (|)
> > > - define address format in patternProperties
> > > - trim subject line (remove "binding")
> > > - remove use of "simple-bus", because it's technically incorrect
> > 
> > While I admit I haven't been following recent developments in this area,
> > as someone who was involved when "simple-bus" was created (and was on the
> > ePAPR committee that standardized it) I'm surprised to hear simple-bus
> > being called "erroneous" or "technically incorrect" here.
> 
> Erroneous because the binding did not say "simple-bus" was used. Not 
> uncommon with the old .txt bindings.
> 
> Generally, if a bus has control registers or resources like clocks, then 
> we tend not to call them 'simple-bus'. And '"specific-bus", 
> "simple-bus"' gives some problems around what driver if any do you 
> bind to. 
[...]
> > You'd probably need something like commit 3e25f800afb82bd9e5f8 ("memory:
> > fsl_ifc: populate child devices without relying on simple-bus") and the 
> > subsequent fix in dd8adc713b1656 ("memory: fsl_ifc: populate child
> > nodes of buses and mfd devices")...
> > 
> > I'm curious what the reasoning was for removing simple-bus from IFC.  It
> > seems that the schema verification also played a role in that:
> > https://www.spinics.net/lists/devicetree/msg220418.html
> 
> If a kernel change is needed to support changed .dts files, then we 
> shouldn't be doing that here (being mature platforms). That would mean 
> new DTB will not work with existing kernels.

Alright, I'll keep simple-bus in the eLBC binding for historical
compatibility.


Thank you both for your discussion.


J. Neuschäfer

