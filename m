Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C4172DB0F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 09:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgL2W2Ms7z3bNq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 17:36:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.54; helo=mail-oa1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgKhB1kLYz2xVn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 17:20:08 +1000 (AEST)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1a6a4dc59bdso1102431fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 00:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686640806; x=1689232806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fbl6hTPLrmpSWav/3sGvPZAOIrvUN7WR7CUdowhVquE=;
        b=R37LO+sNUVDm1DVKMUSDj5QtT8HEeZYr8/bBoVIxYoSPRgiS9BVMA5dEYXaIVT17E5
         jLstVIkrCra+KWTCB9/Hcwn+kArWRHeIdR/ffjZbmuWtgcKmbWGjp6EBsa3WLvn/lxzs
         bM+3PAjwLTXUEaHuM3fvxMpQfF2lm5HTWvCc8phTlM+v4688P+TXwCLvzOxQs86KubxU
         HEn1FST4HDNjAehWeAnBWkrAztm0u7G2RvH8dNnkpytwSr4ZbCjJlpmwNDLTejG+jMlc
         OH7KJ1p2+vlKCUpZjNNK4qvWvXMQMKHy9glCuM0p3m8NmELlGIm8lgNJIWfEOuKyex3H
         N6gg==
X-Gm-Message-State: AC+VfDzTHZ9cohLlSu27Zx5q4ADNrpFWFTkjMnQnMdJKIbkXE8dbGFXl
	/BLXL64WtjygdZjKiAhszrDZ0wZgjsX66jiO
X-Google-Smtp-Source: ACHHUZ7HhdWtsAWd18GLNSCv7MHSdLYwVQdKaapQornqfLc9Bx4ANO05gi9V2n/jzDT7JH+8L81vfQ==
X-Received: by 2002:a05:6870:7715:b0:1a6:8f83:bcd7 with SMTP id dw21-20020a056870771500b001a68f83bcd7mr3623451oab.53.1686640805417;
        Tue, 13 Jun 2023 00:20:05 -0700 (PDT)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id o38-20020a05687107a600b0019e6b96f909sm6965807oap.22.2023.06.13.00.20.05
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 00:20:05 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1a694ac3238so1361667fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 00:20:05 -0700 (PDT)
X-Received: by 2002:a25:b191:0:b0:ba8:3bc0:4d19 with SMTP id
 h17-20020a25b191000000b00ba83bc04d19mr680890ybj.28.1686640784641; Tue, 13 Jun
 2023 00:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com> <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
In-Reply-To: <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jun 2023 09:19:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7K-9gXuOM3KkFieM_W2-Sbb3AVZ-sR65abRMdSBux5A@mail.gmail.com>
Message-ID: <CAMuHMdX7K-9gXuOM3KkFieM_W2-Sbb3AVZ-sR65abRMdSBux5A@mail.gmail.com>
Subject: Re: [PATCH v9 01/42] mm: Rename arch pte_mkwrite()'s to pte_mkwrite_novma()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 13 Jun 2023 17:35:37 +1000
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
Cc: kcc@google.com, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, david@redhat.com, eranian@google.com, Oleg Nesterov <oleg@redhat.com>, linux-mm@kvack.org, linux-csky@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, dethoma@microsoft.com, Linus Torvalds <torvalds@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Eugene Syromiatnikov <esyr@redhat.com>, jamorris@linux.microsoft.com, szabolcs.nagy@arm.com, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, "H . J . Lu" <hjl.tools@gmail.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, linux-alp
 ha@vger.kernel.org, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, broonie@kernel.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, debug@rivosinc.com, Florian Weimer <fweimer@redhat.com>, Michal Simek <monstr@monstr.eu>, John Allen <john.allen@amd.com>, linux-parisc@vger.kernel.org, Weijiang Yang <weijiang.yang@intel.com>, linux-api@vger.kernel.org, christina.schimpe@intel.com, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Cyrill Gorcunov <gorcunov@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org, rppt@kernel.org, Andrew.Cooper3@citrix.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 13, 2023 at 2:13=E2=80=AFAM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
> The x86 Shadow stack feature includes a new type of memory called shadow
> stack. This shadow stack memory has some unusual properties, which requir=
es
> some core mm changes to function properly.
>
> One of these unusual properties is that shadow stack memory is writable,
> but only in limited ways. These limits are applied via a specific PTE
> bit combination. Nevertheless, the memory is writable, and core mm code
> will need to apply the writable permissions in the typical paths that
> call pte_mkwrite(). Future patches will make pte_mkwrite() take a VMA, so
> that the x86 implementation of it can know whether to create regular
> writable memory or shadow stack memory.
>
> But there are a couple of challenges to this. Modifying the signatures of
> each arch pte_mkwrite() implementation would be error prone because some
> are generated with macros and would need to be re-implemented. Also, some
> pte_mkwrite() callers operate on kernel memory without a VMA.
>
> So this can be done in a three step process. First pte_mkwrite() can be
> renamed to pte_mkwrite_novma() in each arch, with a generic pte_mkwrite()
> added that just calls pte_mkwrite_novma(). Next callers without a VMA can
> be moved to pte_mkwrite_novma(). And lastly, pte_mkwrite() and all caller=
s
> can be changed to take/pass a VMA.
>
> Start the process by renaming pte_mkwrite() to pte_mkwrite_novma() and
> adding the pte_mkwrite() wrapper in linux/pgtable.h. Apply the same
> pattern for pmd_mkwrite(). Since not all archs have a pmd_mkwrite_novma()=
,
> create a new arch config HAS_HUGE_PAGE that can be used to tell if
> pmd_mkwrite() should be defined. Otherwise in the !HAS_HUGE_PAGE cases th=
e
> compiler would not be able to find pmd_mkwrite_novma().
>
> No functional change.
>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: openrisc@lists.librecores.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
> Suggested-by: Linus Torvalds <torvalds@linuxfoundation.org>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Link: https://lore.kernel.org/lkml/CAHk-=3DwiZjSu7c9sFYZb3q04108stgHff2wf=
bokGCCgW7riz+8Q@mail.gmail.com/

>  arch/m68k/include/asm/mcf_pgtable.h          |  2 +-
>  arch/m68k/include/asm/motorola_pgtable.h     |  2 +-
>  arch/m68k/include/asm/sun3_pgtable.h         |  2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
