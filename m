Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D5A389A13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 01:49:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlqMq43Twz3bsC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 09:49:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlqMS4zgdz2xv6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 09:48:50 +1000 (AEST)
Date: Wed, 19 May 2021 19:48:47 -0400
From: Rich Felker <dalias@libc.org>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Subject: Re: [musl] Re: Linux powerpc new system call instruction and ABI
Message-ID: <20210519234846.GS2546@brightrain.aerifal.cx>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
 <1621410291.c7si38sa9q.astroid@bobo.none>
 <fb9b6a6099855bd00efc6ffe540ccad14dd9a365.camel@infinera.com>
 <1621413143.oec64jaci5.astroid@bobo.none>
 <20210519143836.GJ10366@gate.crashing.org>
 <11d62aa2488e51ec00fe77f24a1d7cdcc21af0b8.camel@infinera.com>
 <20210519152205.GL10366@gate.crashing.org>
 <adec4377144a44b6f9ddd10c1b5256b80c9ceb50.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adec4377144a44b6f9ddd10c1b5256b80c9ceb50.camel@infinera.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: "musl@lists.openwall.com" <musl@lists.openwall.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "ldv@altlinux.org" <ldv@altlinux.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 06:09:25PM +0000, Joakim Tjernlund wrote:
> On Wed, 2021-05-19 at 10:22 -0500, Segher Boessenkool wrote:
> > On Wed, May 19, 2021 at 03:06:49PM +0000, Joakim Tjernlund wrote:
> > > On Wed, 2021-05-19 at 09:38 -0500, Segher Boessenkool wrote:
> > > > On Wed, May 19, 2021 at 06:42:40PM +1000, Nicholas Piggin wrote:
> > > > > Excerpts from Joakim Tjernlund's message of May 19, 2021 6:08 pm:
> > > > > > I always figured the ppc way was superior. It begs the question if not the other archs should
> > > > > > change instead?
> > > > > 
> > > > > It is superior in some ways, not enough to be worth being different.
> > > > 
> > > > The PowerPC syscall ABI *requires* using cr0.3 for indicating errors,
> > > > you will have to do that whether you conflate the concepts of return
> > > > code and error indicator or not!
> > > > 
> > > > > Other archs are unlikely to change because it would be painful for
> > > > > not much benefit.
> > > > 
> > > > Other archs cannot easily change for much the same reason :-)
> > > 
> > > Really? I figured you could just add extra error indication in kernel syscall I/F.
> > > Eventually user space could migrate to the new indication.
> > 
> > You seem to assume all user space uses glibc, or *any* libc even?  This
> > is false.  Some programs do system calls directly.  Do not break the
> > kernel ABI :-)
> 
> Adding an extra indicator does not break ABI, does it ?

It does, because the old ABI on most archs has no clobbers except the
return value register. Some archs though have additional
syscall-clobbered regs that could be repurposed as extra return
values, but you could only rely on them being meaningful after probing
for a kernel that speaks the new variant. This just makes things more
complicated, not more useful.

> W.r.t breaking ABI, isn't that what PowerPC is trying to do with the new syscall I/F? 

No, it's a new independent interface.

Rich
