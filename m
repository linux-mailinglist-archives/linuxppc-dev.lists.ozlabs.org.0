Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B7DF2C4D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 11:32:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47808409TTzF6Gc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 21:32:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47805b72zJzF453
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 21:29:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Ez26eB0/"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47805b3GX7z9sPT;
 Thu,  7 Nov 2019 21:29:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573122595;
 bh=a4m1nWotTG2jewKpNRdw9eW8MeOxKL/KXr8bS4jNwEw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ez26eB0/Hao264oY8mdCEcLSGzesBH8ckKBuWVZsrTh7FwY+3G0FRpQcMW8t07TIL
 GxNEm5xTZqeXEz/Oge1/J59c/E03qxZuVJKwy5G52tt5n75byMSGD078yUa5X+WFeU
 jDJXX5hY6t9FhEANapoy+TL4hGXNpYWoe7eiypzProrFH+5clfz5BLdQgJOdh6jWTp
 uShCQT5qGdJROGj3Yv4OrneWx0IRvISROWJ7LC0GVYLQ/sqZiVa6FkMAFyCIW2DdVN
 /tk6hZpqkJw9/rPKaKSxObLxRbuQ7EDWVWPouPRR6KrI63QH1o8ucesuGyBhHK//Z0
 8Yqlq6lO/s81g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ram Pai <linuxram@us.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC v1 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
In-Reply-To: <1572902923-8096-2-git-send-email-linuxram@us.ibm.com>
References: <1572902923-8096-1-git-send-email-linuxram@us.ibm.com>
 <1572902923-8096-2-git-send-email-linuxram@us.ibm.com>
Date: Thu, 07 Nov 2019 21:29:54 +1100
Message-ID: <87h83g568t.fsf@mpe.ellerman.id.au>
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
Cc: andmike@us.ibm.com, mst@redhat.com, aik@ozlabs.ru, linuxram@us.ibm.com,
 mdroth@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, ram.n.pai@gmail.com,
 cai@lca.pw, tglx@linutronix.de, sukadev@linux.vnet.ibm.com, hch@lst.de,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ram Pai <linuxram@us.ibm.com> writes:
> The hypervisor needs to access the contents of the page holding the TCE
> entries while setting up the TCE entries in the IOMMU's TCE table. For
> SecureVMs, since this page is encrypted, the hypervisor cannot access
> valid entries. Share the page with the hypervisor. This ensures that the
> hypervisor sees the valid entries.

Can you please give people some explanation of why this is safe. After
all the point of the Ultravisor is to protect the guest from a malicious
hypervisor. Giving the hypervisor access to a page of TCEs sounds
dangerous, so please explain why it's not.

cheers

> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 8d9c2b1..07f0847 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -37,6 +37,7 @@
>  #include <asm/mmzone.h>
>  #include <asm/plpar_wrappers.h>
>  #include <asm/svm.h>
> +#include <asm/ultravisor.h>
>  
>  #include "pseries.h"
>  
> @@ -179,6 +180,19 @@ static int tce_build_pSeriesLP(struct iommu_table *tbl, long tcenum,
>  
>  static DEFINE_PER_CPU(__be64 *, tce_page);
>  
> +/*
> + * Allocate a tce page.  If secure VM, share the page with the hypervisor.
> + */
> +static __be64 *alloc_tce_page(void)
> +{
> +	__be64 *tcep = (__be64 *)__get_free_page(GFP_ATOMIC);
> +
> +	if (tcep && is_secure_guest())
> +		uv_share_page(PHYS_PFN(__pa(tcep)), 1);
> +
> +	return tcep;
> +}
> +
>  static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>  				     long npages, unsigned long uaddr,
>  				     enum dma_data_direction direction,
> @@ -206,8 +220,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>  	 * from iommu_alloc{,_sg}()
>  	 */
>  	if (!tcep) {
> -		tcep = (__be64 *)__get_free_page(GFP_ATOMIC);
> -		/* If allocation fails, fall back to the loop implementation */
> +		tcep = alloc_tce_page();
>  		if (!tcep) {
>  			local_irq_restore(flags);
>  			return tce_build_pSeriesLP(tbl, tcenum, npages, uaddr,
> @@ -391,6 +404,7 @@ static int tce_clearrange_multi_pSeriesLP(unsigned long start_pfn,
>  	return rc;
>  }
>  
> +
>  static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
>  					unsigned long num_pfn, const void *arg)
>  {
> @@ -405,7 +419,7 @@ static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
>  	tcep = __this_cpu_read(tce_page);
>  
>  	if (!tcep) {
> -		tcep = (__be64 *)__get_free_page(GFP_ATOMIC);
> +		tcep = alloc_tce_page();
>  		if (!tcep) {
>  			local_irq_enable();
>  			return -ENOMEM;
> -- 
> 1.8.3.1
