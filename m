Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5A732CDB6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 08:38:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrjRN26WJz3d6S
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 18:38:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrjR328DTz2xxx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 18:38:37 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DrjQx2mZjz9tvrS;
 Thu,  4 Mar 2021 08:38:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DHqGWtfSMOLu; Thu,  4 Mar 2021 08:38:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DrjQx0RNtz9tvrL;
 Thu,  4 Mar 2021 08:38:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 78A6D8B7F6;
 Thu,  4 Mar 2021 08:38:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0KzNR-gx8ayW; Thu,  4 Mar 2021 08:38:34 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B1D18B773;
 Thu,  4 Mar 2021 08:38:33 +0100 (CET)
Subject: Re: [PATCH 3/5] CMDLINE: powerpc: convert to generic builtin command
 line
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <20210304044803.812204-3-danielwa@cisco.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <29d9fd14-7910-e0d6-1ee5-c95e643f7a00@csgroup.eu>
Date: Thu, 4 Mar 2021 08:38:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304044803.812204-3-danielwa@cisco.com>
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
Cc: Ruslan Ruslichenko <rruslich@cisco.com>,
 Ruslan Bilovol <rbilovol@cisco.com>, linux-kernel@vger.kernel.org,
 xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/03/2021 à 05:48, Daniel Walker a écrit :
> This updates the powerpc code to use the CONFIG_GENERIC_CMDLINE
> option.

In file included from arch/powerpc/kernel/prom_init.c:30:
arch/powerpc/kernel/prom_init.c: In function 'early_cmdline_parse':
arch/powerpc/kernel/prom_init.c:788:17: error: lvalue required as unary '&' operand
   788 |      __prombss, &prom_strlcpy, &prom_strlcat);
       |                 ^
./include/linux/cmdline.h:66:3: note: in definition of macro 'cmdline_add_builtin_custom'
    66 |   strlcpy(dest, src, length);       \
       |   ^~~~~~~
At top level:
arch/powerpc/kernel/prom_init.c:312:22: error: 'prom_strlcat' defined but not used 
[-Werror=unused-function]
   312 | static size_t __init prom_strlcat(char *dest, const char *src, size_t count)
       |                      ^~~~~~~~~~~~
cc1: all warnings being treated as errors
make[2]: *** [scripts/Makefile.build:279: arch/powerpc/kernel/prom_init.o] Error 1
make[1]: *** [scripts/Makefile.build:496: arch/powerpc/kernel] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1805: arch/powerpc] Error 2
make: *** Waiting for unfinished jobs....

> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>   arch/powerpc/Kconfig            | 37 +--------------------------------
>   arch/powerpc/kernel/prom.c      |  1 +
>   arch/powerpc/kernel/prom_init.c | 31 +++++++++++++++------------
>   3 files changed, 20 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 107bb4319e0e..276b06d5c961 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -167,6 +167,7 @@ config PPC
>   	select EDAC_SUPPORT
>   	select GENERIC_ATOMIC64			if PPC32
>   	select GENERIC_CLOCKEVENTS_BROADCAST	if SMP
> +	select GENERIC_CMDLINE
>   	select GENERIC_CMOS_UPDATE
>   	select GENERIC_CPU_AUTOPROBE
>   	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
> @@ -906,42 +907,6 @@ config PPC_DENORMALISATION
>   	  Add support for handling denormalisation of single precision
>   	  values.  Useful for bare metal only.  If unsure say Y here.
>   
> -config CMDLINE
> -	string "Initial kernel command string"
> -	default ""
> -	help
> -	  On some platforms, there is currently no way for the boot loader to
> -	  pass arguments to the kernel. For these platforms, you can supply
> -	  some command-line options at build time by entering them here.  In
> -	  most cases you will need to specify the root device here.
> -
> -choice
> -	prompt "Kernel command line type" if CMDLINE != ""
> -	default CMDLINE_FROM_BOOTLOADER
> -
> -config CMDLINE_FROM_BOOTLOADER
> -	bool "Use bootloader kernel arguments if available"
> -	help
> -	  Uses the command-line options passed by the boot loader. If
> -	  the boot loader doesn't provide any, the default kernel command
> -	  string provided in CMDLINE will be used.
> -
> -config CMDLINE_EXTEND
> -	bool "Extend bootloader kernel arguments"
> -	help
> -	  The command-line arguments provided by the boot loader will be
> -	  appended to the default kernel command string.
> -
> -config CMDLINE_FORCE
> -	bool "Always use the default kernel command string"
> -	help
> -	  Always use the default kernel command string, even if the boot
> -	  loader passes other arguments to the kernel.
> -	  This is useful if you cannot or don't want to change the
> -	  command-line options your boot loader passes to the kernel.
> -
> -endchoice
> -
>   config EXTRA_TARGETS
>   	string "Additional default image types"
>   	help
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index ae3c41730367..96d0a01be1b4 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -27,6 +27,7 @@
>   #include <linux/irq.h>
>   #include <linux/memblock.h>
>   #include <linux/of.h>
> +#include <linux/cmdline.h>
>   #include <linux/of_fdt.h>
>   #include <linux/libfdt.h>
>   #include <linux/cpu.h>
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index e9d4eb6144e1..d752be688b62 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -27,6 +27,7 @@
>   #include <linux/initrd.h>
>   #include <linux/bitops.h>
>   #include <linux/pgtable.h>
> +#include <linux/cmdline.h>
>   #include <asm/prom.h>
>   #include <asm/rtas.h>
>   #include <asm/page.h>
> @@ -242,15 +243,6 @@ static int __init prom_strcmp(const char *cs, const char *ct)
>   	return 0;
>   }
>   
> -static char __init *prom_strcpy(char *dest, const char *src)
> -{
> -	char *tmp = dest;
> -
> -	while ((*dest++ = *src++) != '\0')
> -		/* nothing */;
> -	return tmp;
> -}
> -
>   static int __init prom_strncmp(const char *cs, const char *ct, size_t count)
>   {
>   	unsigned char c1, c2;
> @@ -276,6 +268,19 @@ static size_t __init prom_strlen(const char *s)
>   	return sc - s;
>   }
>   
> +static size_t __init prom_strlcpy(char *dest, const char *src, size_t size)
> +{
> +	size_t ret = prom_strlen(src);
> +
> +	if (size) {
> +		size_t len = (ret >= size) ? size - 1 : ret;
> +		memcpy(dest, src, len);
> +		dest[len] = '\0';
> +	}
> +	return ret;
> +}
> +
> +
>   static int __init prom_memcmp(const void *cs, const void *ct, size_t count)
>   {
>   	const unsigned char *su1, *su2;
> @@ -778,9 +783,9 @@ static void __init early_cmdline_parse(void)
>   	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && (long)prom.chosen > 0)
>   		l = prom_getprop(prom.chosen, "bootargs", p, COMMAND_LINE_SIZE-1);
>   
> -	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) || l <= 0 || p[0] == '\0')
> -		prom_strlcat(prom_cmd_line, " " CONFIG_CMDLINE,
> -			     sizeof(prom_cmd_line));
> +	if (l <= 0 || p[0] == '\0') /* dbl check */
> +		cmdline_add_builtin_custom(prom_cmd_line, NULL, sizeof(prom_cmd_line),
> +					__prombss, &prom_strlcpy, &prom_strlcat);
>   
>   	prom_printf("command line: %s\n", prom_cmd_line);
>   
> @@ -2706,7 +2711,7 @@ static void __init flatten_device_tree(void)
>   
>   	/* Add "phandle" in there, we'll need it */
>   	namep = make_room(&mem_start, &mem_end, 16, 1);
> -	prom_strcpy(namep, "phandle");
> +	prom_strlcpy(namep, "phandle", 8);
>   	mem_start = (unsigned long)namep + prom_strlen(namep) + 1;
>   
>   	/* Build string array */
> 
