Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8401232CDD1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 08:41:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrjVH3dG9z3dF3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 18:41:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrjTQ3r56z3cLR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 18:40:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DrjTL1D2fz9txlV;
 Thu,  4 Mar 2021 08:40:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oIxs5nt3m7TD; Thu,  4 Mar 2021 08:40:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DrjTK2SSXz9txlT;
 Thu,  4 Mar 2021 08:40:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C97B8B7F9;
 Thu,  4 Mar 2021 08:40:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NzB03jS9KVhy; Thu,  4 Mar 2021 08:40:38 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7682A8B773;
 Thu,  4 Mar 2021 08:40:37 +0100 (CET)
Subject: Re: [PATCH 1/5] CMDLINE: add generic builtin command line
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20210304044803.812204-1-danielwa@cisco.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b8a5d908-4c1d-c183-e0c8-64e432a4bbff@csgroup.eu>
Date: Thu, 4 Mar 2021 08:40:36 +0100
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
> 
> The code in this commit unifies the code into a generic
> header file under the CONFIG_GENERIC_CMDLINE option. When this
> option is enabled the architecture can call the cmdline_add_builtin()
> to add the builtin command line.

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#32: FILE: include/linux/cmdline.h:1:
+#ifndef _LINUX_CMDLINE_H

CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#56: FILE: include/linux/cmdline.h:25:
+__cmdline_add_builtin(char *dest, const char *src, char *tmp, unsigned long length,
+		size_t (*strlcpy)(char *dest, const char *src, size_t size),

WARNING:STRLCPY: Prefer strscpy over strlcpy - see: 
https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
#61: FILE: include/linux/cmdline.h:30:
+		strlcpy(dest, " ", length);

WARNING:STRLCPY: Prefer strscpy over strlcpy - see: 
https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
#69: FILE: include/linux/cmdline.h:38:
+		strlcpy(tmp, CONFIG_CMDLINE_PREPEND " ", length);

WARNING:STRLCPY: Prefer strscpy over strlcpy - see: 
https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
#71: FILE: include/linux/cmdline.h:40:
+		strlcpy(dest, tmp, length);

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#75: FILE: include/linux/cmdline.h:44:
+#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) ^I^I^I\$

CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dest' - possible side-effects?
#75: FILE: include/linux/cmdline.h:44:
+#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) 			\
+{ 												\
+	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) { 						\
+		static label char cmdline_tmp_space[length]; 					\
+		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, strlcpy, strlcat); 	\
+	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) { 					\
+		__cmdline_add_builtin(dest, src, NULL, length, strlcpy, strlcat); 		\
+	} 											\
+}

CHECK:MACRO_ARG_REUSE: Macro argument reuse 'src' - possible side-effects?
#75: FILE: include/linux/cmdline.h:44:
+#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) 			\
+{ 												\
+	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) { 						\
+		static label char cmdline_tmp_space[length]; 					\
+		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, strlcpy, strlcat); 	\
+	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) { 					\
+		__cmdline_add_builtin(dest, src, NULL, length, strlcpy, strlcat); 		\
+	} 											\
+}

CHECK:MACRO_ARG_REUSE: Macro argument reuse 'length' - possible side-effects?
#75: FILE: include/linux/cmdline.h:44:
+#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) 			\
+{ 												\
+	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) { 						\
+		static label char cmdline_tmp_space[length]; 					\
+		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, strlcpy, strlcat); 	\
+	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) { 					\
+		__cmdline_add_builtin(dest, src, NULL, length, strlcpy, strlcat); 		\
+	} 											\
+}

CHECK:MACRO_ARG_REUSE: Macro argument reuse 'strlcpy' - possible side-effects?
#75: FILE: include/linux/cmdline.h:44:
+#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) 			\
+{ 												\
+	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) { 						\
+		static label char cmdline_tmp_space[length]; 					\
+		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, strlcpy, strlcat); 	\
+	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) { 					\
+		__cmdline_add_builtin(dest, src, NULL, length, strlcpy, strlcat); 		\
+	} 											\
+}

