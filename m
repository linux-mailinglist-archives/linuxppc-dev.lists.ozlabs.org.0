Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC551FA0C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 21:47:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m20c5WS4zDqfX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 05:47:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=brgerst@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d1N76KYX; dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m1ys1MVkzDqDl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 05:45:39 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id r2so3876ioo.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GcEsP5XHkAYWjVB1MFDssViF4cxMQLWXk2Kgbxji0hs=;
 b=d1N76KYXqQ1fpaIX30dgZBqRd8wI/sojfUihP9H9n7SrJl5fw8AIM1QjJHFUie0ynn
 Ba7u2YUNcGPgUH5k5/xR7j1g1AD4ubDfekbuaJsUIn8tpQbEqATe7gJrtx3bqoUJmH4s
 5+bquUS4RYotC8sNbFVFKTlUv9aULk2bwxwqhhxgC1NWXrZ2b3J+MnEA2epJN5YcPwJd
 seJUjothmBUqRpHkR2X5MhScZehYA2HegUeEnFWW4JD2VuEs9SDBgZ0eGzbMT5M7oi0/
 XAULqncIPF3a7VQsBQHJiygHfxiVk4UqM7Xb3uuuIVXJb73uzIjZdrMQlG7Z9vwbj0Z+
 CyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GcEsP5XHkAYWjVB1MFDssViF4cxMQLWXk2Kgbxji0hs=;
 b=qeUMDUyJXROeSru2768erx51oKBsXELR7VBA63YFjQ3BSJWx1863+gAWdT7ilWuR6i
 Y9qQLJqvRipj0dXqq/F4JkgaAsTrDr29CcpgR8dDgQpnkkge6ctBCcfNgR56/lKz0Y/W
 oEZ+n4PiRcOfBWnhsjqLfs84mYM1uacq9QCjaLBCYam0V8jUM5Us0BruqOzX/4W1FNya
 KyEN53+ws811I1y6iKP73JPxkQxlGIQBximSRjpbCJDOn/2brn1HZM580nj4qxiicr2X
 pVpO7muNEnBA4rPMcCGOwcCAMLktm+09D9CfqSmaxysz+eCy8MXmHw45zMz7q/ysSBoa
 nJjQ==
X-Gm-Message-State: AOAM5332EqZb7jsODu6JNSgxVqulpcsjtG51IiJ/BVjc04JEOxtfD1fd
 8ROj/Xdr2UlR9nUKd3Lq2Puk6A4I+0z1z/aJ7A==
X-Google-Smtp-Source: ABdhPJxruXU+i+P2JjGW09+nvoxmHKpEF1SP+mxNnwxG3exn2/HqUJry5Lh3ZGwSfno6ZlJbUa99xQueu/DZAVZXhg0=
X-Received: by 2002:a05:6602:80b:: with SMTP id
 z11mr29222473iow.109.1592250335524; 
 Mon, 15 Jun 2020 12:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200615130032.931285-1-hch@lst.de>
 <20200615130032.931285-3-hch@lst.de>
 <CAK8P3a0bRD3RzE_X6Tjzu9Tj+OhHhP+S=k6+VYODBGko8oQhew@mail.gmail.com>
 <20200615141239.GA12951@lst.de>
 <CAMzpN2heSzZzg16ws3yQkd7YZwmPPx_4RFCpb9JYfFWJ9gfPhA@mail.gmail.com>
 <CAK8P3a3q-hC7kZwLPbc+E5VYcqthQS4J4Rqo+rKkBRU2n071XA@mail.gmail.com>
In-Reply-To: <CAK8P3a3q-hC7kZwLPbc+E5VYcqthQS4J4Rqo+rKkBRU2n071XA@mail.gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Mon, 15 Jun 2020 15:45:24 -0400
Message-ID: <CAMzpN2iDPKatOqs+Uuw70ACbnB-D__dgSRZU0wBjOUBwTGOJ-A@mail.gmail.com>
Subject: Re: [PATCH 2/6] exec: simplify the compat syscall handling
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
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 2:47 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jun 15, 2020 at 4:48 PM Brian Gerst <brgerst@gmail.com> wrote:
> > On Mon, Jun 15, 2020 at 10:13 AM Christoph Hellwig <hch@lst.de> wrote:
> > > On Mon, Jun 15, 2020 at 03:31:35PM +0200, Arnd Bergmann wrote:
>
> > >
> > > I'd rather keep it in common code as that allows all the low-level
> > > exec stuff to be marked static, and avoid us growing new pointless
> > > compat variants through copy and paste.
> > > smart compiler to d
> > >
> > > > I don't really understand
> > > > the comment, why can't this just use this?
> > >
> > > That errors out with:
> > >
> > > ld: arch/x86/entry/syscall_x32.o:(.rodata+0x1040): undefined reference to
> > > `__x32_sys_execve'
> > > ld: arch/x86/entry/syscall_x32.o:(.rodata+0x1108): undefined reference to
> > > `__x32_sys_execveat'
> > > make: *** [Makefile:1139: vmlinux] Error 1
> >
> > I think I have a fix for this, by modifying the syscall wrappers to
> > add an alias for the __x32 variant to the native __x64_sys_foo().
> > I'll get back to you with a patch.
>
> Do we actually need the __x32 prefix any more, or could we just
> change all x32 specific calls to use __x64_compat_sys_foo()?

I suppose that would work too.  The prefix really describes the
register mapping.

--
Brian Gerst
