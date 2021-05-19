Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E8A38919D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 16:42:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlbDz0nLXz3021
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 00:42:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FlbDf0SSpz2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 00:42:09 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14JEceF1026439;
 Wed, 19 May 2021 09:38:40 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 14JEcaGd026433;
 Wed, 19 May 2021 09:38:36 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 19 May 2021 09:38:36 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
Message-ID: <20210519143836.GJ10366@gate.crashing.org>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
 <1621410291.c7si38sa9q.astroid@bobo.none>
 <fb9b6a6099855bd00efc6ffe540ccad14dd9a365.camel@infinera.com>
 <1621413143.oec64jaci5.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621413143.oec64jaci5.astroid@bobo.none>
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
 "ldv@altlinux.org" <ldv@altlinux.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 06:42:40PM +1000, Nicholas Piggin wrote:
> Excerpts from Joakim Tjernlund's message of May 19, 2021 6:08 pm:
> > I always figured the ppc way was superior. It begs the question if not the other archs should
> > change instead?
> 
> It is superior in some ways, not enough to be worth being different.

The PowerPC syscall ABI *requires* using cr0.3 for indicating errors,
you will have to do that whether you conflate the concepts of return
code and error indicator or not!

> Other archs are unlikely to change because it would be painful for
> not much benefit.

Other archs cannot easily change for much the same reason :-)

> New system calls just should be made to not return
> error numbers.

Which sometimes is a difficult / non-natural / clumsy thing to do.


Segher
