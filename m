Return-Path: <linuxppc-dev+bounces-6029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74765A2EB13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 12:31:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys2Tk5mVYz3029;
	Mon, 10 Feb 2025 22:31:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739187098;
	cv=none; b=buri58TGebrk9HGI0LNm6sb537FpsMLcnGfJuZvtK48BiPIEFusYJBJnBwb7Wa/43BllGhJjl21Z6hkqEMSjOOSyoQWc5elRjZEI65h7NYsKJmae8udhulgJ5Upht7vJPdCC7s5nLHyARpZrFj+P1hzuQRSwZDmezWzrjE6WbrBQXzCzMfT3yA/0PISi7nJNa1nudgR/O0c/Zt6QLpsPeImUC5p3GPeFRCNASV7KlihR6exZJPu8bGSTKPXwXcKEdedY8JeYne6x8umcRDDAJxlLRptsKdGRESDIKDe+dAQiD0gHAgnEizNChiUXX0AHkfS4N+Vxx8bptxuZ+XugYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739187098; c=relaxed/relaxed;
	bh=Ahlhsq8bQvnhISBDDDmEiNLcPKsCBS0wyfDTNXh6RTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PehqvQ6HLokqyF6RWrtREEU6dLHPMbpTPeXadwKsScjfMflfyqUlu+1Etx63x0kFC6zglEFWUEJ5oEihnG5lVYq1M4m4agfmh0hcLUxFm5yOSeRD9e8B9E0I0dxPP6EZwbHyAV70e2pN8528kFHz1W016tH1pdxUPMVTXHIW8pjuYvGOczsJbsXv5LY2KeAjbxQSlvUhk+dm5f2z1W5w5BCZ01kQgE/KUOqnd5/fSII7imZEZNpz45nbhGetBC2gNqYv8BksV12H08t571JZkISRyI9haWVJmQVln5cUwLPup+/rDbKbSQ4Ji28VQTo8gf8kKRkPuvwVEdmOtFO4TA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=JpmWN1g6; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=JpmWN1g6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys2Tf4pYjz300g
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 22:31:32 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id C9AE9240028
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 12:31:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739187085; bh=JF/n15lnAm7NZMFbEUTi4J8f8m2TQ7lxj7+v1eHdIuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=JpmWN1g6e9WQyrXQ7YqKa6Kz7YaEDYolPFawuJollCAzXyAykqbJGoZ+zalrhTLl8
	 0f20eLO/gb+kGMQG2fH5TKmJEFrqGaN6UwBOAyyTSCiSuA57Gfh1FfJR75F2BTuW7Y
	 /y2wCp2bUoNfwe8q67lwJI2tleg3YW+PS4g+S57IUQyxrG6AeC8sx71dc9aXf0Q5rE
	 ikLvW6yzzw4cRkk6JOrSz2ttcOw/XLuzsx6rsHe0z0p6E3OCWI5L8kDFa14iqPeDcP
	 /xijkoq/1z1YJJwTE3M4e6n7DlQEG+y3BB99cR2HqY4pCUnD30XDSw+fWIzzAOuBpH
	 CY8rACCyyxnAw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ys2TK4ysMz6tw3;
	Mon, 10 Feb 2025 12:31:17 +0100 (CET)
Date: Mon, 10 Feb 2025 11:31:01 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Crystal Wood <oss@buserror.net>
Cc: j.ne@posteo.net, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
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
	linux-mtd@lists.infradead.org, Li Yang <leoyang.li@nxp.com>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
Message-ID: <Z6njdeo8kHw6RtYH@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <Z6kQpuQf5m-bXTyt@buserror.net>
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
In-Reply-To: <Z6kQpuQf5m-bXTyt@buserror.net>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Feb 09, 2025 at 02:31:34PM -0600, Crystal Wood wrote:
> On Fri, Feb 07, 2025 at 10:30:26PM +0100, J. Neuschäfer via B4 Relay wrote:
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > Convert the Freescale localbus controller bindings from text form to
> > YAML. The updated list of compatible strings reflects current usage
> > in arch/powerpc/boot/dts/, except that many existing device trees
> > erroneously specify "simple-bus" in addition to fsl,*elbc.
> > 
> > Changes compared to the txt version:
> >  - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
> >    appears in this example and nowhere else
> >  - added a new example with NAND flash
> >  - updated list of compatible strings
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > 
> > V2:
> > - fix order of properties in examples, according to dts coding style
> > - move to Documentation/devicetree/bindings/memory-controllers
> > - clarify the commit message a tiny bit
> > - remove unnecessary multiline markers (|)
> > - define address format in patternProperties
> > - trim subject line (remove "binding")
> > - remove use of "simple-bus", because it's technically incorrect
> 
> While I admit I haven't been following recent developments in this area,
> as someone who was involved when "simple-bus" was created (and was on the
> ePAPR committee that standardized it) I'm surprised to hear simple-bus
> being called "erroneous" or "technically incorrect" here.

It is quite possible that my understanding of it is incomplete or wrong.

