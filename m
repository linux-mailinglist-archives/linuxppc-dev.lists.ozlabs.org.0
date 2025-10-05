Return-Path: <linuxppc-dev+bounces-12667-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3166BBB9776
	for <lists+linuxppc-dev@lfdr.de>; Sun, 05 Oct 2025 15:23:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cfjl259dFz3cQx;
	Mon,  6 Oct 2025 00:23:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759670590;
	cv=none; b=TsPxObV5WqYUeVFCUt6jLnFmNkvAYB+kJ9Sl9KOYUflhxWkWLQKfKfh6O7PFdwUlwqGb39gIaK3/jg+e286uZG+Pq6tXuiiQBEWqKSgUMLzHvgHyDDyZJzVj6vNZLD0zcOAc1re3PhHAwYXYdqaX/OhazPAwtjyG9/1NvCGgKbw4bc2udKJUYY036FxJONZoifusA36zDMMZetLZHp+gjGCwY6fcbiTuNNzn8ibeHGEIn+3K1z2VNkDylEwGwo+x43awRZmiy2d38coN7XSthEph0YGBg7fHwNHVXvptAT9UtucAxYdz3zLdNKkSpQlLE8WzOZm3fQp0QmKyWCV15A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759670590; c=relaxed/relaxed;
	bh=scAg49rBAhwp+dO/ImR6TWOZLbnW/TOLKph4sUjcb5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+dc3fPXoYq0160+SKVugY9UaZtikuOljLk4p+3u0DkdWE3S8t3nXCfjTsYOPH8Hp+yups1inoFM26Lmd2eG0QJ9ARjgpwH0d8stEbfgZdMgyvzs2WRVE73iNxjT4CLGwsPEfuEpKPSxB91icWfj7Ikrn2ymfU7nAGgoSGe8P3FshyPy/MRJX+tfUaRGpzDmEGlgNFFOOOqdDhSqU1DeWZRVhGAVsfSldt4aZATPsAftZSAMqm16xn0EEkX46GLqqj9u7tOTgO2/OQPgMemccNo9dChlPux0Ke3LWrji+8ZdtqSUwSgUOYTnf3xXVw9Hac1+bSULYrSlLrW8fITjVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eQI8MBWM; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eQI8MBWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cfjl14r0fz2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Oct 2025 00:23:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7859B6013A;
	Sun,  5 Oct 2025 13:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0842BC4CEF4;
	Sun,  5 Oct 2025 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759670585;
	bh=6+uRFKM+xw8rM4uHQwSSsX/I531L8PAvk6zEHoLHg8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQI8MBWMG4tLc46rpbyggEqPm4RA0GD3UaTk7eYqkbWnOP1BLMQA8Bd0FFRadaCjl
	 rAIwUkukGk1MYrK6xzB125V9hLaAp82BATfNmpxYK900245SXx6HbOfKm5BRC0dbrv
	 5QIWkPRwZti2En9ftBy6nIGiRtg+huCzDNWJ5bjY2f8oES07rhnV70hSDpOBxrTa9X
	 YnSL7jBydSFF3hFNjyz3N+OAncXZLI72rMKNLj2nG6j611VESyMRDTNgD+W7pQflQI
	 0zasEU6xrBWNYwhvzi4ZbeidMKDY3niw7/pdc6/NWMpg9zZU2H3pgYKg6oaItVMxpH
	 /iMYZdttll/xg==
Date: Sun, 5 Oct 2025 16:22:59 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 3/9] parisc: Convert DMA map_page to map_phys interface
Message-ID: <20251005132259.GA21221@unreal>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
 <20251003150144.GC3360665@nvidia.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003150144.GC3360665@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 03, 2025 at 12:01:44PM -0300, Jason Gunthorpe wrote:
