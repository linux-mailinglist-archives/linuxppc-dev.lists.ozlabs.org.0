Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F0D1AF1B8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 17:40:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494HGG18KhzDsNT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 01:40:06 +1000 (AEST)
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
 header.s=mail header.b=Ys2kOrQf; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494GhX1G6JzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 01:14:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 494GhN3XV3zB09Zc;
 Sat, 18 Apr 2020 17:14:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Ys2kOrQf; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2lcJkaGzkoJJ; Sat, 18 Apr 2020 17:14:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 494GhN2SjkzB09Zb;
 Sat, 18 Apr 2020 17:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587222852; bh=gkdO6wXUCMcpz7NxpipTTUJqjJLTk5RmhAdRmmr2lPk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ys2kOrQf8+IsQpw3uLxwRHJvEe2aifLm5D4UpWeMK0kDv1AR/2xUb1tP1bpBnc6tU
 /FXFqj/0reLL0AhKcAmepR4fiN+Nst88VgI4jysw3UkXqTDfBFUmEuw5zgvR7IUyfx
 GD8U+NDoD3gPnh1LMFlS4lGOU/NlhxN/aglDeXYA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 129F48BBCF;
 Sat, 18 Apr 2020 17:14:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CTX-Cucux1p0; Sat, 18 Apr 2020 17:14:14 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D8FE8B75E;
 Sat, 18 Apr 2020 17:14:13 +0200 (CEST)
Subject: Re: [PATCH] iommu: spapr_tce: Disable compile testing to fix build on
 book3s_32 config
To: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200414142630.21153-1-krzk@kernel.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a99ee461-664c-51ae-cb3a-cf5d87048d86@c-s.fr>
Date: Sat, 18 Apr 2020 15:14:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200414142630.21153-1-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04/14/2020 02:26 PM, Krzysztof Kozlowski wrote:
> Although SPAPR_TCE_IOMMU itself can be compile tested on certain PowerPC
> configurations, its presence makes arch/powerpc/kvm/Makefile to select
> modules which do not build in such configuration.
> 
> The arch/powerpc/kvm/ modules use kvm_arch.spapr_tce_tables which exists
> only with CONFIG_PPC_BOOK3S_64.  However these modules are selected when
> COMPILE_TEST and SPAPR_TCE_IOMMU are chosen leading to build failures:
> 
>      In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:0,
>                       from arch/powerpc/kvm/book3s_64_vio_hv.c:22:
>      arch/powerpc/include/asm/book3s/64/pgtable.h:17:0: error: "_PAGE_EXEC" redefined [-Werror]
>       #define _PAGE_EXEC  0x00001 /* execute permission */
> 
>      In file included from arch/powerpc/include/asm/book3s/32/pgtable.h:8:0,
>                       from arch/powerpc/include/asm/book3s/pgtable.h:8,
>                       from arch/powerpc/include/asm/pgtable.h:18,
>                       from include/linux/mm.h:95,
>                       from arch/powerpc/include/asm/io.h:29,
>                       from include/linux/io.h:13,
>                       from include/linux/irq.h:20,
>                       from arch/powerpc/include/asm/hardirq.h:6,
>                       from include/linux/hardirq.h:9,
>                       from include/linux/kvm_host.h:7,
>                       from arch/powerpc/kvm/book3s_64_vio_hv.c:12:
>      arch/powerpc/include/asm/book3s/32/hash.h:29:0: note: this is the location of the previous definition
>       #define _PAGE_EXEC 0x200 /* software: exec allowed */
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: e93a1695d7fb ("iommu: Enable compile testing for some of drivers")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/iommu/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 58b4a4dbfc78..3532b1ead19d 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -362,7 +362,7 @@ config IPMMU_VMSA
>   
>   config SPAPR_TCE_IOMMU
>   	bool "sPAPR TCE IOMMU Support"
> -	depends on PPC_POWERNV || PPC_PSERIES || (PPC && COMPILE_TEST)
> +	depends on PPC_POWERNV || PPC_PSERIES
>   	select IOMMU_API
>   	help
>   	  Enables bits of IOMMU API required by VFIO. The iommu_ops
> 

Should it be fixed the other way round, something like:

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 2bfeaa13befb..906707d15810 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -135,4 +135,4 @@ obj-$(CONFIG_KVM_BOOK3S_32) += kvm.o
  obj-$(CONFIG_KVM_BOOK3S_64_PR) += kvm-pr.o
  obj-$(CONFIG_KVM_BOOK3S_64_HV) += kvm-hv.o

-obj-y += $(kvm-book3s_64-builtin-objs-y)
+obj-$(CONFIG_KVM_BOOK3S_64) += $(kvm-book3s_64-builtin-objs-y)


Christophe
