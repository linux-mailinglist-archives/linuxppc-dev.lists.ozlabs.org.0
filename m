Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CF0435A1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 06:53:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZZqY3lK5z3c9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 15:53:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZZq45nbPz2xtw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:52:46 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HZZpr3B4Jz9sSQ;
 Thu, 21 Oct 2021 06:52:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hutVQ2eJH6h; Thu, 21 Oct 2021 06:52:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HZZpr23KRz9sSN;
 Thu, 21 Oct 2021 06:52:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D3B08B80E;
 Thu, 21 Oct 2021 06:52:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hyXNXzjDndTu; Thu, 21 Oct 2021 06:52:36 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.154])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DB0D58B764;
 Thu, 21 Oct 2021 06:52:35 +0200 (CEST)
Subject: Re: [PATCH v2 11/16] powerpc/64: pcpu setup avoid reading
 mmu_linear_psize on 64e or radix
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021035417.2157804-1-npiggin@gmail.com>
 <20211021035417.2157804-12-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <11227d01-7ff4-2b14-e6a8-b1a596253b90@csgroup.eu>
Date: Thu, 21 Oct 2021 06:52:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211021035417.2157804-12-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/10/2021 à 05:54, Nicholas Piggin a écrit :
> Radix never sets mmu_linear_psize so it's always 4K, which causes pcpu
> atom_size to always be PAGE_SIZE. 64e sets it to 1GB always.
> 
> Make paths for these platforms to be explicit about what value they set
> atom_size to.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/setup_64.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index eaa79a0996d1..7d4bcbc3124e 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -880,14 +880,23 @@ void __init setup_per_cpu_areas(void)
>   	int rc = -EINVAL;
>   
>   	/*
> -	 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
> -	 * to group units.  For larger mappings, use 1M atom which
> -	 * should be large enough to contain a number of units.
> +	 * BookE and BookS radix are historical values and should be revisited.
>   	 */
> -	if (mmu_linear_psize == MMU_PAGE_4K)
> -		atom_size = PAGE_SIZE;
> -	else
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3E)) {
>   		atom_size = 1 << 20;
> +	} else if (radix_enabled()) {
> +		atom_size = PAGE_SIZE;
> +	} else {

You can keep a single level (and remove the brackets)

	if (IS_ENABLED(CONFIG_PPC_BOOK3E))
		atom_size = SZ_1M;
	else if (radix_enabled())
		atom_size = PAGE_SIZE;
	else if (mmu_linear_psize == MMU_PAGE_4K)
		atom_size = PAGE_SIZE;
	else
		atom_size = SZ_1M;


> +		/*
> +		 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
> +		 * to group units.  For larger mappings, use 1M atom which
> +		 * should be large enough to contain a number of units.
> +		 */
> +		if (mmu_linear_psize == MMU_PAGE_4K)
> +			atom_size = PAGE_SIZE;
> +		else
> +			atom_size = 1 << 20;

Use SZ_1M instead of hardcoding.

> +	}
>   
>   	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
>   		rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
> 
