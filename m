Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6519E550
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 12:05:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HkyG2lPhzDqbq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 20:05:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=wavecomp.com
 (client-ip=2a01:111:f400:fe4d::708;
 helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=pburton@wavecomp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=wavecomp.com header.i=@wavecomp.com header.b="n8x/MtO8";
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::708])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hkvq0wbCzDqTX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 20:03:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwUxhivcOsiFLdINMfYJ9ZpC9g45Xso+KWNNR//IsofxhQpnofC2Fg0yppF6YlfNSdCAyqtA5buQEwAE48BtptR/DPLczlhG+EYk8HNxmZj39pvL53Uur3Mx2YtTX8vjtQSKtSzyXweynGhgP9b4xoZFAGozLLAb2m4aMCPLN/J8Erxz2MWVEzjYqIaXlHiscvGw5VilgXbNnGGFKwstx6rXMTl8swT6J5xxEuzpixgBJCfnqy/IX6K6KCa0V+Aeyhk5SzS8UQgo1EEF2mIcN93UE26KhtOSmSxTC6115Qoy8ZrSapQX05E91ZZneCC910IDS8dZeeS7KpHZZdMmaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bZCVpPkOjw/sOBKGcHKXBQbaTUGDnO73l5yTovPOe8=;
 b=Hol8Fmhd9DjCPUSsbbirIdQismQ4rjsEIOMUON8cbpxDnisl8SfKr9zBJV7UIecQRL2jaMPFoWuHdCNf4abF2fX1HxgeciYcSciA0Mk953+PJi1TIsxN6Cowe3Oh3Ibq8BnST1KHWnj0/ntSoffgGDZ1C3ncsZ5LhXmCKHMMysXFOHI2sjAxDpbQttFKwjjbLzcqL7+VomQd7v8s21XGSPyrERtZihlOj5klrFUg4xm+B18YHxF8gFqi8R1gU1iMNEbqNbB5DPT1WtkxWoOVy58kimQz8g3KQVaCdNO/l85vFtegYG2yC6s8wS27UYi4ebjtxsk/LoyEG9+bXHaJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bZCVpPkOjw/sOBKGcHKXBQbaTUGDnO73l5yTovPOe8=;
 b=n8x/MtO8V64rZJiNikLzKdfGAnGwMBv9bI/hrNlPxx4jS4tGq7lv8c6JY3wdk3MaZ3HQwAR5i6dpUGUU4W/N8HYQFzSPCqm7KR7rc9us0X/m/4gJGWoVsfGkEO/Zm43XdD/Vuv4kAa0VTsPb6kval3CN8DzMCDtexN4JJvSSoRE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1390.namprd22.prod.outlook.com (10.174.162.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Tue, 27 Aug 2019 10:02:52 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2199.021; Tue, 27 Aug
 2019 10:02:52 +0000
From: Paul Burton <paul.burton@mips.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] dma-mapping: remove arch_dma_mmap_pgprot
Thread-Topic: [PATCH 3/6] dma-mapping: remove arch_dma_mmap_pgprot
Thread-Index: AQHVXL6W4q15Kq6fKUqaVULtpP6zpQ==
Date: Tue, 27 Aug 2019 10:02:51 +0000
Message-ID: <20190827100245.dczrrixvgrmbrb42@pburton-laptop>
References: <20190826132553.4116-1-hch@lst.de>
 <20190826132553.4116-4-hch@lst.de>
