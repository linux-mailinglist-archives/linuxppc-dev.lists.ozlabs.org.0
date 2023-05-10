Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB06E6FD7FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 09:14:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGR9s4q9Zz3fYQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 17:14:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.179; helo=mail-vk1-f179.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGR9L06wXz3fJP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 17:14:28 +1000 (AEST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-44ffef66dabso3763580e0c.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 00:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683702864; x=1686294864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvYmUAzo0cwOybz0hjxV39+5gh/FQ5/NU0n3aFKpLiE=;
        b=WH4SMEy5gm+o0pypEM03o34fwX+ySOdKiZZod9aaRXwSW1FrgtLQUfRnQH3Ejg316r
         0dQ7Qq9faKa4+JaGjhcuLjewPM53OB6masZTT/DAvGWJ7vOqWImarU3PevfQvGIIoi/n
         VzqSqoKl5RnqEbmry6OwRSf2sTOxgB/CipyMca0bd/NuUc221OLxlS4oMNfuok1XWhpN
         Yu32uW4nonjAa13f6x1/hrCU2Ic9ARgOlW1ICZ0f27/sBRTQWmZQKpMYre9gEA1dIqEl
         FVxAcCfwafJFIydAAzOjteDUJxEoJRHwVNRVpwQatBBZmxBf4QwJgXbZGuGh06TlF7bh
         Gh+A==
X-Gm-Message-State: AC+VfDyUv18Zb8rzz1LP62ijkqTsqWsUAqQJaseRa896JN+YazoQuN8P
	2yzj5X1bSbWzKLV+c1xMh4eBOz3uhMS1Qw==
X-Google-Smtp-Source: ACHHUZ7yRz7LZqdVRaa+xnRV+apRw3ZD2YeW2TMBN5qbjRTPmtAAAsxUb/gKzaqq1KOVhhO/65Pmbg==
X-Received: by 2002:a1f:cf44:0:b0:43b:ead4:669e with SMTP id f65-20020a1fcf44000000b0043bead4669emr4600191vkg.16.1683702863556;
        Wed, 10 May 2023 00:14:23 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id f187-20020a1f1fc4000000b00443e5bc4fbcsm1897527vkf.31.2023.05.10.00.14.23
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:14:23 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-44ffef66dabso3763572e0c.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 00:14:23 -0700 (PDT)
X-Received: by 2002:a05:6902:1147:b0:b99:4ac6:3c75 with SMTP id
 p7-20020a056902114700b00b994ac63c75mr18672301ybu.10.1683702842290; Wed, 10
 May 2023 00:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <237c8410-ce61-94c-4260-7318ad6a4f3@google.com>
In-Reply-To: <237c8410-ce61-94c-4260-7318ad6a4f3@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2023 09:13:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb0SrEs=cDzKW1Ai2UywnnpZip4pk9mOkiVGivPpj8sg@mail.gmail.com>
Message-ID: <CAMuHMdWb0SrEs=cDzKW1Ai2UywnnpZip4pk9mOkiVGivPpj8sg@mail.gmail.com>
Subject: Re: [PATCH 05/23] m68k: allow pte_offset_map[_lock]() to fail
To: Hugh Dickins <hughd@google.com>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogen
 d@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hugh,

Thanks for your patch!

On Wed, May 10, 2023 at 6:48=E2=80=AFAM Hugh Dickins <hughd@google.com> wro=
te:
> In rare transient cases, not yet made possible, pte_offset_map() and
> pte_offset_map_lock() may not find a page table: handle appropriately.
>
> Restructure cf_tlb_miss() with a pte_unmap() (previously omitted)
> at label out, followed by one local_irq_restore() for all.

That's a bug fix, which should be a separate patch?

>
> Signed-off-by: Hugh Dickins <hughd@google.com>


> --- a/arch/m68k/include/asm/mmu_context.h
> +++ b/arch/m68k/include/asm/mmu_context.h
> @@ -99,7 +99,7 @@ static inline void load_ksp_mmu(struct task_struct *tas=
k)
>         p4d_t *p4d;
>         pud_t *pud;
>         pmd_t *pmd;
> -       pte_t *pte;
> +       pte_t *pte =3D NULL;
>         unsigned long mmuar;
>
>         local_irq_save(flags);
> @@ -139,7 +139,7 @@ static inline void load_ksp_mmu(struct task_struct *t=
ask)
>
>         pte =3D (mmuar >=3D PAGE_OFFSET) ? pte_offset_kernel(pmd, mmuar)
>                                      : pte_offset_map(pmd, mmuar);
> -       if (pte_none(*pte) || !pte_present(*pte))
> +       if (!pte || pte_none(*pte) || !pte_present(*pte))
>                 goto bug;

If the absence of a pte is to become a non-abnormal case, it should
probably jump to "end" instead, to avoid spamming the kernel log.

>
>         set_pte(pte, pte_mkyoung(*pte));
> @@ -161,6 +161,8 @@ static inline void load_ksp_mmu(struct task_struct *t=
ask)
>  bug:
>         pr_info("ksp load failed: mm=3D0x%p ksp=3D0x08%lx\n", mm, mmuar);
>  end:
> +       if (pte && mmuar < PAGE_OFFSET)
> +               pte_unmap(pte);

Is this also a bugfix, not mentioned in the patch description?

>         local_irq_restore(flags);
>  }
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
