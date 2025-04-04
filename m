Return-Path: <linuxppc-dev+bounces-7457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27766A7C218
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Apr 2025 19:06:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTlQ11GTkz30MM;
	Sat,  5 Apr 2025 04:06:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743786409;
	cv=none; b=JK77JlozFqS/bA+ConozlKiHS7vZJQJpN2SPRTqTCaclfaXUzbS1E7iNIq6vIj87GyHwO6Ex3nDjxNNpboatexMMEJnXCZPF9HlzBQcYgmeftj/HnKvLWUVpHE5CawLBztjrVi2h4GZ23ZM5Gjjg4hG/adZcnNFYa9WZOGRwglzFvarIrQZb6yXzzp+tRs1OfvQuKDvGk/jo58AckMF0CvHEhLY0wFS/CpUtJYFrePWaOVEX3fBN7pqFlCegdrcRxKKLt1oij+8Jaa0kk4/XWz0n218LnHf0RQIunxVal1gTjlIS8uBWAkCEYvXfAoXvmWnJgwlxPcpaQpAobr4iiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743786409; c=relaxed/relaxed;
	bh=f9PbVMx9TO26d525pCYqqK5lFtFSBjKF9I/DKey9tCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgwdcxqeKk6jSkcOWhdMoHOaHwgAr2wBAPugVqmz8VDUU+/cSPpon+zGDX696b1X2ozdu60+4MuIS6sxflvio7yn4kuV2cLvrCBJmAQueEj2o43yRHoxvrm7ve5hzyQsSmIPhZ1DNk1fRS/3BYnzX9DeHs079R2yVkpEqCWye2iglMQTJjEVqBR3+GPI56opPL3ukpq024XsdpqECOanS9J1vPXaw6NokwPE0i5B+KpCe1YeUAHQfDB9le+LpnzWN03Ey9Nsg7DtdGwsfahXYluBf2bofruuKNyqZNLDDF892Xmkw0EiR70hTtjOkSCpTpzbHgj10ZwFb+lkvZCVPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Icw+LAJM; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Icw+LAJM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTlPz2cWSz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Apr 2025 04:06:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95402A474B9;
	Fri,  4 Apr 2025 17:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B196C4CEDD;
	Fri,  4 Apr 2025 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743786404;
	bh=8KjWBG9WQrorB138lr8WXery8cppV3/1FffV4XVi0xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Icw+LAJMcB66YazKH66jhDre2R6LtcKA9oTConxbYWnSrhsXpIF1jfiALvDmUL2En
	 DAigUfLGNc0EA2YTJgjnm8wMK2CLH0XoC2VSjl5f9grUvNCapq+fgAc/HIMzN+mPBp
	 htsv+bbtxC5isyqJAgJbR/W4Hf5koZBPhRx9G/9c0qFvgTDnLmYD98UZIKi5gbJNdc
	 6xVgbWwOZtKUo1knN9rf5sfYB/MtzWKwQHkcLZySS1L5VwyFYE5rejFv+6ems+NLyp
	 37RMEHz+dG9123FOM0oTu+XQ0RsBFYtWk0umpJwc5w5rIy5SuNtIFL32RozXeHiPeT
	 77KiFK1ZF6hzg==
Date: Fri, 4 Apr 2025 18:06:39 +0100
From: Conor Dooley <conor@kernel.org>
To: j.ne@posteo.net
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Crystal Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert fsl,mpic-msi
 to YAML
Message-ID: <20250404-exuberant-unvarying-b8ee5ab10b00@spud>
References: <20250403-msipic-yaml-v1-1-f4248475714f@posteo.net>
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
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UBs04byHDHx9tTAp"
Content-Disposition: inline
In-Reply-To: <20250403-msipic-yaml-v1-1-f4248475714f@posteo.net>
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--UBs04byHDHx9tTAp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 07:38:00PM +0200, J. Neusch=E4fer via B4 Relay wrot=
e:
> From: "J. Neusch=E4fer" <j.ne@posteo.net>
>=20
> As part of a larger effort to bring various PowerPC-related bindings
> into the YAML world, this patch converts msi-pic.txt to YAML and moves
> it into the bindings/interrupt-controller/ directory. The conversion may
> necessarily be a bit hard to read because the binding is quite verbose.
>=20
> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
>  .../interrupt-controller/fsl,mpic-msi.yaml         | 141 +++++++++++++++=
++++++
>  .../devicetree/bindings/powerpc/fsl/msi-pic.txt    | 111 ----------------
>  2 files changed, 141 insertions(+), 111 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,m=
pic-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,m=
pic-msi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..99a98864bd10c5e5b67112c01=
49fe123b51ca26f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,mpic-msi=
=2Eyaml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/fsl,mpic-msi.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MSI interrupt controller
> +
> +description:

