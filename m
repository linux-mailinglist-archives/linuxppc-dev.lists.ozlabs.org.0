Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53301350435
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 18:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9WWV2Q58z30JY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 03:10:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MPCLn42g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MPCLn42g; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9WW24gLMz2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 03:10:22 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5634560BD3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617207020;
 bh=/1ZfUq/hSkP8vyLmN2wN3gF/K+0R8P1I95At/e2yk3o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MPCLn42gcnWhwN/zKbA8+c1PbkFnwg8YwYyuVGUM+PRQBAaqJailiFH6ekOnlpoCz
 f/gDaJ8Qq+HQLeaUhLP/jmgd9+Ue0CK/lohnrM2laPXY7/BFGINxJLz9kDlyuXG7yD
 PsUQMmNfnEhkD9y74gOqg3x+FCJQ2b7NTHEPZot9bGc6QEmDWRxdrLXrpcgJyM+VH4
 g1MFlnNSURc2Wti4P0kBL/M42y5bIj4CjxCGtcNcC5UlVKT0zrbISi6OplZuuHrQPa
 D9Sv+PSbuf1rNFDLO0ndktG+dsTlTWzCLE1OksBrdBB+UAVvYv0atkgWJVXgOp5RB9
 zwZF7FS+jZj5A==
Received: by mail-oi1-f181.google.com with SMTP id c16so20518322oib.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 09:10:20 -0700 (PDT)
X-Gm-Message-State: AOAM5329m6MKm02SGvqVJdDSSjlzxxcb8uL90idIOAKi7bRZdvX7Arjo
 P5XglCV8C2A91gpE7CQrX46LAgn32WngeYkvmK8=
X-Google-Smtp-Source: ABdhPJzyQnLqutk8wJtGUcalgJX2yCNn0BLIq/ju4C/c+FzWFIriO7+Ss7TW+wiuTsHll9sO+01CXGbsemmBHeRSmAk=
X-Received: by 2002:aca:1a01:: with SMTP id a1mr2775869oia.33.1617207019681;
 Wed, 31 Mar 2021 09:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <e5d98d566c38d6f8516b8d9d1fd603ec1f131037.1617126961.git.danielwa@cisco.com>
In-Reply-To: <e5d98d566c38d6f8516b8d9d1fd603ec1f131037.1617126961.git.danielwa@cisco.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 31 Mar 2021 18:10:08 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG_rRLU2Hp_GaZyayxx6J+HaWyPHPmE-hEZawuxzZ4JXw@mail.gmail.com>
Message-ID: <CAMj1kXG_rRLU2Hp_GaZyayxx6J+HaWyPHPmE-hEZawuxzZ4JXw@mail.gmail.com>
Subject: Re: [PATCH 6/8] drivers: firmware: efi: libstub: enable generic
 commandline
To: Daniel Walker <danielwa@cisco.com>, Arvind Sankar <nivedita@alum.mit.edu>
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
Cc: ob Herring <robh@kernel.org>, linux-efi <linux-efi@vger.kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 xe-linux-external@cisco.com, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(+ Arvind)

On Tue, 30 Mar 2021 at 19:57, Daniel Walker <danielwa@cisco.com> wrote:
>
> This adds code to handle the generic command line changes.
> The efi code appears that it doesn't benefit as much from this design
> as it could.
>
> For example, if you had a prepend command line with "nokaslr" then
> you might be helpful to re-enable it in the boot loader or dts,
> but there appears to be no way to re-enable kaslr or some of the
> other options.
>
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>  .../firmware/efi/libstub/efi-stub-helper.c    | 35 +++++++++++++++++++
>  drivers/firmware/efi/libstub/efi-stub.c       |  7 ++++
>  drivers/firmware/efi/libstub/efistub.h        |  1 +
>  drivers/firmware/efi/libstub/x86-stub.c       | 13 +++++--
>  4 files changed, 54 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
> index aa8da0a49829..c155837cedc9 100644
> --- a/drivers/firmware/efi/libstub/efi-stub-helper.c
> +++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
> @@ -13,6 +13,7 @@
>  #include <linux/efi.h>
>  #include <linux/kernel.h>
>  #include <linux/printk.h> /* For CONSOLE_LOGLEVEL_* */
> +#include <linux/cmdline.h>
>  #include <asm/efi.h>
>  #include <asm/setup.h>
>
> @@ -172,6 +173,40 @@ int efi_printk(const char *fmt, ...)
>         return printed;
>  }
>
> +/**
> + * efi_handle_cmdline() - handle adding in building parts of the command line
> + * @cmdline:   kernel command line
> + *
> + * Add in the generic parts of the commandline and start the parsing of the
> + * command line.
> + *
> + * Return:     status code
> + */
> +efi_status_t efi_handle_cmdline(char const *cmdline)
> +{
> +       efi_status_t status;
> +
> +       status = efi_parse_options(CMDLINE_PREPEND);
> +       if (status != EFI_SUCCESS) {
> +               efi_err("Failed to parse options\n");
> +               return status;
> +       }

Even though I am not a fan of the 'success handling' pattern,
duplicating the exact same error handling three times is not great
either. Could we reuse more of the code here?

> +
> +       status = efi_parse_options(IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) ? "" : cmdline);

