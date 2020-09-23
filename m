Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EDB275E5C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 19:10:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxPp02wZ8zDqQf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 03:10:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=brgerst@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SJdkZUQ5; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxPm53jZTzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 03:09:04 +1000 (AEST)
Received: by mail-il1-x142.google.com with SMTP id t12so346237ilh.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ytIfUWOmJqLPL+KzEZROrbe3lD4J5ZzRU4bHZaNkG6o=;
 b=SJdkZUQ5ybixC9OLlVL9ihYm0CGLZ1cfDuOlRdKBWI5QTOmULV2iGenUUbUD5nTor1
 kqILyv2JLjuaan6UAW6DDaQNCIcU/yd6/FB4cjytVESzyvnF521+vXIlGuspDiz4mn1x
 0pe9AHsIqqDfUYIywe8ABpEPxZ0PmyFGn5nW6irTMP9h7VkNxgroibbBOMNzUXMn7vKx
 rVhw9xS6DwUCuluTBETmo7u/kv8kt+9usmeZxWSMpFV/oDBu5nsCmM/Qw8xhLz8Y3lKG
 ByUShFY2nuSD519gJ//MM/eqO74kPkrESHRriPZ7jnkjAQUVo2q29u3OUNdwzjm6srT3
 IBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ytIfUWOmJqLPL+KzEZROrbe3lD4J5ZzRU4bHZaNkG6o=;
 b=sKBYU3GjONynX3qpx4NYBYoj7YK8x7+yiwZoRfRLAPi9qE3xtf+xWmqwajQnVbAdL2
 HTdgcKZvTXWOkeBiL1Q8PfVwCAtQ8klNH1F7d3fz9x9/rHuLiWwIXRxkHeZJY9X7iwSz
 sx+XVlM1eR0w85l6hL79swSVrcWvuhb2dFYn40B4NETr/L4702vykwtP5zf2X1nVxGVD
 DobQUIsAP+jULFTMBYNCyl8huFxQQ5d7YIaHVZtrZFE9UJS8/U0lrb4rMkkTSHh5JuZR
 wVfeGpVwUujclm3N6cUQ1wluXieRz0j8QNsj6qGfDiaJYommVJkjo1tsSZKcibxKz/3l
 z0YA==
X-Gm-Message-State: AOAM531FxKFyBJSWPgQ8yD/DnQZzSMBGFXF9Mdyv68d/Dk+h8KVwb1HP
 UfSnR5tL4g3mag/VPlv7NEsDTBd2RVFqcRJoxQ==
X-Google-Smtp-Source: ABdhPJx9AHt865Jv+eAAUR1TTStZMpA1/c10T3SLrotTbGP81GAP4lHvM3CmBFRNspJd1OouW0Bqrb/e9Ox1UsZBcH4=
X-Received: by 2002:a92:99cb:: with SMTP id t72mr675478ilk.172.1600880940723; 
 Wed, 23 Sep 2020 10:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200923060547.16903-1-hch@lst.de>
 <20200923060547.16903-6-hch@lst.de>
 <20200923142549.GK3421308@ZenIV.linux.org.uk> <20200923143251.GA14062@lst.de>
 <20200923145901.GN3421308@ZenIV.linux.org.uk>
 <20200923163831.GO3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200923163831.GO3421308@ZenIV.linux.org.uk>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 23 Sep 2020 13:08:49 -0400
Message-ID: <CAMzpN2idk7bc7+37sj5UFD_PUOXCxn+RS8xmviq6Yc_LU4jyCw@mail.gmail.com>
Subject: Re: [PATCH 5/9] fs: remove various compat readv/writev helpers
To: Al Viro <viro@zeniv.linux.org.uk>
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
Cc: linux-aio@kvack.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-scsi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Parisc List <linux-parisc@vger.kernel.org>,
 netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org, David Laight <David.Laight@aculab.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 12:39 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Wed, Sep 23, 2020 at 03:59:01PM +0100, Al Viro wrote:
>
> > > That's a very good question.  But it does not just compile but actually
> > > works.  Probably because all the syscall wrappers mean that we don't
> > > actually generate the normal names.  I just tried this:
> > >
> > > --- a/include/linux/syscalls.h
> > > +++ b/include/linux/syscalls.h
> > > @@ -468,7 +468,7 @@ asmlinkage long sys_lseek(unsigned int fd, off_t offset,
> > >  asmlinkage long sys_read(unsigned int fd, char __user *buf, size_t count);
> > >  asmlinkage long sys_write(unsigned int fd, const char __user *buf,
> > >                             size_t count);
> > > -asmlinkage long sys_readv(unsigned long fd,
> > > +asmlinkage long sys_readv(void *fd,
> > >
> > > for fun, and the compiler doesn't care either..
> >
> > Try to build it for sparc or ppc...
>
> FWIW, declarations in syscalls.h used to serve 4 purposes:
>         1) syscall table initializers needed symbols declared
>         2) direct calls needed the same
>         3) catching mismatches between the declarations and definitions
>         4) centralized list of all syscalls
>
> (2) has been (thankfully) reduced for some time; in any case, ksys_... is
> used for the remaining ones.
>
> (1) and (3) are served by syscalls.h in architectures other than x86, arm64
> and s390.  On those 3 (1) is done otherwise (near the syscall table initializer)
> and (3) is not done at all.
>
> I wonder if we should do something like
>
> SYSCALL_DECLARE3(readv, unsigned long, fd, const struct iovec __user *, vec,
>                  unsigned long, vlen);
> in syscalls.h instead, and not under that ifdef.
>
> Let it expand to declaration of sys_...() in generic case and, on x86, into
> __do_sys_...() and __ia32_sys_...()/__x64_sys_...(), with types matching
> what SYSCALL_DEFINE ends up using.
>
> Similar macro would cover compat_sys_...() declarations.  That would
> restore mismatch checking for x86 and friends.  AFAICS, the cost wouldn't
> be terribly high - cpp would have more to chew through in syscalls.h,
> but it shouldn't be all that costly.  Famous last words, of course...
>
> Does anybody see fundamental problems with that?

I think this would be a good idea.  I have been working on a patchset
to clean up the conditional syscall handling (sys_ni.c), and conflicts
with the prototypes in syscalls.h have been getting in the way.
Having the prototypes use SYSCALL_DECLAREx(...) would solve that
issue.

--
Brian Gerst
