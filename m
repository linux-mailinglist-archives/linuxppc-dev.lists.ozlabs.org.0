Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9451345563
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:14:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4FKf60Tnz30NB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 13:13:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=NSWVowc5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=NSWVowc5; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4FKF45CCz2yRy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 13:13:36 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4FKD3GnTz9sRf; Tue, 23 Mar 2021 13:13:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616465616;
 bh=OA5ZAsCs5+L71lR4bQzy7HQX2Ve6DCQaBayBcwXORi0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NSWVowc5LNdQsgwuw68YycyiPTww+qIjxeia8571z9zNSmTur6cCr6wm2K7+XJ55z
 88F0Rqb7TKPlPuXls6Ha90XNBFi1Yf4G2IpZy/essNOyWv9D4DH32T3cYSXHI4Ju/5
 JbgJlh6fl3QAhzgoBFClVmZGGErJ7pLq1m+OaI6Y=
Date: Tue, 23 Mar 2021 12:19:28 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v6 1/6] KVM: PPC: Book3S HV: Fix comments of
 H_RPT_INVALIDATE arguments
Message-ID: <YFlCICYsADa+OrG/@yekko.fritz.box>
References: <20210311083939.595568-1-bharata@linux.ibm.com>
 <20210311083939.595568-2-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2cpqFItxP4BNoyVD"
Content-Disposition: inline
In-Reply-To: <20210311083939.595568-2-bharata@linux.ibm.com>
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--2cpqFItxP4BNoyVD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 02:09:34PM +0530, Bharata B Rao wrote:
> From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
>=20
> The type values H_RPTI_TYPE_PRT and H_RPTI_TYPE_PAT indicate
> invalidating the caching of process and partition scoped entries
> respectively.
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>

Not sure the change really clarifies that much, but whatever

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/include/asm/hvcall.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm=
/hvcall.h
> index ed6086d57b22..6af7bb3c9121 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -411,9 +411,9 @@
>  #define H_RPTI_TYPE_NESTED	0x0001	/* Invalidate nested guest partition-s=
cope */
>  #define H_RPTI_TYPE_TLB		0x0002	/* Invalidate TLB */
>  #define H_RPTI_TYPE_PWC		0x0004	/* Invalidate Page Walk Cache */
> -/* Invalidate Process Table Entries if H_RPTI_TYPE_NESTED is clear */
> +/* Invalidate caching of Process Table Entries if H_RPTI_TYPE_NESTED is =
clear */
>  #define H_RPTI_TYPE_PRT		0x0008
> -/* Invalidate Partition Table Entries if H_RPTI_TYPE_NESTED is set */
> +/* Invalidate caching of Partition Table Entries if H_RPTI_TYPE_NESTED i=
s set */
>  #define H_RPTI_TYPE_PAT		0x0008
>  #define H_RPTI_TYPE_ALL		(H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC | \
>  				 H_RPTI_TYPE_PRT)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2cpqFItxP4BNoyVD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZQiAACgkQbDjKyiDZ
s5IDrxAAshdC1SOjx3acRTuepXPgDDgKNDXdt6CjzNwC1fdPHB1i+S5SOC/YyJWe
nmFKP/p0/Y3vZwaLIirEgxjkiseO7tTWmtI9wVzDdZcrcyDmu08OySV678aqPeJg
oucn/rzkSiLb9sqvB9JjouCEXbaJHXA4M3IMHNSD23qdKsU50zxVHZa9y557UPEN
NPN3JoUVRBawIUOBCkmHW8bNRnWWGKRczCtHCrAQPQuqHSvXBP71BYt2YzYCHvWT
1iN5DFC9W/E3r/aHGnRs3EGjugTGZW2V3TH3/AL/rwsfydSFUls/mBUJQi8O870f
+TB08tNns5pM+nMm9JP5pXAtQTVQGtWT+T41wV/vZRVN7yMSfwPQAYDjWIdTf+nr
DJWjxZPdAhuVDY//aGnbVs0XCUkf3x+eIrBE1+zJ1SU19d8e9B/p1PDsmQ/G3q46
3+nlwBPtJjWovZ6X+A5HCHX24Q/JNiHSZbiJ1I/EYr6eBLU+usDZhbKI1fY86NcP
NpB4eF30iymHkkavRNoc6nGcPE6DULXQnTiVEGzUTcsxTvDimWeN2c2NVncg86Tc
dB5QL0GdpJu2HJRZmhmtOcCc8nyiL96pNVQdQiwlZem6NXz4XErFRA52Hj4NKEnS
y380f8Y0uNuK0sU1pGeCDuibXYTZ3RVTJxDCXCxSgsfSFYCJ7CA=
=ZQjV
-----END PGP SIGNATURE-----

--2cpqFItxP4BNoyVD--
