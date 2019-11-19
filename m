Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41288102209
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 11:23:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HMP51MhfzDqCV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 21:23:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HMJc51NczDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 21:19:59 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 405A9B301;
 Tue, 19 Nov 2019 10:19:56 +0000 (UTC)
Message-ID: <fb25b868bd49f368874d97dda7befc07e8db6057.camel@suse.de>
Subject: Re: [PATCH 1/3] dma-direct: unify the dma_capable definitions
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Christoph Hellwig
 <hch@lst.de>,  iommu@lists.linux-foundation.org, Russell King
 <linux@armlinux.org.uk>
Date: Tue, 19 Nov 2019 11:19:54 +0100
In-Reply-To: <1c227c91-512c-e871-0e03-a27b2c0435d7@samsung.com>
References: <20191113073539.9660-1-hch@lst.de>
 <CGME20191113073648epcas3p214f97ad5937559bebbc937e507fa54d9@epcas3p2.samsung.com>
 <20191113073539.9660-2-hch@lst.de>
 <1c227c91-512c-e871-0e03-a27b2c0435d7@samsung.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-9aduMZ9FwgNk+BtbhcTa"
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
Cc: 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-9aduMZ9FwgNk+BtbhcTa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-11-19 at 10:27 +0100, Marek Szyprowski wrote:
> Hi Christoph,
>=20
> On 13.11.2019 08:35, Christoph Hellwig wrote:
> > Currently each architectures that wants to override dma_to_phys and
> > phys_to_dma also has to provide dma_capable.  But there isn't really
> > any good reason for that.  powerpc and mips just have copies of the
> > generic one minus the latests fix, and the arm one was the inspiration
> > for said fix, but misses the bus_dma_mask handling.
> > Make all architectures use the generic version instead.
> >=20
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
>=20
> This patch breaks DMAengine PL330 driver on Samsung Exynos SoCs:
>=20
> [    3.602338] dma-pl330 12690000.pdma: overflow 0x13810020+1 of DMA=20
> mask ffffffff bus mask 0
> [    3.605113] ------------[ cut here ]------------
> [    3.609719] WARNING: CPU: 2 PID: 1 at kernel/dma/direct.c:36=20
> report_addr+0xc0/0xfc
> [    3.617226] Modules linked in:
> [    3.620271] CPU: 2 PID: 1 Comm: init Not tainted=20
> 5.4.0-rc5-00056-gb037b220e71d #6911
> [    3.627986] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [    3.634094] [<c01124e8>] (unwind_backtrace) from [<c010dfcc>]=20
> (show_stack+0x10/0x14)
> [    3.641803] [<c010dfcc>] (show_stack) from [<c0ae9af8>]=20
> (dump_stack+0xa8/0xd4)
> [    3.649002] [<c0ae9af8>] (dump_stack) from [<c012746c>]=20
> (__warn+0xf4/0x10c)
> [    3.655940] [<c012746c>] (__warn) from [<c0127534>]=20
> (warn_slowpath_fmt+0xb0/0xb8)
> [    3.663404] [<c0127534>] (warn_slowpath_fmt) from [<c01b4ff4>]=20
> (report_addr+0xc0/0xfc)
> [    3.671303] [<c01b4ff4>] (report_addr) from [<c01b5264>]=20
> (dma_direct_map_resource+0x98/0xa0)
> [    3.679739] [<c01b5264>] (dma_direct_map_resource) from [<c04fbb58>]=
=20
> (pl330_prep_slave_fifo+0xe4/0x128)
> [    3.689099] [<c04fbb58>] (pl330_prep_slave_fifo) from [<c04fe2b8>]=20
> (pl330_prep_slave_sg+0x54/0x1cc)
> [    3.698129] [<c04fe2b8>] (pl330_prep_slave_sg) from [<c053e5f0>]=20
> (s3c24xx_serial_start_tx_dma+0x118/0x1e8)
> [    3.707764] [<c053e5f0>] (s3c24xx_serial_start_tx_dma) from=20
> [<c0535f70>] (uart_write+0xe4/0x1e0)
> [    3.716532] [<c0535f70>] (uart_write) from [<c05186a0>]=20
> (n_tty_write+0x1c8/0x474)
> [    3.723992] [<c05186a0>] (n_tty_write) from [<c05163c0>]=20
> (tty_write+0x154/0x314)
> [    3.731380] [<c05163c0>] (tty_write) from [<c02a5748>]=20
> (__vfs_write+0x30/0x1d0)
> [    3.738662] [<c02a5748>] (__vfs_write) from [<c02a851c>]=20
> (vfs_write+0xa4/0x180)
> [    3.745949] [<c02a851c>] (vfs_write) from [<c02a8778>]=20
> (ksys_write+0x60/0xd8)
> [    3.753069] [<c02a8778>] (ksys_write) from [<c0101000>]=20
> (ret_fast_syscall+0x0/0x28)
> [    3.760705] Exception stack(0xee8dffa8 to 0xee8dfff0)
> [    3.765739] ffa0:                   0000004a beca876c 00000002=20
> beca876c 0000004a 00000000
> [    3.773900] ffc0: 0000004a beca876c b6f02cf0 00000004 beca876c=20
> 0000004a 00000000 b6f99010
> [    3.782056] ffe0: 0000006c beca8628 b6e1d000 b6e7a634
> [    3.787092] irq event stamp: 289740
> [    3.790571] hardirqs last  enabled at (289739): [<c0b0d0c4>]=20
> _raw_spin_unlock_irqrestore+0x6c/0x74
> [    3.799503] hardirqs last disabled at (289740): [<c0b0caf8>]=20
> _raw_spin_lock_irqsave+0x1c/0x58
> [    3.808011] softirqs last  enabled at (289576): [<c01026bc>]=20
> __do_softirq+0x4fc/0x5fc
> [    3.815830] softirqs last disabled at (289567): [<c0130044>]=20
> irq_exit+0x16c/0x170
> [    3.823286] ---[ end trace b1432c658797b861 ]---
> [    3.827898] samsung-uart 13810000.serial: Unable to get desc for Tx
> [    3.834624] samsung-uart 13810000.serial: Unable to get desc for Tx
> [    3.840487] samsung-uart 13810000.serial: Unable to get desc for Tx
>=20
> I'm checking now which part of it causes the issue.

