Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4C0372415
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 03:04:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ1nd02bdz30DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 11:04:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=qQ1qoLJw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=qQ1qoLJw; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ1n41jw3z2xZM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 11:03:35 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ1n32QYbz9sSs; Tue,  4 May 2021 11:03:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620090215;
 bh=wSkTjTNRiVTtByqql+tUJttBm5KrO3idrQ277+B7jdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qQ1qoLJwKHNTITet9C8dfRj0zRNK6Doi3cDZdbwHulNpjM3kYCfSVOXD211kQOj8n
 VxaIKYRGa0WATcWjKOqeMvpHm4VssWkT4J4E1GZbT7zTxVFiJAnEskCuKu0OTRt7GJ
 lutOZUjtaMagfPiDCrXw3AFPsHWwu1Ywpt4uOm+Q=
Date: Tue, 4 May 2021 10:45:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/3] powerpc/pseries: Set UNISOLATE on
 dlpar_memory_remove_by_ic() error
Message-ID: <YJCZNzR2BVzzsHGV@yekko>
References: <20210430120917.217951-1-danielhb413@gmail.com>
 <20210430120917.217951-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="klSeQPzJRu1RcKR1"
Content-Disposition: inline
In-Reply-To: <20210430120917.217951-2-danielhb413@gmail.com>
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


--klSeQPzJRu1RcKR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 09:09:15AM -0300, Daniel Henrique Barboza wrote:
> As previously done in dlpar_cpu_remove() for CPUs, this patch changes
> dlpar_memory_remove_by_ic() to unisolate the LMB DRC when the LMB is
> failed to be removed. The hypervisor, seeing a LMB DRC that was supposed
> to be removed being unisolated instead, can do error recovery on its
> side.
>=20
> This change is done in dlpar_memory_remove_by_ic() only because, as of
> today, only QEMU is using this code path for error recovery (via the
> PSERIES_HP_ELOG_ID_DRC_IC event). phyp treats it as a no-op.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/platforms/pseries/hotplug-memory.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
> index 8377f1f7c78e..bb98574a84a2 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -551,6 +551,13 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_rem=
ove, u32 drc_index)
>  			if (!drmem_lmb_reserved(lmb))
>  				continue;
> =20
> +			/*
> +			 * Setting the isolation state of an UNISOLATED/CONFIGURED
> +			 * device to UNISOLATE is a no-op, but the hypervisor can
> +			 * use it as a hint that the LMB removal failed.
> +			 */
> +			dlpar_unisolate_drc(lmb->drc_index);
> +
>  			rc =3D dlpar_add_lmb(lmb);
>  			if (rc)
>  				pr_err("Failed to add LMB, drc index %x\n",

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--klSeQPzJRu1RcKR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCQmTcACgkQbDjKyiDZ
s5JMew//UpI7Y4WozFe13gS7zDK6r8BrWsnwdxMYie+DJz46WeFUGSdr2v631CIu
V8BFb3hojxO3EWyCe9uuCa82Q5bXLWlSdTc9kOCL2y9cBFqlL+bRIqf7nR1DHgBt
Ykv8q4PURQPoHAQnu+71c5MB1DHnTYVwv2phMAzRWp/8WckMshgrI0VzOxsVanpc
2wHSE7SnX7eX9mocFqLj8OxlERR4j9xwZlAPkVxQaNj3FMGE0jbpQFdutahb4wVf
b7+WlNI1qu0nPlA+hn8ayM2ZvafcxlJrMzD4ema3Sh9Ue72aAsXnCcqw74PqND0d
DGxgd/lQvGsssFpbLjIWkinJQeLslEFlS/UwGh2fOWPZR7Q0zvtsQvjlnDZvn/K/
u4HeSXWE/3kHcbWo3ocx5YdwwxZXqyXVyYKQTQLo1SMv70aOYYSlWhvi+o+mFyCD
xf4qdaNVSNjl2DI0iG8gnTwjfisTdrlBhsr4yB92Wcmi0Zf/B9T9bnHtvMKsuXgJ
SL3T31LYxcvy7h882QlQDNjTElNJdpBiEX+VYyp3nSddKF4EPFnrgd/3gMmOri4U
bB+Gt0l6RBuA9X9qZRjGM1bRAbxMeWBBooZGuPaHKna99hsAi1HvX3A+6uQFVQUE
fg69MaE7WevWlQQZBH1e7XDc5IGf3ALWxJxzZ1LebDXQPPBs2jY=
=w6MK
-----END PGP SIGNATURE-----

--klSeQPzJRu1RcKR1--
