Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B594A5B1F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 12:27:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp2hQ2T5Qz3cQD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 22:27:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp2gy4H5bz2x9J
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 22:26:38 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Jp2gx67hTz4xRB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 22:26:37 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4Jp2gx65PDz4xcT; Tue,  1 Feb 2022 22:26:37 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
X-Greylist: delayed 500 seconds by postgrey-1.36 at gandalf;
 Tue, 01 Feb 2022 22:26:37 AEDT
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Jp2gx47WLz4xRB
 for <linuxppc-dev@ozlabs.org>; Tue,  1 Feb 2022 22:26:36 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Jp2VB3Jytz9sSn;
 Tue,  1 Feb 2022 12:18:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uhl1e-6kyY_V; Tue,  1 Feb 2022 12:18:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Jp2VB2Q0tz9sSg;
 Tue,  1 Feb 2022 12:18:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4166F8B77C;
 Tue,  1 Feb 2022 12:18:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OAsqLW4uEl6b; Tue,  1 Feb 2022 12:18:10 +0100 (CET)
Received: from [192.168.5.118] (unknown [192.168.5.118])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E54FC8B766;
 Tue,  1 Feb 2022 12:18:09 +0100 (CET)
Message-ID: <17fda834-d48e-ef0f-922a-555eb5278831@csgroup.eu>
Date: Tue, 1 Feb 2022 12:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] powerpc: reserve memory for capture kernel after
 hugepages init
Content-Language: fr-FR
To: Hari Bathini <hbathini@linux.ibm.com>
References: <156166326909.13320.3330203549978146193.stgit@hbathini.in.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <156166326909.13320.3330203549978146193.stgit@hbathini.in.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/06/2019 à 21:21, Hari Bathini a écrit :
> Sometimes, memory reservation for KDump/FADump can overlap with memory
> marked for hugepages. This overlap leads to error, hang in KDump case
> and copy error reported by f/w in case of FADump, while trying to
> capture dump. Report error while setting up memory for the capture
> kernel instead of running into issues while capturing dump, by moving
> KDump/FADump reservation below MMU early init and failing gracefully
> when hugepages memory overlaps with capture kernel memory.

This patch doesn't apply, if it's still needed can you please rebase ?

Christophe

> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>   arch/powerpc/kernel/prom.c |   16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 7159e79..454e19cf 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -731,14 +731,6 @@ void __init early_init_devtree(void *params)
>   	if (PHYSICAL_START > MEMORY_START)
>   		memblock_reserve(MEMORY_START, 0x8000);
>   	reserve_kdump_trampoline();
> -#ifdef CONFIG_FA_DUMP
> -	/*
> -	 * If we fail to reserve memory for firmware-assisted dump then
> -	 * fallback to kexec based kdump.
> -	 */
> -	if (fadump_reserve_mem() == 0)
> -#endif
> -		reserve_crashkernel();
>   	early_reserve_mem();
>   
>   	/* Ensure that total memory size is page-aligned. */
> @@ -777,6 +769,14 @@ void __init early_init_devtree(void *params)
>   #endif
>   
>   	mmu_early_init_devtree();
> +#ifdef CONFIG_FA_DUMP
> +	/*
> +	 * If we fail to reserve memory for firmware-assisted dump then
> +	 * fallback to kexec based kdump.
> +	 */
> +	if (fadump_reserve_mem() == 0)
> +#endif
> +		reserve_crashkernel();
>   
>   #ifdef CONFIG_PPC_POWERNV
>   	/* Scan and build the list of machine check recoverable ranges */
