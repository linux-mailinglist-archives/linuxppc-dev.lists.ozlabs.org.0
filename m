Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D25057EBDE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 07:20:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460FqM6B05zDqZX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 15:20:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Bam9ZT8f"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460FnR00C3zDql6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 15:18:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 460FnL5MkFz9vBfr;
 Fri,  2 Aug 2019 07:18:46 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Bam9ZT8f; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sdGXrrjyCDuQ; Fri,  2 Aug 2019 07:18:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 460FnL3Stcz9vBfp;
 Fri,  2 Aug 2019 07:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564723126; bh=dskM129Z+Pm2g90k1EaL/hR4S3jKQ/kszYbrKBxwKZM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Bam9ZT8fJlMSqeotbiCuQd3LWO9PpK+7w9pj2xMUyg6ZAYtLHCtDZ4pzOXQHI7kfe
 uGh+XUsOrdEWkqJFeoXMMDvLB9QaQVw5STm2gmCOl2HmNvYrUGcHyiPRY/uJP5OmG4
 j8CG7abnSTmsnnrTXnGYQ/q8V93FZO0n3ulXNTsM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6520A8B797;
 Fri,  2 Aug 2019 07:18:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OThNZB83Zkwe; Fri,  2 Aug 2019 07:18:47 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E45368B74C;
 Fri,  2 Aug 2019 07:18:46 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Remove inaccessible CMDLINE default
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
References: <20190802050232.22978-1-chris.packham@alliedtelesis.co.nz>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <43422528-c2fc-a2c8-49e6-0f6b2c791648@c-s.fr>
Date: Fri, 2 Aug 2019 07:18:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802050232.22978-1-chris.packham@alliedtelesis.co.nz>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/08/2019 à 07:02, Chris Packham a écrit :
> Since commit cbe46bd4f510 ("powerpc: remove CONFIG_CMDLINE #ifdef mess")
> CONFIG_CMDLINE has always had a value regardless of CONNIG_CMDLINE_BOOL.

s/CONNIG/CONFIG/

> 
> For example:
> 
>   $ make ARCH=powerpc defconfig
>   $ cat .config
>   # CONFIG_CMDLINE_BOOL is not set
>   CONFIG_CMDLINE=""
> 
> When enabling CONNIG_CMDLINE_BOOL this value is kept making the 'default
> "..." if CONNIG_CMDLINE_BOOL' ineffective.

s/CONNIG/CONFIG/

> 
>   $ ./scripts/config --enable CONFIG_CMDLINE_BOOL
>   $ cat .config
>   CONFIG_CMDLINE_BOOL=y
>   CONFIG_CMDLINE=""
> 
> Additionally all the in-tree powerpc defconfigs that set
> CONFIG_CMDLINE_BOOL=y also set CONFIG_CMDLINE to something else. For
> these reasons remove the inaccessible default.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
> This should be independent of http://patchwork.ozlabs.org/patch/1140811/ but
> I've generated this patch on a stream that has it applied locally.
> 
>   arch/powerpc/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d413fe1b4058..6fca6eba6aee 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -844,7 +844,6 @@ config CMDLINE_BOOL
>   
>   config CMDLINE
>   	string "Initial kernel command string" if CMDLINE_BOOL
> -	default "console=ttyS0,9600 console=tty0 root=/dev/sda2" if CMDLINE_BOOL
>   	default ""
>   	help
>   	  On some platforms, there is currently no way for the boot loader to
> 

I think we could also get rid of CMDLINE_BOOL totally and use CMDLINE != 
"" instead.

Christophe
