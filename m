Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D27D031D379
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 01:39:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgJrq6YvJz3cm4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 11:39:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=orX+cYTF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=orX+cYTF; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgJqV4mM6z3bNd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 11:38:46 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DgJqT6xFBz9sSC; Wed, 17 Feb 2021 11:38:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613522325;
 bh=SytjlTtvQe3KI3rxB1W/YDnqdGpSQfmDFun03y0tPWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=orX+cYTFI4C34RmUe/rNIHu/b6MRfvZ8nbcmT3+R1y9HPeU8uZNjhvUmAnC7AgaBe
 ltiT7DiEG1IGUI9cW5/BDk6TmPBQakFEVUPZsxjgGWuGNfC6ydc4494iQhjXxERo8b
 e7Ozc0IPTlU0ixGJV8rB4Z1wUPvcwFFM331mwMqg=
Date: Wed, 17 Feb 2021 11:16:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel 2/2] powerpc/iommu: Do not immediately panic when
 failed IOMMU table allocation
Message-ID: <YCxgViVCK08S7BtV@yekko.fritz.box>
References: <20210216033307.69863-1-aik@ozlabs.ru>
 <20210216033307.69863-3-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="E/6FMYZ2DXmP95Q9"
Content-Disposition: inline
In-Reply-To: <20210216033307.69863-3-aik@ozlabs.ru>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--E/6FMYZ2DXmP95Q9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2021 at 02:33:07PM +1100, Alexey Kardashevskiy wrote:
> Most platforms allocate IOMMU table structures (specifically it_map)
> at the boot time and when this fails - it is a valid reason for panic().
>=20
> However the powernv platform allocates it_map after a device is returned
> to the host OS after being passed through and this happens long after
> the host OS booted. It is quite possible to trigger the it_map allocation
> panic() and kill the host even though it is not necessary - the host OS
> can still use the DMA bypass mode (requires a tiny fraction of it_map's
> memory) and even if that fails, the host OS is runnnable as it was without
> the device for which allocating it_map causes the panic.
>=20
> Instead of immediately crashing in a powernv/ioda2 system, this prints
> an error and continues. All other platforms still call panic().
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/kernel/iommu.c               |  6 ++++--
>  arch/powerpc/platforms/cell/iommu.c       |  3 ++-
>  arch/powerpc/platforms/pasemi/iommu.c     |  4 +++-
>  arch/powerpc/platforms/powernv/pci-ioda.c | 15 ++++++++-------
>  arch/powerpc/platforms/pseries/iommu.c    | 10 +++++++---
>  arch/powerpc/sysdev/dart_iommu.c          |  3 ++-
>  6 files changed, 26 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 8eb6eb0afa97..c1a5c366a664 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -728,8 +728,10 @@ struct iommu_table *iommu_init_table(struct iommu_ta=
ble *tbl, int nid,
>  	sz =3D BITS_TO_LONGS(tbl->it_size) * sizeof(unsigned long);
> =20
>  	tbl->it_map =3D vzalloc_node(sz, nid);
> -	if (!tbl->it_map)
> -		panic("iommu_init_table: Can't allocate %ld bytes\n", sz);
> +	if (!tbl->it_map) {
> +		pr_err("%s: Can't allocate %ld bytes\n", __func__, sz);
> +		return NULL;
> +	}
> =20
>  	iommu_table_reserve_pages(tbl, res_start, res_end);
> =20
> diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms=
/cell/iommu.c
> index 2124831cf57c..fa08699aedeb 100644
> --- a/arch/powerpc/platforms/cell/iommu.c
> +++ b/arch/powerpc/platforms/cell/iommu.c
> @@ -486,7 +486,8 @@ cell_iommu_setup_window(struct cbe_iommu *iommu, stru=
ct device_node *np,
>  	window->table.it_size =3D size >> window->table.it_page_shift;
>  	window->table.it_ops =3D &cell_iommu_ops;
> =20
> -	iommu_init_table(&window->table, iommu->nid, 0, 0);
> +	if (!iommu_init_table(&window->table, iommu->nid, 0, 0))
> +		panic("Failed to initialize iommu table");
> =20
>  	pr_debug("\tioid      %d\n", window->ioid);
>  	pr_debug("\tblocksize %ld\n", window->table.it_blocksize);
> diff --git a/arch/powerpc/platforms/pasemi/iommu.c b/arch/powerpc/platfor=
ms/pasemi/iommu.c
> index b500a6e47e6b..5be7242fbd86 100644
> --- a/arch/powerpc/platforms/pasemi/iommu.c
> +++ b/arch/powerpc/platforms/pasemi/iommu.c
> @@ -146,7 +146,9 @@ static void iommu_table_iobmap_setup(void)
>  	 */
>  	iommu_table_iobmap.it_blocksize =3D 4;
>  	iommu_table_iobmap.it_ops =3D &iommu_table_iobmap_ops;
> -	iommu_init_table(&iommu_table_iobmap, 0, 0, 0);
> +	if (!iommu_init_table(&iommu_table_iobmap, 0, 0, 0))
> +		panic("Failed to initialize iommu table");
> +
>  	pr_debug(" <- %s\n", __func__);
>  }
> =20
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/pla=
tforms/powernv/pci-ioda.c
> index f0f901683a2f..66c3c3337334 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1762,7 +1762,8 @@ static void pnv_pci_ioda1_setup_dma_pe(struct pnv_p=
hb *phb,
>  	tbl->it_ops =3D &pnv_ioda1_iommu_ops;
>  	pe->table_group.tce32_start =3D tbl->it_offset << tbl->it_page_shift;
>  	pe->table_group.tce32_size =3D tbl->it_size << tbl->it_page_shift;
> -	iommu_init_table(tbl, phb->hose->node, 0, 0);
> +	if (!iommu_init_table(tbl, phb->hose->node, 0, 0))
> +		panic("Failed to initialize iommu table");
> =20
>  	pe->dma_setup_done =3D true;
>  	return;
> @@ -1930,16 +1931,16 @@ static long pnv_pci_ioda2_setup_default_config(st=
ruct pnv_ioda_pe *pe)
>  		res_start =3D pe->phb->ioda.m32_pci_base >> tbl->it_page_shift;
>  		res_end =3D min(window_size, SZ_4G) >> tbl->it_page_shift;
>  	}
> -	iommu_init_table(tbl, pe->phb->hose->node, res_start, res_end);
> =20
> -	rc =3D pnv_pci_ioda2_set_window(&pe->table_group, 0, tbl);
> +	if (iommu_init_table(tbl, pe->phb->hose->node, res_start, res_end))
> +		rc =3D pnv_pci_ioda2_set_window(&pe->table_group, 0, tbl);
> +	else
> +		rc =3D -ENOMEM;
>  	if (rc) {
> -		pe_err(pe, "Failed to configure 32-bit TCE table, err %ld\n",
> -				rc);
> +		pe_err(pe, "Failed to configure 32-bit TCE table, err %ld\n", rc);
>  		iommu_tce_table_put(tbl);
> -		return rc;
> +		tbl =3D NULL; /* This clears iommu_table_base below */
>  	}
> -
>  	if (!pnv_iommu_bypass_disabled)
>  		pnv_pci_ioda2_set_bypass(pe, true);
> =20
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platfo=
rms/pseries/iommu.c
> index 9fc5217f0c8e..4d9ac1f181c2 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -638,7 +638,8 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus =
*bus)
> =20
>  	iommu_table_setparms(pci->phb, dn, tbl);
>  	tbl->it_ops =3D &iommu_table_pseries_ops;
> -	iommu_init_table(tbl, pci->phb->node, 0, 0);
> +	if (!iommu_init_table(tbl, pci->phb->node, 0, 0))
> +		panic("Failed to initialize iommu table");
> =20
>  	/* Divide the rest (1.75GB) among the children */
>  	pci->phb->dma_window_size =3D 0x80000000ul;
> @@ -720,7 +721,8 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bu=
s *bus)
>  		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
>  				ppci->table_group, dma_window);
>  		tbl->it_ops =3D &iommu_table_lpar_multi_ops;
> -		iommu_init_table(tbl, ppci->phb->node, 0, 0);
> +		if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
> +			panic("Failed to initialize iommu table");
>  		iommu_register_group(ppci->table_group,
>  				pci_domain_nr(bus), 0);
>  		pr_debug("  created table: %p\n", ppci->table_group);
> @@ -749,7 +751,9 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev =
*dev)
>  		tbl =3D PCI_DN(dn)->table_group->tables[0];
>  		iommu_table_setparms(phb, dn, tbl);
>  		tbl->it_ops =3D &iommu_table_pseries_ops;
> -		iommu_init_table(tbl, phb->node, 0, 0);
> +		if (!iommu_init_table(tbl, phb->node, 0, 0))
> +			panic("Failed to initialize iommu table");
> +
>  		set_iommu_table_base(&dev->dev, tbl);
>  		return;
>  	}
> diff --git a/arch/powerpc/sysdev/dart_iommu.c b/arch/powerpc/sysdev/dart_=
iommu.c
> index 6b4a34b36d98..1d33b7a5ea83 100644
> --- a/arch/powerpc/sysdev/dart_iommu.c
> +++ b/arch/powerpc/sysdev/dart_iommu.c
> @@ -344,7 +344,8 @@ static void iommu_table_dart_setup(void)
>  	iommu_table_dart.it_index =3D 0;
>  	iommu_table_dart.it_blocksize =3D 1;
>  	iommu_table_dart.it_ops =3D &iommu_dart_ops;
> -	iommu_init_table(&iommu_table_dart, -1, 0, 0);
> +	if (!iommu_init_table(&iommu_table_dart, -1, 0, 0))
> +		panic("Failed to initialize iommu table");
> =20
>  	/* Reserve the last page of the DART to avoid possible prefetch
>  	 * past the DART mapped area

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--E/6FMYZ2DXmP95Q9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAsYFYACgkQbDjKyiDZ
s5J80g/+Oq19AnsI6a7CCUiVrhPJlwDr/1s0SpXyJ5W09ifnsc0cMdGs30rGZt4Z
Niz3s0A+e9NbRf8IaWQUNMqMTeBWefRwB3stmKoh8MbvyCr/KQEJcqK98Te6Xj5E
TJnYoM9f8bZ5lsldaq5DKp0H23BeqvwBDLUEJaILP+XEAOFwSGLvhIEbmQhkf1Dm
N+Z6sJ68iuhq+5y1ozye7AO50KYKPYAc6RKqEgu6vFhfny+o7c77h77s5CanEXk5
pIqstPKLsPiUTrzooZi2qNr18MsOQALx4x9boiyMJ9kTmj1Jhs5PrxCT9Xghkblz
wenkPtcDEUDLthm8DOlMplKm/0I6wg00WzWkj5IfFbssMfY0NT6m5w7zfwyzP50D
rHLI5E82HM/C87r8JpROIubBsH4xh/FhADUIh5iMHhrcB/kzwiYnoggozyXymfup
ZH59Mgv9dtunEldZEvc74fMEXY2M+rfXhuR0jyGkbB51zDWFgeJLUs07udPWXDlW
7cBYv+zmXWj7RRdQ/kcJ24E9sQAk+W4up/VDoW3S9bJZwpz4KzMobHD1ZAm61RnL
rLSwhORLP6sgxvBuFOQhj3vRccncglGq2zi4yYmq5Di4u2Dj+8Qxuy7XvbJVmNri
yFV1HVCD7I1KvfmA5T4W++fHcUw65qs0HlwwhcPo1JvQCt3G9Hk=
=IrzQ
-----END PGP SIGNATURE-----

--E/6FMYZ2DXmP95Q9--
