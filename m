Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD407F9806
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 04:49:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=tq93Kuo3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sds6Q0gC8z3c1L
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 14:49:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=tq93Kuo3;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (unknown [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sds5X256xz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 14:49:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701056933;
	bh=xDZKSlzh1/UCfSWZwMAP6iEXsWt5FFryCFfldIgRDvM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tq93Kuo33izvLI6GbhYWWx5Ia6NAAoD3hBp9dEPcUCYATgIfb9agy/7CueloQpLu3
	 gHrLDRCrAebicnW4a+sFrH9U0rjM9jOgirIPng00QJD7JlfXMPC8LVt2KGV4rtZziu
	 /MyP/uaZy2XREwjPURXMecVh/lIETFw4KrVpknXPLoPVRZyDrzv3eAsQ2PucYbX8WS
	 lHbLA9tiG6FMRAOBm0zmpYMUPAc1itaGiR4A7aoRVg1h0pBU9lLA1bI1uVTslL5RQh
	 MFVzulnEAitK6bDbE3vNqo8lfVd2Z4/V/kAF2XcqsmSu6XHG4BBcN+PlIu3ZAV+LRA
	 7D7yIe3iAv17Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sds5K2g9nz4wbr;
	Mon, 27 Nov 2023 14:48:53 +1100 (AEDT)
Date: Mon, 27 Nov 2023 14:48:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20231127144852.069b2e7e@canb.auug.org.au>
In-Reply-To: <20231127132809.45c2b398@canb.auug.org.au>
References: <20231127132809.45c2b398@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1OxpgZpOL2DDzmvOW3C.v.M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/1OxpgZpOL2DDzmvOW3C.v.M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Just cc'ing the PowerPC guys to see if my fix is sensible.

On Mon, 27 Nov 2023 13:28:09 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the mm tree, today's linux-next build (powerpc64
> allnoconfig) failed like this:
>=20
> arch/powerpc/mm/book3s64/pgtable.c:557:5: error: no previous prototype fo=
r 'pmd_move_must_withdraw' [-Werror=3Dmissing-prototypes]
>   557 | int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   c6345dfa6e3e ("Makefile.extrawarn: turn on missing-prototypes globally")
>=20
> I have added the following patch for today (which could be applied to
> the mm or powerpc trees):
>=20
> From 194805b44c11b4c0aa28bdcdc0bb0d82acef394c Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 27 Nov 2023 13:08:57 +1100
> Subject: [PATCH] powerpc: pmd_move_must_withdraw() is only needed for
>  CONFIG_TRANSPARENT_HUGEPAGE
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/mm/book3s64/pgtable.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s6=
4/pgtable.c
> index be229290a6a7..3438ab72c346 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -542,6 +542,7 @@ void ptep_modify_prot_commit(struct vm_area_struct *v=
ma, unsigned long addr,
>  	set_pte_at(vma->vm_mm, addr, ptep, pte);
>  }
> =20
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  /*
>   * For hash translation mode, we use the deposited table to store hash s=
lot
>   * information and they are stored at PTRS_PER_PMD offset from related p=
md
> @@ -563,6 +564,7 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_p=
tl,
> =20
>  	return true;
>  }
> +#endif
> =20
>  /*
>   * Does the CPU support tlbie?
> --=20
> 2.40.1

--=20
Cheers,
Stephen Rothwell

--Sig_/1OxpgZpOL2DDzmvOW3C.v.M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVkEaQACgkQAVBC80lX
0Gx3Uwf/eggLiBT0CMRtGTvKcImnVpzRYOstDC8af1O5yiQc2pfZeP1h5aG+DXTw
eT/PR/kTiL3zK9pywiKe3a2wJu0UN/QZinW/7Mk/xJf3L8JHGUu+fyAaVjBKqjm9
Ze+PH6AACdmi84DkTzOKmkLZR7AauuyKyuDbltPMrga6zsex0/shCRHRxjs3aGQu
x+4eeWsjx2Pf24kUHrQ8f44+5cJZ+A9Vjzh99cJvycepd3GJEoTohBEPoda0NFCD
xIGHUDC1B/dNuxzaGYkYy6jqYWtk/cjJOI/I3KvzYubPQwr3m7OVhe4EI11IyvSR
kpoHYFK6c3LJ3LNWRf5SWFs3mS6+gA==
=N35d
-----END PGP SIGNATURE-----

--Sig_/1OxpgZpOL2DDzmvOW3C.v.M--
