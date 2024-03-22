Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE267887283
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 19:04:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kvrERC+H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1VZV37Chz3wMc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 05:04:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kvrERC+H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1VTX2v1Xz3vxs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 04:59:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E0DB9CE1874;
	Fri, 22 Mar 2024 17:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CEAC433F1;
	Fri, 22 Mar 2024 17:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711130382;
	bh=vYsHN5tUpWVy+FYsrra2eYCMPyeaVlBd8+QL+Nh9b5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvrERC+HC9ArLBwp5Fh3Xrsa3y5UQi9zCRFAfd9lTmymxC+aQbv7hNJVjfxZxZMrJ
	 pECB2rBIhEokCw5c+Or39sRuvgLWvuWpU/HrY9ti1WFSZAgsrhs24UB6BCk8YYjvWu
	 1T9prFLrcbvmEoNSzCrHgN2UE70qsLjPSsnD62FRSPazKgRxP8eUVu0erjqCW809hE
	 4pmE47B/VZKdlKLh7NVwshneoqtSlMZFdxi4DQDTp8vP9ZYWEr7zDDmqovQxVkBUBS
	 8TpNVPNfQKanvTdjOeTkbesQDpUacMpUbXBfI+22IFUd4XPV39sHU2evasKP7n75t/
	 rSMCMlyxXDvQQ==
Date: Fri, 22 Mar 2024 17:59:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: hwmon: ibmpowernv: convert to
 dtschema
Message-ID: <20240322-papaya-diabolic-e7c2c4319eb2@spud>
References: <20240322-hwmon_dtschema-v2-0-570bee1acecb@gmail.com>
 <20240322-hwmon_dtschema-v2-2-570bee1acecb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1BqIBqYDHfkBFwJe"
Content-Disposition: inline
In-Reply-To: <20240322-hwmon_dtschema-v2-2-570bee1acecb@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--1BqIBqYDHfkBFwJe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 07:45:27AM +0100, Javier Carrasco wrote:
> Convert existing binding to support validation.
>=20
> This is a straightforward conversion with now new properties.
>=20
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/ibm,powernv.yaml     | 37 ++++++++++++++++=
++++++
>  .../devicetree/bindings/hwmon/ibmpowernv.txt       | 23 --------------
>  2 files changed, 37 insertions(+), 23 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/ibm,powernv.yaml b/D=
ocumentation/devicetree/bindings/hwmon/ibm,powernv.yaml
> new file mode 100644
> index 000000000000..b26d42bce938
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ibm,powernv.yaml

Filename should really match one of the compatibles. "powernv" is not a
type of hwmon as far as a quick google reports so I think its a poor
choice here regardless. With a compatible for the filename:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/ibm,powernv.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IBM POWERNV platform sensors
> +
> +maintainers:
> +  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ibm,opal-sensor-cooling-fan
> +      - ibm,opal-sensor-amb-temp
> +      - ibm,opal-sensor-power-supply
> +      - ibm,opal-sensor-power
> +
> +  sensor-id:
> +    description:
> +      An opaque id provided by the firmware to the kernel, identifies a
> +      given sensor and its attribute data.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - sensor-id
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sensor {
> +        compatible =3D "ibm,opal-sensor-cooling-fan";
> +        sensor-id =3D <0x7052107>;
> +    };
> diff --git a/Documentation/devicetree/bindings/hwmon/ibmpowernv.txt b/Doc=
umentation/devicetree/bindings/hwmon/ibmpowernv.txt
> deleted file mode 100644
> index f93242be60a1..000000000000
> --- a/Documentation/devicetree/bindings/hwmon/ibmpowernv.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -IBM POWERNV platform sensors
> -----------------------------
> -
> -Required node properties:
> -- compatible: must be one of
> -		"ibm,opal-sensor-cooling-fan"
> -		"ibm,opal-sensor-amb-temp"
> -		"ibm,opal-sensor-power-supply"
> -		"ibm,opal-sensor-power"
> -- sensor-id: an opaque id provided by the firmware to the kernel, identi=
fies a
> -	     given sensor and its attribute data
> -
> -Example sensors node:
> -
> -cooling-fan#8-data {
> -	sensor-id =3D <0x7052107>;
> -	compatible =3D "ibm,opal-sensor-cooling-fan";
> -};
> -
> -amb-temp#1-thrs {
> -	sensor-id =3D <0x5096000>;
> -	compatible =3D "ibm,opal-sensor-amb-temp";
> -};
>=20
> --=20
> 2.40.1
>=20

--1BqIBqYDHfkBFwJe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZf3HCQAKCRB4tDGHoIJi
0jNGAP9qE1RgXwHh+bJHGrruo2IG/PvvUFE4CGzM4LgWwflF/AEAiZNvtVyjY0Ni
4RDUtWjJKj6uVoLcSS6AW+psuIZ81g0=
=vQA/
-----END PGP SIGNATURE-----

--1BqIBqYDHfkBFwJe--
