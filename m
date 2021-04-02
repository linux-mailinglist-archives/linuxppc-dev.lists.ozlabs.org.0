Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F90352E44
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 19:29:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBn950CPxz3c79
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 04:29:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBn8k32v6z3bnx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 04:28:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBn8Y50v7z9v3qQ;
 Fri,  2 Apr 2021 19:28:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id L7ilypF0b3f4; Fri,  2 Apr 2021 19:28:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBn8Y3vtHz9v3gF;
 Fri,  2 Apr 2021 19:28:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AE9D58BB77;
 Fri,  2 Apr 2021 19:28:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IcQEBCei7ZAe; Fri,  2 Apr 2021 19:28:47 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 498158BB6F;
 Fri,  2 Apr 2021 19:28:46 +0200 (CEST)
Subject: Re: [PATCH 1/8] CMDLINE: add generic builtin command line
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b80403de-a695-2919-5910-cbbe03f2b289@csgroup.eu>
Date: Fri, 2 Apr 2021 19:28:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
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
Cc: Ruslan Bilovol <rbilovol@cisco.com>, linux-kernel@vger.kernel.org,
 xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/03/2021 à 19:56, Daniel Walker a écrit :
> This code allows architectures to use a generic builtin command line.
> The state of the builtin command line options across architecture is
> diverse. MIPS and X86 once has similar systems, then mips added some
> options to allow extending the command line. Powerpc did something
> simiar in adding the ability to extend. Even with mips and powerpc
> enhancement the needs of Cisco are not met on these platforms.

Can you explain in the commit what is the need ? Nobody mind "who" needs it I think, but "what" is 
needed would be valuable to know.

> 
> The code in this commit unifies the code into a generic
> header file under the CONFIG_GENERIC_CMDLINE option. When this
> option is enabled the architecture can call the cmdline_add_builtin()
> to add the builtin command line.
> 
> This unified implementation offers the same functionality needed by
> Cisco on all platform which use it.

Cisco cisco cisco ... Can we avoid mentionning companies like this ? I can't see patches mentioning 
google or IBM or other companies to that extend.

> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>   include/linux/cmdline.h | 98 +++++++++++++++++++++++++++++++++++++++++
>   init/Kconfig            | 72 ++++++++++++++++++++++++++++++
>   2 files changed, 170 insertions(+)
>   create mode 100644 include/linux/cmdline.h
> 
> diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
> new file mode 100644
> index 000000000000..439c4585feba
> --- /dev/null
> +++ b/include/linux/cmdline.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_CMDLINE_H
> +#define _LINUX_CMDLINE_H
> +
> +/*
> + *
> + * Copyright (C) 2006,2021. Cisco Systems, Inc.
> + *
> + * Generic Append/Prepend cmdline support.
> + */
> +
> +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_CMDLINE_BOOL)
> +
> +#ifndef CONFIG_CMDLINE_OVERRIDE
> +#define GENERIC_CMDLINE_NEED_STRLCAT

Does it matter ?

Only powerpc needs that really. And prom_strlcat() is there anyway, so why not just use it when 
needed and rely on GCC to optimise it out when possible ?


> +#define CMDLINE_PREPEND CONFIG_CMDLINE_PREPEND
> +#define CMDLINE_APPEND CONFIG_CMDLINE_APPEND

What are those defines used for ?

> +
> +/*
> + * This function will append or prepend a builtin command line to the command
> + * line provided by the bootloader. Kconfig options can be used to alter
> + * the behavior of this builtin command line.
> + * @dest: The destination of the final appended/prepended string
> + * @src: The starting string or NULL if there isn't one.
> + * @tmp: temporary space used for prepending
> + * @length: the maximum length of the strings above.
> + * @cmdline_strlcpy: point to a compatible strlcpy
> + * @cmdline_strlcat: point to a compatible strlcat
> + */
> +static inline void
> +__cmdline_add_builtin(char *dest, const char *src, char *tmp, unsigned long length,
> +		size_t (*cmdline_strlcpy)(char *dest, const char *src, size_t size),
> +		size_t (*cmdline_strlcat)(char *dest, const char *src, size_t count))

I still can see the advantage of passing strlcpy and strlcat as functions to the function.

Can we instead use macros defined by default that can be overriden by powerpc ?

Something like

#ifndef cmdline_strlcat
#define cmdline_strlcat strlcat
#define cmdline_strlcpy strlcpy
#endif

> +{
> +	if (src != dest && src != NULL) {
> +		cmdline_strlcpy(dest, " ", length);
> +		cmdline_strlcat(dest, src, length);
> +	}
> +
> +	if (sizeof(CONFIG_CMDLINE_APPEND) > 1)
> +		cmdline_strlcat(dest, " " CONFIG_CMDLINE_APPEND, length);
> +
> +	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) {
> +		cmdline_strlcpy(tmp, CONFIG_CMDLINE_PREPEND " ", length);
> +		cmdline_strlcat(tmp, dest, length);
> +		cmdline_strlcpy(dest, tmp, length);
> +	}
> +}
> +
> +#define cmdline_add_builtin_custom(dest, src, length, label, cmdline_strlcpy, cmdline_strlcat)			\
> +{														\
> +	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) {								\
> +		static label char cmdline_tmp_space[length];							\
> +		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, cmdline_strlcpy, cmdline_strlcat);	\
> +	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) {								\
> +		__cmdline_add_builtin(dest, src, NULL, length, cmdline_strlcpy, cmdline_strlcat);		\
> +	}													\
> +}

I still don't like passing section names to a macro that way, just for powerpc.
That tmp space is only needed when source and destination are identical, and it is easy to ensure 
powerpc doesn't need that. For others, just use __initdata section.

