Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03365331F79
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 07:43:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvlzH07Znz3cFx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 17:43:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PsLPWBfO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PsLPWBfO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvlyq2Qypz30L7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 17:43:15 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C19F652AD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 06:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615272192;
 bh=8aTJOb41W71/iAYGorZ+HicoBt7LRkfCHw2dKRKP5H8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PsLPWBfOWhe/SUGxap6rvsZXtVzh2EiQf7EnxMZZDhpQSHp8pryRMfdjo1ePU9uGy
 4csLHWUbFWNa4SbM9RJy5TLnV8zAXHZsDPq7VibDYGiOO9WeEKpZk43SZkX2Dzscbq
 J6XlTSnbzEzvxSjunZA94vLnZZFlPy05/xBtkormCNi3dRDH0kFD4xlFRXcMezlx5c
 nKVb2CCGGlOUKlwyPdAQXKlocouJZrF+4dIrw8QP+Smis35zhLbmdw1hhheRDkoh+l
 /zlsT1zEYpG/vD1wZu7C2rqmHTUh6fkkvnFdzvAV4HiOskAlhWePGPVxORbsCM6zwi
 oZfa4b9vwf92w==
Received: by mail-ot1-f49.google.com with SMTP id r24so3717807otp.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 22:43:12 -0800 (PST)
X-Gm-Message-State: AOAM533/ZkqPIB5/SD7E9AdNUqycCoVzmt2a+WD+BQhRCnHwjANQHBqx
 50MtGwu9fN6wyodIJqiCvvAO7+nAa4wcIBTzGRk=
X-Google-Smtp-Source: ABdhPJwwErlMGgTI6W9kWVTWXyRRpA2pqUCTwdh7w26x7CXw7TkH69DIf3SOIwcUVKSsFK4w6gv5mpplcLA5Tjexcsk=
X-Received: by 2002:a9d:7512:: with SMTP id r18mr23355920otk.90.1615272191490; 
 Mon, 08 Mar 2021 22:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20210309000247.2989531-8-danielwa@cisco.com>
In-Reply-To: <20210309000247.2989531-8-danielwa@cisco.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 9 Mar 2021 07:43:01 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF9k2J5eZdn6R6bn4ChRVyuGYHM7bOtycf1QKrakrua_g@mail.gmail.com>
Message-ID: <CAMj1kXF9k2J5eZdn6R6bn4ChRVyuGYHM7bOtycf1QKrakrua_g@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] CMDLINE: x86: convert to generic builtin command
 line
To: Daniel Walker <danielwa@cisco.com>
Content-Type: text/plain; charset="UTF-8"
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
 linux-efi <linux-efi@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>, xe-linux-external@cisco.com,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 9 Mar 2021 at 01:03, Daniel Walker <danielwa@cisco.com> wrote:
>
> This updates the x86 code to use the CONFIG_GENERIC_CMDLINE
> option.
>
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>  arch/x86/Kconfig                        | 44 +------------------------
>  arch/x86/kernel/setup.c                 | 18 ++--------
>  drivers/firmware/efi/libstub/x86-stub.c |  2 +-
>  3 files changed, 4 insertions(+), 60 deletions(-)
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 21f851179ff0..3950f9bf9855 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -115,6 +115,7 @@ config X86
>         select EDAC_SUPPORT
>         select GENERIC_CLOCKEVENTS_BROADCAST    if X86_64 || (X86_32 && X86_LOCAL_APIC)
>         select GENERIC_CLOCKEVENTS_MIN_ADJUST
> +       select GENERIC_CMDLINE
>         select GENERIC_CMOS_UPDATE
>         select GENERIC_CPU_AUTOPROBE
>         select GENERIC_CPU_VULNERABILITIES
> @@ -2368,49 +2369,6 @@ choice
>
>  endchoice
>
> -config CMDLINE_BOOL
> -       bool "Built-in kernel command line"
> -       help
> -         Allow for specifying boot arguments to the kernel at
> -         build time.  On some systems (e.g. embedded ones), it is
> -         necessary or convenient to provide some or all of the
> -         kernel boot arguments with the kernel itself (that is,
> -         to not rely on the boot loader to provide them.)
> -
> -         To compile command line arguments into the kernel,
> -         set this option to 'Y', then fill in the
> -         boot arguments in CONFIG_CMDLINE.
> -
> -         Systems with fully functional boot loaders (i.e. non-embedded)
> -         should leave this option set to 'N'.
> -
> -config CMDLINE
> -       string "Built-in kernel command string"
> -       depends on CMDLINE_BOOL
> -       default ""
> -       help
> -         Enter arguments here that should be compiled into the kernel
> -         image and used at boot time.  If the boot loader provides a
> -         command line at boot time, it is appended to this string to
> -         form the full kernel command line, when the system boots.
> -
> -         However, you can use the CONFIG_CMDLINE_OVERRIDE option to
> -         change this behavior.
> -
> -         In most cases, the command line (whether built-in or provided
> -         by the boot loader) should specify the device for the root
> -         file system.
> -
> -config CMDLINE_OVERRIDE
> -       bool "Built-in command line overrides boot loader arguments"
> -       depends on CMDLINE_BOOL && CMDLINE != ""
> -       help
> -         Set this option to 'Y' to have the kernel ignore the boot loader
> -         command line, and use ONLY the built-in command line.
> -
> -         This is used to work around broken boot loaders.  This should
> -         be set to 'N' under normal conditions.
> -
>  config MODIFY_LDT_SYSCALL
>         bool "Enable the LDT (local descriptor table)" if EXPERT
>         default y
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 740f3bdb3f61..e748c3e5c1ae 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -48,6 +48,7 @@
>  #include <asm/unwind.h>
>  #include <asm/vsyscall.h>
>  #include <linux/vmalloc.h>
> +#include <linux/cmdline.h>
>
>  /*
>   * max_low_pfn_mapped: highest directly mapped pfn < 4 GB
> @@ -162,9 +163,6 @@ unsigned long saved_video_mode;
>  #define RAMDISK_LOAD_FLAG              0x4000
>
>  static char __initdata command_line[COMMAND_LINE_SIZE];
> -#ifdef CONFIG_CMDLINE_BOOL
> -static char __initdata builtin_cmdline[COMMAND_LINE_SIZE] = CONFIG_CMDLINE;
> -#endif
>
>  #if defined(CONFIG_EDD) || defined(CONFIG_EDD_MODULE)
>  struct edd edd;
> @@ -884,19 +882,7 @@ void __init setup_arch(char **cmdline_p)
>         bss_resource.start = __pa_symbol(__bss_start);
>         bss_resource.end = __pa_symbol(__bss_stop)-1;
>
> -#ifdef CONFIG_CMDLINE_BOOL
> -#ifdef CONFIG_CMDLINE_OVERRIDE
> -       strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> -#else
> -       if (builtin_cmdline[0]) {
> -               /* append boot loader cmdline to builtin */
> -               strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
> -               strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> -               strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> -       }
> -#endif
> -#endif
> -
> +       cmdline_add_builtin(boot_command_line, NULL, COMMAND_LINE_SIZE);
>         strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
>         *cmdline_p = command_line;
>
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
> index f14c4ff5839f..9538c9d4a0bc 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -736,7 +736,7 @@ unsigned long efi_main(efi_handle_t handle,
>         }
>
>  #ifdef CONFIG_CMDLINE_BOOL

Does this CMDLINE_BOOL check need to be dropped as well?

> -       status = efi_parse_options(CONFIG_CMDLINE);
> +       status = efi_parse_options(CONFIG_CMDLINE_PREPEND " " CONFIG_CMDLINE_APPEND);
>         if (status != EFI_SUCCESS) {
>                 efi_err("Failed to parse options\n");
>                 goto fail;
> --
> 2.25.1
>
