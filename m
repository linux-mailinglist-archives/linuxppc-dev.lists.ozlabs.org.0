Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCB13DA8F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 18:26:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbGBB1WDQz3cXg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 02:26:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=dbq2eZUD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=dbq2eZUD; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbG9j5y4hz2yMG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 02:25:59 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id r17so12127018lfe.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KFarLUaerwhqXhNfSAvou1NQn1eTDfFAb53Mz+JzFuk=;
 b=dbq2eZUDzQoMVDLfTYTAQsBTnxIC0+/Zu4CBPEWH7zTE2H4UKlWeSQpq10NDvc0Hi8
 dupHzCFYoWJOSVdBKKeZG2qXvp1156CQoW32gxj7jEbrnfvUyY2PaHtyx6caCXLonyUx
 hRppqftaBGSgmAPAiHSLu50ChRsxaB+bn/qYBd6wFbxwctJv++Oi/kWuiCnlFKiHtume
 HZz3vjae3zOox+gUtLgiiJqSqDqsl4GUP2zLahwW5z89IFilJPZwMQuoLHj+DS+axQ0z
 XNlwwuB+N+BvhL821eK1TpBHsCyquUQJ1GcLeceB40tuG22xQke2MlNu+c5fA4Myv0sK
 Mrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KFarLUaerwhqXhNfSAvou1NQn1eTDfFAb53Mz+JzFuk=;
 b=p9KwWZRWUBCQ5dSUzQLvnH4AkwpMJKncZRtEIxmuMCwcebJ0gMf/OcTFMK3lnhgeka
 fFAUPdC6lqDEuSVkWQvFkPp37ZK/sOJ5t7U7mBVM5MsTBa7goWijV9PSmmSQfmzcGWSy
 0FtQvEgirzZFMtYEW83VRxuc/kj3VFVLFOXV1aDRykPkHBLsCzKliW5dZhLDuLub9mtS
 5zIe2Hj3obK5H4tmpZzY4hmlQcgJNpElwzNw0AEhxZNebFs5JqF6l0qJuIN/7FB/eHOU
 Wmsn4jaBZmypExdJC/bT1eCcP1TKHTFY1WB3VX1JdWiK0xQPGORq8+Yd0qwe6RHGO81/
 JwFA==
X-Gm-Message-State: AOAM532e2z73rwjE1nnlwo1nsLKOMmD4J9Vny6X6GepxMzaOhftgPemx
 CoDqvDdCl6X2+1+Fxt6ElMjA74EvrlDrclASCAqifg==
X-Google-Smtp-Source: ABdhPJy2YJHQDYkWVwvQxvAAp3j/3pTRwBDTjkdwl4jQhG/ROmw8kf1zMhJyrJkYX3HQbQH17DmNckDZRQQvL77HVXM=
X-Received: by 2002:ac2:59db:: with SMTP id x27mr4307446lfn.547.1627575954486; 
 Thu, 29 Jul 2021 09:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210729131244.2595519-1-mpe@ellerman.id.au>
 <392b3b47-1878-d27a-9656-4596fdc7c343@molgen.mpg.de>
In-Reply-To: <392b3b47-1878-d27a-9656-4596fdc7c343@molgen.mpg.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 29 Jul 2021 09:25:43 -0700
Message-ID: <CAKwvOdmR9nB3T-PLNSGea3=9qbZuOoLs5D22UPRBbvw_+aOO7A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/vdso: Don't use r30 to avoid breaking Go lang
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 clang-built-linux@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 29, 2021 at 6:42 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Michael,
>
>
> Am 29.07.21 um 15:12 schrieb Michael Ellerman:
> > The Go runtime uses r30 for some special value called 'g'. It assumes
> > that value will remain unchanged even when calling VDSO functions.
> > Although r30 is non-volatile across function calls, the callee is free
> > to use it, as long as the callee saves the value and restores it before
> > returning.
> >
> > It used to be true by accident that the VDSO didn't use r30, because the
> > VDSO was hand-written asm. When we switched to building the VDSO from C
> > the compiler started using r30, at least in some builds, leading to
> > crashes in Go. eg:
> >
> >    ~/go/src$ ./all.bash
> >    Building Go cmd/dist using /usr/lib/go-1.16. (go1.16.2 linux/ppc64le)
> >    Building Go toolchain1 using /usr/lib/go-1.16.
> >    go build os/exec: /usr/lib/go-1.16/pkg/tool/linux_ppc64le/compile: signal: segmentation fault
> >    go build reflect: /usr/lib/go-1.16/pkg/tool/linux_ppc64le/compile: signal: segmentation fault
> >    go tool dist: FAILED: /usr/lib/go-1.16/bin/go install -gcflags=-l -tags=math_big_pure_go compiler_bootstrap bootstrap/cmd/...: exit status 1
> >
> > There are patches in flight to fix Go[1], but until they are released
> > and widely deployed we can workaround it in the VDSO by avoiding use of
>
> Nit: work around is spelled with a space.
>
> > r30.
> >
> > Note this only works with GCC, clang does not support -ffixed-rN.
>
> Maybe the clang/LLVM build support folks (in CC) have an idea.

Right, we've had issues with these in the past.  Generally, we need to
teach clang about which registers are valid for `N` so that it can
diagnose invalid values ASAP.  This has to be done on a per arch basis
in LLVM to steal the register from the register allocator.  For
example, this was used previously for aarch64 (but removed from use in
the kernel) and IIRC is used for m68k (which we're working to get
builds online for).

I've filed https://bugs.llvm.org/show_bug.cgi?id=51272. Thanks for the report.

>
> > 1: https://go-review.googlesource.com/c/go/+/328110
> >
> > Fixes: ab037dd87a2f ("powerpc/vdso: Switch VDSO to generic C implementation.")
> > Cc: stable@vger.kernel.org # v5.11+
> > Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > ---
> >   arch/powerpc/kernel/vdso64/Makefile | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> > index 2813e3f98db6..3c5baaa6f1e7 100644
> > --- a/arch/powerpc/kernel/vdso64/Makefile
> > +++ b/arch/powerpc/kernel/vdso64/Makefile
> > @@ -27,6 +27,13 @@ KASAN_SANITIZE := n
> >
> >   ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
> >       -Wl,-soname=linux-vdso64.so.1 -Wl,--hash-style=both
> > +
> > +# Go prior to 1.16.x assumes r30 is not clobbered by any VDSO code. That used to be true
> > +# by accident when the VDSO was hand-written asm code, but may not be now that the VDSO is
> > +# compiler generated. To avoid breaking Go tell GCC not to use r30. Impact on code
> > +# generation is minimal, it will just use r29 instead.
> > +ccflags-y += $(call cc-option, -ffixed-r30)
> > +
> >   asflags-y := -D__VDSO64__ -s
> >
> >   targets += vdso64.lds
> >
>
> The rest looks good.
>
>
> Kind regards,
>
> Paul



-- 
Thanks,
~Nick Desaulniers