Also the variable length is not really necessary, only COMMAND_LINE_SIZE is used everywhere.

> +#define cmdline_add_builtin(dest, src, length)	\
> +	cmdline_add_builtin_custom(dest, src, length, __initdata, strlcpy, strlcat)
> +
> +#else /* CONFIG_CMDLINE_OVERRIDE */
> +
> +#define CMDLINE_PREPEND CONFIG_CMDLINE_PREPEND
> +#define CMDLINE_APPEND CONFIG_CMDLINE_APPEND
> +
> +static inline void
> +__cmdline_add_builtin_custom(char *dest, const char *src, unsigned long length,
> +		size_t (*cmdline_strlcpy)(char *dest, const char *src, size_t size))
> +{
> +	cmdline_strlcpy(dest, CONFIG_CMDLINE_PREPEND " " CONFIG_CMDLINE_APPEND, length);
> +}
> +#define cmdline_add_builtin_custom(dest, src, length, label, cmdline_strlcpy, cmdline_strlcat)	\
> +	__cmdline_add_builtin_custom(dest, src, length, cmdline_strlcpy)
> +#define cmdline_add_builtin(dest, src, length)	\
> +	__cmdline_add_builtin_custom(dest, src, length, strlcpy)
> +#endif /* !CONFIG_CMDLINE_OVERRIDE */
> +
> +#else /* !CONFIG_GENERIC_CMDLINE || !CONFIG_CMDLINE_BOOL */
> +
> +#define CMDLINE_PREPEND ""
> +#define CMDLINE_APPEND ""
> +
> +static inline void
> +__cmdline_add_builtin_custom(char *dest, const char *src, unsigned long length,
> +		size_t (*cmdline_strlcpy)(char *dest, const char *src, size_t size))
> +{
> +	if (src != NULL)
> +		cmdline_strlcpy(dest, src, length);
> +}
> +#define cmdline_add_builtin_custom(dest, src, length, label, cmdline_strlcpy, cmdline_strlcat)	\
> +	__cmdline_add_builtin_custom(dest, src, length, cmdline_strlcpy)
> +#define cmdline_add_builtin(dest, src, length)	\
> +	__cmdline_add_builtin_custom(dest, src, length, strlcpy)	\
> +
> +#endif /* CONFIG_GENERIC_CMDLINE */

There are too many alternatives, they could be easily refactored to a single instance reducing the 
number of #ifdefs.

> +
> +#endif /* _LINUX_CMDLINE_H */
> diff --git a/init/Kconfig b/init/Kconfig
> index 5f5c776ef192..84f06f62550a 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2034,6 +2034,78 @@ config PROFILING
>   config TRACEPOINTS
>   	bool
>   
> +config GENERIC_CMDLINE
> +	bool
> +
> +config GENERIC_CMDLINE_OF
> +	bool

Oh ? A new one ? What do we need something special for OF ?

> +
> +
> +if GENERIC_CMDLINE
> +
> +config CMDLINE_BOOL
> +	bool "Built-in kernel command line"
> +	help
> +	  Allow for specifying boot arguments to the kernel at
> +	  build time.  On some systems (e.g. embedded ones), it is
> +	  necessary or convenient to provide some or all of the
> +	  kernel boot arguments with the kernel itself (that is,
> +	  to not rely on the boot loader to provide them.)
> +
> +	  To compile command line arguments into the kernel,
> +	  set this option to 'Y', then fill in the
> +	  the boot arguments in CONFIG_CMDLINE.
> +
> +	  Systems with fully functional boot loaders (i.e. non-embedded)
> +	  should leave this option set to 'N'.
> +
> +config CMDLINE_APPEND
> +	string "Built-in kernel command string append"
> +	depends on CMDLINE_BOOL
> +	default ""

By doing the following instead of using depends

	string "Built-in kernel command string append" if CMDLINE_BOOL
	default ""

you could have CMDLINE_APPEND defined all the time and avoid related #ifdefs.

> +	help
> +	  Enter arguments here that should be compiled into the kernel
> +	  image and used at boot time.  If the boot loader provides a
> +	  command line at boot time, this string is appended to it to
> +	  form the full kernel command line, when the system boots.
> +
> +	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
> +	  change this behavior.
> +
> +	  In most cases, the command line (whether built-in or provided
> +	  by the boot loader) should specify the device for the root
> +	  file system.
> +
> +config CMDLINE_PREPEND
> +	string "Built-in kernel command string prepend"
> +	depends on CMDLINE_BOOL
> +	default ""

Same


> +	help
> +	  Enter arguments here that should be compiled into the kernel
> +	  image and used at boot time.  If the boot loader provides a
> +	  command line at boot time, this string is prepended to it to
> +	  form the full kernel command line, when the system boots.
> +
> +	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
> +	  change this behavior.
> +
> +	  In most cases, the command line (whether built-in or provided
> +	  by the boot loader) should specify the device for the root
> +	  file system.
> +
> +config CMDLINE_OVERRIDE

Most platforms use CMDLINE_FORCE. Why change the majority to minority ?

> +	bool "Built-in command line overrides boot loader arguments"
> +	depends on CMDLINE_BOOL
> +	help
> +	  Set this option to 'Y' to have the kernel ignore the boot loader
> +	  command line, and use ONLY the built-in command line. In this case
> +	  append and prepend strings are concatenated to form the full
> +	  command line.
> +
> +	  This is used to work around broken boot loaders.  This should
> +	  be set to 'N' under normal conditions.
> +endif
> +

Looks like we are still missing the one used at least by powerpc today: CMDLINE_DEFAULT_BOOTLOADER, 
which uses bootloader arguments if provided, builtin arguments otherwise.

>   endmenu		# General setup
>   
>   source "arch/Kconfig"
> 
