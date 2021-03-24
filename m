Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925E347CB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 16:32:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5C0r0sHNz3bwm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 02:32:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5C0W1BRyz2yxb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 02:32:23 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F5C0L2sW7z9v23n;
 Wed, 24 Mar 2021 16:32:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FoMssj87XpiI; Wed, 24 Mar 2021 16:32:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F5C0L1pWyz9v23m;
 Wed, 24 Mar 2021 16:32:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C1C068B82B;
 Wed, 24 Mar 2021 16:32:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IYkaSLfBGIjX; Wed, 24 Mar 2021 16:32:19 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A77598B812;
 Wed, 24 Mar 2021 16:32:18 +0100 (CET)
Subject: Re: [PATCH v2 4/7] CMDLINE: powerpc: convert to generic builtin
 command line
To: Daniel Walker <danielwa@cisco.com>
References: <20210309000247.2989531-5-danielwa@cisco.com>
 <c5c8b57e-7954-ec02-188a-7f85cb0af731@csgroup.eu>
 <20210309214051.GS109100@zorba>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9c5b8e33-026e-c9d6-c267-a5dd4a2b999c@csgroup.eu>
Date: Wed, 24 Mar 2021 16:31:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210309214051.GS109100@zorba>
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
Cc: Rob Herring <robh@kernel.org>, Ruslan Ruslichenko <rruslich@cisco.com>,
 Ruslan Bilovol <rbilovol@cisco.com>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 xe-linux-external@cisco.com, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/03/2021 à 22:40, Daniel Walker a écrit :
> On Tue, Mar 09, 2021 at 08:56:47AM +0100, Christophe Leroy wrote:
>>
>>
>> Le 09/03/2021 à 01:02, Daniel Walker a écrit :
>>> This updates the powerpc code to use the CONFIG_GENERIC_CMDLINE
>>> option.
>>>
>>> Cc: xe-linux-external@cisco.com
>>> Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
>>> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
>>> Signed-off-by: Daniel Walker <danielwa@cisco.com>
>>> ---
>>>    arch/powerpc/Kconfig            | 37 +--------------------------------
>>>    arch/powerpc/kernel/prom.c      |  1 +
>>>    arch/powerpc/kernel/prom_init.c | 35 ++++++++++++++++++-------------
>>>    3 files changed, 23 insertions(+), 50 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 107bb4319e0e..276b06d5c961 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -167,6 +167,7 @@ config PPC
>>>    	select EDAC_SUPPORT
>>>    	select GENERIC_ATOMIC64			if PPC32
>>>    	select GENERIC_CLOCKEVENTS_BROADCAST	if SMP
>>> +	select GENERIC_CMDLINE
>>>    	select GENERIC_CMOS_UPDATE
>>>    	select GENERIC_CPU_AUTOPROBE
>>>    	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
>>> @@ -906,42 +907,6 @@ config PPC_DENORMALISATION
>>>    	  Add support for handling denormalisation of single precision
>>>    	  values.  Useful for bare metal only.  If unsure say Y here.
>>> -config CMDLINE
>>> -	string "Initial kernel command string"
>>> -	default ""
>>> -	help
>>> -	  On some platforms, there is currently no way for the boot loader to
>>> -	  pass arguments to the kernel. For these platforms, you can supply
>>> -	  some command-line options at build time by entering them here.  In
>>> -	  most cases you will need to specify the root device here.
>>> -
>>> -choice
>>> -	prompt "Kernel command line type" if CMDLINE != ""
>>> -	default CMDLINE_FROM_BOOTLOADER
>>> -
>>> -config CMDLINE_FROM_BOOTLOADER
>>> -	bool "Use bootloader kernel arguments if available"
>>> -	help
>>> -	  Uses the command-line options passed by the boot loader. If
>>> -	  the boot loader doesn't provide any, the default kernel command
>>> -	  string provided in CMDLINE will be used.

I can't see how the above is supported in the generic builtin.

Taking into account that it is the default on powerpc, I'm having hardtime with that.

