Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B62917AE5F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 19:44:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YKRQ4NhxzDqmT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 05:44:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YKPN0vDrzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 05:42:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48YKPM6yd2z8tDY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 05:42:47 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48YKPM6dhXz9sPK; Fri,  6 Mar 2020 05:42:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48YKPM2x9zz9sPF
 for <linuxppc-dev@ozlabs.org>; Fri,  6 Mar 2020 05:42:47 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B0C1DB1FD;
 Thu,  5 Mar 2020 18:42:42 +0000 (UTC)
Date: Thu, 5 Mar 2020 19:42:41 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Hari Bathini <hbathini@linux.ibm.com>,
 Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH rebased 1/2] powerpc: reserve memory for capture kernel
 after hugepages init
Message-ID: <20200305184241.GF1776@kitsune.suse.cz>
References: <156166326909.13320.3330203549978146193.stgit@hbathini.in.ibm.com>
 <f0e3acbcd3ba16d06d4f3e51b90655c69004768c.1582043081.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0e3acbcd3ba16d06d4f3e51b90655c69004768c.1582043081.git.msuchanek@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hello,

This seems to cause crash with kdump reservation 1GB quite reliably.

Thanks

Michal

On Tue, Feb 18, 2020 at 05:28:34PM +0100, Michal Suchanek wrote:
> From: Hari Bathini <hbathini@linux.ibm.com>
> 
> Sometimes, memory reservation for KDump/FADump can overlap with memory
> marked for hugepages. This overlap leads to error, hang in KDump case
> and copy error reported by f/w in case of FADump, while trying to
> capture dump. Report error while setting up memory for the capture
> kernel instead of running into issues while capturing dump, by moving
> KDump/FADump reservation below MMU early init and failing gracefully
> when hugepages memory overlaps with capture kernel memory.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/prom.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 6620f37abe73..0f14dc9c4dab 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -735,14 +735,6 @@ void __init early_init_devtree(void *params)
>  	if (PHYSICAL_START > MEMORY_START)
>  		memblock_reserve(MEMORY_START, 0x8000);
>  	reserve_kdump_trampoline();
> -#if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
> -	/*
> -	 * If we fail to reserve memory for firmware-assisted dump then
> -	 * fallback to kexec based kdump.
> -	 */
> -	if (fadump_reserve_mem() == 0)
> -#endif
> -		reserve_crashkernel();
>  	early_reserve_mem();
>  
>  	/* Ensure that total memory size is page-aligned. */
> @@ -781,6 +773,14 @@ void __init early_init_devtree(void *params)
>  #endif
>  
>  	mmu_early_init_devtree();
> +#if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
> +	/*
> +	 * If we fail to reserve memory for firmware-assisted dump then
> +	 * fallback to kexec based kdump.
> +	 */
> +	if (fadump_reserve_mem() == 0)
> +#endif
> +		reserve_crashkernel();
>  
>  #ifdef CONFIG_PPC_POWERNV
>  	/* Scan and build the list of machine check recoverable ranges */
> -- 
> 2.23.0
> 
