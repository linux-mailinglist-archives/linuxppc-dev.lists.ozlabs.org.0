Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD9F4D90B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 01:00:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHYTB1LLNz30Dh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 11:00:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CxQznLVv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=sstabellini@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CxQznLVv; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHYSV372Lz2xTs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 11:00:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1D754CE16F9;
 Tue, 15 Mar 2022 00:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82170C340E9;
 Tue, 15 Mar 2022 00:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647302404;
 bh=qF2Kiv1yBWM6zFZu7vu4vkmgVsDPPK9bUwo+CMzG77s=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=CxQznLVvPAMHVLObot/GbKAGNBs3wp/Zo7J//e5fa5RGl/JAcrYpHk7dFYXJ+dCyc
 yFp/t/ucQtYgdUQQRIyugjt0bw6neR65fWz4Mw2wQpqjjnNDOhxJr7SqJvB+dScWOI
 FWaPNn7YRGzQ0CCDI4WX3HGCjk3WcedTK4ZKrUhQL/ZjI62kK/fSKVT6fnNg8LwsV7
 O+N86nVOy9ALX/s25HJpQGYpv30ak+B6D/CFn8xWL4gwGSW9Q/HStnRPdXpxBq2xEr
 XfmlQm0hAt72Py8IAnH8MpwztAqekJ4fXRmnodDkCqvESbpDzlwteZaCwLl1CvtOpX
 4SrZDmHAzylBg==
Date: Mon, 14 Mar 2022 17:00:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/15] swiotlb: merge swiotlb-xen initialization into
 swiotlb
In-Reply-To: <20220314073129.1862284-14-hch@lst.de>
Message-ID: <alpine.DEB.2.22.394.2203141659210.3497@ubuntu-linux-20-04-desktop>
References: <20220314073129.1862284-1-hch@lst.de>
 <20220314073129.1862284-14-hch@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 tboot-devel@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 14 Mar 2022, Christoph Hellwig wrote:
> Reuse the generic swiotlb initialization for xen-swiotlb.  For ARM/ARM64
> this works trivially, while for x86 xen_swiotlb_fixup needs to be passed
> as the remap argument to swiotlb_init_remap/swiotlb_init_late.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

For arch/arm/xen and drivers/xen/swiotlb-xen.c

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
