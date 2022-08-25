Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A55A1112
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 14:51:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD2sJ1pcdz3c6f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 22:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fg9Qio/M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fg9Qio/M;
	dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD18b4337z2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 21:34:38 +1000 (AEST)
Received: by mail-qv1-xf31.google.com with SMTP id q8so15078079qvr.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 04:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=dqjoE029ZvFL7U2E4uqFs8h8zgLuCK5PNlmRfywX58k=;
        b=fg9Qio/ML3BXQTKdTI8VUXfiLtt55uwkZmKPwtm11zO3xnzhg0a8UrtL8pJXi70uvH
         a9154pTbCFtNAOIeACcVytIRJpR0UbkFmlFbotbE3gvI0a8Gv11xPnJsZJRvrAHOdvg1
         R47VY9xc1swlmOesnRo44Ux+jyBfbvInbqoOzAYx3xKKxibGeEKwcgemqaVXfeq3mmWl
         J9MyIB8hU1b6tKKqUBqNOLtOWqgcFFpln1R2H9VUXqMlwnB/lAHr6fUaBF4nYql/KFlH
         2qav11hKWlwH+s2kVRhFQBKsWi6ZUYRDTAEfbp4BIwHVeC7C21fv9fcOuUCSmAu/3wOv
         eu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=dqjoE029ZvFL7U2E4uqFs8h8zgLuCK5PNlmRfywX58k=;
        b=dEG6gIGdwSRbdHS4q3T1PH3KcoARvPhiulDdlnzrdY43ocdVKp2Txgis8WVpsUhuvG
         OZqfKHweshiadoWmcrZhxRGr77gkyAHuOhE1ywuIINSFoKeHRLunyw1zKsUsXt4kwI7x
         RwVNrsS15IziD18Px7ZK1xSnhhLqeHzJ+v+xxF4tl9apXbs7bLH5VrqQQciKj0tuVmbc
         ScGSqtOtClJw8CPGOlga18l76xLNyb2HIR3o0OlE3L1Bm5qHQgA3FvBSERm9iAIH06ax
         CuTYuV+SX3NTWjJD+znjfpo6kiIDyfguFEcu4FthJTjiwlQ89HX9qb9R8if89dnkjK1d
         W9+A==
X-Gm-Message-State: ACgBeo3vlmAdGrHVTHmgna5TWLzJ3xnIY8yM5dq3V9EApkRkgto9KkJS
	haWKZQf74nfhVU4b5Jte5uEN+xzvhv0b2G8vUgY=
X-Google-Smtp-Source: AA6agR6/MRpSGWUTrYfzP1RnQ5Sqo0olutO6cmdBph6qdwoVLqO1RmUTIsI4ZaJOXo/6Qq8WfGjZkaSE7Qab2ghr2rc=
X-Received: by 2002:a0c:da87:0:b0:496:cc8f:c072 with SMTP id
 z7-20020a0cda87000000b00496cc8fc072mr3065884qvj.31.1661427273349; Thu, 25 Aug
 2022 04:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220624141412.72274-1-ubizjak@gmail.com> <1661422971.cqtahfm22j.naveen@linux.ibm.com>
In-Reply-To: <1661422971.cqtahfm22j.naveen@linux.ibm.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 25 Aug 2022 13:34:22 +0200
Message-ID: <CAFULd4Zh3Hw+hy-8YFxSNgmPpk4ahM=8ycRgF_fwqJ6AoaTcug@mail.gmail.com>
Subject: Re: [PATCH] compiler-gcc.h: Remove ancient workaround for gcc PR 58670
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 25 Aug 2022 22:51:01 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org, sv@linux.ibm.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 25, 2022 at 12:30 PM Naveen N. Rao
<naveen.n.rao@linux.ibm.com> wrote:
>
> Uros Bizjak wrote:
> > The workaround for 'asm goto' miscompilation introduces a compiler
> > barrier quirk that inhibits many useful compiler optimizations. For
> > example, __try_cmpxchg_user compiles to:
> >
> >    11375:     41 8b 4d 00             mov    0x0(%r13),%ecx
> >    11379:     41 8b 02                mov    (%r10),%eax
> >    1137c:     f0 0f b1 0a             lock cmpxchg %ecx,(%rdx)
> >    11380:     0f 94 c2                sete   %dl
> >    11383:     84 d2                   test   %dl,%dl
> >    11385:     75 c4                   jne    1134b <...>
> >    11387:     41 89 02                mov    %eax,(%r10)
> >
> > where the barrier inhibits flags propagation from asm when
> > compiled with gcc-12.
> >
> > When the mentioned quirk is removed, the following code is generated:
> >
> >    11553:     41 8b 4d 00             mov    0x0(%r13),%ecx
> >    11557:     41 8b 02                mov    (%r10),%eax
> >    1155a:     f0 0f b1 0a             lock cmpxchg %ecx,(%rdx)
> >    1155e:     74 c9                   je     11529 <...>
> >    11560:     41 89 02                mov    %eax,(%r10)
> >
> > The refered compiler bug:
> >
> > http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
> >
> > was fixed for gcc-4.8.2.
> >
> > Current minimum required version of GCC is version 5.1 which has
> > the above 'asm goto' miscompilation fixed, so remove the workaround.
> >
> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > ---
> >  include/linux/compiler-gcc.h | 11 -----------
> >  1 file changed, 11 deletions(-)
> >
> > diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> > index a0c55eeaeaf1..9b157b71036f 100644
> > --- a/include/linux/compiler-gcc.h
> > +++ b/include/linux/compiler-gcc.h
> > @@ -66,17 +66,6 @@
> >               __builtin_unreachable();        \
> >       } while (0)
> >
> > -/*
> > - * GCC 'asm goto' miscompiles certain code sequences:
> > - *
> > - *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
> > - *
> > - * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
> > - *
> > - * (asm goto is automatically volatile - the naming reflects this.)
> > - */
> > -#define asm_volatile_goto(x...)      do { asm goto(x); asm (""); } while (0)
> > -
> >  #if defined(CONFIG_ARCH_USE_BUILTIN_BSWAP)
> >  #define __HAVE_BUILTIN_BSWAP32__
> >  #define __HAVE_BUILTIN_BSWAP64__
>
> This is causing a build issue on ppc64le with a new patch replacing use
> of unreachable() with __builtin_unreachable() in __WARN_FLAGS():
> https://lore.kernel.org/linuxppc-dev/20220808114908.240813-2-sv@linux.ibm.com/
>
> during RTL pass: combine
> In file included from /linux/kernel/locking/rtmutex_api.c:9:
> /linux/kernel/locking/rtmutex.c: In function '__rt_mutex_slowlock.constprop':
> /linux/kernel/locking/rtmutex.c:1612:1: internal compiler error: in purge_dead_edges, at cfgrtl.c:3369
>  1612 | }
>       | ^
> 0x142817c internal_error(char const*, ...)
>         ???:0
> 0x5c8a1b fancy_abort(char const*, int, char const*)
>         ???:0
> 0x72017f purge_all_dead_edges()
>         ???:0
> Please submit a full bug report,
> with preprocessed source if appropriate.
> Please include the complete backtrace with any bug report.
> See <file:///usr/share/doc/gcc-11/README.Bugs> for instructions.
>
>
> So, it looks like gcc still has issues with certain uses of asm goto.

This looks like a powerpc specific bug, and has nothing to do with
PR58560 (asm goto miscompilation). If this is indeed a target specific
bug, it should be worked around in
arch/powerpc/include/asm/compiler.h, but please also report it to the
GCC bugzilla.

Uros.
