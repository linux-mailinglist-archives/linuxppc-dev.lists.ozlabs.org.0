Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F168414A4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 21:46:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Msv6n5pv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TP0hP1szLz3cRB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 07:46:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Msv6n5pv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=andreyknvl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TP0gc6vm6z2yk9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 07:45:47 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40efcd830f6so3553245e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 12:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706561138; x=1707165938; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKP9s1fPlgpzq7TnTgaJGwWqGuyNQA6clVmR/5qf3Ds=;
        b=Msv6n5pvhF8hgHD2opnHQ/CkYDOWQdunhBgLM0eFEvR/D00v/3WhbAOmlankWg2tjT
         zOc88nRPabXEa+VaDfcaH8Ci0J3f2+89RpnlLO1UYXVsv/V+T24zjirME4RlKEUsQvdE
         SoM3sxp7Dm4Zt1PLxc/tbQRzrj1zhWN56HzB+//K2NC9ewnzKFojLTaFDXf6VaAE+5cZ
         fnvOEE26QD21r0bzNuYOcXiuc+XR5yrcGRwPjxbrdouVd/I5TcrdwwN1D22yt5XKMhY/
         pElnyktZz57Wc0GNX5s5qRf6RX1I3RcpNXUtkimeupDPy4sBKodEF50AN5PJEDaUB10i
         eHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706561138; x=1707165938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKP9s1fPlgpzq7TnTgaJGwWqGuyNQA6clVmR/5qf3Ds=;
        b=ROANbshTaPT0iABVRjk/Hq+HPlt4vTaUn/7gupEFMWfS16mxxumgLqvzCmIR4ebF+K
         9QJ7zD/LJAXM/p61nNvw9lGI+xTE7oR8TfxLrP+j+HhlTSM0mtDE85Nr0EyBG37mHgZP
         /UEylXX8XrMjkD8k7S2G+HxVzcPFI2zO+qab2fW5yHGrcdrJby8csOq1D702zHuW0V1M
         COWP5BVrG+GsxwOpcngUs3nmbBea7tDHlMrloxVOwl2xGTJtz2Wrj7Reu+ShTQLny7lf
         PQ50apjV4wmLuwbGc4+YIQKRtxLUtzvBlTS3bx9DAhUU9gFZxaLYGtYJLZ075Lglx9RJ
         YFfQ==
X-Gm-Message-State: AOJu0YyNzA01juNktRI0nhjyitkLj/L4hzbW+IkSNKryYbm111t3m3Hx
	f9Fg80ADgnE/mzzhEyBJYkgIm7IthRLr0JqTnAXbir0pjFxoHBVTWplrvMVBxDStY8Q8laVa5wS
	4S17dIagnUPstqRbwSrNKmttJTlo=
X-Google-Smtp-Source: AGHT+IE5Ek671tBA0IqHCVBSxhjZm1CfNJzWQWzdhO7fBSo8tQSiw6n0P10zAyQyvczyQa4Udz8EOrMemvDjIiFXt/M=
X-Received: by 2002:a05:600c:524c:b0:40e:f62b:eec0 with SMTP id
 fc12-20020a05600c524c00b0040ef62beec0mr4015551wmb.17.1706561137853; Mon, 29
 Jan 2024 12:45:37 -0800 (PST)
MIME-Version: 1.0
References: <20240129134652.4004931-1-tongtiangen@huawei.com> <20240129134652.4004931-6-tongtiangen@huawei.com>
In-Reply-To: <20240129134652.4004931-6-tongtiangen@huawei.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 29 Jan 2024 21:45:26 +0100
Message-ID: <CA+fCnZf-mkSJ+8kMPi+mWOjtYzD+FAKi_ciiHt=yrbksY9W-KA@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] arm64: support copy_mc_[user]_highpage()
To: Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, wangkefeng.wang@huawei.com, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, "H. Peter Anvin" <hpa@zytor.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Tong Tiangen <tongtiangen@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>, linuxppc-dev@lists.ozlabs.org, Guohanjun <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murph
 y@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 29, 2024 at 2:47=E2=80=AFPM Tong Tiangen <tongtiangen@huawei.co=