I think you want some sort of chomping operator here to preserve
formatting.

> +  The Freescale hypervisor and msi-address-64
> +  -------------------------------------------
> +
> +  Normally, PCI devices have access to all of CCSR via an ATMU mapping. =
 The
> +  Freescale MSI driver calculates the address of MSIIR (in the MSI regis=
ter
> +  block) and sets that address as the MSI message address.
> +
> +  In a virtualized environment, the hypervisor may need to create an IOM=
MU
> +  mapping for MSIIR.  The Freescale ePAPR hypervisor has this requirement
> +  because of hardware limitations of the Peripheral Access Management Un=
it
> +  (PAMU), which is currently the only IOMMU that the hypervisor supports.
> +  The ATMU is programmed with the guest physical address, and the PAMU
> +  intercepts transactions and reroutes them to the true physical address.
> +
> +  In the PAMU, each PCI controller is given only one primary window.  The
> +  PAMU restricts DMA operations so that they can only occur within a win=
dow.
> +  Because PCI devices must be able to DMA to memory, the primary window =
must
> +  be used to cover all of the guest's memory space.
> +
> +  PAMU primary windows can be divided into 256 subwindows, and each
> +  subwindow can have its own address mapping ("guest physical" to "true
> +  physical").  However, each subwindow has to have the same alignment, w=
hich
> +  means they cannot be located at just any address.  Because of these
> +  restrictions, it is usually impossible to create a 4KB subwindow that
> +  covers MSIIR where it's normally located.
> +
> +  Therefore, the hypervisor has to create a subwindow inside the same
> +  primary window used for memory, but mapped to the MSIR block (where MS=
IIR
> +  lives).  The first subwindow after the end of guest memory is used for
> +  this.  The address specified in the msi-address-64 property is the PCI
> +  address of MSIIR.  The hypervisor configures the PAMU to map that addr=
ess to
> +  the true physical address of MSIIR.
> +
> +maintainers:
> +  - J. Neusch=E4fer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,mpic-msi
> +          - fsl,mpic-msi-v4.3
> +          - fsl,ipic-msi
> +          - fsl,vmpic-msi
> +          - fsl,vmpic-msi-v4.3
> +      - items:
> +          - enum:
> +              - fsl,mpc8572-msi
> +              - fsl,mpc8610-msi
> +              - fsl,mpc8641-msi
> +          - const: fsl,mpic-msi
> +    description:

> +      compatible list, may contain one or two entries The first is
> +      "fsl,CHIP-msi", where CHIP is the processor(mpc8610, mpc8572, etc.=
) and
> +      the second is "fsl,mpic-msi" or "fsl,ipic-msi" or "fsl,mpic-msi-v4=
=2E3"
> +      depending on the parent type and version.=20

I think this just dupes the compatible list and should be dropped.


> If mpic version is 4.3, the
> +      number of MSI registers is increased to 16, MSIIR1 is provided to =
access
> +      these 16 registers, and compatible "fsl,mpic-msi-v4.3" should be u=
sed.

This part is kinda stating the obvious I /think/ but might not be for
odd reason?

> +      The first entry is optional; the second entry is required.

I think this part is confusing and should be dropped.

> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Address and length of the shared message interrupt
> +          register set

> +      - description: Address of aliased MSIIR or MSIIR1 register for pla=
tforms
> +          that have such an alias. If using MSIIR1, the second region mu=
st be
> +          added because different MSI group has different MSIIR1 offset.

This part is based on platform, so should it not have an if/then/else
below restricting it to the correct platforms?

> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 16
> +    description:
> +      Each one of the interrupts here is one entry per 32 MSIs, and rout=
ed to
> +      the host interrupt controller. The interrupts should be set as edge
> +      sensitive. If msi-available-ranges is present, only the interrupts=
 that
> +      correspond to available ranges shall be present.
> +
> +  msi-available-ranges:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: First MSI interrupt in this range
> +        - description: Number of MSI interrupts in this range
> +    description:

> +      Use <start count> style section to define which MSI interrupt can =
be used
> +      in the 256 msi interrupts.

I think this dupes information in the items list in a more confusing
manner.

> This property is optional, without this, all
> +      the MSI interrupts can be used.  Each available range must begin a=
nd end
> +      on a multiple of 32 (i.e.  no splitting an individual MSI register=
 or the
> +      associated PIC interrupt).

> MPIC v4.3 does not support this property
> +      because the 32 interrupts of an individual register are not contin=
uous
> +      when using MSIIR1.

Sounds like another if/then/else should restrict this too.
Rest seems fine :)

