Return-Path: <linuxppc-dev+bounces-12185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 098E2B56FCC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 07:48:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQDbZ3CjWz3cp1;
	Mon, 15 Sep 2025 15:48:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757915306;
	cv=none; b=WvSkl0dE9mMolejMAhd4ncC2cDawwSO5K/2iOHpsfCtQ+ZocmiXrtmT5IMMgy2xXOD2zC6MujdZxCREKuhZhxYSZZFHwr3zKEZwMWPjpao0+KeiJMzf+q6S1M/kkOk7HQqRutOOzaoUGWVZ9TW7B6g73tIiNVFvp1ZKwckpgKf1Uh7TusM4q0gVYxECtn1Tb81VczazE47cX2g1xL5I9OquyAxpMEfEqUqH2tAMmLgRBO0jkodLNDC3xPAiS9kf2yvTl0wh6dfg8LxCTs9Hv8D+2kXU951rnAgNSbe04Z1qjXgpGdRN3mKxOGSlqNiCW8jyRbFDFFmNaspknKjS5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757915306; c=relaxed/relaxed;
	bh=JXL3zMOfk7HJmj1hH5tcjC1ukwS1rzTdhMLd/yhlMo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfxGBT8riUMCXaaumfukaxwoyNORjbrJgNPwH78YrEl07KSt/KLnsRFfCNGPU8Mg77k1EPvfOvTZd6b+3ZJR9tfayoMScO+OOTu97xd+wQ/7YFHiZucC2szGzkjPWkAyZjdWOb4vb15pXg/XkHcKOb9xGUo7wZcbJsQOd8qPXD1r3UkrdspLTnLhGueY8NftIZQ9dH155VXidK3nVuQA/1qEcJo44ue6nzwK/cRL2fB+TMEqEKBjQ8o717XpyQSe9lwZ68yWG8Ybe8+o81qYsgb7Sz6hd9qom83qHhdnpZAGg8sYlc86HrqsN3SvcP6LhH8Px7KQ/01xnnuO7Uoc6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LY4R44OP; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LY4R44OP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQDbY4CrGz3cnk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 15:48:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05E2143F68;
	Mon, 15 Sep 2025 05:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FCDC4CEF1;
	Mon, 15 Sep 2025 05:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757915302;
	bh=QmA1uWtopyZKqYFa3aB5R38vcRhwp6UNA5QEhCCpxlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LY4R44OPNzL3Qer2vVNQup9uUTcNx43gZqh5FwLU0Oh1PdFVX0Y/KMu9Uvifa32bq
	 LKQg8b7U2pc5ik4+PxHv4Vxaw4OOg+vsmxh8TnpYqhx/pMCEM27S4kfw09R8Z3+SrS
	 WOCH3NphTYB7cis3wXHahmF9XEuFQFnTdwnEgrsxicfvxKQHyvsgH5+RBeSZZNlt+1
	 jN5OeNDI/I13LeozFgh3Z/w6y7Zqmf8gbZ1coqUma25WZo+AQ3j6hF69NbTonbiUow
	 a8r0c3Mzdr4L7umKhPtyml+GICc0Iz7CXrXjBFFY5PAmWMihDcJf2V0TWoeJPC1g6V
	 RKkFNq598mfYQ==
