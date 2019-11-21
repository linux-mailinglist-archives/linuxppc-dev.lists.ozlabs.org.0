Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE62104F1D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 10:21:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JYvm39S4zDr3T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 20:21:08 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JYsR0V6FzDqqY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 20:19:05 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 134B7B324;
 Thu, 21 Nov 2019 09:19:01 +0000 (UTC)
Message-ID: <f7c09f06913fa1ed5e98c55ebe6d9db81bf232c0.camel@suse.de>
Subject: Re: [PATCH] dma-mapping: treat dev->bus_dma_mask as a DMA limit
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>
Date: Thu, 21 Nov 2019 10:18:54 +0100
In-Reply-To: <20191121073152.GB24024@lst.de>
References: <20191113161340.27228-1-nsaenzjulienne@suse.de>
 <dd074ef5c23ba56598e92be19e8e25ae31b75f93.camel@suse.de>
 <20191119170006.GA19569@lst.de>
 <7609007d-52f5-bb10-e8d5-96fadbfab46d@arm.com>
 <20191121073152.GB24024@lst.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-lq+O6sjXzX+AgzEMEd7n"
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
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Hanjun Guo <guohanjun@huawei.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Paul Burton <paulburton@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, phil@raspberrypi.org, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-pci@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, iommu@lists.linux-foundation.org,
 Sudeep Holla <sudeep.holla@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-lq+O6sjXzX+AgzEMEd7n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-11-21 at 08:31 +0100, Christoph Hellwig wrote:
> On Tue, Nov 19, 2019 at 05:17:03PM +0000, Robin Murphy wrote:
> > TBH I can't see it being a massive problem even if the DMA patch, drive=
r=20
> > and DTS patch went entirely separately via the respective DMA, PCI, and=
=20
> > arm-soc trees in the same cycle. Bisecting over a merge window is a big=
=20
> > enough pain in the bum as it is, and if the worst case is that someone=
=20
> > trying to do that on a Pi4 has a wonky PCI controller appear for a coup=
le=20
> > of commits, they may as well just disable that driver for their bisecti=
on,=20
> > because it wasn't there at the start so can't possibly be the thing the=
y're=20
> > looking for regressions in ;)
>=20
> Agreed.
>=20
> Nicolas, can you send a respin?  That way I can still queue it up
> for 5.5.

Oh, I thought it was too late for that already. I'll send it in a minute.

Regards,
Nicolas


--=-lq+O6sjXzX+AgzEMEd7n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3WVn4ACgkQlfZmHno8
x/6kBwf/SKtubLT3BK6PDi2kFxS7U1Nuy9X/MqsOPMdQNIIzccK4WqpweJsn3fn7
WUh4Tsn5H2fjaeqsOCLpG5PeYLO6nDWDmCzVszhsyBjqWczikEWQ8reuCbXbbW6G
rUh1wlp8+VDFDs0reFtW9POlYcvxixcMmbkSjKPEtZCh/GjdgIcjdkCtvwGkdrE1
8E8Z6K9lqyiB2WQ0z7tdOf3fglQwJ7HxRgsmlYm1u0UQCm3+Hdrvy2hO7X/OYhtB
4JbPmzPk62RNUjdmnuJ8t2ar57gMQ4VwRi7hjfCir9Iq8t/B7vCzCAQnzREpL05w
BEUfJlvCYEvS3eArOErmv3Mm+/ugdg==
=NUIQ
-----END PGP SIGNATURE-----

--=-lq+O6sjXzX+AgzEMEd7n--

