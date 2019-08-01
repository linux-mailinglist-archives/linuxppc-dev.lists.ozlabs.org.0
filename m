Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F787D55D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 08:17:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zg783DkNzDqnk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 16:17:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="vXyb8vnv"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zg4F244XzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 16:14:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45zg452S2dz9v079;
 Thu,  1 Aug 2019 08:14:29 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=vXyb8vnv; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kBsBpS4FItwM; Thu,  1 Aug 2019 08:14:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45zg451GvWz9v078;
 Thu,  1 Aug 2019 08:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564640069; bh=WqmGxPladExekdIak2BjiLx/RLhhSY5Q/MrK3qm7J28=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=vXyb8vnv/4OatbUJUN85baRVU5/zANaa8+6g5p2ALmkeHYjGwGfNmdeKu09B+yDpR
 O3v/RUg8qWW70Hyi0Amg1zXZWv13BvbVDW3Su2dLWz8WoK4wEvQGhlx6E6my0a2Bzr
 0boSu6/nILzEoKf69wYKAlUlWAPL5ehfN4rQEUns=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 167EB8B879;
 Thu,  1 Aug 2019 08:14:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YWqG75p1GbCe; Thu,  1 Aug 2019 08:14:29 +0200 (CEST)
Received: from [172.25.230.101] (unknown [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DDE568B776;
 Thu,  1 Aug 2019 08:14:29 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc: Support CMDLINE_EXTEND
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 malat@debian.org
References: <20190801021206.26799-1-chris.packham@alliedtelesis.co.nz>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0a47ab71-d968-5aaa-6b5f-bd255d2565dd@c-s.fr>
Date: Thu, 1 Aug 2019 08:14:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801021206.26799-1-chris.packham@alliedtelesis.co.nz>
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



Le 01/08/2019 à 04:12, Chris Packham a écrit :
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
> ---
> While I'm at it does anyone think it's worth getting rid of the default CMDLINE
> value if CMDLINE_BOOL and maybe CMDLINE_BOOL? Every defconfig in the kernel
> that sets CMDLINE_BOOL=y also sets CMDLINE to something other than
> "console=ttyS0,9600 console=tty0 root=/dev/sda2". Removing CMDLINE_BOOL and
> unconditionally setting the default value of CMDLINE to "" would clean up the
> Kconfig even more.

Note 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cbe46bd4f5104552b612505b73d366f66efc2341 
which is already a step forward.

I guess that default is for users selecting this option manually to get 
a first sensitive CMDLINE. But is it really worth it ?

> 
> Changes in v2:
> - incorporate ideas from Christope's patch https://patchwork.ozlabs.org/patch/1074126/
> 
>   arch/powerpc/Kconfig            | 20 +++++++++++++++++++-
>   arch/powerpc/kernel/prom_init.c | 26 +++++++++++++++++++++++++-
>   2 files changed, 44 insertions(+), 2 deletions(-)
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
> index 514707ef6779..df29f141dbd2 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -310,6 +310,25 @@ static size_t __init prom_strlcpy(char *dest, const char *src, size_t size)
>   	return ret;
>   }
>   
> +static size_t __init prom_strlcat(char *dest, const char *src, size_t count)
> +{
> +	size_t dsize = prom_strlen(dest);
> +	size_t len = prom_strlen(src);
> +	size_t res = dsize + len;
> +
> +	/* This would be a bug */
> +	BUG_ON(dsize >= count);

Has you pointed in another mail, BUG_ON() should be avoided here.
I guess if the destination is already full, just return count:

if (dsize >= count)
	return count;

> +
> +	dest += dsize;
> +	count -= dsize;
> +	if (len >= count)
> +		len = count-1;
> +	memcpy(dest, src, len);
> +	dest[len] = 0;
> +	return res;
> +
> +}
> +
>   #ifdef CONFIG_PPC_PSERIES
>   static int __init prom_strtobool(const char *s, bool *res)
>   {
> @@ -761,8 +780,13 @@ static void __init early_cmdline_parse(void)
>   	p = prom_cmd_line;
>   	if ((long)prom.chosen > 0)
>   		l = prom_getprop(prom.chosen, "bootargs", p, COMMAND_LINE_SIZE-1);

The above is pointless in case CONFIG_CMDLINE_FORCE is selected.


> -	if (IS_ENABLED(CONFIG_CMDLINE_BOOL) && (l <= 0 || p[0] == '\0')) /* dbl check */
> +
> +	if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || l <= 0 || p[0] == '\0')
>   		prom_strlcpy(prom_cmd_line, CONFIG_CMDLINE, sizeof(prom_cmd_line));

If we can ensure that prom_cmd_line remains empty when 
CONFIG_CMDLINE_FORCE is selected (see above comment), then 
prom_strlcat() can be used in lieu of prom_strlcpy()

> +	else if (IS_ENABLED(CONFIG_CMDLINE_EXTEND))
> +		prom_strlcat(prom_cmd_line, " " CONFIG_CMDLINE,
> +			     sizeof(prom_cmd_line));
> +
>   	prom_printf("command line: %s\n", prom_cmd_line);
>   
>   #ifdef CONFIG_PPC64
> 

Christophe
