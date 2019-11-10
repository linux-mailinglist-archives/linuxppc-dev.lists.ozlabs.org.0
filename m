Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7626BF6B94
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 22:13:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47B6Dp4fmNzF1Qk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 08:13:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47B69h2LjvzF10f
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 08:10:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="GXUH/Zuc"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47B69g21Jbz9sPK; Mon, 11 Nov 2019 08:10:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1573420247;
 bh=sgl6XwaqQKuWwNLFcxgCVCJd1ny8a3Y5WhLWIZgRB+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GXUH/ZucMTSO8lUMwgX4o1MuQVS9+ZQ/DD/1O8usLKlRKOyhuj/4hI8/57w/C9XLP
 SnmdxtnIbeEhqXifQjE5gJSakdwrJwzIk2m0e2GOxJZ7fI2ctXgvC+WP6SVSAFn6M4
 Rwg/wedGqEhGy8Ca+ER2oTOv+sJZHGOBeMj9j3os=
Date: Sun, 10 Nov 2019 19:40:06 +0000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [RFC v2 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
Message-ID: <20191110194006.GQ2461@umbus.Home>
References: <1573254011-1604-1-git-send-email-linuxram@us.ibm.com>
 <1573254011-1604-2-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="63aIh6YiuHX+oBFP"
Content-Disposition: inline
In-Reply-To: <1573254011-1604-2-git-send-email-linuxram@us.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: andmike@us.ibm.com, mst@redhat.com, aik@ozlabs.ru,
 mdroth@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, ram.n.pai@gmail.com,
 cai@lca.pw, tglx@linutronix.de, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--63aIh6YiuHX+oBFP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2019 at 03:00:10PM -0800, Ram Pai wrote:
> The hypervisor needs to access the contents of the page holding the TCE
> entries while setting up the TCE entries in the IOMMU's TCE table.
>=20
> For SecureVMs, since this page is encrypted, the hypervisor cannot
> access valid entries. Share the page with the hypervisor. This ensures
> that the hypervisor sees those valid entries.
>=20
> Why is this safe?
>    The page contains only TCE entries; not any sensitive data
>    belonging to the Secure VM. The hypervisor has a genuine need to know
>    the value of the TCE entries, without which it will not be able to
>    DMA to/from the pages pointed to by the TCE entries. In a Secure
>    VM the TCE entries point to pages that are also shared with the
>    hypervisor; example: pages containing bounce buffers.

The bit that may not be obvious to reviewers from the above is this:

This is *not* a page of "live" TCEs which are actively used for
translation.  Instead this is just a transient buffer with a batch of
TCEs to set, passed to the hypervisor with the H_PUT_TCE_INDIRECT call.

>=20
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platfo=
rms/pseries/iommu.c
> index 8d9c2b1..a302aaa 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -37,6 +37,7 @@
>  #include <asm/mmzone.h>
>  #include <asm/plpar_wrappers.h>
>  #include <asm/svm.h>
> +#include <asm/ultravisor.h>
> =20
>  #include "pseries.h"
> =20
> @@ -179,6 +180,23 @@ static int tce_build_pSeriesLP(struct iommu_table *t=
bl, long tcenum,
> =20
>  static DEFINE_PER_CPU(__be64 *, tce_page);
> =20
> +/*
> + * Allocate a tce page.  If secure VM, share the page with the hyperviso=
r.
> + *
> + * NOTE: the TCE page is shared with the hypervisor explicitly and remai=
ns
> + * shared for the lifetime of the kernel. It is implicitly unshared at k=
ernel
> + * shutdown through a UV_UNSHARE_ALL_PAGES ucall.
> + */
> +static __be64 *alloc_tce_page(void)
> +{
> +	__be64 *tcep =3D (__be64 *)__get_free_page(GFP_ATOMIC);
> +
> +	if (tcep && is_secure_guest())
> +		uv_share_page(PHYS_PFN(__pa(tcep)), 1);
> +
> +	return tcep;
> +}
> +
>  static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>  				     long npages, unsigned long uaddr,
>  				     enum dma_data_direction direction,
> @@ -206,8 +224,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_tabl=
e *tbl, long tcenum,
>  	 * from iommu_alloc{,_sg}()
>  	 */
>  	if (!tcep) {
> -		tcep =3D (__be64 *)__get_free_page(GFP_ATOMIC);
> -		/* If allocation fails, fall back to the loop implementation */
> +		tcep =3D alloc_tce_page();
>  		if (!tcep) {
>  			local_irq_restore(flags);
>  			return tce_build_pSeriesLP(tbl, tcenum, npages, uaddr,
> @@ -405,7 +422,7 @@ static int tce_setrange_multi_pSeriesLP(unsigned long=
 start_pfn,
>  	tcep =3D __this_cpu_read(tce_page);
> =20
>  	if (!tcep) {
> -		tcep =3D (__be64 *)__get_free_page(GFP_ATOMIC);
> +		tcep =3D alloc_tce_page();
>  		if (!tcep) {
>  			local_irq_enable();
>  			return -ENOMEM;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--63aIh6YiuHX+oBFP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3IZ5MACgkQbDjKyiDZ
s5K+kQ/+PKlvYDKC8LlZl7hGJs9oVVlDQG/Q3tWSAsQWzhygYK+NhJxNT1t0AF0I
0HnXRPw673myMED+6+j/cIS6zKg3N9GoOwBnaIxh+CzpsbzGtG+4XpCPcrAVO5+k
9vBX6Bhr+UmvI4V1tfW6Q3c7MEMEtH4VX57ZSZe9Poq5p39NVyX3nggrIZxlsgjC
SI90Vj/iGgfs3lyT+bIq9TU9N7pduaW6+JvNArThePpmUMgwc+EbVSGEh851wsGe
Uav8B7Axg8ZlKsA1XSf+WfHU4Z+/fsYYOBMSfecs1SvyxizGaWoGXayKe1aaGWSj
amPV9YZYecLkDPZG558cvT20KGnJ6JpJwebhVVzKIv8b/oLOzIjrHEku7Jy1OR+o
PfYzfpt2Ddc2NGQjsq8ppB6FuAAMRcn5FXtXnxWqS0AbIo+nJ7r9R2gYk1TD+VF7
S/7LmPh1Cd/xBZyxJFruj0qL21lGA9J0ff1MY7/qZ/8tySd0qJ4ehfQElJAFGSQC
4JFQFXrC6GLyHdAgF3jCr7AVIcSEy7Zwt4ueNYtPoFFXYqR29UXzGngVUXSb1+90
nZ9AJDRbFwtQo0ySgMYrchZw9ZOcRkDVuU730lwznf9+n0XpEdBjCauCuV0AK4PY
yrrBbg8WWdqOYmtgafVuQmUQhX2NFMVYx98wTFJWLT9FaJVBoo4=
=zGQn
-----END PGP SIGNATURE-----

--63aIh6YiuHX+oBFP--
