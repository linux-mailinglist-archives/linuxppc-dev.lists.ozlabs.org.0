Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9C7289BB1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 00:19:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7Mtg0WTNzDr3S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 09:19:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=FggwccN5; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7Mbz1T3PzDqVB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Oct 2020 09:06:38 +1100 (AEDT)
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3638622258;
 Fri,  9 Oct 2020 22:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602281195;
 bh=BSdsYnSsWQ2YK6s+0hwikbexRRTi6RzXd6Oify0LIKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FggwccN5I5AZiuE+Vm843foxykXLgY3+2Ve5JGwMxqNB3E+xShPYydixbERiidVVi
 QW9J0tz5mlsoo600M7a+WgeVErDk1b1VMW5mDMvhyrS14K46mLfNtrpVvaVMMeP9LF
 2DCRbted8w1IYRD5exRfS6+MpJtndCuG5tnmVNDU=
Date: Fri, 9 Oct 2020 15:06:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 05/14] fs: don't allow kernel reads and writes without
 iter ops
Message-ID: <20201009220633.GA1122@sol.localdomain>
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142242.925828-6-hch@lst.de>
 <20201001223852.GA855@sol.localdomain>
 <20201001224051.GI3421308@ZenIV.linux.org.uk>
 <CAHk-=wgj=mKeN-EfV5tKwJNeHPLG0dybq+R5ZyGuc4WeUnqcmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgj=mKeN-EfV5tKwJNeHPLG0dybq+R5ZyGuc4WeUnqcmA@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 02, 2020 at 09:27:09AM -0700, Linus Torvalds wrote:
> On Thu, Oct 1, 2020 at 3:41 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > Better
> >         loff_t dummy = 0;
> > ...
> >                 wr = __kernel_write(file, data, bytes, &dummy);
> 
> No, just fix __kernel_write() to work correctly.
> 
> The fact is, NULL _is_ the right pointer for ppos these days.
> 
> That commit by Christoph is buggy: it replaces new_sync_write() with a
> buggy open-coded version.
> 
> Notice how new_sync_write does
> 
>         kiocb.ki_pos = (ppos ? *ppos : 0);
> ,,,
>         if (ret > 0 && ppos)
>                 *ppos = kiocb.ki_pos;
> 
> but the open-coded version doesn't.
> 
> So just fix that in linux-next. The *last* thing we want is to have
> different semantics for the "same" kernel functions.

It's a bit unintuitive that ppos=NULL means "use pos 0", not "use file->f_pos".

Anyway, it works.  The important thing is, this is still broken in linux-next...

- Eric
