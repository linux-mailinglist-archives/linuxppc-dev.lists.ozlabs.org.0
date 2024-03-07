Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B296875941
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 22:30:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M6M0hn9v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrMsG1rQBz3vn5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 08:30:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M6M0hn9v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrMrY2v5Hz303d
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 08:29:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6790361708;
	Thu,  7 Mar 2024 21:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD2EC43390;
	Thu,  7 Mar 2024 21:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709846971;
	bh=HE1ZAIAEp6ujzFJHi+0GrvFAheNm6mH4Io3mGj+1sI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6M0hn9vfAj39Z7b85xV/LSMmxWs2UR+hnbO3sEP9duy2Ul7X5klX1iYYFc4iEf/6
	 EyBA6PLodCu4YsF7JJcgDLs1XVXsV8l5KMyklyax9iSsoWF1+/nB1PLVol5zCrbn4C
	 48xe/JVFAMOj2kdtfuYu3nd8nTorcuEsv+r8ozWziECcItFxMYuwrK4LEt6RUflkV9
	 yutgQX9sWO0reOhhy0si0wm7oz1ih291O+A2nNdNSr5J5nez0O3ZoDIxSYH00TP2lF
	 jvUMQ/lFaSJ8RrQlvHfOFmKD3P3U5MbL9x2CW1Mxje+yhj7lY7rhfKeq33FGM9Z/Of
	 rdwLuRrIAPKcg==
Date: Thu, 7 Mar 2024 21:29:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/prom_init: Replace linux,sml-base/sml-size
 with linux,sml-log
Message-ID: <20240307-freely-sassy-cae2bdeae800@spud>
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-2-stefanb@linux.ibm.com>
 <87jzmenx2c.fsf@mail.lhotse>
 <768fc5f1-3919-477e-a8e6-16a7e8536add@linux.ibm.com>
 <20240307-cytoplasm-compare-6656aae737ac@spud>
 <71c151b2-b03a-49a7-87b9-fc902b0cf328@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HM7wPvaND7fChimB"
Content-Disposition: inline
In-Reply-To: <71c151b2-b03a-49a7-87b9-fc902b0cf328@linux.ibm.com>
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


--HM7wPvaND7fChimB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2024 at 04:15:01PM -0500, Stefan Berger wrote:
>=20
>=20
> On 3/7/24 15:39, Conor Dooley wrote:
> > On Thu, Mar 07, 2024 at 10:11:03AM -0500, Stefan Berger wrote:
> > > On 3/7/24 05:41, Michael Ellerman wrote:
> > > > Stefan Berger <stefanb@linux.ibm.com> writes:
> >=20
> > > >=20
> > > diff --git a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> > > b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> > > index 3c1241b2a43f..591c48f8cb74 100644
> > > --- a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> > > +++ b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> > > @@ -30,6 +30,11 @@ properties:
> > >         size of reserved memory allocated for firmware event log
> > >       $ref: /schemas/types.yaml#/definitions/uint32
> > >=20
> > > +  linux,sml-log:
> > > +    description:
> > > +      firmware event log
> >=20
> > Can you provide a more complete description here please as to what the
> > different between this and the other property? If I was populating a DT
> > I would have absolutely no idea whether or not to use this or the other
> > property, nor how to go about actually populating it.
> > The "log" in your example doesn't look like an actual log of any sort,
> > but I know nothing about TPMs so I'll take your word for it that that's
> > what a TPM log looks like.
>=20
> In the example I cannot give a log but only a part of it. The log is in
> binary format and in case of TPM 2.0 starts with a header followed by log
> entries about what was measured. I don't think it's necessary to even give
> the full log header here. You do need some TPM specific knowledge about t=
he
> 'firmware even log'.
>=20
>=20
> The existing properties are described like this:
>=20
>   linux,sml-base:
>     description:
>       base address of reserved memory allocated for firmware event log
>     $ref: /schemas/types.yaml#/definitions/uint64
>=20
>   linux,sml-size:
>     description:
>       size of reserved memory allocated for firmware event log
>     $ref: /schemas/types.yaml#/definitions/uint32
>=20
> Would this describe the new property 'better' by prefixing it with
> 'embedded'?

IMO, no that's not any better. Spell it out so that someone who doesn't
know his arse from his elbow when it comes to tpm immediately knows that
this means the entire tpm log is inside the dtb. The paragraph you wrote
above gives more information about what this property is populated with
than the property description does.

>   linux,sml-log:
>     description:
>       embedded firmware event log
>     $ref: /schemas/types.yaml#/definitions/uint8-array
>=20
>=20
> >=20
> > > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > > +
> > >     memory-region:
> > >       description: reserved memory allocated for firmware event log
> > >       maxItems: 1
> > >=20
> > >=20
> > > Is my patch missing something?
> >=20
> > I think you also need the dependantSchema stuff you had in your original
> > snippet that makes the linux,* properties mutually exclusive with
> > memory-region (or at least something like that).
> >=20
> I modified my new example now like this:
> ...
>             ibm,loc-code =3D "U9080.HEX.134CA08-V7-C3";
>             linux,sml-log =3D <00 00 00 00 03 00 00>;
>             linux,sml-size =3D <0xbce10200>;   <-- added

>             ibm,loc-code =3D "U8286.41A.10082DV-V3-C3";
>             linux,sml-base =3D <0xc60e 0x0>;
>             linux,sml-size =3D <0xbce10200>;
>             linux,sml-log =3D <00 00 00 00 03 00 00>;   <- added
>=20
> It errors out on bad examples, which is good.

Aye, that is covered by your new oneOf for this one binding. The
dependantSchema bit in tpm-common.yaml enforces it for all tpm devices.
It also covers the memory-region property being mutually exclusive with
the linux,sml-{base,size} properties so I think you need to extend that
to also cover linux,sml-lof property.

> > Please make sure you CC the DT maintainers and list on the v2 and Lukas
> > Wunner too.
>=20
> Yes, I have them already cc'ed here.

To: Conor Dooley <conor@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linux-integrity@vger.kernel.org,=
 linuxppc-dev@lists.ozlabs.org, conor.dooley@microchip.com, nayna@linux.ibm=
=2Ecom, Lukas Wunner <lukas@wunner.de>, linux-kernel@vger.kernel.org, jarkk=
o@kernel.org,
        rnsastry@linux.ibm.com, peterhuewe@gmx.de, viparash@in.ibm.com

You have Lukas, one of the three DT maintainers and not the list as far
as I can see. Correct me please if I am wrong.

Thanks,
Conor.

--HM7wPvaND7fChimB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeoxtgAKCRB4tDGHoIJi
0iTlAQC+lgVF1MVkW4LiyDrFodhZNcs01tiw7DhYzmudOhbraAEA5Cq47/2c7Jw4
tafxUPGjqtltnoQxd3Ip5VYZvLXIQwY=
=c4Aj
-----END PGP SIGNATURE-----

--HM7wPvaND7fChimB--
