Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45501765FF7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 00:52:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VxumH8hG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBmJ21HQCz3cZC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 08:52:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VxumH8hG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBdHB5SS5z2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 03:36:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A150861EF1;
	Thu, 27 Jul 2023 17:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD2AC433C8;
	Thu, 27 Jul 2023 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690479396;
	bh=iU7zvXpvxPSg5KiGe2n535PFFdPoC8EIhqciU1h+3Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VxumH8hGN053L+FyKWAl7yNCuep6zB52SgRtI5W/3VmZXm+mmZ4jBeoyIQx8UEPBz
	 KB2g3ckpL1rFkA8SxtOo/2sVYVEfDaKNkKBz1lQ8P2ADzxBiSuYz1s4+mgNIaH8PHC
	 mgTZjyPGv647aIhCLp9wnBJ2zOHZU59iFOFLNAEflHY4ZPUF7p4ROHHXQAz2E75cTe
	 Vin+UGvlA56e4nxESt9X2PQkCsoXkmtj+oV/UF3bLR5Ny1I9LiKjhW+1r+2WJ/O6Yd
	 TgUSACO81o4AuGEsdvCy68dJhSXgXujDC+IFg4xwGOBHFACldMWcZVQg7TP9JlZNoG
	 348a+hccYCeEA==
Date: Thu, 27 Jul 2023 19:36:21 +0200
From: Christian Brauner <brauner@kernel.org>
To: "dalias@libc.org" <dalias@libc.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Message-ID: <20230727-boxte-wohnviertel-74b8541d27ec@brauner>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
 <87ila5jp2y.fsf@igel.home>
 <20230727-zerrt-leitmotiv-9e8b60abf690@brauner>
 <20230727171336.GC20050@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230727171336.GC20050@brightrain.aerifal.cx>
X-Mailman-Approved-At: Fri, 28 Jul 2023 08:48:48 +1000
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
Cc: "kim.phillips@arm.com" <kim.phillips@arm.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>, "stefan@agner.ch" <stefan@agner.ch>, "ldv@altlinux.org" <ldv@altlinux.org>, "dhowells@redhat.com" <dhowells@redhat.com>, Andreas Schwab <schwab@linux-m68k.org>, "deepa.kernel@gmail.com" <deepa.kernel@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "paulus@samba.org" <paulus@samba.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "hare@suse.com" <hare@suse.com>, "fweimer@redhat.com" <fweimer@redhat.com>, "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>, "deller@gmx.de" <deller@gmx.de>, "x8
 6@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "mingo@redhat.com" <mingo@redhat.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "jhogan@kernel.org" <jhogan@kernel.org>, "mattst88@gmail.com" <mattst88@gmail.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "fenghua.yu@intel.com" <fenghua.yu@intel.com>, "tycho@tycho.ws" <tycho@tycho.ws>, Arnd Bergmann <arnd@arndb.de>, "glebfm@altlinux.org" <glebfm@altlinux.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "acme@kernel.org" <acme@kernel.org>, 'Aleksa Sarai' <cyphar@cyphar.com>, "bp@alien8.de" <bp@alien8.de>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "luto@kernel.org" <luto@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "christian@brauner.io" <christian@brauner.io>, "axboe@kernel.dk" <axboe@kernel.dk>, "James
 .Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "monstr@monstr.eu" <monstr@monstr.eu>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "peterz@infradead.org" <peterz@infradead.org>, David Laight <David.Laight@ACULAB.COM>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, Alexey Gladkov <legion@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 27, 2023 at 01:13:37PM -0400, dalias@libc.org wrote:
> On Thu, Jul 27, 2023 at 07:02:53PM +0200, Christian Brauner wrote:
> > On Thu, Jul 27, 2023 at 06:28:53PM +0200, Andreas Schwab wrote:
> > > On Jul 27 2023, David Laight wrote:
> > > 
> > > > From: Aleksa Sarai
> > > >> Sent: 25 July 2023 17:36
> > > > ...
> > > >> We almost certainly want to support AT_EMPTY_PATH at the same time.
> > > >> Otherwise userspace will still need to go through /proc when trying to
> > > >> chmod a file handle they have.
> > > >
> > > > That can't be allowed.
> > > 
> > > IIUC, fchmodat2(fd, "", m, AT_EMPTY_PATH) is equivalent to fchmod(fd,
> > > m).  With that, new architectures only need to implement the fchmodat2
> > > syscall to cover all chmod variants.
> > 
> > There's a difference though as fchmod() doesn't work with O_PATH file
> > descriptors while AT_EMPTY_PATH does. Similar to how fchown() doesn't
> > work with O_PATH file descriptors.
> > 
> > However, we do allow AT_EMPTY_PATH with fchownat() so there's no reason
> > to not allow it for fchmodat2().
> > 
> > But it's a bit of a shame that O_PATH looks less and less like O_PATH.
> > It came from can-do-barely-anything to can-do-quite-a-lot-of-things over
> > the years.
> > 
> > In any case, AT_EMPTY_PATH for fchmodat2() can be an additional patch on
> > top.
> 
> From a standpoint of implementing O_SEARCH/O_EXEC using it, I don't
> see any reason fchown/fchmod should not work on O_PATH file
> descriptors. And indeed when you have procfs available to emulate them
> via procfs, it already does. So I don't see this as unwanted

I'm really not talking about the fact that proc is a giant loophole for
basically everyhing related to O_PATH and reopening fds.

I'm saying that both fchmod() and fchown() don't work on O_PATH fds.
They explicitly reject them.

AT_EMPTY_PATH and therefore O_PATH for fchmodat2() is fine given that we
do it for fchownat() already.
