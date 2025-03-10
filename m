Return-Path: <linuxppc-dev+bounces-6851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 590FDA596E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 15:01:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBJTH34Jtz2yLB;
	Tue, 11 Mar 2025 01:01:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::221"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741615267;
	cv=none; b=EvcxuWVEb1LDnsDGw9SyRT/RNJihQj5I0FIORrKTjmn5UTDfn1kyzS7RWaVOArM7jv3UzUqoj7243++S0tM/oxo15eD7M4Nbs2QgokVWb8GItxZuLmfPvYatpqqXE3k2HzcZqHykss4ZwNz3M3wVkCMMtssWaxuWORdSqi+vZjLsTgT9jk7mb29b6+jV9QdPPOaxoFCL0BaKwka24Qk/l7yXKvMc4scw9+xPIbea18WBTBCY5pC0st5yuaqwd0IyQILA2yGpgkdQCPLTfu3hUZcQAT4c44cnmBQ4oUfy14O1eVeBLBBzhrM9P+lv16vD6T19S04+62cxWln9xJOqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741615267; c=relaxed/relaxed;
	bh=Ic1Dx7Jc0GBQUrs269FgO1VmANg/4PfSayG+I8hDFAw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HPIgZPUr2RpwaALtIPZzsxNNzQnqJNFxbP6I5e+J0y+TT1sH5/7bbfuKO+A7XKn34KxGaJ4xAE0f5HNJHhLSH/brsW6wjdvxgg0G44ArrDrI0hSE9VpAHFxtyczfh1Z8qRYyh/qLp4RhaCE8QAYbrkCPYPjJpRapCFuyS9tskKFMxYxa4hpn5LcMOY0YPJLq9PRCycLEYFF0F9uz7HhVLlMIreybF7aWHO5yv+jtatYUMNO+s7swBk8C+RnQP2PKEDP1Wl5HGmIKRDR+PhQGlPMHs3AN5dRMOYlU9we+inX5feZtJBJQ/Vod+FpDFc6t7T9CKce9AZUaqESrmHVTrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=DuK80jpk; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=DuK80jpk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBJTB6Mc2z2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 01:01:01 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8F6344287;
	Mon, 10 Mar 2025 14:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741615255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ic1Dx7Jc0GBQUrs269FgO1VmANg/4PfSayG+I8hDFAw=;
	b=DuK80jpkLcFQYmRVTQyZYRzbWd5veudVS7lStznyElUVSl4NgOQMEwoub8NqVmncBWeIN3
	rITac9+BaOxeX/0oMlHZZXVKP7XhTSkVc2X7R58j4qlUD3T8n7y3YwjdfgYMyc56g5RlGI
	V7uO9XmSG9G15dT+Ui3SJkI2Yw/0sFxzLTCoAmwC9MJHGpzvsut4sPo39pr1ftGDdzHHLk
	becCl4cOkHPGy6BeoqQBEYVbRb7Kw6YFX5tZxHHfGSylO7zH/oLvhhiKDWuNWm/6HccR8z
	7dZk2DzQqcMZ52w0chHlB5oo610DZbP6n+4Udifr4zHSrJoaEk3PEhTFUIq1UA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: J. =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Rob Herring <robh@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Michael Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin
 <npiggin@gmail.com>,  Conor Dooley <conor+dt@kernel.org>,
  linux-kernel@vger.kernel.org,  Crystal Wood <oss@buserror.net>,
  Christophe Leroy <christophe.leroy@csgroup.eu>,
  devicetree@vger.kernel.org,  Frank Li <Frank.Li@nxp.com>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Madhavan Srinivasan <maddy@linux.ibm.com>,
  linux-mtd@lists.infradead.org,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Krzysztof Kozlowski <krzk@kernel.org>,  Naveen N Rao <naveen@kernel.org>,
  linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/3] dt-bindings: nand: Add fsl,elbc-fcm-nand
