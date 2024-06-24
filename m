Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B9F91542A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 18:38:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XAOXiQwJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7DCq1TNKz3clH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 02:37:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XAOXiQwJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7DC73sB5z3cl3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 02:37:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9D0B5CE1331;
	Mon, 24 Jun 2024 16:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE60CC2BBFC;
	Mon, 24 Jun 2024 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719247039;
	bh=9d9HuVaLbxVvYIk0v7QFxagihDIyuBmHy3l8B29CCxM=;
	h=From:To:Cc:Subject:Date:From;
	b=XAOXiQwJP3v0AYOMXFbOl+aKwam/G8B8vHPH86S/9LShi99xORnlW4piK1/QXzERr
	 xSDLEVIY2XUL2OstfMJIdt0rq3JemXryccEJPkd4ghrh6UDdFQr1tbDgHrMymJ5lkT
	 LCJAwLpGg/YP4mak7hJUeKjerzj3Sjeuk9mEeI0PO4M8ngXVwYPSEkSZYIjYXv3lsO
	 IWmu9kkIzBkQryYrYGbzA0waCr299MRkDBhVI15NNGekWiHeTRxr6a39naS5fy6XeX
	 AT9Pv9joOgDX2Gg6Zy/ej9wfBbyGwtMGKM4NEGi3ynRBEI8qKiLmDIsSwZL2m2icP1
	 basUBX/zL+P3Q==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/13] linux system call fixes
Date: Mon, 24 Jun 2024 18:36:58 +0200
Message-Id: <20240624163707.299494-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

This is a minor update to v1 of this series. If there are no new
concerns, I would like to send this as a pull request for v6.10-rc6,
which is a little late, but these are all bug fixes. Changes since
v1 are:

 - collect acks
 - minor fixes to the changelog text
 - drop mips patch that was already merged
 - drop the time32 patch that caused build failures
 - fix a kernel/sys_ni.c stub bug that was exposed by
   the compat_sys_io_pgetevents_time64 change

     Arnd
 
--- 
Original series description:

I'm working on cleanup series for Linux system call handling, trying to
unify some of the architecture specific code there among other things.

In the process, I came across a number of bugs that are ABI relevant,
so I'm trying to merge these first. I found all of these by inspection,
not by running the code, so any extra review would help. I assume some
of the issues were already caught by existing LTP tests, while for others
we could add a test. Again, I did not check what is already there.

The sync_file_range and fadvise64_64 changes on sh, csky and hexagon
are likely to also require changes in the libc implementation.

Once the patches are reviewed, I plan to merge my changes as bugfixes
through the asm-generic tree, but architecture maintainers can also
pick them up directly to speed up the bugfix.

Cc: linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: sparclinux@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Brian Cain <bcain@quicinc.com>
Cc: linux-hexagon@vger.kernel.org
Cc: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: libc-alpha@sourceware.org
Cc: musl@lists.openwall.com

Arnd Bergmann (13):
  ftruncate: pass a signed offset
  syscalls: fix compat_sys_io_pgetevents_time64 usage
  sparc: fix old compat_sys_select()
  sparc: fix compat recv/recvfrom syscalls
  parisc: use correct compat recv/recvfrom syscalls
  parisc: use generic sys_fanotify_mark implementation
  powerpc: restore some missing spu syscalls
  sh: rework sync_file_range ABI
  csky, hexagon: fix broken sys_sync_file_range
  hexagon: fix fadvise64_64 calling conventions
  s390: remove native mmap2() syscall
  syscalls: mmap(): use unsigned offset type consistently
  linux/syscalls.h: add missing __user annotations

 arch/arm64/include/asm/unistd32.h         |   2 +-
 arch/csky/include/uapi/asm/unistd.h       |   1 +
 arch/csky/kernel/syscall.c                |   2 +-
 arch/hexagon/include/asm/syscalls.h       |   6 +
 arch/hexagon/include/uapi/asm/unistd.h    |   1 +
 arch/hexagon/kernel/syscalltab.c          |   7 +
 arch/loongarch/kernel/syscall.c           |   2 +-
 arch/microblaze/kernel/sys_microblaze.c   |   2 +-
 arch/mips/kernel/syscalls/syscall_n32.tbl |   2 +-
 arch/mips/kernel/syscalls/syscall_o32.tbl |   2 +-
 arch/parisc/Kconfig                       |   1 +
 arch/parisc/kernel/sys_parisc32.c         |   9 -
 arch/parisc/kernel/syscalls/syscall.tbl   |   6 +-
 arch/powerpc/kernel/syscalls/syscall.tbl  |   6 +-
 arch/riscv/kernel/sys_riscv.c             |   4 +-
 arch/s390/kernel/syscall.c                |  27 ---
 arch/s390/kernel/syscalls/syscall.tbl     |   2 +-
 arch/sh/kernel/sys_sh32.c                 |  11 ++
 arch/sh/kernel/syscalls/syscall.tbl       |   3 +-
 arch/sparc/kernel/sys32.S                 | 221 ----------------------
 arch/sparc/kernel/syscalls/syscall.tbl    |   8 +-
 arch/x86/entry/syscalls/syscall_32.tbl    |   2 +-
 fs/open.c                                 |   4 +-
 include/asm-generic/syscalls.h            |   2 +-
 include/linux/compat.h                    |   2 +-
 include/linux/syscalls.h                  |  20 +-
 include/uapi/asm-generic/unistd.h         |   2 +-
 kernel/sys_ni.c                           |   2 +-
 28 files changed, 67 insertions(+), 292 deletions(-)
 create mode 100644 arch/hexagon/include/asm/syscalls.h

-- 
2.39.2

