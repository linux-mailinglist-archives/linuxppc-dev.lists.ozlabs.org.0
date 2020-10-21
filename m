Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98E295085
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 18:14:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGbCX6GCbzDqP4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 03:14:00 +1100 (AEDT)
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
 header.s=default header.b=SY2cnni/; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGb9k1yRvzDqRc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 03:12:25 +1100 (AEDT)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77C932087D;
 Wed, 21 Oct 2020 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603296742;
 bh=Skv4VHOsxkbjExqgUALTljS6pv/j0ztelpvS9+0CtRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SY2cnni/yKiqNX2D+MolwtBJkJZ25el2hwQIqa11SFtDmBTq22ksfzgjhnYpbguzD
 uBJI7QL3KluS3eIdXrPW4GsEYXfXh8wZGwW2M5LAz2S2HyPezXFwhGB9FXwsuwf6Qg
 XKD6E/hfwsCovIhfz5qaKfu2Q5NHx6cNpzquq6Po=
Date: Wed, 21 Oct 2020 18:13:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>, kernel-team@android.com
Subject: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Message-ID: <20201021161301.GA1196312@kroah.com>
References: <20200925045146.1283714-1-hch@lst.de>
 <20200925045146.1283714-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925045146.1283714-3-hch@lst.de>
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
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, David Laight <David.Laight@aculab.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 25, 2020 at 06:51:39AM +0200, Christoph Hellwig wrote:
> From: David Laight <David.Laight@ACULAB.COM>
> 
> This lets the compiler inline it into import_iovec() generating
> much better code.
> 
> Signed-off-by: David Laight <david.laight@aculab.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/read_write.c | 179 ------------------------------------------------
>  lib/iov_iter.c  | 176 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 176 insertions(+), 179 deletions(-)

Strangely, this commit causes a regression in Linus's tree right now.

I can't really figure out what the regression is, only that this commit
triggers a "large Android system binary" from working properly.  There's
no kernel log messages anywhere, and I don't have any way to strace the
thing in the testing framework, so any hints that people can provide
would be most appreciated.

thanks,

greg k-h
