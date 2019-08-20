Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD7B9667A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 18:34:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cbwn26JJzDrP7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 02:34:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="eDe8D8mO"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cbqw5QBFzDrMJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 02:30:20 +1000 (AEST)
Received: from localhost (wsip-184-188-36-2.sd.sd.cox.net [184.188.36.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C9CD22CE3;
 Tue, 20 Aug 2019 16:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566318617;
 bh=KymnAe727ILy87L8EAf1U8mLv+nBZNNdGy5iODp5MOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eDe8D8mOkxt6Kz0TpZGa8O/1CtWzHWy0JCS9J71kHEp4zEqh4FTOMlBS58n/d2Agm
 IV1vDDP+f1MMVB2ItdJkHXGpcR8dZvNBxSLPp/bvt4FA6OIsDYcacj62MjHGmr2TkB
 3yctVmNKKcLVNmORtLwVOdDuVYwVJLTXKgrE91ek=
Date: Tue, 20 Aug 2019 09:30:17 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Allow flush_(inval_)dcache_range to work across
 ranges >4GB
Message-ID: <20190820163017.GG8214@kroah.com>
References: <20190815045543.16325-1-alastair@au1.ibm.com>
 <20190815071924.GA26670@kroah.com>
 <87mug97uo1.fsf@concordia.ellerman.id.au>
 <20190816071412.GF1368@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816071412.GF1368@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Alastair D'Silva <alastair@au1.ibm.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 alastair@d-silva.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 16, 2019 at 09:14:12AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Aug 16, 2019 at 11:42:22AM +1000, Michael Ellerman wrote:
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> > > On Thu, Aug 15, 2019 at 02:55:42PM +1000, Alastair D'Silva wrote:
> > >> From: Alastair D'Silva <alastair@d-silva.org>
> > >> 
> > >> Heads Up: This patch cannot be submitted to Linus's tree, as the affected
> > >> assembler functions have already been converted to C.
> > 
> > That was done in upstream commit:
> > 
> > 22e9c88d486a ("powerpc/64: reuse PPC32 static inline flush_dcache_range()")
> > 
> > Which is a larger change that we don't want to backport. This patch is a
> > minimal fix for stable trees.
> > 
> > 
> > >> When calling flush_(inval_)dcache_range with a size >4GB, we were masking
> > >> off the upper 32 bits, so we would incorrectly flush a range smaller
> > >> than intended.
> > >> 
> > >> This patch replaces the 32 bit shifts with 64 bit ones, so that
> > >> the full size is accounted for.
> > >> 
> > >> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > >> ---
> > >>  arch/powerpc/kernel/misc_64.S | 4 ++--
> > >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> > 
> > > <formletter>
> > >
> > > This is not the correct way to submit patches for inclusion in the
> > > stable kernel tree.  Please read:
> > >     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> > > for how to do this properly.
> > >
> > > </formletter>
> > 
> > Hi Greg,
> > 
> > This is "option 3", submit the patch directly, and the patch "deviates
> > from the original upstream patch" because the upstream patch was a
> > wholesale conversion from asm to C.
> > 
> > This patch applies cleanly to v4.14 and v4.19.
> > 
> > The change log should have mentioned which upstream patch it is not a
> > backport of, is there anything else we should have done differently to
> > avoid the formletter bot :)
> 
> That is exactly what you should have done.  It needs to be VERY explicit
> as to why this is being submitted different from what upstream did, and
> to what trees it needs to go to and who is going to be responsible for
> when it breaks.  And it will break :)

And it needs to be done before I can apply it, I've dropped this thread
from my queue now.

thanks,

greg k-h