Hi Marek,
is this a on a non LPAE ARM32 device?

Regards,
Nicolas

> > ---
> >   arch/arm/include/asm/dma-direct.h     | 19 -------------------
> >   arch/mips/include/asm/dma-direct.h    |  8 --------
> >   arch/powerpc/include/asm/dma-direct.h |  9 ---------
> >   include/linux/dma-direct.h            |  2 +-
> >   4 files changed, 1 insertion(+), 37 deletions(-)
> >=20
> > diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/d=
ma-
> > direct.h
> > index b67e5fc1fe43..7c3001a6a775 100644
> > --- a/arch/arm/include/asm/dma-direct.h
> > +++ b/arch/arm/include/asm/dma-direct.h
> > @@ -14,23 +14,4 @@ static inline phys_addr_t __dma_to_phys(struct devic=
e
> > *dev, dma_addr_t dev_addr)
> >   	return __pfn_to_phys(dma_to_pfn(dev, dev_addr)) + offset;
> >   }
> >  =20
> > -static inline bool dma_capable(struct device *dev, dma_addr_t addr, si=
ze_t
> > size)
> > -{
> > -	u64 limit, mask;
> > -
> > -	if (!dev->dma_mask)
> > -		return 0;
> > -
> > -	mask =3D *dev->dma_mask;
> > -
> > -	limit =3D (mask + 1) & ~mask;
> > -	if (limit && size > limit)
> > -		return 0;
> > -
> > -	if ((addr | (addr + size - 1)) & ~mask)
> > -		return 0;
> > -
> > -	return 1;
> > -}
> > -
> >   #endif /* ASM_ARM_DMA_DIRECT_H */
> > diff --git a/arch/mips/include/asm/dma-direct.h b/arch/mips/include/asm=
/dma-
> > direct.h
> > index b5c240806e1b..14e352651ce9 100644
> > --- a/arch/mips/include/asm/dma-direct.h
> > +++ b/arch/mips/include/asm/dma-direct.h
> > @@ -2,14 +2,6 @@
> >   #ifndef _MIPS_DMA_DIRECT_H
> >   #define _MIPS_DMA_DIRECT_H 1
> >  =20
> > -static inline bool dma_capable(struct device *dev, dma_addr_t addr, si=
ze_t
> > size)
> > -{
> > -	if (!dev->dma_mask)
> > -		return false;
> > -
> > -	return addr + size - 1 <=3D *dev->dma_mask;
> > -}
> > -
> >   dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr);
> >   phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr);
> >  =20
> > diff --git a/arch/powerpc/include/asm/dma-direct.h
> > b/arch/powerpc/include/asm/dma-direct.h
> > index a2912b47102c..e29e8a236b8d 100644
> > --- a/arch/powerpc/include/asm/dma-direct.h
> > +++ b/arch/powerpc/include/asm/dma-direct.h
> > @@ -2,15 +2,6 @@
> >   #ifndef ASM_POWERPC_DMA_DIRECT_H
> >   #define ASM_POWERPC_DMA_DIRECT_H 1
> >  =20
> > -static inline bool dma_capable(struct device *dev, dma_addr_t addr, si=
ze_t
> > size)
> > -{
> > -	if (!dev->dma_mask)
> > -		return false;
> > -
> > -	return addr + size - 1 <=3D
> > -		min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
> > -}
> > -
> >   static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_=
t
> > paddr)
> >   {
> >   	if (!dev)
> > diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> > index 6db863c3eb93..991f8aa2676e 100644
> > --- a/include/linux/dma-direct.h
> > +++ b/include/linux/dma-direct.h
> > @@ -24,6 +24,7 @@ static inline phys_addr_t __dma_to_phys(struct device
> > *dev, dma_addr_t dev_addr)
> >  =20
> >   	return paddr + ((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
> >   }
> > +#endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
> >  =20
> >   static inline bool dma_capable(struct device *dev, dma_addr_t addr, s=
ize_t
> > size)
> >   {
> > @@ -38,7 +39,6 @@ static inline bool dma_capable(struct device *dev,
> > dma_addr_t addr, size_t size)
> >  =20
> >   	return end <=3D min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
> >   }
> > -#endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
> >  =20
> >   #ifdef CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED
> >   bool force_dma_unencrypted(struct device *dev);
>=20
> Best regards


--=-9aduMZ9FwgNk+BtbhcTa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3TwcoACgkQlfZmHno8
x/4hYggAgy09wSQ1ZdnrSCRXM/qq4EQzGTlWlNYjUCtT8eDcvo8fKm0pfdBpGStG
QPbrAzJaKNlsIR6Tx/TEF/m1JX1I/QzNsng9h76ShOpn9CGshg57W91L82b57qT4
vJDniIW8Gv3SQ+jSSspU8N2UVYLYCqOqpxxjyy8zTRkU0CtyaJCyLXeSQTLjGyab
fs/5NI6u7gE4bLChR9+lkqu7t3ga1Wsxuoq2Fx/J8tio0q82ZFowbsevVWAFzb0b
Nfm1YGv7BYtSYOldIHrYPwiwJzcJ5zv5tAJh+GaszzXMTIGk9Tpv2VpjymlSbLja
HCVKkk0xkKPJrTOWzYpiiX4w6WeybA==
=xWer
-----END PGP SIGNATURE-----

--=-9aduMZ9FwgNk+BtbhcTa--

