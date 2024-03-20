Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 951AC8818F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 22:09:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FyIhWhLD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0Ln236wRz3dWh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 08:09:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FyIhWhLD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0LmH2K8yz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 08:08:29 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-29f93c4946cso275158a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 14:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710968906; x=1711573706; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uLkYzB5+ZTvWOiX3IvyY6oP/ICYdTVuS+z29/pPznQ8=;
        b=FyIhWhLDhZEWmrYjT6tEkN2HR66A2qZeoYogDHOqO9+mz33i2l6VSPoWYrqGDyTVas
         4BQ6rAn/xSm65yV/VDBvkCr5q+vbKV5vQkuHFyDb6VLitADvt3l/EYYxOnavAHP9ee1P
         9BCauk3KZdrRH6d4BAZX+7FYGidRaEH5tzlao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710968906; x=1711573706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLkYzB5+ZTvWOiX3IvyY6oP/ICYdTVuS+z29/pPznQ8=;
        b=pDHmg1Zqieit2JFYk3/duXbIbKDmSF1xmhxdsVob3GH1YxwS7YXGC3f+bNdw1uwsy/
         VPAukgiuN5/BaO7E+PdXHfIzsZpcSbdjTP2nmYiz77AXT0z6MfOHX6zXRgH5tnXsPCdA
         7aYNLpyKd8S+LLtE0SH/dgPI4E2drAtQ8MVnUUwv86YcW1GE7tQkAFv+mDfkGUBdk6Gi
         pBW+03XlO922AZgEqwjVXdhy+anadEMqsvotF/I3yELMoTvSfreFW/ssydkf5jyASSzJ
         exG9oRqJhMjgFE7qrXhOHZO8qae7nteiyFpiQHWAYZ64BhxGt3Op1qaesWo9qSY6ykTs
         Ll7A==
X-Forwarded-Encrypted: i=1; AJvYcCWGzHbvV3Dt/UrjfuNShIvbf4rf25pvGNXfjZZ/wLjrzuKqztXah7zTn/O47HoHxp117S9NT03v6vGvmUdIu++Z7m4TaIHeikOPvKVhRg==
X-Gm-Message-State: AOJu0YxNENBdkHjPmYF3q4LF31+JGV1jj5zQy+6HK3N14buvIev5UJLE
	sal43rtyBsS3u1P0cIT+SyTxqilFsi0tgPTZorXXkSHTkYtesoiOAZPDC0Arrw==
X-Google-Smtp-Source: AGHT+IFltwN6J3gvzQbI/NEeVt7wOISvzFFbommwSsWSGAWyfbnUCH2tsn1YPIhLgukC979AFUKfHQ==
X-Received: by 2002:a17:90b:2c8d:b0:29f:b0a6:3c5 with SMTP id sw13-20020a17090b2c8d00b0029fb0a603c5mr206050pjb.49.1710968906551;
        Wed, 20 Mar 2024 14:08:26 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id so15-20020a17090b1f8f00b002a0187d84f0sm162906pjb.20.2024.03.20.14.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 14:08:26 -0700 (PDT)
Date: Wed, 20 Mar 2024 14:08:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] vdso: use CONFIG_PAGE_SHIFT in vdso/datapage.h
Message-ID: <202403201408.48C8AC89A@keescook>
References: <20240320180228.136371-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320180228.136371-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andy Lutomirski <luto@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 20, 2024 at 07:02:15PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Both the vdso rework and the CONFIG_PAGE_SHIFT changes were merged during
> the v6.9 merge window, so it is now possible to use CONFIG_PAGE_SHIFT
> instead of including asm/page.h in the vdso.
> 
> This avoids the workaround for arm64 and addresses a build warning
> for powerpc64:
> 
> In file included from <built-in>:4:
> In file included from /home/arnd/arm-soc/arm-soc/lib/vdso/gettimeofday.c:5:
> In file included from ../include/vdso/datapage.h:25:
> arch/powerpc/include/asm/page.h:230:9: error: result of comparison of constant 13835058055282163712 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>   230 |         return __pa(kaddr) >> PAGE_SHIFT;
>       |                ^~~~~~~~~~~
> arch/powerpc/include/asm/page.h:217:37: note: expanded from macro '__pa'
>   217 |         VIRTUAL_WARN_ON((unsigned long)(x) < PAGE_OFFSET);              \
>       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
> arch/powerpc/include/asm/page.h:202:73: note: expanded from macro 'VIRTUAL_WARN_ON'
>   202 | #define VIRTUAL_WARN_ON(x)      WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && (x))
>       |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
> arch/powerpc/include/asm/bug.h:88:25: note: expanded from macro 'WARN_ON'
>    88 |         int __ret_warn_on = !!(x);                              \
>       |                                ^
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
> See-also: 8b3843ae3634 ("vdso/datapage: Quick fix - use asm/page-def.h for ARM64")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for tracking this!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
