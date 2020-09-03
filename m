Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27025B962
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 05:49:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhmyY1fLzzDqpM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 13:49:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bhmwq516bzDqd0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 13:47:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=sLw7B6tB; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bhmwh08jXz9sR4;
 Thu,  3 Sep 2020 13:47:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599104874;
 bh=4yAcDTxLmVtFlFmBwViPiQqBxkMUq1/v+ltMjACdmTw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=sLw7B6tBL0tYeiS7UbUp4SBXAdWw1BiuX1rzRD7UWBO4tYjHsDcRVzXhtw9LnwBSb
 TVkfoqm3UH9AlqDYsgMpWDtdLM9KmPlrSHeDnjaQHBRgQyRaye8SGf9zquJweA35N7
 ilN3da+kZMlwnOIFaqVvO5w2y0IGDyDnVFG1VcyDqd8GjM2NTURgLs8goa8r9z4rAX
 bS7CaEKouymf+JkB9pMsYKQDB1pDC1x6WHKsbhAVF7YeLmzAfKXrfbmEv+zmCeShnW
 T7ZxEkdC9W8WnKJu7u5s2wHJv1TU45hmfsmEVHLbTCR7rbxTHbwfqjSrB0uc+2ymCK
 IggJReIsXvpLw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicolin Chen <nicoleotsuka@gmail.com>, hch@lst.de
Subject: Re: [PATCH 1/2] dma-mapping: introduce dma_get_seg_boundary_nr_pages()
In-Reply-To: <20200901221646.26491-2-nicoleotsuka@gmail.com>
References: <20200901221646.26491-1-nicoleotsuka@gmail.com>
 <20200901221646.26491-2-nicoleotsuka@gmail.com>
Date: Thu, 03 Sep 2020 13:47:43 +1000
Message-ID: <87363z1py8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: x86@kernel.org, linux-ia64@vger.kernel.org,
 James.Bottomley@HansenPartnership.com, paulus@samba.org, hpa@zytor.com,
 sparclinux@vger.kernel.org, sfr@canb.auug.org.au, deller@gmx.de,
 schnelle@linux.ibm.com, borntraeger@de.ibm.com, mingo@redhat.com,
 mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, ink@jurassic.park.msu.ru,
 tglx@linutronix.de, gerald.schaefer@linux.ibm.com, rth@twiddle.net,
 tony.luck@intel.com, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicolin Chen <nicoleotsuka@gmail.com> writes:
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 9704f3f76e63..cbc2e62db597 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -236,15 +236,10 @@ static unsigned long iommu_range_alloc(struct device *dev,
>  		}
>  	}
>  
> -	if (dev)
> -		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
> -				      1 << tbl->it_page_shift);
> -	else
> -		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
> -	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
> +	boundary_size = dma_get_seg_boundary_nr_pages(dev, tbl->it_page_shift);
>  
>  	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
> -			     boundary_size >> tbl->it_page_shift, align_mask);
> +			     boundary_size, align_mask);

This has changed the units of boundary_size, but it's unused elsewhere
in the function so that's OK.

If you need to do a v2 for any other reason, then I'd just drop
boundary_size and call dma_get_seg_boundary_nr_pages() directly in the
function call.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
