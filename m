Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3685E295C18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 11:37:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH2MX4YPSzDqnG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 20:37:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=G3EFVUGd; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH1wB4hZBzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 20:17:14 +1100 (AEDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A754224196
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 09:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603358231;
 bh=EK7qoJBo5hV6BXWX1tF72KBJ6WGosC+S7u14dcM7ZuU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G3EFVUGd1ziiftQhYscC/sPpMElPA8jd7zVdEhkBsjovQuurD5WmSx4tCAE6C6uba
 ldLnbG5l3mhLlsgRIQe0MzQ4JoUEB1z3sFvw7F+rUqUgUdd2Rvay5bkn3rcfJKfMHG
 FJaq/3xpaJh4NTk2KlQxT8N4VeuNtqrRSEt/L5ws=
Received: by mail-qv1-f50.google.com with SMTP id t6so511875qvz.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 02:17:11 -0700 (PDT)
X-Gm-Message-State: AOAM530D85FnAyeqQ3rVZulnvGLtd8IBpkZErt2WUeqtmDbylFmwj7VG
 +RBJPD2iLpCS7Pfv7vSv+g0v2ybNNcea0n8ctnk=
X-Google-Smtp-Source: ABdhPJyBgyw2EAc5e3+lPot5HIF+Yf1PkYa3AQp8bFTt9ENBXKmskM5kWqxYpWTilnoFehIq391QA56z0G7MJmXqFVM=
X-Received: by 2002:ad4:4203:: with SMTP id k3mr1300974qvp.8.1603358230600;
 Thu, 22 Oct 2020 02:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200925045146.1283714-1-hch@lst.de>
 <20200925045146.1283714-3-hch@lst.de>
 <20201021161301.GA1196312@kroah.com>
 <20201021233914.GR3576660@ZenIV.linux.org.uk>
 <20201022082654.GA1477657@kroah.com>
In-Reply-To: <20201022082654.GA1477657@kroah.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 22 Oct 2020 11:16:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Y8+yREExGG4SFP5+FmKaQbBJrrsZHWEoSKDep-2S=qg@mail.gmail.com>
Message-ID: <CAK8P3a0Y8+yREExGG4SFP5+FmKaQbBJrrsZHWEoSKDep-2S=qg@mail.gmail.com>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 22 Oct 2020 20:33:30 +1100
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
Cc: linux-aio <linux-aio@kvack.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 Android Kernel Team <kernel-team@android.com>,
 linux-block <linux-block@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 io-uring@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Parisc List <linux-parisc@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 10:26 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Thu, Oct 22, 2020 at 12:39:14AM +0100, Al Viro wrote:
> > On Wed, Oct 21, 2020 at 06:13:01PM +0200, Greg KH wrote:
> > > On Fri, Sep 25, 2020 at 06:51:39AM +0200, Christoph Hellwig wrote:
> > >
> > > I can't really figure out what the regression is, only that this commit
> > > triggers a "large Android system binary" from working properly.  There's
> > > no kernel log messages anywhere, and I don't have any way to strace the
> > > thing in the testing framework, so any hints that people can provide
> > > would be most appreciated.
> >
> > It's a pure move - modulo changed line breaks in the argument lists
> > the functions involved are identical before and after that (just checked
> > that directly, by checking out the trees before and after, extracting two
> > functions in question from fs/read_write.c and lib/iov_iter.c (before and
> > after, resp.) and checking the diff between those.
> >
> > How certain is your bisection?
>
> The bisection is very reproducable.
>
> But, this looks now to be a compiler bug.  I'm using the latest version
> of clang and if I put "noinline" at the front of the function,
> everything works.
>
> Nick, any ideas here as to who I should report this to?
>
> I'll work on a fixup patch for the Android kernel tree to see if I can
> work around it there, but others will hit this in Linus's tree sooner or
> later...

I see that Christoph rewrote the function again in bfdc59701d6d
("iov_iter: refactor rw_copy_check_uvector and import_iovec"),
do you know if the current mainline version is also affected?

Do you know if it happens across multiple architectures or might
be specific to either x86 or arm64?

https://bugs.llvm.org/ is obviously the place for reporting the
issue if it does turn out to be a bug in clang, but that requires
a specific thing going wrong in the output.

One idea I have for debugging it is to sprinkle the inlined
function with lots of barrier()s to prevent a lot of the optimizations.
If that solves the issue, you can bisect through those until you
find one barrier that makes the difference between working and
broken and then look at diff of the assembler output.

        Arnd
