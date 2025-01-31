Return-Path: <linuxppc-dev+bounces-5745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3952EA23DAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 13:23:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ykw655PBdz30Vm;
	Fri, 31 Jan 2025 23:23:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738326205;
	cv=none; b=iZfMJnMKAUzhCMAOiXPBGrdt0qn3UCR1NfPF5V2O+wI9jf8C9HjmXv522k0xdPKJmoNG3YZElhLqT5B76gchy/DSSlR0ITFfd/UjbfUXUMcOG1caUD7zMqI9SgDBQgy6jXQHdq0ynca9g7hXX/cqV5ozo0xT2Lplo5sEV8ci2suNp3ypdV1LY4ywIfVTRGHMSiDXFXo5URdgNhVmIxOpWahQvKO8aSIK0BVUBN57nA7tdkprUxWMWgGicLCeFAbKBribdQ9USTd4k1RgmDRN9hclhg2QabSKn2xmk03VzvgBHWhu6j55ySECbdrkgymOQGt6xiLojRwbKhZftrvcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738326205; c=relaxed/relaxed;
	bh=CVrmTJqjbFMs57opB2+oT/VZnnL0V528B4LGKZGKziM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkiBbI9xHDJZDm6x+KoeuZWJULfeav7juNdM/W1IIltuckTEianCl71IqEcAJiTWdoaP7fClcMFHf3vm4+AeUb5HViRv933rqF0HScXvuIM99Zlz+PaEUIiSUmxZeXBOfpAAKz9O+N9XC6n2QY009+CK3sEstUcSs1UeI6b4wZpmsw/GY08v1pxyHfQJUvVW6kZxmBF8xvqOa5HD67FDats7jo8MNdJ+XhDmJs5tAPouF/+YomJNS8THVSlvcs6NSifI0FrA+05m5d3S3oRUr9TOd6b5zf7hIHpmPpuUtOW5jPw8XhR6MSbUvBqvXCIshEhyQbG3r+ERFkryEHYIbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=ZH/QrR6C; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=ZH/QrR6C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ykw626KK8z30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 23:23:20 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D8887240101
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 13:23:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738326192; bh=2qfaRTO5iG5mOYJ+RvO6+d2r0hfl5IUM+PXTysg9LQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=ZH/QrR6CDzrfRyOcDdDH1yAPCkywXurHgOK68RDcFhhdhoq8xD44Fh+6uUGh+dwWw
	 UBOzkZwnU3ddtLRTeU9gq3Ro9Pye5t/VIvS47EuiR6p52UR5Egh3g+CwT4bretriRL
	 9P1/U02bGR2CHxLzixwpkWxHjV7Zcn5ENGNT8IMCsYNGV7EkvrLpD208SD1pV3iCbJ
	 YJpiFVWgIAxaRW3ZJfEeJKJ2G+bPdrPU3tXn5FZ2drudvcOkXIkQH7TlekHEnIB4sg
	 LdJzUnEBnSD/51ERodPs5mvutRoWmEeP0pN0ROgbkERvi/mrMIgITeGplhnDse7Plf
	 4sz+RCqcxm1yg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ykw5h1ywDz6typ;
	Fri, 31 Jan 2025 13:23:03 +0100 (CET)
Date: Fri, 31 Jan 2025 12:23:03 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: j.ne@posteo.net, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
Subject: Re: [PATCH 2/9] dt-bindings: ata: Convert fsl,pq-sata binding to YAML
Message-ID: <Z5zAp3X7U0oftneH@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-2-50649f51c3dd@posteo.net>
 <a9df1ae6-8779-4dc0-8f03-eda939c0e533@kernel.org>
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
In-Reply-To: <a9df1ae6-8779-4dc0-8f03-eda939c0e533@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 27, 2025 at 08:22:55AM +0900, Damien Le Moal wrote:
> On 1/27/25 03:58, J. Neuschäfer via B4 Relay wrote:
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > Convert the Freescale PowerQUICC SATA controller binding from text form
> > to YAML. The list of compatible strings reflects current usage.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >  .../devicetree/bindings/ata/fsl,pq-sata.yaml       | 59 ++++++++++++++++++++++
[...]
> > +description: |
> > +  SATA nodes are defined to describe on-chip Serial ATA controllers.
> > +  Each SATA port should have its own node.
> 
> Very unclear. The SATA nodes define ports or controllers ? Normally, a single
> controller can have multiple ports, so the distinction is important.

I'll change it to "Each SATA controller ...", see below.


> > +  cell-index:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2, 3, 4]
> > +    description: |
> > +      1 for controller @ 0x18000
> > +      2 for controller @ 0x19000
> > +      3 for controller @ 0x1a000
> > +      4 for controller @ 0x1b000
> 
> Are you sure these are different controllers ? Are they not different ports of
> the same controller ? Given that the previous text description define this as
> "controller index", I suspect these are the port offsets and you SATA nodes
> define ports, and not controllers.

They have no shared registers, and each instance has the same register
set (at a different base address).

The MPC8315E reference manual (for example) documents them as:

	SATA 1 Controller—Block Base Address 0x1_8000
	SATA 2 Controller—Block Base Address 0x1_9000

(table A.24 Serial ATA (SATA) Controller)

Section 15.2 Command Operation implies that each SATA controller
supports a single port:

	The SATA controller maintains a queue consisting of up to 16
	commands. These commands can be distributed to a single attached
	device or, if the system contains a port multiplier, over each
	of the attached devices.

So, in conclusion, I'm fairly sure "controller" is the right description.


Best regards,
J. Neuschäfer

