Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE49C11B7C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 16:33:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vyRJ2Tn9zDqMm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 00:33:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="lb0LwYB5"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vyPH2YyhzDqFM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 00:31:15 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F5D5205F4;
 Thu,  2 May 2019 14:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556807473;
 bh=y5jVx1Vr45IYZXdnuMmQlJ963MVRseLeFnp2Z3e8K7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lb0LwYB5aV/+RONxcgf7wOlwTkwen8aazd2+1ujBiUjq1kHVOrZVjlgzIY95xfCAQ
 L1Qi3hK6a1MiB3I8n4Elvi0Zo0fDGNJDrx87crP2tmf+vo48Y+4ksgNAnqS4dXXHaz
 S6FIRV+ta5qdUjX6SF0HeJYSrOdOdpp5QWoO5PSc=
Date: Thu, 2 May 2019 16:31:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: Linux 5.1-rc5
Message-ID: <20190502143110.GC17577@kroah.com>
References: <CAHk-=wjvcuyCQGnfOhooaL1H4H63qXO=xgo+9yncSOG=eK+kbA@mail.gmail.com>
 <20190415051919.GA31481@infradead.org>
 <CAHk-=wj7jgMOVFW0tiU-X+zhg6+Rn7mEBTej+f26rV3zXezOSA@mail.gmail.com>
 <20190502122128.GA2670@kroah.com>
 <20190502161758.26972bb2@mschwideX1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502161758.26972bb2@mschwideX1>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 02, 2019 at 04:17:58PM +0200, Martin Schwidefsky wrote:
> On Thu, 2 May 2019 14:21:28 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Mon, Apr 15, 2019 at 09:17:10AM -0700, Linus Torvalds wrote:
> > > On Sun, Apr 14, 2019 at 10:19 PM Christoph Hellwig <hch@infradead.org> wrote:  
> > > >
> > > > Can we please have the page refcount overflow fixes out on the list
> > > > for review, even if it is after the fact?  
> > > 
> > > They were actually on a list for review long before the fact, but it
> > > was the security mailing list. The issue actually got discussed back
> > > in January along with early versions of the patches, but then we
> > > dropped the ball because it just wasn't on anybody's radar and it got
> > > resurrected late March. Willy wrote a rather bigger patch-series, and
> > > review of that is what then resulted in those commits. So they may
> > > look recent, but that's just because the original patches got
> > > seriously edited down and rewritten.
> > > 
> > > That said, powerpc and s390 should at least look at maybe adding a
> > > check for the page ref in their gup paths too. Powerpc has the special
> > > gup_hugepte() case, and s390 has its own version of gup entirely. I
> > > was actually hoping the s390 guys would look at using the generic gup
> > > code.
> > > 
> > > I ruthlessly also entirely ignored MIPS, SH and sparc, since they seem
> > > largely irrelevant, partly since even theoretically this whole issue
> > > needs a _lot_ of memory.
> > > 
> > > Michael, Martin, see commit 6b3a70773630 ("Merge branch 'page-refs'
> > > (page ref overflow)"). You may or may not really care.  
> > 
> > I've now queued these patches up for the next round of stable releases,
> > as some people seem to care about these.
> > 
> > I didn't see any follow-on patches for s390 or ppc64 hit the tree for
> > these changes, am I just missing them and should also queue up a few
> > more to handle this issue on those platforms?
> 
> I fixed that with a different approach. The following two patches are
> queued for the next merge window:
> 
> d1874a0c2805 "s390/mm: make the pxd_offset functions more robust"
> 1a42010cdc26 "s390/mm: convert to the generic get_user_pages_fast code"
> 
> With these two s390 now uses the generic gup code in mm/gup.c

Nice!  Do you want me to queue those up for the stable backports once
they hit a public -rc release?

thanks,

greg k-h
