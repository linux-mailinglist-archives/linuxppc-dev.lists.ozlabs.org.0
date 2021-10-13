Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7B442B853
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 09:02:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTk4G2MRhz3cN1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:02:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MiMmWBnV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=MiMmWBnV; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTk3h2rQhz2yNL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 18:01:52 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id f5so1392629pgc.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 00:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=W1TvfEn9hETtgRdpCl58SYxcbENIjjH6xIOozoqUidk=;
 b=MiMmWBnV7fK/LRulBj97pgznDjd0sTVyvYOHU+wqZXHDzKYsb5IY0/pybu5wCZVeUO
 89tP8M8FQFXw1CVUA6arONHwFzF7aXl/UqXncJs22D99krNezbXxMuuF6TpDeG+DvXC3
 wMyDgBXJxJzBcQsvICTBtJ/TWHtit/X5eqtpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W1TvfEn9hETtgRdpCl58SYxcbENIjjH6xIOozoqUidk=;
 b=ROC3NL0ennwCfcshPHct/u1IQ/5NdZbqaTW2ZkiigoTj5nypWevWKYlWZjrJcOzmCA
 4qmFOLmO6VzPtNl3ocIqZ6lZnn5jeJscacRNnBQg+q+DpLsHRp/TvYB0zTat2Kxx4CO7
 ZhkeYL5fUrUytiw67fpl3sPWU/Mvmf89HouOnoQ8lSxDIc+tRy0xU+Yl5ODI2sq4dbyP
 2gKYbnVVAHU5a4IcdbwSsKAmarIF+Xmm4GWbQIEm+ZhE7YDwrI58XDeNmtt7WRyhEXQu
 wjwHcNwGVMeuyxiQHQD2/+l2XLilVESIybwA9rWhCgE7+kkH7oJ1zklqJY9qUlgZlA8+
 UojQ==
X-Gm-Message-State: AOAM53367232SWjCsktoUypRlkMx6XOBDhpAvMBMUGSFKQL5G8YaEi04
 OslWS5QyDjIHHb9AR/xlNMvZYg==
X-Google-Smtp-Source: ABdhPJwyFLjw/2mnoLszmWzrHimaUwUUOJtR4rLgtHIulRE2XeazTIf6D+X27fVIGJT33rf3Ee5ReA==
X-Received: by 2002:a63:9a12:: with SMTP id o18mr17842269pge.419.1634108509519; 
 Wed, 13 Oct 2021 00:01:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a67sm12924857pfa.128.2021.10.13.00.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 00:01:49 -0700 (PDT)
Date: Wed, 13 Oct 2021 00:01:48 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 05/10] asm-generic: Define 'funct_descr_t' to commonly
 describe function descriptors
Message-ID: <202110130001.11A50456@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <02224551451ab9c37055499fc621c41246c81125.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02224551451ab9c37055499fc621c41246c81125.1633964380.git.christophe.leroy@csgroup.eu>
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

On Mon, Oct 11, 2021 at 05:25:32PM +0200, Christophe Leroy wrote:
> We have three architectures using function descriptors, each with its
> own name.
> 
> Add a common typedef that can be used in generic code.
> 
> Also add a stub typedef for architecture without function descriptors,

nit: funct_descr_t reads weird to me. why not func_desc_t ? Either way:

Reviewed-by: Kees Cook <keescook@chromium.org>


> to avoid a forest of #ifdefs.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/ia64/include/asm/sections.h    | 1 +
>  arch/parisc/include/asm/sections.h  | 1 +
>  arch/powerpc/include/asm/sections.h | 1 +
>  include/asm-generic/sections.h      | 3 +++
>  4 files changed, 6 insertions(+)
> 
> diff --git a/arch/ia64/include/asm/sections.h b/arch/ia64/include/asm/sections.h
> index 80f5868afb06..929b5c535620 100644
> --- a/arch/ia64/include/asm/sections.h
> +++ b/arch/ia64/include/asm/sections.h
> @@ -8,6 +8,7 @@
>   */
>  
>  #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
> +typedef struct fdesc funct_descr_t;
>  
>  #include <linux/elf.h>
>  #include <linux/uaccess.h>
> diff --git a/arch/parisc/include/asm/sections.h b/arch/parisc/include/asm/sections.h
> index 2e781ee19b66..329e80f7af0a 100644
> --- a/arch/parisc/include/asm/sections.h
> +++ b/arch/parisc/include/asm/sections.h
> @@ -4,6 +4,7 @@
>  
>  #ifdef CONFIG_64BIT
>  #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
> +typedef Elf64_Fdesc funct_descr_t;
>  #endif
>  
>  /* nothing to see, move along */
> diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
> index b7f1ba04e756..d0d5287fa568 100644
> --- a/arch/powerpc/include/asm/sections.h
> +++ b/arch/powerpc/include/asm/sections.h
> @@ -10,6 +10,7 @@
>  
>  #ifdef PPC64_ELF_ABI_v1
>  #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
> +typedef struct ppc64_opd_entry funct_descr_t;
>  #endif
>  
>  #include <asm-generic/sections.h>
> diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
> index 1db5cfd69817..436412d94054 100644
> --- a/include/asm-generic/sections.h
> +++ b/include/asm-generic/sections.h
> @@ -63,6 +63,9 @@ extern __visible const void __nosave_begin, __nosave_end;
>  #else
>  #define dereference_function_descriptor(p) ((void *)(p))
>  #define dereference_kernel_function_descriptor(p) ((void *)(p))
> +typedef struct {
> +	unsigned long addr;
> +} funct_descr_t;
>  #endif
>  
>  /* random extra sections (if any).  Override
> -- 
> 2.31.1
> 

-- 
Kees Cook
