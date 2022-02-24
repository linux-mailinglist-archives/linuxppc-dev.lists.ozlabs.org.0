Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98F4C2926
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 11:19:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K485p0wvqz3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 21:19:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K485N5dcyz2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 21:19:03 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44D891476;
 Thu, 24 Feb 2022 02:19:03 -0800 (PST)
Received: from [10.163.48.178] (unknown [10.163.48.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAE743F70D;
 Thu, 24 Feb 2022 02:18:56 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 07/11] x86: remove the IOMMU table infrastructure
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20220222153514.593231-1-hch@lst.de>
 <20220222153514.593231-8-hch@lst.de>
Message-ID: <ff355270-b389-0f7a-e384-7c8a9ed9c615@arm.com>
Date: Thu, 24 Feb 2022 15:48:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220222153514.593231-8-hch@lst.de>
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
Cc: Juergen Gross <jgross@suse.com>, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2/22/22 9:05 PM, Christoph Hellwig wrote:
> The IOMMU table tries to separate the different IOMMUs into different
> backends, but actually requires various cross calls.
> 
> Rewrite the code to do the generic swiotlb/swiotlb-xen setup directly
> in pci-dma.c and then just call into the IOMMU drivers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/ia64/include/asm/iommu_table.h    |   7 --
>  arch/x86/include/asm/dma-mapping.h     |   1 -
>  arch/x86/include/asm/gart.h            |   5 +-
>  arch/x86/include/asm/iommu.h           |   6 ++
>  arch/x86/include/asm/iommu_table.h     | 102 ----------------------
>  arch/x86/include/asm/swiotlb.h         |  30 -------
>  arch/x86/include/asm/xen/swiotlb-xen.h |   2 -
>  arch/x86/kernel/Makefile               |   2 -
>  arch/x86/kernel/amd_gart_64.c          |   5 +-
>  arch/x86/kernel/aperture_64.c          |  14 ++--
>  arch/x86/kernel/pci-dma.c              | 112 ++++++++++++++++++++-----
>  arch/x86/kernel/pci-iommu_table.c      |  77 -----------------
>  arch/x86/kernel/pci-swiotlb.c          |  77 -----------------
>  arch/x86/kernel/tboot.c                |   1 -
>  arch/x86/kernel/vmlinux.lds.S          |  12 ---
>  arch/x86/xen/Makefile                  |   2 -
>  arch/x86/xen/pci-swiotlb-xen.c         |  96 ---------------------
>  drivers/iommu/amd/init.c               |   6 --
>  drivers/iommu/amd/iommu.c              |   5 +-
>  drivers/iommu/intel/dmar.c             |   6 +-
>  include/linux/dmar.h                   |   6 +-
>  21 files changed, 115 insertions(+), 459 deletions(-)
>  delete mode 100644 arch/ia64/include/asm/iommu_table.h
>  delete mode 100644 arch/x86/include/asm/iommu_table.h
>  delete mode 100644 arch/x86/include/asm/swiotlb.h
>  delete mode 100644 arch/x86/kernel/pci-iommu_table.c
>  delete mode 100644 arch/x86/kernel/pci-swiotlb.c
>  delete mode 100644 arch/x86/xen/pci-swiotlb-xen.c

checkpatch.pl has some warnings here.

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
deleted file mode 100644

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#496: FILE: arch/x86/kernel/pci-dma.c:171:
+               printk(KERN_INFO "PCI-DMA: "

WARNING: quoted string split across lines
#497: FILE: arch/x86/kernel/pci-dma.c:172:
+               printk(KERN_INFO "PCI-DMA: "
+                      "Using software bounce buffering for IO (SWIOTLB)\n");

ERROR: trailing whitespace
#881: FILE: drivers/iommu/amd/iommu.c:1837:
+^Iif (iommu_default_passthrough() || sme_me_mask) $

total: 1 errors, 3 warnings, 389 lines checked
