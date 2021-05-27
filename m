Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA53392F81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 15:25:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrT882rTYz30BR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 23:25:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrT7k3JP8z2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 23:24:50 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A8FB568AFE; Thu, 27 May 2021 15:24:42 +0200 (CEST)
Date: Thu, 27 May 2021 15:24:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v7 02/15] swiotlb: Refactor swiotlb_create_debugfs
Message-ID: <20210527132442.GA26160@lst.de>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-3-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518064215.2856977-3-tientzu@chromium.org>
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
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, daniel@ffwll.ch, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 18, 2021 at 02:42:02PM +0800, Claire Chang wrote:
>  struct io_tlb_mem *io_tlb_default_mem;
> +static struct dentry *debugfs_dir;
>  
>  /*
>   * Max segment that we can provide which (if pages are contingous) will
> @@ -662,18 +663,30 @@ EXPORT_SYMBOL_GPL(is_swiotlb_active);
>  
>  #ifdef CONFIG_DEBUG_FS
>  
> +static void swiotlb_create_debugfs(struct io_tlb_mem *mem, const char *name)
>  {
>  	if (!mem)
> +		return;

I don't think this check makes much sense here.

> +}
> +
> +static int __init swiotlb_create_default_debugfs(void)
> +{
> +	struct io_tlb_mem *mem = io_tlb_default_mem;
> +
> +	if (mem) {
> +		swiotlb_create_debugfs(mem, "swiotlb");
> +		debugfs_dir = mem->debugfs;
> +	} else {
> +		debugfs_dir = debugfs_create_dir("swiotlb", NULL);
> +	}

This also looks rather strange.  I'd much rather create move the
directory creation of out swiotlb_create_debugfs.  E.g. something like:

static void swiotlb_create_debugfs_file(struct io_tlb_mem *mem)
{
	debugfs_create_ulong("io_tlb_nslabs", 0400, mem->debugfs, &mem->nslabs);
	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &mem->used);
}

static int __init swiotlb_init_debugfs(void)
{
	debugfs_dir = debugfs_create_dir("swiotlb", NULL);
	if (io_tlb_default_mem) {
		io_tlb_default_mem->debugfs = debugfs_dir;
		swiotlb_create_debugfs_files(io_tlb_default_mem);
	}
	return 0;
}
late_initcall(swiotlb_init_debugfs);

...

static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
                                    struct device *dev)
{
	...
		mem->debugfs = debugfs_create_dir(rmem->name, debugfs_dir);
		swiotlb_create_debugfs_files(mem->debugfs);

			
}