> 
> For non-NAND devices this bus generally meets the definition of "an
> internal I/O bus that cannot be probed for devices" where "devices on the
> bus can be accessed directly without additional configuration
> required".  NAND flash is an exception, but those devices have
> compatibles that are specific to the bus controller.
> 
> The fact that the address encoding is non-linear is irrelevant; the
> addresses can still be translated using the standard "ranges" mechanism. 
> This seems to be a disconnect between the schema verification and the way
> the compatible has previously been defined and used.

This is what led me to my assumptions: The simple-bus validation logic
in dtc complains about unit addresses such as nand@1,0 which are quite
appropriate for the eLBC.

> 
> And as a practical matter, unless I'm missing something (which I might be
> since I haven't been in devicetree-land for nearly a decade), Linux is
> relying on simple-bus to probe these devices.  There is a driver that
> binds to the bus itself but that is just for error interrupts and NAND.

As of now, yes, that's correct. Without simple-bus, a current Linux
kernel doesn't find the device nodes inside such a localbus.

> 
> You'd probably need something like commit 3e25f800afb82bd9e5f8 ("memory:
> fsl_ifc: populate child devices without relying on simple-bus") and the 
> subsequent fix in dd8adc713b1656 ("memory: fsl_ifc: populate child
> nodes of buses and mfd devices")...

I have prepared such a patch, based on the same assumptions:

  [PATCH] powerpc/fsl_lbc: Explicitly populate bus
  https://lore.kernel.org/lkml/20250209-localbus-v1-1-efcd780153a0@posteo.net/

> 
> I'm curious what the reasoning was for removing simple-bus from IFC.  It
> seems that the schema verification also played a role in that:
> https://www.spinics.net/lists/devicetree/msg220418.html

Yes, that's the same as my reasoning.

> 
> ...but there's also the comment in 985ede63a045eabf3f9d ("dt-bindings:
> memory: fsl: convert ifc binding to yaml schema") that "this will help to
> enforce the correct probe order between parent device and child devices",
> but was that really not already guaranteed by the parent/child
> relationship (and again, it should only really matter for NAND except for
> the possibility of missing error reports during early boot)?

I'm inclined to agree with you, but it's somewhat beyond my skill level.

I'll let Li Yang or Rob Herring comment on that.

> 
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,mpc8313-elbc
> > +              - fsl,mpc8315-elbc
> > +              - fsl,mpc8377-elbc
> > +              - fsl,mpc8378-elbc
> > +              - fsl,mpc8379-elbc
> > +              - fsl,mpc8536-elbc
> > +              - fsl,mpc8569-elbc
> > +              - fsl,mpc8572-elbc
> > +              - fsl,p1020-elbc
> > +              - fsl,p1021-elbc
> > +              - fsl,p1023-elbc
> > +              - fsl,p2020-elbc
> > +              - fsl,p2041-elbc
> > +              - fsl,p3041-elbc
> > +              - fsl,p4080-elbc
> > +              - fsl,p5020-elbc
> > +              - fsl,p5040-elbc
> > +          - const: fsl,elbc
> 
> Is it really necessary to list every single chip?
> 
> And then it would need to be updated when new ones came out?  I know this
> particular line of chips is not going to see any new members at this
> point, but as far as the general approach goes...

As far as I'm aware, this reflects common practice today.

> 
> Does the schema validation complain if it sees an extra compatible it
> doesn't recognize?  If so that's obnoxious.

Yes.

> 
> > +examples:
> > +  - |
> > +    localbus@f0010100 {
> > +        compatible = "fsl,mpc8272-localbus",
> > +                     "fsl,pq2-localbus";
> > +        reg = <0xf0010100 0x40>;
> > +        ranges = <0x0 0x0 0xfe000000 0x02000000
> > +                  0x1 0x0 0xf4500000 0x00008000
> > +                  0x2 0x0 0xfd810000 0x00010000>;
> > +        #address-cells = <2>;
> > +        #size-cells = <1>;
> > +
> > +        flash@0,0 {
> > +            compatible = "jedec-flash";
> > +            reg = <0x0 0x0 0x2000000>;
> > +            bank-width = <4>;
> > +            device-width = <1>;
> > +        };
> > +
> > +        simple-periph@2,0 {
> > +            compatible = "fsl,elbc-gpcm-uio";
> > +            reg = <0x2 0x0 0x10000>;
> > +            elbc-gpcm-br = <0xfd810800>;
> > +            elbc-gpcm-or = <0xffff09f7>;
> > +        };
> 
> I know this isn't new, but... since we're using this as an example,
> where is the documentation for this fsl,elbc-gpcm-uio and
> elbc-gpcm-br/or?  What exactly is a simple-periph?

fsl,elbc-gpcm-uio is handled in the following patch
(dt-bindings: memory-controllers: Add fsl,elbc-gpcm-uio).

simple-periph is something I haven't thought about, because this whole
example comes from the old txt-format binding. The whole purpose of
fsl,elbc-gpcm-uio is to allow userspace drivers to interact with
localbus devices, so that doesn't make the intention any clearer, either.

> 
> There are no in-tree device trees that use this either.  The bcsr
> node was actually a much more normal example, despite that particular
> platform having been removed.  There are other bcsr nodes that still
> exist that could be used instead.

Ah, fsl,mpc8568mds-bcsr for example, good point. I'll add it back.

> 
> -Crystal

Thank you for reaching out!

Best regards,
J. Neuschäfer

