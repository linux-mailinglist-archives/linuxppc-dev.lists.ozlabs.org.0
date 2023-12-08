Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC2880A57E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 15:31:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=HujZTOG+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmtqT1lL7z3dFr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 01:31:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=HujZTOG+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Smtpb1Pvgz3cR8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 01:30:30 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c317723a8so11098175e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Dec 2023 06:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702045827; x=1702650627; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9X8HQehrxqqdotEA60rYgF/5Z0BWv62JqBcRTG61sQ8=;
        b=HujZTOG+AFA4EYtZ4Kvq28/656rbs7kjKehjLD0XyBcwD9If3AsqTKd3qLrVwl9UYm
         hIRHUupY5QKfkuhLRNHisPFKfTmSBs+vaT04csJN1/T/3JvRIsoasjuYyDT9hVtD/3QF
         4d1T9SM/KDZaONEB78+5vJgnC7qREuX/OTaOgfo3bB4d7qXchlkqc4JSOJtpHnRqwNcF
         DCaiy5zXXHn3snhO5SDCc55BFXxSQ8vZhriKUJGXK84ThZtIS/7M7Bw3+HzZi0l6SA/s
         u90lf7D1zjYhj586b9EnvcBQq2gGE8HWlkGWmZcBwKmFr9DO2eVE2/bw2WA9ZVMSvGx4
         GfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702045827; x=1702650627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9X8HQehrxqqdotEA60rYgF/5Z0BWv62JqBcRTG61sQ8=;
        b=FMVIUWriGnmV2wuYfVU5eeb0eL482nLUCuWETFz58rniED0ESKDj9NxWenKpRysLIi
         aSa4RZSznnWtFeI6TFAPMtXWhtM8jpsG3m0sr3yIua4Np8lDfPfIG7QMRBCPZsFaBE7c
         69TTTSsGpuFQaDLCZhqSjWRhkgDko9OBeqe0oLeQt8+FKcFmbdcdBDPkVKwO4N2RbOvc
         2/psTNuiL4APxG0l4hRNCEsaT7pm2VWSVFR4qehRNmLoGbC/gv5sEAyIHSHqRg0rwuzs
         QfdVdIgQwJ4yCD8pDn+CuV/4uXfv6UTP/XUZnwUbXqrwKg+Z/f05eHpPNEYelnCv1T2l
         G5dw==
X-Gm-Message-State: AOJu0Yww3kXph6U/r8vSbPUf9Tsn8Ngir/Gvu4PHxYl0qxJBX6dGzqV1
	GukhQPyW5e8uyI46SYiHx+9KoTSRM2Bn8YCSTusAjw==
X-Google-Smtp-Source: AGHT+IF4tJfaa/fk4ZwgJmpqT0IJIacv8FURbcP3EIH//i3tM9hlmyqgmhJPetNv8trt2hsappah6dIbHJpD3YL5pXI=
X-Received: by 2002:a05:600c:4d0e:b0:40b:5e1e:cf1 with SMTP id
 u14-20020a05600c4d0e00b0040b5e1e0cf1mr33402wmp.44.1702045826774; Fri, 08 Dec
 2023 06:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20231207150348.82096-1-alexghiti@rivosinc.com>
 <20231207150348.82096-3-alexghiti@rivosinc.com> <6e3fb7b0-f47d-4d2f-b1b8-3ecc047b9ebf@csgroup.eu>
