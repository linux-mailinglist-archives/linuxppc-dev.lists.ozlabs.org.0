Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB94F4C25F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:30:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45h06V3Qz3c5g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:30:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lsND3Rgs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=shorne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lsND3Rgs; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45gJ6tglz2x9d
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:29:47 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so1396835pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 00:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jedIA9WEwtNh3KGbShSkittm5VM0EONlJ1A9vm17fT8=;
 b=lsND3RgsKjI5xyyy6shdTuvhvnmDZ9B3/Dh3m0i7wShsj12/jV4Y/JRElBrJPFhjqK
 3n+mwI+y9BN7eENez0m00GTC9rsBB7xksx6i4bRTfo3Fxqk/KntZCQEMekZsBSewXLyR
 JlR9K9NziSTBsYajWlcEYxwddlukxg2S7azUE2LrDJuasZpGuOT+EiYJINvfdAUzfHOG
 tuS/+R2RIcd67V/Ma4xL97pbvS+lvgo1KuPu+v8t6/J8BV2BUp/rSchpcTMa8wK3m5UB
 mUuTWu6rQNlgJTc/kQjyZaIyTDAKKPYjgGUWctSXnF48+KypHZ33yGh5w19EZuHOHycQ
 CeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jedIA9WEwtNh3KGbShSkittm5VM0EONlJ1A9vm17fT8=;
 b=01FXU66VmS7Ih2DPuuA52XQDxh3/kygX0mtPKqweZpgRQ6ksY/GxdyNLpPfH6I959g
 fZcQEnfsCK1RfhOF7zQkV2fdECTDZ58YoKsyzBRy67eBIoUkLxQApvC8ULEbyVXCMnQZ
 +deRiOskKaza1RjHqn43hFF+6H72YvvfohNtpC24JRVSSImF30bRT3zwTKCPO9vK34km
 jkJOFVI8fgcKuS/h0rhLr1OZrB41MH4byqO+VdfnGQoXd0vGYt/M9dclie5yE92SDwnn
 rAo9oLpv+uidE5RTTrqtPYFqa8poOs0/feKeUDHRAVRwxUbRIu6EswAKLsIuEdA9OcpF
 rwCw==
X-Gm-Message-State: AOAM533E/Hst9y1KSo2/wkkk3+xaHTVIpyNgTeKJImJPjasGfm7aLuLB
 dSTCmIcmfoHoy9JlNImKWtI=
X-Google-Smtp-Source: ABdhPJzfJYZ3OGlEB7o1IETC2NwE70KCIwlHUyDhzjWmFqwoZ+PAmo3HYXXOEwyWz/POzBiBo3Y6cg==
X-Received: by 2002:a17:90b:3b4d:b0:1bc:a5a7:b389 with SMTP id
 ot13-20020a17090b3b4d00b001bca5a7b389mr1670354pjb.148.1645691384918; 
 Thu, 24 Feb 2022 00:29:44 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a17090a7d1500b001b968e82819sm5179319pjl.10.2022.02.24.00.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 00:29:36 -0800 (PST)
Date: Thu, 24 Feb 2022 17:29:34 +0900
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
Message-ID: <YhdB7tNDvtsYLUzr@antec>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 ardb@kernel.org, mingo@redhat.com, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 viro@zeniv.linux.org.uk, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, jcmvbkbc@gmail.com,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 16, 2022 at 02:13:27PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are many different ways that access_ok() is defined across
> architectures, but in the end, they all just compare against the
> user_addr_max() value or they accept anything.
> 
> Provide one definition that works for most architectures, checking
> against TASK_SIZE_MAX for user processes or skipping the check inside
> of uaccess_kernel() sections.
> 
> For architectures without CONFIG_SET_FS(), this should be the fastest
> check, as it comes down to a single comparison of a pointer against a
> compile-time constant, while the architecture specific versions tend to
> do something more complex for historic reasons or get something wrong.
> 
> Type checking for __user annotations is handled inconsistently across
> architectures, but this is easily simplified as well by using an inline
> function that takes a 'const void __user *' argument. A handful of
> callers need an extra __user annotation for this.
> 
> Some architectures had trick to use 33-bit or 65-bit arithmetic on the
> addresses to calculate the overflow, however this simpler version uses
> fewer registers, which means it can produce better object code in the
> end despite needing a second (statically predicted) branch.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Mark Rutland <mark.rutland@arm.com> [arm64, asm-generic]
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
...
>  arch/openrisc/include/asm/uaccess.h   | 19 +--------
...
>  include/asm-generic/access_ok.h       | 59 +++++++++++++++++++++++++++
>  include/asm-generic/uaccess.h         | 21 +---------
>  include/linux/uaccess.h               |  7 ----
>  32 files changed, 109 insertions(+), 366 deletions(-)
> 
...
> diff --git a/arch/openrisc/include/asm/uaccess.h b/arch/openrisc/include/asm/uaccess.h
> index 120f5005461b..8f049ec99b3e 100644
> --- a/arch/openrisc/include/asm/uaccess.h
> +++ b/arch/openrisc/include/asm/uaccess.h
> @@ -45,21 +45,7 @@
>  
>  #define uaccess_kernel()	(get_fs() == KERNEL_DS)
>  
> -/* Ensure that the range from addr to addr+size is all within the process'
> - * address space
> - */
> -static inline int __range_ok(unsigned long addr, unsigned long size)
> -{
> -	const mm_segment_t fs = get_fs();
> -
> -	return size <= fs && addr <= (fs - size);
> -}
> -
> -#define access_ok(addr, size)						\
> -({ 									\
> -	__chk_user_ptr(addr);						\
> -	__range_ok((unsigned long)(addr), (size));			\
> -})
> +#include <asm-generic/access_ok.h>

