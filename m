Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA37644B0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 05:58:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EZdgMDJN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBH6m0Mhgz3cC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 13:58:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EZdgMDJN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBH5s6f3fz2yVF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 13:57:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7BE4261CF1;
	Thu, 27 Jul 2023 03:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333DBC433C8;
	Thu, 27 Jul 2023 03:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690430233;
	bh=2LZQxDDrrueBXO8BVcvN88sdAiFgW61YpvmWoV4rusk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZdgMDJNvWHpTU/TbbeuJIRdZELQC4io44o7BRZjr/qEbqXP+mOb3SpnPc3GnzZUJ
	 6/89F+qI71eFF4iUju0DDwCRfWxlmyu525kPI64StVeMn3g22mxzWiFX5SyeyJUOvC
	 7vpMprEDvWDPdxrLmbFWPjI1sopKugt5VjA6tOeYBWY7dbKLYXy1ooOebTmGv3ACSj
	 fFwMNdhI5gT7lq20ftyAy9B2B7F0Kx3men5CLDs/URmKMEbxn6qNQpfOdz4+yFLRKM
	 U8TEEb4JSsQRcj9xreGkiiwQXGZr6UG1WIoN/6+4R39C1Goqdd0J+NCOS+t8EZnNCl
	 LnOw3z+jPm6bA==
Date: Wed, 26 Jul 2023 20:57:10 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: Add fchmodat2() - or add a more general syscall?
Message-ID: <20230727035710.GA15127@sol.localdomain>
References: <cover.1689092120.git.legion@kernel.org>
 <cover.1689074739.git.legion@kernel.org>
 <104971.1690300714@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <104971.1690300714@warthog.procyon.org.uk>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, stefan@agner.ch, ldv@altlinux.org, James.Bottomley@hansenpartnership.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-api@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, fweimer@redhat.com, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linuxppc-dev@lis
 ts.ozlabs.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, peterz@infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, bp@alien8.de, Alexey Gladkov <legion@kernel.org>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 25, 2023 at 04:58:34PM +0100, David Howells wrote:
> Rather than adding a fchmodat2() syscall, should we add a "set_file_attrs()"
> syscall that takes a mask and allows you to set a bunch of stuff all in one
> go?  Basically, an interface to notify_change() in the kernel that would allow
> several stats to be set atomically.  This might be of particular interest to
> network filesystems.
> 
> David
> 

fchmodat2() is a simple addition that fits well with the existing syscalls.
It fixes an oversight in fchmodat().

IMO we should just add fchmodat2(), and not get sidetracked by trying to add
some super-generalized syscall instead.  That can always be done later.

- Eric
