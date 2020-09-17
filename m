Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3593326DD23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 15:50:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsddN4JJZzDqDW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 23:50:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=tony.ambardar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FoBoQ2eW; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsdSk4dLLzDqgk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 23:42:46 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id b6so2207398iof.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ji5GyYOvkMw4A9qgT2Zx0fOgOYQE3g778wmyg/8KNsE=;
 b=FoBoQ2eWWaQlmHLUSQrSGBJQvfqmTrE91MLBNHkkSttrMmFMW751RMcyckIjdgvXH9
 T7UloJt3DDXAuNWbVsqOOatZ/HvC9EPzk+8zITnxgNr6ZOOp/7u3GaUkbNFGVMz5qekr
 Rffu08s2K1M40aGA+o9jsE71v0AuEb+h/gMlvYGmbCl0/rZLt1M7P/+97MpKwi0eRo9Q
 //nbsXLu8KrnT0OzESfrNKhBEbRpQhEYIirF7h6bXFrAsFwsryFLYEEhVrk9OEXqD9vG
 U2wZ+boWaqwX0LfsIAkWzddk7B8uT5+Jo6tqoKHSQYGXmPJSto2HO5MkUCXz6Z2wzFSm
 oVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ji5GyYOvkMw4A9qgT2Zx0fOgOYQE3g778wmyg/8KNsE=;
 b=iakC1TclAyLQ9whqJ3jnps+/FxtngPZZKi0SOvWqG93ZG87b7krRd8WEGwGUfLlNh5
 LL8C8znKemNghOYDFbrDPT/U4H8+4Yybv8Ukl3VtmL9ioL3nIcimAtWOGHKTi74tIl+z
 jhp1+ueqexx/0VVn8vYziNcPXGo0yeCkCbuRjkVdnJOvzIyWEVD/2ZNwq1BmZFWFDkMM
 5RrR+pXKHj/4M1VQoEW8VD5fQ4qZYiq1Z1aaqotViIU+nyRHYPdSnD6rORW8iLrRz8m2
 BmrfF36fRTn1AoW2sMzP+xkhJqunIArTrKc/K67sYrD0f9m3oLiBZjzuq4sZMHkpeNeG
 XvQg==
X-Gm-Message-State: AOAM532cTsmsGcXq+wb0M3R99FQ5aAAZG86XcodTGLaaDsO29zqSUcTe
 UuVHks71291OJ9dW0ZLBzWKo4QBACv7hTbkda1c=
X-Google-Smtp-Source: ABdhPJwUgU/1gEY/ot9lktlSpJ9NTKG5x6liAdHqoHrzceWdJd3GeH6DCgxrHl9kcpJQf6UAYXH7TbXuZZcRhwzghbg=
X-Received: by 2002:a05:6638:cdc:: with SMTP id
 e28mr26553830jak.100.1600350161575; 
 Thu, 17 Sep 2020 06:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200916074214.995128-1-Tony.Ambardar@gmail.com>
 <20200917000757.1232850-1-Tony.Ambardar@gmail.com>
 <87363gpqhz.fsf@mpe.ellerman.id.au>
In-Reply-To: <87363gpqhz.fsf@mpe.ellerman.id.au>
From: Tony Ambardar <tony.ambardar@gmail.com>
Date: Thu, 17 Sep 2020 06:42:29 -0700
Message-ID: <CAPGftE-zSi=7mdf9dCGyn5Dio3fpbTuKT+qKQRvDd-1pGgCb5g@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc: fix EDEADLOCK redefinition error in
 uapi/asm/errno.h
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Rosen Penev <rosenp@gmail.com>,
 Paul Mackerras <paulus@samba.org>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Sep 2020 at 04:55, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> [ Cc += linux-arch & Arnd ]
>
> Hi Tony,
>
> This looks OK to me, but I'm always a bit nervous about changes in uapi.
> I've Cc'ed linux-arch and Arnd who look after the asm-generic headers,
> which this is slightly related to, just in case.
>
I agree with the caution and would welcome any other insights.

