Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D88E2DF923
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 07:08:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czpv52XxnzDqMX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 17:08:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Czpnz0W8TzDqLr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 17:04:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Czpnc0TyHz9tyDr;
 Mon, 21 Dec 2020 07:04:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Q6Hq4EWOi5y1; Mon, 21 Dec 2020 07:04:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Czpnb6Nn8z9tyDl;
 Mon, 21 Dec 2020 07:04:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6580B8B789;
 Mon, 21 Dec 2020 07:04:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Eq5PObDdT8zF; Mon, 21 Dec 2020 07:04:08 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF03D8B75B;
 Mon, 21 Dec 2020 07:04:07 +0100 (CET)
Subject: Re: [PATCH] powerpc: always enable queued spinlocks for 64s, disable
 for others
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201221032226.888758-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <769ec5dd-8e74-56cb-a3fe-3b657bb3d14c@csgroup.eu>
Date: Mon, 21 Dec 2020 07:04:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201221032226.888758-1-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/12/2020 à 04:22, Nicholas Piggin a écrit :
> Queued spinlocks have shown to have good performance and fairness
> properties even on smaller (2 socket) POWER systems. This selects
> them automatically for 64s. For other platforms they are de-selected,
> the standard spinlock is far simpler and smaller code, and single
> chips with a handful of cores is unlikely to show any improvement.
> 
> CONFIG_EXPERT still allows this to be changed, e.g., to help debug
> performance or correctness issues.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/Kconfig | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index ae7391627054..1f9f9e64d638 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -255,6 +255,7 @@ config PPC
>   	select PCI_MSI_ARCH_FALLBACKS		if PCI_MSI
>   	select PCI_SYSCALL			if PCI
>   	select PPC_DAWR				if PPC64
> +	select PPC_QUEUED_SPINLOCKS		if !EXPERT && PPC_BOOK3S_64 && SMP

The condition is a bit complicated, and it doesn't set it to Y by default when EXPERT is selected.

>   	select RTC_LIB
>   	select SPARSE_IRQ
>   	select SYSCTL_EXCEPTION_TRACE
> @@ -506,16 +507,13 @@ config HOTPLUG_CPU
>   config PPC_QUEUED_SPINLOCKS
>   	bool "Queued spinlocks"
>   	depends on SMP
> +	depends on EXPERT || PPC_BOOK3S_64
> +

I would do:

    config PPC_QUEUED_SPINLOCKS
  	bool "Queued spinlocks" if EXPERT
  	depends on SMP
	default PPC_BOOK3S_64



>   	help
>   	  Say Y here to use queued spinlocks which give better scalability and
>   	  fairness on large SMP and NUMA systems without harming single threaded
>   	  performance.
>   
> -	  This option is currently experimental, the code is more complex and
> -	  less tested so it defaults to "N" for the moment.
> -
> -	  If unsure, say "N".
> -
>   config ARCH_CPU_PROBE_RELEASE
>   	def_bool y
>   	depends on HOTPLUG_CPU
> 

Christophe
