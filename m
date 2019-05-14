Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856E1C129
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 06:06:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4533yX6cv5zDqH6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 14:06:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 4533x86CpzzDqGQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 14:04:59 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78EBB341;
 Mon, 13 May 2019 21:04:55 -0700 (PDT)
Received: from [10.163.1.137] (unknown [10.163.1.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AD423F71E;
 Mon, 13 May 2019 21:04:52 -0700 (PDT)
Subject: Re: [RFC PATCH] mm/nvdimm: Fix kernel crash on
 devm_mremap_pages_release
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, dan.j.williams@intel.com
References: <20190514025354.9108-1-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <2f08e63e-5ff9-b036-1212-9345894cca26@arm.com>
Date: Tue, 14 May 2019 09:35:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190514025354.9108-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/14/2019 08:23 AM, Aneesh Kumar K.V wrote:
> When we initialize the namespace, if we support altmap, we don't initialize all the
> backing struct page where as while releasing the namespace we look at some of
> these uninitilized struct page. This results in a kernel crash as below.
Yes this has been problematic which I have also previously encountered but in a bit
different way (while searching memory resources).

> 
> kernel BUG at include/linux/mm.h:1034!
What that would be ? Did not see a corresponding BUG_ON() line in the file.

> cpu 0x2: Vector: 700 (Program Check) at [c00000024146b870]
>     pc: c0000000003788f8: devm_memremap_pages_release+0x258/0x3a0
>     lr: c0000000003788f4: devm_memremap_pages_release+0x254/0x3a0
>     sp: c00000024146bb00
>    msr: 800000000282b033
>   current = 0xc000000241382f00
>   paca    = 0xc00000003fffd680   irqmask: 0x03   irq_happened: 0x01
>     pid   = 4114, comm = ndctl
>  c0000000009bf8c0 devm_action_release+0x30/0x50
>  c0000000009c0938 release_nodes+0x268/0x2d0
>  c0000000009b95b4 device_release_driver_internal+0x164/0x230
>  c0000000009b638c unbind_store+0x13c/0x190
>  c0000000009b4f44 drv_attr_store+0x44/0x60
>  c00000000058ccc0 sysfs_kf_write+0x70/0xa0
>  c00000000058b52c kernfs_fop_write+0x1ac/0x290
>  c0000000004a415c __vfs_write+0x3c/0x70
>  c0000000004a85ac vfs_write+0xec/0x200
>  c0000000004a8920 ksys_write+0x80/0x130
>  c00000000000bee4 system_call+0x5c/0x70

I saw this as memory hotplug problem with respect to ZONE_DEVICE based device memory.
Hence a bit different explanation which I never posted. I guess parts of the commit
message here can be used for a better comprehensive explanation of the problem.

mm/hotplug: Initialize struct pages for vmem_altmap reserved areas

The following ZONE_DEVICE ranges (altmap) have valid struct pages allocated
from within device memory memmap range.

A. Driver reserved area	[BASE -> BASE + RESV)
B. Device mmap area	[BASE + RESV -> BASE + RESV + FREE]
C. Device usable area	[BASE + RESV + FREE -> END]

BASE - pgmap->altmap.base_pfn (pgmap->res.start >> PAGE_SHIFT)
RESV - pgmap->altmap.reserve
FREE - pgmap->altmap.free
END  - pgmap->res->end >> PAGE_SHIFT

Struct page init for all areas happens in two phases which detects altmap
use case and init parts of the device range in each phase.

1. memmap_init_zone		(Device mmap area)
2. memmap_init_zone_device	(Device usable area)

memmap_init_zone() skips driver reserved area and does not init the
struct pages. This is problematic primarily for two reasons.

Though NODE_DATA(device_node(dev))->node_zones[ZONE_DEVICE] contains the
device memory range in it's entirety (in zone->spanned_pages) parts of this
range does not have zone set to ZONE_DEVICE in their struct page.

__remove_pages() called directly or from within arch_remove_memory() during
ZONE_DEVICE tear down procedure (devm_memremap_pages_release) hits an error
(like below) if there are reserved pages. This is because the first pfn of
the device range (invariably also the first pfn from reserved area) cannot
be identified belonging to ZONE_DEVICE. This erroneously leads range search
within iomem_resource region which never had this device memory region. So
this eventually ends up flashing the following error.

Unable to release resource <0x0000000680000000-0x00000006bfffffff> (-22)

Initialize struct pages for the driver reserved range while still staying
clear from it's contents.

> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/page_alloc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 59661106da16..892eabe1ec13 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5740,8 +5740,7 @@ void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
>  
>  #ifdef CONFIG_ZONE_DEVICE
>  	/*
> -	 * Honor reservation requested by the driver for this ZONE_DEVICE
> -	 * memory. We limit the total number of pages to initialize to just
> +	 * We limit the total number of pages to initialize to just
Comment needs bit change to reflect on the fact that both driver reserved as
well as mapped area (containing altmap struct pages) needs init here.
