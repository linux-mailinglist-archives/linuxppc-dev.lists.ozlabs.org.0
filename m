Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD0217CF5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 04:12:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1jW2460szDqS2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 12:12:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1jSp14SzzDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 12:10:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kllJOxrd; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1jSn412xz9sSn;
 Wed,  8 Jul 2020 12:10:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594174233;
 bh=CWD6lmJlEsS26eu1/y+sJ98nEzWHQopO24QUWOA1BxA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kllJOxrdffqYzzK+OTscgH1DEVAxfWWrvi+OsFAE7WFfVYPN/vpnuaB5hmY5NAAOu
 ExAaxqxvL0G6nTi/D0NgXs9crKRsW571y015+vAYOtlrBhRwq4XOmIvLWhpTugqVBG
 KsmwDLRb3jiBlSzXF4JKpLI2zK9JmpSL9TdrD1JliWmMXE1eD1qIYqx2uQdRATHimk
 2yxwjGbs64r2MsEnEcUzNfzEw6W/mpBWwsmhvdy7izNOnpckvEBf3yqnka9NgcCB+B
 Asuzkk8sZn9MaIE8BAmzKGTnfV1ZJlfHFQZvEhKP8C/ziXuoScQCgHrfNWDK0y4LXF
 OxGLGMbWnEngw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/4] powerpc/mm/radix: Free PUD table when freeing
 pagetable
In-Reply-To: <20200625064547.228448-3-aneesh.kumar@linux.ibm.com>
References: <20200625064547.228448-1-aneesh.kumar@linux.ibm.com>
 <20200625064547.228448-3-aneesh.kumar@linux.ibm.com>
Date: Wed, 08 Jul 2020 12:12:45 +1000
Message-ID: <87a70a4uw2.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> From: Bharata B Rao <bharata@linux.ibm.com>
>
> remove_pagetable() isn't freeing PUD table. This causes memory
> leak during memory unplug. Fix this.

Fixes: ??

cheers

> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 80be96d3018f..af57604f295f 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -708,6 +708,21 @@ static void free_pmd_table(pmd_t *pmd_start, pud_t *pud)
>  	pud_clear(pud);
>  }
>  
> +static void free_pud_table(pud_t *pud_start, p4d_t *p4d)
> +{
> +	pud_t *pud;
> +	int i;
> +
> +	for (i = 0; i < PTRS_PER_PUD; i++) {
> +		pud = pud_start + i;
> +		if (!pud_none(*pud))
> +			return;
> +	}
> +
> +	pud_free(&init_mm, pud_start);
> +	p4d_clear(p4d);
> +}
> +
>  struct change_mapping_params {
>  	pte_t *pte;
>  	unsigned long start;
> @@ -882,6 +897,7 @@ static void __meminit remove_pagetable(unsigned long start, unsigned long end)
>  
>  		pud_base = (pud_t *)p4d_page_vaddr(*p4d);
>  		remove_pud_table(pud_base, addr, next);
> +		free_pud_table(pud_base, p4d);
>  	}
>  
>  	spin_unlock(&init_mm.page_table_lock);
> -- 
> 2.26.2
