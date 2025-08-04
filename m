Return-Path: <linuxppc-dev+bounces-10619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDEDB1A883
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 19:15:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwjqT1tYMz3bnB;
	Tue,  5 Aug 2025 03:15:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754327717;
	cv=none; b=dm26Zo7VPjxvkuf0ElnqLl0CYGwkNJKSABbVwdpBLQJkiaxQll3rHeeGp4p5rVpcGTuVaUHX3nY+wXDtMngURA50eiI/f8QtcbRwS/fL0Nj5MLCrI7AbvMx2k2F/BQr0IjbX0c1datG+ERrAwhKs4fa3EoLOSF5IOPPfBo8Se9kL8BcI91nwOxrAjDiyWOvPCrwQ54Gw+o9HygAhSLqOHJWj1vZ6D2FXlGAoiy7dgJR6NPKxTncExDPicMRMOtEjvuT9GreaxSkquA4KLbTrISnnLhNspnG23h5UXZxTmcuaT3MhCibbmksh6U8bQT4xGezthjo9/jlh5Yi0Fdls1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754327717; c=relaxed/relaxed;
	bh=1ES2rPSb96ZRcMua/upicMCXBbX2m2hK2sP3TCwY9yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOvDThypwvawqWlgS0AW7UBnbpErgZkQmmqvDQ2aH0txh1WE8WXhw7dfdnqYsfCkb0jzlBb2omSUgqDJ8NR+uweOVrTJQ1YH+Jr5TUasH6GP9C+1vspUFJ/HbOlLLCnPg1bOhEmMDzCm62I4pGiOA8strcwVNUdY94b9ob7Ijeb398pv1oeS9GHU+OCS5T8rhvJ1uIV8YVV85F9Ap33Ie/mTu6okzwqVhZumGmalR3cfcANzJIsC6GVtVWZ+4ZyseZTRjiEhGQC/o7j8vslEHQxV2VKL0Q1Xs0rX36otGIYzcjPBohX6F93jITmhS0J76PflqqtKicGpv2+1v+pkUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YtaJmwhM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=shorne@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YtaJmwhM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=shorne@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwjqS0GS1z3blF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 03:15:15 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-458c063baeaso14188235e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Aug 2025 10:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754327709; x=1754932509; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ES2rPSb96ZRcMua/upicMCXBbX2m2hK2sP3TCwY9yY=;
        b=YtaJmwhMuSxzzRB/Znc67yHTEnJaUd3KCcnQZJNSKNWwBFa4saC73glAATZ4mXGkoQ
         sNtcmjF0yvFvT9qgMVCKbD4gWdyijOnPh4Hiy3RXkmrK/quuG6cqjUM2OvM3AcjZdrhK
         BfvR/7TGY+kbPlzkKudaM267k45clgik/yAnWRXQ0WK9v8Yj1JOiMfHy6X+HwpAnPrFJ
         xtp96lDZXlvV2Iwbgm9cONB1k7RRhGROC5msPOdFi0mIXWYhMPzQy6RLTGhru+q/MWZe
         S9hN5a5aDKf6TcE4dwxZsbLfQle9PMOp73M0S0z028eGjGg64tyVwJyN2B7qx6JLUuKZ
         FU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754327709; x=1754932509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ES2rPSb96ZRcMua/upicMCXBbX2m2hK2sP3TCwY9yY=;
        b=V86qRSzKbYt57xHX+uvlQllAJQzupOB/8q8QpocDaop6PWU/TONN1GXP7U1GVJ2ZDT
         jIpcbO0b50rtNj2t3+InEvIAX1PhWsufTZPuEF3w3FSVoKA70+CHq4kmr1L+njkfI72G
         walhnDDijBB5Gez3K9muXBxT5x5HKo/LUPZXHJBc+yzCMnnEofTzti/5UQNYZ8p6fQQz
         H7mtRQSZ6wNQ1yrKMbNf72onwSBksjDA8A+IzQ85RgaUYNFGnWFGD+/wbH/YeVJi6xyh
         fM5w/SDx4v99Qg23sFksefT/koriQAzGiCy2hohYnVmcqMvUV5BfrJY1r3S8PJ05yvRJ
         f89A==
X-Forwarded-Encrypted: i=1; AJvYcCViHqvHsBOlZ27SZ5IMtG+jNJiIlSpWO6H1nXOTZFOXqeBeWPNvcT4NbqgF+7cg4aawyh7Z5eI2rvi+Hrc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyDQRiMJasSWbrsn3nLS9Fu4O2N2QuroR/bQ+hxfR6uXxup8vmi
	1CDANnWgsLEDK3DRcup5OsY+e90HhWao2l8DwIpmpCLBxiMfSPfKA3LfZ3tqK1we
