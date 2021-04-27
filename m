Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ACC36CC78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 22:43:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVDHc1KNMz2yxm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 06:43:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=cPoj7vyx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=cPoj7vyx; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVDH85Mjjz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 06:42:58 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id x19so65326106lfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 13:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VuRmkFXiA1v6q9YqeqOSwr2jhpD+5Gg836AGzkZvAKo=;
 b=cPoj7vyx/9IheK/fLh29pvcdN6ASbcRvq0lMP2k+HC2u6nIJWhMgMFMF9UGcW9nlAb
 dJMJ3p3ryvvtHtjLDwUK0HDAJP6QB4XAHUdzq2V0neH5iDnqhGAcSNw7HrX2GzQT7l+C
 Im7Evc025V5jNKSMN8S+RZgoh+ux8CyAFuK1baIcFwI8GG0IeBqwgAwvT3ljDbfgZ1JD
 wl8YI9Ezl9hpadUuYMzaml9s63EKUzztClnqs/gtwv6VfuF2KfedOv9SzOM/NSZKjkdm
 NnDZW12hm9w2+VazRPn4UQT+bgJ6KC0J5+arRYyRnIqcP+K6tJMCOeaZt14SarHgwIo+
 /ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VuRmkFXiA1v6q9YqeqOSwr2jhpD+5Gg836AGzkZvAKo=;
 b=M1HNtWnaQzWgHs7O1aUy26eB2CDGByjk/0lebuB9pSVK7L+Yffb5E3pdignmYsU8/q
 oHyQYvk03zTU8g+dQkhWHOzXQCv4u7aBO0wq6jYdTlmKFAd1CMcAlyLHR/hwY/JdVvvO
 2IWcnjaYAa6IMUhsR5gcqAe3p25z4ac6xsmkanviCaBfSlqkFCO6XDfZJvB9RfUMcFfy
 dY1LLQ07jl5KXzKVbNm+KssfxM+0XGPpsLovrUR9eUeBgXPMw7OEvs2WHJuRmxkUrBrA
 KmmXTKJqKRrljgDboTl88CSfa+NoAfyZwTdoER8SR3lg7BJ2mk03Y/VL0vpMjPs0FVq1
 5vrw==
X-Gm-Message-State: AOAM533Qg0tRogogyILYcE29k4qNys/m7wVtwXQWBYTxYy0/kQkW15yx
 A+ECYz+Rg0yV8iWA9YKcs6tqdxevMl3IICq+/Ajiog==
X-Google-Smtp-Source: ABdhPJwUQjLpJ2zzOsSY9iSXK3O2tv3yoEX3hYxLbmzlW0rsCVDLzJGWKmWoES6FMK3nXpNXaTJRWsO4LVIGWfr0IgA=
X-Received: by 2002:a05:6512:2190:: with SMTP id
 b16mr912912lft.122.1619556168586; 
 Tue, 27 Apr 2021 13:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210320122227.345427-1-mpe@ellerman.id.au>
 <YIcLcujmoK6Yet9d@archlinux-ax161>
 <de6fc09f-97f5-c934-6393-998ec766b48a@csgroup.eu>