Cheers,
Conor.

> +
> +  msi-address-64:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      64-bit PCI address of the MSIIR register. The MSIIR register is us=
ed for
> +      MSI messaging.  The address of MSIIR in PCI address space is the M=
SI
> +      message address.
> +
> +      This property may be used in virtualized environments where the hy=
pervisor
> +      has created an alternate mapping for the MSIR block.  See the top-=
level
> +      description for an explanation.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    msi@41600 {
> +            compatible =3D "fsl,mpc8610-msi", "fsl,mpic-msi";
> +            reg =3D <0x41600 0x80>;
> +            msi-available-ranges =3D <0 0x100>;
> +            interrupts =3D <0xe0 0>, <0xe1 0>, <0xe2 0>, <0xe3 0>,
> +                         <0xe4 0>, <0xe5 0>, <0xe6 0>, <0xe7 0>;
> +    };
> +
> +  - |
> +    msi@41600 {
> +            compatible =3D "fsl,mpic-msi-v4.3";
> +            reg =3D <0x41600 0x200 0x44148 4>;
> +            interrupts =3D <0xe0 0 0 0>, <0xe1 0 0 0>, <0xe2 0 0 0>, <0x=
e3 0 0 0>,
> +                         <0xe4 0 0 0>, <0xe5 0 0 0>, <0xe6 0 0 0>, <0xe7=
 0 0 0>,
> +                         <0x100 0 0 0>, <0x101 0 0 0>, <0x102 0 0 0>, <0=
x103 0 0 0>,
> +                         <0x104 0 0 0>, <0x105 0 0 0>, <0x106 0 0 0>, <0=
x107 0 0 0>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/msi-pic.txt b/=
Documentation/devicetree/bindings/powerpc/fsl/msi-pic.txt
> deleted file mode 100644
> index f8d2b7fe06d695971d48ba21ab67e5b72a212fe9..0000000000000000000000000=
000000000000000
> --- a/Documentation/devicetree/bindings/powerpc/fsl/msi-pic.txt
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -* Freescale MSI interrupt controller
> -
> -Required properties:
> -- compatible : compatible list, may contain one or two entries
> -  The first is "fsl,CHIP-msi", where CHIP is the processor(mpc8610, mpc8=
572,
> -  etc.) and the second is "fsl,mpic-msi" or "fsl,ipic-msi" or
> -  "fsl,mpic-msi-v4.3" depending on the parent type and version. If mpic
> -  version is 4.3, the number of MSI registers is increased to 16, MSIIR1=
 is
> -  provided to access these 16 registers, and compatible "fsl,mpic-msi-v4=
=2E3"
> -  should be used. The first entry is optional; the second entry is
> -  required.
> -
> -- reg : It may contain one or two regions. The first region should conta=
in
> -  the address and the length of the shared message interrupt register se=
t.
> -  The second region should contain the address of aliased MSIIR or MSIIR1
> -  register for platforms that have such an alias, if using MSIIR1, the s=
econd
> -  region must be added because different MSI group has different MSIIR1 =
offset.
> -
> -- interrupts : each one of the interrupts here is one entry per 32 MSIs,
> -  and routed to the host interrupt controller. the interrupts should
> -  be set as edge sensitive.  If msi-available-ranges is present, only
> -  the interrupts that correspond to available ranges shall be present.
> -
> -Optional properties:
> -- msi-available-ranges: use <start count> style section to define which
> -  msi interrupt can be used in the 256 msi interrupts. This property is
> -  optional, without this, all the MSI interrupts can be used.
> -  Each available range must begin and end on a multiple of 32 (i.e.
> -  no splitting an individual MSI register or the associated PIC interrup=
t).
> -  MPIC v4.3 does not support this property because the 32 interrupts of =
an
> -  individual register are not continuous when using MSIIR1.
> -
> -- msi-address-64: 64-bit PCI address of the MSIIR register. The MSIIR re=
gister
> -  is used for MSI messaging.  The address of MSIIR in PCI address space =
is
> -  the MSI message address.
> -
> -  This property may be used in virtualized environments where the hyperv=
isor
> -  has created an alternate mapping for the MSIR block.  See below for an
> -  explanation.
> -
> -
> -Example:
> -	msi@41600 {
> -		compatible =3D "fsl,mpc8610-msi", "fsl,mpic-msi";
> -		reg =3D <0x41600 0x80>;
> -		msi-available-ranges =3D <0 0x100>;
> -		interrupts =3D <
> -			0xe0 0
> -			0xe1 0
> -			0xe2 0
> -			0xe3 0
> -			0xe4 0
> -			0xe5 0
> -			0xe6 0
> -			0xe7 0>;
> -		interrupt-parent =3D <&mpic>;
> -	};
> -
> -	msi@41600 {
> -		compatible =3D "fsl,mpic-msi-v4.3";
> -		reg =3D <0x41600 0x200 0x44148 4>;
> -		interrupts =3D <
> -			0xe0 0 0 0
> -			0xe1 0 0 0
> -			0xe2 0 0 0
> -			0xe3 0 0 0
> -			0xe4 0 0 0
> -			0xe5 0 0 0
> -			0xe6 0 0 0
> -			0xe7 0 0 0
> -			0x100 0 0 0
> -			0x101 0 0 0
> -			0x102 0 0 0
> -			0x103 0 0 0
> -			0x104 0 0 0
> -			0x105 0 0 0
> -			0x106 0 0 0
> -			0x107 0 0 0>;
> -	};
> -
> -The Freescale hypervisor and msi-address-64
> --------------------------------------------
> -Normally, PCI devices have access to all of CCSR via an ATMU mapping.  T=
he
> -Freescale MSI driver calculates the address of MSIIR (in the MSI register
> -block) and sets that address as the MSI message address.
> -
> -In a virtualized environment, the hypervisor may need to create an IOMMU
> -mapping for MSIIR.  The Freescale ePAPR hypervisor has this requirement
> -because of hardware limitations of the Peripheral Access Management Unit
> -(PAMU), which is currently the only IOMMU that the hypervisor supports.
> -The ATMU is programmed with the guest physical address, and the PAMU
> -intercepts transactions and reroutes them to the true physical address.
> -
> -In the PAMU, each PCI controller is given only one primary window.  The
> -PAMU restricts DMA operations so that they can only occur within a windo=
w.
> -Because PCI devices must be able to DMA to memory, the primary window mu=
st
> -be used to cover all of the guest's memory space.
> -
> -PAMU primary windows can be divided into 256 subwindows, and each
> -subwindow can have its own address mapping ("guest physical" to "true
> -physical").  However, each subwindow has to have the same alignment, whi=
ch
> -means they cannot be located at just any address.  Because of these
> -restrictions, it is usually impossible to create a 4KB subwindow that
> -covers MSIIR where it's normally located.
> -
> -Therefore, the hypervisor has to create a subwindow inside the same
> -primary window used for memory, but mapped to the MSIR block (where MSIIR
> -lives).  The first subwindow after the end of guest memory is used for
> -this.  The address specified in the msi-address-64 property is the PCI
> -address of MSIIR.  The hypervisor configures the PAMU to map that addres=
s to
> -the true physical address of MSIIR.
>=20
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250226-msipic-yaml-76e3f00bf5ee
>=20
> Best regards,
> --=20
> J. Neusch=E4fer <j.ne@posteo.net>
>=20
>=20

--UBs04byHDHx9tTAp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/ARnwAKCRB4tDGHoIJi
0qYYAP9EYhGZBz3BmKKBfSki+53q7MK1d/r50aft2DuJRVGxiwD/RRb2II1euVJM
/XjR7M0MCLbA6M0mNcxH6xskOFVDigU=
=0NeY
-----END PGP SIGNATURE-----

--UBs04byHDHx9tTAp--

