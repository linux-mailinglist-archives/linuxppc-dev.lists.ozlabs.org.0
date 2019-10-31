Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7039CEB44A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 16:55:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473qdy50lqzF5qn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 02:55:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de;
 envelope-from=nsaenzjulienne@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473qby0vwlzF5qV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 02:53:18 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E32D1B7DF;
 Thu, 31 Oct 2019 15:53:14 +0000 (UTC)
Message-ID: <40d06d463c05d36968e8b64924d78f7794f8de50.camel@suse.de>
Subject: Re: [PATCH] dma/direct: turn ARCH_ZONE_DMA_BITS into a variable
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>
Date: Thu, 31 Oct 2019 16:53:13 +0100
In-Reply-To: <20191031154759.GA7162@lst.de>
References: <20191031152837.15253-1-nsaenzjulienne@suse.de>
 <20191031154759.GA7162@lst.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-IbItouLWOYON9B5ojQkb"
User-Agent: Evolution 3.34.1 
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 linuxppc-dev@lists.ozlabs.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Paul Mackerras <paulus@samba.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-IbItouLWOYON9B5ojQkb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-10-31 at 16:47 +0100, Christoph Hellwig wrote:
> On Thu, Oct 31, 2019 at 04:28:37PM +0100, Nicolas Saenz Julienne wrote:
> > Some architectures, notably ARM, are interested in tweaking this
> > depending on their runtime DMA addressing limitations.
> >=20
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > ---
> >=20
> > Changes since RFC:
> >  - Rebased to v5.4-rc6, fixed arm64 code.
> >=20
> > NOTE: This will only apply to linux-next, where=20
>=20
> missing end of the sentence.  But only applying to linux-next isn't
> going to help anyone..

Arrgh, excuse me, I meant to delete that line.

> > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > index 45c00a54909c..f716ea634804 100644
> > --- a/arch/arm64/mm/init.c
> > +++ b/arch/arm64/mm/init.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/sort.h>
> >  #include <linux/of.h>
> >  #include <linux/of_fdt.h>
> > +#include <linux/dma-direct.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/dma-contiguous.h>
> >  #include <linux/efi.h>
> > @@ -41,6 +42,8 @@
> >  #include <asm/tlb.h>
> >  #include <asm/alternative.h>
> > =20
> > +#define ARM64_ZONE_DMA_BITS	30
> > +
> >  /*
> >   * We need to be able to catch inadvertent references to memstart_addr
> >   * that occur (potentially in generic code) before arm64_memblock_init=
()
> > @@ -424,6 +427,8 @@ void __init arm64_memblock_init(void)
> >  	else
> >  		arm64_dma_phys_limit =3D PHYS_MASK + 1;
> > =20
> > +	zone_dma_bits =3D ARM64_ZONE_DMA_BITS;
> > +
> >  	reserve_crashkernel();
>=20
> This actually adds a new limit, as there wasn't one before for arm64.

Well, as zone_dma_bits is only relevant in dma/direct when ZONE_DMA is defi=
ned
I figured it doesn't matter if the variable is set conditionally to ZONE_DM=
A or
not.


--=-IbItouLWOYON9B5ojQkb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl27A2kACgkQlfZmHno8
x/7XBAf+KJ5m8SMWsJJk7jjM0aD1BkIeWDHPYCN7ZJq7655nTwa46aZv3zb18e3J
4muJ6LfXcTh/PbK64B+/uJ+wGYyg0y4ObyEshTyxygfgDnnyCQ4Mr3kD38jm40tR
pJh9bItNrHBr+LzC2oZhwwnj4K4haI2q1HO8C6waGzeQLNW6KGmQquBqbROWiTG3
EJVQ5SwIHesd1qwzVo+Lpba3IHAf6FrVDoZ1/TnUCDgkEvPOX2N20IUroOb0O2Eu
5L80i++E4veGNr4AxY2Ne0kXVIZWCiZNoO5HpB7EPreFYta5w5JCbVqZDvGl9YGI
T+txLLE6SqBuvD/E5j2iwzXXv2SqQA==
=jZsg
-----END PGP SIGNATURE-----

--=-IbItouLWOYON9B5ojQkb--

