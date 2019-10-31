Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA82EB620
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 18:28:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473sjf1nRzzF5XM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 04:28:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 473sgH5Dm0zF0jn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 04:26:19 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3E70EB961;
 Thu, 31 Oct 2019 17:26:14 +0000 (UTC)
Message-ID: <9c051b0f2d89baa36fd3d3669a107f549c310d49.camel@suse.de>
Subject: Re: [PATCH RFC 1/5] dma/direct: turn ARCH_ZONE_DMA_BITS into a
 variable
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Catalin Marinas <catalin.marinas@arm.com>
Date: Thu, 31 Oct 2019 18:26:10 +0100
In-Reply-To: <20191031133831.GA21509@infradead.org>
References: <20191014183108.24804-1-nsaenzjulienne@suse.de>
 <20191014183108.24804-2-nsaenzjulienne@suse.de>
 <20191030214914.GA15939@infradead.org>
 <8c525f66c1c0d9f07e0cff4948d1ec3229756220.camel@suse.de>
 <20191031133831.GA21509@infradead.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-HUsDE4pCuvQagD+CYqmq"
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
Cc: linux-s390@vger.kernel.org, mbrugger@suse.com,
 Vasily Gorbik <gor@linux.ibm.com>, wahrenst@gmx.net,
 Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 ChristophHellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Paul Mackerras <paulus@samba.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-HUsDE4pCuvQagD+CYqmq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-10-31 at 06:38 -0700, Christoph Hellwig wrote:
> On Thu, Oct 31, 2019 at 11:30:36AM +0100, Nicolas Saenz Julienne wrote:
> > On Wed, 2019-10-30 at 14:49 -0700, Christoph Hellwig wrote:
> > > On Mon, Oct 14, 2019 at 08:31:03PM +0200, Nicolas Saenz Julienne wrot=
e:
> > > > Some architectures, notably ARM, are interested in tweaking this
> > > > depending on their runtime DMA addressing limitations.
> > > >=20
> > > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > >=20
> > > Do you want me to pick this up for the 5.5 dma-mapping tree, or do yo=
u
> > > want me to wait for the rest to settle?
> >=20
> > I'd say take it, this will be ultimately needed once we push forward wi=
th
> > ARM.
>=20
> Can you resend a version that applies against 5.4-rc?  The current one
> has conflicts in the arm64 code.

Hi Catalin,
would you mind taking this patch on top of the arm64 ZONE_DMA series?

I tried to go though Christoph's tree but it ultimately clashes with the
ZONE_DMA series. It's simpler to apply it on top of your tree.

Regrads,
Nicolas


--=-HUsDE4pCuvQagD+CYqmq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl27GTIACgkQlfZmHno8
x/6rAgf/ZoMMGW7IRaV6x5ZwhpeWmnDuHERj4vzVJa0/eBKTyeFHQYuyNBygdzOW
JGunOdpAkJNo6DdJKxyUt8u5d8vvnq3mIm+g0xkoz6PxzzUtPlEuFZ1fgP1oGYIT
BdBcYj23cYMrYjtqcJJkBoBu+5JBkx28Mu5oGyWeRojupXkK+9NN53qUZMmYcFD+
Lw9i3nBQmiozrdeHMiErrYTXOkz93sipx2zeo2jF4CsOtj67BfJMhmsRogeQTIe+
Z5A6Ik+LQ8AejhKOAisJzXidZPdUwaENRKw2qicQFBoifWbqinhT6JxmrEk/AHR1
eg9iA75sotbQfuNiAzn6qCofWaKfcg==
=jqtB
-----END PGP SIGNATURE-----

--=-HUsDE4pCuvQagD+CYqmq--

