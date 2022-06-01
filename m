Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3C553AC52
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 19:58:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCxhS4fcgz3bkd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 03:58:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCxh36GjVz3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 03:57:55 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id D34A568C4E; Wed,  1 Jun 2022 19:57:44 +0200 (CEST)
Date: Wed, 1 Jun 2022 19:57:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 09/15] swiotlb: make the swiotlb_init interface more
 useful
Message-ID: <20220601175743.GA28082@lst.de>
References: <20220404050559.132378-1-hch@lst.de> <20220404050559.132378-10-hch@lst.de> <YpehC7BwBlnuxplF@dev-arch.thelio-3990X> <20220601173441.GB27582@lst.de> <YpemDuzdoaO3rijX@Ryzen-9-3900X.>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpemDuzdoaO3rijX@Ryzen-9-3900X.>
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Joerg Roedel <joro@8bytes.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, tboot-devel@lists.sourceforge.net, xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 01, 2022 at 10:46:54AM -0700, Nathan Chancellor wrote:
> On Wed, Jun 01, 2022 at 07:34:41PM +0200, Christoph Hellwig wrote:
> > Can you send me the full dmesg and the content of
> > /sys/kernel/debug/swiotlb/io_tlb_nslabs for a good and a bad boot?
> 
> Sure thing, they are attached! If there is anything else I can provide
> or test, I am more than happy to do so.

Nothing interesting.  But the performance numbers almost look like
swiotlb=force got ignored before (even if I can't explain why).
Do you get a similar performance with the new kernel without
swiotlb=force as the old one with that argument by any chance?

