Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2745580E854
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 10:57:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GaIWa+5H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqDY54hPZz3cT8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 20:56:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GaIWa+5H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqDWq1WGRz3c05
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 20:55:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9A4BAB81142
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 09:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE651C433C8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702374946;
	bh=BQ3BLgzy5Ip8VA406gPgErfyBqjO7GKw1h33a58SXak=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GaIWa+5HO/3tpLiJqVwkGHTCi5qex7zNQtWyU4PNsBQHsBUXpZiC58dM58/LuVX9M
	 3KYhJvHlIErYbprY2t/ZIQdSN24vOxlX96Gu3j5Vsob+RNTV7HvBd/GqXzWBO1rbHS
	 +fptPBUY/B659L07EdnvJZlKKaWEPZKzyflncHVy9B0yV3Mga6SkgQCm6mkbPCKuTj
	 yHvq/q+Z6JJ5SUPZ7eWqris9Lr2tgx05rXVcX1JI+U71pywzW5La2G3JbS3Mh4BaP6
	 CAfNzwoKJnlNgxSPhhLU4BIAhIsvivVpvYv7gfpL33fkNXxFl+0ggMkNW944Q7639c
	 1ukJgDrhcSQOw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c9f413d6b2so68558661fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 01:55:45 -0800 (PST)
X-Gm-Message-State: AOJu0Yy+phDmhNW6u9pwIGo7KrfcRMrvJglqKiZdiMLE8KBt/PxtRK9W
	ItRNKTQSvYakx5E7pQ10v0f0Iak+rbV/YwEwLA0=
X-Google-Smtp-Source: AGHT+IF6xU8aIgiKF9gxcOAyuJr/WgEi/ofYZrwF8M6mAYkjtZwvKk19QO6Cotxux4vrHGvx9k66hgiW+JaSJMbjxMc=
X-Received: by 2002:a2e:a99a:0:b0:2cb:30c8:2c09 with SMTP id
 x26-20020a2ea99a000000b002cb30c82c09mr1515293ljq.54.1702374944140; Tue, 12
 Dec 2023 01:55:44 -0800 (PST)
MIME-Version: 1.0
References: <20231110013817.2378507-1-danielwa@cisco.com> <20231110013817.2378507-6-danielwa@cisco.com>
In-Reply-To: <20231110013817.2378507-6-danielwa@cisco.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 12 Dec 2023 10:55:33 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFK-4mbNd_4La7Jhr_+ygBVyHdJm72vh7S41TGf2FYDdQ@mail.gmail.com>
Message-ID: <CAMj1kXFK-4mbNd_4La7Jhr_+ygBVyHdJm72vh7S41TGf2FYDdQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] drivers: firmware: efi: libstub: enable generic commandline
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
Cc: Rob Herring <robh@kernel.org>, linux-efi@vger.kernel.org, Tomas Mudrunka <tomas.mudrunka@gmail.com>, Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, Sean Anderson <sean.anderson@seco.com>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, Pratyush Brahma <quic_pbrahma@quicinc.com>, linux-mips@vger.kernel.org, xe-linux-external@cisco.com, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 Nov 2023 at 02:39, Daniel Walker <danielwa@cisco.com> wrote:
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
> The efi command line handling is incorrect. x86 and arm have an append
> system however the efi code prepends the command line.
>
> For example, you could have a non-upgradable bios which sends
>
> efi=disable_early_pci_dma
>
> This hypothetically could have been set because early pci dma caused
> issues on early versions of the product.
>
> Then later the early pci dma was made to work and the company desired
> to start using it. To override the bios you could set the CONFIG_CMDLINE
> to,
>
> efi=no_disable_early_pci_dma
>
> then parsing would normally start with the bios command line, then move
> to the CONFIG_CMDLINE and you would end up with early pci dma turned on.
>
> however, current efi code keeps early pci dma off because the bios
> arguments always override the built in.
>
> Per my reading this is different from the main body of x86, arm, and
> arm64.
>
> The generic command line provides both append and prepend, so it
> alleviates this issue if it's used. However not all architectures use
> it.
>
> It would be desirable to allow the efi stub to have it's builtin command
> line to be modified after compile, but I don't see a feasible way to do
> that currently.
>
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Daniel Walker <danielwa@cisco.com>

There are quite some 'might be's and 'hypothetical's in this commit log.

Is there an actual use case that you are addressing here? Without
that, this looks like unnecessary churn to me, tbh.

Note that this code executes in the context of platform firmware,
which may be old and buggy so we should be cautious about making
unnecessary changes here.