m> wrote:
>
> Currently, many scenarios that can tolerate memory errors when copying pa=
ge
> have been supported in the kernel[1][2][3], all of which are implemented =
by
> copy_mc_[user]_highpage(). arm64 should also support this mechanism.
>
> Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
> architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
> __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
>
> Add new helper copy_mc_page() which provide a page copy implementation wi=
th
> machine check safe. The copy_mc_page() in copy_mc_page.S is largely borro=
ws
> from copy_page() in copy_page.S and the main difference is copy_mc_page()
> add extable entry to every load/store insn to support machine check safe.
>
> Add new extable type EX_TYPE_COPY_MC_PAGE_ERR_ZERO which used in
> copy_mc_page().
>
> [1]a873dfe1032a ("mm, hwpoison: try to recover from copy-on write faults"=
)
> [2]5f2500b93cc9 ("mm/khugepaged: recover from poisoned anonymous memory")
> [3]6b970599e807 ("mm: hwpoison: support recovery from ksm_might_need_to_c=
opy()")
>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/arm64/include/asm/asm-extable.h | 15 ++++++
>  arch/arm64/include/asm/assembler.h   |  4 ++
>  arch/arm64/include/asm/mte.h         |  5 ++
>  arch/arm64/include/asm/page.h        | 10 ++++
>  arch/arm64/lib/Makefile              |  2 +
>  arch/arm64/lib/copy_mc_page.S        | 78 ++++++++++++++++++++++++++++
>  arch/arm64/lib/mte.S                 | 27 ++++++++++
>  arch/arm64/mm/copypage.c             | 66 ++++++++++++++++++++---
>  arch/arm64/mm/extable.c              |  7 +--
>  include/linux/highmem.h              |  8 +++
>  10 files changed, 213 insertions(+), 9 deletions(-)
>  create mode 100644 arch/arm64/lib/copy_mc_page.S
>
> diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/as=
m/asm-extable.h
> index 980d1dd8e1a3..819044fefbe7 100644
> --- a/arch/arm64/include/asm/asm-extable.h
> +++ b/arch/arm64/include/asm/asm-extable.h
> @@ -10,6 +10,7 @@
>  #define EX_TYPE_UACCESS_ERR_ZERO       2
>  #define EX_TYPE_KACCESS_ERR_ZERO       3
>  #define EX_TYPE_LOAD_UNALIGNED_ZEROPAD 4
> +#define EX_TYPE_COPY_MC_PAGE_ERR_ZERO  5
>
>  /* Data fields for EX_TYPE_UACCESS_ERR_ZERO */
>  #define EX_DATA_REG_ERR_SHIFT  0
> @@ -51,6 +52,16 @@
>  #define _ASM_EXTABLE_UACCESS(insn, fixup)                              \
>         _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, wzr, wzr)
>
> +#define _ASM_EXTABLE_COPY_MC_PAGE_ERR_ZERO(insn, fixup, err, zero)     \
> +       __ASM_EXTABLE_RAW(insn, fixup,                                  \
> +                         EX_TYPE_COPY_MC_PAGE_ERR_ZERO,                \
> +                         (                                             \
> +                           EX_DATA_REG(ERR, err) |                     \
> +                           EX_DATA_REG(ZERO, zero)                     \
> +                         ))
> +
> +#define _ASM_EXTABLE_COPY_MC_PAGE(insn, fixup)                         \
> +       _ASM_EXTABLE_COPY_MC_PAGE_ERR_ZERO(insn, fixup, wzr, wzr)
>  /*
>   * Create an exception table entry for uaccess `insn`, which will branch=
 to `fixup`
>   * when an unhandled fault is taken.
> @@ -59,6 +70,10 @@
>         _ASM_EXTABLE_UACCESS(\insn, \fixup)
>         .endm
>
> +       .macro          _asm_extable_copy_mc_page, insn, fixup
> +       _ASM_EXTABLE_COPY_MC_PAGE(\insn, \fixup)
> +       .endm
> +
>  /*
>   * Create an exception table entry for `insn` if `fixup` is provided. Ot=
herwise
>   * do nothing.
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/=
assembler.h
> index 513787e43329..e1d8ce155878 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -154,6 +154,10 @@ lr .req    x30             // link register
>  #define CPU_LE(code...) code
>  #endif
>
> +#define CPY_MC(l, x...)                \
> +9999:   x;                     \
> +       _asm_extable_copy_mc_page    9999b, l
> +
>  /*
>   * Define a macro that constructs a 64-bit value by concatenating two
>   * 32-bit registers. Note that on big endian systems the order of the
> diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
> index 91fbd5c8a391..9cdded082dd4 100644
> --- a/arch/arm64/include/asm/mte.h
> +++ b/arch/arm64/include/asm/mte.h
> @@ -92,6 +92,7 @@ static inline bool try_page_mte_tagging(struct page *pa=
ge)
>  void mte_zero_clear_page_tags(void *addr);
>  void mte_sync_tags(pte_t pte, unsigned int nr_pages);
>  void mte_copy_page_tags(void *kto, const void *kfrom);
> +int mte_copy_mc_page_tags(void *kto, const void *kfrom);
>  void mte_thread_init_user(void);
>  void mte_thread_switch(struct task_struct *next);
>  void mte_cpu_setup(void);
> @@ -128,6 +129,10 @@ static inline void mte_sync_tags(pte_t pte, unsigned=
 int nr_pages)
>  static inline void mte_copy_page_tags(void *kto, const void *kfrom)
>  {
>  }
> +static inline int mte_copy_mc_page_tags(void *kto, const void *kfrom)
> +{
> +       return 0;
> +}
>  static inline void mte_thread_init_user(void)
>  {
>  }
> diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.=
h
> index 2312e6ee595f..304cc86b8a10 100644
> --- a/arch/arm64/include/asm/page.h
> +++ b/arch/arm64/include/asm/page.h
> @@ -29,6 +29,16 @@ void copy_user_highpage(struct page *to, struct page *=
from,
>  void copy_highpage(struct page *to, struct page *from);
>  #define __HAVE_ARCH_COPY_HIGHPAGE
>
> +#ifdef CONFIG_ARCH_HAS_COPY_MC
> +int copy_mc_page(void *to, const void *from);
> +int copy_mc_highpage(struct page *to, struct page *from);
> +#define __HAVE_ARCH_COPY_MC_HIGHPAGE
> +
> +int copy_mc_user_highpage(struct page *to, struct page *from,
> +               unsigned long vaddr, struct vm_area_struct *vma);
> +#define __HAVE_ARCH_COPY_MC_USER_HIGHPAGE
> +#endif
> +
>  struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>                                                 unsigned long vaddr);
>  #define vma_alloc_zeroed_movable_folio vma_alloc_zeroed_movable_folio
> diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
> index 29490be2546b..a2fd865b816d 100644
> --- a/arch/arm64/lib/Makefile
> +++ b/arch/arm64/lib/Makefile
> @@ -15,6 +15,8 @@ endif
>
>  lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) +=3D uaccess_flushcache.o
>
> +lib-$(CONFIG_ARCH_HAS_COPY_MC) +=3D copy_mc_page.o
> +
>  obj-$(CONFIG_CRC32) +=3D crc32.o
>
>  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) +=3D error-inject.o
> diff --git a/arch/arm64/lib/copy_mc_page.S b/arch/arm64/lib/copy_mc_page.=
S
> new file mode 100644
> index 000000000000..524534d26d86
> --- /dev/null
> +++ b/arch/arm64/lib/copy_mc_page.S
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + */
> +
> +#include <linux/linkage.h>
> +#include <linux/const.h>
> +#include <asm/assembler.h>
> +#include <asm/page.h>
> +#include <asm/cpufeature.h>
> +#include <asm/alternative.h>
> +#include <asm/asm-extable.h>
> +
> +/*
> + * Copy a page from src to dest (both are page aligned) with machine che=
ck
> + *
> + * Parameters:
> + *     x0 - dest
> + *     x1 - src
> + * Returns:
> + *     x0 - Return 0 if copy success, or -EFAULT if anything goes wrong
> + *          while copying.
> + */
> +SYM_FUNC_START(__pi_copy_mc_page)
> +CPY_MC(9998f, ldp      x2, x3, [x1])
> +CPY_MC(9998f, ldp      x4, x5, [x1, #16])
> +CPY_MC(9998f, ldp      x6, x7, [x1, #32])
> +CPY_MC(9998f, ldp      x8, x9, [x1, #48])
> +CPY_MC(9998f, ldp      x10, x11, [x1, #64])
> +CPY_MC(9998f, ldp      x12, x13, [x1, #80])
> +CPY_MC(9998f, ldp      x14, x15, [x1, #96])
> +CPY_MC(9998f, ldp      x16, x17, [x1, #112])
> +
> +       add     x0, x0, #256
> +       add     x1, x1, #128
> +1:
> +       tst     x0, #(PAGE_SIZE - 1)
> +
> +CPY_MC(9998f, stnp     x2, x3, [x0, #-256])
> +CPY_MC(9998f, ldp      x2, x3, [x1])
> +CPY_MC(9998f, stnp     x4, x5, [x0, #16 - 256])
> +CPY_MC(9998f, ldp      x4, x5, [x1, #16])
> +CPY_MC(9998f, stnp     x6, x7, [x0, #32 - 256])
> +CPY_MC(9998f, ldp      x6, x7, [x1, #32])
> +CPY_MC(9998f, stnp     x8, x9, [x0, #48 - 256])
> +CPY_MC(9998f, ldp      x8, x9, [x1, #48])
> +CPY_MC(9998f, stnp     x10, x11, [x0, #64 - 256])
> +CPY_MC(9998f, ldp      x10, x11, [x1, #64])
> +CPY_MC(9998f, stnp     x12, x13, [x0, #80 - 256])
> +CPY_MC(9998f, ldp      x12, x13, [x1, #80])
> +CPY_MC(9998f, stnp     x14, x15, [x0, #96 - 256])
> +CPY_MC(9998f, ldp      x14, x15, [x1, #96])
> +CPY_MC(9998f, stnp     x16, x17, [x0, #112 - 256])
> +CPY_MC(9998f, ldp      x16, x17, [x1, #112])
> +
> +       add     x0, x0, #128
> +       add     x1, x1, #128
> +
> +       b.ne    1b
> +
> +CPY_MC(9998f, stnp     x2, x3, [x0, #-256])
> +CPY_MC(9998f, stnp     x4, x5, [x0, #16 - 256])
> +CPY_MC(9998f, stnp     x6, x7, [x0, #32 - 256])
> +CPY_MC(9998f, stnp     x8, x9, [x0, #48 - 256])
> +CPY_MC(9998f, stnp     x10, x11, [x0, #64 - 256])
> +CPY_MC(9998f, stnp     x12, x13, [x0, #80 - 256])
> +CPY_MC(9998f, stnp     x14, x15, [x0, #96 - 256])
> +CPY_MC(9998f, stnp     x16, x17, [x0, #112 - 256])
> +
> +       mov x0, #0
> +       ret
> +
> +9998:  mov x0, #-EFAULT
> +       ret
> +
> +SYM_FUNC_END(__pi_copy_mc_page)
> +SYM_FUNC_ALIAS(copy_mc_page, __pi_copy_mc_page)
> +EXPORT_SYMBOL(copy_mc_page)
> diff --git a/arch/arm64/lib/mte.S b/arch/arm64/lib/mte.S
> index 5018ac03b6bf..2b748e83f6cf 100644
> --- a/arch/arm64/lib/mte.S
> +++ b/arch/arm64/lib/mte.S
> @@ -80,6 +80,33 @@ SYM_FUNC_START(mte_copy_page_tags)
>         ret
>  SYM_FUNC_END(mte_copy_page_tags)
>
> +/*
> + * Copy the tags from the source page to the destination one wiht machin=
e check safe
> + *   x0 - address of the destination page
> + *   x1 - address of the source page
> + * Returns:
> + *   x0 - Return 0 if copy success, or
> + *        -EFAULT if anything goes wrong while copying.
> + */
> +SYM_FUNC_START(mte_copy_mc_page_tags)
> +       mov     x2, x0
> +       mov     x3, x1
> +       multitag_transfer_size x5, x6
> +1:
> +CPY_MC(2f, ldgm        x4, [x3])
> +CPY_MC(2f, stgm        x4, [x2])
> +       add     x2, x2, x5
> +       add     x3, x3, x5
> +       tst     x2, #(PAGE_SIZE - 1)
> +       b.ne    1b
> +
> +       mov x0, #0
> +       ret
> +
> +2:     mov x0, #-EFAULT
> +       ret
> +SYM_FUNC_END(mte_copy_mc_page_tags)
> +
>  /*
>   * Read tags from a user buffer (one tag per byte) and set the correspon=
ding
>   * tags at the given kernel address. Used by PTRACE_POKEMTETAGS.
> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
> index a7bb20055ce0..9765e40cde6c 100644
> --- a/arch/arm64/mm/copypage.c
> +++ b/arch/arm64/mm/copypage.c
> @@ -14,6 +14,25 @@
>  #include <asm/cpufeature.h>
>  #include <asm/mte.h>
>
> +static int do_mte(struct page *to, struct page *from, void *kto, void *k=
from, bool mc)
> +{
> +       int ret =3D 0;
> +
> +       if (system_supports_mte() && page_mte_tagged(from)) {
> +               /* It's a new page, shouldn't have been tagged yet */
> +               WARN_ON_ONCE(!try_page_mte_tagging(to));
> +               if (mc)
> +                       ret =3D mte_copy_mc_page_tags(kto, kfrom);
> +               else
> +                       mte_copy_page_tags(kto, kfrom);
> +
> +               if (!ret)
> +                       set_page_mte_tagged(to);
> +       }
> +
> +       return ret;
> +}
> +
>  void copy_highpage(struct page *to, struct page *from)
>  {
>         void *kto =3D page_address(to);
> @@ -24,12 +43,7 @@ void copy_highpage(struct page *to, struct page *from)
>         if (kasan_hw_tags_enabled())
>                 page_kasan_tag_reset(to);
>
> -       if (system_supports_mte() && page_mte_tagged(from)) {
> -               /* It's a new page, shouldn't have been tagged yet */
> -               WARN_ON_ONCE(!try_page_mte_tagging(to));
> -               mte_copy_page_tags(kto, kfrom);
> -               set_page_mte_tagged(to);
> -       }
> +       do_mte(to, from, kto, kfrom, false);
>  }
>  EXPORT_SYMBOL(copy_highpage);
>
> @@ -40,3 +54,43 @@ void copy_user_highpage(struct page *to, struct page *=
from,
>         flush_dcache_page(to);
>  }
>  EXPORT_SYMBOL_GPL(copy_user_highpage);
> +
> +#ifdef CONFIG_ARCH_HAS_COPY_MC
> +/*
> + * Return -EFAULT if anything goes wrong while copying page or mte.
> + */
> +int copy_mc_highpage(struct page *to, struct page *from)
> +{
> +       void *kto =3D page_address(to);
> +       void *kfrom =3D page_address(from);
> +       int ret;
> +
> +       ret =3D copy_mc_page(kto, kfrom);
> +       if (ret)
> +               return -EFAULT;
> +
> +       if (kasan_hw_tags_enabled())
> +               page_kasan_tag_reset(to);
> +
> +       ret =3D do_mte(to, from, kto, kfrom, true);
> +       if (ret)
> +               return -EFAULT;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(copy_mc_highpage);
> +
> +int copy_mc_user_highpage(struct page *to, struct page *from,
> +                       unsigned long vaddr, struct vm_area_struct *vma)
> +{
> +       int ret;
> +
> +       ret =3D copy_mc_highpage(to, from);
> +
> +       if (!ret)
> +               flush_dcache_page(to);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(copy_mc_user_highpage);
> +#endif
> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
> index 28ec35e3d210..bdc81518d207 100644
> --- a/arch/arm64/mm/extable.c
> +++ b/arch/arm64/mm/extable.c
> @@ -16,7 +16,7 @@ get_ex_fixup(const struct exception_table_entry *ex)
>         return ((unsigned long)&ex->fixup + ex->fixup);
>  }
>
> -static bool ex_handler_uaccess_err_zero(const struct exception_table_ent=
ry *ex,
> +static bool ex_handler_fixup_err_zero(const struct exception_table_entry=
 *ex,
>                                         struct pt_regs *regs)
>  {
>         int reg_err =3D FIELD_GET(EX_DATA_REG_ERR, ex->data);
> @@ -69,7 +69,7 @@ bool fixup_exception(struct pt_regs *regs)
>                 return ex_handler_bpf(ex, regs);
>         case EX_TYPE_UACCESS_ERR_ZERO:
>         case EX_TYPE_KACCESS_ERR_ZERO:
> -               return ex_handler_uaccess_err_zero(ex, regs);
> +               return ex_handler_fixup_err_zero(ex, regs);
>         case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
>                 return ex_handler_load_unaligned_zeropad(ex, regs);
>         }
> @@ -87,7 +87,8 @@ bool fixup_exception_mc(struct pt_regs *regs)
>
>         switch (ex->type) {
>         case EX_TYPE_UACCESS_ERR_ZERO:
> -               return ex_handler_uaccess_err_zero(ex, regs);
> +       case EX_TYPE_COPY_MC_PAGE_ERR_ZERO:
> +               return ex_handler_fixup_err_zero(ex, regs);
>         }
>
>         return false;
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index c5ca1a1fc4f5..a42470ca42f2 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -332,6 +332,7 @@ static inline void copy_highpage(struct page *to, str=
uct page *from)
>  #endif
>
>  #ifdef copy_mc_to_kernel
> +#ifndef __HAVE_ARCH_COPY_MC_USER_HIGHPAGE
>  /*
>   * If architecture supports machine check exception handling, define the
>   * #MC versions of copy_user_highpage and copy_highpage. They copy a mem=
ory
> @@ -354,7 +355,9 @@ static inline int copy_mc_user_highpage(struct page *=
to, struct page *from,
>
>         return ret ? -EFAULT : 0;
>  }
> +#endif
>
> +#ifndef __HAVE_ARCH_COPY_MC_HIGHPAGE
>  static inline int copy_mc_highpage(struct page *to, struct page *from)
>  {
>         unsigned long ret;
> @@ -370,20 +373,25 @@ static inline int copy_mc_highpage(struct page *to,=
 struct page *from)
>
>         return ret ? -EFAULT : 0;
>  }
> +#endif
>  #else
> +#ifndef __HAVE_ARCH_COPY_MC_USER_HIGHPAGE
>  static inline int copy_mc_user_highpage(struct page *to, struct page *fr=
om,
>                                         unsigned long vaddr, struct vm_ar=
ea_struct *vma)
>  {
>         copy_user_highpage(to, from, vaddr, vma);
>         return 0;
>  }
> +#endif
>
> +#ifndef __HAVE_ARCH_COPY_MC_HIGHPAGE
>  static inline int copy_mc_highpage(struct page *to, struct page *from)
>  {
>         copy_highpage(to, from);
>         return 0;
>  }
>  #endif
> +#endif
>
>  static inline void memcpy_page(struct page *dst_page, size_t dst_off,
>                                struct page *src_page, size_t src_off,
> --
> 2.25.1
>

+Peter
