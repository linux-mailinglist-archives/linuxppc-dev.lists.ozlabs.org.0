Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C5788E67C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 15:38:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PH2tmgMt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4TnQ0D3Hz3vgD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 01:38:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PH2tmgMt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Tmh3hC6z2y71
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 01:38:12 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e709e0c123so5411992b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1711550288; x=1712155088; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62e02ZJiOBiUx9nE4yZd2VXfIcaCZ5n4EKmL0LL89oM=;
        b=PH2tmgMtJN18GjFkb9C70wdjbkY6TXlA1laumzs8/EJPaNOgIPXYj0DTmhE5QTPdjl
         3LEWuxgUs//wEj6u8tBJRnF8iM4b0Q8WeijzuH4B0potc3rkfRorZj0XnoVFd7IfoDgX
         5DzGOPzYYm6GVut5Q5DRpxAWvnIxtr9M9S41VgmPn9/LFyFZaFGZdQIGUwCeZi4EsLYh
         c4dg8+GA1xRjP7k//2G6j3ftAi8MttM3ejyehhFI31CPS0VOZrABZWF6FJeoFKY/Fh06
         K8XqiguS8tQtUggdCYiyd9XGgFC0y8oKfdJHz1FVvq93LYXLvUoQtvmO8f/LSAnvXkyE
         5aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550288; x=1712155088;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62e02ZJiOBiUx9nE4yZd2VXfIcaCZ5n4EKmL0LL89oM=;
        b=mEJGH+5E1mP5HK7dz2jlQz+BAs4a2p+MFw4VrYyScGj4vylfDsM2ulsF/AEMOs7A3E
         EMlRgyhKHINfHEQQCtU8kqJoRVptPWj6pvf4M/OFfE7VpKxXARGpY4W5QL/OzCVM4nkZ
         AQhkbb7T89fHw6WaM7elzEUXGp4XZR/bYCA+HutjqT/+2Y+VIyrHDuWwEnB2wIn+eRfH
         JA3IGdcZbrQZ0szE8ypJy6fzkqSDjnLx0amCaSVg+t5e7NscQsvJE/M1Qvkn4+/VGKF/
         5xAhRqx1m3X8nRDLkF9X8QOlekvtjynPqrtNlv2cM6R8jpaHRIXzaVoOZHfeRakx2W6m
         Z62w==
X-Forwarded-Encrypted: i=1; AJvYcCUpf/e2tSAjmxD/kCNgJQUWsMZw5WuoEuBiWX7GDrWC4kJnOyzPcHMqnSDUg2ZV1lxdhfENlWAUNUV9nxdFsIcSP2sBI2py0/lXUart3g==
X-Gm-Message-State: AOJu0YzI6gQCKakS9JIumLRlFiw+qzdZtJkKkd52IOUB3Qwxklv9EkZ6
	me3IPmDddFHZiGRey+dW9/KeAsKgzLzJJtrpVUAG5Sq7vOawGXv3mOpmr00uDwY=
X-Google-Smtp-Source: AGHT+IFyCEdH6JyzL0GlGOQ3Vv7tpqbVcDK1otySOtCn4QIbbD69ta+fqdT57hyTuYAu4DWmtJ/GZA==
X-Received: by 2002:a05:6a00:14d3:b0:6ea:acbe:517a with SMTP id w19-20020a056a0014d300b006eaacbe517amr1635574pfu.16.1711550287270;
        Wed, 27 Mar 2024 07:38:07 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id c14-20020a056a000ace00b006eab60bca64sm4144777pfl.177.2024.03.27.07.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:38:06 -0700 (PDT)