In-Reply-To: <6e3fb7b0-f47d-4d2f-b1b8-3ecc047b9ebf@csgroup.eu>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 8 Dec 2023 15:30:16 +0100
Message-ID: <CAHVXubg3rX_HOq=v4GCOVmDGVB3AA8kWWUsZTcZu6Y+Y2XmYQw@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 2/4] riscv: Add a runtime detection of invalid TLB
 entries caching
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Catalin Marinas <catalin.marinas@arm.com>, Dylan Jhong <dylan@andestech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Matt Evans <mev@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 7, 2023 at 4:55=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 07/12/2023 =C3=A0 16:03, Alexandre Ghiti a =C3=A9crit :
> > This mechanism allows to completely bypass the sfence.vma introduced by
> > the previous commit for uarchs that do not cache invalid TLB entries.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >   arch/riscv/mm/init.c | 124 ++++++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 124 insertions(+)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 379403de6c6f..2e854613740c 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -56,6 +56,8 @@ bool pgtable_l5_enabled =3D IS_ENABLED(CONFIG_64BIT) =
&& !IS_ENABLED(CONFIG_XIP_KER
> >   EXPORT_SYMBOL(pgtable_l4_enabled);
> >   EXPORT_SYMBOL(pgtable_l5_enabled);
> >
> > +bool tlb_caching_invalid_entries;
> > +
> >   phys_addr_t phys_ram_base __ro_after_init;
> >   EXPORT_SYMBOL(phys_ram_base);
> >
> > @@ -750,6 +752,18 @@ static void __init disable_pgtable_l4(void)
> >       satp_mode =3D SATP_MODE_39;
> >   }
> >
> > +static void __init enable_pgtable_l5(void)
> > +{
> > +     pgtable_l5_enabled =3D true;
> > +     satp_mode =3D SATP_MODE_57;
> > +}
> > +
> > +static void __init enable_pgtable_l4(void)
> > +{
> > +     pgtable_l4_enabled =3D true;
> > +     satp_mode =3D SATP_MODE_48;
> > +}
> > +
> >   static int __init print_no4lvl(char *p)
> >   {
> >       pr_info("Disabled 4-level and 5-level paging");
> > @@ -826,6 +840,112 @@ static __init void set_satp_mode(uintptr_t dtb_pa=
)
> >       memset(early_pud, 0, PAGE_SIZE);
> >       memset(early_pmd, 0, PAGE_SIZE);
> >   }
> > +
> > +/* Determine at runtime if the uarch caches invalid TLB entries */
> > +static __init void set_tlb_caching_invalid_entries(void)
> > +{
> > +#define NR_RETRIES_CACHING_INVALID_ENTRIES   50
>
> Looks odd to have macros nested in the middle of a function.
>
> > +     uintptr_t set_tlb_caching_invalid_entries_pmd =3D ((unsigned long=
)set_tlb_caching_invalid_entries) & PMD_MASK;
> > +     // TODO the test_addr as defined below could go into another pud.=
..
> > +     uintptr_t test_addr =3D set_tlb_caching_invalid_entries_pmd + 2 *=
 PMD_SIZE;
> > +     pmd_t valid_pmd;
> > +     u64 satp;
> > +     int i =3D 0;
> > +
> > +     /* To ease the page table creation */
> > +     disable_pgtable_l5();
> > +     disable_pgtable_l4();
> > +
> > +     /* Establish a mapping for set_tlb_caching_invalid_entries() in s=
v39 */
> > +     create_pgd_mapping(early_pg_dir,
> > +                        set_tlb_caching_invalid_entries_pmd,
> > +                        (uintptr_t)early_pmd,
> > +                        PGDIR_SIZE, PAGE_TABLE);
> > +
> > +     /* Handle the case where set_tlb_caching_invalid_entries straddle=
s 2 PMDs */
> > +     create_pmd_mapping(early_pmd,
> > +                        set_tlb_caching_invalid_entries_pmd,
> > +                        set_tlb_caching_invalid_entries_pmd,
> > +                        PMD_SIZE, PAGE_KERNEL_EXEC);
> > +     create_pmd_mapping(early_pmd,
> > +                        set_tlb_caching_invalid_entries_pmd + PMD_SIZE=
,
> > +                        set_tlb_caching_invalid_entries_pmd + PMD_SIZE=
,
> > +                        PMD_SIZE, PAGE_KERNEL_EXEC);
> > +
> > +     /* Establish an invalid mapping */
> > +     create_pmd_mapping(early_pmd, test_addr, 0, PMD_SIZE, __pgprot(0)=
);
> > +
> > +     /* Precompute the valid pmd here because the mapping for pfn_pmd(=
) won't exist */
> > +     valid_pmd =3D pfn_pmd(PFN_DOWN(set_tlb_caching_invalid_entries_pm=
d), PAGE_KERNEL);
> > +
> > +     local_flush_tlb_all();
> > +     satp =3D PFN_DOWN((uintptr_t)&early_pg_dir) | SATP_MODE_39;
> > +     csr_write(CSR_SATP, satp);
> > +
> > +     /*
> > +      * Set stvec to after the trapping access, access this invalid ma=
pping
> > +      * and legitimately trap
> > +      */
> > +     // TODO: Should I save the previous stvec?
> > +#define ASM_STR(x)   __ASM_STR(x)
>
> Looks odd to have macros nested in the middle of a function.
>
>
> > +     asm volatile(
> > +             "la a0, 1f                              \n"
> > +             "csrw " ASM_STR(CSR_TVEC) ", a0         \n"
> > +             "ld a0, 0(%0)                           \n"
> > +             ".align 2                               \n"
> > +             "1:                                     \n"
> > +             :
> > +             : "r" (test_addr)
> > +             : "a0"
> > +     );
> > +
> > +     /* Now establish a valid mapping to check if the invalid one is c=
ached */
> > +     early_pmd[pmd_index(test_addr)] =3D valid_pmd;
> > +
> > +     /*
> > +      * Access the valid mapping multiple times: indeed, we can't use
> > +      * sfence.vma as a barrier to make sure the cpu did not reorder a=
ccesses
> > +      * so we may trap even if the uarch does not cache invalid entrie=
s. By
> > +      * trying a few times, we make sure that those uarchs will see th=
e right
> > +      * mapping at some point.
> > +      */
> > +
> > +     i =3D NR_RETRIES_CACHING_INVALID_ENTRIES;
> > +
> > +#define ASM_STR(x)   __ASM_STR(x)
>
> Deplicate define ?
>
> > +     asm_volatile_goto(
> > +             "la a0, 1f                                      \n"
> > +             "csrw " ASM_STR(CSR_TVEC) ", a0                 \n"
> > +             ".align 2                                       \n"
> > +             "1:                                             \n"
> > +             "addi %0, %0, -1                                \n"
> > +             "blt %0, zero, %l[caching_invalid_entries]      \n"
> > +             "ld a0, 0(%1)                                   \n"
> > +             :
> > +             : "r" (i), "r" (test_addr)
> > +             : "a0"
> > +             : caching_invalid_entries
> > +     );
> > +
> > +     csr_write(CSR_SATP, 0ULL);
> > +     local_flush_tlb_all();
> > +
> > +     /* If we don't trap, the uarch does not cache invalid entries! */
> > +     tlb_caching_invalid_entries =3D false;
> > +     goto clean;
> > +
> > +caching_invalid_entries:
> > +     csr_write(CSR_SATP, 0ULL);
> > +     local_flush_tlb_all();
> > +
> > +     tlb_caching_invalid_entries =3D true;
> > +clean:
> > +     memset(early_pg_dir, 0, PAGE_SIZE);
> > +     memset(early_pmd, 0, PAGE_SIZE);
>
> Use clear_page() instead ?
>
> > +
> > +     enable_pgtable_l4();
> > +     enable_pgtable_l5();
> > +}
> >   #endif
> >
> >   /*
> > @@ -1072,6 +1192,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >   #endif
> >
> >   #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
> > +     set_tlb_caching_invalid_entries();
> >       set_satp_mode(dtb_pa);
> >   #endif
> >
> > @@ -1322,6 +1443,9 @@ static void __init setup_vm_final(void)
> >       local_flush_tlb_all();
> >
> >       pt_ops_set_late();
> > +
> > +     pr_info("uarch caches invalid entries: %s",
> > +             tlb_caching_invalid_entries ? "yes" : "no");
> >   }
> >   #else
> >   asmlinkage void __init setup_vm(uintptr_t dtb_pa)

I left this patch so that people can easily test this without knowing
what their uarch is actually doing, but it will very likely be dropped
as a new extension has just been proposed for that.

Thanks anyway, I should have been more clear in the patch title,

Alex
