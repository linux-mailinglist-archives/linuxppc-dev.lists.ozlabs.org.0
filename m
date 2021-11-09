Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF5A44B0FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 17:16:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpY5X3F4hz3c5J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 03:16:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpY561dxsz2yK3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 03:16:25 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HpY5231hlz9sSH;
 Tue,  9 Nov 2021 17:16:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iSolt3Cnnlbv; Tue,  9 Nov 2021 17:16:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HpY522GgQz9sSG;
 Tue,  9 Nov 2021 17:16:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C79E8B77A;
 Tue,  9 Nov 2021 17:16:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Vx5fyIRzu-tL; Tue,  9 Nov 2021 17:16:22 +0100 (CET)
Received: from [192.168.233.192] (unknown [192.168.233.192])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0939B8B767;
 Tue,  9 Nov 2021 17:16:21 +0100 (CET)
Message-ID: <c363e53c-cba5-5711-e8c4-6d74c44f99be@csgroup.eu>
Date: Tue, 9 Nov 2021 17:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] powerpc/64s: introduce CONFIG_MAXSMP to test very
 large SMP
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211109065131.2041720-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211109065131.2041720-1-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/11/2021 à 07:51, Nicholas Piggin a écrit :
> Similarly to x86, add MAXSMP that should help flush out problems with
> vary large SMP and other values associated with very big systems.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Since v1:
> - Reduce MAXSMP NR_CPUS to 8192 if COMPILE_TEST, to reduce compile errors
>    that aren't caught by existing x86 builds.
> 
> Thanks,
> Nick
> 
>   arch/powerpc/Kconfig                   | 8 ++++++++
>   arch/powerpc/platforms/Kconfig.cputype | 9 +++++++--
>   2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index b8f6185d3998..d585fcfa456f 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -64,6 +64,13 @@ config NEED_PER_CPU_EMBED_FIRST_CHUNK
>   config NEED_PER_CPU_PAGE_FIRST_CHUNK
>   	def_bool y if PPC64
>   
> +config MAXSMP
> +	bool "Enable Maximum number of SMP Processors and NUMA Nodes"
> +	depends on SMP && DEBUG_KERNEL && PPC_BOOK3S_64
> +	help
> +	  Enable maximum number of CPUS and NUMA Nodes for this architecture.
> +	  If unsure, say N.
> +
>   config NR_IRQS
>   	int "Number of virtual interrupt numbers"
>   	range 32 1048576
> @@ -666,6 +673,7 @@ config NUMA
>   
>   config NODES_SHIFT
>   	int
> +	default "10" if MAXSMP
>   	default "8" if PPC64
>   	default "4"
>   	depends on NUMA
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index a208997ade88..14c275e0ff93 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -475,9 +475,14 @@ config SMP
>   
>   	  If you don't know what to do here, say N.
>   
> +# MAXSMP sets 8192 if COMPILE_TEST because that's what x86 has flushed out.
> +# Exceeding that will cause a lot of compile errors. Have to deal with those
> +# first.
>   config NR_CPUS
> -	int "Maximum number of CPUs (2-8192)" if SMP
> -	range 2 8192 if SMP
> +	int "Maximum number of CPUs (2-8192)" if SMP && !MAXSMP
> +	range 2 16384 if SMP
> +	default 16384 if MAXSMP && !COMPILE_TEST
> +	default 8192 if MAXSMP && COMPILE_TEST

You can do less complex. First hit becomes the default, so you can do:

	default 8192 if MAXSMP && COMPILE_TEST
	default 16384 if MAXSMP

So when everything is fixed, you just have to drop first line.

>   	default "1" if !SMP
>   	default "32" if PPC64
>   	default "4"
> 
