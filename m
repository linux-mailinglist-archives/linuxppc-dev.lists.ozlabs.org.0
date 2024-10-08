Return-Path: <linuxppc-dev+bounces-1804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB78D993CAA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 04:11:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMzzM2hM4z2yTy;
	Tue,  8 Oct 2024 13:11:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728353503;
	cv=none; b=FZv0VrEoHHAxb6wrSfxCd2dd/aUhln2TtKridR7eFR5UYPeM+2IdL6H4sSdyBsK/NTcGEZDZAoxuemCSWD0NFYLeqMHihscky6HXhr+SzjdRNXcz6CMjW7jdm1xdgZl2qDG1Qmcud0kUD3yuO8sgqe7wvkYmSz9NyRnS9j9cvRG6/Nc7kvBNp9V8jZ2+y70D7k6wTwP94ZzdRuHwNieZjf4Q42poCzpx5hyKsrz3z/t5Id5itodJq9EWDLlYjyvrw5Pg0vSI4stPo4FjVqctGkBhaI9VxurJenHkhHYFsd+vdjH3j2v/c2qyOuy7kuNakZq3mRfKjhiphbA0/yyGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728353503; c=relaxed/relaxed;
	bh=DT0ywLFKrUO3ulJ9Jiduz32szXhm1G71Y1Xb7Yo1Js8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFQPsCjouCWpFFHyorY6X0Z8J3SnL7XuwtyQWcGLoERBrNmqWbx3qzRhtrZQBe5/THuh882eSuCVeo2qbuDML27UcWYeUtD/+A0lAScD1+eC5GID0YoPapG1itYvFQg6pGjOG3igj1Xb7rmSG2vEKbRZyje2+Ha3ptWOsqS+xTXvd40bSjwMZedpUzw63srVEiwByDun/a/YPouRi8EzwAedc7bguA1Fa0QrEbAeaUV/Q+UO59KhkOAgnnakrLawH/zxN7AyUjCcGJMtxhJaAncI7WXBndd/tNgTmIdr/LPfg0bnFMKek0+mCKOVFGgR4KVoh0EQVsv5qc1tWsgr/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sJVgAncT; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=chenhuacai@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sJVgAncT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=chenhuacai@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMzzL0wBPz2yMX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 13:11:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62B865C5EB0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 02:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34DFC4CEDE
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 02:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728353498;
	bh=ecuISJm/aWL+tNMQ+twAVlW+4RZvWpoN2srrbXkDB94=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sJVgAncTPsJH0dYu/FY7tpoM13FlZrkcGW302R2qV3rAtntuHnx6b6IBtsoGqJfUK
	 OJlF20yd3fT8v8p+RPUvLVZ1RAMX5W6IbxX8tZagSwZOA/94MMpuD4+qFDEILoEjsf
	 P9uAjzPBaX291VACffb+ISH0H3TDsmmxM/gNcXrwWMJ0mwOhLF9F36oQ6KMq+Kl+J3
	 cl4KezTj+ksZUrr54Ao44lrKdmPEUpk3T3kJ7LEHkgZvFjg/8ZeTWGIRfWaPxyNycf
	 uEqf34myc+g6AkPGGZi/bTzkGCJuh9wf939s4XdMc4f/DEpE3N6CmVgYLon7hKR9NJ
	 ZKCT4YfZMpMYg==
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37ce8458ae3so4654024f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Oct 2024 19:11:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8EFt+eHM29AX+ejtUdo/i0dQP7CQQwcMIX9plHpF2G8Fw0n4gWVhVQ+MPWZHVhZJ0EQGNr5pZbFv4st0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxxHz97xMVruIN67a/RL38N24/IIoEJFu2nZatMHUuhww/n7Bm6
	X2K3yYsjKtER93EdUL8QD3pSduQ1moPeicarra/3PTUSe4CsnU91dwEkqi8PZyhpDhx9FWZ8Wud
	PI/5ydQzrpzR7u0nFIkHL1hwHeuI=
