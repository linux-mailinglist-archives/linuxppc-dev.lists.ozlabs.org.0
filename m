Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C84D74F867
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:32:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P4rG0DrQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0rcH1tWpz3cHp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 05:32:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P4rG0DrQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0hlh24Y0z2y9d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 23:38:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26B25614B0;
	Tue, 11 Jul 2023 13:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA99C433C7;
	Tue, 11 Jul 2023 13:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689082700;
	bh=MjkY+PryFAt8G+OdjO9LolQHYDzlX27UqcYtpMYnVwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4rG0DrQuYuh1KI2SaGRXPxMUodnyuoYxdgPkn1OMlHHieR1kS9r/CQh42NQdCEvi
	 jezSVyuSCMeYDxZrU2qgssSXxMITcDN0wrI2LdTTXRxdvNf91UYOmZ/oeiA0SkLMOm
	 ToPJ01f8m0qnXoBuvUPupXyZM8q39wgUuDsJ0IPd2i86nWZO8OaQ0Z1yj2zbd4H3fH
	 d4apNZ3SHU+N4XnwC2YHNvSjMrA6Ly/31Wexx13nYBwFVH2whpKLnzaVfdu9jfzTjD
	 b8h/GZBzFq03hxHoLJ1T4mgHcoT1KaxayCxO/eDkShAdahq/1VQ+nx1L6a75mBKsMI
	 HsKJyRD7qNvow==
Date: Tue, 11 Jul 2023 15:38:03 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH v3 5/5] selftests: add fchmodat4(2) selftest
Message-ID: <ZK1bOxynxdVHR1Fu@example.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <c3606ec38227d921fa8a3e11613ffdb2f3ea7636.1689074739.git.legion@kernel.org>
 <87pm4ybqct.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pm4ybqct.fsf@oldenburg.str.redhat.com>
X-Mailman-Approved-At: Wed, 12 Jul 2023 05:30:07 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, palmer@sifive.com, heiko.carstens@de.ibm.com, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org, firoz.khan@linaro.org, mattst88@gmail.com, linux-mips@vger.kernel.org, fenghua.yu@intel.com, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, schwidefsky@de.ibm.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linu
 tronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk, James.Bottomley@hansenpartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 02:10:58PM +0200, Florian Weimer wrote:
> * Alexey Gladkov:
> 
> > The test marks as skipped if a syscall with the AT_SYMLINK_NOFOLLOW flag
> > fails. This is because not all filesystems support changing the mode
> > bits of symlinks properly. These filesystems return an error but change
> > the mode bits:
> >
> > newfstatat(4, "regfile", {st_mode=S_IFREG|0640, st_size=0, ...}, AT_SYMLINK_NOFOLLOW) = 0
> > newfstatat(4, "symlink", {st_mode=S_IFLNK|0777, st_size=7, ...}, AT_SYMLINK_NOFOLLOW) = 0
> > syscall_0x1c3(0x4, 0x55fa1f244396, 0x180, 0x100, 0x55fa1f24438e, 0x34) = -1 EOPNOTSUPP (Operation not supported)
> > newfstatat(4, "regfile", {st_mode=S_IFREG|0640, st_size=0, ...}, AT_SYMLINK_NOFOLLOW) = 0
> >
> > This happens with btrfs and xfs:
> >
> >  $ /kernel/tools/testing/selftests/fchmodat4/fchmodat4_test
> >  TAP version 13
> >  1..1
> >  ok 1 # SKIP fchmodat4(symlink)
> >  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0
> >
> >  $ stat /tmp/ksft-fchmodat4.*/symlink
> >    File: /tmp/ksft-fchmodat4.3NCqlE/symlink -> regfile
> >    Size: 7               Blocks: 0          IO Block: 4096   symbolic link
> >  Device: 7,0     Inode: 133         Links: 1
> >  Access: (0600/lrw-------)  Uid: (    0/    root)   Gid: (    0/    root)
> >
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> 
> This looks like a bug in those file systems?

To me this looks like a bug. I'm fine if the operation ends with
EOPNOTSUPP, but in that case the mode bits shouldn't change.

> As an extra test, “echo 3 > /proc/sys/vm/drop_caches” sometimes has
> strange effects in such cases because the bits are not actually stored
> on disk, only in the dentry cache.

tmpfs
syscall_0x1c3(0xffffff9c, 0x7ffd58758574, 0, 0x100, 0x7f6cf18adc70, 0x7ffd58756ad8) = 0
+++ exited with 0 +++
l--------- 1 root root 1 Jul 11 16:36 /tmp/dir/link -> f
=== dropping caches ===
l--------- 1 root root 1 Jul 11 16:36 /tmp/dir/link -> f

ext4
syscall_0x1c3(0xffffff9c, 0x7ffedfdb4574, 0, 0x100, 0x7f7f40b45c70, 0x7ffedfdb3ae8) = -1 EOPNOTSUPP (Operation not supported)
+++ exited with 1 +++
l--------- 1 root root 1 Jul 11 16:36 /tmp/dir/link -> f
=== dropping caches ===
l--------- 1 root root 1 Jul 11 16:36 /tmp/dir/link -> f

xfs
syscall_0x1c3(0xffffff9c, 0x7ffcd03ce574, 0, 0x100, 0x7ff2f2980c70, 0x7ffcd03cdd38) = -1 EOPNOTSUPP (Operation not supported)
+++ exited with 1 +++
l--------- 1 root root 1 Jul 11 16:36 /tmp/dir/link -> f
=== dropping caches ===
l--------- 1 root root 1 Jul 11 16:36 /tmp/dir/link -> f

btrfs
syscall_0x1c3(0xffffff9c, 0x7fff13d2e574, 0, 0x100, 0x7f9b67f59c70, 0x7fff13d2ca88) = -1 EOPNOTSUPP (Operation not supported)
+++ exited with 1 +++
l--------- 1 root root 1 Jul 11 16:36 /tmp/dir/link -> f
=== dropping caches ===
l--------- 1 root root 1 Jul 11 16:36 /tmp/dir/link -> f

reiserfs
syscall_0x1c3(0xffffff9c, 0x7ffdf75af574, 0, 0x100, 0x7f7ad0634c70, 0x7ffdf75ae478) = 0
+++ exited with 0 +++
l--------- 1 root root 1 Jul 11 16:43 /tmp/dir/link -> f
=== dropping caches ===
l--------- 1 root root 1 Jul 11 16:43 /tmp/dir/link -> f

-- 
Rgrds, legion