In-Reply-To: <20190826132553.4116-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0401.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::29) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.118.89.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa6f4199-37f8-437c-f7df-08d72ad5b8b7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1390; 
x-ms-traffictypediagnostic: MWHPR2201MB1390:
x-microsoft-antispam-prvs: <MWHPR2201MB13909FBB7E045A1D214C6DA8C1A00@MWHPR2201MB1390.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(366004)(39850400004)(376002)(136003)(396003)(346002)(189003)(199004)(71200400001)(486006)(102836004)(186003)(476003)(386003)(26005)(8676002)(42882007)(478600001)(6246003)(2906002)(305945005)(5660300002)(66066001)(53936002)(8936002)(9686003)(1076003)(446003)(14444005)(81156014)(6486002)(7736002)(81166006)(256004)(11346002)(4326008)(25786009)(14454004)(44832011)(52116002)(6512007)(58126008)(7416002)(6916009)(54906003)(76176011)(6116002)(3846002)(66946007)(66446008)(66476007)(66556008)(64756008)(33716001)(99286004)(71190400001)(316002)(6436002)(6506007)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1390;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:3; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SYpkpt6z9VR18IKvPYfxsQWI5AsD799BjXcAJOtlR3YKgAQ6Gp23O9beX8OwV7tAAZmQIVAYeAcbxI4jG0Xkqa8j6z2uWdP894vl2Oy+T22mUhXQfKQUeAFdz2eSkEX6Wtx5nP8EAjwml39IT1lW0wsixlkNW02QzixYcdl3TeJzN9Tu71GDmE1pPr164frTBJZi3poZoXt1yfKpUGclhucliYyRN/BoS2jWNRwwG0r9ZZ6l7MAQ0Yc6XdOrh8nB7BOoZM1LDuwtwQMvm0GfsbFl+1fApZlWllcoD7Lq+zvFgeryMDT8JbV+SZEaA3RSW7aUZ6MJGhxAxBxmZNIz4VlO2BPLte35+BK90Mrs2McY62YxrZwwNVRqL+3ETmjRRJC9x5E7A716zYoVd9IzSOdXaU+EmnVqMhxpJ2POCS4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FD34176D9B58E64093A09E7E3A0592BE@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6f4199-37f8-437c-f7df-08d72ad5b8b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 10:02:51.4658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: arKpiCDLk6ip53O51O1woD9sV+kusnx/6Nuk5DzIrbcTRz7Wmw2zTmlYlGt1Uw0LEGhpx6x823lTp0yt1usXJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1390
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
Cc: Shawn Anastasio <shawn@anastas.io>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 Will Deacon <will@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Guan Xuetao <gxt@pku.edu.cn>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On Mon, Aug 26, 2019 at 03:25:50PM +0200, Christoph Hellwig wrote:
> arch_dma_mmap_pgprot is used for two things:
>=20
>  1) to override the "normal" uncached page attributes for mapping
>     memory coherent to devices that can't snoop the CPU caches
>  2) to provide the special DMA_ATTR_WRITE_COMBINE semantics on older
>     arm systems and some mips platforms
>=20
> Replace one with the pgprot_dmacoherent macro that is already provided
> by arm and much simpler to use, and lift the DMA_ATTR_WRITE_COMBINE
> handling to common code with an explicit arch opt-in.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

For the MIPS bits:

    Acked-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

