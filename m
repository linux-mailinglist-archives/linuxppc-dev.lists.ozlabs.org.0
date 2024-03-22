Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F35887285
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 19:04:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p+gO5Ljr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1VbH5HWpz3wQ6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 05:04:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p+gO5Ljr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1VVj35g1z3w8j
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 05:00:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25EC4CE1882;
	Fri, 22 Mar 2024 18:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E043C433F1;
	Fri, 22 Mar 2024 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711130443;
	bh=g9Iyt0g4iUXGAQcOoGRDJSNpVdcT6pD1rHESCP3EsNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+gO5Ljr/Bf1h4I0MSugrfaYWl1wCJfGf9RhQTMSoG8sJkNmF8tOnybyGxthDEiUb
	 //lzM8qLFGc8UOe/pV7WLzwAHwgKOfTLPRkOQ6okD1SSvgfb+AVvgO5S5FmcoKPxNO
	 Shr0sb+tMV4Z5BV2vd6VAs8iQ0Uy4t/g4RLMi89IWyOhNj+U0vP3D19a7uBsurqMoP
	 jx4nTkDWrFyBDYJ03jaTw+Ys6hVC/7OMC5Tv41tCRFfJuj4I76yPMtNkhWNF0WzS6P
	 Ou/E45F1SQWD2Isvlzwd6ex8KUykLlHRp6jZFANMoPsP6xY02HV941wWcTvWdk44Wg
	 oGIx64k0BH5tA==
Date: Fri, 22 Mar 2024 18:00:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: hwmon: stts751: convert to dtschema
Message-ID: <20240322-swinger-unselfish-8e36bc12cf79@spud>
References: <20240322-hwmon_dtschema-v2-0-570bee1acecb@gmail.com>
 <20240322-hwmon_dtschema-v2-4-570bee1acecb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bGPx4mdUKjkLA5FN"
Content-Disposition: inline
In-Reply-To: <20240322-hwmon_dtschema-v2-4-570bee1acecb@gmail.com>
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


--bGPx4mdUKjkLA5FN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 07:45:29AM +0100, Javier Carrasco wrote:
> Convert existing binding to support validation.
>=20
> This is a straightforward conversion with no new properties.
>=20

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--bGPx4mdUKjkLA5FN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZf3HRgAKCRB4tDGHoIJi
0iWWAPsF0UuXl0/1wfe0ENaD/RuvprK3ML0fGOVBkNQ4fbTH1QEA97q9xgWqriro
TZDPzIK22sIByFav6M5rmCkkDnTAUgg=
=Hwbs
-----END PGP SIGNATURE-----

--bGPx4mdUKjkLA5FN--
