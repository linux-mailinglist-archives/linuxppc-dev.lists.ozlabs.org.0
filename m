Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C31258F14
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 15:30:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgnxP17lJzDqYt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 23:30:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgntp71CwzDqJ2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 23:27:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pXwfFcp7; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bgntf72DLz9sTN;
 Tue,  1 Sep 2020 23:27:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598966866;
 bh=b8fBMPirmgEDaVPbjXdRIYPwIrTUtQaTXRmfGBF/egk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pXwfFcp7DEZhdSaVT5PD8DrmDNJcZnA4u3LePXbs+Xb49cAmRXaxJrmXg/VJlWIzR
 Q9Z+EfZBm7r6mhEVXxyXQhUmW0fa5OWGfrmOVAZI3itGQAU61ebluXbCJK+AIc60vF
 1lpEQtozskWFVBMd7eJLB6Kr3ed2+dixG5IYLvugFo8ywj0S6XpgkfnAthm3BhrzXv
 8D0og0Lq9pFYRuwgHyCnfhfBZXrYFBGSojjeGeHhiOdKVVtQpLLH9UWs9qF4OuV5Cr
 KzxdsR4L7qCBMFnd1HxBtLQKZU2Du8AyMTHI6pRxfwvNsOSSUSd9mxXbEuet6K+c7h
 OfGS3/kjMeThw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicolin Chen <nicoleotsuka@gmail.com>, benh@kernel.crashing.org,
 paulus@samba.org, rth@twiddle.net, ink@jurassic.park.msu.ru,
 mattst88@gmail.com, tony.luck@intel.com, fenghua.yu@intel.com,
 schnelle@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@de.ibm.com, davem@davemloft.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, James.Bottomley@HansenPartnership.com, deller@gmx.de
Subject: Re: [RESEND][PATCH 1/7] powerpc/iommu: Avoid overflow at boundary_size
In-Reply-To: <20200831203811.8494-2-nicoleotsuka@gmail.com>
References: <20200831203811.8494-1-nicoleotsuka@gmail.com>
 <20200831203811.8494-2-nicoleotsuka@gmail.com>
Date: Tue, 01 Sep 2020 23:27:36 +1000
Message-ID: <87lfht1vav.fsf@mpe.ellerman.id.au>
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
Cc: sfr@canb.auug.org.au, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicolin Chen <nicoleotsuka@gmail.com> writes:
> The boundary_size might be as large as ULONG_MAX, which means
> that a device has no specific boundary limit. So either "+ 1"
> or passing it to ALIGN() would potentially overflow.
>
> According to kernel defines:
>     #define ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
>     #define ALIGN(x, a)	ALIGN_MASK(x, (typeof(x))(a) - 1)
>
> We can simplify the logic here:
>   ALIGN(boundary + 1, 1 << shift) >> shift
> = ALIGN_MASK(b + 1, (1 << s) - 1) >> s
> = {[b + 1 + (1 << s) - 1] & ~[(1 << s) - 1]} >> s
> = [b + 1 + (1 << s) - 1] >> s
> = [b + (1 << s)] >> s
> = (b >> s) + 1
>
> So fixing a potential overflow with the safer shortcut.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/kernel/iommu.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Are you asking for acks, or for maintainers to merge the patches
individually?

> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 9704f3f76e63..c01ccbf8afdd 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -236,15 +236,14 @@ static unsigned long iommu_range_alloc(struct device *dev,
>  		}
>  	}
>  
> -	if (dev)
> -		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
> -				      1 << tbl->it_page_shift);
> -	else
> -		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
>  	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
> +	boundary_size = dev ? dma_get_seg_boundary(dev) : U32_MAX;

Is there any path that passes a NULL dev anymore?

Both iseries_hv_alloc() and iseries_hv_map() were removed years ago.
See:
  8ee3e0d69623 ("powerpc: Remove the main legacy iSerie platform code")


So maybe we should do a lead-up patch that drops the NULL dev support,
which will then make this patch simpler.

cheers


> +	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> +	boundary_size = (boundary_size >> tbl->it_page_shift) + 1;
>  
>  	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
> -			     boundary_size >> tbl->it_page_shift, align_mask);
> +			     boundary_size, align_mask);
>  	if (n == -1) {
>  		if (likely(pass == 0)) {
>  			/* First try the pool from the start */
> -- 
> 2.17.1
