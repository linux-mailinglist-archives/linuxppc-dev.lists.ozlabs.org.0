Return-Path: <linuxppc-dev+bounces-6010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDBDA2E0CF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 22:18:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrgYM0Jylz2xm5;
	Mon, 10 Feb 2025 08:18:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=165.227.176.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739135910;
	cv=none; b=OdiJ3zB3VTkVLDcTcExlfo4crYLsw3s5evrbOFwEtBdyU2Jjz8Pmed0BOttXZGOWnCobwYUIjXpSfX4hkDPQWS9YUBhquNw06tc9H0WKGIYesGn0+zC38XDzbaLlwXmtS/KQmTSenz/xmFrQj0AwWYvcH+fXhJ6i/fsyItvgFUZgk69i1uLwJly0ONZHi2glhcBZOUm3RJFA5+aPGprEVcY3xXunKLyQz+jPHeeOIcJQdoYjS5dMlqcq15yfMvz+0K7pwqwIAWaO47JmWOYxJHAvfURCqbOQVLLp3v/BxV82s4hKWMa6+/Ml2I2EGqiAfERge66nsRNTuzVSqiuZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739135910; c=relaxed/relaxed;
	bh=EpToGD3dUgsdAKwVgr42gOxVA1d/S1QPZ4reqp0Dgs8=;
	h=Date:From:To:Cc:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Subject; b=NT10pVd/Z5N0vjyFay3ZIqyBTK1ZBt0R7YrxkvlVfbBX1PUTg9m9ejE745k6TArlJM0Kizt+GGdZG/aeMoPBUoOtOVY40VvSdqhwKvZ2+HPviH6kXBUysj4MSpKQugVphQ/KPrXwfhvU5uVIqYtEJ4FW2RDcR6KST/d6FIFLf9qNWX2l6muiKsCTaQq/Ltf6p3SsxbP1ihGeSEL6Aj/897ET5HAW2eG/yKuWcDgiQqVbim6etJaVHyxI9F89hS6WH9GG8mhjk8hBS2DrwjkV5YKCWP7UdsWgr5zNT0AFhVWWvqTAy94tbg34/FNexmSTv1Dv174wKipKPBiOIOjbcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=buserror.net; dkim=pass (2048-bit key; unprotected) header.d=buserror.net header.i=@buserror.net header.a=rsa-sha256 header.s=rsa_sel header.b=0UnPtkDc; dkim-atps=neutral; spf=pass (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=lists.ozlabs.org) smtp.mailfrom=buserror.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=buserror.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=buserror.net header.i=@buserror.net header.a=rsa-sha256 header.s=rsa_sel header.b=0UnPtkDc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=buserror.net (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=lists.ozlabs.org)
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrgYK3nhCz2xb3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 08:18:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=buserror.net; s=rsa_sel; h=Subject:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Cc:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EpToGD3dUgsdAKwVgr42gOxVA1d/S1QPZ4reqp0Dgs8=; b=0UnPtkDcmzDcjvHDUHyLT2CjRU
	Wu31RLzuZn8p0dV1DURWjhl+4+u/yXCjfpbN//Fv+gzr7dFxyWAIY13siJk1+2c2h7flpXKEbo5GK
	Nzb0MrDhlkKl23df30ZGunrnNmUcpvB/tY7q0jPyZACh4u0zgcDKAURgcZgDdJCfSub1blBNmf6Ye
	2sc/RnS11ATYBdxLh4TOGHrIUM868ob5a1q6cLyIoCxxUqwRzg3HVOyqHUfIDBNgC955YJewdlyOP
	VUcjGVLAyzhCUnLHWphUkyZmWKmwZrAiNhydfaGiX5Yiakntm82WcDWO+upyCLZ9SU2k3ajGLNyec
	oI4TO6mg==;
Received: from oss by baldur.buserror.net with local (Exim 4.96)
	(envelope-from <oss@buserror.net>)
	id 1thDxm-00C5Xt-1r;
	Sun, 09 Feb 2025 14:31:35 -0600
Date: Sun, 9 Feb 2025 14:31:34 -0600
From: Crystal Wood <oss@buserror.net>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
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
Message-ID: <Z6kQpuQf5m-bXTyt@buserror.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
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
In-Reply-To: <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: j.ne@posteo.net, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, krzk@kernel.org, imx@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlemoal@kernel.org, cassel@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, lee@kernel.org, vkoul@kernel.org, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, j.neuschaefer@gmx.net, wim@linux-watchdog.org, linux@roeck-us.net, broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, leoyang.li@nxp.com, john.ogness@linutronix.de
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)

