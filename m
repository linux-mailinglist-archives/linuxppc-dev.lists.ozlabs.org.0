Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45828295546
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 01:41:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGn7n1YcwzDqTW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 10:41:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=2002:c35c:fd02::1;
 helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGn5v0ptCzDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 10:39:45 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kVNhK-005pSF-DC; Wed, 21 Oct 2020 23:39:14 +0000
Date: Thu, 22 Oct 2020 00:39:14 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Message-ID: <20201021233914.GR3576660@ZenIV.linux.org.uk>
References: <20200925045146.1283714-1-hch@lst.de>
 <20200925045146.1283714-3-hch@lst.de>
 <20201021161301.GA1196312@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021161301.GA1196312@kroah.com>
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

On Wed, Oct 21, 2020 at 06:13:01PM +0200, Greg KH wrote:
> On Fri, Sep 25, 2020 at 06:51:39AM +0200, Christoph Hellwig wrote:
> > From: David Laight <David.Laight@ACULAB.COM>
> > 
> > This lets the compiler inline it into import_iovec() generating
> > much better code.
> > 
> > Signed-off-by: David Laight <david.laight@aculab.com>
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  fs/read_write.c | 179 ------------------------------------------------
> >  lib/iov_iter.c  | 176 +++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 176 insertions(+), 179 deletions(-)
> 
> Strangely, this commit causes a regression in Linus's tree right now.
> 
> I can't really figure out what the regression is, only that this commit
> triggers a "large Android system binary" from working properly.  There's
> no kernel log messages anywhere, and I don't have any way to strace the
> thing in the testing framework, so any hints that people can provide
> would be most appreciated.

It's a pure move - modulo changed line breaks in the argument lists
the functions involved are identical before and after that (just checked
that directly, by checking out the trees before and after, extracting two
functions in question from fs/read_write.c and lib/iov_iter.c (before and
after, resp.) and checking the diff between those.

How certain is your bisection?
