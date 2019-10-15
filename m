Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1124D707C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 09:50:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sndx06zLzDqxl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 18:50:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46snby6h06zDqwB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 18:48:29 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D6A5EB650;
 Tue, 15 Oct 2019 07:48:24 +0000 (UTC)
Message-ID: <384b42df01c0af973002fba0d5f02068e7f2e7b3.camel@suse.de>
Subject: Re: [PATCH RFC 0/5] ARM: Raspberry Pi 4 DMA support
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Catalin Marinas <catalin.marinas@arm.com>
Date: Tue, 15 Oct 2019 09:48:22 +0200
In-Reply-To: <20191014205859.GA7634@iMac-3.local>
References: <20191014183108.24804-1-nsaenzjulienne@suse.de>
 <20191014205859.GA7634@iMac-3.local>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-4pilC0luxewnjymcvLYk"
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
Cc: linux-s390@vger.kernel.org, f.fainelli@gmail.com,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 hch@infradead.org, iommu@lists.linux-foundation.org, mbrugger@suse.com,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 wahrenst@gmx.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-4pilC0luxewnjymcvLYk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-10-14 at 21:59 +0100, Catalin Marinas wrote:
> On Mon, Oct 14, 2019 at 08:31:02PM +0200, Nicolas Saenz Julienne wrote:
> > the Raspberry Pi 4 offers up to 4GB of memory, of which only the first
> > is DMA capable device wide. This forces us to use of bounce buffers,
> > which are currently not very well supported by ARM's custom DMA ops.
> > Among other things the current mechanism (see dmabounce.c) isn't
> > suitable for high memory. Instead of fixing it, this series introduces =
a
> > way of selecting dma-direct as the default DMA ops provider which allow=
s
> > for the Raspberry Pi to make use of swiotlb.
>=20
> I presume these patches go on top of this series:
>=20
> http://lkml.kernel.org/r/20190911182546.17094-1-nsaenzjulienne@suse.de

Yes, forgot to mention it. It's relevant for the first patch.

>=20
> which I queued here:
>=20
>=20
https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=3Dfo=
r-next/zone-dma

Thanks!

A little off topic but I was wondering if you have a preferred way to refer=
 to
the arm architecture in a way that it unambiguously excludes arm64 (for exa=
mple
arm32 would work).

Regards,
Nicolas


--=-4pilC0luxewnjymcvLYk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2lecYACgkQlfZmHno8
x/7lZQf7BpuyTA7KitVkqMXl3L4hWPGTsvKYE4a6JPGwACQaRTlyPLU+YRDvD5uG
3ulte/b7C+OKAXzI17fdpJvO8SBHGO+E0Y2G/j46W9pVezPmyccfF+M0uGKsP9d7
/tcaYEm0X5vNtneMFYydutqLSqQT1uFUcPdJ6M0AJVUcLOtANEfXEJjYEnj6s7wd
OyV2QaOXth+V85DGT+wgaPPOLRmxBmlMbVfZYJUVJ7+9o2FiuWBYDvQ4OA3dHAXf
mVw+II6YIOo4WghksiGES3JYt/0yd0cjqf6Qq7MbB9RIUdvhbJC28ZzRdKSgOA9Q
8PLdonhaeyOJ5k3hZqN+MFiGPt6QGw==
=0lDM
-----END PGP SIGNATURE-----

--=-4pilC0luxewnjymcvLYk--

