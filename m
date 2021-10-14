Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8257042E415
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 00:18:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVkLf14cTz3bnj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 09:18:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=ONfSismG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=ONfSismG; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVkKy1BbDz2xfM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 09:17:40 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id e10so232013plh.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 15:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=/gn1naYin2rxewmNR+UQ+4Ua2Az6pxvVd0XA2L6nJ+U=;
 b=ONfSismG4d04naWppWaw5fFBIKSKKMAy0gVJiXZrFConvnU5E8d2Ayd3VDh0kKxPlM
 KfYheVy3VZqFxW7C3SyDj3kHRI0/KpnkFFKB2eHymwNvTlk77B8NEvbREKsCxf/hUfZR
 66TL6htytJE5V6/HVu+C2OZbv0Cu9cqLYCK78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=/gn1naYin2rxewmNR+UQ+4Ua2Az6pxvVd0XA2L6nJ+U=;
 b=rWURQ65+EVfLZM+Hxkd5uRzGVUF4tK33SP6ZeMKV//X/TxyVs0TI07dxnfGQJ4bSmg
 MfmQn8VxP3E5rxMeoByE99K5bvctcNs7/q51MD+EDt4CC8wFbMqTen1ClPnH2AKfoeTe
 ZpTbeEI2elRT3UfmtQOw2EZHZaMIme+6DpXxeUmRo0wMC2xW2daWsk9V8Z3WvkuXHQ0A
 sFBZrdRDdtCBKJPcwFL6cRxUBnCfPSLnZzGNn3cxhchK7uZC8Bl089bFt30VNIML/uEF
 hzLTJUR+St2dWQXEQdg1LYARrQGCzw6B8JmN3KmrZLP+x7U6Ta7qp6LufRfDq4lWRyBt
 G0Ww==
X-Gm-Message-State: AOAM531HnIF5QDjunguXA8XOyUc/CaT2K7NAA3lrmexTlQzZRSBX7wTa
 G5griaIsyP5bpvi6V6FNAf/ZDg==
X-Google-Smtp-Source: ABdhPJzab2EpHK7Q/T8QXwpqraVUPmAWt0eL0woPg5T6pMmI9UAwBAQkaSq8CsyFo20UObxGkQ6Z9w==
X-Received: by 2002:a17:90b:224e:: with SMTP id
 hk14mr9005831pjb.224.1634249856727; 
 Thu, 14 Oct 2021 15:17:36 -0700 (PDT)
Received: from localhost ([2001:4479:e300:600:4901:2fb9:ed97:3a3e])
 by smtp.gmail.com with ESMTPSA id x27sm3586622pfo.90.2021.10.14.15.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:17:36 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Andrew Morton <akpm@linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>, Kees Cook
 <keescook@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 03/13] powerpc: Remove func_descr_t
In-Reply-To: <16eef6afbf7322d0c07760ebf827b8f9f50f7c6e.1634190022.git.christophe.leroy@csgroup.eu>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <16eef6afbf7322d0c07760ebf827b8f9f50f7c6e.1634190022.git.christophe.leroy@csgroup.eu>
Date: Fri, 15 Oct 2021 09:17:33 +1100
Message-ID: <874k9j45fm.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> 'func_descr_t' is redundant with 'struct ppc64_opd_entry'

So, if I understand the overall direction of the series, you're
consolidating powerpc around one single type for function descriptors,
and then you're creating a generic typedef so that generic code can
always do ((func_desc_t)x)->addr to get the address of a function out of
a function descriptor regardless of arch. (And regardless of whether the
arch uses function descriptors or not.)

So:

 - why pick ppc64_opd_entry over func_descr_t?

 - Why not make our struct just called func_desc_t - why have a
   ppc64_opd_entry type or a func_descr_t typedef?

 - Should this patch wait until after you've made the generic
   func_desc_t change and move directly to that new interface? (rather
   than move from func_descr_t -> ppc64_opd_entry -> ...) Or is there a
   particular reason arch specific code should use an arch-specific
   struct or named type?

> Remove it.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/code-patching.h | 2 +-
>  arch/powerpc/include/asm/types.h         | 6 ------
>  arch/powerpc/kernel/signal_64.c          | 8 ++++----
>  3 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
> index 4ba834599c4d..f3445188d319 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -110,7 +110,7 @@ static inline unsigned long ppc_function_entry(void *func)
>  	 * function's descriptor. The first entry in the descriptor is the
>  	 * address of the function text.
>  	 */
> -	return ((func_descr_t *)func)->entry;
> +	return ((struct ppc64_opd_entry *)func)->addr;
>  #else
>  	return (unsigned long)func;
>  #endif
> diff --git a/arch/powerpc/include/asm/types.h b/arch/powerpc/include/asm/types.h
> index f1630c553efe..97da77bc48c9 100644
> --- a/arch/powerpc/include/asm/types.h
> +++ b/arch/powerpc/include/asm/types.h
> @@ -23,12 +23,6 @@
>  
>  typedef __vector128 vector128;
>  
> -typedef struct {
> -	unsigned long entry;
> -	unsigned long toc;
> -	unsigned long env;
> -} func_descr_t;

I was a little concerned about going from a 3-element struct to a
2-element struct (as ppc64_opd_entry doesn't have an element for env) -
but we don't seem to take the sizeof this anywhere, nor do we use env
anywhere, nor do we do funky macro stuff with it in the signal handling
code that might implictly use the 3rd element, so I guess this will
work. Still, func_descr_t seems to describe the underlying ABI better
than ppc64_opd_entry...

>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _ASM_POWERPC_TYPES_H */
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index 1831bba0582e..63ddbe7b108c 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -933,11 +933,11 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>  		 * descriptor is the entry address of signal and the second
>  		 * entry is the TOC value we need to use.
>  		 */
> -		func_descr_t __user *funct_desc_ptr =
> -			(func_descr_t __user *) ksig->ka.sa.sa_handler;
> +		struct ppc64_opd_entry __user *funct_desc_ptr =
> +			(struct ppc64_opd_entry __user *)ksig->ka.sa.sa_handler;
>  
> -		err |= get_user(regs->ctr, &funct_desc_ptr->entry);
> -		err |= get_user(regs->gpr[2], &funct_desc_ptr->toc);
> +		err |= get_user(regs->ctr, &funct_desc_ptr->addr);
> +		err |= get_user(regs->gpr[2], &funct_desc_ptr->r2);

Likewise, r2 seems like a worse name than toc. I guess we could clean
that up another time though.

Kind regards,
Daniel

>  	}
>  
>  	/* enter the signal handler in native-endian mode */
> -- 
> 2.31.1
