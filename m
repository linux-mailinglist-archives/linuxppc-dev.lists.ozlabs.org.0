Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9E153D6B6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 14:14:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LFdwf6Dmrz3bmH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 22:14:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GIyFj6BB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GIyFj6BB;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LFdvz5nqPz3bk5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jun 2022 22:14:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0AFC4B803F7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jun 2022 12:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182A1C341C4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jun 2022 12:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654344842;
	bh=P9g5evQvLeCWlEOvlwctyGL5SApo79l0tSxaVcIHKPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GIyFj6BBzBZ4owCCVP5Aw4h3f0cXtR3hEqmrT9g670pZU/aQzIAQ2WfJvI/DknBRp
	 4bYKwydQ0aYuGH1L5fBQCLpyzXIofO9higKucAr9Sy6M/NdNgRTqlWLPjz76TpemCg
	 o5/euygaM3XOLTr8By89APAq6jiMVCST2z+Q9PMv3E7nS9Z42DH7R0OrYd6SVheduF
	 EZlfIsJBqn4SM90nhHS8OrgxuSA94ZHCoBGkUfXicORrA8v5ly8ntcA/nQuwU0e9It
	 FE7DXLjmfzYeTqs7rwtKtwfeJR+KZPybsrMoiF6VsZOU0EImc2irdP0IzRClSsVLBw
	 zeZ+URjHsYFVg==
Received: by mail-vs1-f49.google.com with SMTP id i186so9673664vsc.9
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Jun 2022 05:14:02 -0700 (PDT)
X-Gm-Message-State: AOAM5311yyJHqh4LUDRzPIdeJJ7l2L6L6uj5Bv377d6xaH3ADwpH71ZB
	C0yfVU6PeFq04xyBjcf1TY5CgnNlxp9gIpbh8E8=
X-Google-Smtp-Source: ABdhPJwwEZX9ryeNihnPAt9cIeqrE+zZlFv6d4BeVpnc8qN7eqFa9hlNwwNfnB2L+k7vfA514WdPGRvZColxx5FoxRk=
X-Received: by 2002:a05:6102:292b:b0:34b:9fad:2b63 with SMTP id
 cz43-20020a056102292b00b0034b9fad2b63mr2132145vsb.51.1654344840935; Sat, 04
 Jun 2022 05:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220603101411.488970-1-anshuman.khandual@arm.com> <20220603101411.488970-5-anshuman.khandual@arm.com>
In-Reply-To: <20220603101411.488970-5-anshuman.khandual@arm.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 4 Jun 2022 20:13:50 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQOKUfCyaU7gqkejvoJWeSnqc5QyyzWQCw1RJ8PEB2zKg@mail.gmail.com>
Message-ID: <CAJF2gTQOKUfCyaU7gqkejvoJWeSnqc5QyyzWQCw1RJ8PEB2zKg@mail.gmail.com>
Subject: Re: [PATCH 4/6] csky/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>, Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Openrisc <openrisc@lists.librecores.org>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-by: Guo Ren <guoren@kernel.org>

On Fri, Jun 3, 2022 at 6:15 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> This defines and exports a platform specific custom vm_get_page_prot() via
> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
> macros can be dropped which are no longer needed.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-csky@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/csky/Kconfig               |  1 +
>  arch/csky/include/asm/pgtable.h | 18 ------------------
>  arch/csky/mm/init.c             | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 33 insertions(+), 18 deletions(-)
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
> index bf2004aa811a..f9babbed17d4 100644
> --- a/arch/csky/mm/init.c
> +++ b/arch/csky/mm/init.c
> @@ -197,3 +197,35 @@ void __init fixaddr_init(void)
>         vaddr = __fix_to_virt(__end_of_fixed_addresses - 1) & PMD_MASK;
>         fixrange_init(vaddr, vaddr + PMD_SIZE, swapper_pg_dir);
>  }
> +
> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
> +{
> +       switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
> +       case VM_NONE:
> +               return PAGE_NONE;
> +       case VM_READ:
> +       case VM_WRITE:
> +       case VM_WRITE | VM_READ:
> +       case VM_EXEC:
> +       case VM_EXEC | VM_READ:
> +       case VM_EXEC | VM_WRITE:
> +       case VM_EXEC | VM_WRITE | VM_READ:
> +               return PAGE_READ;
> +       case VM_SHARED:
> +               return PAGE_NONE;
> +       case VM_SHARED | VM_READ:
> +               return PAGE_READ;
> +       case VM_SHARED | VM_WRITE:
> +       case VM_SHARED | VM_WRITE | VM_READ:
> +               return PAGE_WRITE;
> +       case VM_SHARED | VM_EXEC:
> +       case VM_SHARED | VM_EXEC | VM_READ:
> +               return PAGE_READ;
> +       case VM_SHARED | VM_EXEC | VM_WRITE:
> +       case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
> +               return PAGE_WRITE;
> +       default:
> +               BUILD_BUG();
> +       }
> +}
> +EXPORT_SYMBOL(vm_get_page_prot);
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
