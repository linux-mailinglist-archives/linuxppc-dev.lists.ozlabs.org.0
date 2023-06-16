Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D36247337FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 20:15:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MRdJy0Rg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjS5B5gMdz3bvJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 04:15:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MRdJy0Rg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjS4D51ZTz306B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 04:14:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6988962D0C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 18:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF78C433A9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 18:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686939285;
	bh=BGYZV1Km+8ZgDrE9neT/E0fU3u3ixvSh8AYCC3TbmE4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MRdJy0RgrSJF59KF/EC7N3hN4NM7JkZeq3KagnV0DWy1PIpTqhhanwN+rGe8zgC2V
	 MRnDgp8J0NexGL29v4Mucemw/3yZahpXPMUqiEhZDo6PLZ3uYpYsxd3ZL1fbGvwWwe
	 p/R8vyd2pT+khqUskQVZmRQf+jE0REJ8n2qSSkUm6kasMtDdPJCEzuxpbIe8qI0/Ui
	 gBxANtpHkUielBt2ehqqh3PqnGUAKKbbWba+orljx4X0xezuIPakLsTrSk3Gr6J6ZG
	 8yTxdvadfsX9qXvWVMaa8ZKkExpaD1sIFaCwY2WSngDPZW1skSPKVqWoP3yaiF1YJ9
	 Nln3oL3E93qMg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f611ac39c5so1421455e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 11:14:45 -0700 (PDT)
X-Gm-Message-State: AC+VfDxtaFpnsoDiQeJwgkxXY/4/j8FnS4Y4LQXZwg8btEeM9LcEmU4f
	1goeZTca8XtykZYl9pQ5ynZDpLvxnIEU/G04Qzs=
X-Google-Smtp-Source: ACHHUZ76yiO622Uh9+9rKEsm8ImEC4jXzUaBUsNUHgrPnEQ5V1l0GL/PgIuvK/efbFnHaYtpj3eltn1zagg/5cT90Eo=
X-Received: by 2002:a19:ab11:0:b0:4f3:bbfe:db4e with SMTP id
 u17-20020a19ab11000000b004f3bbfedb4emr1747329lfe.56.1686939283176; Fri, 16
 Jun 2023 11:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-2-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-2-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:14:31 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4nDne7L=Qh142w+dMX2pqM_4k+SZSB=QBJ8ruG_j8dug@mail.gmail.com>
Message-ID: <CAPhsuW4nDne7L=Qh142w+dMX2pqM_4k+SZSB=QBJ8ruG_j8dug@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] nios2: define virtual address space for modules
To: Mike Rapoport <rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 1:51=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> nios2 uses kmalloc() to implement module_alloc() because CALL26/PCREL26
> cannot reach all of vmalloc address space.
>
> Define module space as 32MiB below the kernel base and switch nios2 to
> use vmalloc for module allocations.
>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>

Acked-by: Song Liu <song@kernel.org>


> ---
>  arch/nios2/include/asm/pgtable.h |  5 ++++-
>  arch/nios2/kernel/module.c       | 19 ++++---------------
>  2 files changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pg=
table.h
> index 0f5c2564e9f5..0073b289c6a4 100644
> --- a/arch/nios2/include/asm/pgtable.h
> +++ b/arch/nios2/include/asm/pgtable.h
> @@ -25,7 +25,10 @@
>  #include <asm-generic/pgtable-nopmd.h>
>
>  #define VMALLOC_START          CONFIG_NIOS2_KERNEL_MMU_REGION_BASE
> -#define VMALLOC_END            (CONFIG_NIOS2_KERNEL_REGION_BASE - 1)
> +#define VMALLOC_END            (CONFIG_NIOS2_KERNEL_REGION_BASE - SZ_32M=
 - 1)
> +
> +#define MODULES_VADDR          (CONFIG_NIOS2_KERNEL_REGION_BASE - SZ_32M=
)
> +#define MODULES_END            (CONFIG_NIOS2_KERNEL_REGION_BASE - 1)
>
>  struct mm_struct;
>
> diff --git a/arch/nios2/kernel/module.c b/arch/nios2/kernel/module.c
> index 76e0a42d6e36..9c97b7513853 100644
> --- a/arch/nios2/kernel/module.c
> +++ b/arch/nios2/kernel/module.c
> @@ -21,23 +21,12 @@
>
>  #include <asm/cacheflush.h>
>
> -/*
> - * Modules should NOT be allocated with kmalloc for (obvious) reasons.
> - * But we do it for now to avoid relocation issues. CALL26/PCREL26 canno=
t reach
> - * from 0x80000000 (vmalloc area) to 0xc00000000 (kernel) (kmalloc retur=
ns
> - * addresses in 0xc0000000)
> - */
>  void *module_alloc(unsigned long size)
>  {
> -       if (size =3D=3D 0)
> -               return NULL;
> -       return kmalloc(size, GFP_KERNEL);
> -}
> -
> -/* Free memory returned from module_alloc */
> -void module_memfree(void *module_region)
> -{
> -       kfree(module_region);
> +       return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> +                                   GFP_KERNEL, PAGE_KERNEL_EXEC,
> +                                   VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
> +                                   __builtin_return_address(0));
>  }
>
>  int apply_relocate_add(Elf32_Shdr *sechdrs, const char *strtab,
> --
> 2.35.1
>
