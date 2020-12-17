Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CD42DCB82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 04:56:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxJ8X1ZBgzDqVH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 14:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxJ6y3RyPzDqJL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 14:55:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=AnZ2uWwW; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CxJ6y0MzKz9sTK; Thu, 17 Dec 2020 14:55:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1608177322;
 bh=cvgT7gwiMUPIhgMBd9kg9Hf6iDUYg9kOAYSlr1+qXUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AnZ2uWwWKqUVXSWLWJsrGGFWu/L0y3N9fFj/Fa0d2kdB8zS8/+T63tbyQD0q/CBHP
 M0qTYdswJ3Xejgcw37hgTBt4o+bUFYVMp273QhyZsbX/cIpoHyhSUMo1B8bYqfn42l
 Ur/bMRvKY+AXCWj5710xJyqNv9AumpfnEAAp0umg=
Date: Thu, 17 Dec 2020 14:33:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] Support for H_RPT_INVALIDATE in PowerPC KVM
Message-ID: <20201217033335.GD310465@yekko.fritz.box>
References: <20201216085447.1265433-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline
In-Reply-To: <20201216085447.1265433-1-bharata@linux.ibm.com>
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 02:24:45PM +0530, Bharata B Rao wrote:
> This patchset adds support for the new hcall H_RPT_INVALIDATE
> and replaces the nested tlb flush calls with this new hcall
> if support for the same exists.
>=20
> Changes in v2:
> -------------
> - Not enabling the hcall by default now, userspace can enable it when
>   required.
> - Added implementation for process-scoped invalidations in the hcall.
>=20
> v1: https://lore.kernel.org/linuxppc-dev/20201019112642.53016-1-bharata@l=
inux.ibm.com/T/#t
>=20
> H_RPT_INVALIDATE
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Syntax:
> int64=A0=A0 /* H_Success: Return code on successful completion */
> =A0=A0=A0=A0=A0=A0=A0 /* H_Busy - repeat the call with the same */
> =A0=A0=A0=A0=A0=A0=A0 /* H_Parameter, H_P2, H_P3, H_P4, H_P5 : Invalid pa=
rameters */
> =A0=A0=A0=A0=A0=A0=A0 hcall(const uint64 H_RPT_INVALIDATE, /* Invalidate =
RPT translation lookaside information */
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint64 pid,=A0=A0=A0=A0=A0=A0 /* =
PID/LPID to invalidate */
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint64 target,=A0=A0=A0 /* Invali=
dation target */
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint64 type,=A0=A0=A0=A0=A0 /* Ty=
pe of lookaside information */
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint64 pageSizes,=A0=A0=A0=A0 /* =
Page sizes */
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint64 start,=A0=A0=A0=A0 /* Star=
t of Effective Address (EA) range (inclusive) */
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint64 end)=A0=A0=A0=A0=A0=A0 /* =
End of EA range (exclusive) */
>=20
> Invalidation targets (target)
> -----------------------------
> Core MMU=A0=A0=A0=A0=A0=A0=A0 0x01 /* All virtual processors in the parti=
tion */
> Core local MMU=A0 0x02 /* Current virtual processor */
> Nest MMU=A0=A0=A0=A0=A0=A0=A0 0x04 /* All nest/accelerator agents in use =
by the partition */
>=20
> A combination of the above can be specified, except core and core local.
>=20
> Type of translation to invalidate (type)
> ---------------------------------------
> NESTED=A0=A0=A0=A0=A0=A0 0x0001=A0 /* Invalidate nested guest partition-s=
cope */
> TLB=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x0002=A0 /* Invalidate TLB */
> PWC=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x0004=A0 /* Invalidate Page Walk Cache =
*/
> PRT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x0008=A0 /* Invalidate Process Table En=
tries if NESTED is clear */
> PAT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x0008=A0 /* Invalidate Partition Table =
Entries=A0if NESTED is set */
>=20
> A combination of the above can be specified.
>=20
> Page size mask (pageSizes)
> --------------------------
> 4K=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x01
> 64K=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x02
> 2M=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x04
> 1G=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x08
> All sizes=A0=A0=A0=A0=A0=A0 (-1UL)

