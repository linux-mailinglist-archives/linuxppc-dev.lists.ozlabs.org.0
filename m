Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 314BC48C2F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 12:16:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYlPC1L84z305F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 22:16:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hq5LE8Ka;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=jlayton@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hq5LE8Ka; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYlNY5zkWz2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 22:15:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72F93B81CB7;
 Wed, 12 Jan 2022 11:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B19C36AEA;
 Wed, 12 Jan 2022 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641986136;
 bh=RTTu6nWijk2G34RQ8PR1ea0narp9zXHqxMjZSrcL0co=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Hq5LE8KaLV3xNlfl8hONGT11QmqFJgF5ZZ53zgnsdO9DYAJ3B8+wjU1jSIWeFQ3/D
 CaFHUcDIXoppDdArCINBydMDN3XpiApt2gXzo3WfUQ9EosZsIz+fETbj6cGaJgODcQ
 RZjbF9LA/EWCKAuGks8VTqUhgG/KYGeeO094JHFcgGFdZ+k6BgYzvYRyQgp0IWuabE
 6Amw158NYWiJ4GIMYCwvGg+6cm48+dwbs/dP2cMG/t24qKzlZsJcARwnFtoH8cDJjI
 ORDJ0PD0+aoOGK4FPG7XBpY4YizNUp6zImN53U/p5QaZfcKlKu0EVwLvcYWDLCGCVV
 ObzsbCCfB0d5Q==
Message-ID: <f86483fca8b0dc68ce243ba47998ff3296a3b6f8.camel@kernel.org>
Subject: Re: [PATCH 4/5] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64
 in fcntl.h
From: Jeff Layton <jlayton@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>
Date: Wed, 12 Jan 2022 06:15:33 -0500
In-Reply-To: <CAK8P3a1ONn=FiPU3669MjBMntS-1K5bgX4pHforUsYJ7yhwZ-g@mail.gmail.com>
References: <20220111083515.502308-1-hch@lst.de>
 <20220111083515.502308-5-hch@lst.de>
 <CAK8P3a0mHC5=OOGV=sGnC9JqZWxzsJyZbTefnCtryQU3o3PY_g@mail.gmail.com>
 <20220112075609.GA4854@lst.de>
 <CAK8P3a1ONn=FiPU3669MjBMntS-1K5bgX4pHforUsYJ7yhwZ-g@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-01-12 at 09:28 +0100, Arnd Bergmann wrote:
> On Wed, Jan 12, 2022 at 8:56 AM Christoph Hellwig <hch@lst.de> wrote:
> > 
> > On Tue, Jan 11, 2022 at 04:33:30PM +0100, Arnd Bergmann wrote:
> > > This is a very subtle change to the exported UAPI header contents:
> > > On 64-bit architectures, the three unusable numbers are now always
> > > shown, rather than depending on a user-controlled symbol.
> > 
> > Well, the change is bigger and less subtle.  Before this change the
> > constants were never visible to userspace at all (except on mips),
> > because the #ifdef CONFIG_64BIT it never set for userspace builds.
> 
> I suppose you mean /always/ visible here, with that ifndef.
> 
> > > This is probably what we want here for compatibility reasons, but I think
> > > it should be explained in the changelog text, and I'd like Jeff or Bruce
> > > to comment on it as well: the alternative here would be to make the
> > > uapi definition depend on __BITS_PER_LONG==32, which is
> > > technically the right thing to do but more a of a change.
> > 
> > I can change this to #if __BITS_PER_LONG==32 || defined(__KERNEL__),
> > but it will still be change in what userspace sees.
> 
> Exactly, that is the tradeoff, which is why I'd like the flock maintainers
> to say which way they prefer. We can either do it more correctly (hiding
> the constants from user space when they are not usable), or with less
> change (removing the incorrect #ifdef). Either way sounds reasonable
> to me, I mainly care that this is explained in the changelog and that the
> maintainers are aware of the two options.
> 

I don't have a strong opinion here. If we were taking symbols away that
were previously visible to userland it would be one thing, but since
we're just adding symbols that may not have been there before, this
seems less likely to break anything.

I probably lean toward Christoph's original solution instead of keeping
the conditional definitions. It's hard to imagine there are many
programs that care whether these other symbols are defined or not.

You can add this to the original patch:

Acked-by: Jeff Layton <jlayton@kernel.org>

