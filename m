Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79415345584
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:36:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4FqV2SZ6z30hj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 13:36:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=Esf5Frie;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=Esf5Frie; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Fq419XSz30Bp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 13:35:59 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4Fq30dTwz9sW4; Tue, 23 Mar 2021 13:35:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616466959;
 bh=aIuuvymdi0TVzASxL/UJIQ31bE22tiQ2QrDrSDMOOWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Esf5FriergMN/ijUKXtJg2IAxOEOC2sYKYuHOwFk+vETVAXVjovCek28OkuPm3Q9/
 RbS6c1sRnmulnNKoPInlNcmWDNLZTL8O5DsGXZVRwzvV/zCyMCqPsywbtXBF7SrF2h
 mzbviKhKdCHcwBseyMU2Xs6o5pTi9jXoKtRFR1/c=
Date: Tue, 23 Mar 2021 13:35:53 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v6 6/6] KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in
 nested KVM
Message-ID: <YFlUCdMQezdPg9LJ@yekko.fritz.box>
References: <20210311083939.595568-1-bharata@linux.ibm.com>
 <20210311083939.595568-7-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nNWWeyy0OjAtXMD1"
Content-Disposition: inline
In-Reply-To: <20210311083939.595568-7-bharata@linux.ibm.com>
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


--nNWWeyy0OjAtXMD1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 02:09:39PM +0530, Bharata B Rao wrote:
> In the nested KVM case, replace H_TLB_INVALIDATE by the new hcall
> H_RPT_INVALIDATE if available. The availability of this hcall
> is determined from "hcall-rpt-invalidate" string in ibm,hypertas-functions
> DT property.
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/kvm/book3s_64_mmu_radix.c | 27 +++++++++++++++++++++-----
>  arch/powerpc/kvm/book3s_hv_nested.c    | 12 ++++++++++--
>  2 files changed, 32 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/bo=
ok3s_64_mmu_radix.c
> index e603de7ade52..1e1e55fd0ee5 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -21,6 +21,7 @@
>  #include <asm/pte-walk.h>
>  #include <asm/ultravisor.h>
>  #include <asm/kvm_book3s_uvmem.h>
> +#include <asm/plpar_wrappers.h>
> =20
>  /*
>   * Supported radix tree geometry.
> @@ -318,9 +319,19 @@ void kvmppc_radix_tlbie_page(struct kvm *kvm, unsign=
ed long addr,
>  	}
> =20
>  	psi =3D shift_to_mmu_psize(pshift);
> -	rb =3D addr | (mmu_get_ap(psi) << PPC_BITLSHIFT(58));
> -	rc =3D plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(0, 0, 1),
> -				lpid, rb);
> +
> +	if (!firmware_has_feature(FW_FEATURE_RPT_INVALIDATE)) {
> +		rb =3D addr | (mmu_get_ap(psi) << PPC_BITLSHIFT(58));
> +		rc =3D plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(0, 0, 1),
> +					lpid, rb);
> +	} else {
> +		rc =3D pseries_rpt_invalidate(lpid, H_RPTI_TARGET_CMMU,
> +					    H_RPTI_TYPE_NESTED |
> +					    H_RPTI_TYPE_TLB,
> +					    psize_to_rpti_pgsize(psi),
> +					    addr, addr + psize);
> +	}
> +
>  	if (rc)
>  		pr_err("KVM: TLB page invalidation hcall failed, rc=3D%ld\n", rc);
>  }
> @@ -334,8 +345,14 @@ static void kvmppc_radix_flush_pwc(struct kvm *kvm, =
unsigned int lpid)
>  		return;
>  	}
> =20
> -	rc =3D plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(1, 0, 1),
> -				lpid, TLBIEL_INVAL_SET_LPID);
> +	if (!firmware_has_feature(FW_FEATURE_RPT_INVALIDATE))
> +		rc =3D plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(1, 0, 1),
> +					lpid, TLBIEL_INVAL_SET_LPID);
> +	else
> +		rc =3D pseries_rpt_invalidate(lpid, H_RPTI_TARGET_CMMU,
> +					    H_RPTI_TYPE_NESTED |
> +					    H_RPTI_TYPE_PWC, H_RPTI_PAGE_ALL,
> +					    0, -1UL);
>  	if (rc)
>  		pr_err("KVM: TLB PWC invalidation hcall failed, rc=3D%ld\n", rc);
>  }
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index adcc8e26ef22..5601b7eb9b89 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -19,6 +19,7 @@
>  #include <asm/pgalloc.h>
>  #include <asm/pte-walk.h>
>  #include <asm/reg.h>
> +#include <asm/plpar_wrappers.h>
> =20
>  static struct patb_entry *pseries_partition_tb;
> =20
> @@ -444,8 +445,15 @@ static void kvmhv_flush_lpid(unsigned int lpid)
>  		return;
>  	}
> =20
> -	rc =3D plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(2, 0, 1),
> -				lpid, TLBIEL_INVAL_SET_LPID);
> +	if (!firmware_has_feature(FW_FEATURE_RPT_INVALIDATE))
> +		rc =3D plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(2, 0, 1),
> +					lpid, TLBIEL_INVAL_SET_LPID);
> +	else
> +		rc =3D pseries_rpt_invalidate(lpid, H_RPTI_TARGET_CMMU,
> +					    H_RPTI_TYPE_NESTED |
> +					    H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
> +					    H_RPTI_TYPE_PAT,
> +					    H_RPTI_PAGE_ALL, 0, -1UL);
>  	if (rc)
>  		pr_err("KVM: TLB LPID invalidation hcall failed, rc=3D%ld\n", rc);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nNWWeyy0OjAtXMD1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZVAkACgkQbDjKyiDZ
s5KCYxAAvbX2KvujBQtx/xZsQHgUDAHv0CA5dMjMEN0FlAB0QqbcpVJCJGFreyhY
AzXh6foFMl6hD9QSjQw56JkxddJeXiYwFtj0BJumGboBweDe8hVDiy5HZUV9JpY0
p+IldPEuqYf/RkvPmCEzM2Vwk67vyXpSTiW/sxanIP20Yz/GnE5z0ooF74ifWJfU
P1tLFxw+jGuigQjm3LCpEmel3dXiZuT2X5gD52465VC2KbeBMBKvWFqkqX2jgi0J
1GSfMQwn6g2TDD5HYWKJ7BwRhs+bradhb+wuHrymgXg8csEz6xVGVtKEYMSCCmZ2
TOiY9lJFD4GU5ahGxtST8MOY1FyFjgmQTFo3d8SSCL6Vc0CbcNx5YPwQZ6RmpsSp
y/vzqX767wzlnaMDIXSGhKoYcd9qOjx462ZshKn/CLJBYr7SbVILb+LXwaYJn7Cy
SpjmTWUMc3u9zcCFTObgQ5Qrm4K2t+CUnBOrI7TQ3zw6PSAFLP969GqM5pMRCrQG
5/tyGwH30QuxPxfmOA2h9MD1fkVuF4bqWFB5eCsQFffCocb0Ov10j/U536BHvbbF
JT36ZEzGRlwVODLoP1w9vUk2WJ6JNRfD9ngHZlThdGVmg9auSpMHXndTHcO2eM2S
MSpbiylj+9TekFgDmsVBHMrLVChyOEVNCnMY2OC1Zxe0DuLgYbU=
=qYMy
-----END PGP SIGNATURE-----

--nNWWeyy0OjAtXMD1--
