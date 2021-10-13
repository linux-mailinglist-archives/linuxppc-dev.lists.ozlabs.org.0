Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC6842B85B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 09:03:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTk583sFmz3cCM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:03:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NwHbNYol;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=NwHbNYol; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTk483PWvz30KC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 18:02:16 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id k26so1618711pfi.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 00:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QziJyzXzUKzLt0mT/rAcGmhri2bByqLuVs1mVf2Iq0g=;
 b=NwHbNYolt/EJuuhUNh3gFlhBeQ9ofBjeVTMrGlBvl7Dpq4nY5SGQ+7bZVHVSCPSCvz
 N4ue7iEr/SejEm3Z7dmljFY3Ydw+WZXeuot6L8HdKKtMDeoRppIKuFuYaENN6G0icj3X
 75yWvw4ksMlAy3h2kzjPtg6nuTPvWkdSEorqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QziJyzXzUKzLt0mT/rAcGmhri2bByqLuVs1mVf2Iq0g=;
 b=OXExOHGByWnOR3ByJhVHFhEnrz+eGt51VtEwyW3iLGn0tJHJjYymk2bTvkyp8VoGXr
 ec06vRe0olGLgTq1eI50NEvo10PYcRvVW0W1k1dYdVMXdFssOZJhmb0vwYv6os8EBsC6
 h2dPLF0A5oCTmXAIoVHRu3kApwN8y71b7h9QIyU/K6EAb8k9xJ94Fys7B6faFjkxVekI
 hPYW4YHOgEV1Kg6MUK2D1WUcdfhP8hBEgwQCl76dXE93ltHJh3ZAo/gYix9GtUUUf5fh
 ETU9UxMKfQNtV+30kAs0y2MpFlCcpegUgVwMf2ddKvfV35XhEPsTERYa5iboecx8xUjY
 /3nQ==
X-Gm-Message-State: AOAM532JZGrib2VJrGyUWML99tCQpywmM6bQqPBfZC7EE19KW2NhWOEx
 fYgoBmD4KuwWMwRFOyZtmmgERQ==
X-Google-Smtp-Source: ABdhPJyWYEWyfQBfcC/0yIP+D80JqXxmyV0v/CWpa3mlnRn6oeLJSgdmS6Po11cAfGz1rlakmHlfMA==
X-Received: by 2002:a63:ed13:: with SMTP id d19mr26247213pgi.430.1634108533970; 
 Wed, 13 Oct 2021 00:02:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k14sm7556115pgt.8.2021.10.13.00.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 00:02:13 -0700 (PDT)
Date: Wed, 13 Oct 2021 00:02:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 06/10] asm-generic: Refactor
 dereference_[kernel]_function_descriptor()
Message-ID: <202110130002.A7C0A86@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <c215b244a19a07327ec81bf99f3c5f89c68af7b4.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c215b244a19a07327ec81bf99f3c5f89c68af7b4.1633964380.git.christophe.leroy@csgroup.eu>
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
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 11, 2021 at 05:25:33PM +0200, Christophe Leroy wrote:
> dereference_function_descriptor() and
> dereference_kernel_function_descriptor() are identical on the
> three architectures implementing them.
> 
> Make it common.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/ia64/include/asm/sections.h    | 19 -------------------
>  arch/parisc/include/asm/sections.h  |  9 ---------
>  arch/parisc/kernel/process.c        | 21 ---------------------
>  arch/powerpc/include/asm/sections.h | 23 -----------------------
>  include/asm-generic/sections.h      | 18 ++++++++++++++++++
>  5 files changed, 18 insertions(+), 72 deletions(-)

A diffstat to love. :)

Reviewed-by: Kees Cook <keescook@chromium.org>