CHECK:MACRO_ARG_REUSE: Macro argument reuse 'strlcat' - possible side-effects?
#75: FILE: include/linux/cmdline.h:44:
+#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) 			\
+{ 												\
+	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) { 						\
+		static label char cmdline_tmp_space[length]; 					\
+		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, strlcpy, strlcat); 	\
+	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) { 					\
+		__cmdline_add_builtin(dest, src, NULL, length, strlcpy, strlcat); 		\
+	} 											\
+}

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#76: FILE: include/linux/cmdline.h:45:
+{ ^I^I^I^I^I^I^I^I^I^I^I^I\$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#77: FILE: include/linux/cmdline.h:46:
+^Iif (sizeof(CONFIG_CMDLINE_PREPEND) > 1) { ^I^I^I^I^I^I\$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#78: FILE: include/linux/cmdline.h:47:
+^I^Istatic label char cmdline_tmp_space[length]; ^I^I^I^I^I\$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#79: FILE: include/linux/cmdline.h:48:
+^I^I__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, strlcpy, strlcat); ^I\$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#80: FILE: include/linux/cmdline.h:49:
+^I} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) { ^I^I^I^I^I\$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#81: FILE: include/linux/cmdline.h:50:
+^I^I__cmdline_add_builtin(dest, src, NULL, length, strlcpy, strlcat); ^I^I\$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#82: FILE: include/linux/cmdline.h:51:
+^I} ^I^I^I^I^I^I^I^I^I^I^I\$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#88: FILE: include/linux/cmdline.h:57:
+{^I^I^I^I^I^I^I^I  ^I   \$

WARNING:STRLCPY: Prefer strscpy over strlcpy - see: 
https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
#89: FILE: include/linux/cmdline.h:58:
+	strlcpy(dest, CONFIG_CMDLINE_PREPEND " " CONFIG_CMDLINE_APPEND,    \

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#90: FILE: include/linux/cmdline.h:59:
+^I^Ilength);^I^I   ^I^I^I^I   \$

CHECK:MACRO_ARG_REUSE: Macro argument reuse 'src' - possible side-effects?
#95: FILE: include/linux/cmdline.h:64:
+#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) { \
+	if (src != NULL) 							 \
+		strlcpy(dest, src, length);	 				 \
+}

CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'src' may be better as '(src)' to avoid precedence issues
#95: FILE: include/linux/cmdline.h:64:
+#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) { \
+	if (src != NULL) 							 \
+		strlcpy(dest, src, length);	 				 \
+}

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#96: FILE: include/linux/cmdline.h:65:
+^Iif (src != NULL) ^I^I^I^I^I^I^I \$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#97: FILE: include/linux/cmdline.h:66:
+^I^Istrlcpy(dest, src, length);^I ^I^I^I^I \$

WARNING:STRLCPY: Prefer strscpy over strlcpy - see: 
https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
#97: FILE: include/linux/cmdline.h:66:
+		strlcpy(dest, src, length);	 				 \

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#100: FILE: include/linux/cmdline.h:69:
+#define cmdline_add_builtin(dest, src, length) { ^I^I^I^I\$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#101: FILE: include/linux/cmdline.h:70:
+^Icmdline_add_builtin_custom(dest, src, length, strlcpy, strlcat); ^I\$

total: 0 errors, 20 warnings, 8 checks, 149 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or --fix-inplace.

the.patch has style problems, please review.

NOTE: Ignored message types: ARCH_INCLUDE_LINUX BIT_MACRO COMPARISON_TO_NULL DT_SPLIT_BINDING_PATCH 
EMAIL_SUBJECT FILE_PATH_CHANGES GLOBAL_INITIALISERS LINE_SPACING MULTIPLE_ASSIGNMENTS

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.


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
> +/*
> + * This function will append or prepend a builtin command line to the command
> + * line provided by the bootloader. Kconfig options can be used to alter
> + * the behavior of this builtin command line.
> + * @dest: The destination of the final appended/prepended string
> + * @src: The starting string or NULL if there isn't one.
> + * @tmp: temporary space used for prepending
> + * @length: the maximum length of the strings above.
> + */
> +static inline void
> +__cmdline_add_builtin(char *dest, const char *src, char *tmp, unsigned long length,
> +		size_t (*strlcpy)(char *dest, const char *src, size_t size),
> +		size_t (*strlcat)(char *dest, const char *src, size_t count)
> +		)
> +{
> +	if (src != dest && src != NULL) {
> +		strlcpy(dest, " ", length);
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
> +	}
> +}
> +
> +#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) 			\
> +{ 												\
> +	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) { 						\
> +		static label char cmdline_tmp_space[length]; 					\
> +		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, strlcpy, strlcat); 	\
> +	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) { 					\
> +		__cmdline_add_builtin(dest, src, NULL, length, strlcpy, strlcat); 		\
> +	} 											\
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
