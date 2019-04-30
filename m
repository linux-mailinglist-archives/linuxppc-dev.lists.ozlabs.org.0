Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40C100CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 22:28:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ttQm0jN1zDqMM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 06:28:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="COv+Fw3q"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ttMP3k7TzDq8F
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 06:25:52 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id j26so7370581pgl.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PumMms/fmvRZNGgk1wpaT/iecwtP2mfoCrsOEiXiMBw=;
 b=COv+Fw3qYpQJGBIu/FlHN4GwAnWb+mBOMG3BzMpMWRcjr0uvOtAeIxDScZFZT+bw7k
 nvDtQ1BYuJQ9P1OVIjzsX8vbEFl6U9x1i62pua//qQiKBVPaM0GruaoDc01Sgq5ZCvEO
 zAeBrm73peFGCc4ffFShl5jVh79XwrcrTrS/600nprTYXF/O60fZtpjAMDo+sfyXoiAh
 U0j6I2sp7hCnCLsoE8QzLLeGghv6zAIxRTrar+5bEildulXLpmV+svPWfe+WSqap9x+2
 o0gDraqO7iUecqRNdiF7D2r0Y5GD7l6giiH+OWVuccUhC9mCOSPv3XgOrD7uurIhnkQF
 JbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PumMms/fmvRZNGgk1wpaT/iecwtP2mfoCrsOEiXiMBw=;
 b=I1K1XGfPU203OEuNaWxZMqteMXW8cjbYUQuWJTd8RIN4wpImrD52TF2BKzo3Ocm1iZ
 zDr6aa4ZYsu0KLoDbnyitP1iQ27iiS13u3jqjLGrc554qJdoB6BrZTL6Np7+lDfU0wAD
 T9gbkr5ZjlioGGHQ1A1HXASlS0SdWE8ow1NDsAglJzimZW55jsLFV4as6NLMT40UNnFZ
 ad+49UPVWMkLwsrijsUoa6z0Hss1CQx1GYv3yWLJqsVVSlqmQhY9VcqFexsk9s4wS1ar
 cqFbx53pQbQZ5wlGpaF3QtE/B4vdvZvzJEpwLkTgFB6KXFQe4sY6uYmjsFd1r82ABfSQ
 fzNQ==
X-Gm-Message-State: APjAAAUvCA5CdaBk9Q0hQZZ3CNqccEZMUQx3RmqBtiN5fQcj5A0tlvNM
 z04VMMbWE43zIU8TYVvbtg+jX2YxeDK4vIAGPhmi1g==
X-Google-Smtp-Source: APXvYqxPruPo3q2EEOLkAgwqeO24bHPYSbHgRM4IkVR8xVhZ8jhDuWMYQDccRT/raKHKAmEfAQt5wvtxASCfnyBCnjc=
X-Received: by 2002:a63:f817:: with SMTP id n23mr27483996pgh.302.1556655950636; 
 Tue, 30 Apr 2019 13:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190423211116.261111-1-ndesaulniers@google.com>
In-Reply-To: <20190423211116.261111-1-ndesaulniers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 30 Apr 2019 13:25:39 -0700
Message-ID: <CAKwvOd=dBLXQUzv8R3-JqF=pUTH0-5O3v+_ceekT3W23VxtDbg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: vdso: drop unnecessary cc-ldoption
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 23, 2019 at 2:11 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Towards the goal of removing cc-ldoption, it seems that --hash-style=
> was added to binutils 2.17.50.0.2 in 2006. The minimal required version
> of binutils for the kernel according to
> Documentation/process/changes.rst is 2.20.
>
> Link: https://gcc.gnu.org/ml/gcc/2007-01/msg01141.html
> Cc: clang-built-linux@googlegroups.com
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/powerpc/kernel/vdso32/Makefile | 5 ++---
>  arch/powerpc/kernel/vdso64/Makefile | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
> index ce199f6e4256..06f54d947057 100644
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -26,9 +26,8 @@ GCOV_PROFILE := n
>  KCOV_INSTRUMENT := n
>  UBSAN_SANITIZE := n
>
> -ccflags-y := -shared -fno-common -fno-builtin
> -ccflags-y += -nostdlib -Wl,-soname=linux-vdso32.so.1 \
> -               $(call cc-ldoption, -Wl$(comma)--hash-style=both)
> +ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
> +       -Wl,-soname=linux-vdso32.so.1 -Wl,--hash-style=both
>  asflags-y := -D__VDSO32__ -s
>
>  obj-y += vdso32_wrapper.o
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> index 28e7d112aa2f..32ebb3522ea1 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -12,9 +12,8 @@ GCOV_PROFILE := n
>  KCOV_INSTRUMENT := n
>  UBSAN_SANITIZE := n
>
> -ccflags-y := -shared -fno-common -fno-builtin
> -ccflags-y += -nostdlib -Wl,-soname=linux-vdso64.so.1 \
> -               $(call cc-ldoption, -Wl$(comma)--hash-style=both)
> +ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
> +       -Wl,-soname=linux-vdso64.so.1 -Wl,--hash-style=both
>  asflags-y := -D__VDSO64__ -s
>
>  obj-y += vdso64_wrapper.o
> --
> 2.21.0.593.g511ec345e18-goog
>

bumping for review
-- 
Thanks,
~Nick Desaulniers
