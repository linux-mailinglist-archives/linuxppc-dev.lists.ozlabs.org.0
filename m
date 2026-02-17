Return-Path: <linuxppc-dev+bounces-16898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCXAEOJelGnODAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 13:28:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3FA14BF12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 13:28:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFf7M18tQz2yS4;
	Tue, 17 Feb 2026 23:28:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771331295;
	cv=none; b=joNOKVKLccdSez+4SgWwuWpcX6cy5q4qIfxU4b3hO6KAD/DNYlC3dqGZjeionL3fXJuty1kltFNoxmN7+6aYzS8sTxtwFVLTalU6yVjHYRg/e+cuO959N6XGjvlkaM0WZALUvNFWZJzTWyVGuKjYAqWM81QjVkXYUG4oU1LMF24S/cueIvhzpuPRxqknyj3KSn88KV5OpTeSgsNPljP/oLpwZEo6NO0/Q34DNAXmTIv7326J/3w6X0yXMS2XJ4ctEZo90uoE2q7wy+qthMtb9iBeRnygPPBvkqzYeUAGEKVZHHE0r5Jqwo0hBY5a334WnS/7QF8NM7O3iU0UbtmAww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771331295; c=relaxed/relaxed;
	bh=M8vjpXwBYqHTGgLeO7mfZbw/zRtPy35wLTMbPEUqNJY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PWICujbAtJC6h8+tWkouiuYGt3GYD1DmtMJGwIjF3P8l6buRP/p8SXIPEpGc8vD0LhGljsKXyJObNbdBokIj0QozxE/ItoXu5uQX1BoZU+Yr8mbBUnjlHK9ArrNhgL6zXatBRsrN7O73ZBmVsMFNVIm2kAKOnmKr3eU/uyduP6FthC77mppAeRpHaue+u4bMY6OoyoqecKtXGjeHsKiVqDnr/mST0qjqh3Tp8HAKn2k+v4LxwaoGNrLGO40WDTMOHutVmlpuxSDqCii3HF0GoOfr9XAlL6z3+A3zWm0u0aTND12rn7DcxK/2mlT9Di5uzrli0/DAvHZFjj7x3umfWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=KwaCefz8; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=KwaCefz8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFf7H0NDlz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 23:28:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=M8vjpXwBYqHTGgLeO7mfZbw/zRtPy35wLTMbPEUqNJY=; t=1771331291;
	x=1771936091; b=KwaCefz86aHcV1WA9Zdnjw/rjA5OMkCQPA8cbBctj+KipOvNpyYoyrQ6w/j70
	NZ50pjf95xmkwl+u6fzBhAaICvsTvi9RzsTS3ntdkosk51hZuYcYOl72LfPpez0SMQV7dYbrrCe/I
	h49S7w2cjB/CstrhxUZBSlGAebmrVDcMxy8kvUCY57w7k0zdPFq/p0txGfEpi8G8gC/LnWFdoJEqn
	+uf3bbZ65R+5mZ5YMLi7fj6F5LsZ3FjPX8lCsZkf3PCM8YxemZrvsaO1mPaZkUuXY5+AfQYkeht4Q
	ICtBgRFjIfYOfWY/R3VqH0O05RbL6nofRF8Ijm7dHE+q2wCG0A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vsKAq-00000002WEs-0TOS; Tue, 17 Feb 2026 13:27:28 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vsKAp-000000026vw-3EPk; Tue, 17 Feb 2026 13:27:27 +0100
Message-ID: <e294484787a5032c531dcd40071b22362bddcad4.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v5 11/14] sparc: Use physical address DMA mapping
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Leon Romanovsky <leon@kernel.org>, Marek Szyprowski	
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Russell
 King	 <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini	 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,  Richard Henderson
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Thomas
 Bogendoerfer	 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"	
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
 Madhavan Srinivasan	 <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin	 <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Geoff Levand <geoff@infradead.org>,
 "David S. Miller" <davem@davemloft.net>, Andreas Larsson	
 <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar	
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen	
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux
	 <sparclinux@vger.kernel.org>
