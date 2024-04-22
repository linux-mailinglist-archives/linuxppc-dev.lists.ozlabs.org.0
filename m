Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7EB8AD36A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 19:41:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Lwl60Ajt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNXcR66VJz3dDp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 03:41:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Lwl60Ajt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNXbh3B1pz3cjm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 03:41:02 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-61ac45807cbso48435117b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 10:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713807657; x=1714412457; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8oSz86JzOY9DQvGvueAGk0oxmVKc1JpB72xgEu0TDts=;
        b=Lwl60AjtXZTWkb8KTcUNB+GYlaWRULgl2zHVyp6aU23rIES7EDnWtjBpPVo2PdfP8e
         jDSnrehULnKlJsoPofNzW+ExoDiDhcIwJz7pmIHdfYPyCIUgssNC/W9QW2zNzFsiXo4H
         gae5TmIGKh/hIFyETt3UXVLptecdv3q3kXceDUucYxi4EzULMyTYziLQWikqRcTFOuYZ
         zLXP4GuxCd1ni0SzomWl+F7iFRjNTvrsxtF3fedOI41WfTMkPIwMGGkRmir8oZm4dSIZ
         Ts4igUpCbQdgbQNoxpfdnYwCwNWOOeXreyc4TKnH0vIwvCxCUaZlvlaW1Qd+EdyyDCr4
         3ajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713807657; x=1714412457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oSz86JzOY9DQvGvueAGk0oxmVKc1JpB72xgEu0TDts=;
        b=fOrIo1xx5qEbyyDh/a2nsKquzjE8qbZwQCp57JtOCSFVwjY6HyzxrdWyxNtlgF+yFB
         SUnUSYL0OkFRAWMRopYt0x81nqjHqQV0KJnI06tvEdiDc7l99zG1iwkGjHED874x03TN
         L6PoLqolq87cuaLNOWPdk4OPATq2KBbXKVrV6C9O0WImuB9IQFbl78E7LXvTbfSK3r4G
         r2rzjDiWMBCMn/HamcKaVz/loggUyEj3NePcV3NNUDkfh5DtJlEPOjXPp3qn/uWIjjy2
         Q/95LwFcaIPj+nK8EyD5Edc6O9nXDCxLWgvbn9P4Md+4n7BifkUxt0QZy+xrrES5wV2E
         hcOg==
X-Forwarded-Encrypted: i=1; AJvYcCXZcD3vrySxtD2MEqVG5rwh2PE7jXAXwa1chEPNEj/QakUWbpc8o8Fz8/etNs+/ZESlL0ZnAQnLvl40R21hemWoBePXwwJYmOzBguXBvA==
X-Gm-Message-State: AOJu0YwAt89VD3QACcWasw4Vm5kveXNS62xHZAR6DwD+l3zNrI0iGkEb
	QLV4U1aGaBwJK6BMHTOdOUMcbUDup/Et1C6xbNAGYG+10+/R4j9ar1j5pEnC/Kc=
X-Google-Smtp-Source: AGHT+IF6LQ8zdofhxJ/PNSOv5IQXexYxxfrsaWAs34RmUulyK1yyuZ4SFyNwWs4DcElioVxSqpYRPw==
X-Received: by 2002:a05:690c:3685:b0:617:c9b0:e12c with SMTP id fu5-20020a05690c368500b00617c9b0e12cmr10651242ywb.38.1713807655898;
        Mon, 22 Apr 2024 10:40:55 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id r29-20020a81441d000000b00608876ed731sm2060370ywa.126.2024.04.22.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 10:40:55 -0700 (PDT)
Date: Mon, 22 Apr 2024 13:40:53 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 14/15] riscv: Add support for suppressing warning
 backtraces
Message-ID: <ZiahJT8MTFqAlD5A@ghost>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-15-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403131936.787234-15-linux@roeck-us.net>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infra
 dead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2024 at 06:19:35AM -0700, Guenter Roeck wrote:
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
> 
> To limit image size impact, the pointer to the function name is only added
> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
> parameter is replaced with a (dummy) NULL parameter to avoid an image size
> increase due to unused __func__ entries (this is necessary because __func__
> is not a define but a virtual variable).
> 
> To simplify the implementation, unify the __BUG_ENTRY_ADDR and
> __BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
> the address, file, or function reference as parameter.
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
> v3:
> - Rebased to v6.9-rc2
> 
>  arch/riscv/include/asm/bug.h | 38 ++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
> index 1aaea81fb141..79f360af4ad8 100644
> --- a/arch/riscv/include/asm/bug.h
> +++ b/arch/riscv/include/asm/bug.h
> @@ -30,26 +30,39 @@
>  typedef u32 bug_insn_t;
>  
>  #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> -#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
> -#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
> +#define __BUG_REL(val)	RISCV_INT " " __stringify(val) " - ."
>  #else
> -#define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
> -#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
> +#define __BUG_REL(val)	RISCV_PTR " " __stringify(val)
>  #endif
>  
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> +
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	__BUG_REL(%1)
> +#else
> +# define __BUG_FUNC_PTR
> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> +
>  #define __BUG_ENTRY			\
> -	__BUG_ENTRY_ADDR "\n\t"		\
> -	__BUG_ENTRY_FILE "\n\t"		\
> -	RISCV_SHORT " %1\n\t"		\
> -	RISCV_SHORT " %2"
> +	__BUG_REL(1b) "\n\t"		\
> +	__BUG_REL(%0) "\n\t"		\
> +	__BUG_FUNC_PTR "\n\t"		\
> +	RISCV_SHORT " %2\n\t"		\
> +	RISCV_SHORT " %3"
>  #else
>  #define __BUG_ENTRY			\
> -	__BUG_ENTRY_ADDR "\n\t"		\
> -	RISCV_SHORT " %2"
> +	__BUG_REL(1b) "\n\t"		\
> +	RISCV_SHORT " %3"
>  #endif
>  
>  #ifdef CONFIG_GENERIC_BUG
> +#ifdef HAVE_BUG_FUNCTION
> +# define __BUG_FUNC	__func__
> +#else
> +# define __BUG_FUNC	NULL
> +#endif
> +
>  #define __BUG_FLAGS(flags)					\
>  do {								\
>  	__asm__ __volatile__ (					\
> @@ -58,10 +71,11 @@ do {								\
>  			".pushsection __bug_table,\"aw\"\n\t"	\
>  		"2:\n\t"					\
>  			__BUG_ENTRY "\n\t"			\
> -			".org 2b + %3\n\t"                      \
> +			".org 2b + %4\n\t"                      \
>  			".popsection"				\
>  		:						\
> -		: "i" (__FILE__), "i" (__LINE__),		\
> +		: "i" (__FILE__), "i" (__BUG_FUNC),		\
> +		  "i" (__LINE__),				\
>  		  "i" (flags),					\
>  		  "i" (sizeof(struct bug_entry)));              \
>  } while (0)
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

- Charlie