> On Sun, Sep 28, 2025 at 06:02:23PM +0300, Leon Romanovsky wrote:
> > +ccio_map_phys(struct device *dev, phys_addr_t phys, size_t size,
> > +	      enum dma_data_direction direction, unsigned long attrs)
> >  {
> > -	return ccio_map_single(dev, page_address(page) + offset, size,
> > -			direction);
> > +	if (attrs & DMA_ATTR_MMIO)
> > +		return DMA_MAPPING_ERROR;
> > +
> > +	return ccio_map_single(dev, phys_to_virt(phys), size, direction);
> 
> This doesn't actually use the virt at all:
> 
> 	offset = ((unsigned long) addr) & ~IOVP_MASK;
> 	if((size % L1_CACHE_BYTES) || ((unsigned long)addr % L1_CACHE_BYTES))
> 		ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long)addr, hint);
> 
> And ccio_io_pdir_entry():
> 	pa = lpa(vba);
> 
> Is a special instruction that uses virt but AI tells me that special
> LPA instruction is returning phys. Not sure if that is a different
> value than virt_to_phys()..
> 
> IDK, I'm not feeling brave enough to drop the LPA but maybe include
> this note in the commit message.
> 
It looks like I was chosen as a volunteer to do so. WDYT?

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index b00f6fc49063..4d73e67fbd54 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -517,10 +517,10 @@ static u32 hint_lookup[] = {
  * ccio_io_pdir_entry - Initialize an I/O Pdir.
  * @pdir_ptr: A pointer into I/O Pdir.
  * @sid: The Space Identifier.
- * @vba: The virtual address.
+ * @pba: The physical address.
  * @hints: The DMA Hint.
  *
- * Given a virtual address (vba, arg2) and space id, (sid, arg1),
+ * Given a physical address (pba, arg2) and space id, (sid, arg1),
  * load the I/O PDIR entry pointed to by pdir_ptr (arg0). Each IO Pdir
  * entry consists of 8 bytes as shown below (MSB == bit 0):
  *
@@ -543,7 +543,7 @@ static u32 hint_lookup[] = {
  * index are bits 12:19 of the value returned by LCI.
  */
 static void
-ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
+ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, phys_addr_t pba,
                   unsigned long hints)
 {
        register unsigned long pa;
@@ -557,7 +557,7 @@ ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
        ** "hints" parm includes the VALID bit!
        ** "dep" clobbers the physical address offset bits as well.
        */
-       pa = lpa(vba);
+       pa = pba;
        asm volatile("depw  %1,31,12,%0" : "+r" (pa) : "r" (hints));
        ((u32 *)pdir_ptr)[1] = (u32) pa;

@@ -582,7 +582,7 @@ ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
        ** Grab virtual index [0:11]
        ** Deposit virt_idx bits into I/O PDIR word
        */
-       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (vba));
+       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (pba));
        asm volatile ("extru %1,19,12,%0" : "+r" (ci) : "r" (ci));
        asm volatile ("depw  %1,15,12,%0" : "+r" (pa) : "r" (ci));

@@ -704,14 +704,14 @@ ccio_dma_supported(struct device *dev, u64 mask)
 /**
  * ccio_map_single - Map an address range into the IOMMU.
  * @dev: The PCI device.
- * @addr: The start address of the DMA region.
+ * @addr: The physical address of the DMA region.
  * @size: The length of the DMA region.
  * @direction: The direction of the DMA transaction (to/from device).
  *
  * This function implements the pci_map_single function.
  */
 static dma_addr_t 
-ccio_map_single(struct device *dev, void *addr, size_t size,
+ccio_map_single(struct device *dev, phys_addr_t addr, size_t size,
                enum dma_data_direction direction)
 {
        int idx;
@@ -730,7 +730,7 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
        BUG_ON(size <= 0);
 
        /* save offset bits */
-       offset = ((unsigned long) addr) & ~IOVP_MASK;
+       offset = offset_in_page(addr);
 
        /* round up to nearest IOVP_SIZE */
        size = ALIGN(size + offset, IOVP_SIZE);
@@ -746,15 +746,15 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
 
        pdir_start = &(ioc->pdir_base[idx]);
 
-       DBG_RUN("%s() %px -> %#lx size: %zu\n",
-               __func__, addr, (long)(iovp | offset), size);
+       DBG_RUN("%s() %pa -> %#lx size: %zu\n",
+               __func__, &addr, (long)(iovp | offset), size);
 
        /* If not cacheline aligned, force SAFE_DMA on the whole mess */
-       if((size % L1_CACHE_BYTES) || ((unsigned long)addr % L1_CACHE_BYTES))
+       if((size % L1_CACHE_BYTES) || (addr % L1_CACHE_BYTES))
                hint |= HINT_SAFE_DMA;
 
        while(size > 0) {
-               ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long)addr, hint);
+               ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, addr, hint);
 
                DBG_RUN(" pdir %p %08x%08x\n",
                        pdir_start,
@@ -779,7 +779,7 @@ ccio_map_phys(struct device *dev, phys_addr_t phys, size_t size,
        if (unlikely(attrs & DMA_ATTR_MMIO))
                return DMA_MAPPING_ERROR;
 
-       return ccio_map_single(dev, phys_to_virt(phys), size, direction);
+       return ccio_map_single(dev, phys, size, direction);
 }
 
 
@@ -854,7 +854,8 @@ ccio_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle, gfp_t flag,
 
        if (ret) {
                memset(ret, 0, size);
-               *dma_handle = ccio_map_single(dev, ret, size, DMA_BIDIRECTIONAL);
+               *dma_handle = ccio_map_single(dev, virt_to_phys(ret), size,
+                                             DMA_BIDIRECTIONAL);
        }
 
        return ret;
@@ -921,7 +922,7 @@ ccio_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
        /* Fast path single entry scatterlists. */
        if (nents == 1) {
                sg_dma_address(sglist) = ccio_map_single(dev,
-                               sg_virt(sglist), sglist->length,
+                               sg_phys(sglist), sglist->length,
                                direction);
                sg_dma_len(sglist) = sglist->length;
                return 1;

> 
> Jason
> 

