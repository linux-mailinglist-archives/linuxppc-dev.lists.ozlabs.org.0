Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB519D950
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:42:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v2h935LdzDqd7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:42:01 +1100 (AEDT)
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
 header.s=mail header.b=MykCxgki; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v2Rg1TkszDqjX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 01:31:11 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48v2RY0gCvz9vBTW;
 Fri,  3 Apr 2020 16:31:05 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=MykCxgki; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xjJuNqIhvtxk; Fri,  3 Apr 2020 16:31:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48v2RX6cjhz9vBTY;
 Fri,  3 Apr 2020 16:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585924264; bh=FtZIPJprE222VRoSRgAf5IJGQYZRhh3dxCegav4h8OA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MykCxgkibSGmnzNBfkuCwC3hyGHWBVoBPePoZbZ9H3Daj1fNecvvn8kXLQerI8KVs
 P0EVnO4yzD1BVIxsOCY+UdOmPgN6cgGm2TDrrZGoG7nvOLN7/44DmiwTwyKtoAqv5H
 fK1UJFOQY9KsqfJqLVesCxd++rCfvM3CHRNyrnjs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5226C8B951;
 Fri,  3 Apr 2020 16:31:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id c47UQXo-mSvP; Fri,  3 Apr 2020 16:31:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AEC9F8B950;
 Fri,  3 Apr 2020 16:31:05 +0200 (CEST)
Subject: Re: [PATCH v2 05/14] powerpc/pseries/ras: avoid calling rtas_token in
 NMI paths
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200403132622.130394-1-npiggin@gmail.com>
 <20200403132622.130394-6-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <26bde8af-b499-78f1-2f9a-91972ab343c6@c-s.fr>
Date: Fri, 3 Apr 2020 16:30:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403132622.130394-6-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/04/2020 à 15:26, Nicholas Piggin a écrit :
> In the interest of reducing code and possible failures in the
> machine check and system reset paths, grab the "ibm,nmi-interlock"
> token at init time.
> 
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/firmware.h    |  1 +
>   arch/powerpc/platforms/pseries/ras.c   |  2 +-
>   arch/powerpc/platforms/pseries/setup.c | 13 ++++++++++---
>   3 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
> index ca33f4ef6cb4..6003c2e533a0 100644
> --- a/arch/powerpc/include/asm/firmware.h
> +++ b/arch/powerpc/include/asm/firmware.h
> @@ -128,6 +128,7 @@ extern void machine_check_fwnmi(void);
>   
>   /* This is true if we are using the firmware NMI handler (typically LPAR) */
>   extern int fwnmi_active;
> +extern int ibm_nmi_interlock_token;
>   
>   extern unsigned int __start___fw_ftr_fixup, __stop___fw_ftr_fixup;
>   
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index 1d7f973c647b..c74d5e740922 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -458,7 +458,7 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
>    */
>   static void fwnmi_release_errinfo(void)
>   {
> -	int ret = rtas_call(rtas_token("ibm,nmi-interlock"), 0, 1, NULL);
> +	int ret = rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
>   	if (ret != 0)
>   		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
>   }
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index 0c8421dd01ab..b582198be284 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -83,6 +83,7 @@ unsigned long CMO_PageSize = (ASM_CONST(1) << IOMMU_PAGE_SHIFT_4K);
>   EXPORT_SYMBOL(CMO_PageSize);
>   
>   int fwnmi_active;  /* TRUE if an FWNMI handler is present */
> +int ibm_nmi_interlock_token;
>   
>   static void pSeries_show_cpuinfo(struct seq_file *m)
>   {
> @@ -113,9 +114,14 @@ static void __init fwnmi_init(void)
>   	struct slb_entry *slb_ptr;
>   	size_t size;
>   #endif
> +	int ibm_nmi_register_token;
>   
> -	int ibm_nmi_register = rtas_token("ibm,nmi-register");
> -	if (ibm_nmi_register == RTAS_UNKNOWN_SERVICE)
> +	ibm_nmi_register_token = rtas_token("ibm,nmi-register");
> +	if (ibm_nmi_register_token == RTAS_UNKNOWN_SERVICE)
> +		return;
> +
> +	ibm_nmi_interlock_token = rtas_token("ibm,nmi-interlock");
> +	if (WARN_ON(ibm_nmi_interlock_token == RTAS_UNKNOWN_SERVICE))
>   		return;
>   
>   	/* If the kernel's not linked at zero we point the firmware at low
> @@ -123,7 +129,8 @@ static void __init fwnmi_init(void)
>   	system_reset_addr  = __pa(system_reset_fwnmi) - PHYSICAL_START;
>   	machine_check_addr = __pa(machine_check_fwnmi) - PHYSICAL_START;
>   
> -	if (0 == rtas_call(ibm_nmi_register, 2, 1, NULL, system_reset_addr,
> +	if (0 == rtas_call(ibm_nmi_register_token, 2, 1, NULL,
> +				system_reset_addr,
>   				machine_check_addr))

Alignment is wrong. And you could put system_reset_addr and 
machine_check_addr on the same line to limit the number of lines of the if.

>   		fwnmi_active = 1;
>   
> 

Christophe
