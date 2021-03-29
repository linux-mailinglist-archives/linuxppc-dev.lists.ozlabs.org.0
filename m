Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB38934C301
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 07:29:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F81Nc4wf4z30Hx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 16:29:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F81NH6t02z2yx4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 16:29:18 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F142568BEB; Mon, 29 Mar 2021 07:29:10 +0200 (CEST)
Date: Mon, 29 Mar 2021 07:29:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 00/30] DMA: Mundane typo fixes
Message-ID: <20210329052910.GB26495@lst.de>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
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
Cc: dave.jiang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I really don't think these typo patchbomb are that useful.  I'm all
for fixing typos when working with a subsystem, but I'm not sure these
patchbombs help anything.

On Mon, Mar 29, 2021 at 05:22:56AM +0530, Bhaskar Chowdhury wrote:
> This patch series fixes some trivial and rudimentary spellings in the COMMENT
> sections.
> 
> Bhaskar Chowdhury (30):
>   acpi-dma.c: Fix couple of typos
>   altera-msgdma.c: Couple of typos fixed
>   amba-pl08x.c: Fixed couple of typos
>   bcm-sba-raid.c: Few typos fixed
>   bcm2835-dma.c: Fix a typo
>   idma64.c: Fix couple of typos
>   iop-adma.c: Few typos fixed
>   mv_xor.c: Fix a typo
>   mv_xor.h: Fixed a typo
>   mv_xor_v2.c: Fix a typo
>   nbpfaxi.c: Fixed a typo
>   of-dma.c: Fixed a typo
>   s3c24xx-dma.c: Fix a typo
>   Revert "s3c24xx-dma.c: Fix a typo"
>   s3c24xx-dma.c: Few typos fixed
>   st_fdma.h: Fix couple of typos
>   ste_dma40_ll.h: Fix a typo
>   tegra20-apb-dma.c: Fixed a typo
>   xgene-dma.c: Few spello fixes
>   at_hdmac.c: Quite a few spello fixes
>   owl-dma.c: Fix a typo
>   at_hdmac_regs.h: Couple of typo fixes
>   dma-jz4780.c: Fix a typo
>   Kconfig: Change Synopsys to Synopsis
>   ste_dma40.c: Few spello fixes
>   dw-axi-dmac-platform.c: Few typos fixed
>   dpaa2-qdma.c: Fix a typo
>   usb-dmac.c: Fix a typo
>   edma.c: Fix a typo
>   xilinx_dma.c: Fix a typo
> 
>  drivers/dma/Kconfig                            |  8 ++++----
>  drivers/dma/acpi-dma.c                         |  4 ++--
>  drivers/dma/altera-msgdma.c                    |  4 ++--
>  drivers/dma/amba-pl08x.c                       |  4 ++--
>  drivers/dma/at_hdmac.c                         | 14 +++++++-------
>  drivers/dma/at_hdmac_regs.h                    |  4 ++--
>  drivers/dma/bcm-sba-raid.c                     |  8 ++++----
>  drivers/dma/bcm2835-dma.c                      |  2 +-
>  drivers/dma/dma-jz4780.c                       |  2 +-
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  8 ++++----
>  drivers/dma/idma64.c                           |  4 ++--
>  drivers/dma/iop-adma.c                         |  6 +++---
>  drivers/dma/mv_xor.c                           |  2 +-
>  drivers/dma/mv_xor.h                           |  2 +-
>  drivers/dma/mv_xor_v2.c                        |  2 +-
>  drivers/dma/nbpfaxi.c                          |  2 +-
>  drivers/dma/of-dma.c                           |  2 +-
>  drivers/dma/owl-dma.c                          |  2 +-
>  drivers/dma/s3c24xx-dma.c                      |  6 +++---
>  drivers/dma/sh/shdmac.c                        |  2 +-
>  drivers/dma/sh/usb-dmac.c                      |  2 +-
>  drivers/dma/st_fdma.h                          |  4 ++--
>  drivers/dma/ste_dma40.c                        | 10 +++++-----
>  drivers/dma/ste_dma40_ll.h                     |  2 +-
>  drivers/dma/tegra20-apb-dma.c                  |  2 +-
>  drivers/dma/ti/edma.c                          |  2 +-
>  drivers/dma/xgene-dma.c                        |  6 +++---
>  drivers/dma/xilinx/xilinx_dma.c                |  2 +-
>  28 files changed, 59 insertions(+), 59 deletions(-)
> 
> --
> 2.26.3
---end quoted text---
