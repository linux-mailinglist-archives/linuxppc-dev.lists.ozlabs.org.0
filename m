Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2CB102513
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 14:02:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HQwV1SpdzDqgN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 00:02:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HQpm0PPKzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 23:57:51 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9B69FB1A0;
 Tue, 19 Nov 2019 12:57:47 +0000 (UTC)
Message-ID: <dd074ef5c23ba56598e92be19e8e25ae31b75f93.camel@suse.de>
Subject: Re: [PATCH] dma-mapping: treat dev->bus_dma_mask as a DMA limit
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>,  Peter Zijlstra <peterz@infradead.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Christoph
 Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>
Date: Tue, 19 Nov 2019 13:57:43 +0100
In-Reply-To: <20191113161340.27228-1-nsaenzjulienne@suse.de>
References: <20191113161340.27228-1-nsaenzjulienne@suse.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-KZ1OEZ2plCMDP0ydmpq5"
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
Cc: linux-mips@vger.kernel.org, linux-ide@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter
 Anvin" <hpa@zytor.com>, Paul Burton <paulburton@kernel.org>, x86@kernel.org,
 phil@raspberrypi.org, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-pci@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-KZ1OEZ2plCMDP0ydmpq5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-11-13 at 17:13 +0100, Nicolas Saenz Julienne wrote:
> Using a mask to represent bus DMA constraints has a set of limitations.
> The biggest one being it can only hold a power of two (minus one). The
> DMA mapping code is already aware of this and treats dev->bus_dma_mask
> as a limit. This quirk is already used by some architectures although
> still rare.
>=20
> With the introduction of the Raspberry Pi 4 we've found a new contender
> for the use of bus DMA limits, as its PCIe bus can only address the
> lower 3GB of memory (of a total of 4GB). This is impossible to represent
> with a mask. To make things worse the device-tree code rounds non power
> of two bus DMA limits to the next power of two, which is unacceptable in
> this case.
>=20
> In the light of this, rename dev->bus_dma_mask to dev->bus_dma_limit all
> over the tree and treat it as such. Note that dev->bus_dma_limit is
> meant to contain the higher accesible DMA address.
>=20
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>=20

Hi Rob & Christoph,
do you mind if I append v2 of this into my upcoming v3 RPi4 PCIe support
series, I didn't do it initially as I thought this was going to be a
contentious patch.  But as it turned out better than expected, I think it
should go into the PCIe series. In the end it's the first explicit user of =
the
bus DMA limit.

Here's v2 in case you don't know what I'm talking about:
https://www.spinics.net/lists/arm-kernel/msg768459.html

Regards,
Nicolas


--=-KZ1OEZ2plCMDP0ydmpq5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3T5scACgkQlfZmHno8
x/7FNgf/TPvrVamDNHipGFKFiSr22YaNYJU4aGZyFuJab0Z9dF35ZbNQqx3sXA83
gyltGXByQ4c747nqq+LWQTaXLvI4NEMDu/ueQ6T4Vgs0ijtKvI9hVjrjlKU7UVsR
/v+6HHolAP4q5zxgJbL3PRMlFeJlLs9xRbikBEmGDbc4INP8nBSUiQmk4lrgCAwH
xV11EcSTA5eKJPS1jpsEP/vKwfu7LQ9ASExtpK5Oud7ZBD8zq1qKQBSVMGXQ1m9L
l0ok+gqBZtMgwKtigs9mAr0Y09evU1GOVS0ttcncZ854J6/+hr9nuK8eXyhLEm0J
l/jpo2vtZH0gMy68b+P8LkDtGJisYg==
=9wOf
-----END PGP SIGNATURE-----

--=-KZ1OEZ2plCMDP0ydmpq5--

