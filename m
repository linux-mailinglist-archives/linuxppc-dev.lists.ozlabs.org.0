Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF07EB9B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 06:42:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460DzS30BHzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:42:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="SQWSgrE/"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460Dxk5rZ0zDqdj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 14:40:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 460Dxf3rcfz9vBfl;
 Fri,  2 Aug 2019 06:40:54 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=SQWSgrE/; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KfJWhfY0sfA6; Fri,  2 Aug 2019 06:40:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 460Dxf2QKRz9vBfh;
 Fri,  2 Aug 2019 06:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564720854; bh=YVDDzj8B4DGCz9r9FVryORzEAke42zI+5//nPWDVDj4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SQWSgrE/cUDu7kEjGalYXASJk6NCNOOglvCvsYrF5UFxk3YnebVBHL/Jifxp95zb0
 1EvPPxbQgDrrJe47XuYKvRZikI6Fpqo9m41LHsyOPa9HP3fn+7mrodcTZfB916eQVm
 cmAvQT34zcrk+ymNv7Ebi2Gafvf2ymACdBLE7iOo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 290C38B795;
 Fri,  2 Aug 2019 06:40:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id h5b4XEIPAbyQ; Fri,  2 Aug 2019 06:40:55 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B6AF8B74C;
 Fri,  2 Aug 2019 06:40:54 +0200 (CEST)
Subject: Re: [PATCH v3] powerpc: Support CMDLINE_EXTEND
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 malat@debian.org
References: <20190801225006.21952-1-chris.packham@alliedtelesis.co.nz>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9262a291-161f-e172-9d13-88a717da9de4@c-s.fr>
Date: Fri, 2 Aug 2019 06:40:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801225006.21952-1-chris.packham@alliedtelesis.co.nz>
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



Le 02/08/2019 à 00:50, Chris Packham a écrit :
> Bring powerpc in line with other architectures that support extending or
> overriding the bootloader provided command line.
> 
> The current behaviour is most like CMDLINE_FROM_BOOTLOADER where the
> bootloader command line is preferred but the kernel config can provide a
> fallback so CMDLINE_FROM_BOOTLOADER is the default. CMDLINE_EXTEND can
> be used to append the CMDLINE from the kernel config to the one provided
> by the bootloader.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
> Changes in v3:
> - don't use BUG_ON in prom_strlcat
> - rearrange things to eliminate prom_strlcpy
> 
> Changes in v2:
> - incorporate ideas from Christope's patch https://patchwork.ozlabs.org/patch/1074126/
> - support CMDLINE_FORCE
> 
>   arch/powerpc/Kconfig            | 20 +++++++++++++++++-
>   arch/powerpc/kernel/prom_init.c | 36 ++++++++++++++++++++++-----------
>   2 files changed, 43 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 77f6ebf97113..d413fe1b4058 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -852,15 +852,33 @@ config CMDLINE
>   	  some command-line options at build time by entering them here.  In
>   	  most cases you will need to specify the root device here.
>   
> +choice
> +	prompt "Kernel command line type" if CMDLINE != ""
> +	default CMDLINE_FROM_BOOTLOADER
> +
> +config CMDLINE_FROM_BOOTLOADER
> +	bool "Use bootloader kernel arguments if available"
> +	help
> +	  Uses the command-line options passed by the boot loader. If
> +	  the boot loader doesn't provide any, the default kernel command
> +	  string provided in CMDLINE will be used.
> +
> +config CMDLINE_EXTEND
> +	bool "Extend bootloader kernel arguments"
> +	help
> +	  The command-line arguments provided by the boot loader will be
> +	  appended to the default kernel command string.
> +
>   config CMDLINE_FORCE
>   	bool "Always use the default kernel command string"
> -	depends on CMDLINE_BOOL
>   	help
>   	  Always use the default kernel command string, even if the boot
>   	  loader passes other arguments to the kernel.
>   	  This is useful if you cannot or don't want to change the
>   	  command-line options your boot loader passes to the kernel.
>   
> +endchoice
> +
>   config EXTRA_TARGETS
>   	string "Additional default image types"
>   	help
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 514707ef6779..1c7010cc6ec9 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -298,16 +298,24 @@ static char __init *prom_strstr(const char *s1, const char *s2)
>   	return NULL;
>   }
>   
> -static size_t __init prom_strlcpy(char *dest, const char *src, size_t size)
> -{
> -	size_t ret = prom_strlen(src);
> +static size_t __init prom_strlcat(char *dest, const char *src, size_t count)
> +{
> +	size_t dsize = prom_strlen(dest);
> +	size_t len = prom_strlen(src);
> +	size_t res = dsize + len;
> +
> +	/* This would be a bug */
> +	if (dsize >= count)
> +		return count;
> +
> +	dest += dsize;
> +	count -= dsize;
> +	if (len >= count)
> +		len = count-1;
> +	memcpy(dest, src, len);
> +	dest[len] = 0;
> +	return res;
>   
> -	if (size) {
> -		size_t len = (ret >= size) ? size - 1 : ret;
> -		memcpy(dest, src, len);
> -		dest[len] = '\0';
> -	}
> -	return ret;
>   }
>   
>   #ifdef CONFIG_PPC_PSERIES
> @@ -759,10 +767,14 @@ static void __init early_cmdline_parse(void)
>   
>   	prom_cmd_line[0] = 0;
>   	p = prom_cmd_line;
> -	if ((long)prom.chosen > 0)
> +
> +	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && (long)prom.chosen > 0)
>   		l = prom_getprop(prom.chosen, "bootargs", p, COMMAND_LINE_SIZE-1);
> -	if (IS_ENABLED(CONFIG_CMDLINE_BOOL) && (l <= 0 || p[0] == '\0')) /* dbl check */
> -		prom_strlcpy(prom_cmd_line, CONFIG_CMDLINE, sizeof(prom_cmd_line));
> +
> +	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) || l <= 0 || p[0] == '\0')
> +		prom_strlcat(prom_cmd_line, " " CONFIG_CMDLINE,
> +			     sizeof(prom_cmd_line));
> +
>   	prom_printf("command line: %s\n", prom_cmd_line);
>   
>   #ifdef CONFIG_PPC64
> 
