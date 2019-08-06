Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22612839C3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 21:41:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4634ks0nDDzDr6v
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 05:41:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="VF/YxkoG"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4634hx4mj7zDr3p
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 05:39:45 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 2FB9F7F91A;
 Tue,  6 Aug 2019 14:39:08 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1565120352; bh=HXAHKgiQsfJr2nTxca5W5Al0GVPsqRNPo3FiFtTBIoc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VF/YxkoGj8ca1JQcWi5sYSQVWRKBYyZtR9HUzDE+ew2GrVyUCIeEXZFt6rVd6W6wg
 vtSTCcBTAjJH0ZszPuJKYt0eFgEDwICoBRPS0wGBydBz0++9N23+H7Ed3B5qGV1VMC
 LvZrV59lni9MLs/JcvnzGbRKNJzNv+d8Qk4W2RBQao6w281+TddI5F/TzpRT8SkiIO
 nhUyXU745H9K0uufXJpjZAa7VpAkGr/JSB0EdEr/q/xdFRPa19oitpAqc+ktLxg9Is
 kcvPFe0HGSSTtWUCJqLE5dUJRbo5Vz5U2m6kzrfDAVngIfOzeFSuQSEh/otww7M/bt
 SjEGu4AGs8jvg==
Subject: Re: [PATCH 1/2] dma-mapping: fix page attributes for dma_mmap_*
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20190805080145.5694-1-hch@lst.de>
 <20190805080145.5694-2-hch@lst.de>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <7df95ffb-6df3-b118-284c-ee32cad81199@anastas.io>
Date: Tue, 6 Aug 2019 21:39:06 +0200
MIME-Version: 1.0
In-Reply-To: <20190805080145.5694-2-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Gavin Li <git@thegavinli.com>, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Catalin Marinas <catalin.marinas@arm.com>,
 James Hogan <jhogan@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/5/19 10:01 AM, Christoph Hellwig wrote:
> diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
> index 3813211a9aad..9ae5cee543c4 100644
> --- a/include/linux/dma-noncoherent.h
> +++ b/include/linux/dma-noncoherent.h
> @@ -42,13 +42,8 @@ void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
>   		dma_addr_t dma_addr, unsigned long attrs);
>   long arch_dma_coherent_to_pfn(struct device *dev, void *cpu_addr,
>   		dma_addr_t dma_addr);
> -
> -#ifdef CONFIG_ARCH_HAS_DMA_MMAP_PGPROT
>   pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
>   		unsigned long attrs);
> -#else
> -# define arch_dma_mmap_pgprot(dev, prot, attrs)	pgprot_noncached(prot)
> -#endif

Nit, but maybe the prototype should still be ifdef'd here? It at least
could prevent a reader from incorrectly thinking that the function is
always present.

Also, like Will mentioned earlier, the function name isn't entirely
accurate anymore. I second the suggestion of using something like
arch_dma_noncoherent_pgprot(). As for your idea of defining
pgprot_dmacoherent for all architectures as

#ifndef pgprot_dmacoherent
#define pgprot_dmacoherent pgprot_noncached
#endif

I think that the name here is kind of misleading too, since this
definition will only be used when there is no support for proper
DMA coherency.

