Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A691A2556
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 17:37:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y7gH4mY6zDq9R
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 01:36:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y7Zg1dc8zDqWK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 01:32:57 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7D40368CEC; Wed,  8 Apr 2020 17:32:45 +0200 (CEST)
Date: Wed, 8 Apr 2020 17:32:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 18/28] mm: enforce that vmap can't map pages executable
Message-ID: <20200408153244.GA27818@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-19-hch@lst.de>
 <20200408123835.GB36478@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408123835.GB36478@lakrids.cambridge.arm.com>
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Catalin marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Will Deacon <will@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Christoph Hellwig <hch@lst.de>,
 Peter Zijlstra <peterz@infradead.org>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Daniel Vetter <daniel@ffwll.ch>,
 Haiyang Zhang <haiyangz@microsoft.com>, linaro-mm-sig@lists.linaro.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 08, 2020 at 01:38:36PM +0100, Mark Rutland wrote:
> > +static inline pgprot_t pgprot_nx(pgprot_t prot)
> > +{
> > +	return __pgprot(pgprot_val(prot) | _PAGE_NX);
> > +}
> > +#define pgprot_nx pgprot_nx
> > +
> >  #ifdef CONFIG_X86_PAE
> 
> I reckon for arm64 we can do similar in our <asm/pgtable.h>:
> 
> #define pgprot_nx(pgprot_t prot) \
> 	__pgprot_modify(prot, 0, PTE_PXN)
> 
> ... matching the style of our existing pgprot_*() modifier helpers.

I've added that for the next version with attribution to you.
