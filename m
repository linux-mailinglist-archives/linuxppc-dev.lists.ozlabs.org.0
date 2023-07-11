Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5F374F75B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 19:38:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OU0fx9r/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0p482Mclz3cBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 03:38:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OU0fx9r/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0p3H5TDVz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 03:37:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 328B561576;
	Tue, 11 Jul 2023 17:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E41BC433C8;
	Tue, 11 Jul 2023 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689097032;
	bh=g+dg42YNtsQJhOjtGMIfYdxeMk+Q5chUUpj1UHPyuI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OU0fx9r/gW1jdTCG/iJZoodUiAYpTTMgryh+eUwK0SvFFeCzBDxABJWQ/HAhpM8ye
	 yBnM//6OA543xk4QBgEbWFDkvCh7ONFKnet6T2nY6GiJNGe++LpNHsBO53yIxRC1dw
	 CLUi1qmmodaux6upnMNyF/KqqubSxVHA67DwxYH/aO5VwDsXvdD1T4BZZhZWFZrom9
	 +nthUGNjjcFzaX2bY1z9qhdSCg7rB6hz0xgLF1oCv+tCDu8UN7UNhRG5OCUuJUdOw+
	 UBXBTnHv6L2WRueaCic7RFYV1/lmEsdEsvaplXp/1qHno7ehBsSMmEORgYmfsLOmFl
	 vPA4Eb9AXLl0w==
From: Christian Brauner <brauner@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Subject: Re: (subset) [PATCH v4 0/5] Add a new fchmodat2() syscall
Date: Tue, 11 Jul 2023 19:36:45 +0200
Message-Id: <20230711-befreien-unwiderruflich-c2265c61e514@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689092120.git.legion@kernel.org>
References: <cover.1689074739.git.legion@kernel.org> <cover.1689092120.git.legion@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=brauner@kernel.org; h=from:subject:message-id; bh=g+dg42YNtsQJhOjtGMIfYdxeMk+Q5chUUpj1UHPyuI0=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSsnSxT9aGqYFXo8u/Pv0u8/8n7p3Ja0Z4JQu5vS1/e2JvM Xda7tKOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiwv8ZGa5HavbtmudR8P/916OJ0j 91rvW3zk3vj11VUnvmNlvDpK2MDJ8umZ/uZt1qWrp9+6sJ/1y98jZJfQleeOMaf2RRS0fvbmYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, peterz@infradead.org, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, Christian Borntraeger <borntraeger@linux.ibm.com>, fweimer@redhat.com, gor@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>, glebfm@altlinux.org, monstr@monstr.eu, acme@kernel.org, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, axboe@kernel.dk, James.Bottomley@HansenPartnership.com, Christian Br
 auner <brauner@kernel.org>, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, Tycho Andersen <tycho@tycho.pizza>, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 11 Jul 2023 18:16:02 +0200, Alexey Gladkov wrote:
> In glibc, the fchmodat(3) function has a flags argument according to the
> POSIX specification [1], but kernel syscalls has no such argument.
> Therefore, libc implementations do workarounds using /proc. However,
> this requires procfs to be mounted and accessible.
> 
> This patch set adds fchmodat2(), a new syscall. The syscall allows to
> pass the AT_SYMLINK_NOFOLLOW flag to disable LOOKUP_FOLLOW. In all other
> respects, this syscall is no different from fchmodat().
> 
> [...]

Tools updates usually go separately.
Flags argument ported to unsigned int; otherwise unchanged.

---

Applied to the master branch of the vfs/vfs.git tree.
Patches in the master branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: master

[1/5] Non-functional cleanup of a "__user * filename"
      https://git.kernel.org/vfs/vfs/c/0f05a6af6b7e
[2/5] fs: Add fchmodat2()
      https://git.kernel.org/vfs/vfs/c/8d593559ec09
[3/5] arch: Register fchmodat2, usually as syscall 452
      https://git.kernel.org/vfs/vfs/c/2ee63b04f206
[5/5] selftests: Add fchmodat2 selftest
      https://git.kernel.org/vfs/vfs/c/f175b92081ec
