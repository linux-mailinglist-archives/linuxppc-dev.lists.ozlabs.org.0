Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0E542E8CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 08:16:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVwyt6JSpz3bhg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 17:16:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CrFzPHDX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CrFzPHDX; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVwyD4Fxhz2yHM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 17:16:20 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id c4so5755654pls.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 23:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=YE7nTA2V96Pevc/UvOLQEZXUKaX0lJLTFtXdRp3w5Ps=;
 b=CrFzPHDXpxCtTQkDeVW16flYjdq+s8jnsSTPHvMLMn6glP8lVoC75CrOgBR5LFre4E
 ESlq2c+cqzAkGsZvZTlzyvCDZCyDsackyuz0XOoNL1a7K3X/+fnNhV0HhckNv0Bc2RKL
 ZCpqwBaJFD6NBlxeRiQKAl44uQh9zdUXcdQV4DrpkN1e32i7kUnVxqqJX3Xv+MGdZ5qu
 RnWmvAjvBlA43GmAIWxu+G8YOQprP1SiObu+cLBAu2tzRiEmX763yjFnibUqZ/iPIeWe
 vrh286dsF8lmqN0J7X6k14NRFqwGZUZe514CRrnBhBAB20uAZmqXZaUUOZK2mFwNQ9oN
 tzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=YE7nTA2V96Pevc/UvOLQEZXUKaX0lJLTFtXdRp3w5Ps=;
 b=44IXkU7MGS4YjBiqILu9q5JClmh6MDwYkAX4O69aXo+keTzkOwzdngHeLzt8Bd+Nob
 ck/d7B3Uh4Y/BGRu6t71d6WJGSxkCypvcUtSXkYhS8vEZFe5bTAAydnmEhaCQpxxw3lk
 2deqN5lh6NWpjoV1GPbGJgt7UC63UsrVPOvTRmOyjsjeUxT7a+5n9XfOnys7njHRH4Fq
 zSjT3RyHO4O2vGKF/IDXcspkwQ7zi8glAA9HdEmFgV3BCW2KIGkroTDkRykWJ7jp0m1Z
 EV4sq76fltX3lubBcPzwxhZXURpI07CfLYSmliK6q56Mq5YYwwXwjIUUmqUwxmXErgQe
 f/1g==
X-Gm-Message-State: AOAM53247jhxkNl7oPqiw2dtg0cPhH9D253APo7Mk5Y5VECNjOJ+mqOr
 mbvNiE/HntWKc6/E5+yc4Dk=
X-Google-Smtp-Source: ABdhPJwYYUl5EQRMuVepLASUxMZmHpBPgBCkyvr9GXt6diHoOjWk1MRhDXh2MAsBwZP8Hx+MTJpsOA==
X-Received: by 2002:a17:90a:708c:: with SMTP id
 g12mr25440278pjk.13.1634278577314; 
 Thu, 14 Oct 2021 23:16:17 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 v22sm4156445pff.93.2021.10.14.23.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:16:17 -0700 (PDT)
Date: Fri, 15 Oct 2021 16:16:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 06/13] asm-generic: Use HAVE_FUNCTION_DESCRIPTORS to
 define associated stubs
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Kees Cook <keescook@chromium.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <4fda65cda906e56aa87806b658e0828c64792403.1634190022.git.christophe.leroy@csgroup.eu>
In-Reply-To: <4fda65cda906e56aa87806b658e0828c64792403.1634190022.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634278340.5yp7xtm7um.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of October 14, 2021 3:49 pm:
> Replace HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR by
> HAVE_FUNCTION_DESCRIPTORS and use it instead of
> 'dereference_function_descriptor' macro to know
> whether an arch has function descriptors.
>=20
> To limit churn in one of the following patches, use
> an #ifdef/#else construct with empty first part
> instead of an #ifndef in asm-generic/sections.h

