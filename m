Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 634963A7E03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 14:18:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G46mY6npqz3c65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 22:18:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.217.47; helo=mail-vs1-f47.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G46m70PkGz3bw1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 22:18:14 +1000 (AEST)
Received: by mail-vs1-f47.google.com with SMTP id f21so9674958vsl.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 05:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jrlwSWatHznx383NLiMm7Z2IuN1e5i6noGzyC8CFebk=;
 b=sCcUDvpg7l/80uQcFPYHK+++oM4yKcAO/x9lUBQ0VZv72fMx7mZmT4xpAwfNy2hGso
 RjeZwwhPqt17kPeE9a4ke6F6FOxozZn6HX70ZnWywejRasA4h6+em3GvKL4bFMigbILi
 cmrW1wwXBCGWL7jTvaEW4ydvYXjAhalf6WSQYk7NWF7GdF2GYDlsmPPXgBLzrnntQpJT
 p/kIqioG3pSXEclSQrJn91lvp5XWcfRl8rnTRDWc/90CGdKtYPK/PL3Y/JhaiLgAYkEc
 ppPRngoQVfPIZYMEvYpfz7sLTOysoJqQ++5vmNZ6qWZY6t+LplArcnmdO9BmGhGgQ0gU
 Lfzg==
X-Gm-Message-State: AOAM532L/rtsU8Y7CnzC2Jc3b4RjovUWWmaKH6j83LowxjNy+J1/fysM
 YoTauE1wHVG0FOYd0z5h0fnXW4L7upqPQrXbjI4=
X-Google-Smtp-Source: ABdhPJyWLBtsARFbraykVxhSly+mYdsijjLf5u4llpgj1CcBtHFQinLCCrvpCrriX7X558sqTXYumrMOgaLjD7ZGGnM=
X-Received: by 2002:a05:6102:2011:: with SMTP id
 p17mr4770704vsr.40.1623759490847; 
 Tue, 15 Jun 2021 05:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
 <20210221174930.27324-6-nramas@linux.microsoft.com>
In-Reply-To: <20210221174930.27324-6-nramas@linux.microsoft.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Jun 2021 14:17:59 +0200
Message-ID: <CAMuHMdVSuNS4edh-zM0_sbC0i1AAjQ9Y0n_8Mjz=3CALkW4pgg@mail.gmail.com>
Subject: Re: [PATCH v19 05/13] of: Add a common kexec FDT setup function
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Rob Herring <robh@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, tao.li@vivo.com,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Will Deacon <will@kernel.org>, prsriva@linux.microsoft.com,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, Greg KH <gregkh@linuxfoundation.org>,
 Joe Perches <joe@perches.com>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Lakshmi and Rob,

On Sun, Feb 21, 2021 at 6:52 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
> From: Rob Herring <robh@kernel.org>
>
> Both arm64 and powerpc do essentially the same FDT /chosen setup for
> kexec.  The differences are either omissions that arm64 should have
> or additional properties that will be ignored.  The setup code can be
> combined and shared by both powerpc and arm64.
>
> The differences relative to the arm64 version:
>  - If /chosen doesn't exist, it will be created (should never happen).
>  - Any old dtb and initrd reserved memory will be released.
>  - The new initrd and elfcorehdr are marked reserved.
>  - "linux,booted-from-kexec" is set.
>
> The differences relative to the powerpc version:
>  - "kaslr-seed" and "rng-seed" may be set.
>  - "linux,elfcorehdr" is set.
>  - Any existing "linux,usable-memory-range" is removed.
>
> Combine the code for setting up the /chosen node in the FDT and updating
> the memory reservation for kexec, for powerpc and arm64, in
> of_kexec_alloc_and_setup_fdt() and move it to "drivers/of/kexec.c".
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

> --- /dev/null
> +++ b/drivers/of/kexec.c

> +/*
> + * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
> + *
> + * @image:             kexec image being loaded.
> + * @initrd_load_addr:  Address where the next initrd will be loaded.
> + * @initrd_len:                Size of the next initrd, or 0 if there will be none.
> + * @cmdline:           Command line for the next kernel, or NULL if there will
> + *                     be none.
> + * @extra_fdt_size:    Additional size for the new FDT buffer.
> + *
> + * Return: fdt on success, or NULL errno on error.
> + */
> +void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
> +                                  unsigned long initrd_load_addr,
> +                                  unsigned long initrd_len,
> +                                  const char *cmdline, size_t extra_fdt_size)
> +{

> +       /* Did we boot using an initrd? */
> +       prop = fdt_getprop(fdt, chosen_node, "linux,initrd-start", NULL);
> +       if (prop) {
> +               u64 tmp_start, tmp_end, tmp_size;
> +
> +               tmp_start = fdt64_to_cpu(*((const fdt64_t *) prop));
> +
> +               prop = fdt_getprop(fdt, chosen_node, "linux,initrd-end", NULL);
> +               if (!prop) {
> +                       ret = -EINVAL;
> +                       goto out;
> +               }
> +
> +               tmp_end = fdt64_to_cpu(*((const fdt64_t *) prop));

Some kernel code assumes "linux,initrd-{start,end}" are 64-bit,
other code assumes 32-bit.
linux/Documentation/arm/uefi.rst says 64-bit,
dt-schema/schemas/chosen.yaml says 32-bit.

> +
> +               /*
> +                * kexec reserves exact initrd size, while firmware may
> +                * reserve a multiple of PAGE_SIZE, so check for both.
> +                */
> +               tmp_size = tmp_end - tmp_start;
> +               ret = fdt_find_and_del_mem_rsv(fdt, tmp_start, tmp_size);
> +               if (ret == -ENOENT)
> +                       ret = fdt_find_and_del_mem_rsv(fdt, tmp_start,
> +                                                      round_up(tmp_size, PAGE_SIZE));
> +               if (ret == -EINVAL)
> +                       goto out;
> +       }
> +
> +       /* add initrd-* */
> +       if (initrd_load_addr) {
> +               ret = fdt_setprop_u64(fdt, chosen_node, FDT_PROP_INITRD_START,
> +                                     initrd_load_addr);
> +               if (ret)
> +                       goto out;
> +
> +               ret = fdt_setprop_u64(fdt, chosen_node, FDT_PROP_INITRD_END,
> +                                     initrd_load_addr + initrd_len);
> +               if (ret)
> +                       goto out;
> +
> +               ret = fdt_add_mem_rsv(fdt, initrd_load_addr, initrd_len);
> +               if (ret)
> +                       goto out;
> +
> +       } else {
> +               ret = fdt_delprop(fdt, chosen_node, FDT_PROP_INITRD_START);
> +               if (ret && (ret != -FDT_ERR_NOTFOUND))
> +                       goto out;
> +
> +               ret = fdt_delprop(fdt, chosen_node, FDT_PROP_INITRD_END);
> +               if (ret && (ret != -FDT_ERR_NOTFOUND))
> +                       goto out;
> +       }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