Date: Wed, 27 Mar 2024 07:38:06 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Mar 2024 07:38:05 PDT (-0700)
Subject: Re: [PATCH v2 2/5] arm64, powerpc, riscv, s390, x86: ptdump: Refactor CONFIG_DEBUG_WX
In-Reply-To: <a59b102d7964261d31ead0316a9f18628e4e7a8e.1706610398.git.christophe.leroy@csgroup.eu>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: christophe.leroy@csgroup.eu
Message-ID: <mhng-b47e2ac2-94d8-48a0-a8e9-d82a87d8fe78@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, peterz@infradead.org, Catalin Marinas <catalin.marinas@arm.com>, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, agordeev@linux.ibm.com, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, alexghiti@rivosinc.com, linux-s390@vger.kernel.org, tranmanphong@gmail.com, x86@kernel.org, linux@armlinux.org.uk, steven.price@arm.com, aneesh.kumar@kernel.org, mingo@redhat.com, greg@kroah.com, naveen.n.rao@linux.ibm.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, bp@alien8.de, luto@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, svens@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 30 Jan 2024 02:34:33 PST (-0800), christophe.leroy@csgroup.eu wrote:
> All architectures using the core ptdump functionality also implement
> CONFIG_DEBUG_WX, and they all do it more or less the same way, with a
> function called debug_checkwx() that is called by mark_rodata_ro(),
> which is a substitute to ptdump_check_wx() when CONFIG_DEBUG_WX is
> set and a no-op otherwise.
>
> Refactor by centraly defining debug_checkwx() in linux/ptdump.h and
> call debug_checkwx() immediately after calling mark_rodata_ro()
> instead of calling it at the end of every mark_rodata_ro().
>
> On x86_32, mark_rodata_ro() first checks __supported_pte_mask has
> _PAGE_NX before calling debug_checkwx(). Now the check is inside the
> callee ptdump_walk_pgd_level_checkwx().
>
> On powerpc_64, mark_rodata_ro() bails out early before calling
> ptdump_check_wx() when the MMU doesn't have KERNEL_RO feature. The
> check is now also done in ptdump_check_wx() as it is called outside
> mark_rodata_ro().
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> v2: For x86 change macro ptdump_check_wx() to ptdump_check_wx
> ---
>  arch/arm64/include/asm/ptdump.h |  7 -------
>  arch/arm64/mm/mmu.c             |  2 --
>  arch/powerpc/mm/mmu_decl.h      |  6 ------
>  arch/powerpc/mm/pgtable_32.c    |  4 ----
>  arch/powerpc/mm/pgtable_64.c    |  3 ---
>  arch/powerpc/mm/ptdump/ptdump.c |  3 +++
>  arch/riscv/include/asm/ptdump.h | 22 ----------------------
>  arch/riscv/mm/init.c            |  3 ---
>  arch/riscv/mm/ptdump.c          |  1 -
>  arch/s390/include/asm/ptdump.h  | 14 --------------
>  arch/s390/mm/dump_pagetables.c  |  1 -
>  arch/s390/mm/init.c             |  2 --
>  arch/x86/include/asm/pgtable.h  |  3 +--
>  arch/x86/mm/dump_pagetables.c   |  3 +++
>  arch/x86/mm/init_32.c           |  2 --
>  arch/x86/mm/init_64.c           |  2 --
>  include/linux/ptdump.h          |  7 +++++++
>  init/main.c                     |  2 ++
>  18 files changed, 16 insertions(+), 71 deletions(-)
>  delete mode 100644 arch/riscv/include/asm/ptdump.h
>  delete mode 100644 arch/s390/include/asm/ptdump.h
>
> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
> index 581caac525b0..5b1701c76d1c 100644
> --- a/arch/arm64/include/asm/ptdump.h
> +++ b/arch/arm64/include/asm/ptdump.h
> @@ -29,13 +29,6 @@ void __init ptdump_debugfs_register(struct ptdump_info *info, const char *name);
>  static inline void ptdump_debugfs_register(struct ptdump_info *info,
>  					   const char *name) { }
>  #endif
> -void ptdump_check_wx(void);
>  #endif /* CONFIG_PTDUMP_CORE */
>
> -#ifdef CONFIG_DEBUG_WX
> -#define debug_checkwx()	ptdump_check_wx()
> -#else
> -#define debug_checkwx()	do { } while (0)
> -#endif
> -
>  #endif /* __ASM_PTDUMP_H */
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 1ac7467d34c9..3a27d887f7dd 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -632,8 +632,6 @@ void mark_rodata_ro(void)
>  	section_size = (unsigned long)__init_begin - (unsigned long)__start_rodata;
>  	update_mapping_prot(__pa_symbol(__start_rodata), (unsigned long)__start_rodata,
>  			    section_size, PAGE_KERNEL_RO);
> -
> -	debug_checkwx();
>  }
>
>  static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
> index 72341b9fb552..90dcc2844056 100644
> --- a/arch/powerpc/mm/mmu_decl.h
> +++ b/arch/powerpc/mm/mmu_decl.h
> @@ -171,12 +171,6 @@ static inline void mmu_mark_rodata_ro(void) { }
>  void __init mmu_mapin_immr(void);
>  #endif
>
> -#ifdef CONFIG_DEBUG_WX
> -void ptdump_check_wx(void);
> -#else
> -static inline void ptdump_check_wx(void) { }
> -#endif
> -
>  static inline bool debug_pagealloc_enabled_or_kfence(void)
>  {
>  	return IS_ENABLED(CONFIG_KFENCE) || debug_pagealloc_enabled();
> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
> index 5c02fd08d61e..12498017da8e 100644
> --- a/arch/powerpc/mm/pgtable_32.c
> +++ b/arch/powerpc/mm/pgtable_32.c
> @@ -153,7 +153,6 @@ void mark_rodata_ro(void)
>
>  	if (v_block_mapped((unsigned long)_stext + 1)) {
>  		mmu_mark_rodata_ro();
> -		ptdump_check_wx();
>  		return;
>  	}
>
> @@ -166,9 +165,6 @@ void mark_rodata_ro(void)
>  		   PFN_DOWN((unsigned long)_stext);
>
>  	set_memory_ro((unsigned long)_stext, numpages);
> -
> -	// mark_initmem_nx() should have already run by now
> -	ptdump_check_wx();
>  }
>  #endif
>
> diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
> index 5ac1fd30341b..1b366526f4f2 100644
> --- a/arch/powerpc/mm/pgtable_64.c
> +++ b/arch/powerpc/mm/pgtable_64.c
> @@ -150,9 +150,6 @@ void mark_rodata_ro(void)
>  		radix__mark_rodata_ro();
>  	else
>  		hash__mark_rodata_ro();
> -
> -	// mark_initmem_nx() should have already run by now
> -	ptdump_check_wx();
>  }
>
>  void mark_initmem_nx(void)
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index 2313053fe679..620d4917ebe8 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -343,6 +343,9 @@ void ptdump_check_wx(void)
>  		}
>  	};
>
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !mmu_has_feature(MMU_FTR_KERNEL_RO))
> +		return;
> +
>  	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
>
>  	if (st.wx_pages)
> diff --git a/arch/riscv/include/asm/ptdump.h b/arch/riscv/include/asm/ptdump.h
> deleted file mode 100644
> index 3c9ea6dd5af7..000000000000
> --- a/arch/riscv/include/asm/ptdump.h
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright (C) 2019 SiFive
> - */
> -
> -#ifndef _ASM_RISCV_PTDUMP_H
> -#define _ASM_RISCV_PTDUMP_H
> -
> -void ptdump_check_wx(void);
> -
> -#ifdef CONFIG_DEBUG_WX
> -static inline void debug_checkwx(void)
> -{
> -	ptdump_check_wx();
> -}
> -#else
> -static inline void debug_checkwx(void)
> -{
> -}
> -#endif
> -
> -#endif /* _ASM_RISCV_PTDUMP_H */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 32cad6a65ccd..c5c69f38d11e 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -29,7 +29,6 @@
>  #include <asm/io.h>
>  #include <asm/numa.h>
>  #include <asm/pgtable.h>
> -#include <asm/ptdump.h>
>  #include <asm/sections.h>
>  #include <asm/soc.h>
>  #include <asm/tlbflush.h>
> @@ -723,8 +722,6 @@ void mark_rodata_ro(void)
>  	if (IS_ENABLED(CONFIG_64BIT))
>  		set_kernel_memory(lm_alias(__start_rodata), lm_alias(_data),
>  				  set_memory_ro);
> -
> -	debug_checkwx();
>  }
>  #else
>  static __init pgprot_t pgprot_from_va(uintptr_t va)
> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
> index 657c27bc07a7..075265603313 100644
> --- a/arch/riscv/mm/ptdump.c
> +++ b/arch/riscv/mm/ptdump.c
> @@ -9,7 +9,6 @@
>  #include <linux/seq_file.h>
>  #include <linux/ptdump.h>
>
> -#include <asm/ptdump.h>
>  #include <linux/pgtable.h>
>  #include <asm/kasan.h>
>
> diff --git a/arch/s390/include/asm/ptdump.h b/arch/s390/include/asm/ptdump.h
> deleted file mode 100644
> index f960b2896606..000000000000
> --- a/arch/s390/include/asm/ptdump.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifndef _ASM_S390_PTDUMP_H
> -#define _ASM_S390_PTDUMP_H
> -
> -void ptdump_check_wx(void);
> -
> -static inline void debug_checkwx(void)
> -{
> -	if (IS_ENABLED(CONFIG_DEBUG_WX))
> -		ptdump_check_wx();
> -}
> -
> -#endif /* _ASM_S390_PTDUMP_H */
> diff --git a/arch/s390/mm/dump_pagetables.c b/arch/s390/mm/dump_pagetables.c
> index d37a8f607b71..8dcb4e0c71bd 100644
> --- a/arch/s390/mm/dump_pagetables.c
> +++ b/arch/s390/mm/dump_pagetables.c
> @@ -6,7 +6,6 @@
>  #include <linux/mm.h>
>  #include <linux/kfence.h>
>  #include <linux/kasan.h>
> -#include <asm/ptdump.h>
>  #include <asm/kasan.h>
>  #include <asm/abs_lowcore.h>
>  #include <asm/nospec-branch.h>
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 43e612bc2bcd..d2e5eff9d1de 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -37,7 +37,6 @@
>  #include <asm/pgalloc.h>
>  #include <asm/ctlreg.h>
>  #include <asm/kfence.h>
> -#include <asm/ptdump.h>
>  #include <asm/dma.h>
>  #include <asm/abs_lowcore.h>
>  #include <asm/tlb.h>
> @@ -109,7 +108,6 @@ void mark_rodata_ro(void)
>
>  	__set_memory_ro(__start_ro_after_init, __end_ro_after_init);
>  	pr_info("Write protected read-only-after-init data: %luk\n", size >> 10);
> -	debug_checkwx();
>  }
>
>  int set_memory_encrypted(unsigned long vaddr, int numpages)
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 9d077bca6a10..6c979028e521 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -32,6 +32,7 @@ void ptdump_walk_pgd_level(struct seq_file *m, struct mm_struct *mm);
>  void ptdump_walk_pgd_level_debugfs(struct seq_file *m, struct mm_struct *mm,
>  				   bool user);
>  void ptdump_walk_pgd_level_checkwx(void);
> +#define ptdump_check_wx ptdump_walk_pgd_level_checkwx
>  void ptdump_walk_user_pgd_level_checkwx(void);
>
>  /*
> @@ -41,10 +42,8 @@ void ptdump_walk_user_pgd_level_checkwx(void);
>  #define pgprot_decrypted(prot)	__pgprot(cc_mkdec(pgprot_val(prot)))
>
>  #ifdef CONFIG_DEBUG_WX
> -#define debug_checkwx()		ptdump_walk_pgd_level_checkwx()
>  #define debug_checkwx_user()	ptdump_walk_user_pgd_level_checkwx()
>  #else
> -#define debug_checkwx()		do { } while (0)
>  #define debug_checkwx_user()	do { } while (0)
>  #endif
>
> diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
> index e1b599ecbbc2..0008524eebe9 100644
> --- a/arch/x86/mm/dump_pagetables.c
> +++ b/arch/x86/mm/dump_pagetables.c
> @@ -433,6 +433,9 @@ void ptdump_walk_user_pgd_level_checkwx(void)
>
>  void ptdump_walk_pgd_level_checkwx(void)
>  {
> +	if (!(__supported_pte_mask & _PAGE_NX))
> +		return;
> +
>  	ptdump_walk_pgd_level_core(NULL, &init_mm, INIT_PGD, true, false);
>  }
>
> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> index b63403d7179d..5c736b707cae 100644
> --- a/arch/x86/mm/init_32.c
> +++ b/arch/x86/mm/init_32.c
> @@ -800,6 +800,4 @@ void mark_rodata_ro(void)
>  	set_pages_ro(virt_to_page(start), size >> PAGE_SHIFT);
>  #endif
>  	mark_nxdata_nx();
> -	if (__supported_pte_mask & _PAGE_NX)
> -		debug_checkwx();
>  }
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index a0dffaca6d2b..ebdbcae48011 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -1412,8 +1412,6 @@ void mark_rodata_ro(void)
>  				(void *)text_end, (void *)rodata_start);
>  	free_kernel_image_pages("unused kernel image (rodata/data gap)",
>  				(void *)rodata_end, (void *)_sdata);
> -
> -	debug_checkwx();
>  }
>
>  /*
> diff --git a/include/linux/ptdump.h b/include/linux/ptdump.h
> index 2a3a95586425..c10513739bf9 100644
> --- a/include/linux/ptdump.h
> +++ b/include/linux/ptdump.h
> @@ -19,5 +19,12 @@ struct ptdump_state {
>  };
>
>  void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd);
> +void ptdump_check_wx(void);
> +
> +static inline void debug_checkwx(void)
> +{
> +	if (IS_ENABLED(CONFIG_DEBUG_WX))
> +		ptdump_check_wx();
> +}
>
>  #endif /* _LINUX_PTDUMP_H */
> diff --git a/init/main.c b/init/main.c
> index e24b0780fdff..749a9f8d2c9b 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -99,6 +99,7 @@
>  #include <linux/init_syscalls.h>
>  #include <linux/stackdepot.h>
>  #include <linux/randomize_kstack.h>
> +#include <linux/ptdump.h>
>  #include <net/net_namespace.h>
>
>  #include <asm/io.h>
> @@ -1408,6 +1409,7 @@ static void mark_readonly(void)
>  		 */
>  		rcu_barrier();
>  		mark_rodata_ro();
> +		debug_checkwx();
>  		rodata_test();
>  	} else
>  		pr_info("Kernel memory protection disabled.\n");

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