>>> -
>>> -config CMDLINE_EXTEND
>>> -	bool "Extend bootloader kernel arguments"
>>> -	help
>>> -	  The command-line arguments provided by the boot loader will be
>>> -	  appended to the default kernel command string.
>>> -
>>> -config CMDLINE_FORCE
>>> -	bool "Always use the default kernel command string"
>>> -	help
>>> -	  Always use the default kernel command string, even if the boot
>>> -	  loader passes other arguments to the kernel.
>>> -	  This is useful if you cannot or don't want to change the
>>> -	  command-line options your boot loader passes to the kernel.
>>> -
>>> -endchoice
>>> -
>>>    config EXTRA_TARGETS
>>>    	string "Additional default image types"
>>>    	help
>>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>>> index ae3c41730367..96d0a01be1b4 100644
>>> --- a/arch/powerpc/kernel/prom.c
>>> +++ b/arch/powerpc/kernel/prom.c
>>> @@ -27,6 +27,7 @@
>>>    #include <linux/irq.h>
>>>    #include <linux/memblock.h>
>>>    #include <linux/of.h>
>>> +#include <linux/cmdline.h>
>>
>> Why is this needed in prom.c ?
>   
> Must have been a mistake, I don't think it's needed.
> 
> 
>>>    #include <linux/of_fdt.h>
>>>    #include <linux/libfdt.h>
>>>    #include <linux/cpu.h>
>>> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
>>> index e9d4eb6144e1..657241534d69 100644
>>> --- a/arch/powerpc/kernel/prom_init.c
>>> +++ b/arch/powerpc/kernel/prom_init.c
>>> @@ -27,6 +27,7 @@
>>>    #include <linux/initrd.h>
>>>    #include <linux/bitops.h>
>>>    #include <linux/pgtable.h>
>>> +#include <linux/cmdline.h>
>>>    #include <asm/prom.h>
>>>    #include <asm/rtas.h>
>>>    #include <asm/page.h>
>>> @@ -242,15 +243,6 @@ static int __init prom_strcmp(const char *cs, const char *ct)
>>>    	return 0;
>>>    }
>>> -static char __init *prom_strcpy(char *dest, const char *src)
>>> -{
>>> -	char *tmp = dest;
>>> -
>>> -	while ((*dest++ = *src++) != '\0')
>>> -		/* nothing */;
>>> -	return tmp;
>>> -}
>>> -
>>
>> This game with prom_strcpy() should go a separate preceeding patch.
>>
>> Also, it looks like checkpatch.pl recommends to use strscpy() instead of strlcpy().
> 
> strscpy() is very large. I'm not sure it's compatible with this prom_init.c
> environment.

Ok you are right, lets keep strlcpy() and ignore checkpatch complaints

> 
>>>    static int __init prom_strncmp(const char *cs, const char *ct, size_t count)
>>>    {
>>>    	unsigned char c1, c2;
>>> @@ -276,6 +268,20 @@ static size_t __init prom_strlen(const char *s)
>>>    	return sc - s;
>>>    }
>>> +static size_t __init prom_strlcpy(char *dest, const char *src, size_t size)
>>> +{
>>> +	size_t ret = prom_strlen(src);
>>> +
>>> +	if (size) {
>>> +		size_t len = (ret >= size) ? size - 1 : ret;
>>> +
>>> +		memcpy(dest, src, len);
>>> +		dest[len] = '\0';
>>> +	}
>>> +	return ret;
>>> +}
>>> +
>>> +
>>>    static int __init prom_memcmp(const void *cs, const void *ct, size_t count)
>>>    {
>>>    	const unsigned char *su1, *su2;
>>> @@ -304,6 +310,7 @@ static char __init *prom_strstr(const char *s1, const char *s2)
>>>    	return NULL;
>>>    }
>>> +#ifdef GENERIC_CMDLINE_NEED_STRLCAT
>>>    static size_t __init prom_strlcat(char *dest, const char *src, size_t count)
>>>    {
>>>    	size_t dsize = prom_strlen(dest);
>>> @@ -323,6 +330,7 @@ static size_t __init prom_strlcat(char *dest, const char *src, size_t count)
>>>    	return res;
>>>    }
>>> +#endif
>>>    #ifdef CONFIG_PPC_PSERIES
>>>    static int __init prom_strtobool(const char *s, bool *res)
>>> @@ -775,12 +783,11 @@ static void __init early_cmdline_parse(void)
>>>    	prom_cmd_line[0] = 0;
>>>    	p = prom_cmd_line;
>>> -	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && (long)prom.chosen > 0)
>>> +	if ((long)prom.chosen > 0)
>>>    		l = prom_getprop(prom.chosen, "bootargs", p, COMMAND_LINE_SIZE-1);
>>> -	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) || l <= 0 || p[0] == '\0')
>>> -		prom_strlcat(prom_cmd_line, " " CONFIG_CMDLINE,
>>> -			     sizeof(prom_cmd_line));
>>> +	cmdline_add_builtin_custom(prom_cmd_line, (l > 0 ? p : NULL), sizeof(prom_cmd_line),
>>> +					__prombss, prom_strlcpy, prom_strlcat);
>>
>> So we are referencing a function that doesn't exist (namely prom_strlcat).
>> But it works because cmdline_add_builtin_custom() looks like a function but
>> is in fact an obscure macro that doesn't use prom_strlcat() unless
>> GENERIC_CMDLINE_NEED_STRLCAT is defined.
>>
>> IMHO that's awful for readability and code maintenance.
> 
> powerpc is a special case, there's no other users like this. The reason is
> because of all the difficulty in this prom_init.c code. A lot of the generic
> code has similar kind of changes to work across architectures.

Any feedback on the proposed changes I made on the 13th ? I know it is partly buggy but that was 
more for the principle. I can make clean working patch if it helps.

> 
> 
>>>    	prom_printf("command line: %s\n", prom_cmd_line);
>>> @@ -2706,7 +2713,7 @@ static void __init flatten_device_tree(void)
>>>    	/* Add "phandle" in there, we'll need it */
>>>    	namep = make_room(&mem_start, &mem_end, 16, 1);
>>> -	prom_strcpy(namep, "phandle");
>>> +	prom_strlcpy(namep, "phandle", 8);
>>
>> Should be in a separate patch.
> 
> I can move it, I missed that from the first round.
> 
> Daniel
> 

Christophe