I was going to ask why we are missing __chk_user_ptr in the generic version.
But this is basically now a no-op so I think its OK.

>  /*
>   * These are the main single-value transfer routines.  They automatically
> @@ -268,9 +254,6 @@ clear_user(void __user *addr, unsigned long size)
>  	return size;
>  }
>  
> -#define user_addr_max() \
> -	(uaccess_kernel() ? ~0UL : TASK_SIZE)
> -
>  extern long strncpy_from_user(char *dest, const char __user *src, long count);
>  
>  extern __must_check long strnlen_user(const char __user *str, long n);

...
> diff --git a/include/asm-generic/access_ok.h b/include/asm-generic/access_ok.h
> new file mode 100644
> index 000000000000..1aad8964d2ed
> --- /dev/null
> +++ b/include/asm-generic/access_ok.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_GENERIC_ACCESS_OK_H__
> +#define __ASM_GENERIC_ACCESS_OK_H__
> +
> +/*
> + * Checking whether a pointer is valid for user space access.
> + * These definitions work on most architectures, but overrides can
> + * be used where necessary.
> + */
> +
> +/*
> + * architectures with compat tasks have a variable TASK_SIZE and should
> + * override this to a constant.
> + */
> +#ifndef TASK_SIZE_MAX
> +#define TASK_SIZE_MAX			TASK_SIZE
> +#endif
> +
> +#ifndef uaccess_kernel
> +#ifdef CONFIG_SET_FS
> +#define uaccess_kernel()		(get_fs().seg == KERNEL_DS.seg)
> +#else
> +#define uaccess_kernel()		(0)
> +#endif
> +#endif
> +
> +#ifndef user_addr_max
> +#define user_addr_max()			(uaccess_kernel() ? ~0UL : TASK_SIZE_MAX)
> +#endif
> +
> +#ifndef __access_ok
> +/*
> + * 'size' is a compile-time constant for most callers, so optimize for
> + * this case to turn the check into a single comparison against a constant
> + * limit and catch all possible overflows.
> + * On architectures with separate user address space (m68k, s390, parisc,
> + * sparc64) or those without an MMU, this should always return true.
> + *
> + * This version was originally contributed by Jonas Bonn for the
> + * OpenRISC architecture, and was found to be the most efficient
> + * for constant 'size' and 'limit' values.
> + */
> +static inline int __access_ok(const void __user *ptr, unsigned long size)
> +{
> +	unsigned long limit = user_addr_max();
> +	unsigned long addr = (unsigned long)ptr;
> +
> +	if (IS_ENABLED(CONFIG_ALTERNATE_USER_ADDRESS_SPACE))
> +		return true;
> +
> +	return (size <= limit) && (addr <= (limit - size));
> +}
> +#endif
> +
> +#ifndef access_ok
> +#define access_ok(addr, size) likely(__access_ok(addr, size))
> +#endif
> +
> +#endif
> diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
> index 0870fa11a7c5..ebc685dc8d74 100644
> --- a/include/asm-generic/uaccess.h
> +++ b/include/asm-generic/uaccess.h
> @@ -114,28 +114,9 @@ static inline void set_fs(mm_segment_t fs)
>  }
>  #endif
>  
> -#ifndef uaccess_kernel
> -#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
> -#endif
> -
> -#ifndef user_addr_max
> -#define user_addr_max() (uaccess_kernel() ? ~0UL : TASK_SIZE)
> -#endif
> -
>  #endif /* CONFIG_SET_FS */
>  
> -#define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
> -
> -/*
> - * The architecture should really override this if possible, at least
> - * doing a check on the get_fs()
> - */
> -#ifndef __access_ok
> -static inline int __access_ok(unsigned long addr, unsigned long size)
> -{
> -	return 1;
> -}
> -#endif
> +#include <asm-generic/access_ok.h>
>  
>  /*
>   * These are the main single-value transfer routines.  They automatically
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 67e9bc94dc40..2c31667e62e0 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -33,13 +33,6 @@ typedef struct {
>  	/* empty dummy */
>  } mm_segment_t;
>  
> -#ifndef TASK_SIZE_MAX
> -#define TASK_SIZE_MAX			TASK_SIZE
> -#endif
> -
> -#define uaccess_kernel()		(false)
> -#define user_addr_max()			(TASK_SIZE_MAX)
> -
>  static inline mm_segment_t force_uaccess_begin(void)
>  {
>  	return (mm_segment_t) { };


Acked-by: Stafford Horne <shorne@gmail.com> [openrisc, asm-generic]

Thanks!
