Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 471E0EAD76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 11:33:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473hVN41J7zF4YH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 21:33:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 473hRp4mtSzF5k8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 21:30:44 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 89138B38E;
 Thu, 31 Oct 2019 10:30:40 +0000 (UTC)
Message-ID: <8c525f66c1c0d9f07e0cff4948d1ec3229756220.camel@suse.de>
Subject: Re: [PATCH RFC 1/5] dma/direct: turn ARCH_ZONE_DMA_BITS into a
 variable
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Date: Thu, 31 Oct 2019 11:30:36 +0100
In-Reply-To: <20191030214914.GA15939@infradead.org>
References: <20191014183108.24804-1-nsaenzjulienne@suse.de>
 <20191014183108.24804-2-nsaenzjulienne@suse.de>
 <20191030214914.GA15939@infradead.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-c/h1zpmiYL5xA/R3DgLo"
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
 Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Paul Mackerras <paulus@samba.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-c/h1zpmiYL5xA/R3DgLo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-10-30 at 14:49 -0700, Christoph Hellwig wrote:
> On Mon, Oct 14, 2019 at 08:31:03PM +0200, Nicolas Saenz Julienne wrote:
> > Some architectures, notably ARM, are interested in tweaking this
> > depending on their runtime DMA addressing limitations.
> >=20
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>=20
> Do you want me to pick this up for the 5.5 dma-mapping tree, or do you
> want me to wait for the rest to settle?

I'd say take it, this will be ultimately needed once we push forward with A=
RM.


--=-c/h1zpmiYL5xA/R3DgLo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl26t8wACgkQlfZmHno8
x/6Bvgf8CKw0zktkkeQiMRg7+/wfA7jkI0EdKaeR38AVackkoByc3ab5S2A4Qepy
XpQVhaciStaOBkqCzcHLVJnucMd/6d9YH+49GubC64NT12ukfjVwUBbfzgVHTJH2
SOf3YpmsDw+8RokSUatZQZwY4D+b+jezcgK12EYOj244ip65tNEnM87G5ZUZVG1U
2rXnFOH4ne4LmUn6u6Gdgydn5j7pSJnvYH0U0DRU0PLK7kV2uxOrllqSnvdENiRz
QLSjWe2SON35T0OsddsecCq/FWrNzYBYa6bEfc2NsA0qdNAEJVaXQEn3p9bROBPw
I2SkWEPTaKCtL9hUC1eiqUx1nLTY8g==
=5BcM
-----END PGP SIGNATURE-----

--=-c/h1zpmiYL5xA/R3DgLo--

