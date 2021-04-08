Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C810358D96
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 21:42:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGWql1fFwz3bVM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 05:42:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.176;
 helo=mail-oi1-f176.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGWqP59kXz2xZc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 05:41:52 +1000 (AEST)
Received: by mail-oi1-f176.google.com with SMTP id n8so3357777oie.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 12:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FITwZl80gS3YR2FZtlgpQ5oYWS85Ct2sijj6jggUvFY=;
 b=eE3Q+YQOBRt4JTv1JIIKvcTop2T61jxnJHawZWFCyqwCLvPLQznca6TbbVM/Re6LCp
 SOADJ9Sn6qpkM9tiz3ifCFXzb9fHq5V8sx30RNB8+sgzJ0Jwtx76jFTqw5xQTBj/nNLL
 mitwfYg5uIF29doPZWUTjKIshwmz8XKq2UOdxcELhzgF+bqlIX9sag8x601uPvdMEJN8
 tWjvsR/2skbXJQFVkTOOmiLL0/llBAQLbuPr7DrZAe53mVsFgRghGgYdg44LxyjK8ib1
 n4IFSoyYYQ9fVjVByQFPhbwF0E3jSDxLZ47TUa4kM8WAfuMUft0nF8r05FLAutMvkl9+
 oTyA==
X-Gm-Message-State: AOAM531vEeZN3Q2qNxWr/XTIjEerY1Z4VpQ99uxK+rsPbYTR3+wP9Nol
 br2GHXV0D2x6VmOPx1rG/g==
X-Google-Smtp-Source: ABdhPJws8AH5mE+MDBnJXs7fKUy6WuwH3lOBsNvmWgFCUyZHpaJjOknPdkw2lABZOuOUgpOplmGZIg==
X-Received: by 2002:aca:4ad2:: with SMTP id x201mr7515600oia.46.1617910910592; 
 Thu, 08 Apr 2021 12:41:50 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y10sm72595oto.18.2021.04.08.12.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 12:41:49 -0700 (PDT)
Received: (nullmailer pid 1844346 invoked by uid 1000);
 Thu, 08 Apr 2021 19:41:48 -0000
Date: Thu, 8 Apr 2021 14:41:48 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 18/20] x86: Convert to GENERIC_CMDLINE
Message-ID: <20210408194148.GB1724284@robh.at.kernel.org>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <ab0fd4477964cdbf99e3dd2965a455aa3e738e4b.1617375802.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab0fd4477964cdbf99e3dd2965a455aa3e738e4b.1617375802.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, arnd@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 openrisc@lists.librecores.org, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, akpm@linux-foundation.org, will@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 danielwa@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 02, 2021 at 03:18:20PM +0000, Christophe Leroy wrote:
> This converts the architecture to GENERIC_CMDLINE.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/x86/Kconfig        | 45 ++---------------------------------------
>  arch/x86/kernel/setup.c | 17 ++--------------
>  2 files changed, 4 insertions(+), 58 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index a20684d56b4b..66b384228ca3 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -104,6 +104,7 @@ config X86
>  	select ARCH_USE_QUEUED_SPINLOCKS
>  	select ARCH_USE_SYM_ANNOTATIONS
>  	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> +	select ARCH_WANT_CMDLINE_PREPEND_BY_DEFAULT

Seems to be non-existent kconfig option.

>  	select ARCH_WANT_DEFAULT_BPF_JIT	if X86_64
>  	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
>  	select ARCH_WANT_HUGE_PMD_SHARE
> @@ -118,6 +119,7 @@ config X86
>  	select EDAC_SUPPORT
>  	select GENERIC_CLOCKEVENTS_BROADCAST	if X86_64 || (X86_32 && X86_LOCAL_APIC)
>  	select GENERIC_CLOCKEVENTS_MIN_ADJUST
> +	select GENERIC_CMDLINE
>  	select GENERIC_CMOS_UPDATE
>  	select GENERIC_CPU_AUTOPROBE
>  	select GENERIC_CPU_VULNERABILITIES
> @@ -2358,49 +2360,6 @@ choice
>  
>  endchoice
>  
> -config CMDLINE_BOOL
> -	bool "Built-in kernel command line"
> -	help
> -	  Allow for specifying boot arguments to the kernel at
> -	  build time.  On some systems (e.g. embedded ones), it is
> -	  necessary or convenient to provide some or all of the
> -	  kernel boot arguments with the kernel itself (that is,
> -	  to not rely on the boot loader to provide them.)
> -
> -	  To compile command line arguments into the kernel,
> -	  set this option to 'Y', then fill in the
> -	  boot arguments in CONFIG_CMDLINE.
> -
> -	  Systems with fully functional boot loaders (i.e. non-embedded)
> -	  should leave this option set to 'N'.
> -
> -config CMDLINE
> -	string "Built-in kernel command string"
> -	depends on CMDLINE_BOOL
> -	default ""
> -	help
> -	  Enter arguments here that should be compiled into the kernel
> -	  image and used at boot time.  If the boot loader provides a
> -	  command line at boot time, it is appended to this string to
> -	  form the full kernel command line, when the system boots.
> -
> -	  However, you can use the CONFIG_CMDLINE_FORCE option to
> -	  change this behavior.
> -
> -	  In most cases, the command line (whether built-in or provided
> -	  by the boot loader) should specify the device for the root
> -	  file system.
> -
> -config CMDLINE_FORCE
> -	bool "Built-in command line overrides boot loader arguments"
> -	depends on CMDLINE_BOOL && CMDLINE != ""
> -	help
> -	  Set this option to 'Y' to have the kernel ignore the boot loader
> -	  command line, and use ONLY the built-in command line.
> -
> -	  This is used to work around broken boot loaders.  This should
> -	  be set to 'N' under normal conditions.
> -
>  config MODIFY_LDT_SYSCALL
>  	bool "Enable the LDT (local descriptor table)" if EXPERT
>  	default y
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 6f2de58eeb54..3f274b02e51c 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -5,6 +5,7 @@
>   * This file contains the setup_arch() code, which handles the architecture-dependent
>   * parts of early kernel initialization.
>   */
> +#include <linux/cmdline.h>
>  #include <linux/console.h>
>  #include <linux/crash_dump.h>
>  #include <linux/dma-map-ops.h>
> @@ -161,9 +162,6 @@ unsigned long saved_video_mode;
>  #define RAMDISK_LOAD_FLAG		0x4000
>  
>  static char __initdata command_line[COMMAND_LINE_SIZE];
> -#ifdef CONFIG_CMDLINE_BOOL
> -static char __initdata builtin_cmdline[COMMAND_LINE_SIZE] = CONFIG_CMDLINE;
> -#endif
>  
>  #if defined(CONFIG_EDD) || defined(CONFIG_EDD_MODULE)
>  struct edd edd;
> @@ -883,18 +881,7 @@ void __init setup_arch(char **cmdline_p)
>  	bss_resource.start = __pa_symbol(__bss_start);
>  	bss_resource.end = __pa_symbol(__bss_stop)-1;
>  
> -#ifdef CONFIG_CMDLINE_BOOL
> -#ifdef CONFIG_CMDLINE_FORCE
> -	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> -#else
> -	if (builtin_cmdline[0]) {
> -		/* append boot loader cmdline to builtin */
> -		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
> -		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> -		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> -	}
> -#endif
> -#endif
> +	cmdline_build(boot_command_line, boot_command_line);
>  
>  	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
>  	*cmdline_p = command_line;

Once this is all done, I wonder if we can get rid of the strlcpy and 
perhaps also cmdline_p.

Rob
