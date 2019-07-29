Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2123978A4E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 13:18:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xxxt6zN7zDqMC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 21:18:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="dackvKxk"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xxvs3KWWzDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 21:16:25 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45xxvj0kyCz9txkj;
 Mon, 29 Jul 2019 13:16:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dackvKxk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xIyLPsaGIjS6; Mon, 29 Jul 2019 13:16:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45xxvh6V2gz9txkh;
 Mon, 29 Jul 2019 13:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564398976; bh=SvoINWsTiNi6bfxTR73f4dRC0KxOWKSN84566TKBHYI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dackvKxkvIHUyKwgAU0n33t5nYi73VfZUUKvQBwa4KSCZnI4ttugm01gn6+YRS42o
 GsD1zE3PRynbJOYj3GmEmZLew6BaSC4opjIdv6yl0JtDOtCBRYOA9D31XHQaGyDct3
 CNObLoanBrtDdSjIfZuHFHJG+K3ieSoS7mkta/o0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C000F8B7CE;
 Mon, 29 Jul 2019 13:16:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lXBXD_8AMtnh; Mon, 29 Jul 2019 13:16:21 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C0378B7B3;
 Mon, 29 Jul 2019 13:16:21 +0200 (CEST)
Subject: Re: [RFC PATCH 06/10] powerpc/fsl_booke/32: implement KASLR
 infrastructure
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <20190717080621.40424-7-yanaijie@huawei.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e3f287fc-c4d8-e0c2-90ba-ddfa3cb57e29@c-s.fr>
Date: Mon, 29 Jul 2019 13:16:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717080621.40424-7-yanaijie@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 jingxiangfeng@huawei.com, thunder.leizhen@huawei.com, fanchengyang@huawei.com,
 yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/07/2019 à 10:06, Jason Yan a écrit :
> This patch add support to boot kernel from places other than KERNELBASE.
> Since CONFIG_RELOCATABLE has already supported, what we need to do is
> map or copy kernel to a proper place and relocate. Freescale Book-E
> parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1
> entries are not suitable to map the kernel directly in a randomized
> region, so we chose to copy the kernel to a proper place and restart to
> relocate.
> 
> The offset of the kernel was not randomized yet(a fixed 64M is set). We
> will randomize it in the next patch.
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Cc: Diana Craciun <diana.craciun@nxp.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Kees Cook <keescook@chromium.org>
> ---
>   arch/powerpc/Kconfig                          | 11 +++
>   arch/powerpc/kernel/Makefile                  |  1 +
>   arch/powerpc/kernel/early_32.c                |  2 +-
>   arch/powerpc/kernel/fsl_booke_entry_mapping.S | 13 ++-
>   arch/powerpc/kernel/head_fsl_booke.S          | 15 +++-
>   arch/powerpc/kernel/kaslr_booke.c             | 83 +++++++++++++++++++
>   arch/powerpc/mm/mmu_decl.h                    |  6 ++
>   arch/powerpc/mm/nohash/fsl_booke.c            |  7 +-
>   8 files changed, 125 insertions(+), 13 deletions(-)
>   create mode 100644 arch/powerpc/kernel/kaslr_booke.c
> 

[...]

> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
> index dae8e9177574..754ae1e69f92 100644
> --- a/arch/powerpc/mm/mmu_decl.h
> +++ b/arch/powerpc/mm/mmu_decl.h
> @@ -148,6 +148,12 @@ extern void reloc_kernel_entry(void *fdt, int addr);
>   extern void loadcam_entry(unsigned int index);
>   extern void loadcam_multi(int first_idx, int num, int tmp_idx);
>   
> +#ifdef CONFIG_RANDOMIZE_BASE
> +extern void kaslr_early_init(void *dt_ptr, phys_addr_t size);

No superflous 'extern' keyword.

Christophe

> +#else
> +static inline void kaslr_early_init(void *dt_ptr, phys_addr_t size) {}
> +#endif
> +
>   struct tlbcam {
>   	u32	MAS0;
>   	u32	MAS1;
