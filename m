Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 742A7C0E2C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 00:57:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g6d42NK7zDr0k
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 08:57:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g6bF3yk4zDqyp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 08:55:51 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5A6E068B05; Sat, 28 Sep 2019 00:55:45 +0200 (CEST)
Date: Sat, 28 Sep 2019 00:55:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc: use <asm-generic/dma-mapping.h>
Message-ID: <20190927225545.GA18497@lst.de>
References: <20190807150752.17894-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807150752.17894-1-hch@lst.de>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ping?

On Wed, Aug 07, 2019 at 06:07:52PM +0300, Christoph Hellwig wrote:
> The powerpc version of dma-mapping.h only contains a version of
> get_arch_dma_ops that always return NULL.  Replace it with the
> asm-generic version that does the same.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/include/asm/Kbuild        |  1 +
>  arch/powerpc/include/asm/dma-mapping.h | 18 ------------------
>  2 files changed, 1 insertion(+), 18 deletions(-)
>  delete mode 100644 arch/powerpc/include/asm/dma-mapping.h
> 
> diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
> index 9a1d2fc6ceb7..15bb09ad5dc2 100644
> --- a/arch/powerpc/include/asm/Kbuild
> +++ b/arch/powerpc/include/asm/Kbuild
> @@ -4,6 +4,7 @@ generated-y += syscall_table_64.h
>  generated-y += syscall_table_c32.h
>  generated-y += syscall_table_spu.h
>  generic-y += div64.h
> +generic-y += dma-mapping.h
>  generic-y += export.h
>  generic-y += irq_regs.h
>  generic-y += local64.h
> diff --git a/arch/powerpc/include/asm/dma-mapping.h b/arch/powerpc/include/asm/dma-mapping.h
> deleted file mode 100644
> index 565d6f74b189..000000000000
> --- a/arch/powerpc/include/asm/dma-mapping.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright (C) 2004 IBM
> - */
> -#ifndef _ASM_DMA_MAPPING_H
> -#define _ASM_DMA_MAPPING_H
> -
> -static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
> -{
> -	/* We don't handle the NULL dev case for ISA for now. We could
> -	 * do it via an out of line call but it is not needed for now. The
> -	 * only ISA DMA device we support is the floppy and we have a hack
> -	 * in the floppy driver directly to get a device for us.
> -	 */
> -	return NULL;
> -}
> -
> -#endif	/* _ASM_DMA_MAPPING_H */
> -- 
> 2.20.1
---end quoted text---