In-Reply-To: <de6fc09f-97f5-c934-6393-998ec766b48a@csgroup.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 27 Apr 2021 13:42:36 -0700
Message-ID: <CAKwvOd=SkPtOij0tCx=AzUsLD3RrJZBFs0WZKuQJ3c4JM3Nn6Q@mail.gmail.com>
Subject: Re: [PATCH v7] powerpc/irq: Inline call_do_irq() and call_do_softirq()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 26, 2021 at 11:39 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 26/04/2021 =C3=A0 20:50, Nathan Chancellor a =C3=A9crit :
> > On Sat, Mar 20, 2021 at 11:22:27PM +1100, Michael Ellerman wrote:
> >> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> >>
> >> call_do_irq() and call_do_softirq() are simple enough to be
> >> worth inlining.
> >>
> >> Inlining them avoids an mflr/mtlr pair plus a save/reload on stack. It
> >> also allows GCC to keep the saved ksp_limit in an nonvolatile reg.
> >>
> >> This is inspired from S390 arch. Several other arches do more or
> >> less the same. The way sparc arch does seems odd thought.
> >>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> >>
> >
> > This change caused our ppc44x_defconfig builds to hang when powering
> > down in QEMU:
> >
> > https://github.com/ClangBuiltLinux/continuous-integration2/runs/2304364=
629?check_suite_focus=3Dtrue#logs
> >
> > This is probably something with clang given that GCC 10.3.0 works fine
> > but due to the nature of the change, I have no idea how to tell what is
> > going wrong. I tried to do some rudimentary debugging with gdb but that
> > did not really get me anywhere.
> >
> > The kernel was built with just 'CC=3Dclang' and it is reproducible with
> > all versions of clang that the kernel supports.
> >
> > The QEMU invocation is visible at the link above, it is done with our
> > boot-qemu.sh in this repo, which also houses the rootfs:
> >
> > https://github.com/ClangBuiltLinux/boot-utils
> >
> > Happy to provide any other information or debug/test as directed!
> >
>
> With GCC:
>
> 000003f0 <do_softirq_own_stack>:
>   3f0:  94 21 ff f0     stwu    r1,-16(r1)
>   3f4:  7c 08 02 a6     mflr    r0
>   3f8:  3d 20 00 00     lis     r9,0
>                         3fa: R_PPC_ADDR16_HA    .data..read_mostly+0x4
>   3fc:  93 e1 00 0c     stw     r31,12(r1)
>   400:  90 01 00 14     stw     r0,20(r1)
>   404:  83 e9 00 00     lwz     r31,0(r9)
>                         406: R_PPC_ADDR16_LO    .data..read_mostly+0x4
>   408:  94 3f 1f f0     stwu    r1,8176(r31)
>   40c:  7f e1 fb 78     mr      r1,r31
>   410:  48 00 00 01     bl      410 <do_softirq_own_stack+0x20>
>                         410: R_PPC_REL24        __do_softirq
>   414:  80 21 00 00     lwz     r1,0(r1)
>   418:  80 01 00 14     lwz     r0,20(r1)
>   41c:  83 e1 00 0c     lwz     r31,12(r1)
>   420:  38 21 00 10     addi    r1,r1,16
>   424:  7c 08 03 a6     mtlr    r0
>   428:  4e 80 00 20     blr
>
>
> With CLANG:
>
> 000003e8 <do_softirq_own_stack>:
>   3e8:  94 21 ff f0     stwu    r1,-16(r1)
>   3ec:  93 c1 00 08     stw     r30,8(r1)
>   3f0:  3c 60 00 00     lis     r3,0
>                         3f2: R_PPC_ADDR16_HA    softirq_ctx
>   3f4:  83 c3 00 00     lwz     r30,0(r3)
>                         3f6: R_PPC_ADDR16_LO    softirq_ctx
>   3f8:  94 3e 1f f0     stwu    r1,8176(r30)
>   3fc:  7f c1 f3 78     mr      r1,r30
>   400:  48 00 00 01     bl      400 <do_softirq_own_stack+0x18>
>                         400: R_PPC_REL24        __do_softirq
>   404:  80 21 00 00     lwz     r1,0(r1)
>   408:  83 c1 00 08     lwz     r30,8(r1)
>   40c:  38 21 00 10     addi    r1,r1,16
>   410:  4e 80 00 20     blr
>
>
> As you can see, CLANG doesn't save/restore 'lr' allthought 'lr' is explic=
itely listed in the
> registers clobbered by the inline assembly:

Ah, thanks for debugging this. Will follow up in
https://bugs.llvm.org/show_bug.cgi?id=3D50147.

>
>  >> +static __always_inline void call_do_softirq(const void *sp)
>  >> +{
>  >> +   /* Temporarily switch r1 to sp, call __do_softirq() then restore =
r1. */
>  >> +   asm volatile (
>  >> +            PPC_STLU "     %%r1, %[offset](%[sp])  ;"
>  >> +           "mr             %%r1, %[sp]             ;"
>  >> +           "bl             %[callee]               ;"
>  >> +            PPC_LL "       %%r1, 0(%%r1)           ;"
>  >> +            : // Outputs
>  >> +            : // Inputs
>  >> +              [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME=
_OVERHEAD),
>  >> +              [callee] "i" (__do_softirq)
>  >> +            : // Clobbers
>  >> +              "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr=
6",
>  >> +              "cr7", "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9",=
 "r10",
>  >> +              "r11", "r12"
>  >> +   );
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/de6fc09f-97f5-c934-6393-998ec766b48a%40csgroup.eu.



--=20
Thanks,
~Nick Desaulniers
