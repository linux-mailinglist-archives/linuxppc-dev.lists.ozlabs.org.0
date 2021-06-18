Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 618B53ACD98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 16:32:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G61br0nggz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 00:32:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G61bT5N1Zz3bvR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 00:32:20 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 64B2C68D08; Fri, 18 Jun 2021 16:32:12 +0200 (CEST)
Date: Fri, 18 Jun 2021 16:32:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v13 01/12] swiotlb: Refactor swiotlb init functions
Message-ID: <20210618143212.GA19284@lst.de>
References: <20210617062635.1660944-1-tientzu@chromium.org>
 <20210617062635.1660944-2-tientzu@chromium.org>
 <alpine.DEB.2.21.2106171434480.24906@sstabellini-ThinkPad-T480s>
 <CALiNf29SJ0jXirWVDhJw4BUNvkjUeGPyGNJK9m8c30OPX41=5Q@mail.gmail.com>
 <741a34cc-547c-984d-8af4-2f309880acfa@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <741a34cc-547c-984d-8af4-2f309880acfa@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 18, 2021 at 09:09:17AM -0500, Tom Lendacky wrote:
> > swiotlb_init_with_tbl uses memblock_alloc to allocate the io_tlb_mem
> > and memblock_alloc[1] will do memset in memblock_alloc_try_nid[2], so
> > swiotlb_init_with_tbl is also good.
> > I'm happy to add the memset in swiotlb_init_io_tlb_mem if you think
> > it's clearer and safer.
> 
> On x86, if the memset is done before set_memory_decrypted() and memory
> encryption is active, then the memory will look like ciphertext afterwards
> and not be zeroes. If zeroed memory is required, then a memset must be
> done after the set_memory_decrypted() calls.

Which should be fine - we don't care that the memory is cleared to 0,
just that it doesn't leak other data.  Maybe a comment would be useful,
though,
