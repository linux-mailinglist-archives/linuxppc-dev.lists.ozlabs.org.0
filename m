Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6467E763DAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 19:31:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB1Cj2PPgz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 03:31:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=libc.org (client-ip=216.12.86.13; helo=brightrain.aerifal.cx; envelope-from=dalias@libc.org; receiver=lists.ozlabs.org)
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB1C83K7yz2yGX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 03:30:59 +1000 (AEST)
Date: Tue, 11 Jul 2023 22:42:44 -0400
From: Rich Felker <dalias@libc.org>
To: Alexey Gladkov <legion@kernel.org>
Subject: Re: [PATCH v4 0/5] Add a new fchmodat2() syscall
Message-ID: <20230712024243.GX20050@brightrain.aerifal.cx>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689092120.git.legion@kernel.org>
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
Cc: kim.phillips@arm.com, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, jhogan@kernel.org, mattst88@gmail.com, linux-mips@vger.kernel.org, fweimer@redhat.com, Arnd Bergmann <arnd@arndb.de>, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, James.Bottomley@HansenPartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kern
 el.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 06:16:02PM +0200, Alexey Gladkov wrote:
> In glibc, the fchmodat(3) function has a flags argument according to the
> POSIX specification [1], but kernel syscalls has no such argument.
> Therefore, libc implementations do workarounds using /proc. However,
> this requires procfs to be mounted and accessible.
> 
> This patch set adds fchmodat2(), a new syscall. The syscall allows to
> pass the AT_SYMLINK_NOFOLLOW flag to disable LOOKUP_FOLLOW. In all other
> respects, this syscall is no different from fchmodat().
> 
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/chmod.html
> 
> Changes since v3 [cover.1689074739.git.legion@kernel.org]:
> 
> * Rebased to master because a new syscall has appeared in master.
> * Increased __NR_compat_syscalls as pointed out by Arnd Bergmann.
> * Syscall renamed fchmodat4 -> fchmodat2 as suggested by Christian Brauner.
> * Returned do_fchmodat4() the original name. We don't need to version
>   internal functions.
> * Fixed warnings found by checkpatch.pl.
> 
> Changes since v2 [20190717012719.5524-1-palmer@sifive.com]:
> 
> * Rebased to master.
> * The lookup_flags passed to sys_fchmodat4 as suggested by Al Viro.
> * Selftest added.
> 
> Changes since v1 [20190531191204.4044-1-palmer@sifive.com]:
> 
> * All architectures are now supported, which support squashed into a
>   single patch.
> * The do_fchmodat() helper function has been removed, in favor of directly
>   calling do_fchmodat4().
> * The patches are based on 5.2 instead of 5.1.

It's good to see this moving forward. I originally proposed this in a
patch submitted in 2020. I suspect implementation details have changed
since then, but it might make sense to look back at that discussion if
nobody has done so yet (apologies if this was already done and I
missed it) to make sure nothing is overlooked -- I remember there were
some subtleties with what fs backends might try to do with chmod on
symlinks. My proposed commit message also documented a lot of the
history of the issue that might be useful to have as context.

https://lore.kernel.org/all/20200910170256.GK3265@brightrain.aerifal.cx/T/

Rich
