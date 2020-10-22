Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47242295A51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 10:28:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH0r7744zzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 19:28:39 +1100 (AEDT)
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
 header.s=default header.b=zDx/QVbN; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH0nT2SPXzDqkG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 19:26:21 +1100 (AEDT)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2ABFB2065D;
 Thu, 22 Oct 2020 08:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603355177;
 bh=dmCNgDGTpNmF+8O2fjJO2XplnMkrwwsAXNmOMHG4kDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zDx/QVbNU8SimNSxRnLGamZjzaL0aYk8447/KE6GRihUCtWhJ6Z86tE/3/Weg2vwC
 GiWZsECpqwLisbFLZe5yubGxrkvnswusVy8o3gK7vn/eUfbf4ADoW/+TTZixBrP7Y/
 ZuwgVCa1BoOMrly/6gJ13uZ1QxD/B6i974xOGQS0=
Date: Thu, 22 Oct 2020 10:26:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Al Viro <viro@zeniv.linux.org.uk>,
 Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Message-ID: <20201022082654.GA1477657@kroah.com>
References: <20200925045146.1283714-1-hch@lst.de>
 <20200925045146.1283714-3-hch@lst.de>
 <20201021161301.GA1196312@kroah.com>
 <20201021233914.GR3576660@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021233914.GR3576660@ZenIV.linux.org.uk>
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
Cc: linux-aio@kvack.org, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 David Laight <David.Laight@aculab.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 12:39:14AM +0100, Al Viro wrote:
> On Wed, Oct 21, 2020 at 06:13:01PM +0200, Greg KH wrote:
> > On Fri, Sep 25, 2020 at 06:51:39AM +0200, Christoph Hellwig wrote:
> > > From: David Laight <David.Laight@ACULAB.COM>
> > > 
> > > This lets the compiler inline it into import_iovec() generating
> > > much better code.
> > > 
> > > Signed-off-by: David Laight <david.laight@aculab.com>
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  fs/read_write.c | 179 ------------------------------------------------
> > >  lib/iov_iter.c  | 176 +++++++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 176 insertions(+), 179 deletions(-)
> > 
> > Strangely, this commit causes a regression in Linus's tree right now.
> > 
> > I can't really figure out what the regression is, only that this commit
> > triggers a "large Android system binary" from working properly.  There's
> > no kernel log messages anywhere, and I don't have any way to strace the
> > thing in the testing framework, so any hints that people can provide
> > would be most appreciated.
> 
> It's a pure move - modulo changed line breaks in the argument lists
> the functions involved are identical before and after that (just checked
> that directly, by checking out the trees before and after, extracting two
> functions in question from fs/read_write.c and lib/iov_iter.c (before and
> after, resp.) and checking the diff between those.
> 
> How certain is your bisection?

The bisection is very reproducable.

But, this looks now to be a compiler bug.  I'm using the latest version
of clang and if I put "noinline" at the front of the function,
everything works.

Nick, any ideas here as to who I should report this to?

I'll work on a fixup patch for the Android kernel tree to see if I can
work around it there, but others will hit this in Linus's tree sooner or
later...

thanks,

greg k-h
