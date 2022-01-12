Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3487248BCF2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 03:09:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYWGP12Rcz305q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 13:09:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dr+fOp8w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Dr+fOp8w; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYWFl4kJfz2xBF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 13:08:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B8E46163C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 02:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACCBC36AF5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 02:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641953335;
 bh=00jqOo/HIGe5aQsScbRyEcP5fhzEdEEb5a/Ce7t3cpo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Dr+fOp8wi/DQiF30YWSyDTO/X/gY2KuY68uhH1bbSr9L4LCWtzdsmA1/2FVgH6Yui
 JAWtdZN3+qVuyTH8g7AWcIBoPboWqU5NEOBJY3Qi2lQYpTEjvY17r0McmIXxiQGXjy
 vMb/2FSp+DWz/rMXSgh25TUrsAEIDTZ/nrgIfBaLqltrBBD10mPo/jp96cQ+uhKTVZ
 t/CRg13JBexnPXx/8lXSOSAHOwES426B7kTOWti7Bnc9HE8lsIaWa7rd+tvu1aEfg1
 xp9S5v0O07CBLJ8tI8dJHISW+bnA5ZRD+Ol48fLpo9kJtTe3dTBYie/PALeVEuaDAh
 NJnD0tFre3L5A==
Received: by mail-ua1-f46.google.com with SMTP id c36so2020210uae.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 18:08:55 -0800 (PST)
X-Gm-Message-State: AOAM531/po9F2XLvcZvv0cDAxsYsui/RcVa2OauxYenTF3kVfzBYAMvC
 tBhhL6m3Ng+Wnma51pIyOAOHXPtdEQou1gTNvBM=
X-Google-Smtp-Source: ABdhPJwDjcWqNqYbbEwXXTZv6pYv1AFZouP6oGIFcDRCp67/dn6q+IWJLxLbMTSk+FCyEJgyv6a7C0pY5YW8GYdxT6U=
X-Received: by 2002:a67:fd64:: with SMTP id h4mr3438011vsa.8.1641953334235;
 Tue, 11 Jan 2022 18:08:54 -0800 (PST)
MIME-Version: 1.0
References: <20220111083515.502308-1-hch@lst.de>
 <20220111083515.502308-5-hch@lst.de>
 <CAK8P3a0mHC5=OOGV=sGnC9JqZWxzsJyZbTefnCtryQU3o3PY_g@mail.gmail.com>
In-Reply-To: <CAK8P3a0mHC5=OOGV=sGnC9JqZWxzsJyZbTefnCtryQU3o3PY_g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 12 Jan 2022 10:08:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS81o1bsAGj=016F=Nw7MszhsYa95cw6JLThjwW50YRpw@mail.gmail.com>
Message-ID: <CAJF2gTS81o1bsAGj=016F=Nw7MszhsYa95cw6JLThjwW50YRpw@mail.gmail.com>
Subject: Re: [PATCH 4/5] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in
 fcntl.h
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 11, 2022 at 11:33 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jan 11, 2022 at 9:35 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > The fcntl F_GETLK64/F_SETLK64/F_SETLKW64 are only implemented for the
> > 32-bit syscall APIs, but we also need them for compat handling on 64-bit
> > builds.  Redefining them is error prone (as shown by the example that
> > parisc gets it wrong currently), so we should use the same defines for
> > both case.  In theory we could try to hide them from userspace, but
> > given that only MIPS actually gets that right, while the asm-generic
> > version used by most architectures relies on a Kconfig symbol that can't
> > be relied on to be set properly by userspace is a clear indicator to not
> > bother.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
>
> > diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
> > index 98f4ff165b776..43d7c44031be0 100644
> > --- a/include/uapi/asm-generic/fcntl.h
> > +++ b/include/uapi/asm-generic/fcntl.h
> > @@ -116,13 +116,11 @@
> >  #define F_GETSIG       11      /* for sockets. */
> >  #endif
> >
> > -#ifndef CONFIG_64BIT
> >  #ifndef F_GETLK64
> >  #define F_GETLK64      12      /*  using 'struct flock64' */
> >  #define F_SETLK64      13
> >  #define F_SETLKW64     14
> >  #endif
> > -#endif
> >
> >  #ifndef F_SETOWN_EX
> >  #define F_SETOWN_EX    15
>
> This is a very subtle change to the exported UAPI header contents:
> On 64-bit architectures, the three unusable numbers are now always
> shown, rather than depending on a user-controlled symbol.
>
> This is probably what we want here for compatibility reasons, but I think
> it should be explained in the changelog text, and I'd like Jeff or Bruce
> to comment on it as well: the alternative here would be to make the
> uapi definition depend on __BITS_PER_LONG==32, which is

__BITS_PER_LONG==32 || __KERNEL__  just for kernel use in compat.

> technically the right thing to do but more a of a change.
>
>        Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
