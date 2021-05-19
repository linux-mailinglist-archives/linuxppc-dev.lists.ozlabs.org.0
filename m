Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B6389305
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 17:52:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flcnv5smHz30CZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 01:52:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
X-Greylist: delayed 910 seconds by postgrey-1.36 at boromir;
 Thu, 20 May 2021 01:52:13 AEST
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlcnT3wXBz2xvT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 01:52:11 +1000 (AEST)
Date: Wed, 19 May 2021 11:36:55 -0400
From: Rich Felker <dalias@libc.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [musl] Re: Linux powerpc new system call instruction and ABI
Message-ID: <20210519153652.GQ2546@brightrain.aerifal.cx>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
 <1621410291.c7si38sa9q.astroid@bobo.none>
 <fb9b6a6099855bd00efc6ffe540ccad14dd9a365.camel@infinera.com>
 <1621413143.oec64jaci5.astroid@bobo.none>
 <20210519143836.GJ10366@gate.crashing.org>
 <11d62aa2488e51ec00fe77f24a1d7cdcc21af0b8.camel@infinera.com>
 <20210519152205.GL10366@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519152205.GL10366@gate.crashing.org>
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

On Wed, May 19, 2021 at 10:22:05AM -0500, Segher Boessenkool wrote:
> On Wed, May 19, 2021 at 03:06:49PM +0000, Joakim Tjernlund wrote:
> > On Wed, 2021-05-19 at 09:38 -0500, Segher Boessenkool wrote:
> > > On Wed, May 19, 2021 at 06:42:40PM +1000, Nicholas Piggin wrote:
> > > > Excerpts from Joakim Tjernlund's message of May 19, 2021 6:08 pm:
> > > > > I always figured the ppc way was superior. It begs the question if not the other archs should
> > > > > change instead?
> > > > 
> > > > It is superior in some ways, not enough to be worth being different.
> > > 
> > > The PowerPC syscall ABI *requires* using cr0.3 for indicating errors,
> > > you will have to do that whether you conflate the concepts of return
> > > code and error indicator or not!
> > > 
> > > > Other archs are unlikely to change because it would be painful for
> > > > not much benefit.
> > > 
> > > Other archs cannot easily change for much the same reason :-)
> > 
> > Really? I figured you could just add extra error indication in kernel syscall I/F.
> > Eventually user space could migrate to the new indication.
> 
> You seem to assume all user space uses glibc, or *any* libc even?  This
> is false.  Some programs do system calls directly.  Do not break the
> kernel ABI :-)

Even if it were easy to change, the old ppc ABI with a separate error
indicator is much worse to use. In musl we paper over archs that do
this silliness by converting to a normal negated errno code. There are
literally no syscalls that need the ability to return negative values
in addition to error codes; historically there were one or two (I only
recall one fcntl command) but there were ways to disambiguate and
they're only fallbacks for ancient kernels nowadays, if used at all.

Rich
