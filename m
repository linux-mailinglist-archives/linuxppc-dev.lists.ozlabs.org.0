Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C355A2D402E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 11:45:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrYbk1yrKzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 21:45:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrYYH1l25zDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 21:43:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mJm5JN5n; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrYYG00B8z9sWK;
 Wed,  9 Dec 2020 21:43:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607510594;
 bh=d/2hwEKTej3A6ApbAVKvrzfLbuFZYvZ+Dxm11f9CVXc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mJm5JN5nKw5tNNd0wZO3p2zbByxKyS+lkztuaSmHm9Dm+kee8TL+ZnZ0kzHBPIHl1
 0elRk88MHkwYr/kCH5XzHhYRMXAKuAEraQ/RkpmwAZBm3GwXN1taLKCYim2sh/XcI0
 B/w5FykIMaOo1K1XZy17ZCxbAMXs3FGGCWskwHUekJeSeFbia2YuGlszhOUQNsxlz2
 EtWmrckWjwv90A8pOWGnlU2KLOTQm6lzQ6MjBrQGPZNSJB3zOtslOUDcYQwXKdzJqk
 V/KykCSl5YnVY/HQa0QtaCuU+ZBM8zwuQNa1+W1jmqkvlawpq3xxHdamS+O3nB62bB
 UYxGDeoYJUp1g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v1 2/6] powerpc/8xx: Always pin kernel text TLB
In-Reply-To: <203b89de491e1379f1677a2685211b7c32adfff0.1606231483.git.christophe.leroy@csgroup.eu>
References: <e796c5fcb5898de827c803cf1ab8ba1d7a5d4b76.1606231483.git.christophe.leroy@csgroup.eu>
 <203b89de491e1379f1677a2685211b7c32adfff0.1606231483.git.christophe.leroy@csgroup.eu>
Date: Wed, 09 Dec 2020 21:43:12 +1100
Message-ID: <87lfe7s1j3.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> There is no big poing in not pinning kernel text anymore, as now
> we can keep pinned TLB even with things like DEBUG_PAGEALLOC.
>
> Remove CONFIG_PIN_TLB_TEXT, making it always right.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/Kconfig               |  3 +--
>  arch/powerpc/kernel/head_8xx.S     | 20 +++-----------------
>  arch/powerpc/mm/nohash/8xx.c       |  3 +--
>  arch/powerpc/platforms/8xx/Kconfig |  7 -------
>  4 files changed, 5 insertions(+), 28 deletions(-)
>
...
> diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
> index 231ca95f9ffb..19a3eec1d8c5 100644
> --- a/arch/powerpc/mm/nohash/8xx.c
> +++ b/arch/powerpc/mm/nohash/8xx.c
> @@ -186,8 +186,7 @@ void mmu_mark_initmem_nx(void)
>  	mmu_mapin_ram_chunk(0, boundary, PAGE_KERNEL_TEXT, false);
>  	mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL, false);
>  
> -	if (IS_ENABLED(CONFIG_PIN_TLB_TEXT))
> -		mmu_pin_tlb(block_mapped_ram, false);
> +	mmu_pin_tlb(block_mapped_ram, false);
>  }

This broke mpc885_ads_defconfig with:

  ld: arch/powerpc/mm/nohash/8xx.o: in function `mmu_mark_initmem_nx':
  /home/michael/linux/arch/powerpc/mm/nohash/8xx.c:189: undefined reference to `mmu_pin_tlb'
  make[1]: *** [/home/michael/linux/Makefile:1164: vmlinux] Error 1
  make: *** [Makefile:185: __sub-make] Error 2

Fixed by:

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 35707e86c5f3..52702f3db6df 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -702,7 +702,6 @@ FixupDAR:/* Entry point for dcbx workaround. */
 	mtspr	SPRN_DER, r8
 	blr
 
-#ifdef CONFIG_PIN_TLB
 _GLOBAL(mmu_pin_tlb)
 	lis	r9, (1f - PAGE_OFFSET)@h
 	ori	r9, r9, (1f - PAGE_OFFSET)@l
@@ -802,7 +801,6 @@ _GLOBAL(mmu_pin_tlb)
 	mtspr	SPRN_SRR1, r10
 	mtspr	SPRN_SRR0, r11
 	rfi
-#endif /* CONFIG_PIN_TLB */
 
 /*
  * We put a few things here that have to be page-aligned.


cheers
