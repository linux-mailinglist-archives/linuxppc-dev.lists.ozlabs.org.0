Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D64D3D703F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 09:34:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46snHy1x4zzDqxG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 18:34:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46snD21bhMzDqwg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 18:31:11 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E7CF568B05; Tue, 15 Oct 2019 09:31:04 +0200 (CEST)
Date: Tue, 15 Oct 2019 09:31:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] dma-mapping: Add dma_addr_is_phys_addr()
Message-ID: <20191015073104.GA32252@lst.de>
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
 <1570843519-8696-2-git-send-email-linuxram@us.ibm.com>
 <20191014045139.GN4080@umbus.fritz.box>
 <37609731-5539-b906-aa94-2ef0242795ac@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37609731-5539-b906-aa94-2ef0242795ac@arm.com>
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
Cc: andmike@us.ibm.com, sukadev@linux.vnet.ibm.com, mdroth@linux.vnet.ibm.com,
 b.zolnierkie@samsung.com, jasowang@redhat.com, aik@linux.ibm.com,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 paul.burton@mips.com, m.szyprowski@samsung.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 14, 2019 at 11:29:24AM +0100, Robin Murphy wrote:
>> However, I would like to see the commit message (and maybe the inline
>> comments) expanded a bit on what the distinction here is about.  Some
>> of the text from the next patch would be suitable, about DMA addresses
>> usually being in a different address space but not in the case of
>> bounce buffering.
>
> Right, this needs a much tighter definition. "DMA address happens to be a 
> valid physical address" is true of various IOMMU setups too, but I can't 
> believe it's meaningful in such cases.
>
> If what you actually want is "DMA is direct or SWIOTLB" - i.e. "DMA address 
> is physical address of DMA data (not necessarily the original buffer)" - 
> wouldn't dma_is_direct() suffice?

It would.  But drivers have absolutely no business knowing any of this.
