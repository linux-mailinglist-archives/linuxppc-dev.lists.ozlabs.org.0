Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C819A3639D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:03:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtTD5WRZz3c0D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:03:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=KQLCwILx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=KQLCwILx; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtSM2y6Fz2yhd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:02:27 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNtSL22fhz9vFw; Mon, 19 Apr 2021 14:02:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618804946;
 bh=K7OcbPfANGv6nhbBkJWpQIZAq820+l+/A6AozuMgdWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KQLCwILxwEMR6gzbo78Xe8LGWcDuMEsc0wOul8n2JNp+9zyllgCB9uZkt8M0Bp8FP
 sqYk+lLPc0OPes+DsmMe1WJXeKh9Io9kUHR1KcyON8lJfXhrWoBQ5hqNLOXAuA3OAh
 S50GyyypqiGU2FpPRtjU9RWe2vdycp/pUxFW4Ww8=
Date: Mon, 19 Apr 2021 14:01:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/2] dlpar.c: introduce dlpar_unisolate_drc()
Message-ID: <YH0Ap7nXGpYWWzw/@yekko.fritz.box>
References: <20210416210216.380291-1-danielhb413@gmail.com>
 <20210416210216.380291-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HmuWYEr+xd5UZ4R1"
Content-Disposition: inline
In-Reply-To: <20210416210216.380291-2-danielhb413@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--HmuWYEr+xd5UZ4R1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 06:02:15PM -0300, Daniel Henrique Barboza wrote:
> Next patch will execute a set-indicator call in hotplug-cpu.c.
>=20
> Create a dlpar_unisolate_drc() helper to avoid spreading more
> rtas_set_indicator() calls outside of dlpar.c.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/platforms/pseries/dlpar.c   | 14 ++++++++++++++
>  arch/powerpc/platforms/pseries/pseries.h |  1 +
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platfo=
rms/pseries/dlpar.c
> index 233503fcf8f0..3ac70790ec7a 100644
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
> @@ -329,6 +329,20 @@ int dlpar_release_drc(u32 drc_index)
>  	return 0;
>  }
> =20
> +int dlpar_unisolate_drc(u32 drc_index)
> +{
> +	int dr_status, rc;
> +
> +	rc =3D rtas_call(rtas_token("get-sensor-state"), 2, 2, &dr_status,
> +				DR_ENTITY_SENSE, drc_index);
> +	if (rc || dr_status !=3D DR_ENTITY_PRESENT)
> +		return -1;
> +
> +	rtas_set_indicator(ISOLATION_STATE, drc_index, UNISOLATE);
> +
> +	return 0;
> +}
> +
>  int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_elog)
>  {
>  	int rc;
> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/plat=
forms/pseries/pseries.h
> index 4fe48c04c6c2..4ea12037c920 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -55,6 +55,7 @@ extern int dlpar_attach_node(struct device_node *, stru=
ct device_node *);
>  extern int dlpar_detach_node(struct device_node *);
>  extern int dlpar_acquire_drc(u32 drc_index);
>  extern int dlpar_release_drc(u32 drc_index);
> +extern int dlpar_unisolate_drc(u32 drc_index);
> =20
>  void queue_hotplug_event(struct pseries_hp_errorlog *hp_errlog);
>  int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_errlog);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HmuWYEr+xd5UZ4R1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9AKcACgkQbDjKyiDZ
s5JmKA/+JL9nBqTxhHet7wdRd2jBXqlLJry/PhFiZ9tYSoxtNQBTtsLtWWizX2Xi
gNx9GA7dgcQmc4KjGJC0qzyjVLRblyoIROF9XOHc5cSc4QvzcCEQabfqn+XX+CBl
DWk/anKhvDEPBB1v7R2tgbHdwUJXt5z0NwjxW4AqHWl+cwBsck56NFxEMO2oVXS3
nO+ZIFBDgKGLgg9zBaaY41yKvTW+/8m7jDVKsLMVEPk/bZi4T12q9gVQLgIGJhIX
GxvzhVbKpZb6/2J5enrezwbul4IESxcPQEd7xY4gqjfWYsrlGKQ4CfYq4fnU9qbO
IZ7m1Z1BLzYOFgteF+z6FUzqHj5msohgWSmXT1pe79PgBE5xFeNSV9D/sjcuuiwl
UqzxWuNQGjbilKf9NrW/U5EUAH0mxKUTluKkgbKZ87QzCmbBzgK4Oe1n8ZLGbQO3
yNrI9X3Kw1XIuiaQaDUVP87zsTTwE6qnL9RIlyrJNKxdOmWAOkecWDSKtGlNQgtP
k4gb6OC1+qoSIUYpqSfl0yrRp3cRmMgyowrJkf+97g1NX4U0cgZ7RHtwYgpdpMHt
zMSrLluSvokvMixZ3AWSIyULyJ2Q/8A/QZLv7rUQys8izw0uj8EN0/UWrahgrFwi
kujA2hPJxIGDLaVBKBQIfAtCiMbaAVVpZxardmumsqmAdBP/lcE=
=4F+m
-----END PGP SIGNATURE-----

--HmuWYEr+xd5UZ4R1--
