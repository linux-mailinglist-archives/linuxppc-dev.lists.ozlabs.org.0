Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10949165F00
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 14:42:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NbP92f0FzDqYM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 00:42:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=YWHTXkfG; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NbM84mqczDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 00:40:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48NbM36ysPz9txrk;
 Thu, 20 Feb 2020 14:40:31 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=YWHTXkfG; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hbJhFWvUXX38; Thu, 20 Feb 2020 14:40:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48NbM35T14z9txrh;
 Thu, 20 Feb 2020 14:40:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582206031; bh=Ey2+g9lGzZa+YpnSVqQPtdcZpHXPa/MkjNUS6tI4A50=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YWHTXkfGYULWjCzpxJ4aJed4CCe5/NvB7c8ruOxwGI+oYB+UydgpWU1vNgwzK6FLr
 sBjuADkg+TKg8Z6wwsthh+MM6O2FfXnhIO1BuKLrWqWnQRuKDl7MTd9LotDr3wUyYa
 uz4yBBQmY4PrMwGmIrFxxpTLToGtdK9nM4+QDwlQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F33388B86E;
 Thu, 20 Feb 2020 14:40:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SxQ2wcihBuVZ; Thu, 20 Feb 2020 14:40:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B52B28B866;
 Thu, 20 Feb 2020 14:40:31 +0100 (CET)
Subject: Re: [PATCH v3 1/6] powerpc/fsl_booke/kaslr: refactor
 kaslr_legal_offset() and kaslr_early_init()
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com, oss@buserror.net
References: <20200206025825.22934-1-yanaijie@huawei.com>
 <20200206025825.22934-2-yanaijie@huawei.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <6c0b0720-6998-f43a-a2b6-0632d4df1126@c-s.fr>
Date: Thu, 20 Feb 2020 14:40:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200206025825.22934-2-yanaijie@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/02/2020 à 03:58, Jason Yan a écrit :
> Some code refactor in kaslr_legal_offset() and kaslr_early_init(). No
> functional change. This is a preparation for KASLR fsl_booke64.
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Cc: Scott Wood <oss@buserror.net>
> Cc: Diana Craciun <diana.craciun@nxp.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Kees Cook <keescook@chromium.org>
> ---
>   arch/powerpc/mm/nohash/kaslr_booke.c | 40 ++++++++++++++--------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
> index 4a75f2d9bf0e..07b036e98353 100644
> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
> @@ -25,6 +25,7 @@ struct regions {
>   	unsigned long pa_start;
>   	unsigned long pa_end;
>   	unsigned long kernel_size;
> +	unsigned long linear_sz;
>   	unsigned long dtb_start;
>   	unsigned long dtb_end;
>   	unsigned long initrd_start;
> @@ -260,11 +261,23 @@ static __init void get_cell_sizes(const void *fdt, int node, int *addr_cells,
>   		*size_cells = fdt32_to_cpu(*prop);
>   }
>   
> -static unsigned long __init kaslr_legal_offset(void *dt_ptr, unsigned long index,
> -					       unsigned long offset)
> +static unsigned long __init kaslr_legal_offset(void *dt_ptr, unsigned long random)
>   {
>   	unsigned long koffset = 0;
>   	unsigned long start;
> +	unsigned long index;
> +	unsigned long offset;
> +
> +	/*
> +	 * Decide which 64M we want to start
> +	 * Only use the low 8 bits of the random seed
> +	 */
> +	index = random & 0xFF;
> +	index %= regions.linear_sz / SZ_64M;
> +
> +	/* Decide offset inside 64M */
> +	offset = random % (SZ_64M - regions.kernel_size);
> +	offset = round_down(offset, SZ_16K);
>   
>   	while ((long)index >= 0) {
>   		offset = memstart_addr + index * SZ_64M + offset;
> @@ -289,10 +302,9 @@ static inline __init bool kaslr_disabled(void)
>   static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size,
>   						  unsigned long kernel_sz)
>   {
> -	unsigned long offset, random;
> +	unsigned long random;
>   	unsigned long ram, linear_sz;
>   	u64 seed;
> -	unsigned long index;
>   
>   	kaslr_get_cmdline(dt_ptr);
>   	if (kaslr_disabled())
> @@ -333,22 +345,12 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
>   	regions.dtb_start = __pa(dt_ptr);
>   	regions.dtb_end = __pa(dt_ptr) + fdt_totalsize(dt_ptr);
>   	regions.kernel_size = kernel_sz;
> +	regions.linear_sz = linear_sz;
>   
>   	get_initrd_range(dt_ptr);
>   	get_crash_kernel(dt_ptr, ram);
>   
> -	/*
> -	 * Decide which 64M we want to start
> -	 * Only use the low 8 bits of the random seed
> -	 */
> -	index = random & 0xFF;
> -	index %= linear_sz / SZ_64M;
> -
> -	/* Decide offset inside 64M */
> -	offset = random % (SZ_64M - kernel_sz);
> -	offset = round_down(offset, SZ_16K);
> -
> -	return kaslr_legal_offset(dt_ptr, index, offset);
> +	return kaslr_legal_offset(dt_ptr, random);
>   }
>   
>   /*
> @@ -358,8 +360,6 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
>    */
>   notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
>   {
> -	unsigned long tlb_virt;
> -	phys_addr_t tlb_phys;
>   	unsigned long offset;
>   	unsigned long kernel_sz;
>   
> @@ -375,8 +375,8 @@ notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
>   	is_second_reloc = 1;
>   
>   	if (offset >= SZ_64M) {
> -		tlb_virt = round_down(kernstart_virt_addr, SZ_64M);
> -		tlb_phys = round_down(kernstart_addr, SZ_64M);
> +		unsigned long tlb_virt = round_down(kernstart_virt_addr, SZ_64M);
> +		phys_addr_t tlb_phys = round_down(kernstart_addr, SZ_64M);

That looks like cleanup unrelated to the patch itself.

>   
>   		/* Create kernel map to relocate in */
>   		create_kaslr_tlb_entry(1, tlb_virt, tlb_phys);
> 

Christophe