X-Gm-Gg: ASbGncsgMoyMxPH2IYnSZ/w4fP2y34yD7gVUJgsmiFj9GMRqmG3/0GjNigs8qmhRiF6
	t66gZ+Yet1+S71emxfIaBXDOHRERPhYbCgxQ99d4TGtsyw3k+dPqMgsxTn+pONEXUvWAtoX3vcx
	Mg+ydvML6r3PQhYqBM2BSaIQsWD/UVBgDccd/g2hIHjfZTwLahPwpf/m989z1I1wESd1rR+K4rS
	q1W/M5J8lh1IhpgYgyKWe3K1nQ8smAAU49jfd965N4S9zOC0kNfGg/s9vNYo5L8wsFCv8Iax0bs
	cpJQ6LTIK67XrzRtsbjoUHphNGvZUTJArFEMtyuwwtSb+szYJkMt5QDKxFwDHWa/FSp16bWTOTl
	XbSDOGbZXR5dbIVR02SzoRVHCU/hS7adiVGLSYie+MkUh8m/Jv19/g7VBcpYX5A==
X-Google-Smtp-Source: AGHT+IEpNawQWUPhZIXoNWLCtN2+qaXCsKArzNXCXzW1yE3i7/WUxeM9GsxIUXvlWMi666W2l82q6Q==
X-Received: by 2002:a05:6000:40c9:b0:3b8:893f:a185 with SMTP id ffacd0b85a97d-3b8d94cf20dmr7323692f8f.53.1754327708754;
        Mon, 04 Aug 2025 10:15:08 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ae8esm16051546f8f.61.2025.08.04.10.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 10:15:07 -0700 (PDT)
Date: Mon, 4 Aug 2025 18:15:06 +0100
From: Stafford Horne <shorne@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 10/17] openrisc: Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <aJDqmoUNhwWeAlpa@antec>
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-10-kees@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804164417.1612371-10-kees@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 09:44:06AM -0700, Kees Cook wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> Add missing __attribute_const__ annotations to OpenRISC's implementations of
> ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
> functions that always return the same result for the same input with no
> side effects, making them eligible for compiler optimization.
> 
> Build tested ARCH=openrisc defconfig with GCC or1k-linux 15.1.0.

THis looks ok to me.

> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  arch/openrisc/include/asm/bitops/__ffs.h | 2 +-
>  arch/openrisc/include/asm/bitops/__fls.h | 2 +-
>  arch/openrisc/include/asm/bitops/ffs.h   | 2 +-
>  arch/openrisc/include/asm/bitops/fls.h   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/openrisc/include/asm/bitops/__ffs.h b/arch/openrisc/include/asm/bitops/__ffs.h
> index 1e224b616fdf..4827b66530b2 100644
> --- a/arch/openrisc/include/asm/bitops/__ffs.h
> +++ b/arch/openrisc/include/asm/bitops/__ffs.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FF1
>  
> -static inline unsigned long __ffs(unsigned long x)
> +static inline __attribute_const__ unsigned long __ffs(unsigned long x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/__fls.h b/arch/openrisc/include/asm/bitops/__fls.h
> index 9658446ad141..637cc76fe4b7 100644
> --- a/arch/openrisc/include/asm/bitops/__fls.h
> +++ b/arch/openrisc/include/asm/bitops/__fls.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FL1
>  
> -static inline unsigned long __fls(unsigned long x)
> +static inline __attribute_const__ unsigned long __fls(unsigned long x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/ffs.h b/arch/openrisc/include/asm/bitops/ffs.h
> index b4c835d6bc84..536a60ab9cc3 100644
> --- a/arch/openrisc/include/asm/bitops/ffs.h
> +++ b/arch/openrisc/include/asm/bitops/ffs.h
> @@ -10,7 +10,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FF1
>  
> -static inline int ffs(int x)
> +static inline __attribute_const__ int ffs(int x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/fls.h b/arch/openrisc/include/asm/bitops/fls.h
> index 6b77f6556fb9..77da7639bb3e 100644
> --- a/arch/openrisc/include/asm/bitops/fls.h
> +++ b/arch/openrisc/include/asm/bitops/fls.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FL1
>  
> -static inline int fls(unsigned int x)
> +static inline __attribute_const__ int fls(unsigned int x)
>  {
>  	int ret;
>  
> -- 
> 2.34.1
> 
> 

