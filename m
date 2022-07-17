Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1972577832
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 22:26:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmGpS58Ltz3cBS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 06:26:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JVPZrBIW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=sudipm.mukherjee@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JVPZrBIW;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmGnl59k0z3052
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 06:26:01 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id f73so17675212yba.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 13:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WQJt1app/1+BamRnBVCCSfWXec050wLumfUNaLBnpKk=;
        b=JVPZrBIWXwyVza1YQ8QkiNAfIvcukmRwqMGFXojnG0BcXqzkervd//1ZTSrsyyNvt1
         EBcTmwMj1tnyAZSORZuQz9plll+SUJR2tEK7PxpxhMfETLD/wd6KbVgS6Uh3dGKTx2rH
         9vpYT2VeflRtXyAGNrlt1NUbSnNcoFpvMOnNZdGpJ+PnjP9AIBZVjKIMJboBFgO50OtX
         bYe6O4VG2xs90ySn79Xr/bJhWNd7moGr07CqEsy8XS/+4iTTbWxizNmHdch6HFOrV3Yb
         JULodIET9iTjZ+jUymOqH+1+6Klo+V6Cwz1Iqd7NIsSi3+dIUba50CBY0eMo07VYKNSS
         c5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WQJt1app/1+BamRnBVCCSfWXec050wLumfUNaLBnpKk=;
        b=sTRMJfz7T1TRxYhoref5XeDJQKb6FDMFGL95QJlKe6d9nS5KLqAkXH9C59L9N/2CwF
         Gw1RmETBQByirSMhzzGp4+p6PbvUJfS9I+OslRhAfsUipUyzQL8ptH7CAx0foyblNjZE
         YRup2yw5dos7pa+i/HdtTLf3RRKNV79rBPOGGx1IKZ9711RHZ5Qn6XoSCcdoBogsr9zY
         xJ+wsKsO7Lux1OTvKQsYsx74DtoE1PeVrBIQyhbn1bUij6l1WLeFi2BLdHzG38owkqug
         tW9Tea5M/PfSqPBhcyipnbwG+mrKxnTgzLQGIZq/fiRyqRr+rdG1GjmrKSrcAItZ91wZ
         mNgA==
X-Gm-Message-State: AJIora/xkvThrQgv960ZolbcYBkAJq7hwd5IgmhUrfe9jrSaJDXxaJ2v
	N0LZTdrEVEshiEj9aSYaKp8f+BiL2FKvUliw9Vs=
X-Google-Smtp-Source: AGRyM1uUaFp4jr9Q7LCoBIhWkwizwk+v22P6cWnEUs23PHHmkHZVztizIgKt9DyWUHUnc1D79SgpJ1/yhCHxHRLym/w=
X-Received: by 2002:a25:b0a8:0:b0:66f:eb53:76ca with SMTP id
 f40-20020a25b0a8000000b0066feb5376camr14168595ybj.617.1658089557008; Sun, 17
 Jul 2022 13:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
 <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com>
In-Reply-To: <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 17 Jul 2022 21:25:20 +0100
Message-ID: <CADVatmO1V8DiAgWMW9EFHwt+ghwfHhueigXh214tUa_=tVxiug@mail.gmail.com>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 17, 2022 at 3:44 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, Jul 17, 2022 at 2:13 AM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > I was trying to check it. With gcc-11 the assembly code generated is
> > not using memset, but using __memset.
> > But with gcc-12, I can see the assembly code is using memset. One
> > example from the assembly:
>
> You could try making the 'args' array in 'struct prom_args' be marked
> 'volatile'.
>
> Ie something like this:
>
>   --- a/arch/powerpc/kernel/prom_init.c
>   +++ b/arch/powerpc/kernel/prom_init.c
>   @@ -115,6 +115,6 @@ struct prom_args {
>            __be32 service;
>            __be32 nargs;
>            __be32 nret;
>   -          __be32 args[10];
>   +        volatile __be32 args[10];
>    };
>
> because I think it's just the compilers turning the small loop over
> those fields into a "memset()".

That didn't work.
"Error: External symbol 'memset' referenced from prom_init.c" is still
there with this change.
And the generated assembly still has the memset for "struct prom_args".


-- 
Regards
Sudip
