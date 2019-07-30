Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 973057A193
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 09:04:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ySGn0hgnzDqGk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 17:04:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="eW4f61P8"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ySDn5nfFzDqCh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 17:02:48 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45ySDh686Mz9v4h1;
 Tue, 30 Jul 2019 09:02:44 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=eW4f61P8; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QcEtw8KqWF5p; Tue, 30 Jul 2019 09:02:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45ySDh4cr1z9v4h0;
 Tue, 30 Jul 2019 09:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564470164; bh=bWFtKsw+3UAAT5I5cI+YLfmPdp4W+J6fqe8KYjCREkI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eW4f61P8Noa8AZB3iSyf7Hb0Bt3dw3pzEADfkhidVc6H8KGeuP+TZhVbMVg06uPDP
 ejZE21GlJgmWv0nG3WGrhV2Cepz+HnJI1ib3XUhUsN4lLM65NybPMbBG54Cu49tcnC
 bTWz3kyR0MSOc2sLN4Pn1VoZZFyKJpl7pQauqBHI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D3768B7F3;
 Tue, 30 Jul 2019 09:02:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OXFoUiHJ8vv9; Tue, 30 Jul 2019 09:02:45 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 448228B74F;
 Tue, 30 Jul 2019 09:02:45 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Support CMDLINE_EXTEND
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
References: <20190724053303.24317-1-chris.packham@alliedtelesis.co.nz>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <59674457-eda5-fe3b-65e0-29c20102fe4d@c-s.fr>
Date: Tue, 30 Jul 2019 09:02:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724053303.24317-1-chris.packham@alliedtelesis.co.nz>
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



Le 24/07/2019 à 07:33, Chris Packham a écrit :
> Device tree aware platforms can make use of CMDLINE_EXTEND to extend the
> kernel command line provided by the bootloader. This is particularly
> useful to set parameters for built-in modules that would otherwise be
> done at module insertion. Add support for this in the powerpc
> architecture.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>   arch/powerpc/Kconfig | 12 ++++++++++++

I think you also have to implement some stuff in early_cmdline_parse() 
in arch/powerpc/kernel/prom_init.c

Maybe look at https://patchwork.ozlabs.org/patch/1074126/

Christophe

>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d8dcd8820369..cd9b3974aa36 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -851,6 +851,11 @@ config CMDLINE
>   	  some command-line options at build time by entering them here.  In
>   	  most cases you will need to specify the root device here.
>   
> +choice
> +	prompt "Kernel command line type" if CMDLINE != ""
> +	default CMDLINE_FORCE
> +	depends on CMDLINE_BOOL
> +
>   config CMDLINE_FORCE
>   	bool "Always use the default kernel command string"
>   	depends on CMDLINE_BOOL
> @@ -860,6 +865,13 @@ config CMDLINE_FORCE
>   	  This is useful if you cannot or don't want to change the
>   	  command-line options your boot loader passes to the kernel.
>   
> +config CMDLINE_EXTEND
> +	bool "Extend bootloader kernel arguments"
> +	help
> +	  The command-line arguments provided by the boot loader will be
> +	  appended to the default kernel command string.
> +endchoice
> +
>   config EXTRA_TARGETS
>   	string "Additional default image types"
>   	help
> 
