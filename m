Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2328911D48E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 18:51:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YhFC5f6pzDr6b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 04:51:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="MAwdhQ2A"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YhCC1n94zDqFB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 04:49:58 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id j6so3274550lja.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 09:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bMM9+SXbUifsEu+Y3zqfvwzhjRsedDBd5kfOwAh/UwA=;
 b=MAwdhQ2ApXj+Y01Th4BCE3RSlffcMF2vn+S1n9g9eLPqUXBxqb7H1E20UVL+9mb/zo
 TUamH+60U4LyvobpVidwKOG160coaIFky35EjHAPgaruzcWX7fUztBbagb0MZDX0xKZK
 b+3B1PXWXfIs13GZ1+vXd3HB1o38BkFLHhGiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bMM9+SXbUifsEu+Y3zqfvwzhjRsedDBd5kfOwAh/UwA=;
 b=de21B+YddFxfxDHnzKykwGVT9RJknG0BeV7BbHipIVmrx9Mbbp9cOsWt4kbppCpAjs
 uCXkMzQ87SNm3nnLzLf/8uBv8w4R02r2mDkC+xG+Go7a5fh26jPO3INzWdh498gg0gwZ
 fdjN+Afk0J4yky4alleVwr0eIWIGDegErFXn6L3qFqJnqNSNQ6YTAjtdLaVKwX5CXzzM
 FSZqEBLsSOMFX43ptlGd3Vu3+eLaRrZfoacGXmvlgX9+eHls2fYw8OmSDvs9Iwmoh8Pr
 f48H45sNl2v1xJVtHFOKVJZPGKqNlmPKQfqVEBOv3q0BFmfcGO/pouy6eJM+9P9JCb3A
 jAHQ==
X-Gm-Message-State: APjAAAVrOpBZU/dBSWN7aOKBi7Q4rTenVigPmM39th4ch8AAHo07iROA
 v3F4odQYIcHdaSPzvDjm9jXbbXaPSxI=
X-Google-Smtp-Source: APXvYqyU0dvkLIh/fkgmW7Rx5TwFUEbJ2NE4ZA+6DdAZavhnvZUUL5LJyjxXn2b5DDs+bMeqTVyv+A==
X-Received: by 2002:a2e:918c:: with SMTP id f12mr6739620ljg.66.1576172509459; 
 Thu, 12 Dec 2019 09:41:49 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id n3sm3237501lfk.61.2019.12.12.09.41.48
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 09:41:48 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id m6so3247361ljc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 09:41:48 -0800 (PST)
X-Received: by 2002:a2e:241a:: with SMTP id k26mr6727345ljk.26.1576172507997; 
 Thu, 12 Dec 2019 09:41:47 -0800 (PST)
MIME-Version: 1.0
References: <87blslei5o.fsf@mpe.ellerman.id.au>
 <20191206131650.GM2827@hirez.programming.kicks-ass.net>
 <875zimp0ay.fsf@mpe.ellerman.id.au>
 <20191212080105.GV2844@hirez.programming.kicks-ass.net>
 <20191212100756.GA11317@willie-the-truck>
 <20191212104610.GW2827@hirez.programming.kicks-ass.net>
In-Reply-To: <20191212104610.GW2827@hirez.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Dec 2019 09:41:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjUBsH0BYDBv=q36482G-U7c=9bC89L_BViSciTfb8fhA@mail.gmail.com>
Message-ID: <CAHk-=wjUBsH0BYDBv=q36482G-U7c=9bC89L_BViSciTfb8fhA@mail.gmail.com>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
To: Peter Zijlstra <peterz@infradead.org>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 12, 2019 at 2:46 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> +#ifdef GCC_VERSION < 40800

Where does that 4.8 version check come from, and why?

Yeah, I know, but this really wants a comment. Sadly it looks like gcc
bugzilla is down, so

   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145

currently gives an "Internal Server Error" for me.

[ Delete the horrid code we have because of gcc bugs ]

> +#else /* GCC_VERSION < 40800 */
> +
> +#define READ_ONCE_NOCHECK(x)                                           \
> +({                                                                     \
> +       typeof(x) __x = *(volatile typeof(x))&(x);                      \

I think we can/should just do this unconditionally if it helps th eissue.

Maybe add a warning about how gcc < 4.8 might mis-compile the kernel -
those versions are getting close to being unacceptable for kernel
builds anyway.

We could also look at being stricter for the normal READ/WRITE_ONCE(),
and require that they are

 (a) regular integer types

 (b) fit in an atomic word

We actually did (b) for a while, until we noticed that we do it on
loff_t's etc and relaxed the rules. But maybe we could have a
"non-atomic" version of READ/WRITE_ONCE() that is used for the
questionable cases?

              Linus
