Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D9D30FCB4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 20:28:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWpW50VqPzDwwW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 06:28:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WXxs/7dH; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWpSx4sbczDww6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 06:26:41 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05C4D64F90
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 19:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612466799;
 bh=IvMJSuyPBSKjwbm0NKGnjjVxnlF+lFnyli8//jgP4To=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WXxs/7dHLkaq67YvXGWOnv2I/WzI0QGo2RQfoo8V2WtA7gnyuTom7GR07avIJJGkg
 TSfrnR42J3Ymq5oyiYtuoxeJ6fbb2DLKDygQzpFwnDYG5BDXzkCfU5If/C6yUbMm9c
 fcE18MT6x4jGswF4yGXK97jOOy2AeksQj6bDbLjQkEL7dah5jLZwlWasvUgAwoGcPr
 3xjBiUi4RFdkp5FJY5V254KANqVislrd3ItcnJjXvTlIWr6YdHhA8CuhINmZcPsKKL
 TRPSYVj0/6fsv5dwCv9ZRmtKddt6WqUHSLf2PRUsf4Ts98MJAuDqH0Z0UTXuVxohWH
 gGVg0YnDHC2Rg==
Received: by mail-lf1-f44.google.com with SMTP id u25so6311481lfc.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 11:26:38 -0800 (PST)
X-Gm-Message-State: AOAM530wstmiPqAQ/1WH3rMYKej7OkCRK3sCuXwQYzeoxRmzrhefboDH
 lmjtIAyg/SJil+rpWalvtqhp8ydC9QjkkXjvMA==
X-Google-Smtp-Source: ABdhPJx63WCpS5SsKFaBszMRfMahLoCwwtc3D3JN1mgTmRNm7HQGsxD6WPtyKilkAM9Ji9QNM2AWrXo4LO963CHlF9s=
X-Received: by 2002:a17:906:4301:: with SMTP id
 j1mr643389ejm.108.1612466796391; 
 Thu, 04 Feb 2021 11:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20210204164135.29856-1-nramas@linux.microsoft.com>
 <20210204164135.29856-12-nramas@linux.microsoft.com>
In-Reply-To: <20210204164135.29856-12-nramas@linux.microsoft.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Feb 2021 13:26:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK1Pb9nAeL84EP2U3MQgpBsm+E_0QXmzbigWXnS245WPQ@mail.gmail.com>
Message-ID: <CAL_JsqK1Pb9nAeL84EP2U3MQgpBsm+E_0QXmzbigWXnS245WPQ@mail.gmail.com>
Subject: Re: [PATCH v16 11/12] powerpc: Use OF alloc and free for FDT
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Bhupesh Sharma <bhsharma@redhat.com>,
 tao.li@vivo.com, Mimi Zohar <zohar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, vincenzo.frascino@arm.com,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 "AKASHI, Takahiro" <takahiro.akashi@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, devicetree@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Will Deacon <will@kernel.org>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 4, 2021 at 10:42 AM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> of_alloc_and_init_fdt() and of_free_fdt() have been defined in
> drivers/of/kexec.c to allocate and free memory for FDT.
>
> Use of_alloc_and_init_fdt() and of_free_fdt() to allocate and
> initialize the FDT, and to free the FDT respectively.
>
> powerpc sets the FDT address in image_loader_data field in
> "struct kimage" and the memory is freed in
> kimage_file_post_load_cleanup().  This cleanup function uses kfree()
> to free the memory. But since of_alloc_and_init_fdt() uses kvmalloc()
> for allocation, the buffer needs to be freed using kvfree().

You could just change the kexec core to call kvfree() instead.

> Define "fdt" field in "struct kimage_arch" for powerpc to store
> the address of FDT, and free the memory in powerpc specific
> arch_kimage_file_post_load_cleanup().

However, given all the other buffers have an explicit field in kimage
or kimage_arch, changing powerpc is to match arm64 is better IMO.

> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Suggested-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kexec.h  |  2 ++
>  arch/powerpc/kexec/elf_64.c       | 26 ++++++++++++++++----------
>  arch/powerpc/kexec/file_load_64.c |  3 +++
>  3 files changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index 2c0be93d239a..d7d13cac4d31 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -111,6 +111,8 @@ struct kimage_arch {
>         unsigned long elf_headers_mem;
>         unsigned long elf_headers_sz;
>         void *elf_headers;
> +
> +       void *fdt;
>  };
>
>  char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index d0e459bb2f05..51d2d8eb6c1b 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -19,6 +19,7 @@
>  #include <linux/kexec.h>
>  #include <linux/libfdt.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_fdt.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> @@ -32,7 +33,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>         unsigned int fdt_size;
>         unsigned long kernel_load_addr;
>         unsigned long initrd_load_addr = 0, fdt_load_addr;
> -       void *fdt;
> +       void *fdt = NULL;
>         const void *slave_code;
>         struct elfhdr ehdr;
>         char *modified_cmdline = NULL;
> @@ -103,18 +104,12 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>         }
>
>         fdt_size = fdt_totalsize(initial_boot_params) * 2;
> -       fdt = kmalloc(fdt_size, GFP_KERNEL);
> +       fdt = of_alloc_and_init_fdt(fdt_size);
>         if (!fdt) {
>                 pr_err("Not enough memory for the device tree.\n");
>                 ret = -ENOMEM;
>                 goto out;
>         }
> -       ret = fdt_open_into(initial_boot_params, fdt, fdt_size);
> -       if (ret < 0) {
> -               pr_err("Error setting up the new device tree.\n");
> -               ret = -EINVAL;
> -               goto out;
> -       }
>
>         ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,

The first thing this function does is call setup_new_fdt() which first
calls of_kexec_setup_new_fdt(). (Note, I really don't understand the
PPC code split. It looks like there's a 32-bit and 64-bit split, but
32-bit looks broken to me. Nothing ever calls setup_new_fdt() except
setup_new_fdt_ppc64()). The arm64 version is calling
of_alloc_and_init_fdt() and then of_kexec_setup_new_fdt() directly.

So we can just make of_alloc_and_init_fdt() also call
of_kexec_setup_new_fdt() (really, just tweak of_kexec_setup_new_fdt do
the alloc and copy). I don't think the architecture needs to pick the
size either. It's doubtful that either one is that sensitive to the
amount of extra space.

>                                   initrd_len, cmdline);
> @@ -131,6 +126,10 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>         ret = kexec_add_buffer(&kbuf);
>         if (ret)
>                 goto out;
> +
> +       /* FDT will be freed in arch_kimage_file_post_load_cleanup */
> +       image->arch.fdt = fdt;
> +
>         fdt_load_addr = kbuf.mem;
>
>         pr_debug("Loaded device tree at 0x%lx\n", fdt_load_addr);
> @@ -145,8 +144,15 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>         kfree(modified_cmdline);
>         kexec_free_elf_info(&elf_info);
>
> -       /* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
> -       return ret ? ERR_PTR(ret) : fdt;
> +       /*
> +        * Once FDT buffer has been successfully passed to kexec_add_buffer(),
> +        * the FDT buffer address is saved in image->arch.fdt. In that case,
> +        * the memory cannot be freed here in case of any other error.
> +        */
> +       if (ret && !image->arch.fdt)
> +               of_free_fdt(fdt);

Just call kvfree() directly.

> +
> +       return ret ? ERR_PTR(ret) : NULL;
>  }
>
>  const struct kexec_file_ops kexec_elf64_ops = {
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 3cab318aa3b9..d9d5b5569a6d 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -1113,5 +1113,8 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
>         image->arch.elf_headers = NULL;
>         image->arch.elf_headers_sz = 0;
>
> +       of_free_fdt(image->arch.fdt);
> +       image->arch.fdt = NULL;
> +
>         return kexec_image_post_load_cleanup_default(image);
>  }
> --
> 2.30.0
>
