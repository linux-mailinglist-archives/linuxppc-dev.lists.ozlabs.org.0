Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D06412A8CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2019 19:19:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47jhF663qfzDqN5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2019 05:19:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=byj.tea@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dRRyYpHW"; 
 dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47jPcY1Z2lzDqJT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Dec 2019 18:20:12 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id f10so18041145ils.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 23:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sri5sfueFO4Exz0ENPN8HCkoPbDYs1U1wIVwtSEFmvg=;
 b=dRRyYpHWkSGOFa9MLwVb0pdRYAR3k1FvZUFxcGseTuMC8B9/7iRRMm+nrs1aTQ/IsI
 tDebN0r/l1He5AXMZSG6SYJGVVlo3YExPGLbuhALmVUm5UpsQ8HhMGuqOE2EOe58GDTS
 f74hSV3iXmNxDWJIu8X3lKcCdVj/UYGsFDOa13C1ILU7hxI617NJBwxGY+c2Obe88mBo
 uL6KvPbj+O7GXD9iwnbQ7G8DJshmJfkmbqEbr8sUQWWF4Ql/C6Hhg2f7TOWHglZlusvk
 tbzXJCFKaUVF3LKZRxfinhArGzkMf4MvaTKZsj8HrGgtDzJTkiADOrPjrwQc80Fg+Wi0
 +7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sri5sfueFO4Exz0ENPN8HCkoPbDYs1U1wIVwtSEFmvg=;
 b=hcPOU06g1P29Xnm0JXz4oYKFeqAv6vGxLp/pQ1DSokDCk/4HvyBxyQCr5RTFxxzHvt
 IPMxHWjihbmXBE5E2qVnNgcPXSGJkSRANdeHVqe0A8+McZUrG7WIytVPYFofU8BkvfIO
 ipZjJ0gfWhpfekrtCE799Wv+nC6HOdXj9a/YnM2gXB+1R8G9GSHSankPCMmlNdUGoMgO
 EqqlAosNQ6b4Y1OSmXvxRPvAurmwGPmULOeZSL2XQUcA7KFrIOzqCIpjn4RSk+VnbHf/
 jMVdK/ZUhw/VENBiieYrK1SUDwHcrw3MO+5N+Xt8yllNZrRHeM1tL1I8Wx4EhKn5qR0k
 fWwg==
X-Gm-Message-State: APjAAAWByNqwz6ELFgObHSm6IVwUhww3IBn9bji792lH+61MfCbsyYHW
 2l33Slp5+3sJfERfRiHai44y8ovECWMeMfiaUSw=
X-Google-Smtp-Source: APXvYqyzWGbhyiz3+arLsu8FDdvxpCO5Q3CwrYcF6Q1czGLs6PIlzkF8bWasFfcE9Vsl5+R5ju4ih/4agPZW8nCzIbY=
X-Received: by 2002:a92:160a:: with SMTP id r10mr31842328ill.14.1577258409246; 
 Tue, 24 Dec 2019 23:20:09 -0800 (PST)
MIME-Version: 1.0
References: <1574694943-7883-1-git-send-email-yingjie_bai@126.com>
 <87pngglmxg.fsf@mpe.ellerman.id.au>
 <CAFAt38F-YQUVNXEnLut0tMivYUy_OTK7G4wAHfddcmncsEpREQ@mail.gmail.com>
 <9e680f3798f1a771cba4b41f7a5d7fda7f534522.camel@buserror.net>
 <CAFAt38FnH376ioDuvyNJW=iOxbcooRRsEeVEfDudRoV4gG98SQ@mail.gmail.com>
 <a37338283db548c58e6c36e4996a9474b1fe2038.camel@buserror.net>
In-Reply-To: <a37338283db548c58e6c36e4996a9474b1fe2038.camel@buserror.net>
From: Yingjie Bai <byj.tea@gmail.com>
Date: Wed, 25 Dec 2019 15:19:58 +0800
Message-ID: <CAFAt38HEUZ1tc-OGw2YF3-YcouG63h1uG8Quot=G5xj+u9pTtA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/mpc85xx: also write addr_h to spin table for
 64bit boot entry
To: Scott Wood <oss@buserror.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 26 Dec 2019 05:07:17 +1100
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
Cc: yingjie_bai@126.com, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Scott, I will test to see if returning phys_addr_t in __pa()
works for my setup.

And another thin I will test is to compile without CONFIG_RELOCATABLE
before resubmitting the patch.

On Wed, Dec 25, 2019 at 2:53 PM Scott Wood <oss@buserror.net> wrote:
>
> On Wed, 2019-12-25 at 11:24 +0800, Yingjie Bai wrote:
> > Hi Scott,
> >
> > __pa() returns 64bit in my setup.
> >
> > in arch/powerpc/include/asm/page.h
> >
> > #if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
> > #define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) +
> > VIRT_PHYS_OFFSET))
> > #define __pa(x) ((unsigned long)(x) - VIRT_PHYS_OFFSET)
> > #else
> > #ifdef CONFIG_PPC64
> > ...
> >
> >
> >
> > /* See Description below for VIRT_PHYS_OFFSET */
> > #if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
> > #ifdef CONFIG_RELOCATABLE
> > #define VIRT_PHYS_OFFSET virt_phys_offset
> > #else
> > #define VIRT_PHYS_OFFSET (KERNELBASE - PHYSICAL_START)
> > #endif
> > #endif
>
> OK, so it's the lack of CONFIG_RELOCATABLE causing the build to fail.  Ideally
> we'd make __pa() consistently return phys_addr_t, even if the upper bits are
> known to always be zero in a particular config.
>
> -Scott
>
>
