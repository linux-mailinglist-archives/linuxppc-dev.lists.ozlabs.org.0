Return-Path: <linuxppc-dev+bounces-5589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9DA1D26F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 09:37:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhMHS0CDbz306d;
	Mon, 27 Jan 2025 19:37:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737967059;
	cv=none; b=EFqJoLy6JETs0526FQD+JXNGYnXR8oSiJAAZRNaQCV9zuuto5cXnqzKuzKWpI1WNR2kZNBhHk84uCwpkNYRkM1k/HuGEflWeK7VaIbXB398Hf+AXoq+ctkVymxBMkoJABJ1DiRpKddIZZGfMlR1xWpuzQGwr6qLLuAdbM0gFuZXi3oe9RgGO1QYrZuMe3a08+e5KJDjlgTo3iU/vgjX7Ey9qSrsYOaN9M70Q/5ypVuOPIjSlM8CSXc9tIlPAJKCMhBJEaiqt9zrrarH1nTImfUChP/noir9nfh0r/KRaJPmKQMhYSZntiMbeeVA/Nlm+fxYpej5V4v1m+L6iBpuf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737967059; c=relaxed/relaxed;
	bh=kQ/2tx7kM2/Q3i9aXtrDDMoBDQVf3r5n60EoIHgu0+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqgN4saifwCURvUVdASWq0TxNrSuoSENh2FDGTGOIkrU4/ttQuVIxNrPD2UP4IKx0XtYpOLO2i/cx74DfnjeoF/epyIGfByODVJOzb5W3cBkM44IFE2DXhomWS3lj3jSTtW/5pK2dXX71wyva72O50pfTuFfcvJHxGsk84hQzu92CmUHQmeHu2lnel82oA5cFSU9+v6uv0kLgO269CAW6i8lva4UJoBNZJrDDff5WlG/7N+qYXVB2ozwMYuY1Pl9TN6Pd23XJOCfNlyXDMt+fDYcxcftLuGCzT1dWDt2ZkL30SK9qz7OfmahYSsZf8LE16pm5rrMG8kz3BU7VuFZqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qIv8GsOT; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qIv8GsOT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhMHR071Mz3011
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 19:37:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCAD85C4AEC;
	Mon, 27 Jan 2025 08:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B5CC4CED2;
	Mon, 27 Jan 2025 08:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737967055;
	bh=lO9NymPFr6bhwMFfAllVvVLeDbAVw1xGh+GP1heN7js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qIv8GsOTxD0MNBdcccL2gsR2GrsPOH7kYiWCdaqYHMQJl06quxNk06u372au5ecHh
	 2Km7poxUCviWvnWyWTOZ2XsGaIdWVQ95eEQxqPt76q/lEMFBkasYlNeYPXT0k1/s5u
	 mw2TCXDM4aOChO8w9BDR2JG1aT6fNADge7Ss9cZJlS5a3vzIg1SFxeuKR3unpvtQKp
	 5EUGDJ/a2/K6EDh3hGmn5JXR7YdC39zqGsMjrUUUGw34bynf+MWBTNE9KVb2eth6CY
	 DslXsJIm1PuK3EsUVpPhPjXU33U6TD2oYXqG8X2GLTSv/NG2/ufxjvVXHEYaaJzxMw
	 Y5cb5He53K49Q==
Date: Mon, 27 Jan 2025 09:37:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Scott Wood <oss@buserror.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 9/9] dt-bindings: nand: Convert fsl,elbc bindings to
 YAML
Message-ID: <20250127-cuddly-dalmatian-of-saturation-5f1ae2@krzk-bin>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:59:04PM +0100, J. Neusch=C3=A4fer wrote:
> Convert the Freescale localbus controller bindings from text form to
> YAML. The list of compatible strings reflects current usage.

simple-bus and 20 other compatibles you used were not present in the
original binding. Does above "list of compatible strings" mean you just
added them?

>=20
> Changes compared to the txt version:
>  - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
>    appears in this example and nowhere else
>  - added a new example with NAND flash
>=20
> Remaining issues:
>  - The localbus is not really a simple-bus: Unit addresses are not simply
>    addresses on a memory bus. Instead, they have a format: The first cell
>    is a chip select number, the remaining one or two cells are bus
>    addresses.
>=20
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  61 +++++++++
>  .../bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml    |  55 ++++++++