> One minor comment below.
>
> Tony Ambardar <tony.ambardar@gmail.com> writes:
> > A few archs like powerpc have different errno.h values for macros
> > EDEADLOCK and EDEADLK. In code including both libc and linux versions of
> > errno.h, this can result in multiple definitions of EDEADLOCK in the
> > include chain. Definitions to the same value (e.g. seen with mips) do
> > not raise warnings, but on powerpc there are redefinitions changing the
> > value, which raise warnings and errors (if using "-Werror").
> >
> > Guard against these redefinitions to avoid build errors like the following,
> > first seen cross-compiling libbpf v5.8.9 for powerpc using GCC 8.4.0 with
> > musl 1.1.24:
> >
> >   In file included from ../../arch/powerpc/include/uapi/asm/errno.h:5,
> >                    from ../../include/linux/err.h:8,
> >                    from libbpf.c:29:
> >   ../../include/uapi/asm-generic/errno.h:40: error: "EDEADLOCK" redefined [-Werror]
> >    #define EDEADLOCK EDEADLK
> >
> >   In file included from toolchain-powerpc_8540_gcc-8.4.0_musl/include/errno.h:10,
> >                    from libbpf.c:26:
> >   toolchain-powerpc_8540_gcc-8.4.0_musl/include/bits/errno.h:58: note: this is the location of the previous definition
> >    #define EDEADLOCK       58
> >
> >   cc1: all warnings being treated as errors
> >
> > Fixes: 95f28190aa01 ("tools include arch: Grab a copy of errno.h for arch's supported by perf")
> > Fixes: c3617f72036c ("UAPI: (Scripted) Disintegrate arch/powerpc/include/asm")
>
> I suspect that's not the right commit to tag. It just moved errno.h from
> arch/powerpc/include/asm to arch/powerpc/include/uapi/asm. It's content
> was almost identical, and entirely identical as far as EDEADLOCK was
> concerned.
>
> Prior to that the file lived in asm-powerpc/errno.h, eg:
>
> $ git cat-file -p b8b572e1015f^:include/asm-powerpc/errno.h
>
> Before that it was include/asm-ppc64/errno.h, content still the same.
>
> To go back further we'd have to look at the historical git trees, which
> is probably overkill. I'm pretty sure it's always had this problem.
>
> So we should probably drop the Fixes tags and just Cc: stable, that
> means please backport it as far back as possible.
>
Yes, you're right. Those two commits were simply where I stopped tracing back
the long chain. I'll drop them as you suggest and request a backport instead in
the next version of the patch.

Thanks for your feedback!
> cheers
>
>
> > Reported-by: Rosen Penev <rosenp@gmail.com>
> > Signed-off-by: Tony Ambardar <Tony.Ambardar@gmail.com>
> > ---
> > v1 -> v2:
> >  * clean up commit description formatting
> > ---
> >  arch/powerpc/include/uapi/asm/errno.h       | 1 +
> >  tools/arch/powerpc/include/uapi/asm/errno.h | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/powerpc/include/uapi/asm/errno.h b/arch/powerpc/include/uapi/asm/errno.h
> > index cc79856896a1..4ba87de32be0 100644
> > --- a/arch/powerpc/include/uapi/asm/errno.h
> > +++ b/arch/powerpc/include/uapi/asm/errno.h
> > @@ -2,6 +2,7 @@
> >  #ifndef _ASM_POWERPC_ERRNO_H
> >  #define _ASM_POWERPC_ERRNO_H
> >
> > +#undef       EDEADLOCK
> >  #include <asm-generic/errno.h>
> >
> >  #undef       EDEADLOCK
> > diff --git a/tools/arch/powerpc/include/uapi/asm/errno.h b/tools/arch/powerpc/include/uapi/asm/errno.h
> > index cc79856896a1..4ba87de32be0 100644
> > --- a/tools/arch/powerpc/include/uapi/asm/errno.h
> > +++ b/tools/arch/powerpc/include/uapi/asm/errno.h
> > @@ -2,6 +2,7 @@
> >  #ifndef _ASM_POWERPC_ERRNO_H
> >  #define _ASM_POWERPC_ERRNO_H
> >
> > +#undef       EDEADLOCK
> >  #include <asm-generic/errno.h>
> >
> >  #undef       EDEADLOCK
> > --
> > 2.25.1
