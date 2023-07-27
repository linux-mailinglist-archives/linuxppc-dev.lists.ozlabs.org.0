Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6C1765FF6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 00:52:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBmH81s4jz3cVW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 08:52:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=libc.org (client-ip=216.12.86.13; helo=brightrain.aerifal.cx; envelope-from=dalias@libc.org; receiver=lists.ozlabs.org)
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBcml27D0z3cR1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 03:13:41 +1000 (AEST)
Date: Thu, 27 Jul 2023 13:13:37 -0400
From: "dalias@libc.org" <dalias@libc.org>
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Message-ID: <20230727171336.GC20050@brightrain.aerifal.cx>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
 <87ila5jp2y.fsf@igel.home>
 <20230727-zerrt-leitmotiv-9e8b60abf690@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727-zerrt-leitmotiv-9e8b60abf690@brauner>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

On Thu, Jul 27, 2023 at 07:02:53PM +0200, Christian Brauner wrote:
> On Thu, Jul 27, 2023 at 06:28:53PM +0200, Andreas Schwab wrote:
> > On Jul 27 2023, David Laight wrote:
> > 
> > > From: Aleksa Sarai
> > >> Sent: 25 July 2023 17:36
> > > ...
> > >> We almost certainly want to support AT_EMPTY_PATH at the same time.
> > >> Otherwise userspace will still need to go through /proc when trying to
> > >> chmod a file handle they have.
> > >
> > > That can't be allowed.
> > 
> > IIUC, fchmodat2(fd, "", m, AT_EMPTY_PATH) is equivalent to fchmod(fd,
> > m).  With that, new architectures only need to implement the fchmodat2
> > syscall to cover all chmod variants.
> 
> There's a difference though as fchmod() doesn't work with O_PATH file
> descriptors while AT_EMPTY_PATH does. Similar to how fchown() doesn't
> work with O_PATH file descriptors.
> 
> However, we do allow AT_EMPTY_PATH with fchownat() so there's no reason
> to not allow it for fchmodat2().
> 
> But it's a bit of a shame that O_PATH looks less and less like O_PATH.
> It came from can-do-barely-anything to can-do-quite-a-lot-of-things over
> the years.
> 
> In any case, AT_EMPTY_PATH for fchmodat2() can be an additional patch on
> top.

From a standpoint of implementing O_SEARCH/O_EXEC using it, I don't
see any reason fchown/fchmod should not work on O_PATH file
descriptors. And indeed when you have procfs available to emulate them
via procfs, it already does. So I don't see this as unwanted
functionality or an access control regression. I see it as things
behaving as expected.

Semantically, O_PATH is a reference to the inode, not to the dirent.
So there is no reason you should not be able to do things that need
permission to the inode (changing permissions on it) rather than to
the dirent (renaming/moving).

Rich
