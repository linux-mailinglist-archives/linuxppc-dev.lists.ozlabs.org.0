Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E422F4CA9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 15:03:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG8Kf62KlzDrcW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 01:03:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=nsaenzjulienne@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG8Fx4DXkzDrWZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 00:59:43 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17911AB92;
 Wed, 13 Jan 2021 13:59:39 +0000 (UTC)
Message-ID: <7ed51025f051f65f3dfe10a88caeb648821994b1.camel@suse.de>
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Florian Fainelli <f.fainelli@gmail.com>, Claire Chang
 <tientzu@chromium.org>,  robh+dt@kernel.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,  joro@8bytes.org,
 will@kernel.org, frowand.list@gmail.com, konrad.wilk@oracle.com, 
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 hch@lst.de,  m.szyprowski@samsung.com, robin.murphy@arm.com
Date: Wed, 13 Jan 2021 14:59:34 +0100
In-Reply-To: <95ae9c1e-c1f1-5736-fe86-12ced1f648f9@gmail.com>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
 <95ae9c1e-c1f1-5736-fe86-12ced1f648f9@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-t4If4GPTxFUMkhdNPchG"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com,
 grant.likely@arm.com, saravanak@google.com, peterz@infradead.org,
 xypron.glpk@gmx.de, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
 treding@nvidia.com, bgolaszewski@baylibre.com,
 iommu@lists.linux-foundation.org, drinkcat@chromium.org, rdunlap@infradead.org,
 gregkh@linuxfoundation.org, xen-devel@lists.xenproject.org,
 dan.j.williams@intel.com, andriy.shevchenko@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-t4If4GPTxFUMkhdNPchG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

On Tue, 2021-01-12 at 16:03 -0800, Florian Fainelli wrote:
> On 1/5/21 7:41 PM, Claire Chang wrote:
> > Add the initialization function to create restricted DMA pools from
> > matching reserved-memory nodes in the device tree.
> >=20
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> > =C2=A0include/linux/device.h  |   4 ++
> > =C2=A0include/linux/swiotlb.h |   7 +-
> > =C2=A0kernel/dma/Kconfig      |   1 +
> > =C2=A0kernel/dma/swiotlb.c    | 144 ++++++++++++++++++++++++++++++++++-=
-----
> > =C2=A04 files changed, 131 insertions(+), 25 deletions(-)
> >=20
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 89bb8b84173e..ca6f71ec8871 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -413,6 +413,7 @@ struct dev_links_info {
> > =C2=A0=C2=A0* @dma_pools:	Dma pools (if dma'ble device).
> > =C2=A0=C2=A0* @dma_mem:	Internal for coherent mem override.
> > =C2=A0=C2=A0* @cma_area:	Contiguous memory area for dma allocations
> > + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
> > =C2=A0=C2=A0* @archdata:	For arch-specific additions.
> > =C2=A0=C2=A0* @of_node:	Associated device tree node.
> > =C2=A0=C2=A0* @fwnode:	Associated device node supplied by platform firm=
ware.
> > @@ -515,6 +516,9 @@ struct device {
> > =C2=A0#ifdef CONFIG_DMA_CMA
> > =C2=A0	struct cma *cma_area;		/* contiguous memory area for dma
> > =C2=A0					   allocations */
> > +#endif
> > +#ifdef CONFIG_SWIOTLB
> > +	struct io_tlb_mem	*dma_io_tlb_mem;
> > =C2=A0#endif
> > =C2=A0	/* arch specific additions */
> > =C2=A0	struct dev_archdata	archdata;
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index dd8eb57cbb8f..a1bbd7788885 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -76,12 +76,13 @@ extern enum swiotlb_force swiotlb_force;
> > =C2=A0=C2=A0*
> > =C2=A0=C2=A0* @start:	The start address of the swiotlb memory pool. Use=
d to do a quick
> > =C2=A0=C2=A0*		range check to see if the memory was in fact allocated b=
y this
> > - *		API.
> > + *		API. For restricted DMA pool, this is device tree adjustable.
>=20
> Maybe write it as this is "firmware adjustable" such that when/if ACPI
> needs something like this, the description does not need updating.
>=20
> [snip]
>=20
> > +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> > +				    struct device *dev)
> > +{
> > +	struct io_tlb_mem *mem =3D rmem->priv;
> > +	int ret;
> > +
> > +	if (dev->dma_io_tlb_mem)
> > +		return -EBUSY;
> > +
> > +	if (!mem) {
> > +		mem =3D kzalloc(sizeof(*mem), GFP_KERNEL);
> > +		if (!mem)
> > +			return -ENOMEM;
> > +
> > +		if (!memremap(rmem->base, rmem->size, MEMREMAP_WB)) {
>=20
> MEMREMAP_WB sounds appropriate as a default.

As per the binding 'no-map' has to be disabled here. So AFAIU, this memory =
will
be part of the linear mapping. Is this really needed then?

> Documentation/devicetree/bindings/reserved-memory/ramoops.txt does
> define an "unbuffered" property which in premise could be applied to the
> generic reserved memory binding as well and that we may have to be
> honoring here, if we were to make it more generic. Oh well, this does
> not need to be addressed right now I guess.




--=-t4If4GPTxFUMkhdNPchG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl/+/MYACgkQlfZmHno8
x/57/wf8DfucOc1/3ySk20PkRc6qv7RWXbGw5RAUSZfXGpnHv1mAOnBMd6ProWeU
mJiYuCGcljwaI92Dc4Yca/JpWSeZmXWl/HZ+T0GIF9SegR36L8j5Fwop/zptM3kF
Je0VZZ/VIXKkgr7rp0yqFNRFB0vGuXdQz022npLJ4YKgyN1uvEaVgVCEeKuB/gSc
7BYPkilOLaUXaBxRcA6l7mcQZc4vqCMW3Lzl/9IM+mKhrhFllZI3pvBFnWed+k2J
JVdA5hjLI3QQrsXYH8+AfKlhLjzzMCGn5E5Gw1IPluIoeObgEwwLfYuMHbOvFplQ
3LHRL6KrY2rpsuzPeVMDM0TFPae/Hw==
=L05t
-----END PGP SIGNATURE-----

--=-t4If4GPTxFUMkhdNPchG--