X-Google-Smtp-Source: AGHT+IG9/HXDQPVy3roiGpnpx5nYoWEmk19PPS8Q+OmkGvZ1j1NxJVVRW61nrohcbFPxLB5t6MVKLRvfuhF1lJEIdu8=
X-Received: by 2002:a5d:6e0a:0:b0:374:ce15:9995 with SMTP id
 ffacd0b85a97d-37d0e78253cmr10508015f8f.34.1728353497103; Mon, 07 Oct 2024
 19:11:37 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241007062858.44248-1-rppt@kernel.org> <20241007062858.44248-6-rppt@kernel.org>
In-Reply-To: <20241007062858.44248-6-rppt@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 8 Oct 2024 10:11:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4u5qk-Zd8ctiooCv_hGKbDpXRAtTZMMsUab9bbLAnd5A@mail.gmail.com>
Message-ID: <CAAhV-H4u5qk-Zd8ctiooCv_hGKbDpXRAtTZMMsUab9bbLAnd5A@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] arch: introduce set_direct_map_valid_noflush()
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi, Mike,

On Mon, Oct 7, 2024 at 2:30=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Add an API that will allow updates of the direct/linear map for a set of
> physically contiguous pages.
>
> It will be used in the following patches.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/arm64/include/asm/set_memory.h     |  1 +
>  arch/arm64/mm/pageattr.c                | 10 ++++++++++
>  arch/loongarch/include/asm/set_memory.h |  1 +
>  arch/loongarch/mm/pageattr.c            | 21 +++++++++++++++++++++
>  arch/riscv/include/asm/set_memory.h     |  1 +
>  arch/riscv/mm/pageattr.c                | 15 +++++++++++++++
>  arch/s390/include/asm/set_memory.h      |  1 +
>  arch/s390/mm/pageattr.c                 | 11 +++++++++++
>  arch/x86/include/asm/set_memory.h       |  1 +
>  arch/x86/mm/pat/set_memory.c            |  8 ++++++++
>  include/linux/set_memory.h              |  6 ++++++
>  11 files changed, 76 insertions(+)
>
> diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm=
/set_memory.h
> index 917761feeffd..98088c043606 100644
> --- a/arch/arm64/include/asm/set_memory.h
> +++ b/arch/arm64/include/asm/set_memory.h
> @@ -13,6 +13,7 @@ int set_memory_valid(unsigned long addr, int numpages, =
int enable);
>
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid);
>  bool kernel_page_present(struct page *page);
>
>  #endif /* _ASM_ARM64_SET_MEMORY_H */
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 0e270a1c51e6..01225900293a 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -192,6 +192,16 @@ int set_direct_map_default_noflush(struct page *page=
)
>                                    PAGE_SIZE, change_page_range, &data);
>  }
>
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid)
> +{
> +       unsigned long addr =3D (unsigned long)page_address(page);
> +
> +       if (!can_set_direct_map())
> +               return 0;
> +
> +       return set_memory_valid(addr, nr, valid);
> +}
> +
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  void __kernel_map_pages(struct page *page, int numpages, int enable)
>  {
> diff --git a/arch/loongarch/include/asm/set_memory.h b/arch/loongarch/inc=
lude/asm/set_memory.h
> index d70505b6676c..55dfaefd02c8 100644
> --- a/arch/loongarch/include/asm/set_memory.h
> +++ b/arch/loongarch/include/asm/set_memory.h
> @@ -17,5 +17,6 @@ int set_memory_rw(unsigned long addr, int numpages);
>  bool kernel_page_present(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
>  int set_direct_map_invalid_noflush(struct page *page);
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid);
>
>  #endif /* _ASM_LOONGARCH_SET_MEMORY_H */
> diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
> index ffd8d76021d4..f14b40c968b4 100644
> --- a/arch/loongarch/mm/pageattr.c
> +++ b/arch/loongarch/mm/pageattr.c
> @@ -216,3 +216,24 @@ int set_direct_map_invalid_noflush(struct page *page=
)
>
>         return __set_memory(addr, 1, __pgprot(0), __pgprot(_PAGE_PRESENT =
| _PAGE_VALID));
>  }
> +
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid)
> +{
> +       unsigned long addr =3D (unsigned long)page_address(page);
> +       pgprot_t set, clear;
> +
> +       return __set_memory((unsigned long)page_address(page), nr, set, c=
lear);
This line should be removed.

Huacai

> +
> +       if (addr < vm_map_base)
> +               return 0;
> +
> +       if (valid) {
> +               set =3D PAGE_KERNEL;
> +               clear =3D __pgprot(0);
> +       } else {
> +               set =3D __pgprot(0);
> +               clear =3D __pgprot(_PAGE_PRESENT | _PAGE_VALID);
> +       }
> +
> +       return __set_memory(addr, 1, set, clear);
> +}
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm=
/set_memory.h
> index ab92fc84e1fc..ea263d3683ef 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -42,6 +42,7 @@ static inline int set_kernel_memory(char *startp, char =
*endp,
>
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid);
>  bool kernel_page_present(struct page *page);
>
>  #endif /* __ASSEMBLY__ */
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 271d01a5ba4d..d815448758a1 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -386,6 +386,21 @@ int set_direct_map_default_noflush(struct page *page=
)
>                             PAGE_KERNEL, __pgprot(_PAGE_EXEC));
>  }
>
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid)
> +{
> +       pgprot_t set, clear;
> +
> +       if (valid) {
> +               set =3D PAGE_KERNEL;
> +               clear =3D __pgprot(_PAGE_EXEC);
> +       } else {
> +               set =3D __pgprot(0);
> +               clear =3D __pgprot(_PAGE_PRESENT);
> +       }
> +
> +       return __set_memory((unsigned long)page_address(page), nr, set, c=
lear);
> +}
> +
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  static int debug_pagealloc_set_page(pte_t *pte, unsigned long addr, void=
 *data)
