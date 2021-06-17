Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C269E3AA7E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 02:10:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G52Vw3FDlz3c0j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 10:10:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZYuvhN96;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sstabellini@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZYuvhN96; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G52VS3CFCz2ylk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 10:09:36 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70EFE61351;
 Thu, 17 Jun 2021 00:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623888572;
 bh=mN2okVVdTICmc/8v91DABSXp7kK2mc41VelpLLMzraM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZYuvhN96769HVBf9HwXfEMrx5h2joXFESxJj/lRenrF7yXWLZjtrg1PWIka+vT/Q0
 oFtXyOpOZ9yR7QPt6WZ9qiVwYGYEJ72zE5pEW7HiR62r0bK1cPffUlPeluSwwsGV++
 8riMe4sA8jh8H05UnuJF58KJLPG9dNHhkmEpW63Symhvau9C6X5CTpmeRZXg03FBNA
 YdmM71is91QiA8p/farR5qTSk/+kZjwaUjrHEt7/cAUyCA79A0OF17vUa8D0c+gd+H
 nwIEeujLTdx4sfeAu0ptJEutsq4BmObXoP4A9/HlakW6ogsicBITdzMemlH7LIUWJw
 GZfH7kl1LZ6XQ==
Date: Wed, 16 Jun 2021 17:09:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v12 11/12] dt-bindings: of: Add restricted DMA pool
In-Reply-To: <20210616062157.953777-12-tientzu@chromium.org>
Message-ID: <alpine.DEB.2.21.2106161651290.24906@sstabellini-ThinkPad-T480s>
References: <20210616062157.953777-1-tientzu@chromium.org>
 <20210616062157.953777-12-tientzu@chromium.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 16 Jun 2021, Claire Chang wrote:
> Introduce the new compatible string, restricted-dma-pool, for restricted
> DMA. One can specify the address and length of the restricted DMA memory
> region by restricted-dma-pool in the reserved-memory node.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  .../reserved-memory/reserved-memory.txt       | 36 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> index e8d3096d922c..46804f24df05 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> @@ -51,6 +51,23 @@ compatible (optional) - standard definition
>            used as a shared pool of DMA buffers for a set of devices. It can
>            be used by an operating system to instantiate the necessary pool
>            management subsystem if necessary.
> +        - restricted-dma-pool: This indicates a region of memory meant to be
> +          used as a pool of restricted DMA buffers for a set of devices. The
> +          memory region would be the only region accessible to those devices.
> +          When using this, the no-map and reusable properties must not be set,
> +          so the operating system can create a virtual mapping that will be used
> +          for synchronization. The main purpose for restricted DMA is to
> +          mitigate the lack of DMA access control on systems without an IOMMU,
> +          which could result in the DMA accessing the system memory at
> +          unexpected times and/or unexpected addresses, possibly leading to data
> +          leakage or corruption. The feature on its own provides a basic level
> +          of protection against the DMA overwriting buffer contents at
> +          unexpected times. However, to protect against general data leakage and
> +          system memory corruption, the system needs to provide way to lock down
> +          the memory access, e.g., MPU. Note that since coherent allocation
> +          needs remapping, one must set up another device coherent pool by
> +          shared-dma-pool and use dma_alloc_from_dev_coherent instead for atomic
> +          coherent allocation.
>          - vendor specific string in the form <vendor>,[<device>-]<usage>
>  no-map (optional) - empty property
>      - Indicates the operating system must not create a virtual mapping
> @@ -85,10 +102,11 @@ memory-region-names (optional) - a list of names, one for each corresponding
>  
>  Example
>  -------
> -This example defines 3 contiguous regions are defined for Linux kernel:
> +This example defines 4 contiguous regions for Linux kernel:
>  one default of all device drivers (named linux,cma@72000000 and 64MiB in size),
> -one dedicated to the framebuffer device (named framebuffer@78000000, 8MiB), and
> -one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> +one dedicated to the framebuffer device (named framebuffer@78000000, 8MiB),
> +one for multimedia processing (named multimedia-memory@77000000, 64MiB), and
> +one for restricted dma pool (named restricted_dma_reserved@0x50000000, 64MiB).
>  
>  / {
>  	#address-cells = <1>;
> @@ -120,6 +138,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>  			compatible = "acme,multimedia-memory";
>  			reg = <0x77000000 0x4000000>;
>  		};
> +
> +		restricted_dma_reserved: restricted_dma_reserved {
> +			compatible = "restricted-dma-pool";
> +			reg = <0x50000000 0x4000000>;
> +		};
>  	};
>  
>  	/* ... */
> @@ -138,4 +161,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>  		memory-region = <&multimedia_reserved>;
>  		/* ... */
>  	};
> +
> +	pcie_device: pcie_device@0,0 {
> +		reg = <0x83010000 0x0 0x00000000 0x0 0x00100000
> +		       0x83010000 0x0 0x00100000 0x0 0x00100000>;
> +		memory-region = <&restricted_dma_mem_reserved>;

Shouldn't it be &restricted_dma_reserved ?