On Fri, Feb 07, 2025 at 10:30:26PM +0100, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> Convert the Freescale localbus controller bindings from text form to
> YAML. The updated list of compatible strings reflects current usage
> in arch/powerpc/boot/dts/, except that many existing device trees
> erroneously specify "simple-bus" in addition to fsl,*elbc.
> 
> Changes compared to the txt version:
>  - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
>    appears in this example and nowhere else
>  - added a new example with NAND flash
>  - updated list of compatible strings
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V2:
> - fix order of properties in examples, according to dts coding style
> - move to Documentation/devicetree/bindings/memory-controllers
> - clarify the commit message a tiny bit
> - remove unnecessary multiline markers (|)
> - define address format in patternProperties
> - trim subject line (remove "binding")
> - remove use of "simple-bus", because it's technically incorrect

While I admit I haven't been following recent developments in this area,
as someone who was involved when "simple-bus" was created (and was on the
ePAPR committee that standardized it) I'm surprised to hear simple-bus
being called "erroneous" or "technically incorrect" here.

For non-NAND devices this bus generally meets the definition of "an
internal I/O bus that cannot be probed for devices" where "devices on the
bus can be accessed directly without additional configuration
required".  NAND flash is an exception, but those devices have
compatibles that are specific to the bus controller.

The fact that the address encoding is non-linear is irrelevant; the
addresses can still be translated using the standard "ranges" mechanism. 
This seems to be a disconnect between the schema verification and the way
the compatible has previously been defined and used.

And as a practical matter, unless I'm missing something (which I might be
since I haven't been in devicetree-land for nearly a decade), Linux is
relying on simple-bus to probe these devices.  There is a driver that
binds to the bus itself but that is just for error interrupts and NAND.

You'd probably need something like commit 3e25f800afb82bd9e5f8 ("memory:
fsl_ifc: populate child devices without relying on simple-bus") and the 
subsequent fix in dd8adc713b1656 ("memory: fsl_ifc: populate child
nodes of buses and mfd devices")...

I'm curious what the reasoning was for removing simple-bus from IFC.  It
seems that the schema verification also played a role in that:
https://www.spinics.net/lists/devicetree/msg220418.html

...but there's also the comment in 985ede63a045eabf3f9d ("dt-bindings:
memory: fsl: convert ifc binding to yaml schema") that "this will help to
enforce the correct probe order between parent device and child devices",
but was that really not already guaranteed by the parent/child
relationship (and again, it should only really matter for NAND except for
the possibility of missing error reports during early boot)?

> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8313-elbc
> +              - fsl,mpc8315-elbc
> +              - fsl,mpc8377-elbc
> +              - fsl,mpc8378-elbc
> +              - fsl,mpc8379-elbc
> +              - fsl,mpc8536-elbc
> +              - fsl,mpc8569-elbc
> +              - fsl,mpc8572-elbc
> +              - fsl,p1020-elbc
> +              - fsl,p1021-elbc
> +              - fsl,p1023-elbc
> +              - fsl,p2020-elbc
> +              - fsl,p2041-elbc
> +              - fsl,p3041-elbc
> +              - fsl,p4080-elbc
> +              - fsl,p5020-elbc
> +              - fsl,p5040-elbc
> +          - const: fsl,elbc

Is it really necessary to list every single chip?

And then it would need to be updated when new ones came out?  I know this
particular line of chips is not going to see any new members at this
point, but as far as the general approach goes...

Does the schema validation complain if it sees an extra compatible it
doesn't recognize?  If so that's obnoxious.

> +examples:
> +  - |
> +    localbus@f0010100 {
> +        compatible = "fsl,mpc8272-localbus",
> +                     "fsl,pq2-localbus";
> +        reg = <0xf0010100 0x40>;
> +        ranges = <0x0 0x0 0xfe000000 0x02000000
> +                  0x1 0x0 0xf4500000 0x00008000
> +                  0x2 0x0 0xfd810000 0x00010000>;
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +
> +        flash@0,0 {
> +            compatible = "jedec-flash";
> +            reg = <0x0 0x0 0x2000000>;
> +            bank-width = <4>;
> +            device-width = <1>;
> +        };
> +
> +        simple-periph@2,0 {
> +            compatible = "fsl,elbc-gpcm-uio";
> +            reg = <0x2 0x0 0x10000>;
> +            elbc-gpcm-br = <0xfd810800>;
> +            elbc-gpcm-or = <0xffff09f7>;
> +        };

I know this isn't new, but... since we're using this as an example,
where is the documentation for this fsl,elbc-gpcm-uio and
elbc-gpcm-br/or?  What exactly is a simple-periph?

There are no in-tree device trees that use this either.  The bcsr
node was actually a much more normal example, despite that particular
platform having been removed.  There are other bcsr nodes that still
exist that could be used instead.

-Crystal

