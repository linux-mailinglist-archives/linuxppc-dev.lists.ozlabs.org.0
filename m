Return-Path: <linuxppc-dev+bounces-6827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA83A57D35
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Mar 2025 19:41:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z9Bn96cMDz30Ds;
	Sun,  9 Mar 2025 05:41:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741459261;
	cv=none; b=NSDgj1IAQAooM3pJhmaeymVBaWCTnmoBk2rmbtP6JE4t13OsDFsdgYmCjFMsy4U9aFiuI4gGueCmGFQzWDL/qm1PNutBkB7jNTbuhT9WJ37PWOFMe5w9GCv1u3jY0jNjF/aUW6UWM/DM84mOPwRSQyJRD8vIbHqNOnENwfBAUY2A49LCtUq6dykWprXNmUib1O2u9ZL5o+IOH+AzrceEAL3HXN+hJig2H5VfJUzRakyl0nGdDZ4CQGNcimmnsvrKT615MIgKgyAVC9gyap/pU104I1xJRTdINPOtReKnvdiZYBgJmMUu8Bhkt2WrCcNRAIW/C0y6WwWyi1YLmTudDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741459261; c=relaxed/relaxed;
	bh=ntkAe9xdEV8LjYFQm6YWIiGEYr2aZld7i60Ckc+E4So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSrrDXozTjctDpaFS+E8y++9znLYoq7cGQHdqPehRMAWOA11opnwDVHsJe416bOcQQb+/4Zcfa31+S9UFu7ufdS79rAVf0WsJ5ML6H+oI2jSb0aOaucjHuIOq6F/Af3CjaNgsZpDLNB5o24bg3+//Y5gloYZW68rgGibE2UL89UGgZ3J9obd73gMCYoFqCWisxh1uTpwFxcTvaqhz/PLWyco5/cl6yoPOTONzyGhoyYslhbXQ+MIfdO5mGgcXfa0zP48hgl2gouS+d5R//zgA1iY71jRFkZMY4xRR67HTWvCDGgkXvxzNbzCqoqjGv7kM8DxsC6Z2w4F3oMJEoUy2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=mTBtVL1T; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=mTBtVL1T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z9Bn664LFz2yyR
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Mar 2025 05:40:54 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 7C61D240101
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 19:40:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1741459248; bh=otfbaXRx0KCNwf5peLoJ1CCs5/Kof2zck2m5p70R2NE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=mTBtVL1TWiC8G4clZSZq+BE6ABeCrUGM7K0jQBhRzIPo7NmAjPNhD0py6m7frpeLp
	 PItpcLoQIg2hinHO/Z9QW3ARnQo/UIFRTVRWX/C3JZHSHrnskoLf1yJs7C1NsBwCbw
	 KIABpO4Bgm7f/bVPvVjIDroJpUqd+3b4zHezCF6jBqKikmVHITZPVRwxdsBEkFl2gc
	 wLX1gAz2/2B5ARv4uXa3Z30MEQ4dtIkh9cw7Va9JQcrBkoSzIzCgzdU61YitpynTM9
	 grmeKFm6j45bnS4EMu5MPE0gDS4RAOHTxZS8x4ljAG9tlQuqEi3n393+TGJ+6flnsR
	 eJ1XtRhmsfOtg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Z9Bmr3JbPz9rxB;
	Sat,  8 Mar 2025 19:40:43 +0100 (CET)
Date: Sat,  8 Mar 2025 18:40:43 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Richard Weinberger <richard@nod.at>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Crystal Wood <oss@buserror.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-mtd@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/3] dt-bindings: nand: Add fsl,elbc-fcm-nand
Message-ID: <Z8yPKx1U-sT1OGeb@probook>
References: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
 <20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net>
 <174059551678.3319332.12055848852503108874.robh@kernel.org>
 <20250303140021.GA1732495-robh@kernel.org>
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
In-Reply-To: <20250303140021.GA1732495-robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Miquel, what do you think about Rob's suggestion below?

On Mon, Mar 03, 2025 at 08:00:21AM -0600, Rob Herring wrote:
> On Wed, Feb 26, 2025 at 12:45:17PM -0600, Rob Herring (Arm) wrote:
> > 
> > On Wed, 26 Feb 2025 18:01:41 +0100, J. Neuschäfer wrote:
> > > Formalize the binding already supported by the fsl_elbc_nand.c driver
> > > and used in several device trees in arch/powerpc/boot/dts/.
> > > 
> > > raw-nand-chip.yaml is referenced in order to accommodate situations in
> > > which the ECC parameters settings are set in the device tree. One such
> > > example is in arch/powerpc/boot/dts/turris1x.dts:
> > > 
> > > 	/* MT29F2G08ABAEAWP:E NAND */
> > > 	nand@1,0 {
> > > 		compatible = "fsl,p2020-fcm-nand", "fsl,elbc-fcm-nand";
> > > 		reg = <0x1 0x0 0x00040000>;
> > > 		nand-ecc-mode = "soft";
> > > 		nand-ecc-algo = "bch";
> > > 
> > > 		partitions { ... };
> > > 	};
> > > 
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > > ---
> > > 
> > > V3:
> > > - remove unnecessary #address/size-cells from nand node in example
> > > - add Frank Li's review tag
> > > - add missing end of document marker (...)
> > > - explain choice to reference raw-nand-chip.yaml
> > > 
> > > V2:
> > > - split out from fsl,elbc binding patch
> > > - constrain #address-cells and #size-cells
> > > - add a general description
> > > - use unevaluatedProperties=false instead of additionalProperties=false
> > > - fix property order to comply with dts coding style
> > > - include raw-nand-chip.yaml instead of nand-chip.yaml
> > > ---
> > >  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml | 68 ++++++++++++++++++++++
> > >  1 file changed, 68 insertions(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.example.dtb: nand@1,0: $nodename:0: 'nand@1,0' does not match '^nand@[a-f0-9]$'
> > 	from schema $id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#
> 
> Drop the unit address in raw-nand-chip.yaml. So: 
> 
> properties:
>   $nodename:
>     pattern: "^nand@"
> 

^^^



Best Regards,
J. Neuschäfer

