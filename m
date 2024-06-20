Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2CD910C28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 18:24:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XC1XYPkS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4m5r0SSLz3cVx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 02:24:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XC1XYPkS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4m566zqDz3cFN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 02:23:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A6190CE274D;
	Thu, 20 Jun 2024 16:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C294C32786;
	Thu, 20 Jun 2024 16:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900615;
	bh=c2+3nT3Fz2YE3y2yTCQ/lqf84edhGpnQvBt5hH6hrrc=;
	h=From:To:Cc:Subject:Date:From;
	b=XC1XYPkSMkLHnz9abDPwB+ZF9PlO95SQ+oHvZ5uCctS66b+uYGD9F2IRJX7pEtMkc
	 tv1ySBBzxr5W7wpTOSPmwFLPSaG8DZ+VHBfx2P4XohH/2B5Ig5ZAdTDxK0UXwPOa9f
	 kgG01VSndf2XvLA6qgkIX+rPcLDIj4cedf9ebxSx7WytcpCCbPGct3kqyatbZdmobi
	 VeFKF+urVmNd2v+/KXJBz8itdjWMHDfq1hlwgrSDbn0Mq69GGfKJxQF+5Zd1+MyiaZ
	 tJ0Pd6jm0rAgBQhogByTNSzjJmQ0Xpzjvie1YBoPoSwU/RqtdxmBuhM5TomoNaluGz
	 sj55VopFCAeAw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/15] linux system call fixes
Date: Thu, 20 Jun 2024 18:23:01 +0200
Message-Id: <20240620162316.3674955-1-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, ltp@lists.linux.it, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

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

     Arnd

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
Cc: ltp@lists.linux.it

Arnd Bergmann (15):
  ftruncate: pass a signed offset
  syscalls: fix compat_sys_io_pgetevents_time64 usage
  mips: fix compat_sys_lseek syscall
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
  asm-generic: unistd: fix time32 compat syscall handling
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
 arch/mips/kernel/syscalls/syscall_o32.tbl |   4 +-
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
 include/uapi/asm-generic/unistd.h         | 146 +++++++++-----
 27 files changed, 160 insertions(+), 343 deletions(-)
 create mode 100644 arch/hexagon/include/asm/syscalls.h

-- 
2.39.2