Date: Fri, 12 Sep 2025 12:03:27 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <20250912090327.GU341237@unreal>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
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
In-Reply-To: <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 12, 2025 at 12:25:38AM +0200, Marek Szyprowski wrote:
> On 09.09.2025 15:27, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> >
> > Changelog:
> > v6:
> >   * Based on "dma-debug: don't enforce dma mapping check on noncoherent
> >     allocations" patch.
> >   * Removed some unused variables from kmsan conversion.
> >   * Fixed missed ! in dma check.
> > v5: https://lore.kernel.org/all/cover.1756822782.git.leon@kernel.org
> >   * Added Jason's and Keith's Reviewed-by tags
> >   * Fixed DMA_ATTR_MMIO check in dma_direct_map_phys
> >   * Jason's cleanup suggestions
> > v4: https://lore.kernel.org/all/cover.1755624249.git.leon@kernel.org/
> >   * Fixed kbuild error with mismatch in kmsan function declaration due to
> >     rebase error.
> > v3: https://lore.kernel.org/all/cover.1755193625.git.leon@kernel.org
> >   * Fixed typo in "cacheable" word
> >   * Simplified kmsan patch a lot to be simple argument refactoring
> > v2: https://lore.kernel.org/all/cover.1755153054.git.leon@kernel.org
> >   * Used commit messages and cover letter from Jason
> >   * Moved setting IOMMU_MMIO flag to dma_info_to_prot function
> >   * Micro-optimized the code
> >   * Rebased code on v6.17-rc1
> > v1: https://lore.kernel.org/all/cover.1754292567.git.leon@kernel.org
> >   * Added new DMA_ATTR_MMIO attribute to indicate
> >     PCI_P2PDMA_MAP_THRU_HOST_BRIDGE path.
> >   * Rewrote dma_map_* functions to use thus new attribute
> > v0: https://lore.kernel.org/all/cover.1750854543.git.leon@kernel.org/
> > ------------------------------------------------------------------------
> >
> > This series refactors the DMA mapping to use physical addresses
> > as the primary interface instead of page+offset parameters. This
> > change aligns the DMA API with the underlying hardware reality where
> > DMA operations work with physical addresses, not page structures.
> >
> > The series maintains export symbol backward compatibility by keeping
> > the old page-based API as wrapper functions around the new physical
> > address-based implementations.
> >
> > This series refactors the DMA mapping API to provide a phys_addr_t
> > based, and struct-page free, external API that can handle all the
> > mapping cases we want in modern systems:
> >
> >   - struct page based cacheable DRAM
> >   - struct page MEMORY_DEVICE_PCI_P2PDMA PCI peer to peer non-cacheable
> >     MMIO
> >   - struct page-less PCI peer to peer non-cacheable MMIO
> >   - struct page-less "resource" MMIO
> >
> > Overall this gets much closer to Matthew's long term wish for
> > struct-pageless IO to cacheable DRAM. The remaining primary work would
> > be in the mm side to allow kmap_local_pfn()/phys_to_virt() to work on
> > phys_addr_t without a struct page.
> >
> > The general design is to remove struct page usage entirely from the
> > DMA API inner layers. For flows that need to have a KVA for the
> > physical address they can use kmap_local_pfn() or phys_to_virt(). This
> > isolates the struct page requirements to MM code only. Long term all
> > removals of struct page usage are supporting Matthew's memdesc
> > project which seeks to substantially transform how struct page works.
> >
> > Instead make the DMA API internals work on phys_addr_t. Internally
> > there are still dedicated 'page' and 'resource' flows, except they are
> > now distinguished by a new DMA_ATTR_MMIO instead of by callchain. Both
> > flows use the same phys_addr_t.
> >
> > When DMA_ATTR_MMIO is specified things work similar to the existing
> > 'resource' flow. kmap_local_pfn(), phys_to_virt(), phys_to_page(),
> > pfn_valid(), etc are never called on the phys_addr_t. This requires
> > rejecting any configuration that would need swiotlb. CPU cache
> > flushing is not required, and avoided, as ATTR_MMIO also indicates the
> > address have no cacheable mappings. This effectively removes any
> > DMA API side requirement to have struct page when DMA_ATTR_MMIO is
> > used.
> >
> > In the !DMA_ATTR_MMIO mode things work similarly to the 'page' flow,
> > except on the common path of no cache flush, no swiotlb it never
> > touches a struct page. When cache flushing or swiotlb copying
> > kmap_local_pfn()/phys_to_virt() are used to get a KVA for CPU
> > usage. This was already the case on the unmap side, now the map side
> > is symmetric.
> >
> > Callers are adjusted to set DMA_ATTR_MMIO. Existing 'resource' users
> > must set it. The existing struct page based MEMORY_DEVICE_PCI_P2PDMA
> > path must also set it. This corrects some existing bugs where iommu
> > mappings for P2P MMIO were improperly marked IOMMU_CACHE.
> >
> > Since ATTR_MMIO is made to work with all the existing DMA map entry
> > points, particularly dma_iova_link(), this finally allows a way to use
> > the new DMA API to map PCI P2P MMIO without creating struct page. The
> > VFIO DMABUF series demonstrates how this works. This is intended to
> > replace the incorrect driver use of dma_map_resource() on PCI BAR
> > addresses.
> >
> > This series does the core code and modern flows. A followup series
> > will give the same treatment to the legacy dma_ops implementation.
> 
> Applied patches 1-13 into dma-mapping-for-next branch. Let's check if it 
> works fine in linux-next.

Thanks a lot.

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
> 

