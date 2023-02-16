Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEE9698E65
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 09:13:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHSPh1sGJz3fH5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 19:13:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GNTFnvYh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GNTFnvYh;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHSKS6fk0z3f2p
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 19:09:48 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso3505480wmp.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 00:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LPmlvzBmYvvcjdUPaFapX0ujkjEhw9P6vRzvD3nGlUc=;
        b=GNTFnvYhKtC+4LxzEG6sv+mgDRVvTgkLnVLi1ludBI2bx1TaM1llYUhooTJGIrArQv
         qa/4RVK5MjwCPcvP/JlUDGA+9dcFpfLGpmDctXOdaTewkC8s+QOcju8+sAeO3+atNmmG
         hkEwZUnzP9S/WHTOUEaDU/iMy31kGxwHc2fyx/ygxlBnypQPoslrwEZxTRuHHbkJ9El2
         rf8DRFj4n+4MlIULUD4hvfetXDNnOeEJsH7cRAIGib283sWHxCB73rOG8ZhXUzMmNwvF
         tp1TEC4J4cCruwUghx4xK6hO1zrUgB3g4o0o+RAZLdHBhl0YwWHu9WI7aHhS6ftlnW3/
         hTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPmlvzBmYvvcjdUPaFapX0ujkjEhw9P6vRzvD3nGlUc=;
        b=vz2vC0FeQFv2dOuISPhVg7sZ1uo2QMx/kNU3VKQFFbSGlyM/ZBaiPaUwh1fTIlcDE9
         sKwroMGnjeei4OQm4B5cc6YicIIB+ZXXM9lUj4janN90O9PGLMD23rsr7+0fxVqAccYB
         vbZOtmOka93mywS+Hzq9FadsLSE1sGc5OtgjAqKa7vATqals4XyvkuHJUWcW30ULwy+U
         EWld+9mngeeHsPIE68j/yzrNZjdEJ9yX94MbAUeGdB9tBzaqLnfS3wHBIqQBcqaNsP6+
         qjNUAoGEA0mP67mWkHbMjlPnlIV9owh++In0evxY/uyIf8+Et7qyVKoWHS7srhelTV9A
         Vuig==
X-Gm-Message-State: AO0yUKWEIM9xQu4Sap3R3qLiXFOUz9Rio9xwGFVgOHZDPXvFDibtvsYO
	SRasgpU90KJbqf7to0xT1H9jLUSQijhdeFGsBPU=
X-Google-Smtp-Source: AK7set9gz92ahBhq5dqilq36AANyaMev+vTovmmFOrzmDduDvQaAZGFJ/83icN5W8D4gxSkyjCRpfQ==
X-Received: by 2002:a05:600c:80a:b0:3db:2e06:4091 with SMTP id k10-20020a05600c080a00b003db2e064091mr4865174wmp.37.1676534985292;
        Thu, 16 Feb 2023 00:09:45 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:9c:201:f376:75c5:59e9:fb1c])
        by smtp.gmail.com with ESMTPSA id he8-20020a05600c540800b003e208cec49bsm2503310wmb.3.2023.02.16.00.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 00:09:44 -0800 (PST)
Date: Thu, 16 Feb 2023 09:09:38 +0100
From: Marco Elver <elver@google.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] kcsan: xtensa: Add atomic builtin stubs for 32-bit
 systems
Message-ID: <Y+3kwmFhWilN2OaE@elver.google.com>
References: <20230216050938.2188488-1-rmclure@linux.ibm.com>
 <42e62369-8dd0-cbfc-855d-7ad18e518cee@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42e62369-8dd0-cbfc-855d-7ad18e518cee@csgroup.eu>