>  {
> diff --git a/arch/s390/include/asm/set_memory.h b/arch/s390/include/asm/s=
et_memory.h
> index 06fbabe2f66c..240bcfbdcdce 100644
> --- a/arch/s390/include/asm/set_memory.h
> +++ b/arch/s390/include/asm/set_memory.h
> @@ -62,5 +62,6 @@ __SET_MEMORY_FUNC(set_memory_4k, SET_MEMORY_4K)
>
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid);
>
>  #endif
> diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
> index 5f805ad42d4c..4c7ee74aa130 100644
> --- a/arch/s390/mm/pageattr.c
> +++ b/arch/s390/mm/pageattr.c
> @@ -406,6 +406,17 @@ int set_direct_map_default_noflush(struct page *page=
)
>         return __set_memory((unsigned long)page_to_virt(page), 1, SET_MEM=
ORY_DEF);
>  }
>
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid)
> +{
> +       unsigned long flags;
> +
> +       if (valid)
> +               flags =3D SET_MEMORY_DEF;
> +       else
> +               flags =3D SET_MEMORY_INV;
> +
> +       return __set_memory((unsigned long)page_to_virt(page), nr, flags)=
;
> +}
>  #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
>
>  static void ipte_range(pte_t *pte, unsigned long address, int nr)
> diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set=
_memory.h
> index 4b2abce2e3e7..cc62ef70ccc0 100644
> --- a/arch/x86/include/asm/set_memory.h
> +++ b/arch/x86/include/asm/set_memory.h
> @@ -89,6 +89,7 @@ int set_pages_rw(struct page *page, int numpages);
>
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid);
>  bool kernel_page_present(struct page *page);
>
>  extern int kernel_set_to_readonly;
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 44f7b2ea6a07..069e421c2247 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -2444,6 +2444,14 @@ int set_direct_map_default_noflush(struct page *pa=
ge)
>         return __set_pages_p(page, 1);
>  }
>
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid)
> +{
> +       if (valid)
> +               return __set_pages_p(page, nr);
> +
> +       return __set_pages_np(page, nr);
> +}
> +
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  void __kernel_map_pages(struct page *page, int numpages, int enable)
>  {
> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> index e7aec20fb44f..3030d9245f5a 100644
> --- a/include/linux/set_memory.h
> +++ b/include/linux/set_memory.h
> @@ -34,6 +34,12 @@ static inline int set_direct_map_default_noflush(struc=
t page *page)
>         return 0;
>  }
>
> +static inline int set_direct_map_valid_noflush(struct page *page,
> +                                              unsigned nr, bool valid)
> +{
> +       return 0;
> +}
> +
>  static inline bool kernel_page_present(struct page *page)
>  {
>         return true;
> --
> 2.43.0
>

