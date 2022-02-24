Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E17754C291A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 11:17:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K483Y1dBGz3cKM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 21:17:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K48371l2Rz2x9Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 21:17:05 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E30E4ED1;
 Thu, 24 Feb 2022 02:17:01 -0800 (PST)
Received: from [10.163.48.178] (unknown [10.163.48.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E609A3F70D;
 Thu, 24 Feb 2022 02:16:54 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 10/11] swiotlb: merge swiotlb-xen initialization into
 swiotlb
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20220222153514.593231-1-hch@lst.de>
 <20220222153514.593231-11-hch@lst.de>
Message-ID: <e5564871-694e-58ea-a355-5d0c3ce5d025@arm.com>
Date: Thu, 24 Feb 2022 15:46:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220222153514.593231-11-hch@lst.de>
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
> Allow to pass a remap argument to the swiotlb initialization functions
> to handle the Xen/x86 remap case.  ARM/ARM64 never did any remapping
> from xen_swiotlb_fixup, so we don't even need that quirk.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/xen/mm.c               |  23 +++---
>  arch/x86/include/asm/xen/page.h |   5 --
>  arch/x86/kernel/pci-dma.c       |  27 ++++---
>  arch/x86/pci/sta2x11-fixup.c    |   2 +-
>  drivers/xen/swiotlb-xen.c       | 128 +-------------------------------
>  include/linux/swiotlb.h         |   7 +-
>  include/xen/arm/page.h          |   1 -
>  include/xen/swiotlb-xen.h       |   8 +-
>  kernel/dma/swiotlb.c            | 120 +++++++++++++++---------------
>  9 files changed, 102 insertions(+), 219 deletions(-)

checkpatch.pl has some warnings here.

ERROR: trailing whitespace
#151: FILE: arch/x86/kernel/pci-dma.c:217:
+ $

WARNING: please, no spaces at the start of a line
#151: FILE: arch/x86/kernel/pci-dma.c:217:
+ $

total: 1 errors, 1 warnings, 470 lines checked