What is the point of calling efi_parse_options() with an empty string?



> +       if (status != EFI_SUCCESS) {
> +               efi_err("Failed to parse options\n");
> +               return status;
> +       }
> +
> +       status = efi_parse_options(CMDLINE_APPEND);
> +       if (status != EFI_SUCCESS) {
> +               efi_err("Failed to parse options\n");
> +               return status;
> +       }
> +
> +       return EFI_SUCCESS;
> +}
> +
>  /**
>   * efi_parse_options() - Parse EFI command line options
>   * @cmdline:   kernel command line
> diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
> index 26e69788f27a..760480248adf 100644
> --- a/drivers/firmware/efi/libstub/efi-stub.c
> +++ b/drivers/firmware/efi/libstub/efi-stub.c
> @@ -172,6 +172,12 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>                 goto fail;
>         }
>
> +#ifdef CONFIG_GENERIC_CMDLINE
> +       status = efi_handle_cmdline(cmdline_ptr);
> +       if (status != EFI_SUCCESS) {
> +               goto fail_free_cmdline;
> +       }
> +#else
>         if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
>             IS_ENABLED(CONFIG_CMDLINE_FORCE) ||

Does this mean CONFIG_GENERIC_CMDLINE does not replace CMDLINE_EXTEND
/ CMDLINE_FORCE etc, but introduces yet another variant on top of
those?

That does not seem like an improvement to me. I think it is great that
you are cleaning this up, but only if it means we can get rid of the
old implementation.

>             cmdline_size == 0) {
> @@ -189,6 +195,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>                         goto fail_free_cmdline;
>                 }
>         }
> +#endif
>
>         efi_info("Booting Linux Kernel...\n");
>
> diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> index cde0a2ef507d..07c7f9fdfffc 100644
> --- a/drivers/firmware/efi/libstub/efistub.h
> +++ b/drivers/firmware/efi/libstub/efistub.h
> @@ -800,6 +800,7 @@ efi_status_t efi_relocate_kernel(unsigned long *image_addr,
>                                  unsigned long alignment,
>                                  unsigned long min_addr);
>
> +efi_status_t efi_handle_cmdline(char const *cmdline);
>  efi_status_t efi_parse_options(char const *cmdline);
>
>  void efi_parse_option_graphics(char *option);
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
> index f14c4ff5839f..30ad8fb7122d 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -673,6 +673,8 @@ unsigned long efi_main(efi_handle_t handle,
>         unsigned long bzimage_addr = (unsigned long)startup_32;
>         unsigned long buffer_start, buffer_end;
>         struct setup_header *hdr = &boot_params->hdr;
> +       unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
> +                                      ((u64)boot_params->ext_cmd_line_ptr << 32));
>         efi_status_t status;
>
>         efi_system_table = sys_table_arg;
> @@ -735,6 +737,14 @@ unsigned long efi_main(efi_handle_t handle,
>                 image_offset = 0;
>         }
>
> +#ifdef CONFIG_GENERIC_CMDLINE
> +       status = efi_handle_cmdline((char *)cmdline_paddr);
> +       if (status != EFI_SUCCESS) {
> +               efi_err("Failed to parse options\n");
> +               goto fail;
> +       }
> +#else /* CONFIG_GENERIC_CMDLINE */
> +
>  #ifdef CONFIG_CMDLINE_BOOL
>         status = efi_parse_options(CONFIG_CMDLINE);
>         if (status != EFI_SUCCESS) {
> @@ -743,8 +753,6 @@ unsigned long efi_main(efi_handle_t handle,
>         }
>  #endif
>         if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
> -               unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
> -                                              ((u64)boot_params->ext_cmd_line_ptr << 32));
>                 status = efi_parse_options((char *)cmdline_paddr);
>                 if (status != EFI_SUCCESS) {
>                         efi_err("Failed to parse options\n");
> @@ -752,6 +760,7 @@ unsigned long efi_main(efi_handle_t handle,
>                 }
>         }
>
> +#endif
>         /*
>          * At this point, an initrd may already have been loaded by the
>          * bootloader and passed via bootparams. We permit an initrd loaded
> --
> 2.25.1
>
