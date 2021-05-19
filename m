Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B551389283
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 17:25:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlcC00TNWz3bsT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 01:25:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FlcBf1Z00z2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 01:25:29 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14JFM7FS030436;
 Wed, 19 May 2021 10:22:07 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 14JFM5pa030435;
 Wed, 19 May 2021 10:22:05 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 19 May 2021 10:22:05 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Subject: Re: Linux powerpc new system call instruction and ABI
Message-ID: <20210519152205.GL10366@gate.crashing.org>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
 <1621410291.c7si38sa9q.astroid@bobo.none>
 <fb9b6a6099855bd00efc6ffe540ccad14dd9a365.camel@infinera.com>
 <1621413143.oec64jaci5.astroid@bobo.none>
 <20210519143836.GJ10366@gate.crashing.org>
 <11d62aa2488e51ec00fe77f24a1d7cdcc21af0b8.camel@infinera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11d62aa2488e51ec00fe77f24a1d7cdcc21af0b8.camel@infinera.com>
User-Agent: Mutt/1.4.2.3i
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

On Wed, May 19, 2021 at 03:06:49PM +0000, Joakim Tjernlund wrote:
> On Wed, 2021-05-19 at 09:38 -0500, Segher Boessenkool wrote:
> > On Wed, May 19, 2021 at 06:42:40PM +1000, Nicholas Piggin wrote:
> > > Excerpts from Joakim Tjernlund's message of May 19, 2021 6:08 pm:
> > > > I always figured the ppc way was superior. It begs the question if not the other archs should
> > > > change instead?
> > > 
> > > It is superior in some ways, not enough to be worth being different.
> > 
> > The PowerPC syscall ABI *requires* using cr0.3 for indicating errors,
> > you will have to do that whether you conflate the concepts of return
> > code and error indicator or not!
> > 
> > > Other archs are unlikely to change because it would be painful for
> > > not much benefit.
> > 
> > Other archs cannot easily change for much the same reason :-)
> 
> Really? I figured you could just add extra error indication in kernel syscall I/F.
> Eventually user space could migrate to the new indication.

You seem to assume all user space uses glibc, or *any* libc even?  This
is false.  Some programs do system calls directly.  Do not break the
kernel ABI :-)


Segher