PAPR really has a real talent for tying its own shoelaces together.
They could have just made the bit for each pagesize be... the size of
the page, but why use something obviously extensible to any future
pagesizes when we can make it both less flexible and more complicated
to deal with.  Sigh.

>=20
> A combination of the above can be specified.
> All page sizes can be selected with -1.
>=20
> Semantics: Invalidate radix tree lookaside information
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 matching the parameters given.
> * Return H_P2, H_P3 or H_P4 if target, type, or pageSizes parameters are
> =A0 different from the defined values.
> * Return H_PARAMETER if NESTED is set and pid is not a valid nested
>   LPID allocated to this partition
> * Return H_P5 if (start, end) doesn't form a valid range. Start and end
>   should be a valid Quadrant address and=A0 end > start.
> * Return H_NotSupported if the partition is not in running in radix
>   translation mode.
> * May invalidate more translation information than requested.
> * If start =3D 0 and end =3D -1, set the range to cover all valid address=
es.
> =A0 Else start and end should be aligned to 4kB (lower 11 bits clear).
> * If NESTED is clear, then invalidate process scoped lookaside informatio=
n.
> =A0 Else pid specifies a nested LPID, and the invalidation is performed
> =A0 on nested guest partition table and nested guest partition scope real
>   addresses.
> * If pid =3D 0 and NESTED is clear, then valid addresses are quadrant 3 a=
nd
> =A0 quadrant 0 spaces, Else valid addresses are quadrant 0.
> * Pages which are fully covered by the range are to be invalidated.
> =A0 Those which are partially covered are considered outside invalidation
> =A0 range, which allows a caller to optimally invalidate ranges that may
> =A0 contain mixed page sizes.
> * Return H_SUCCESS on success.
>=20
> Bharata B Rao (2):
>   KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE
>   KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in nested KVM
>=20
>  Documentation/virt/kvm/api.rst                |  17 +++
>  .../include/asm/book3s/64/tlbflush-radix.h    |  18 +++
>  arch/powerpc/include/asm/kvm_book3s.h         |   3 +
>  arch/powerpc/kvm/book3s_64_mmu_radix.c        |  27 +++-
>  arch/powerpc/kvm/book3s_hv.c                  | 121 ++++++++++++++++++
>  arch/powerpc/kvm/book3s_hv_nested.c           | 106 ++++++++++++++-
>  arch/powerpc/kvm/powerpc.c                    |   3 +
>  arch/powerpc/mm/book3s64/radix_tlb.c          |   4 -
>  include/uapi/linux/kvm.h                      |   1 +
>  9 files changed, 289 insertions(+), 11 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/a0Y0ACgkQbDjKyiDZ
s5IY3g//RYfZQj7oWfCOGQ+WiPvmXzedSNgcem45g35yyy7rO/PITIkfIpRQYfcJ
C28T90418pE5b6bqIsFwkWrWhVUye3htZv51A41LItymTEFwsN7TA60BByMEHkw5
SFromcnxg6hWw07vrYP9YPUBcDyDNk/b53kbEQ34x0Rb04X9/jRcQfP7mh8lRthN
cJUpzrtunAlEsHRdWrkZgSlVEOf9jgnrDAjsf0jrnVTjEydt9EQRlcz3/xrDgXOi
N71adhtfOVYin8nEEIGhBfdDt04LrLhh/bS/AxGtsNUKEf/XUZUqS0I4gowjPrDA
Wkp3iZf08fTHJ9BBT+FIAjSvTkak58z8CUw2fLQLNTsX1MgwbtiY9FfvvNfh/u+9
0lWobO3uA7CGVXPAmPNefk7wYtVh8NVUWRPgcqZVpk1h+C0dmuve9tuXnjySi1SC
JVwYtGPHtg9gLgkCZ6WGF6o226++Kpf60qZR1bdrUYmyJNYL8sUi8LFRSdF6+5B+
hKqhlwlsoqhoT7wcfyWnRmmjcqGw30Z4dlu7wN/FR0FaC2/B7HtHNocByDDuB/9V
PChVQGKhrMcJhnNmVK1/fXvgtpxw8Y2QgXQ0/I87T6F7LCZNuDjXOq8DnDpDNWQO
Hywz9usBXeRjl19j91LWQ7fvJgmrKgepUeSR2l7pO9PMdjf4UpY=
=weEp
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