> ---
>  .../firmware/efi/libstub/efi-stub-helper.c    | 29 +++++++++++++++++++
>  drivers/firmware/efi/libstub/efi-stub.c       |  9 ++++++
>  drivers/firmware/efi/libstub/efistub.h        |  1 +
>  drivers/firmware/efi/libstub/x86-stub.c       | 14 +++++++--
>  4 files changed, 51 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
> index bfa30625f5d0..952fa2cdff51 100644
> --- a/drivers/firmware/efi/libstub/efi-stub-helper.c
> +++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
> @@ -11,6 +11,7 @@
>
>  #include <linux/efi.h>
>  #include <linux/kernel.h>
> +#include <linux/cmdline.h>
>  #include <asm/efi.h>
>  #include <asm/setup.h>
>
> @@ -29,6 +30,34 @@ bool __pure __efi_soft_reserve_enabled(void)
>         return !efi_nosoftreserve;
>  }
>
> +/**
> + * efi_handle_cmdline() - handle adding in built-in parts of the command line
> + * @cmdline:   kernel command line
> + *
> + * Add in the generic parts of the commandline and start the parsing of the
> + * command line.
> + *
> + * Return:     status code
> + */
> +efi_status_t efi_handle_builtin_cmdline(char const *cmdline)
> +{
> +       efi_status_t status = EFI_SUCCESS;
> +
> +       if (sizeof(CMDLINE_STATIC_PREPEND) > 1)
> +               status |= efi_parse_options(CMDLINE_STATIC_PREPEND);
> +
> +       if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE))
> +               status |= efi_parse_options(cmdline);
> +
> +       if (sizeof(CMDLINE_STATIC_APPEND) > 1)
> +               status |= efi_parse_options(CMDLINE_STATIC_APPEND);
> +
> +       if (status != EFI_SUCCESS)
> +               efi_err("Failed to parse options\n");
> +
> +       return status;
> +}
> +
>  /**
>   * efi_parse_options() - Parse EFI command line options
>   * @cmdline:   kernel command line
> diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
> index f9c1e8a2bd1d..770abe95c0ee 100644
> --- a/drivers/firmware/efi/libstub/efi-stub.c
> +++ b/drivers/firmware/efi/libstub/efi-stub.c
> @@ -127,6 +127,14 @@ efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
>                 return EFI_OUT_OF_RESOURCES;
>         }
>
> +#ifdef CONFIG_GENERIC_CMDLINE
> +       status = efi_handle_builtin_cmdline(cmdline);
> +       if (status != EFI_SUCCESS) {
> +               goto fail_free_cmdline;
> +       }
> +#endif
> +
> +#ifdef CONFIG_CMDLINE
>         if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
>             IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
>             cmdline_size == 0) {
> @@ -144,6 +152,7 @@ efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
>                         goto fail_free_cmdline;
>                 }
>         }
> +#endif
>
>         *cmdline_ptr = cmdline;
>         return EFI_SUCCESS;
> diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> index 212687c30d79..1ac6631905c5 100644
> --- a/drivers/firmware/efi/libstub/efistub.h
> +++ b/drivers/firmware/efi/libstub/efistub.h
> @@ -996,6 +996,7 @@ efi_status_t efi_relocate_kernel(unsigned long *image_addr,
>                                  unsigned long alignment,
>                                  unsigned long min_addr);
>
> +efi_status_t efi_handle_builtin_cmdline(char const *cmdline);
>  efi_status_t efi_parse_options(char const *cmdline);
>
>  void efi_parse_option_graphics(char *option);
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
> index 9d5df683f882..273a8a9c8bbb 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -847,6 +847,8 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
>         struct setup_header *hdr = &boot_params->hdr;
>         const struct linux_efi_initrd *initrd = NULL;
>         unsigned long kernel_entry;
> +       unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
> +                                      ((u64)boot_params->ext_cmd_line_ptr << 32));
>         efi_status_t status;
>
>         boot_params_pointer = boot_params;
> @@ -877,6 +879,14 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
>                 goto fail;
>         }
>
> +#ifdef CONFIG_GENERIC_CMDLINE
> +       status = efi_handle_builtin_cmdline((char *)cmdline_paddr);
> +       if (status != EFI_SUCCESS) {
> +               efi_err("Failed to parse options\n");
> +               goto fail;
> +       }
> +#else /* CONFIG_GENERIC_CMDLINE */
> +
>  #ifdef CONFIG_CMDLINE_BOOL
>         status = efi_parse_options(CONFIG_CMDLINE);
>         if (status != EFI_SUCCESS) {
> @@ -885,8 +895,6 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
>         }
>  #endif
>         if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
> -               unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
> -                                              ((u64)boot_params->ext_cmd_line_ptr << 32));
>                 status = efi_parse_options((char *)cmdline_paddr);
>                 if (status != EFI_SUCCESS) {
>                         efi_err("Failed to parse options\n");
> @@ -894,6 +902,8 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
>                 }
>         }
>
> +#endif
> +
>         status = efi_decompress_kernel(&kernel_entry);
>         if (status != EFI_SUCCESS) {
>                 efi_err("Failed to decompress kernel\n");
> --
> 2.39.2
>
>
