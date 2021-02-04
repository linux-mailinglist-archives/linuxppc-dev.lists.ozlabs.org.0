Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FCE30ED61
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 08:31:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWVc419xSzDrpp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 18:31:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWVYv6M2DzDr3M
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 18:29:54 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DD16068AFE; Thu,  4 Feb 2021 08:29:47 +0100 (CET)
Date: Thu, 4 Feb 2021 08:29:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH RFC v1 2/6] swiotlb: convert variables to arrays
Message-ID: <20210204072947.GA29812@lst.de>
References: <20210203233709.19819-1-dongli.zhang@oracle.com>
 <20210203233709.19819-3-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203233709.19819-3-dongli.zhang@oracle.com>
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
Cc: ulf.hansson@linaro.org, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bhelgaas@google.com, paulus@samba.org, hpa@zytor.com, hch@lst.de,
 m.szyprowski@samsung.com, sstabellini@kernel.org, adrian.hunter@intel.com,
 x86@kernel.org, joe.jin@oracle.com, mingo@kernel.org, peterz@infradead.org,
 mingo@redhat.com, bskeggs@redhat.com, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, matthew.auld@intel.com,
 thomas.lendacky@amd.com, konrad.wilk@oracle.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, bp@alien8.de,
 rodrigo.vivi@intel.com, nouveau@lists.freedesktop.org,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 chris@chris-wilson.co.uk, jgross@suse.com, tsbogend@alpha.franken.de,
 robin.murphy@arm.com, linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, tglx@linutronix.de, bauerman@linux.ibm.com,
 daniel@ffwll.ch, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 03, 2021 at 03:37:05PM -0800, Dongli Zhang wrote:
> This patch converts several swiotlb related variables to arrays, in
> order to maintain stat/status for different swiotlb buffers. Here are
> variables involved:
> 
> - io_tlb_start and io_tlb_end
> - io_tlb_nslabs and io_tlb_used
> - io_tlb_list
> - io_tlb_index
> - max_segment
> - io_tlb_orig_addr
> - no_iotlb_memory
> 
> There is no functional change and this is to prepare to enable 64-bit
> swiotlb.

Claire Chang (on Cc) already posted a patch like this a month ago,
which looks much better because it actually uses a struct instead
of all the random variables. 
