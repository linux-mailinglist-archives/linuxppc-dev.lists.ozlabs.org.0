Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4F38758A7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:40:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LTLMpS3V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrLm64y7mz3vkl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 07:40:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LTLMpS3V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrLlN6LC1z3dXY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 07:40:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2413E61CF2;
	Thu,  7 Mar 2024 20:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4708CC433F1;
	Thu,  7 Mar 2024 20:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709843995;
	bh=xzOKp2H5xhff7RPjl7hUZinOqbqvSZ0ptOXYVgfGCwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTLMpS3V56JS9D8rU1wNJes/qKPjQmq1Xy9PQLl9UYi85d/tBRdkmdybujPkQ0oc1
	 lCh5LU5sR8iY6ZKRnZVzRsvjsaJ4iyxUYoHVqrCLU5MTyTSQth4Ok11AvCyeybhoiV
	 R9nre40xIwxjSHJh0avjbHqEQynpt50oJBk8uWmgkBXqXxHjWVE2oSUa9pP4AJYgq6
	 yqg5jtfLoySoJdERzW00Fym8HKrWWyBLnoKhYld/vSZR926l5KS4Q6e7/wb4p/iluj
	 pqM6DhqT9yuG4mRnSPQffBQ4yRLhv8+PyB2NFSM0plLLgy7LPxuWDR5YelHrKhE5cp
	 cS6Oy03pNvtvQ==
Date: Thu, 7 Mar 2024 20:39:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/prom_init: Replace linux,sml-base/sml-size
 with linux,sml-log
Message-ID: <20240307-cytoplasm-compare-6656aae737ac@spud>
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-2-stefanb@linux.ibm.com>
 <87jzmenx2c.fsf@mail.lhotse>
 <768fc5f1-3919-477e-a8e6-16a7e8536add@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IDMXI+tGPlolqedq"
Content-Disposition: inline
In-Reply-To: <768fc5f1-3919-477e-a8e6-16a7e8536add@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: rnsastry@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, Lukas Wunner <lukas@wunner.de>, jarkko@kernel.org, linux-integrity@vger.kernel.org, viparash@in.ibm.com, linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--IDMXI+tGPlolqedq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2024 at 10:11:03AM -0500, Stefan Berger wrote:
> On 3/7/24 05:41, Michael Ellerman wrote:
> > Stefan Berger <stefanb@linux.ibm.com> writes:

> >=20
> > Also adding the new linux,sml-log property should be accompanied by a
> > change to the device tree binding.
>=20
>=20
> See my proposal below.
>=20
> >=20
> > The syntax is not very obvious to me, but possibly something like?
> >=20
> > diff --git a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml b/Docu=
mentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> > index 50a3fd31241c..cd75037948bc 100644
> > --- a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> > +++ b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> > @@ -74,8 +74,6 @@ required:
> >     - ibm,my-dma-window
> >     - ibm,my-drc-index
> >     - ibm,loc-code
> > -  - linux,sml-base
> > -  - linux,sml-size
> >   allOf:
> >     - $ref: tpm-common.yaml#
> > diff --git a/Documentation/devicetree/bindings/tpm/tpm-common.yaml b/Do=
cumentation/devicetree/bindings/tpm/tpm-common.yaml
> > index 3c1241b2a43f..616604707c95 100644
> > --- a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> > +++ b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> > @@ -25,6 +25,11 @@ properties:
> >         base address of reserved memory allocated for firmware event log
> >       $ref: /schemas/types.yaml#/definitions/uint64
> > +  linux,sml-log:
> > +    description:
> > +      Content of firmware event log
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +
> >     linux,sml-size:
> >       description:
> >         size of reserved memory allocated for firmware event log
> > @@ -53,15 +58,22 @@ dependentRequired:
> >     linux,sml-base: ['linux,sml-size']
> >     linux,sml-size: ['linux,sml-base']
> > -# must only have either memory-region or linux,sml-base
> > +# must only have either memory-region or linux,sml-base/size or linux,=
sml-log
> >   # as well as either resets or reset-gpios
> >   dependentSchemas:
> >     memory-region:
> >       properties:
> >         linux,sml-base: false
> > +      linux,sml-log: false
> >     linux,sml-base:
> >       properties:
> >         memory-region: false
> > +      linux,sml-log: false
> > +  linux,sml-log:
> > +    properties:
> > +      memory-region: false
> > +      linux,sml-base: false
> > +      linux,sml-size: false
> >     resets:
> >       properties:
> >         reset-gpios: false
> >=20
> >=20
>=20
> I have been working with this patch here now and it passes the following
> test:
>=20
> make dt_binding_check dtbs_check DT_SCHEMA_FILES=3Dtpm/ibm,vtpm.yaml
>=20
>=20
> diff --git a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> index 50a3fd31241c..cacf6c3082de 100644
> --- a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> +++ b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> @@ -74,8 +74,12 @@ required:
>    - ibm,my-dma-window
>    - ibm,my-drc-index
>    - ibm,loc-code
> -  - linux,sml-base
> -  - linux,sml-size
> +oneOf:
> +  - required:
> +      - linux,sml-base
> +      - linux,sml-size
> +  - required:
> +      - linux,sml-log
>=20
>  allOf:
>    - $ref: tpm-common.yaml#
> @@ -102,3 +106,21 @@ examples:
>              linux,sml-size =3D <0xbce10200>;
>          };
>      };
> +  - |
> +    soc {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        tpm@30000003 {
> +            compatible =3D "IBM,vtpm";
> +            device_type =3D "IBM,vtpm";
> +            reg =3D <0x30000003>;
> +            interrupts =3D <0xa0003 0x0>;
> +            ibm,#dma-address-cells =3D <0x2>;
> +            ibm,#dma-size-cells =3D <0x2>;
> +            ibm,my-dma-window =3D <0x10000003 0x0 0x0 0x0 0x10000000>;
> +            ibm,my-drc-index =3D <0x30000003>;
> +            ibm,loc-code =3D "U8286.41A.10082DV-V3-C3";
> +            linux,sml-log =3D <00 00 00 00 03 00 00>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> index 3c1241b2a43f..591c48f8cb74 100644
> --- a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> +++ b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> @@ -30,6 +30,11 @@ properties:
>        size of reserved memory allocated for firmware event log
>      $ref: /schemas/types.yaml#/definitions/uint32
>=20
> +  linux,sml-log:
> +    description:
> +      firmware event log

Can you provide a more complete description here please as to what the
different between this and the other property? If I was populating a DT
I would have absolutely no idea whether or not to use this or the other
property, nor how to go about actually populating it.
The "log" in your example doesn't look like an actual log of any sort,
but I know nothing about TPMs so I'll take your word for it that that's
what a TPM log looks like.

> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +
>    memory-region:
>      description: reserved memory allocated for firmware event log
>      maxItems: 1
>=20
>=20
> Is my patch missing something?

I think you also need the dependantSchema stuff you had in your original
snippet that makes the linux,* properties mutually exclusive with
memory-region (or at least something like that).

Please make sure you CC the DT maintainers and list on the v2 and Lukas
Wunner too.

Thanks,
Conor.

--IDMXI+tGPlolqedq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeomFgAKCRB4tDGHoIJi
0rDjAQDCS+FWUSIjoa3pw2hIV6BHFi7ckp38kgze/iTx08jC2wD/Y6NcNqHRNxyH
uqytmYK1UqfYlV6C3HtkWQilNytz6QA=
=5EVs
-----END PGP SIGNATURE-----

--IDMXI+tGPlolqedq--