Is it worth putting this into Kconfig if you're going to
change it? In any case

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/ia64/include/asm/sections.h    | 5 +++--
>  arch/parisc/include/asm/sections.h  | 6 ++++--
>  arch/powerpc/include/asm/sections.h | 6 ++++--
>  include/asm-generic/sections.h      | 3 ++-
>  include/linux/kallsyms.h            | 2 +-
>  5 files changed, 14 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/ia64/include/asm/sections.h b/arch/ia64/include/asm/sec=
tions.h
> index 35f24e52149a..6e55e545bf02 100644
> --- a/arch/ia64/include/asm/sections.h
> +++ b/arch/ia64/include/asm/sections.h
> @@ -9,6 +9,9 @@
> =20
>  #include <linux/elf.h>
>  #include <linux/uaccess.h>
> +
> +#define HAVE_FUNCTION_DESCRIPTORS 1
> +
>  #include <asm-generic/sections.h>
> =20
>  extern char __phys_per_cpu_start[];
> @@ -27,8 +30,6 @@ extern char __start_gate_brl_fsys_bubble_down_patchlist=
[], __end_gate_brl_fsys_b
>  extern char __start_unwind[], __end_unwind[];
>  extern char __start_ivt_text[], __end_ivt_text[];
> =20
> -#define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
> -
>  #undef dereference_function_descriptor
>  static inline void *dereference_function_descriptor(void *ptr)
>  {
> diff --git a/arch/parisc/include/asm/sections.h b/arch/parisc/include/asm=
/sections.h
> index bb52aea0cb21..85149a89ff3e 100644
> --- a/arch/parisc/include/asm/sections.h
> +++ b/arch/parisc/include/asm/sections.h
> @@ -2,6 +2,10 @@
>  #ifndef _PARISC_SECTIONS_H
>  #define _PARISC_SECTIONS_H
> =20
> +#ifdef CONFIG_64BIT
> +#define HAVE_FUNCTION_DESCRIPTORS 1
> +#endif
> +
>  /* nothing to see, move along */
>  #include <asm-generic/sections.h>
> =20
> @@ -9,8 +13,6 @@ extern char __alt_instructions[], __alt_instructions_end=
[];
> =20
>  #ifdef CONFIG_64BIT
> =20
> -#define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
> -
>  #undef dereference_function_descriptor
>  void *dereference_function_descriptor(void *);
> =20
> diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/a=
sm/sections.h
> index 32e7035863ac..bba97b8c38cf 100644
> --- a/arch/powerpc/include/asm/sections.h
> +++ b/arch/powerpc/include/asm/sections.h
> @@ -8,6 +8,10 @@
> =20
>  #define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
> =20
> +#ifdef PPC64_ELF_ABI_v1
> +#define HAVE_FUNCTION_DESCRIPTORS 1
> +#endif
> +
>  #include <asm-generic/sections.h>
> =20
>  extern bool init_mem_is_free;
> @@ -69,8 +73,6 @@ static inline int overlaps_kernel_text(unsigned long st=
art, unsigned long end)
> =20
>  #ifdef PPC64_ELF_ABI_v1
> =20
> -#define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
> -
>  #undef dereference_function_descriptor
>  static inline void *dereference_function_descriptor(void *ptr)
>  {
> diff --git a/include/asm-generic/sections.h b/include/asm-generic/section=
s.h
> index d16302d3eb59..b677e926e6b3 100644
> --- a/include/asm-generic/sections.h
> +++ b/include/asm-generic/sections.h
> @@ -59,7 +59,8 @@ extern char __noinstr_text_start[], __noinstr_text_end[=
];
>  extern __visible const void __nosave_begin, __nosave_end;
> =20
>  /* Function descriptor handling (if any).  Override in asm/sections.h */
> -#ifndef dereference_function_descriptor
> +#ifdef HAVE_FUNCTION_DESCRIPTORS
> +#else
>  #define dereference_function_descriptor(p) ((void *)(p))
>  #define dereference_kernel_function_descriptor(p) ((void *)(p))
>  #endif
> diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
> index a1d6fc82d7f0..9f277baeb559 100644
> --- a/include/linux/kallsyms.h
> +++ b/include/linux/kallsyms.h
> @@ -57,7 +57,7 @@ static inline int is_ksym_addr(unsigned long addr)
> =20
>  static inline void *dereference_symbol_descriptor(void *ptr)
>  {
> -#ifdef HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR
> +#ifdef HAVE_FUNCTION_DESCRIPTORS
>  	struct module *mod;
> =20
>  	ptr =3D dereference_kernel_function_descriptor(ptr);
> --=20
> 2.31.1
>=20
>=20
>=20
