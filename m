Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B65879E11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 23:02:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nL2p04Aw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvSLc1vlBz3vXS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 09:02:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nL2p04Aw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvSKs5lTnz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 09:02:09 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e6ac58fceaso902079b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 15:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710280927; x=1710885727; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HfVz/RhW1d+ABxE62vHBaQjSqXe83Qgl8810kDikh7s=;
        b=nL2p04AwxCI1SBnTx3SlDelY26frtMH3rksz9dqEgOkR4j82DEcz/m3KYryHUtIKEa
         Z6AHz6SPaznWSP3LlkBOZzVO50drGwC5+tRcu8NQnVq+lNFaXC0k4g+sKWK2bbAmS9d9
         gCPzGYwxDTiDNx+04PHUXBFJM8dBr5AhZnoUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710280927; x=1710885727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfVz/RhW1d+ABxE62vHBaQjSqXe83Qgl8810kDikh7s=;
        b=uW3aDMQZM3IouD8iH7JbFXwmE8VehjsldnguqCCL34VQwLazaANjCIsgekNA924U6C
         Uc4xl/X8OHHcmNxdeFEVYczTaS+jHywIeqU/s7xkvYAiFqHaerCOmYgPsFYpg1rg4rFg
         gpcl55GldW/lXhD9kcyU7/MmkI+ZcNQcOldVFMQQcaVyn0b9tkJxwbmoIW4h9Ag1ekqQ
         73kFULtMt5SHi8hq3ZPTUY2UICo2buPWhuCtyOXZfpB/GbUb4uA7aNGrXMElaX1w+Cwr
         MrBPKoRNIWGcGqEIJMIn1EFvB1RxeiU1QlFpIa+BcPDwhmQkroPleQUGufne6jy3ej8b
         0o6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVogpeTBUrjIWj1aMKx5Thqm1y63+EJShkspd0xy6g8vKOEd7J67SDB0bT/pOkDoo2XMfMD00e+8pQBCCDUmm3I/6J1eb51/kRL8vbH8Q==
X-Gm-Message-State: AOJu0Yy3talchmkvaLs6yxzk/vPf1g2fi250ZVVXY8v+sBb7bSdrRLrF
	/xpzVAG+VRsjKXFxp0lwHlkx6pjh26FCxTT4FndhcWut3TpNGO06bLvqMoYUMw==
X-Google-Smtp-Source: AGHT+IFaAzHiJbVMwydAnFUAbBGgB4TiVXgXXf4Bmn7UNMuMdpujdzLwHr5uC0yhXwauRYk5a8qmzQ==
X-Received: by 2002:a05:6a00:4fcb:b0:6e6:afa3:7b32 with SMTP id le11-20020a056a004fcb00b006e6afa37b32mr865695pfb.6.1710280926942;
        Tue, 12 Mar 2024 15:02:06 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p35-20020a056a000a2300b006e6ab799457sm1315765pfh.110.2024.03.12.15.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 15:02:06 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:02:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 02/14] kunit: bug: Count suppressed warning backtraces
Message-ID: <202403121501.F7CA06C@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-3-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-3-linux@roeck-us.net>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, netdev@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <a
 kpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 12, 2024 at 10:02:57AM -0700, Guenter Roeck wrote:
> Count suppressed warning backtraces to enable code which suppresses
> warning backtraces to check if the expected backtrace(s) have been
> observed.
> 
> Using atomics for the backtrace count resulted in build errors on some
> architectures due to include file recursion, so use a plain integer
> for now.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  include/kunit/bug.h | 7 ++++++-
>  lib/kunit/bug.c     | 4 +++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/kunit/bug.h b/include/kunit/bug.h
> index 1e34da961599..2097a854ac8c 100644
> --- a/include/kunit/bug.h
> +++ b/include/kunit/bug.h
> @@ -20,6 +20,7 @@
>  struct __suppressed_warning {
>  	struct list_head node;
>  	const char *function;
> +	int counter;

Thanks for adding a counter!

>  };
>  
>  void __start_suppress_warning(struct __suppressed_warning *warning);
> @@ -28,7 +29,7 @@ bool __is_suppressed_warning(const char *function);
>  
>  #define DEFINE_SUPPRESSED_WARNING(func)	\
>  	struct __suppressed_warning __kunit_suppress_##func = \
> -		{ .function = __stringify(func) }
> +		{ .function = __stringify(func), .counter = 0 }
>  
>  #define START_SUPPRESSED_WARNING(func) \
>  	__start_suppress_warning(&__kunit_suppress_##func)
> @@ -39,12 +40,16 @@ bool __is_suppressed_warning(const char *function);
>  #define IS_SUPPRESSED_WARNING(func) \
>  	__is_suppressed_warning(func)
>  
> +#define SUPPRESSED_WARNING_COUNT(func) \
> +	(__kunit_suppress_##func.counter)
> +
>  #else /* CONFIG_KUNIT */
>  
>  #define DEFINE_SUPPRESSED_WARNING(func)
>  #define START_SUPPRESSED_WARNING(func)
>  #define END_SUPPRESSED_WARNING(func)
>  #define IS_SUPPRESSED_WARNING(func) (false)
> +#define SUPPRESSED_WARNING_COUNT(func) (0)
>  
>  #endif /* CONFIG_KUNIT */
>  #endif /* __ASSEMBLY__ */
> diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
> index f93544d7a9d1..13b3d896c114 100644
> --- a/lib/kunit/bug.c
> +++ b/lib/kunit/bug.c
> @@ -32,8 +32,10 @@ bool __is_suppressed_warning(const char *function)
>  		return false;
>  
>  	list_for_each_entry(warning, &suppressed_warnings, node) {
> -		if (!strcmp(function, warning->function))
> +		if (!strcmp(function, warning->function)) {
> +			warning->counter++;
>  			return true;
> +		}
>  	}
>  	return false;
>  }
> -- 
> 2.39.2
> 

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
