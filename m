Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F15D1AAE66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 18:43:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492SpD5DYXzDqFp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 02:43:00 +1000 (AEST)
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
 header.s=mail header.b=RspggpQl; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492SQx1gLNzDqs2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 02:26:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 492SQr5dfPz9txkj;
 Wed, 15 Apr 2020 18:26:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=RspggpQl; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id W4eXoLlMBR6F; Wed, 15 Apr 2020 18:26:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 492SQr3DxWz9txkg;
 Wed, 15 Apr 2020 18:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586967972; bh=CDE9knAbDkCSfIhlbkmzglEAEsv+GEW7TnUTyLjv8FM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RspggpQlG76h8zqW5990ip3PhrX6jg5pW7BqBPgZ23iojyMiRBt0DG9M3B38bYgSA
 X/EGftU40bLuy/oXeVHnA/UHymUulA5RVVgfxWc/spEhfn7uZ7Oe65jzgcJ4Vhn18Y
 v4qn/h5K5PcYyChCBUeYbvncA1ivtEB306WkBDv8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 653FF8BB75;
 Wed, 15 Apr 2020 18:26:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kpVezo4tl1UF; Wed, 15 Apr 2020 18:26:12 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D3E908BB3A;
 Wed, 15 Apr 2020 18:26:11 +0200 (CEST)
Subject: Re: [PATCH v2,1/5] powerpc: 85xx: make FSL_85XX_CACHE_SRAM
 configurable
To: Wang Wenhu <wenhu.wang@vivo.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, oss@buserror.net, linuxppc-dev@lists.ozlabs.org
References: <20200415124929.GA3265842@kroah.com>
 <20200415152442.122873-1-wenhu.wang@vivo.com>
 <20200415152442.122873-2-wenhu.wang@vivo.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <4800a04c-e26e-9832-c91f-04b12660282b@c-s.fr>
Date: Wed, 15 Apr 2020 18:26:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415152442.122873-2-wenhu.wang@vivo.com>
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
Cc: kernel@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/04/2020 à 17:24, Wang Wenhu a écrit :
> Enable FSL_85XX_CACHE_SRAM selection. On e500 platforms, the cache
> could be configured and used as a piece of SRAM which is hignly
> friendly for some user level application performances.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Scott Wood <oss@buserror.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
> ---
> Changes since v1:
>   * None
> ---
>   arch/powerpc/platforms/85xx/Kconfig    | 2 +-
>   arch/powerpc/platforms/Kconfig.cputype | 5 +++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
> index fa3d29dcb57e..6debb4f1b9cc 100644
> --- a/arch/powerpc/platforms/85xx/Kconfig
> +++ b/arch/powerpc/platforms/85xx/Kconfig
> @@ -17,7 +17,7 @@ if FSL_SOC_BOOKE
>   if PPC32
>   
>   config FSL_85XX_CACHE_SRAM
> -	bool
> +	bool "Freescale 85xx Cache-Sram"
>   	select PPC_LIB_RHEAP
>   	help
>   	  When selected, this option enables cache-sram support
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 0c3c1902135c..1921e9a573e8 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   config PPC32
> -	bool
> +	bool "32-bit kernel"

Why make that user selectable ?

Either a kernel is 64-bit or it is 32-bit. So having PPC64 user 
selectable is all we need.

And what is the link between this change and the description in the log ?

>   	default y if !PPC64
>   	select KASAN_VMALLOC if KASAN && MODULES
>   
> @@ -15,6 +15,7 @@ config PPC_BOOK3S_32
>   	bool
>   
>   menu "Processor support"
> +

Why adding this space ?

>   choice
>   	prompt "Processor Type"
>   	depends on PPC32
> @@ -211,9 +212,9 @@ config PPC_BOOK3E
>   	depends on PPC_BOOK3E_64
>   
>   config E500
> +	bool "e500 Support"
>   	select FSL_EMB_PERFMON
>   	select PPC_FSL_BOOK3E
> -	bool

Why make this user-selectable ? This is already selected by the 
processors requiring it, ie 8500, e5500 and e6500.

Is there any other case where we need E500 ?

And again, what's the link between this change and the description in 
the log ?


>   
>   config PPC_E500MC
>   	bool "e500mc Support"
> 

Christophe
