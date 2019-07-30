Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EA47A434
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 11:32:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yWYN1wG8zDqVS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 19:32:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="AJN5F12u"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yWQ70yzqzDqPS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 19:26:07 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45yWQ21X9dz9v6rT;
 Tue, 30 Jul 2019 11:26:02 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AJN5F12u; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LRxphC94yUZK; Tue, 30 Jul 2019 11:26:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45yWQ20QYkz9v6rD;
 Tue, 30 Jul 2019 11:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564478762; bh=W//OIZsM/jUQL1sXAlfI0gnd6Lb87Aj26k4kkTDnwm4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AJN5F12ulHgThDKUR3oIGc0695t9bO/lj2khBojcsnp3jWQpRcACIdCwwnBWH6Ur3
 hDAUUSbcFaRi29dH1NMaHir0BNR0BFPtCMAUmCS1GaRAhHEBxAOvPKsdOSxMm/4d4I
 QChIEG+N36QiKUwU5F3juoJ/EQV5ImXFBJsP2qkc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 279388B74F;
 Tue, 30 Jul 2019 11:26:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ePrJRc48g8qJ; Tue, 30 Jul 2019 11:26:03 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D7F778B800;
 Tue, 30 Jul 2019 11:26:02 +0200 (CEST)
Subject: Re: [PATCH v2 04/10] powerpc/fsl_booke/32: introduce
 create_tlb_entry() helper
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com
References: <20190730074225.39544-1-yanaijie@huawei.com>
 <20190730074225.39544-5-yanaijie@huawei.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9b17e312-fd17-5985-8fd0-9eb7938d94b1@c-s.fr>
Date: Tue, 30 Jul 2019 11:26:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730074225.39544-5-yanaijie@huawei.com>
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
 jingxiangfeng@huawei.com, zhaohongjiang@huawei.com, thunder.leizhen@huawei.com,
 fanchengyang@huawei.com, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/07/2019 à 09:42, Jason Yan a écrit :
> Add a new helper create_tlb_entry() to create a tlb entry by the virtual
> and physical address. This is a preparation to support boot kernel at a
> randomized address.
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Cc: Diana Craciun <diana.craciun@nxp.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Kees Cook <keescook@chromium.org>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/kernel/head_fsl_booke.S | 29 ++++++++++++++++++++++++++++
>   arch/powerpc/mm/mmu_decl.h           |  1 +
>   2 files changed, 30 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
> index adf0505dbe02..04d124fee17d 100644
> --- a/arch/powerpc/kernel/head_fsl_booke.S
> +++ b/arch/powerpc/kernel/head_fsl_booke.S
> @@ -1114,6 +1114,35 @@ __secondary_hold_acknowledge:
>   	.long	-1
>   #endif
>   
> +/*
> + * Create a 64M tlb by address and entry
> + * r3/r4 - physical address
> + * r5 - virtual address
> + * r6 - entry
> + */
> +_GLOBAL(create_tlb_entry)
> +	lis     r7,0x1000               /* Set MAS0(TLBSEL) = 1 */
> +	rlwimi  r7,r6,16,4,15           /* Setup MAS0 = TLBSEL | ESEL(r6) */
> +	mtspr   SPRN_MAS0,r7            /* Write MAS0 */
> +
> +	lis     r6,(MAS1_VALID|MAS1_IPROT)@h
> +	ori     r6,r6,(MAS1_TSIZE(BOOK3E_PAGESZ_64M))@l
> +	mtspr   SPRN_MAS1,r6            /* Write MAS1 */
> +
> +	lis     r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@h
> +	ori     r6,r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@l
> +	and     r6,r6,r5
> +	ori	r6,r6,MAS2_M@l
> +	mtspr   SPRN_MAS2,r6            /* Write MAS2(EPN) */
> +
> +	ori     r8,r4,(MAS3_SW|MAS3_SR|MAS3_SX)
> +	mtspr   SPRN_MAS3,r8            /* Write MAS3(RPN) */
> +
> +	tlbwe                           /* Write TLB */
> +	isync
> +	sync
> +	blr
> +
>   /*
>    * Create a tlb entry with the same effective and physical address as
>    * the tlb entry used by the current running code. But set the TS to 1.
> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
> index 32c1a191c28a..a09f89d3aa0f 100644
> --- a/arch/powerpc/mm/mmu_decl.h
> +++ b/arch/powerpc/mm/mmu_decl.h
> @@ -142,6 +142,7 @@ extern unsigned long calc_cam_sz(unsigned long ram, unsigned long virt,
>   extern void adjust_total_lowmem(void);
>   extern int switch_to_as1(void);
>   extern void restore_to_as0(int esel, int offset, void *dt_ptr, int bootcpu);
> +void create_tlb_entry(phys_addr_t phys, unsigned long virt, int entry);
>   #endif
>   extern void loadcam_entry(unsigned int index);
>   extern void loadcam_multi(int first_idx, int num, int tmp_idx);
> 
