Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BFC29610E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 16:41:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH96310DdzDqw9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 01:41:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=PxugVsee; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH94N2Q0PzDqnZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 01:39:47 +1100 (AEDT)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 276A224171;
 Thu, 22 Oct 2020 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603377583;
 bh=ma7f6ciQXaB7O32bDDp+GeQJ6WrSJ5EDDu1VyaA7rGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PxugVsee9PWrXt/gXzudeuTvI47TjXebpNxq+V4HCmVCe1sKZHLosNqAbXuuvW+/i
 F3Omc7qJjCGcZpsoZ0gvdBLvvwF6P71x/p/bcwNCyzTjDInFt6yyFfEubOEEK8j98S
 eCVIVyZ2FmbbCU8ALan3OPjQJXwF2/c6hnwwd7rg=
Date: Thu, 22 Oct 2020 16:40:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Message-ID: <20201022144021.GA1969554@kroah.com>
References: <e04d0c5d-e834-a15b-7844-44dcc82785cc@redhat.com>
 <a1533569-948a-1d5b-e231-5531aa988047@redhat.com>
 <bc0a091865f34700b9df332c6e9dcdfd@AcuMS.aculab.com>
 <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
 <20201022104805.GA1503673@kroah.com>
 <20201022121849.GA1664412@kroah.com>
 <98d9df88-b7ef-fdfb-7d90-2fa7a9d7bab5@redhat.com>
 <20201022125759.GA1685526@kroah.com>
 <20201022135036.GA1787470@kroah.com>
 <CAK8P3a1B7OVdyzW0-97JwzZiwp0D0fnSfyete16QTvPp_1m07A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1B7OVdyzW0-97JwzZiwp0D0fnSfyete16QTvPp_1m07A@mail.gmail.com>
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
Cc: "linux-aio@kvack.org" <linux-aio@kvack.org>,
 David Hildenbrand <david@redhat.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "kernel-team@android.com" <kernel-team@android.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 04:28:20PM +0200, Arnd Bergmann wrote:
> On Thu, Oct 22, 2020 at 3:50 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Thu, Oct 22, 2020 at 02:57:59PM +0200, Greg KH wrote:
> > > On Thu, Oct 22, 2020 at 02:42:24PM +0200, David Hildenbrand wrote:
> 
> > > >  struct iovec *iovec_from_user(const struct iovec __user *uvec,
> > > > -               unsigned long nr_segs, unsigned long fast_segs,
> > > > +               unsigned nr_segs, unsigned fast_segs,
> > > >                 struct iovec *fast_iov, bool compat)
> > > >  {
> > > >         struct iovec *iov = fast_iov;
> > > > @@ -1738,7 +1738,7 @@ ssize_t __import_iovec(int type, const struct
> > > > iovec __user *uvec,
> > > >                  struct iov_iter *i, bool compat)
> > > >  {
> > > >         ssize_t total_len = 0;
> > > > -       unsigned long seg;
> > > > +       unsigned seg;
> > > >         struct iovec *iov;
> > > >
> > > >         iov = iovec_from_user(uvec, nr_segs, fast_segs, *iovp, compat);
> > > >
> > >
> > > Ah, I tested the other way around, making everything "unsigned long"
> > > instead.  Will go try this too, as other tests are still running...
> >
> > Ok, no, this didn't work either.
> >
> > Nick, I think I need some compiler help here.  Any ideas?
> 
> I don't think the patch above would reliably clear the upper bits if they
> contain garbage.
> 
> If the integer extension is the problem, the way I'd try it is to make the
> function take an 'unsigned long' and then explictly mask the upper
> bits with
> 
>      seg = lower_32_bits(seg);
> 
> Can you attach the iov_iter.s files from the broken build, plus the
> one with 'noinline' for comparison? Maybe something can be seen
> in there.

I don't know how to extract the .s files easily from the AOSP build
system, I'll look into that.  I'm also now testing by downgrading to an
older version of clang (10 instead of 11), to see if that matters at all
or not...

thanks,

greg k-h
