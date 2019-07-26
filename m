Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB0476174
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 11:04:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45w36N4WxfzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 19:03:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45w34g66LBzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2019 19:02:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="MJT90D3v"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45w34g15Ltz9sBF; Fri, 26 Jul 2019 19:02:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1564131747;
 bh=BD/Pm2ddApIFdrZBQdhnC5yjEOAa6DgTIzyYlCv07OY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MJT90D3vJpQhA2JY0XMbaGppm4FIE0xgG8ZcANSyW7D9TMn+i25efIWDEtNMCHbPg
 zOeBpONuhD19kk/PzNgmzOq5akzmbrPZnvKUl1jMKQvU4Q6GuaN3mLO0tyIgnkWPSj
 ty6TxJO34OML+8XmULDgHP8gV4JFqGJT2JCxwhcQ=
Date: Fri, 26 Jul 2019 18:53:00 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v5 2/4] powerpc/pseries: Update SCM hcall op-codes in
 hvcall.h
Message-ID: <20190726085300.GA4865@umbus>
References: <20190723161357.26718-1-vaibhav@linux.ibm.com>
 <20190723161357.26718-3-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20190723161357.26718-3-vaibhav@linux.ibm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2019 at 09:43:55PM +0530, Vaibhav Jain wrote:
> Update the hvcalls.h to include op-codes for new hcalls introduce to
> manage SCM memory. Also update existing hcall definitions to reflect
> current papr specification for SCM.
>=20
> The removed hcall op-codes H_SCM_MEM_QUERY, H_SCM_BLOCK_CLEAR were
> transient proposals and there support was never implemented by
> Power-VM nor they were used anywhere in Linux kernel. Hence we don't
> expect anyone to be impacted by this change.
>=20
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

They really should not have been merged while only interim proposals.
But since they have changed, better to update them than not, obviously.

> ---
> Change-log:
>=20
> v5:
> * None. Re-spinning the patchset.
>=20
> v4:
> * Updated the patch description mentioned current status of removed
>   hcall opcodes. [Mpe]
>=20
> v3:
> * Added updated opcode for H_SCM_HEALTH [Oliver]
>=20
> v2:
> * None new patch in this series.
> ---
>  arch/powerpc/include/asm/hvcall.h | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm=
/hvcall.h
> index 463c63a9fcf1..11112023e327 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -302,9 +302,14 @@
>  #define H_SCM_UNBIND_MEM        0x3F0
>  #define H_SCM_QUERY_BLOCK_MEM_BINDING 0x3F4
>  #define H_SCM_QUERY_LOGICAL_MEM_BINDING 0x3F8
> -#define H_SCM_MEM_QUERY	        0x3FC
> -#define H_SCM_BLOCK_CLEAR       0x400
> -#define MAX_HCALL_OPCODE	H_SCM_BLOCK_CLEAR
> +#define H_SCM_UNBIND_ALL        0x3FC
> +#define H_SCM_HEALTH            0x400
> +#define H_SCM_PERFORMANCE_STATS 0x418
> +#define MAX_HCALL_OPCODE	H_SCM_PERFORMANCE_STATS
> +
> +/* Scope args for H_SCM_UNBIND_ALL */
> +#define H_UNBIND_SCOPE_ALL (0x1)
> +#define H_UNBIND_SCOPE_DRC (0x2)
> =20
>  /* H_VIOCTL functions */
>  #define H_GET_VIOA_DUMP_SIZE	0x01

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl06v2kACgkQbDjKyiDZ
s5Lj+xAAq4hogQn+QnL4OnQUW/8DedCVnp5mKEBGEyoZ1im+P0NG1+XxVtszuRhq
mpjofoYWeo4mBukqNZWA1kjstxZgmA87qV4JMNcifP3DHJHDDjd9bmwOTwSdWrWu
ktdH2q6OqjyXpODsdVr5IdtXXzOChthvJ2nxaD4ncVWQBKq1OagdHRCnLiyQiXRP
Wwg7f1IZhMggJF+kMS+KKCkNGNsa9Jet4YDHtpZR2AxjpgrORiKA/fXyWBpml3xb
iZOGh1ufy+aDewOEc7Q9yRtS0znpxa4Hhsd700E6oFD2AB9+USa1Fwe+ZbwqyT6z
jOWOSVTdlbDfYRU8ZDz6JMXO8JRDXUGb+9ILco21tgsw8MRlKq6mlQhwAZ78bcnB
rz6wrrDPIUmG9jdg21ZvL58UuEGyYQxjNDHTuLlnS1i9NVaL7pRC/BQcd7aL3P0G
uVg74qmJlFV6BpYfqULYjFjWNOlRYlLggJ2tkH4+85yjAq8TYpEMiv/RPUJmS0KR
u65y7uhdfqFmsrSsf3zKgIhPj/o95mMs2iAYzLzyDKbIkFwXkuMl9ujO32iR0cpK
8lT7zPih15YDddHUgCEl0D+mqjuSZ8zxIzNKMyZSXhU0bhT16bSTzNHJhXT2C7Zc
GkHSiANFZ/bggMb6bTUHsz6fLy4ed6vOlR4lEsLqBFAz7dCuD8s=
=THzg
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
