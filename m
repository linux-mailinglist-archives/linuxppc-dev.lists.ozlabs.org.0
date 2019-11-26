Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D410A43C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 19:54:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MtNV4ZSCzDqVD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 05:54:02 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MtLR1zZXzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 05:52:13 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 38C30ABD6;
 Tue, 26 Nov 2019 18:52:08 +0000 (UTC)
Message-ID: <45feed391bbd95c46f64b31cf8817d4f773c8da1.camel@suse.de>
Subject: Re: [PATCH v2] dma-mapping: treat dev->bus_dma_mask as a DMA limit
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
 Nathan Chancellor <natechancellor@gmail.com>
Date: Tue, 26 Nov 2019 19:51:59 +0100
In-Reply-To: <0b851d0e-37c7-062e-c287-05f8c8a54c16@arm.com>
References: <20191121092646.8449-1-nsaenzjulienne@suse.de>
 <20191123165108.GA15306@ubuntu-x2-xlarge-x86>
 <20191125074412.GA30595@lst.de>
 <0b851d0e-37c7-062e-c287-05f8c8a54c16@arm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-B9dp7hYRMOcivm0VMcWv"
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Paul Burton <paulburton@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-pci@vger.kernel.org, James Hogan <jhogan@kernel.org>,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Hanjun Guo <guohanjun@huawei.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 iommu@lists.linux-foundation.org, Sudeep Holla <sudeep.holla@arm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-B9dp7hYRMOcivm0VMcWv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-11-25 at 16:33 +0000, Robin Murphy wrote:
> On 25/11/2019 7:44 am, Christoph Hellwig wrote:
> > On Sat, Nov 23, 2019 at 09:51:08AM -0700, Nathan Chancellor wrote:
> > > Just as an FYI, this introduces a warning on arm32 allyesconfig for m=
e:
> >=20
> > I think the dma_limit argument to iommu_dma_alloc_iova should be a u64
> > and/or we need to use min_t and open code the zero exception.
> >=20
> > Robin, Nicolas - any opinions?
>=20
> Yeah, given that it's always held a mask I'm not entirely sure why it=20
> was ever a dma_addr_t rather than a u64. Unless anyone else is desperate=
=20
> to do it I'll get a cleanup patch ready for rc1.

Sounds good to me too

Robin, since I started the mess, I'll be happy to do it if it helps offload=
ing
some work from you.

Regards,
Nicolas


--=-B9dp7hYRMOcivm0VMcWv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3ddE8ACgkQlfZmHno8
x/5fVwgAnN7cpWXNHEbGgqyZcMqmBWCtR0bMa/xIu1xNgr/CAwMMZj0Z3/+6d18p
mlU5N6AqlkTxefP9mV5ZxBzugcsriGR4+qJ05kZZAMxAeG625qDkfhSEl0FmUZRT
WmEv98IN0aFzHEjZJAyPDNV8Ff1a3JpoHKQmnYs5z438rMZt49CPBC0jNPFdaEuj
v9ry1DkR+cGYuD1WRyBQJjtze14XoG7ZCu0o9Htc02GZHq3OuabxDikuTC+UJ1jR
BZX4ak4qGpJUGYT8fQA7IOA94Sd/N/CHMrDp8yv5f/kRcprKqgGX8PnMCUOPf4ns
PsCZZGhEKvVwZy3/+QzWSYQ7q20O8w==
=WYKI
-----END PGP SIGNATURE-----

--=-B9dp7hYRMOcivm0VMcWv--