> 
> diff --git a/arch/ia64/include/asm/sections.h b/arch/ia64/include/asm/sections.h
> index 929b5c535620..d9addaea8339 100644
> --- a/arch/ia64/include/asm/sections.h
> +++ b/arch/ia64/include/asm/sections.h
> @@ -30,23 +30,4 @@ extern char __start_gate_brl_fsys_bubble_down_patchlist[], __end_gate_brl_fsys_b
>  extern char __start_unwind[], __end_unwind[];
>  extern char __start_ivt_text[], __end_ivt_text[];
>  
> -#undef dereference_function_descriptor
> -static inline void *dereference_function_descriptor(void *ptr)
> -{
> -	struct fdesc *desc = ptr;
> -	void *p;
> -
> -	if (!get_kernel_nofault(p, (void *)&desc->addr))
> -		ptr = p;
> -	return ptr;
> -}
> -
> -#undef dereference_kernel_function_descriptor
> -static inline void *dereference_kernel_function_descriptor(void *ptr)
> -{
> -	if (ptr < (void *)__start_opd || ptr >= (void *)__end_opd)
> -		return ptr;
> -	return dereference_function_descriptor(ptr);
> -}
> -
>  #endif /* _ASM_IA64_SECTIONS_H */
> diff --git a/arch/parisc/include/asm/sections.h b/arch/parisc/include/asm/sections.h
> index 329e80f7af0a..b041fb32a300 100644
> --- a/arch/parisc/include/asm/sections.h
> +++ b/arch/parisc/include/asm/sections.h
> @@ -12,13 +12,4 @@ typedef Elf64_Fdesc funct_descr_t;
>  
>  extern char __alt_instructions[], __alt_instructions_end[];
>  
> -#ifdef CONFIG_64BIT
> -
> -#undef dereference_function_descriptor
> -void *dereference_function_descriptor(void *);
> -
> -#undef dereference_kernel_function_descriptor
> -void *dereference_kernel_function_descriptor(void *);
> -#endif
> -
>  #endif
> diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
> index 38ec4ae81239..7382576b52a8 100644
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -266,27 +266,6 @@ get_wchan(struct task_struct *p)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_64BIT
> -void *dereference_function_descriptor(void *ptr)
> -{
> -	Elf64_Fdesc *desc = ptr;
> -	void *p;
> -
> -	if (!get_kernel_nofault(p, (void *)&desc->addr))
> -		ptr = p;
> -	return ptr;
> -}
> -
> -void *dereference_kernel_function_descriptor(void *ptr)
> -{
> -	if (ptr < (void *)__start_opd ||
> -			ptr >= (void *)__end_opd)
> -		return ptr;
> -
> -	return dereference_function_descriptor(ptr);
> -}
> -#endif
> -
>  static inline unsigned long brk_rnd(void)
>  {
>  	return (get_random_int() & BRK_RND_MASK) << PAGE_SHIFT;
> diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
> index d0d5287fa568..8f8e95f234e2 100644
> --- a/arch/powerpc/include/asm/sections.h
> +++ b/arch/powerpc/include/asm/sections.h
> @@ -72,29 +72,6 @@ static inline int overlaps_kernel_text(unsigned long start, unsigned long end)
>  		(unsigned long)_stext < end;
>  }
>  
> -#ifdef PPC64_ELF_ABI_v1
> -
> -#undef dereference_function_descriptor
> -static inline void *dereference_function_descriptor(void *ptr)
> -{
> -	struct ppc64_opd_entry *desc = ptr;
> -	void *p;
> -
> -	if (!get_kernel_nofault(p, (void *)&desc->addr))
> -		ptr = p;
> -	return ptr;
> -}
> -
> -#undef dereference_kernel_function_descriptor
> -static inline void *dereference_kernel_function_descriptor(void *ptr)
> -{
> -	if (ptr < (void *)__start_opd || ptr >= (void *)__end_opd)
> -		return ptr;
> -
> -	return dereference_function_descriptor(ptr);
> -}
> -#endif /* PPC64_ELF_ABI_v1 */
> -
>  #endif
>  
>  #endif /* __KERNEL__ */
> diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
> index 436412d94054..5baaf9d7c671 100644
> --- a/include/asm-generic/sections.h
> +++ b/include/asm-generic/sections.h
> @@ -60,6 +60,24 @@ extern __visible const void __nosave_begin, __nosave_end;
>  
>  /* Function descriptor handling (if any).  Override in asm/sections.h */
>  #ifdef HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR
> +static inline void *dereference_function_descriptor(void *ptr)
> +{
> +	funct_descr_t *desc = ptr;
> +	void *p;
> +
> +	if (!get_kernel_nofault(p, (void *)&desc->addr))
> +		ptr = p;
> +	return ptr;
> +}
> +
> +static inline void *dereference_kernel_function_descriptor(void *ptr)
> +{
> +	if (ptr < (void *)__start_opd || ptr >= (void *)__end_opd)
> +		return ptr;
> +
> +	return dereference_function_descriptor(ptr);
> +}
> +
>  #else
>  #define dereference_function_descriptor(p) ((void *)(p))
>  #define dereference_kernel_function_descriptor(p) ((void *)(p))
> -- 
> 2.31.1
> 

-- 
Kees Cook
