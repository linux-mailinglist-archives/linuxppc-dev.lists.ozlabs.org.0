Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A64F83664B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 07:20:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ85K5450z3bcq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:20:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ84y58BRz2yqD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 15:20:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FQ84t0yFMzB09Zx;
 Wed, 21 Apr 2021 07:19:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gwq0mv73agO5; Wed, 21 Apr 2021 07:19:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FQ84s74jZzB09Zr;
 Wed, 21 Apr 2021 07:19:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C12EA8B814;
 Wed, 21 Apr 2021 07:19:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 37EEIdynIZD1; Wed, 21 Apr 2021 07:19:58 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 588E38B770;
 Wed, 21 Apr 2021 07:19:58 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc: make ALTIVEC select PPC_FPU
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20210421025605.10868-1-rdunlap@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <60ac6ff1-6bfa-d335-ac0e-336fe3e50587@csgroup.eu>
Date: Wed, 21 Apr 2021 07:19:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210421025605.10868-1-rdunlap@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/04/2021 à 04:56, Randy Dunlap a écrit :
> On a kernel config with ALTIVEC=y and PPC_FPU not set/enabled,
> there are build errors:
> 
> drivers/cpufreq/pmac32-cpufreq.c:262:2: error: implicit declaration of function 'enable_kernel_fp' [-Werror,-Wimplicit-function-declaration]
>             enable_kernel_fp();
> ../arch/powerpc/lib/sstep.c: In function 'do_vec_load':
> ../arch/powerpc/lib/sstep.c:637:3: error: implicit declaration of function 'put_vr' [-Werror=implicit-function-declaration]
>    637 |   put_vr(rn, &u.v);
>        |   ^~~~~~
> ../arch/powerpc/lib/sstep.c: In function 'do_vec_store':
> ../arch/powerpc/lib/sstep.c:660:3: error: implicit declaration of function 'get_vr'; did you mean 'get_oc'? [-Werror=implicit-function-declaration]
>    660 |   get_vr(rn, &u.v);
>        |   ^~~~~~
> 
> In theory ALTIVEC is independent of PPC_FPU but in practice nobody
> is going to build such a machine, so make ALTIVEC require PPC_FPU
> by selecting it.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Cc: lkp@intel.com
> ---
> v2: change ALTIVEC depends on PPC_FPU to select (Christophe and Michael)
> 
>   arch/powerpc/platforms/86xx/Kconfig    |    1 +
>   arch/powerpc/platforms/Kconfig.cputype |    2 ++
>   2 files changed, 3 insertions(+)
> 
> --- linux-next-20210416.orig/arch/powerpc/platforms/86xx/Kconfig
> +++ linux-next-20210416/arch/powerpc/platforms/86xx/Kconfig
> @@ -4,6 +4,7 @@ menuconfig PPC_86xx
>   	bool "86xx-based boards"
>   	depends on PPC_BOOK3S_32
>   	select FSL_SOC
> +	select PPC_FPU

Now that ALTIVEC selects PPC_FPU by itself, I don't think you need that.

>   	select ALTIVEC
>   	help
>   	  The Freescale E600 SoCs have 74xx cores.
> --- linux-next-20210416.orig/arch/powerpc/platforms/Kconfig.cputype
> +++ linux-next-20210416/arch/powerpc/platforms/Kconfig.cputype
> @@ -186,6 +186,7 @@ config E300C3_CPU
>   config G4_CPU
>   	bool "G4 (74xx)"
>   	depends on PPC_BOOK3S_32
> +	select PPC_FPU

Same

>   	select ALTIVEC
>   
>   endchoice
> @@ -310,6 +311,7 @@ config PHYS_64BIT
>   config ALTIVEC
>   	bool "AltiVec Support"
>   	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64 || (PPC_E500MC && PPC64)
> +	select PPC_FPU
>   	help
>   	  This option enables kernel support for the Altivec extensions to the
>   	  PowerPC processor. The kernel currently supports saving and restoring
> 