> ---
>  arch/arm/Kconfig                   |  2 +-
>  arch/arm/mm/dma-mapping.c          |  6 ------
>  arch/arm64/Kconfig                 |  1 -
>  arch/arm64/include/asm/pgtable.h   |  4 ++++
>  arch/arm64/mm/dma-mapping.c        |  6 ------
>  arch/m68k/Kconfig                  |  1 -
>  arch/m68k/include/asm/pgtable_mm.h |  3 +++
>  arch/m68k/kernel/dma.c             |  3 +--
>  arch/mips/Kconfig                  |  2 +-
>  arch/mips/mm/dma-noncoherent.c     |  8 --------
>  include/linux/dma-noncoherent.h    | 13 +++++++++++--
>  kernel/dma/Kconfig                 | 12 +++++++++---
>  kernel/dma/mapping.c               |  8 +++++---
>  13 files changed, 35 insertions(+), 34 deletions(-)
>=20
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 24360211534a..217083caeabd 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -8,7 +8,7 @@ config ARM
>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
>  	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  	select ARCH_HAS_DMA_COHERENT_TO_PFN if SWIOTLB
> -	select ARCH_HAS_DMA_MMAP_PGPROT if SWIOTLB
> +	select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
>  	select ARCH_HAS_ELF_RANDOMIZE
>  	select ARCH_HAS_FORTIFY_SOURCE
>  	select ARCH_HAS_KEEPINITRD
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index d42557ee69c2..d27b12f61737 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -2402,12 +2402,6 @@ long arch_dma_coherent_to_pfn(struct device *dev, =
void *cpu_addr,
>  	return dma_to_pfn(dev, dma_addr);
>  }
> =20
> -pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
> -		unsigned long attrs)
> -{
> -	return __get_dma_pgprot(attrs, prot);
> -}
> -
>  void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_ha=
ndle,
>  		gfp_t gfp, unsigned long attrs)
>  {
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 3adcec05b1f6..dab9dda34206 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -13,7 +13,6 @@ config ARM64
>  	select ARCH_HAS_DEBUG_VIRTUAL
>  	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  	select ARCH_HAS_DMA_COHERENT_TO_PFN
> -	select ARCH_HAS_DMA_MMAP_PGPROT
>  	select ARCH_HAS_DMA_PREP_COHERENT
>  	select ARCH_HAS_ACPI_TABLE_UPGRADE if ACPI
>  	select ARCH_HAS_ELF_RANDOMIZE
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
> index e09760ece844..6700371227d1 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -435,6 +435,10 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
>  	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_NORMAL_NC) | P=
TE_PXN | PTE_UXN)
>  #define pgprot_device(prot) \
>  	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_DEVICE_nGnRE) =
| PTE_PXN | PTE_UXN)
> +#define pgprot_dmacoherent(prot) \
> +	__pgprot_modify(prot, PTE_ATTRINDX_MASK, \
> +			PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN | PTE_UXN)
> +
>  #define __HAVE_PHYS_MEM_ACCESS_PROT
>  struct file;
>  extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pf=
n,
> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> index bd2b039f43a6..676efcda51e6 100644
> --- a/arch/arm64/mm/dma-mapping.c
> +++ b/arch/arm64/mm/dma-mapping.c
> @@ -11,12 +11,6 @@
> =20
>  #include <asm/cacheflush.h>
> =20
> -pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
> -		unsigned long attrs)
> -{
> -	return pgprot_writecombine(prot);
> -}
> -
>  void arch_sync_dma_for_device(struct device *dev, phys_addr_t paddr,
>  		size_t size, enum dma_data_direction dir)
>  {
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index c518d695c376..a9e564306d3e 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -4,7 +4,6 @@ config M68K
>  	default y
>  	select ARCH_32BIT_OFF_T
>  	select ARCH_HAS_BINFMT_FLAT
> -	select ARCH_HAS_DMA_MMAP_PGPROT if MMU && !COLDFIRE
>  	select ARCH_HAS_DMA_PREP_COHERENT if HAS_DMA && MMU && !COLDFIRE
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if HAS_DMA
>  	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
> diff --git a/arch/m68k/include/asm/pgtable_mm.h b/arch/m68k/include/asm/p=
gtable_mm.h
> index fe3ddd73a0cc..fde4534b974f 100644
> --- a/arch/m68k/include/asm/pgtable_mm.h
> +++ b/arch/m68k/include/asm/pgtable_mm.h
> @@ -169,6 +169,9 @@ static inline void update_mmu_cache(struct vm_area_st=
ruct *vma,
>  	    ? (__pgprot((pgprot_val(prot) & _CACHEMASK040) | _PAGE_NOCACHE_S))	=
\
>  	    : (prot)))
> =20
> +pgprot_t pgprot_dmacoherent(pgprot_t prot);
> +#define pgprot_dmacoherent(prot)	pgprot_dmacoherent(prot)
> +
>  #endif /* CONFIG_COLDFIRE */
>  #include <asm-generic/pgtable.h>
>  #endif /* !__ASSEMBLY__ */
> diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
> index 30cd59caf037..35064150e348 100644
> --- a/arch/m68k/kernel/dma.c
> +++ b/arch/m68k/kernel/dma.c
> @@ -23,8 +23,7 @@ void arch_dma_prep_coherent(struct page *page, size_t s=
ize)
>  	cache_push(page_to_phys(page), size);
>  }
> =20
> -pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
> -		unsigned long attrs)
> +pgprot_t pgprot_dmacoherent(pgprot_t prot)
>  {
>  	if (CPU_IS_040_OR_060) {
>  		pgprot_val(prot) &=3D ~_PAGE_CACHE040;
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index d50fafd7bf3a..fc88f68ea1ee 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1119,7 +1119,7 @@ config DMA_PERDEV_COHERENT
> =20
>  config DMA_NONCOHERENT
>  	bool
> -	select ARCH_HAS_DMA_MMAP_PGPROT
> +	select ARCH_HAS_DMA_WRITE_COMBINE
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select ARCH_HAS_UNCACHED_SEGMENT
>  	select NEED_DMA_MAP_STATE
> diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoheren=
t.c
> index ed56c6fa7be2..1d4d57dd9acf 100644
> --- a/arch/mips/mm/dma-noncoherent.c
> +++ b/arch/mips/mm/dma-noncoherent.c
> @@ -65,14 +65,6 @@ long arch_dma_coherent_to_pfn(struct device *dev, void=
 *cpu_addr,
>  	return page_to_pfn(virt_to_page(cached_kernel_address(cpu_addr)));
>  }
> =20
> -pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
> -		unsigned long attrs)
> -{
> -	if (attrs & DMA_ATTR_WRITE_COMBINE)
> -		return pgprot_writecombine(prot);
> -	return pgprot_noncached(prot);
> -}
> -
>  static inline void dma_sync_virt(void *addr, size_t size,
>  		enum dma_data_direction dir)
>  {
> diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoher=
ent.h
> index 0bff3d7fac92..dd3de6d88fc0 100644
> --- a/include/linux/dma-noncoherent.h
> +++ b/include/linux/dma-noncoherent.h
> @@ -3,6 +3,7 @@
>  #define _LINUX_DMA_NONCOHERENT_H 1
> =20
>  #include <linux/dma-mapping.h>
> +#include <asm/pgtable.h>
> =20
>  #ifdef CONFIG_ARCH_HAS_DMA_COHERENCE_H
>  #include <asm/dma-coherence.h>
> @@ -42,10 +43,18 @@ void arch_dma_free(struct device *dev, size_t size, v=
oid *cpu_addr,
>  		dma_addr_t dma_addr, unsigned long attrs);
>  long arch_dma_coherent_to_pfn(struct device *dev, void *cpu_addr,
>  		dma_addr_t dma_addr);
> -pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
> -		unsigned long attrs);
> =20
>  #ifdef CONFIG_MMU
> +/*
> + * Page protection so that devices that can't snoop CPU caches can use t=
he
> + * memory coherently.  We default to pgprot_noncached which is usually u=
sed
> + * for ioremap as a safe bet, but architectures can override this with l=
ess
> + * strict semantics if possible.
> + */
> +#ifndef pgprot_dmacoherent
> +#define pgprot_dmacoherent(prot)	pgprot_noncached(prot)
> +#endif
> +
>  pgprot_t dma_pgprot(struct device *dev, pgprot_t prot, unsigned long att=
rs);
>  #else
>  static inline pgprot_t dma_pgprot(struct device *dev, pgprot_t prot,
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index 9decbba255fc..73c5c2b8e824 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -20,6 +20,15 @@ config ARCH_HAS_DMA_COHERENCE_H
>  config ARCH_HAS_DMA_SET_MASK
>  	bool
> =20
> +#
> +# Select this option if the architecture needs special handling for
> +# DMA_ATTR_WRITE_COMBINE.  Normally the "uncached" mapping should be wha=
t
> +# people thing of when saying write combine, so very few platforms shoul=
d
> +# need to enable this.
> +#
> +config ARCH_HAS_DMA_WRITE_COMBINE
> +	bool
> +
>  config DMA_DECLARE_COHERENT
>  	bool
> =20
> @@ -45,9 +54,6 @@ config ARCH_HAS_DMA_PREP_COHERENT
>  config ARCH_HAS_DMA_COHERENT_TO_PFN
>  	bool
> =20
> -config ARCH_HAS_DMA_MMAP_PGPROT
> -	bool
> -
>  config ARCH_HAS_FORCE_DMA_UNENCRYPTED
>  	bool
> =20
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index b0038ca3aa92..1b96616c9f20 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -161,9 +161,11 @@ pgprot_t dma_pgprot(struct device *dev, pgprot_t pro=
t, unsigned long attrs)
>  	    (IS_ENABLED(CONFIG_DMA_NONCOHERENT_CACHE_SYNC) &&
>               (attrs & DMA_ATTR_NON_CONSISTENT)))
>  		return prot;
> -	if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_MMAP_PGPROT))
> -		return arch_dma_mmap_pgprot(dev, prot, attrs);
> -	return pgprot_noncached(prot);
> +#ifdef CONFIG_ARCH_HAS_DMA_WRITE_COMBINE
> +	if (attrs & DMA_ATTR_WRITE_COMBINE)
> +		return pgprot_writecombine(prot);
> +#endif
> +	return pgprot_dmacoherent(prot);
>  }
>  #endif /* CONFIG_MMU */
> =20
> --=20
> 2.20.1
>=20