Date: Tue, 17 Feb 2026 13:27:26 +0100
In-Reply-To: <20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
	 <20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.95.41
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:linux@armlinux.org.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:tsbogend@alpha.franken.de,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:geoff@infradead.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-alpha@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[glaubitz@physik.fu-berlin.de,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,arm.com,armlinux.org.uk,suse.com,epam.com,linaro.org,gmail.com,alpha.franken.de,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,csgroup.eu,infradead.org,davemloft.net,gaisler.com,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16898-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fu-berlin.de:dkim,nvidia.com:email,physik.fu-berlin.de:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 6B3FA14BF12
X-Rspamd-Action: no action

Hello Leon,

On Wed, 2025-10-15 at 12:12 +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
>=20
> Convert sparc architecture DMA code to use .map_phys callback.
>=20
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  arch/sparc/kernel/iommu.c     | 30 +++++++++++++++++-----------
>  arch/sparc/kernel/pci_sun4v.c | 31 ++++++++++++++++++-----------
>  arch/sparc/mm/io-unit.c       | 38 ++++++++++++++++++-----------------
>  arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++++++---------------=
------
>  4 files changed, 82 insertions(+), 63 deletions(-)
>=20
> diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
> index da0363692528..46ef88bc9c26 100644
> --- a/arch/sparc/kernel/iommu.c
> +++ b/arch/sparc/kernel/iommu.c
> @@ -260,26 +260,35 @@ static void dma_4u_free_coherent(struct device *dev=
, size_t size,
>  		free_pages((unsigned long)cpu, order);
>  }
> =20
> -static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
> -				  unsigned long offset, size_t sz,
> -				  enum dma_data_direction direction,
> +static dma_addr_t dma_4u_map_phys(struct device *dev, phys_addr_t phys,
> +				  size_t sz, enum dma_data_direction direction,
>  				  unsigned long attrs)
>  {
>  	struct iommu *iommu;
>  	struct strbuf *strbuf;
>  	iopte_t *base;
>  	unsigned long flags, npages, oaddr;
> -	unsigned long i, base_paddr, ctx;
> +	unsigned long i, ctx;
>  	u32 bus_addr, ret;
>  	unsigned long iopte_protection;
> =20
> +	if (unlikely(attrs & DMA_ATTR_MMIO))
> +		/*
> +		 * This check is included because older versions of the code
> +		 * lacked MMIO path support, and my ability to test this path
> +		 * is limited. However, from a software technical standpoint,
> +		 * there is no restriction, as the following code operates
> +		 * solely on physical addresses.
> +		 */
> +		goto bad_no_ctx;
> +
>  	iommu =3D dev->archdata.iommu;
>  	strbuf =3D dev->archdata.stc;
> =20
>  	if (unlikely(direction =3D=3D DMA_NONE))
>  		goto bad_no_ctx;
> =20
> -	oaddr =3D (unsigned long)(page_address(page) + offset);
> +	oaddr =3D (unsigned long)(phys_to_virt(phys));
>  	npages =3D IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
>  	npages >>=3D IO_PAGE_SHIFT;
> =20
> @@ -296,7 +305,6 @@ static dma_addr_t dma_4u_map_page(struct device *dev,=
 struct page *page,
>  	bus_addr =3D (iommu->tbl.table_map_base +
>  		    ((base - iommu->page_table) << IO_PAGE_SHIFT));
>  	ret =3D bus_addr | (oaddr & ~IO_PAGE_MASK);
> -	base_paddr =3D __pa(oaddr & IO_PAGE_MASK);
>  	if (strbuf->strbuf_enabled)
>  		iopte_protection =3D IOPTE_STREAMING(ctx);
>  	else
> @@ -304,8 +312,8 @@ static dma_addr_t dma_4u_map_page(struct device *dev,=
 struct page *page,
>  	if (direction !=3D DMA_TO_DEVICE)
>  		iopte_protection |=3D IOPTE_WRITE;
> =20
> -	for (i =3D 0; i < npages; i++, base++, base_paddr +=3D IO_PAGE_SIZE)
> -		iopte_val(*base) =3D iopte_protection | base_paddr;
> +	for (i =3D 0; i < npages; i++, base++, phys +=3D IO_PAGE_SIZE)
> +		iopte_val(*base) =3D iopte_protection | phys;
> =20
>  	return ret;
> =20
> @@ -383,7 +391,7 @@ static void strbuf_flush(struct strbuf *strbuf, struc=
t iommu *iommu,
>  		       vaddr, ctx, npages);
>  }
> =20
> -static void dma_4u_unmap_page(struct device *dev, dma_addr_t bus_addr,
> +static void dma_4u_unmap_phys(struct device *dev, dma_addr_t bus_addr,
>  			      size_t sz, enum dma_data_direction direction,
>  			      unsigned long attrs)
>  {
> @@ -753,8 +761,8 @@ static int dma_4u_supported(struct device *dev, u64 d=
evice_mask)
>  static const struct dma_map_ops sun4u_dma_ops =3D {
>  	.alloc			=3D dma_4u_alloc_coherent,
>  	.free			=3D dma_4u_free_coherent,
> -	.map_page		=3D dma_4u_map_page,
> -	.unmap_page		=3D dma_4u_unmap_page,
> +	.map_phys		=3D dma_4u_map_phys,
> +	.unmap_phys		=3D dma_4u_unmap_phys,
>  	.map_sg			=3D dma_4u_map_sg,
>  	.unmap_sg		=3D dma_4u_unmap_sg,
>  	.sync_single_for_cpu	=3D dma_4u_sync_single_for_cpu,
> diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.=
c
> index b720b21ccfbd..791f0a76665f 100644
> --- a/arch/sparc/kernel/pci_sun4v.c
> +++ b/arch/sparc/kernel/pci_sun4v.c
> @@ -352,9 +352,8 @@ static void dma_4v_free_coherent(struct device *dev, =
size_t size, void *cpu,
>  		free_pages((unsigned long)cpu, order);
>  }
> =20
> -static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
> -				  unsigned long offset, size_t sz,
> -				  enum dma_data_direction direction,
> +static dma_addr_t dma_4v_map_phys(struct device *dev, phys_addr_t phys,
> +				  size_t sz, enum dma_data_direction direction,
>  				  unsigned long attrs)
>  {
>  	struct iommu *iommu;
> @@ -362,18 +361,27 @@ static dma_addr_t dma_4v_map_page(struct device *de=
v, struct page *page,
>  	struct iommu_map_table *tbl;
>  	u64 mask;
>  	unsigned long flags, npages, oaddr;
> -	unsigned long i, base_paddr;
> -	unsigned long prot;
> +	unsigned long i, prot;
>  	dma_addr_t bus_addr, ret;
>  	long entry;
> =20
> +	if (unlikely(attrs & DMA_ATTR_MMIO))
> +		/*
> +		 * This check is included because older versions of the code
> +		 * lacked MMIO path support, and my ability to test this path
> +		 * is limited. However, from a software technical standpoint,
> +		 * there is no restriction, as the following code operates
> +		 * solely on physical addresses.
> +		 */
> +		goto bad;
> +
>  	iommu =3D dev->archdata.iommu;
>  	atu =3D iommu->atu;
> =20
>  	if (unlikely(direction =3D=3D DMA_NONE))
>  		goto bad;
> =20
> -	oaddr =3D (unsigned long)(page_address(page) + offset);
> +	oaddr =3D (unsigned long)(phys_to_virt(phys));
>  	npages =3D IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
>  	npages >>=3D IO_PAGE_SHIFT;
> =20
> @@ -391,7 +399,6 @@ static dma_addr_t dma_4v_map_page(struct device *dev,=
 struct page *page,
> =20
>  	bus_addr =3D (tbl->table_map_base + (entry << IO_PAGE_SHIFT));
>  	ret =3D bus_addr | (oaddr & ~IO_PAGE_MASK);
> -	base_paddr =3D __pa(oaddr & IO_PAGE_MASK);
>  	prot =3D HV_PCI_MAP_ATTR_READ;
>  	if (direction !=3D DMA_TO_DEVICE)
>  		prot |=3D HV_PCI_MAP_ATTR_WRITE;
> @@ -403,8 +410,8 @@ static dma_addr_t dma_4v_map_page(struct device *dev,=
 struct page *page,
> =20
>  	iommu_batch_start(dev, prot, entry);
> =20
> -	for (i =3D 0; i < npages; i++, base_paddr +=3D IO_PAGE_SIZE) {
> -		long err =3D iommu_batch_add(base_paddr, mask);
> +	for (i =3D 0; i < npages; i++, phys +=3D IO_PAGE_SIZE) {
> +		long err =3D iommu_batch_add(phys, mask);
>  		if (unlikely(err < 0L))
>  			goto iommu_map_fail;
>  	}
> @@ -426,7 +433,7 @@ static dma_addr_t dma_4v_map_page(struct device *dev,=
 struct page *page,
>  	return DMA_MAPPING_ERROR;
>  }
> =20
> -static void dma_4v_unmap_page(struct device *dev, dma_addr_t bus_addr,
> +static void dma_4v_unmap_phys(struct device *dev, dma_addr_t bus_addr,
>  			      size_t sz, enum dma_data_direction direction,
>  			      unsigned long attrs)
>  {
> @@ -686,8 +693,8 @@ static int dma_4v_supported(struct device *dev, u64 d=
evice_mask)
>  static const struct dma_map_ops sun4v_dma_ops =3D {
>  	.alloc				=3D dma_4v_alloc_coherent,
>  	.free				=3D dma_4v_free_coherent,
> -	.map_page			=3D dma_4v_map_page,
> -	.unmap_page			=3D dma_4v_unmap_page,
> +	.map_phys			=3D dma_4v_map_phys,
> +	.unmap_phys			=3D dma_4v_unmap_phys,
>  	.map_sg				=3D dma_4v_map_sg,
>  	.unmap_sg			=3D dma_4v_unmap_sg,
>  	.dma_supported			=3D dma_4v_supported,
> diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
> index d8376f61b4d0..d409cb450de4 100644
> --- a/arch/sparc/mm/io-unit.c
> +++ b/arch/sparc/mm/io-unit.c
> @@ -94,13 +94,14 @@ static int __init iounit_init(void)
>  subsys_initcall(iounit_init);
> =20
>  /* One has to hold iounit->lock to call this */
> -static unsigned long iounit_get_area(struct iounit_struct *iounit, unsig=
ned long vaddr, int size)
> +static dma_addr_t iounit_get_area(struct iounit_struct *iounit,
> +				  phys_addr_t phys, int size)
>  {
>  	int i, j, k, npages;
>  	unsigned long rotor, scan, limit;
>  	iopte_t iopte;
> =20
> -        npages =3D ((vaddr & ~PAGE_MASK) + size + (PAGE_SIZE-1)) >> PAGE=
_SHIFT;
> +	npages =3D (offset_in_page(phys) + size + (PAGE_SIZE - 1)) >> PAGE_SHIF=
T;
> =20
>  	/* A tiny bit of magic ingredience :) */
>  	switch (npages) {
> @@ -109,7 +110,7 @@ static unsigned long iounit_get_area(struct iounit_st=
ruct *iounit, unsigned long
>  	default: i =3D 0x0213; break;
>  	}
>  =09
> -	IOD(("iounit_get_area(%08lx,%d[%d])=3D", vaddr, size, npages));
> +	IOD(("%s(%pa,%d[%d])=3D", __func__, &phys, size, npages));
>  =09
>  next:	j =3D (i & 15);
>  	rotor =3D iounit->rotor[j - 1];
> @@ -124,7 +125,8 @@ nexti:	scan =3D find_next_zero_bit(iounit->bmap, limi=
t, scan);
>  		}
>  		i >>=3D 4;
>  		if (!(i & 15))
> -			panic("iounit_get_area: Couldn't find free iopte slots for (%08lx,%d)=
\n", vaddr, size);
> +			panic("iounit_get_area: Couldn't find free iopte slots for (%pa,%d)\n=
",
> +			      &phys, size);
>  		goto next;
>  	}
>  	for (k =3D 1, scan++; k < npages; k++)
> @@ -132,30 +134,29 @@ nexti:	scan =3D find_next_zero_bit(iounit->bmap, li=
mit, scan);
>  			goto nexti;
>  	iounit->rotor[j - 1] =3D (scan < limit) ? scan : iounit->limit[j - 1];
>  	scan -=3D npages;
> -	iopte =3D MKIOPTE(__pa(vaddr & PAGE_MASK));
> -	vaddr =3D IOUNIT_DMA_BASE + (scan << PAGE_SHIFT) + (vaddr & ~PAGE_MASK)=
;
> +	iopte =3D MKIOPTE(phys & PAGE_MASK);
> +	phys =3D IOUNIT_DMA_BASE + (scan << PAGE_SHIFT) + offset_in_page(phys);
>  	for (k =3D 0; k < npages; k++, iopte =3D __iopte(iopte_val(iopte) + 0x1=
00), scan++) {
>  		set_bit(scan, iounit->bmap);
>  		sbus_writel(iopte_val(iopte), &iounit->page_table[scan]);
>  	}
> -	IOD(("%08lx\n", vaddr));
> -	return vaddr;
> +	IOD(("%pa\n", &phys));
> +	return phys;
>  }
> =20
> -static dma_addr_t iounit_map_page(struct device *dev, struct page *page,
> -		unsigned long offset, size_t len, enum dma_data_direction dir,
> -		unsigned long attrs)
> +static dma_addr_t iounit_map_phys(struct device *dev, phys_addr_t phys,
> +		size_t len, enum dma_data_direction dir, unsigned long attrs)
>  {
> -	void *vaddr =3D page_address(page) + offset;
>  	struct iounit_struct *iounit =3D dev->archdata.iommu;
> -	unsigned long ret, flags;
> +	unsigned long flags;
> +	dma_addr_t ret;
>  =09
>  	/* XXX So what is maxphys for us and how do drivers know it? */
>  	if (!len || len > 256 * 1024)
>  		return DMA_MAPPING_ERROR;
> =20
>  	spin_lock_irqsave(&iounit->lock, flags);
> -	ret =3D iounit_get_area(iounit, (unsigned long)vaddr, len);
> +	ret =3D iounit_get_area(iounit, phys, len);
>  	spin_unlock_irqrestore(&iounit->lock, flags);
>  	return ret;
>  }
> @@ -171,14 +172,15 @@ static int iounit_map_sg(struct device *dev, struct=
 scatterlist *sgl, int nents,
>  	/* FIXME: Cache some resolved pages - often several sg entries are to t=
he same page */
>  	spin_lock_irqsave(&iounit->lock, flags);
>  	for_each_sg(sgl, sg, nents, i) {
> -		sg->dma_address =3D iounit_get_area(iounit, (unsigned long) sg_virt(sg=
), sg->length);
> +		sg->dma_address =3D
> +			iounit_get_area(iounit, sg_phys(sg), sg->length);
>  		sg->dma_length =3D sg->length;
>  	}
>  	spin_unlock_irqrestore(&iounit->lock, flags);
>  	return nents;
>  }
> =20
> -static void iounit_unmap_page(struct device *dev, dma_addr_t vaddr, size=
_t len,
> +static void iounit_unmap_phys(struct device *dev, dma_addr_t vaddr, size=
_t len,
>  		enum dma_data_direction dir, unsigned long attrs)
>  {
>  	struct iounit_struct *iounit =3D dev->archdata.iommu;
> @@ -279,8 +281,8 @@ static const struct dma_map_ops iounit_dma_ops =3D {
>  	.alloc			=3D iounit_alloc,
>  	.free			=3D iounit_free,
>  #endif
> -	.map_page		=3D iounit_map_page,
> -	.unmap_page		=3D iounit_unmap_page,
> +	.map_phys		=3D iounit_map_phys,
> +	.unmap_phys		=3D iounit_unmap_phys,
>  	.map_sg			=3D iounit_map_sg,
>  	.unmap_sg		=3D iounit_unmap_sg,
>  };
> diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
> index 5a5080db800f..f48adf62724a 100644
> --- a/arch/sparc/mm/iommu.c
> +++ b/arch/sparc/mm/iommu.c
> @@ -181,18 +181,20 @@ static void iommu_flush_iotlb(iopte_t *iopte, unsig=
ned int niopte)
>  	}
>  }
> =20
> -static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page =
*page,
> -		unsigned long offset, size_t len, bool per_page_flush)
> +static dma_addr_t __sbus_iommu_map_phys(struct device *dev, phys_addr_t =
paddr,
> +		size_t len, bool per_page_flush, unsigned long attrs)
>  {
>  	struct iommu_struct *iommu =3D dev->archdata.iommu;
> -	phys_addr_t paddr =3D page_to_phys(page) + offset;
> -	unsigned long off =3D paddr & ~PAGE_MASK;
> +	unsigned long off =3D offset_in_page(paddr);
>  	unsigned long npages =3D (off + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
>  	unsigned long pfn =3D __phys_to_pfn(paddr);
>  	unsigned int busa, busa0;
>  	iopte_t *iopte, *iopte0;
>  	int ioptex, i;
> =20
> +	if (unlikely(attrs & DMA_ATTR_MMIO))
> +		return DMA_MAPPING_ERROR;
> +
>  	/* XXX So what is maxphys for us and how do drivers know it? */
>  	if (!len || len > 256 * 1024)
>  		return DMA_MAPPING_ERROR;
> @@ -202,10 +204,10 @@ static dma_addr_t __sbus_iommu_map_page(struct devi=
ce *dev, struct page *page,
>  	 * XXX Is this a good assumption?
>  	 * XXX What if someone else unmaps it here and races us?
>  	 */
> -	if (per_page_flush && !PageHighMem(page)) {
> +	if (per_page_flush && !PhysHighMem(paddr)) {
>  		unsigned long vaddr, p;
> =20
> -		vaddr =3D (unsigned long)page_address(page) + offset;
> +		vaddr =3D (unsigned long)phys_to_virt(paddr);
>  		for (p =3D vaddr & PAGE_MASK; p < vaddr + len; p +=3D PAGE_SIZE)
>  			flush_page_for_dma(p);
>  	}
> @@ -231,19 +233,19 @@ static dma_addr_t __sbus_iommu_map_page(struct devi=
ce *dev, struct page *page,
>  	return busa0 + off;
>  }
> =20
> -static dma_addr_t sbus_iommu_map_page_gflush(struct device *dev,
> -		struct page *page, unsigned long offset, size_t len,
> -		enum dma_data_direction dir, unsigned long attrs)
> +static dma_addr_t sbus_iommu_map_phys_gflush(struct device *dev,
> +		phys_addr_t phys, size_t len, enum dma_data_direction dir,
> +		unsigned long attrs)
>  {
>  	flush_page_for_dma(0);
> -	return __sbus_iommu_map_page(dev, page, offset, len, false);
> +	return __sbus_iommu_map_phys(dev, phys, len, false, attrs);
>  }
> =20
> -static dma_addr_t sbus_iommu_map_page_pflush(struct device *dev,
> -		struct page *page, unsigned long offset, size_t len,
> -		enum dma_data_direction dir, unsigned long attrs)
> +static dma_addr_t sbus_iommu_map_phys_pflush(struct device *dev,
> +		phys_addr_t phys, size_t len, enum dma_data_direction dir,
> +		unsigned long attrs)
>  {
> -	return __sbus_iommu_map_page(dev, page, offset, len, true);
> +	return __sbus_iommu_map_phys(dev, phys, len, true, attrs);
>  }
> =20
>  static int __sbus_iommu_map_sg(struct device *dev, struct scatterlist *s=
gl,
> @@ -254,8 +256,8 @@ static int __sbus_iommu_map_sg(struct device *dev, st=
ruct scatterlist *sgl,
>  	int j;
> =20
>  	for_each_sg(sgl, sg, nents, j) {
> -		sg->dma_address =3D__sbus_iommu_map_page(dev, sg_page(sg),
> -				sg->offset, sg->length, per_page_flush);
> +		sg->dma_address =3D __sbus_iommu_map_phys(dev, sg_phys(sg),
> +				sg->length, per_page_flush, attrs);
>  		if (sg->dma_address =3D=3D DMA_MAPPING_ERROR)
>  			return -EIO;
>  		sg->dma_length =3D sg->length;
> @@ -277,7 +279,7 @@ static int sbus_iommu_map_sg_pflush(struct device *de=
v, struct scatterlist *sgl,
>  	return __sbus_iommu_map_sg(dev, sgl, nents, dir, attrs, true);
>  }
> =20
> -static void sbus_iommu_unmap_page(struct device *dev, dma_addr_t dma_add=
r,
> +static void sbus_iommu_unmap_phys(struct device *dev, dma_addr_t dma_add=
r,
>  		size_t len, enum dma_data_direction dir, unsigned long attrs)
>  {
>  	struct iommu_struct *iommu =3D dev->archdata.iommu;
> @@ -303,7 +305,7 @@ static void sbus_iommu_unmap_sg(struct device *dev, s=
truct scatterlist *sgl,
>  	int i;
> =20
>  	for_each_sg(sgl, sg, nents, i) {
> -		sbus_iommu_unmap_page(dev, sg->dma_address, sg->length, dir,
> +		sbus_iommu_unmap_phys(dev, sg->dma_address, sg->length, dir,
>  				attrs);
>  		sg->dma_address =3D 0x21212121;
>  	}
> @@ -426,8 +428,8 @@ static const struct dma_map_ops sbus_iommu_dma_gflush=
_ops =3D {
>  	.alloc			=3D sbus_iommu_alloc,
>  	.free			=3D sbus_iommu_free,
>  #endif
> -	.map_page		=3D sbus_iommu_map_page_gflush,
> -	.unmap_page		=3D sbus_iommu_unmap_page,
> +	.map_phys		=3D sbus_iommu_map_phys_gflush,
> +	.unmap_phys		=3D sbus_iommu_unmap_phys,
>  	.map_sg			=3D sbus_iommu_map_sg_gflush,
>  	.unmap_sg		=3D sbus_iommu_unmap_sg,
>  };
> @@ -437,8 +439,8 @@ static const struct dma_map_ops sbus_iommu_dma_pflush=
_ops =3D {
>  	.alloc			=3D sbus_iommu_alloc,
>  	.free			=3D sbus_iommu_free,
>  #endif
> -	.map_page		=3D sbus_iommu_map_page_pflush,
> -	.unmap_page		=3D sbus_iommu_unmap_page,
> +	.map_phys		=3D sbus_iommu_map_phys_pflush,
> +	.unmap_phys		=3D sbus_iommu_unmap_phys,
>  	.map_sg			=3D sbus_iommu_map_sg_pflush,
>  	.unmap_sg		=3D sbus_iommu_unmap_sg,
>  };

This change has just been reported to cause a regression with the igb
driver on some SPARC server systems:

Feb 16 15:20:22 sparcy kernel: igb 0000:0c:00.0 enp12s0f0: igb: enp12s0f0 N=
IC Link is Up 1000 Mbps Full Duplex, Flow Control: RX/TX=20
Feb 16 15:20:23 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000000a7d:1:2736c000] failed with status 8=20
Feb 16 15:20:23 sparcy kernel: igb 0000:0c:00.0: TX DMA map failed=20
Feb 16 15:20:23 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000000a7e:1:2736c000] failed with status 8=20
Feb 16 15:20:23 sparcy kernel: igb 0000:0c:00.0: TX DMA map failed=20
Feb 16 15:20:23 sparcy kernel: igb 0000:0c:00.1 enp12s0f1: igb: enp12s0f1 N=
IC Link is Up 100 Mbps Full Duplex, Flow Control: RX=20
Feb 16 15:20:23 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
000001c02af:1:2736e000] failed with status 8=20
Feb 16 15:20:23 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
0000038009f:1:27390000] failed with status 8=20
Feb 16 15:20:23 sparcy kernel: igb 0000:0c:00.1: TX DMA map failed=20
Feb 16 15:20:23 sparcy last message buffered 1 times=20
Feb 16 15:20:23 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
000001c02b1:1:2736e000] failed with status 8=20
Feb 16 15:20:23 sparcy kernel: igb 0000:0c:00.0: TX DMA map failed=20
Feb 16 15:20:24 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000000a80:1:2736c000] failed with status 8=20
Feb 16 15:20:24 sparcy kernel: igb 0000:0c:00.0: TX DMA map failed=20
Feb 16 15:20:24 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000000a81:1:2736c000] failed with status 8=20
Feb 16 15:20:24 sparcy kernel: igb 0000:0c:00.0: TX DMA map failed=20
Feb 16 15:20:24 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000200000:1:2738e000] failed with status 8=20
Feb 16 15:20:24 sparcy kernel: igb 0000:0c:00.1: TX DMA map failed=20
Feb 16 15:20:24 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000000a82:1:2736c000] failed with status 8=20
Feb 16 15:20:24 sparcy kernel: igb 0000:0c:00.1: TX DMA map failed

Please see also the discussion in [1].

Adrian

> [1] https://github.com/sparclinux/issues/issues/75

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

