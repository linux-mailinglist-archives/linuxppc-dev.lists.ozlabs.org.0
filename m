Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD742EB4AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 17:25:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473rJl5Z7LzF656
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 03:25:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 473rGK6d9xzF5Df
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 03:23:04 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 60797B833;
 Thu, 31 Oct 2019 16:23:01 +0000 (UTC)
Message-ID: <6726a651c12d91ca22b9d8984745d90db5d507ec.camel@suse.de>
Subject: Re: [PATCH] dma/direct: turn ARCH_ZONE_DMA_BITS into a variable
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>
Date: Thu, 31 Oct 2019 17:22:59 +0100
In-Reply-To: <20191031155750.GA7394@lst.de>
References: <20191031152837.15253-1-nsaenzjulienne@suse.de>
 <20191031154759.GA7162@lst.de>
 <40d06d463c05d36968e8b64924d78f7794f8de50.camel@suse.de>
 <20191031155750.GA7394@lst.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-geumnkbETQYdG1ZUMwUA"
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


--=-geumnkbETQYdG1ZUMwUA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-10-31 at 16:57 +0100, Christoph Hellwig wrote:
> On Thu, Oct 31, 2019 at 04:53:13PM +0100, Nicolas Saenz Julienne wrote:
> > > > +#define ARM64_ZONE_DMA_BITS	30
> > > > +
> > > >  /*
> > > >   * We need to be able to catch inadvertent references to memstart_=
addr
> > > >   * that occur (potentially in generic code) before
> > > > arm64_memblock_init()
> > > > @@ -424,6 +427,8 @@ void __init arm64_memblock_init(void)
> > > >  	else
> > > >  		arm64_dma_phys_limit =3D PHYS_MASK + 1;
> > > > =20
> > > > +	zone_dma_bits =3D ARM64_ZONE_DMA_BITS;
> > > > +
> > > >  	reserve_crashkernel();
> > >=20
> > > This actually adds a new limit, as there wasn't one before for arm64.
> >=20
> > Well, as zone_dma_bits is only relevant in dma/direct when ZONE_DMA is
> > defined
> > I figured it doesn't matter if the variable is set conditionally to ZON=
E_DMA
> > or
> > not.
>=20
> I'd much prefer that to do separately.

OK, I see what you mean now. It's wrong indeed.

The trouble is the ZONE_DMA series[1] in arm64, also due for v5.5, will be
affected by this patch. I don't know the right way to approach this problem
since depending on the merge order, this patch should be updated or the arm=
64
ZONE_DMA series fixed.

Maybe it's easier to just wait for v5.6.

Regards,
Nicolas

[1] https://lkml.org/lkml/2019/9/11/734


--=-geumnkbETQYdG1ZUMwUA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl27CmMACgkQlfZmHno8
x/4b+AgAoH8wv9sfGomdszgwev9YRlMzey4HKe8HTYaOtmPwv+9I5u2Q1L0Hll8U
oOvfmsMi3/GCphnYxgVI15TV3gT23I4f+e1sVmHtdJwOja145qdVYeN0eVrJBGlW
gllgXNWdKSeomR5jQYRo6/r/e4b2DFreMuJMYO5Ac0Jmp4lqqbZ9tXDqMvKt0VcB
4olZERu99fJIT8AxzUVXOG9cft6l18Fio1WtXJLzXgVrjxEKnxGLAq1GxY5o8VF7
mf5621L1pvp/rNs/CBhehPADNaJqYwdS+nm7md9u/My8zRvp2OqT8O9a4e7RxcQi
QPdhGBoQVaeZdUmbRgLmr2hq8cGTqw==
=2ip7
-----END PGP SIGNATURE-----

--=-geumnkbETQYdG1ZUMwUA--