In-Reply-To: <Z8yPKx1U-sT1OGeb@probook> ("J. =?utf-8?Q?Neusch=C3=A4fer=22'?=
 =?utf-8?Q?s?= message of "Sat, 8
	Mar 2025 18:40:43 +0000")
References: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
	<20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net>
	<174059551678.3319332.12055848852503108874.robh@kernel.org>
	<20250303140021.GA1732495-robh@kernel.org> <Z8yPKx1U-sT1OGeb@probook>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 10 Mar 2025 15:00:53 +0100
Message-ID: <87o6y97zoq.fsf@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffuddvueeigeegkeffveeuledtvdefteeiuddthffhtdefhfffledtleeuteejvdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgpdihrghmlhdrshhonecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepjhdrnhgvsehpohhsthgvohdrnhgvthdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghom
 hdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhsshessghushgvrhhrohhrrdhnvght
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 08/03/2025 at 18:40:43 GMT, J. Neusch=C3=A4fer <j.ne@posteo.net> wrote:

> Miquel, what do you think about Rob's suggestion below?
>
> On Mon, Mar 03, 2025 at 08:00:21AM -0600, Rob Herring wrote:
>> On Wed, Feb 26, 2025 at 12:45:17PM -0600, Rob Herring (Arm) wrote:
>> >=20
>> > On Wed, 26 Feb 2025 18:01:41 +0100, J. Neusch=C3=A4fer wrote:
>> > > Formalize the binding already supported by the fsl_elbc_nand.c driver
>> > > and used in several device trees in arch/powerpc/boot/dts/.
>> > >=20
>> > > raw-nand-chip.yaml is referenced in order to accommodate situations =
in
>> > > which the ECC parameters settings are set in the device tree. One su=
ch
>> > > example is in arch/powerpc/boot/dts/turris1x.dts:
>> > >=20
>> > > 	/* MT29F2G08ABAEAWP:E NAND */
>> > > 	nand@1,0 {
>> > > 		compatible =3D "fsl,p2020-fcm-nand", "fsl,elbc-fcm-nand";
>> > > 		reg =3D <0x1 0x0 0x00040000>;
>> > > 		nand-ecc-mode =3D "soft";
>> > > 		nand-ecc-algo =3D "bch";
>> > >=20
>> > > 		partitions { ... };
>> > > 	};
>> > >=20
>> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> > > Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
>> > > ---
>> > >=20
>> > > V3:
>> > > - remove unnecessary #address/size-cells from nand node in example
>> > > - add Frank Li's review tag
>> > > - add missing end of document marker (...)
>> > > - explain choice to reference raw-nand-chip.yaml
>> > >=20
>> > > V2:
>> > > - split out from fsl,elbc binding patch
>> > > - constrain #address-cells and #size-cells
>> > > - add a general description
>> > > - use unevaluatedProperties=3Dfalse instead of additionalProperties=
=3Dfalse
>> > > - fix property order to comply with dts coding style
>> > > - include raw-nand-chip.yaml instead of nand-chip.yaml
>> > > ---
>> > >  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml | 68 +++++++++++=
+++++++++++
>> > >  1 file changed, 68 insertions(+)
>> > >=20
>> >=20
>> > My bot found errors running 'make dt_binding_check' on your patch:
>> >=20
>> > yamllint warnings/errors:
>> >=20
>> > dtschema/dtc warnings/errors:
>> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/binding=
s/mtd/fsl,elbc-fcm-nand.example.dtb: nand@1,0: $nodename:0: 'nand@1,0' does=
 not match '^nand@[a-f0-9]$'
>> > 	from schema $id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.=
yaml#
>>=20
>> Drop the unit address in raw-nand-chip.yaml. So:=20
>>=20
>> properties:
>>   $nodename:
>>     pattern: "^nand@"

I am not a big fan of lowering the constraint, but if our current schema
doesn't allow to express this need differently, we may need to do that.
I obviously trust Rob on this regard.

Thanks,
Miqu=C3=A8l

