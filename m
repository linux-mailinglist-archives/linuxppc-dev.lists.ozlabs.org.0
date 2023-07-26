Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4C77637A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 15:32:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iun9Va1e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9vvL2K7cz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 23:31:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iun9Va1e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9vtP3hNSz2yVl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 23:31:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1809D61A3D;
	Wed, 26 Jul 2023 13:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7971C433C7;
	Wed, 26 Jul 2023 13:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690378264;
	bh=HS5sUeLSMwNW9P5zkSBnlwFMDf5b4OM9IVMq33WbW+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iun9Va1e08ezdxo92/bg5MGdihHdrBrDXCPN2ZuWEZMFn0+OcEXanuIHv+EfWsuNU
	 L+Hxeq52/Ccp23FMh5y1r628rwDUn1FsDYgXV4giQWpOryyyH6Wz7U1/JH10rPMXbb
	 Jiny/AP6Rjp/r+N2q9Fk7zju31hIIvg2lQlqj+b+9vq+HbD2Z1tLgaskjEpsllb4Ql
	 VgHQzVKaqbMr879rRkud1caFzU2c3Fv3yxztgXx3GhJMZ90I0OKFAjGqdqfapsMwg9
	 ijZCYka6GelxzX2yem0uLWMKJaHqScGsLr30PfErtdYqG0FS1DFvWLCP1t/H0ZSwer
	 Mo5PnIaBy2w0w==
Date: Wed, 26 Jul 2023 15:30:51 +0200
From: Christian Brauner <brauner@kernel.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: Add fchmodat2() - or add a more general syscall?
Message-ID: <20230726-arztbesuch-division-ee0343632e3c@brauner>
References: <87fs5c3rbl.fsf@oldenburg3.str.redhat.com>
 <cover.1689092120.git.legion@kernel.org>
 <cover.1689074739.git.legion@kernel.org>
 <104971.1690300714@warthog.procyon.org.uk>
 <107290.1690310391@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <107290.1690310391@warthog.procyon.org.uk>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, James.Bottomley@HansenPartnership.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-api@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, axboe@kernel.dk, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, Florian Weimer <fweimer@redhat.com>, monstr@monstr.eu, tony.luck@intel.com
 , linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, bp@alien8.de, Alexey Gladkov <legion@kernel.org>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 25, 2023 at 07:39:51PM +0100, David Howells wrote:
> Florian Weimer <fweimer@redhat.com> wrote:
> 
> > > Rather than adding a fchmodat2() syscall, should we add a
> > > "set_file_attrs()" syscall that takes a mask and allows you to set a bunch
> > > of stuff all in one go?  Basically, an interface to notify_change() in the

That system call would likely be blocked in seccomp sandboxes completely
as seccomp cannot filter structs. I don't consider this an argument to
block new good functionality in general as that would mean arbitrarily
limiting us but it is something to keep in mind. If there's additional
benefit other than just being able to set mutliple values at once then
yeah might be something to discuss.

> > > kernel that would allow several stats to be set atomically.  This might be
> > > of particular interest to network filesystems.
> > 
> > Do you mean atomically as in compare-and-swap (update only if old values
> > match), or just a way to update multiple file attributes with a single
> > system call?
> 
> I was thinking more in terms of the latter.  AFAIK, there aren't any network
> filesystems support a CAS interface on file attributes like that.  To be able
> to do a CAS operation, we'd need to pass in the old values as well as the new.
> 
> Another thing we could look at is doing "create_and_set_attrs()", possibly
> allowing it to take a list of xattrs also.

That would likely require variable sized pointers in a struct which is
something we really try to stay away from. I also think it's not a good
idea to lump xattrs toegether with generic file attributes. They should
remain a separate api imho.
