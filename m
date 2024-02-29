Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B372086BF7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 04:32:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M5qY+g35;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlcHL2HDhz3vY2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 14:32:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M5qY+g35;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlcGc2lP9z3bsn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 14:32:07 +1100 (AEDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-22007fe465bso262117fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 19:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709177519; x=1709782319; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CoFW6OKdyVFW2sqEZWn71FgR7RIK3QxGugFdW/eOQs=;
        b=M5qY+g35XzJ+BR6eYVNrxRSX7bXfhMhuHm5M6DgoaYKvAmp8/7mTHpwaFeXpHXHW3g
         GSBRIyCvWA9mva1nLXdx9jNmLjXVrlQNxgXOEKu2ZF5AQy0vi6Cz3HDzSoB1vGZCZgsh
         bZ9OgoeyKcLu7l5FaQ9JN3KZQcTsVGHMJkBtenS+wT/6a9eMkIFQMd3/7iPhBp2sly31
         i/zxMvMT9sPF9eh1n+B1qbDLtoeVLXahdhWAUPPkV4AZW3ggwNXv5ekrVALVnS5w8hCx
         2rLea0/xC2j/Sz+JECq+AgCRIqyOtt8SyukWp+/yAv76Fh2wiZHmgWKyDQpVx94qflJ5
         LkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709177519; x=1709782319;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4CoFW6OKdyVFW2sqEZWn71FgR7RIK3QxGugFdW/eOQs=;
        b=ZPFjHe3mly6mVNy79Ek8km6xaUQMrmrQaiQ9d6sFQziTh/BFT572cRwR7T3HhHRupF
         Iq7Mftw3mN06qy4I91PRnKEr0nvLg6YU+kTpPTUKC0/gWEE1XawUNGQcus+xrsjXJeiB
         LmAjVAFE/Y0Awk+vyR6fyucpAMoCI5SKI31rDV3wM3DiWnwNpgg7hjUQtbA+2zov6TOw
         kNxxI7WM8BowJw8zU5o54Z9za1Kd8zqsgnbHgMnFxN8blwsmI3cyjnNCrFYtgKUj4QKn
         7E6GGTWnHDk4zM9PZacKoQym73Zveq9ucUNXbXPXWJXY5xOqH5d8PtN3p3lNKggotqMG
         v07g==
X-Forwarded-Encrypted: i=1; AJvYcCVC1LFVXL6ewMiec69cbwUH5mR3cZNtuiShkJvAN+tVTApekgyEYxpUV2r9/KswslrmFVoNhwfiCuewquzZGr5b5dqXXbsionGIaUMn5w==
X-Gm-Message-State: AOJu0YwzEnifa972Bsmc+OsasfHdXfqjfqv2aNWBZSLpt6b2nxXN0HA5
	8jstbwwtTjCrC2ICBqMaq8ANq5780RQKi9DXPhogd9IeNfYY7QoB
X-Google-Smtp-Source: AGHT+IFB9PEwchGQbbJVMouwlE0FuOhB6jELVU4WqBvhZ3nzeCZtjl/MpeNpD6vcpNdJ4Et8AtDDpw==
X-Received: by 2002:a05:6870:40d5:b0:21f:df18:349b with SMTP id l21-20020a05687040d500b0021fdf18349bmr837242oal.35.1709177519588;
        Wed, 28 Feb 2024 19:31:59 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id u23-20020aa78497000000b006e5092fb3efsm183625pfn.159.2024.02.28.19.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 19:31:59 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Feb 2024 13:31:52 +1000
Message-Id: <CZH8V1T0Z3QN.1ZVFAXR4B96BZ@wheely>
Subject: Re: [kvm-unit-tests PATCH 03/13] treewide: lib/stack: Fix backtrace
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>
X-Mailer: aerc 0.15.2
References: <20240228150416.248948-15-andrew.jones@linux.dev>
 <20240228150416.248948-18-andrew.jones@linux.dev>
In-Reply-To: <20240228150416.248948-18-andrew.jones@linux.dev>
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
Cc: lvivier@redhat.com, linux-s390@vger.kernel.org, thuth@redhat.com, nrb@linux.ibm.com, frankja@linux.ibm.com, kvmarm@lists.linux.dev, pbonzini@redhat.com, imbrenda@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Feb 29, 2024 at 1:04 AM AEST, Andrew Jones wrote:
> We should never pass the result of __builtin_frame_address(0) to
> another function since the compiler is within its rights to pop the
> frame to which it points before making the function call, as may be
> done for tail calls. Nobody has complained about backtrace(), so
> likely all compilations have been inlining backtrace_frame(), not
> dropping the frame on the tail call, or nobody is looking at traces.
> However, for riscv, when built for EFI, it does drop the frame on the
> tail call, and it was noticed. Preemptively fix backtrace() for all
> architectures.
>
> Fixes: 52266791750d ("lib: backtrace printing")
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  lib/arm/stack.c   | 13 +++++--------
>  lib/arm64/stack.c | 12 +++++-------
>  lib/riscv/stack.c | 12 +++++-------
>  lib/s390x/stack.c | 12 +++++-------
>  lib/stack.h       | 24 +++++++++++++++++-------
>  lib/x86/stack.c   | 12 +++++-------
>  6 files changed, 42 insertions(+), 43 deletions(-)
>
> diff --git a/lib/arm/stack.c b/lib/arm/stack.c
> index 7d081be7c6d0..66d18b47ea53 100644
> --- a/lib/arm/stack.c
> +++ b/lib/arm/stack.c
> @@ -8,13 +8,16 @@
>  #include <libcflat.h>
>  #include <stack.h>
> =20
> -int backtrace_frame(const void *frame, const void **return_addrs,
> -		    int max_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	static int walking;
>  	int depth;
>  	const unsigned long *fp =3D (unsigned long *)frame;
> =20
> +	if (current_frame)
> +		fp =3D __builtin_frame_address(0);
> +
>  	if (walking) {
>  		printf("RECURSIVE STACK WALK!!!\n");
>  		return 0;
> @@ -33,9 +36,3 @@ int backtrace_frame(const void *frame, const void **ret=
urn_addrs,
>  	walking =3D 0;
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/arm64/stack.c b/lib/arm64/stack.c
> index 82611f4b1815..f5eb57fd8892 100644
> --- a/lib/arm64/stack.c
> +++ b/lib/arm64/stack.c
> @@ -8,7 +8,8 @@
> =20
>  extern char vector_stub_start, vector_stub_end;
> =20
> -int backtrace_frame(const void *frame, const void **return_addrs, int ma=
x_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	const void *fp =3D frame;
>  	static bool walking;
> @@ -17,6 +18,9 @@ int backtrace_frame(const void *frame, const void **ret=
urn_addrs, int max_depth)
>  	bool is_exception =3D false;
>  	unsigned long addr;
> =20
> +	if (current_frame)
> +		fp =3D __builtin_frame_address(0);
> +
>  	if (walking) {
>  		printf("RECURSIVE STACK WALK!!!\n");
>  		return 0;
> @@ -54,9 +58,3 @@ int backtrace_frame(const void *frame, const void **ret=
urn_addrs, int max_depth)
>  	walking =3D false;
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
> index 712a5478d547..d865594b9671 100644
> --- a/lib/riscv/stack.c
> +++ b/lib/riscv/stack.c
> @@ -2,12 +2,16 @@
>  #include <libcflat.h>
>  #include <stack.h>
> =20
> -int backtrace_frame(const void *frame, const void **return_addrs, int ma=
x_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	static bool walking;
>  	const unsigned long *fp =3D (unsigned long *)frame;
>  	int depth;
> =20
> +	if (current_frame)
> +		fp =3D __builtin_frame_address(0);
> +
>  	if (walking) {
>  		printf("RECURSIVE STACK WALK!!!\n");
>  		return 0;
> @@ -24,9 +28,3 @@ int backtrace_frame(const void *frame, const void **ret=
urn_addrs, int max_depth)
>  	walking =3D false;
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/s390x/stack.c b/lib/s390x/stack.c
> index 9f234a12adf6..d194f654e94d 100644
> --- a/lib/s390x/stack.c
> +++ b/lib/s390x/stack.c
> @@ -14,11 +14,15 @@
>  #include <stack.h>
>  #include <asm/arch_def.h>
> =20
> -int backtrace_frame(const void *frame, const void **return_addrs, int ma=
x_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	int depth =3D 0;
>  	struct stack_frame *stack =3D (struct stack_frame *)frame;
> =20
> +	if (current_frame)
> +		stack =3D __builtin_frame_address(0);
> +
>  	for (depth =3D 0; stack && depth < max_depth; depth++) {
>  		return_addrs[depth] =3D (void *)stack->grs[8];
>  		stack =3D stack->back_chain;
> @@ -28,9 +32,3 @@ int backtrace_frame(const void *frame, const void **ret=
urn_addrs, int max_depth)
> =20
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/stack.h b/lib/stack.h
> index 10fc2f793354..6edc84344b51 100644
> --- a/lib/stack.h
> +++ b/lib/stack.h
> @@ -11,17 +11,27 @@
>  #include <asm/stack.h>
> =20
>  #ifdef HAVE_ARCH_BACKTRACE_FRAME
> -extern int backtrace_frame(const void *frame, const void **return_addrs,
> -			   int max_depth);
> +extern int arch_backtrace_frame(const void *frame, const void **return_a=
ddrs,
> +				int max_depth, bool current_frame);
> +
> +static inline int backtrace_frame(const void *frame, const void **return=
_addrs,
> +				  int max_depth)
> +{
> +	return arch_backtrace_frame(frame, return_addrs, max_depth, false);
> +}
> +
> +static inline int backtrace(const void **return_addrs, int max_depth)
> +{
> +	return arch_backtrace_frame(NULL, return_addrs, max_depth, true);
> +}
>  #else
> -static inline int
> -backtrace_frame(const void *frame __unused, const void **return_addrs __=
unused,
> -		int max_depth __unused)
> +extern int backtrace(const void **return_addrs, int max_depth);
> +
> +static inline int backtrace_frame(const void *frame, const void **return=
_addrs,
> +				  int max_depth)
>  {
>  	return 0;
>  }
>  #endif
> =20
> -extern int backtrace(const void **return_addrs, int max_depth);
> -
>  #endif

Is there a reason to add the inline wrappers rather than just externs
and drop the arch_ prefix?

Do we want to just generally have all arch specific functions have an
arch_ prefix? Fine by me.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

I'm fine to rebase the powerpc patch on top of this if it goes in first.
Thanks for the heads up.

Thanks,
Nick
