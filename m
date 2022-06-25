Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794FB55A64C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 05:08:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVJpV1XGvz3cjF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 13:08:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FU+dZqhP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FU+dZqhP;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVJnp2dx8z3bZc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 13:07:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0064AB8216B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 03:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD52EC385A5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 03:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656126456;
	bh=oXHgCaP4HoPf+EWVcl07MPhIxJZH52Q6LkxiX0QDRik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FU+dZqhPCI7WaKDA+AjLnOS95m8QPJ0z8ReiNhcC2P4NI+ZrmxNZzDJ5YJTkaoQPc
	 SatgzVUTcSgwyHrsucOh+GM4g3/1+h+GgSSKqGqW1IBs4BT6j/vgsdecXBdHRGrd/2
	 AqxR5wuq64YrbhfjN2MwpcKf3vhLfmFGvSGSPpQJKPSvpHYebZMLXmOJS28s2TD7Ve
	 tSI/XbxbVWusqsHNpvvUVuXqKWV5X3nWDwd3AKdS2EZyyoyoyyVia9ScMoTkLyaHef
	 IZZEeQ2fgwO8fwjgwOcJcINmgNazhx1HiRXE5XjDpGoZob6l6d4Fa9hcpl/FGH0gH1
	 y2/GNgWsUtZKQ==
Received: by mail-vs1-f45.google.com with SMTP id e7so3904827vsp.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 20:07:36 -0700 (PDT)
X-Gm-Message-State: AJIora8Zcqqd0WIWcNBC7eLMLOTat4ghSFDgoxYNr5B7NY319ali1eRv
	VbT0oWBtUPj9PKmqI5bOc8r7AS31yAcSsD5Rf+8=
X-Google-Smtp-Source: AGRyM1vKaBnKP+OKs0X53+qz3soArX9HkvW+CKQD7jqShPo7H3ehVP4Gjy9lyocTRtcrWI2zFmWCsaDUISHvTXAw0RU=
X-Received: by 2002:a05:6102:3e93:b0:353:a8fb:e922 with SMTP id
 m19-20020a0561023e9300b00353a8fbe922mr711833vsv.51.1656126455677; Fri, 24 Jun
 2022 20:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220624044339.1533882-1-anshuman.khandual@arm.com> <20220624044339.1533882-18-anshuman.khandual@arm.com>
In-Reply-To: <20220624044339.1533882-18-anshuman.khandual@arm.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 25 Jun 2022 11:07:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQXpYggbN8vbv+XVkORDEBbUAJJaJsbN2ZtSbjGfem1Tg@mail.gmail.com>
Message-ID: <CAJF2gTQXpYggbN8vbv+XVkORDEBbUAJJaJsbN2ZtSbjGfem1Tg@mail.gmail.com>
Subject: Re: [PATCH V4 17/26] csky/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: Anshuman Khandual <anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, linux-csky@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, linux-hexagon@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-snps-arc@lists.infradead.org, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Openrisc <openrisc@lists.librecores.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Parisc List <linux-parisc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For csky part.

Acked-by: Guo Ren <guoren@kernel.org>


On Fri, Jun 24, 2022 at 12:48 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
> vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
> up a private and static protection_map[] array. Subsequently all __SXXX and
> __PXXX macros can be dropped which are no longer needed.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-csky@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/csky/Kconfig               |  1 +
>  arch/csky/include/asm/pgtable.h | 18 ------------------
>  arch/csky/mm/init.c             | 20 ++++++++++++++++++++
>  3 files changed, 21 insertions(+), 18 deletions(-)
>
> diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
> index 21d72b078eef..588b8a9c68ed 100644
> --- a/arch/csky/Kconfig
> +++ b/arch/csky/Kconfig
> @@ -6,6 +6,7 @@ config CSKY
>         select ARCH_HAS_GCOV_PROFILE_ALL
>         select ARCH_HAS_SYNC_DMA_FOR_CPU
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +       select ARCH_HAS_VM_GET_PAGE_PROT
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_QUEUED_RWLOCKS
>         select ARCH_WANT_FRAME_POINTERS if !CPU_CK610 && $(cc-option,-mbacktrace)
> diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
> index bbe245117777..229a5f4ad7fc 100644
> --- a/arch/csky/include/asm/pgtable.h
> +++ b/arch/csky/include/asm/pgtable.h
> @@ -77,24 +77,6 @@
>  #define MAX_SWAPFILES_CHECK() \
>                 BUILD_BUG_ON(MAX_SWAPFILES_SHIFT != 5)
>
> -#define __P000 PAGE_NONE
> -#define __P001 PAGE_READ
> -#define __P010 PAGE_READ
> -#define __P011 PAGE_READ
> -#define __P100 PAGE_READ
> -#define __P101 PAGE_READ
> -#define __P110 PAGE_READ
> -#define __P111 PAGE_READ
> -
> -#define __S000 PAGE_NONE
> -#define __S001 PAGE_READ
> -#define __S010 PAGE_WRITE
> -#define __S011 PAGE_WRITE
> -#define __S100 PAGE_READ
> -#define __S101 PAGE_READ
> -#define __S110 PAGE_WRITE
> -#define __S111 PAGE_WRITE
> -
>  extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
>  #define ZERO_PAGE(vaddr)       (virt_to_page(empty_zero_page))
>
> diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
> index bf2004aa811a..1bf7b2a748fd 100644
> --- a/arch/csky/mm/init.c
> +++ b/arch/csky/mm/init.c
> @@ -197,3 +197,23 @@ void __init fixaddr_init(void)
>         vaddr = __fix_to_virt(__end_of_fixed_addresses - 1) & PMD_MASK;
>         fixrange_init(vaddr, vaddr + PMD_SIZE, swapper_pg_dir);
>  }
> +
> +static pgprot_t protection_map[16] __ro_after_init = {
> +       [VM_NONE]                                       = PAGE_NONE,
> +       [VM_READ]                                       = PAGE_READ,
> +       [VM_WRITE]                                      = PAGE_READ,
> +       [VM_WRITE | VM_READ]                            = PAGE_READ,
> +       [VM_EXEC]                                       = PAGE_READ,
> +       [VM_EXEC | VM_READ]                             = PAGE_READ,
> +       [VM_EXEC | VM_WRITE]                            = PAGE_READ,
> +       [VM_EXEC | VM_WRITE | VM_READ]                  = PAGE_READ,
> +       [VM_SHARED]                                     = PAGE_NONE,
> +       [VM_SHARED | VM_READ]                           = PAGE_READ,
> +       [VM_SHARED | VM_WRITE]                          = PAGE_WRITE,
> +       [VM_SHARED | VM_WRITE | VM_READ]                = PAGE_WRITE,
> +       [VM_SHARED | VM_EXEC]                           = PAGE_READ,
> +       [VM_SHARED | VM_EXEC | VM_READ]                 = PAGE_READ,
> +       [VM_SHARED | VM_EXEC | VM_WRITE]                = PAGE_WRITE,
> +       [VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]      = PAGE_WRITE
> +};
> +DECLARE_VM_GET_PAGE_PROT
> --
> 2.25.1
>


--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