User-Agent: Mutt/2.2.9 (2022-11-12)
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
Cc: kasan-dev <kasan-dev@googlegroups.com>, Max Filippov <jcmvbkbc@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 16, 2023 at 07:12AM +0000, Christophe Leroy wrote:
> 
> 
> Le 16/02/2023 à 06:09, Rohan McLure a écrit :
> > KCSAN instruments calls to atomic builtins, and will in turn call these
> > builtins itself. As such, architectures supporting KCSAN must have
> > compiler support for these atomic primitives.
> > 
> > Since 32-bit systems are unlikely to have 64-bit compiler builtins,
> > provide a stub for each missing builtin, and use BUG() to assert
> > unreachability.
> > 
> > In commit 725aea873261 ("xtensa: enable KCSAN"), xtensa implements these
> > locally. Move these definitions to be accessible to all 32-bit
> > architectures that do not provide the necessary builtins, with opt in
> > for PowerPC and xtensa.
> > 
> > Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> > Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
> 
> This series should also be addressed to KCSAN Maintainers, shouldn't it ?
> 
> KCSAN
> M:	Marco Elver <elver@google.com>
> R:	Dmitry Vyukov <dvyukov@google.com>
> L:	kasan-dev@googlegroups.com
> S:	Maintained
> F:	Documentation/dev-tools/kcsan.rst
> F:	include/linux/kcsan*.h
> F:	kernel/kcsan/
> F:	lib/Kconfig.kcsan
> F:	scripts/Makefile.kcsan
> 
> 
> > ---
> > Previously issued as a part of a patch series adding KCSAN support to
> > 64-bit.
> > Link: https://lore.kernel.org/linuxppc-dev/167646486000.1421441.10070059569986228558.b4-ty@ellerman.id.au/T/#t
> > v1: Remove __has_builtin check, as gcc is not obligated to inline
> > builtins detected using this check, but instead is permitted to supply
> > them in libatomic:
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108734
> > Instead, opt-in PPC32 and xtensa.
> > ---
> >   arch/xtensa/lib/Makefile                              | 1 -
> >   kernel/kcsan/Makefile                                 | 2 ++
> >   arch/xtensa/lib/kcsan-stubs.c => kernel/kcsan/stubs.c | 0
> >   3 files changed, 2 insertions(+), 1 deletion(-)
> >   rename arch/xtensa/lib/kcsan-stubs.c => kernel/kcsan/stubs.c (100%)
> > 
> > diff --git a/arch/xtensa/lib/Makefile b/arch/xtensa/lib/Makefile
> > index 7ecef0519a27..d69356dc97df 100644
> > --- a/arch/xtensa/lib/Makefile
> > +++ b/arch/xtensa/lib/Makefile
> > @@ -8,5 +8,4 @@ lib-y	+= memcopy.o memset.o checksum.o \
> >   	   divsi3.o udivsi3.o modsi3.o umodsi3.o mulsi3.o umulsidi3.o \
> >   	   usercopy.o strncpy_user.o strnlen_user.o
> >   lib-$(CONFIG_PCI) += pci-auto.o
> > -lib-$(CONFIG_KCSAN) += kcsan-stubs.o
> >   KCSAN_SANITIZE_kcsan-stubs.o := n
> > diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
> > index 8cf70f068d92..86dd713d8855 100644
> > --- a/kernel/kcsan/Makefile
> > +++ b/kernel/kcsan/Makefile
> > @@ -12,6 +12,8 @@ CFLAGS_core.o := $(call cc-option,-fno-conserve-stack) \
> >   	-fno-stack-protector -DDISABLE_BRANCH_PROFILING
> >   
> >   obj-y := core.o debugfs.o report.o
> > +obj-$(CONFIG_PPC32) += stubs.o
> > +obj-$(CONFIG_XTENSA) += stubs.o
> 
> Not sure it is acceptable to do it that way.
> 
> There should likely be something like a CONFIG_ARCH_WANTS_KCSAN_STUBS in 
> KCSAN's Kconfig then PPC32 and XTENSA should select it.

The longer I think about it, since these stubs all BUG() anyway, perhaps
we ought to just avoid them altogether. If you delete all the stubs from
ppc and xtensa, but do this:

 | diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
 | index 54d077e1a2dc..8169d6dadd0e 100644
 | --- a/kernel/kcsan/core.c
 | +++ b/kernel/kcsan/core.c
 | @@ -1261,7 +1261,9 @@ static __always_inline void kcsan_atomic_builtin_memorder(int memorder)
 |  DEFINE_TSAN_ATOMIC_OPS(8);
 |  DEFINE_TSAN_ATOMIC_OPS(16);
 |  DEFINE_TSAN_ATOMIC_OPS(32);
 | +#ifdef CONFIG_64BIT
 |  DEFINE_TSAN_ATOMIC_OPS(64);
 | +#endif
 |  
 |  void __tsan_atomic_thread_fence(int memorder);
 |  void __tsan_atomic_thread_fence(int memorder)

Does that work?
