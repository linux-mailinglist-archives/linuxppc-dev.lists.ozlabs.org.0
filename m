Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C025A4FB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 07:22:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhC4s4CvBzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 15:22:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CoA4IxJ6; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhC3D5M7pzDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 15:21:27 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id u3so3289603qkd.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 22:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pUaYX9zKEjE3UC87tIgYQTtj9y801Ydigt+bunW6HZ0=;
 b=CoA4IxJ6ah2GKpke3J8wgjl3AqhJAtr5OAZo3b0AeRdtZbNM8OI6vkKf8k3cFvkUHU
 DLEzwLmnFhOBIOuYL2DvY/ZIwhGoccBCDS/Q3Sj2t/oY4SujxKfv/CeJgWid/pylr/wa
 YbPbmPqxrL5GZu/gmN71BUgIIuNR+1+8Mwreekz3HyH61PQxNBqiLwlIYoBmMH7FFK+8
 xhy9xNcfFVxk9yJT4gmfpVTCaxIVv1YahHKWeR5Cb0w80G+AvCdTKKVJqjMyLymHnW/r
 b79288BW5J5ScjhDLEIKwr9iiuVV4zUBpK5TKiYDTGSxShQaQqHKdYVVsCh+ccb5O7uN
 j1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pUaYX9zKEjE3UC87tIgYQTtj9y801Ydigt+bunW6HZ0=;
 b=ZawmqmYIdaOOyp2GuIPRwhk6NIXvSSrSELpAK37as0aVQbqQhY/BMTjZPs8y7hBWqQ
 16+qv2U+UJTDW2R6Yor9mV2ShbXPjAJMwhHgaa+WcyJt6/qI5fboQwx7L4Q+l+G9qhgG
 ifXjqd803kfUJ5hckBBVJVin0yPH+ipgJdOIXbocfG8lJYhvAu8Qz1OBNoVr4L+sgOeb
 KXWK5OSM+vwgYJJXXaGNMpP5lO/rlLW4zQfOVymqe4QTF2Y2hTiEE2WfvSEN0w56zD2D
 S4x5rDtbZmILXnh/0GSo+zKMQVcYXmjdouoaw+2Ki/hWj5YnlgOULtS4octIPmy/kZvo
 Oaqw==
X-Gm-Message-State: AOAM53019P3QiK4rzrAK6B5M14dxKwS7TIrNo87oboHNZG3pFQk/UcVq
 C5S57CcIiuNvoFQMYKiTM9k=
X-Google-Smtp-Source: ABdhPJxMs/gCZgP754nd0TdIGrbNuQQ+VnPVejCRLYJ3xskqjAMOrIDdIzUXGUj4cBIZThgEV1rWJQ==
X-Received: by 2002:a05:620a:a1d:: with SMTP id
 i29mr1185377qka.76.1599024085579; 
 Tue, 01 Sep 2020 22:21:25 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id e23sm3697017qkl.67.2020.09.01.22.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 22:21:24 -0700 (PDT)
Date: Tue, 1 Sep 2020 22:21:23 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 0/2] link vdso with linker
Message-ID: <20200902052123.GA2687902@ubuntu-n2-xlarge-x86>
References: <20200901222523.1941988-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901222523.1941988-1-ndesaulniers@google.com>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Joe Lawrence <joe.lawrence@redhat.com>, Kees Cook <keescook@chromium.org>,
 Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 01, 2020 at 03:25:21PM -0700, Nick Desaulniers wrote:
> Kees Cook is working on series that adds --orphan-section=warn to arm,
> arm64, and x86.  I noticed that ppc vdso were still using cc-ldoption
> for these which I removed.  It seems this results in that flag being
> silently dropped.
> 
> I'm very confident with the first patch, but the second needs closer
> review around the error mentioned below the fold related to the .got
> section.
> 
> Nick Desaulniers (2):
>   powerpc/vdso64: link vdso64 with linker
>   powerpc/vdso32: link vdso64 with linker
> 
>  arch/powerpc/include/asm/vdso.h         | 17 ++---------------
>  arch/powerpc/kernel/vdso32/Makefile     |  7 +++++--
>  arch/powerpc/kernel/vdso32/vdso32.lds.S |  3 ++-
>  arch/powerpc/kernel/vdso64/Makefile     |  8 ++++++--
>  arch/powerpc/kernel/vdso64/vdso64.lds.S |  1 -
>  5 files changed, 15 insertions(+), 21 deletions(-)
> 
> -- 
> 2.28.0.402.g5ffc5be6b7-goog
> 

