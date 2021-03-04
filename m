Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F7132CD42
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 08:02:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drhct4h2Dz3dG6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 18:02:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrhbX3XRlz30Nh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 18:00:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DrhbP2wMDz9v1Mh;
 Thu,  4 Mar 2021 08:00:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id q2gLmLW1LtAi; Thu,  4 Mar 2021 08:00:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DrhbP1M63z9v1Mg;
 Thu,  4 Mar 2021 08:00:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6390D8B7F5;
 Thu,  4 Mar 2021 08:00:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CsaKbGkrdrkk; Thu,  4 Mar 2021 08:00:50 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E7348B773;
 Thu,  4 Mar 2021 08:00:49 +0100 (CET)
Subject: Re: [PATCH 1/5] CMDLINE: add generic builtin command line
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20210304044803.812204-1-danielwa@cisco.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <da33aa9e-ffd8-b012-0f2d-c9ad05f32b8f@csgroup.eu>
Date: Thu, 4 Mar 2021 08:00:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304044803.812204-1-danielwa@cisco.com>
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



Le 04/03/2021 à 05:47, Daniel Walker a écrit :
> This code allows architectures to use a generic builtin command line.
> The state of the builtin command line options across architecture is
> diverse. On x86 and mips they have pretty much the same code and the
> code prepends the builtin command line onto the boot loader provided
> one. On powerpc there is only a builtin override and nothing else.

This is not exact. powerpc has:
CONFIG_FROM_BOOTLOADER
CONFIG_EXTEND
CONFIG_FORCE

> 
> The code in this commit unifies the code into a generic
> header file under the CONFIG_GENERIC_CMDLINE option. When this
> option is enabled the architecture can call the cmdline_add_builtin()
> to add the builtin command line.
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>   include/linux/cmdline.h | 75 +++++++++++++++++++++++++++++++++++++++++
>   init/Kconfig            | 68 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 143 insertions(+)
>   create mode 100644 include/linux/cmdline.h
> 
> diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
> new file mode 100644
> index 000000000000..f44011d1a9ee
> --- /dev/null
> +++ b/include/linux/cmdline.h
> @@ -0,0 +1,75 @@

Missing the SPDX Licence Identifier

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

I think it would be better if we can avoid the CONFIG_CMDLINE_BOOL.
By making the CMDLINEs default to "" at all time, I think we can about that BOOL.

> +
> +#ifndef CONFIG_CMDLINE_OVERRIDE
> +/*
> + * This function will append or prepend a builtin command line to the command

As far as I understand, it doesn't "append _or_ prepend" but it does "append _and_ prepend"

> + * line provided by the bootloader. Kconfig options can be used to alter
> + * the behavior of this builtin command line.
> + * @dest: The destination of the final appended/prepended string
> + * @src: The starting string or NULL if there isn't one.
> + * @tmp: temporary space used for prepending
> + * @length: the maximum length of the strings above.

Missing some parameters here, but I think we should avoid those 'strlcpy' and 'strlcat', see later 
comment.

> + */
> +static inline void
> +__cmdline_add_builtin(char *dest, const char *src, char *tmp, unsigned long length,
> +		size_t (*strlcpy)(char *dest, const char *src, size_t size),
> +		size_t (*strlcat)(char *dest, const char *src, size_t count)

Don't use names that overide names of existing functions.

'count' is __kernel_size_t not size_t

> +		)
> +{
> +	if (src != dest && src != NULL) {
> +		strlcpy(dest, " ", length);

Why do you need a space up front in that case ? Why not just copy the source to the destination ?

> +		strlcat(dest, src, length);
> +	}
> +
> +	if (sizeof(CONFIG_CMDLINE_APPEND) > 1)
> +		strlcat(dest, " " CONFIG_CMDLINE_APPEND, length);
> +
> +	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) {
> +		strlcpy(tmp, CONFIG_CMDLINE_PREPEND " ", length);
> +		strlcat(tmp, dest, length);
> +		strlcpy(dest, tmp, length);

Could we use memmove(), or implement strmove() and avoid the temporary buffer at all ?

> +	}
> +}
> +
> +#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) 			\

It is misleading to call parameters 'strlcpy' or 'strlcat', it hides that they are overriden.

> +{ 												\
> +	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) { 						\
> +		static label char cmdline_tmp_space[length]; 					\

Let the architecture define the temporary space when using the custom variant instead of just asking 
the architecture to provide the name of the section to use. powerpc already have prom_scratch for that.

> +		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, strlcpy, strlcat); 	\
> +	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) { 					\
> +		__cmdline_add_builtin(dest, src, NULL, length, strlcpy, strlcat); 		\
> +	} 											\

Ah, so if I understand correctly, the user can set both CONFIG_CMDLINE_PREPEND and 
CONFIG_CMDLINE_APPEND but one of them is silently ignored.

Then I think we should just offer the user to set one, name it CONFIG_CMDLINE then ask him to choose 
between FORCE, APPEND or PREPEND.

> +}
> +#define cmdline_add_builtin(dest, src, length)	                           \
> +	cmdline_add_builtin_custom(dest, src, length, __initdata, &strlcpy, &strlcat)
> +#else
> +#define cmdline_add_builtin(dest, src, length)				   \
> +{								  	   \
> +	strlcpy(dest, CONFIG_CMDLINE_PREPEND " " CONFIG_CMDLINE_APPEND,    \
> +		length);		   				   \
> +}
> +#endif /* !CONFIG_CMDLINE_OVERRIDE */
> +
> +#else
> +#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) { \
> +	if (src != NULL) 							 \
> +		strlcpy(dest, src, length);	 				 \
> +}
> +
> +#define cmdline_add_builtin(dest, src, length) { 				\
> +	cmdline_add_builtin_custom(dest, src, length, strlcpy, strlcat); 	\
> +}
> +#endif /* CONFIG_GENERIC_CMDLINE */

I'd rather avoid all those macros and use static inline functions instead.

For the strlcpy() and strlcat(), use another name, for instance cmdline_strlcpy and cmdline_strlcat. 
Then at the begining of the file, define them as strlcpy ad strlcat unless they are already defined 
to something else (by the architecture before including cmdline.h).

> +
> +
> +#endif /* _LINUX_CMDLINE_H */
> diff --git a/init/Kconfig b/init/Kconfig
> index 29ad68325028..28363ab07cd4 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2032,6 +2032,74 @@ config PROFILING
>   config TRACEPOINTS
>   	bool
>   
> +config GENERIC_CMDLINE
> +	bool
> +
> +if GENERIC_CMDLINE
> +
> +config CMDLINE_BOOL
> +	bool "Built-in kernel command line"

We don't need the CMDLINE_BOOL, just have CMDLINE always "" by default.

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

As far as I understand, the generic code will only take CMDLINE_APPEND into account if 
CMDLINE_PREPEND doesn't exist, otherwise it will silently ignore it.

Only offer one string: CONFIG_CMDLINE, and make the use choose between APPEND, EXTEND or OVERRIDE

> +	string "Built-in kernel command string append"
> +	depends on CMDLINE_BOOL
> +	default ""
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
>   endmenu		# General setup
>   
>   source "arch/Kconfig"
> 

Christophe
