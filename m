Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C6B271772
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 21:17:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bvcl70PmfzDqV7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 05:17:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=PjyDniQs; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bvchp4rlWzDqY3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 05:15:06 +1000 (AEST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD51A214F1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 19:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600629302;
 bh=01MigO53P6iyZydtBYB0dVEV2Jvv4nS2ce79nd2bE4Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PjyDniQs3KsBKfILCo6DAkzBMbsRqEcz0eTgRBTcYSLWjku25BIq5mD1QmuEZmMJQ
 jpFnkv8vioYuDopKE61DV8oByT/r3jABZCYx9qOL9qTBjh5Fdq/d2X04dY9OE6RoCq
 neDS7X/OZByM2czMdMljYSEzNV4dCdGGIVn7ZX0A=
Received: by mail-wm1-f51.google.com with SMTP id l9so10424511wme.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 12:15:02 -0700 (PDT)
X-Gm-Message-State: AOAM531fxPMk8k0V6J4HNeUVw055uk5+0kWP2yzJdiz8IkQsKiLmePxh
 iL8Y/r7C8jJssji0Q1wknCcU1eJslL3H1FeH7NoUHQ==
X-Google-Smtp-Source: ABdhPJznW7DCp463LJOKwLIqH+/ZeaOskntfIIXR0IAAA+ZM4omIXer1gN2IBUUGrBDkxuviLF20WI9Nmbt3oWZvbk0=
X-Received: by 2002:a05:600c:2183:: with SMTP id
 e3mr27891946wme.49.1600629301119; 
 Sun, 20 Sep 2020 12:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-2-hch@lst.de>
 <20200920151510.GS32101@casper.infradead.org>
 <20200920180742.GN3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200920180742.GN3421308@ZenIV.linux.org.uk>
From: Andy Lutomirski <luto@kernel.org>
Date: Sun, 20 Sep 2020 12:14:49 -0700
X-Gmail-Original-Message-ID: <CALCETrWHW4wHG+Z-mxsY-kvjSi+S6gRUQ+LHd9syPcm5bhi3cw@mail.gmail.com>
Message-ID: <CALCETrWHW4wHG+Z-mxsY-kvjSi+S6gRUQ+LHd9syPcm5bhi3cw@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
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
Cc: linux-aio <linux-aio@kvack.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux SCSI List <linux-scsi@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block <linux-block@vger.kernel.org>, io-uring@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Parisc List <linux-parisc@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 20, 2020 at 11:07 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Sun, Sep 20, 2020 at 04:15:10PM +0100, Matthew Wilcox wrote:
> > On Fri, Sep 18, 2020 at 02:45:25PM +0200, Christoph Hellwig wrote:
> > > Add a flag to force processing a syscall as a compat syscall.  This is
> > > required so that in_compat_syscall() works for I/O submitted by io_uring
> > > helper threads on behalf of compat syscalls.
> >
> > Al doesn't like this much, but my suggestion is to introduce two new
> > opcodes -- IORING_OP_READV32 and IORING_OP_WRITEV32.  The compat code
> > can translate IORING_OP_READV to IORING_OP_READV32 and then the core
> > code can know what that user pointer is pointing to.
>
> Let's separate two issues:
>         1) compat syscalls want 32bit iovecs.  Nothing to do with the
> drivers, dealt with just fine.
>         2) a few drivers are really fucked in head.  They use different
> *DATA* layouts for reads/writes, depending upon the calling process.
> IOW, if you fork/exec a 32bit binary and your stdin is one of those,
> reads from stdin in parent and child will yield different data layouts.
> On the same struct file.
>         That's what Christoph worries about (/dev/sg he'd mentioned is
> one of those).
>
>         IMO we should simply have that dozen or so of pathological files
> marked with FMODE_SHITTY_ABI; it's not about how they'd been opened -
> it describes the userland ABI provided by those.  And it's cast in stone.
>

I wonder if this is really quite cast in stone.  We could also have
FMODE_SHITTY_COMPAT and set that when a file like this is *opened* in
compat mode.  Then that particular struct file would be read and
written using the compat data format.  The change would be
user-visible, but the user that would see it would be very strange
indeed.

I don't have a strong opinion as to whether that is better or worse
than denying io_uring access to these things, but at least it moves
the special case out of io_uring.

--Andy