ppc44x_defconfig and powernv_defconfig start failing with this series
when LD=ld.lld is used.


$ make -skj"$(nproc)" ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- LLVM=1 O=out/ppc32 distclean ppc44x_defconfig uImage
ld.lld: error: relocation R_PPC_REL16_LO cannot be used against symbol __kernel_datapage_offset; recompile with -fPIC
>>> defined in arch/powerpc/kernel/vdso32/datapage.o
>>> referenced by arch/powerpc/kernel/vdso32/gettimeofday.o:(__kernel_gettimeofday)

ld.lld: error: relocation R_PPC_REL16_LO cannot be used against symbol __kernel_datapage_offset; recompile with -fPIC
>>> defined in arch/powerpc/kernel/vdso32/datapage.o
>>> referenced by arch/powerpc/kernel/vdso32/gettimeofday.o:(__kernel_clock_gettime)

ld.lld: error: relocation R_PPC_REL16_LO cannot be used against symbol __kernel_datapage_offset; recompile with -fPIC
>>> defined in arch/powerpc/kernel/vdso32/datapage.o
>>> referenced by arch/powerpc/kernel/vdso32/gettimeofday.o:(__kernel_clock_getres)

ld.lld: error: relocation R_PPC_REL16_LO cannot be used against symbol __kernel_datapage_offset; recompile with -fPIC
>>> defined in arch/powerpc/kernel/vdso32/datapage.o
>>> referenced by arch/powerpc/kernel/vdso32/gettimeofday.o:(__kernel_time)
...


$ make -skj"$(nproc)" ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- LLVM=1 O=out/ppc64le distclean powernv_defconfig zImage.epapr
ld.lld: error: relocation R_PPC64_REL16_LO cannot be used against symbol __kernel_datapage_offset; recompile with -fPIC
>>> defined in arch/powerpc/kernel/vdso64/datapage.o
>>> referenced by arch/powerpc/kernel/vdso64/gettimeofday.o:(__kernel_gettimeofday)

ld.lld: error: relocation R_PPC64_REL16_LO cannot be used against symbol __kernel_datapage_offset; recompile with -fPIC
>>> defined in arch/powerpc/kernel/vdso64/datapage.o
>>> referenced by arch/powerpc/kernel/vdso64/gettimeofday.o:(__kernel_clock_gettime)

ld.lld: error: relocation R_PPC64_REL16_LO cannot be used against symbol __kernel_datapage_offset; recompile with -fPIC
>>> defined in arch/powerpc/kernel/vdso64/datapage.o
>>> referenced by arch/powerpc/kernel/vdso64/gettimeofday.o:(__kernel_clock_getres)

ld.lld: error: relocation R_PPC64_REL16_LO cannot be used against symbol __kernel_datapage_offset; recompile with -fPIC
>>> defined in arch/powerpc/kernel/vdso64/datapage.o
>>> referenced by arch/powerpc/kernel/vdso64/gettimeofday.o:(__kernel_time)

ld.lld: error: relocation R_PPC64_REL16_LO cannot be used against symbol __kernel_datapage_offset; recompile with -fPIC
>>> defined in arch/powerpc/kernel/vdso64/datapage.o
>>> referenced by arch/powerpc/kernel/vdso64/cacheflush.o:(__kernel_sync_dicache)
...


We need Fangrui's patch to fix ppc44x_defconfig:

https://lore.kernel.org/lkml/20200205005054.k72fuikf6rwrgfe4@google.com/

That exact same fix is needed in arch/powerpc/kernel/vdso64/datapage.S
to fix powernv_defconfig.

Cheers,
Nathan
