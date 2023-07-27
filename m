Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 426F176511F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 12:28:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I7SQDE13;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBRnQ1F7sz3cR1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 20:28:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I7SQDE13;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBRmZ1tljz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 20:27:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9679861E1E;
	Thu, 27 Jul 2023 10:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FC3C433C8;
	Thu, 27 Jul 2023 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690453676;
	bh=deaD8pujkpTtajMkrzG6FDy9HzkESG69/qNzMXZtjw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7SQDE13fzKBcFUp5ePMk9YUxZ5LwkMwJzEhJh5gygi5y3Ao4HYQUhpzqZ+RcAGng
	 bn4vp/EfbLNeCzrahJPNrwO1OBRujz9xBo7+Gwbo3boim4OhzbOb3qoiVHBiAMEaWJ
	 PUG9ntl7QrNnL9tqEWTP/FDqYRjBLv6Pe+hC4010c/XsSyQFDc2T5KRE4F0CEfvhIP
	 4kdpLRFtj8U5bMLrtJSUPNEcwdIVIx3V75HfNd2zboybu6ykt1PDPjB308ZqP7GtZB
	 ns0n3LOD64u1iaWvsMh+b+uKRfMRf5JlVFDa1qQYJ082NdSiyLNQ81rIjYiYhPr8X+
	 TOPX0LSqgemIg==
Date: Thu, 27 Jul 2023 12:27:42 +0200
From: Christian Brauner <brauner@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: Add fchmodat2() - or add a more general syscall?
Message-ID: <20230727-kassieren-aneinander-052b18a84546@brauner>
References: <cover.1689092120.git.legion@kernel.org>
 <cover.1689074739.git.legion@kernel.org>
 <104971.1690300714@warthog.procyon.org.uk>
 <20230727035710.GA15127@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230727035710.GA15127@sol.localdomain>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, James.Bottomley@hansenpartnership.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-api@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, fweimer@redhat.com, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, David Howells <dhowells@redhat.com>, monstr@monstr.eu, tony.luck@i
 ntel.com, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, Alexey Gladkov <legion@kernel.org>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 26, 2023 at 08:57:10PM -0700, Eric Biggers wrote:
> On Tue, Jul 25, 2023 at 04:58:34PM +0100, David Howells wrote:
> > Rather than adding a fchmodat2() syscall, should we add a "set_file_attrs()"
> > syscall that takes a mask and allows you to set a bunch of stuff all in one
> > go?  Basically, an interface to notify_change() in the kernel that would allow
> > several stats to be set atomically.  This might be of particular interest to
> > network filesystems.
> > 
> > David
> > 
> 
> fchmodat2() is a simple addition that fits well with the existing syscalls.
> It fixes an oversight in fchmodat().
> 
> IMO we should just add fchmodat2(), and not get sidetracked by trying to add
> some super-generalized syscall instead.  That can always be done later.

Agreed.
