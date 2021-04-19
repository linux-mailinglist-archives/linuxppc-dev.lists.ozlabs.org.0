Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A23639D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:03:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtTg6vL9z3bt9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:03:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=FRCuBCO3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=FRCuBCO3; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtSM30JSz2yj0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:02:26 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNtSL3ZyKz9vG3; Mon, 19 Apr 2021 14:02:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618804946;
 bh=Zx6ot/vowM5EALz0Xk90Vj1LY/0oghNPCWwwL/hFBZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FRCuBCO39LYliGLN9LltT7VdY/LXL55G9ZgMIkhK1P2PQ3l1kSGaRrGsI73M1mvNB
 48CZqBjSzS8P3oRjrNWHBiKhoK3Bx5huiMdaDoSrLcxV6/7RjR/pDzmGEk67LRPNBz
 Ykb0z47nlBQUx13iVW4/WfMKKeoIXCRPOGi1cSHo=
Date: Mon, 19 Apr 2021 14:02:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 2/2] hotplug-cpu.c: set UNISOLATE on dlpar_cpu_remove()
 failure
Message-ID: <YH0AyoAxLuLsWLUI@yekko.fritz.box>
References: <20210416210216.380291-1-danielhb413@gmail.com>
 <20210416210216.380291-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H9fwAAWRe5DuyPx5"
Content-Disposition: inline
In-Reply-To: <20210416210216.380291-3-danielhb413@gmail.com>
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


--H9fwAAWRe5DuyPx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 06:02:16PM -0300, Daniel Henrique Barboza wrote:
> The RTAS set-indicator call, when attempting to UNISOLATE a DRC that is
> already UNISOLATED or CONFIGURED, returns RTAS_OK and does nothing else
> for both QEMU and phyp. This gives us an opportunity to use this
> behavior to signal the hypervisor layer when an error during device
> removal happens, allowing it to do a proper error handling, while not
> breaking QEMU/phyp implementations that don't have this support.
>=20
> This patch introduces this idea by unisolating all CPU DRCs that failed
> to be removed by dlpar_cpu_remove_by_index(), when handling the
> PSERIES_HP_ELOG_ID_DRC_INDEX event. This is being done for this event
> only because its the only CPU removal event QEMU uses, and there's no
> need at this moment to add this mechanism for phyp only code.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

except...

> ---
>  arch/powerpc/platforms/pseries/hotplug-cpu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/=
platforms/pseries/hotplug-cpu.c
> index 12cbffd3c2e3..ed66895c2f51 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -802,8 +802,15 @@ int dlpar_cpu(struct pseries_hp_errorlog *hp_elog)
>  	case PSERIES_HP_ELOG_ACTION_REMOVE:
>  		if (hp_elog->id_type =3D=3D PSERIES_HP_ELOG_ID_DRC_COUNT)
>  			rc =3D dlpar_cpu_remove_by_count(count);
> -		else if (hp_elog->id_type =3D=3D PSERIES_HP_ELOG_ID_DRC_INDEX)
> +		else if (hp_elog->id_type =3D=3D PSERIES_HP_ELOG_ID_DRC_INDEX) {
>  			rc =3D dlpar_cpu_remove_by_index(drc_index);
> +			/* Setting the isolation state of an UNISOLATED/CONFIGURED
> +			 * device to UNISOLATE is a no-op, but the hypervison can

typo here s/hypervison/hypervisor/

> +			 * use it as a hint that the cpu removal failed.
> +			 */
> +			if (rc)
> +				dlpar_unisolate_drc(drc_index);
> +		}
>  		else
>  			rc =3D -EINVAL;
>  		break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--H9fwAAWRe5DuyPx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9AMoACgkQbDjKyiDZ
s5ID7A/+MFpgabS9TEPWI0Arkpd9FEdc6yQDsaQyfIeT4BwIA8kxz/ZzHnfJnyq9
N7fcMwb+SgezuVSal2PDEHY4yM4chyoxGWNuzB21ArNwVjBKN5onm2pkqKG7EHbQ
D9Pvc8aON+aDNsxY+ZG9/X8Xrjvt0VbR2KGS9tvW4F5AJREVSSfN7PPBcjVXPUFk
4GQaWQbqdNzx96MLmAKbZ0L4/V2x7ocnBGfQ5NylJrDC7CPApRGkOhQl1/z0v/cc
tY6vbMYyHFuXdDVyQQVu9sKpu/m1B/tkcSu6GfCQrJ0DPfMqzkuGFNTQrXvsx056
wgbV8nP2WCdwd+34zKhj3I6I1654OHVj/jW1B9DGH495/7sAT8rj9JITBki83NtY
C2dYu287v89LBA6LAPeE/2Zib25taaoMJTX52119W8s5mMsb25dRCbjOkN6JxYlj
Stvs9+/bZFQ88BqntFTQGapSz3z7lb7vPHAFc/VQ0DK2u1JQP9LltkY/QTxDHUap
wenorwVsRo83s82UGd4tHP4EZFC1a53pIiLDdC113QVfF3/NcHhgRwUhZWSN9K1f
KAlZCJCPNSiryFovSDKJ9P6rCBOsf8Z6g/BzIkPPjkf5T5ScixjMykJjvOe+6ZZe
TwiFtUGUE4UOD/tlqvWOCje30utnVBkPewPhbBKEo4F63Blg2oY=
=5aHK
-----END PGP SIGNATURE-----

--H9fwAAWRe5DuyPx5--