Please split the conversion from adding new bindings. For example above
file and its compatible fsl,elbc-gpcm-uio was not documented in original
TXT.

=2E..

> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml =
b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6bbceb82c77826499abe85879=
e9189b18d396eea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/fsl/fsl,elbc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Enhanced Local Bus Controller

What sort of bus is it? Memory bus? Then place it with others, see
memory directory.

> +
> +maintainers:
> +  - J. Neusch=C3=A4fer <j.ne@posteo.net>
> +
> +properties:
> +  $nodename:
> +    pattern: "^localbus@[0-9a-f]+$"
> +
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
> +          - const: simple-bus
> +
> +      - items:
> +          - const: fsl,mpc8272-localbus
> +          - const: fsl,pq2-localbus
> +
> +      - items:
> +          - enum:
> +              - fsl,mpc8247-localbus
> +              - fsl,mpc8248-localbus
> +              - fsl,mpc8360-localbus
> +          - const: fsl,pq2pro-localbus
> +          - const: simple-bus
> +
> +      - items:
> +          - enum:
> +              - fsl,mpc8540-localbus
> +              - fsl,mpc8544-lbc
> +              - fsl,mpc8544-localbus
> +              - fsl,mpc8548-lbc
> +              - fsl,mpc8548-localbus
> +              - fsl,mpc8560-localbus
> +              - fsl,mpc8568-localbus
> +          - const: fsl,pq3-localbus
> +          - const: simple-bus
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    enum: [2, 3]
> +    description: |
> +      The first cell is the chipselect number, and the remaining cells a=
re the
> +      offset into the chipselect.
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +    description: |
> +      Either one or two, depending on how large each chipselect can be.
> +
> +  ranges:
> +    description: |
> +      Each range corresponds to a single chipselect, and covers the enti=
re
> +      access window as configured.
> +
> +patternProperties:
> +  "^.*@.*$":
> +    type: object

And probably you need=20
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    localbus@f0010100 {
> +        compatible =3D "fsl,mpc8272-localbus",
> +                     "fsl,pq2-localbus";
> +        #address-cells =3D <2>;
> +        #size-cells =3D <1>;
> +        reg =3D <0xf0010100 0x40>;

compatible, then reg - see DTS coding style.

> +
> +        ranges =3D <0x0 0x0 0xfe000000 0x02000000
> +                  0x1 0x0 0xf4500000 0x00008000
> +                  0x2 0x0 0xfd810000 0x00010000>;
> +
> +        flash@0,0 {
> +            compatible =3D "jedec-flash";
> +            reg =3D <0x0 0x0 0x2000000>;

Well, here it is correct

> +            bank-width =3D <4>;
> +            device-width =3D <1>;
> +        };
> +
> +        simple-periph@2,0 {
> +            compatible =3D "fsl,elbc-gpcm-uio";
> +            reg =3D <0x2 0x0 0x10000>;
> +            elbc-gpcm-br =3D <0xfd810800>;
> +            elbc-gpcm-or =3D <0xffff09f7>;
> +        };
> +    };
> +
> +  - |
> +    localbus@e0005000 {

compatible, reg

> +        #address-cells =3D <2>;
> +        #size-cells =3D <1>;
> +        compatible =3D "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
> +        reg =3D <0xe0005000 0x1000>;
> +        interrupts =3D <77 0x8>;
> +        interrupt-parent =3D <&ipic>;
> +
> +        ranges =3D <0x0 0x0 0xfe000000 0x00800000
> +                  0x1 0x0 0xe0600000 0x00002000
> +                  0x2 0x0 0xf0000000 0x00020000
> +                  0x3 0x0 0xfa000000 0x00008000>;
> +
> +        flash@0,0 {

compatible, reg

> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +            compatible =3D "cfi-flash";
> +            reg =3D <0x0 0x0 0x800000>;
> +            bank-width =3D <2>;
> +            device-width =3D <1>;
> +        };
> +
> +        nand@1,0 {

compatible, reg

> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +            compatible =3D "fsl,mpc8315-fcm-nand",
> +                         "fsl,elbc-fcm-nand";
> +            reg =3D <0x1 0x0 0x2000>;
> +        };

Best regards,
Krzysztof


