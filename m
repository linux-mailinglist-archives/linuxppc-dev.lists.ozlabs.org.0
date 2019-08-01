Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 427337DFB0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 18:02:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zw6s4hLLzDqtn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 02:02:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de;
 envelope-from=nsaenzjulienne@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zw4K0xzJzDqHb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 02:00:31 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7FF1DAC2E;
 Thu,  1 Aug 2019 16:00:27 +0000 (UTC)
Message-ID: <ed5388412df78ad0a9ed69cdf3ac716eac075141.camel@suse.de>
Subject: Re: [PATCH 6/8] dma-direct: turn ARCH_ZONE_DMA_BITS into a variable
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>
Date: Thu, 01 Aug 2019 17:59:34 +0200
In-Reply-To: <20190801140452.GB23435@lst.de>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
 <20190731154752.16557-7-nsaenzjulienne@suse.de>
 <20190801140452.GB23435@lst.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-1xpVXG9aO5tI8LW1PkIr"
User-Agent: Evolution 3.32.4 
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, eric@anholt.net,
 Paul Mackerras <paulus@samba.org>, will@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, phill@raspberryi.org,
 linux-s390@vger.kernel.org, f.fainelli@gmail.com, frowand.list@gmail.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, catalin.marinas@arm.com,
 devicetree@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 marc.zyngier@arm.com, robh+dt@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, wahrenst@gmx.net, akpm@linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-1xpVXG9aO5tI8LW1PkIr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph, thanks for the review.

On Thu, 2019-08-01 at 16:04 +0200, Christoph Hellwig wrote:
> A few nitpicks, otherwise this looks great:
>=20
> > @@ -201,7 +202,7 @@ static int __init mark_nonram_nosave(void)
> >   * everything else. GFP_DMA32 page allocations automatically fall back=
 to
> >   * ZONE_DMA.
> >   *
> > - * By using 31-bit unconditionally, we can exploit ARCH_ZONE_DMA_BITS =
to
> > + * By using 31-bit unconditionally, we can exploit arch_zone_dma_bits =
to
> >   * inform the generic DMA mapping code.  32-bit only devices (if not
> > handled
> >   * by an IOMMU anyway) will take a first dip into ZONE_NORMAL and get
> >   * otherwise served by ZONE_DMA.
> > @@ -237,9 +238,18 @@ void __init paging_init(void)
> >  	printk(KERN_DEBUG "Memory hole size: %ldMB\n",
> >  	       (long int)((top_of_ram - total_ram) >> 20));
> > =20
> > +	/*
> > +	 * Allow 30-bit DMA for very limited Broadcom wifi chips on many
> > +	 * powerbooks.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_PPC32))
> > +		arch_zone_dma_bits =3D 30;
> > +	else
> > +		arch_zone_dma_bits =3D 31;
> > +
>=20
> So the above unconditionally comment obviously isn't true any more, and
> Ben also said for the recent ppc32 hack he'd prefer dynamic detection.
>=20
> Maybe Ben and or other ppc folks can chime in an add a patch to the serie=
s
> to sort this out now that we have a dynamic ZONE_DMA threshold?

Noted, for now I'll remove the comment.

> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 59bdceea3737..40dfc9b4ee4c 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -19,9 +19,7 @@
> >   * Most architectures use ZONE_DMA for the first 16 Megabytes, but
> >   * some use it for entirely different regions:
> >   */
> > -#ifndef ARCH_ZONE_DMA_BITS
> > -#define ARCH_ZONE_DMA_BITS 24
> > -#endif
> > +unsigned int arch_zone_dma_bits __ro_after_init =3D 24;
>=20
> I'd prefer to drop the arch_ prefix and just calls this zone_dma_bits.
> In the long run we really need to find a way to just automatically set
> this from the meminit code, but that is out of scope for this series.
> For now can you please just update the comment above to say something
> like:
>=20
> /*
>  * Most architectures use ZONE_DMA for the first 16 Megabytes, but some u=
se it
>  * it for entirely different regions.  In that case the arch code needs t=
o
>  * override the variable below for dma-direct to work properly.
>  */

Ok perfect.


--=-1xpVXG9aO5tI8LW1PkIr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl1DDGYACgkQlfZmHno8
x/7w9wgAsuuhgVK1nlC7WgrB2sfSYqL6HTJlDfkLJ2RMgzu/WSw4RJsje86on5R9
NmRSTVntXnCdpTNiKcSEKP7MnrVtMh2TtopfTOCvgho/uDJsc4DPAqZaLHO4quzo
ZfimsWkcpC6n/E8ybEcew+6U7BIyqJPtqxgdkXz98gLQ1NK1wJU2x0Gt+KXT5a/0
hR3hA3whz8yIe4hwQTEiAzX/LnSP8+Yp+g1LLFjYveqt2RUbfC/udykYkLS7LdoO
SJ6j5S/1jRpvusBjENkY3PQiRGrhfRnT4qxVSdpkK/rMG6pLMW4l9YjfbQCLOFhn
8qxZKNifDs1KxpZjExjd4Lisum4nhw==
=nw8i
-----END PGP SIGNATURE-----

--=-1xpVXG9aO5tI8LW1PkIr--

