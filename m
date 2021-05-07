Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B70C376C12
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 00:09:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcPkK0S6tz308T
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 08:09:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GZ13BdKp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GZ13BdKp; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcPjs3wKdz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 08:09:05 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA33B60BD3;
 Fri,  7 May 2021 22:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620425342;
 bh=pLN/AlAGxiGZnqtkHzoskF1g1y+Og1zx70nNd/gvob8=;
 h=From:To:Cc:Subject:Date:From;
 b=GZ13BdKpryifxhRwUeXYiDxMV+BWySTA7GY7/CWwvuCWkusUFDxkw2jKiOlfzjbCr
 So4fZaGkAyPTwA8Q1TjLVhcTwgJc8xvHUXFTKFHcbAkEIqYdWcKh0axCM+T92qoOrQ
 bkgNUSiGEeKqAdmwuN3qiVKoII2y7FbwOUX6mX301a6kiRL+VhsHKLQbMnh2CNRIHJ
 HKxjre312EfivKKOz+Q2DN/Jdax+mgS6zOKiXtE7A5jQN2E+WeTOOh+m15wqAaIqSp
 vmCijYogutqPzDP5KIogDPopYspUOizf4eB1toyhkfcE7uWw2BB6nwUsTEL9hofb0l
 fr7hse6Wb3kJA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Subject: [RFC 0/12] Unify asm/unaligned.h around struct helper
Date: Sat,  8 May 2021 00:07:45 +0200
Message-Id: <20210507220813.365382-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 "Richard Russon \(FlatCap\)" <ldm@flatcap.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 James Morris <jmorris@namei.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
 Ganapathi Bhat <ganapathi017@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-block@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Stafford Horne <shorne@gmail.com>, Kalle Valo <kvalo@codeaurora.org>,
 Jens Axboe <axboe@kernel.dk>, John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-security-module@vger.kernel.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The get_unaligned()/put_unaligned() helpers are traditionally architecture
specific, with the two main variants being the "access-ok.h" version
that assumes unaligned pointer accesses always work on a particular
architecture, and the "le-struct.h" version that casts the data to a
byte aligned type before dereferencing, for architectures that cannot
always do unaligned accesses in hardware.

Based on the discussion linked below, it appears that the access-ok
version is not realiable on any architecture, but the struct version
probably has no downsides. This series changes the code to use the
same implementation on all architectures, addressing the few exceptions
separately.

I've pushed the patches to the asm-generic git tree for testing.

	Arnd

Link: https://lore.kernel.org/lkml/75d07691-1e4f-741f-9852-38c0b4f520bc@synopsys.com/
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100363
Link: git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git unaligned-rework

Arnd Bergmann (12):
  asm-generic: use asm-generic/unaligned.h for most architectures
  openrisc: always use unaligned-struct header
  sh: remove unaligned access for sh4a
  m68k: select CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
  powerpc: use linux/unaligned/le_struct.h on LE power7
  asm-generic: unaligned: remove byteshift helpers
  asm-generic: unaligned always use struct helpers
  partitions: msdos: fix one-byte get_unaligned()
  apparmor: use get_unaligned() only for multi-byte words
  mwifiex: re-fix for unaligned accesses
  netpoll: avoid put_unaligned() on single character
  asm-generic: simplify asm/unaligned.h

 arch/alpha/include/asm/unaligned.h          |  12 --
 arch/arm/include/asm/unaligned.h            |  27 ---
 arch/ia64/include/asm/unaligned.h           |  12 --
 arch/m68k/Kconfig                           |   1 +
 arch/m68k/include/asm/unaligned.h           |  26 ---
 arch/microblaze/include/asm/unaligned.h     |  27 ---
 arch/mips/crypto/crc32-mips.c               |   2 +-
 arch/openrisc/include/asm/unaligned.h       |  47 -----
 arch/parisc/include/asm/unaligned.h         |   6 +-
 arch/powerpc/include/asm/unaligned.h        |  22 ---
 arch/sh/include/asm/unaligned-sh4a.h        | 199 --------------------
 arch/sh/include/asm/unaligned.h             |  13 --
 arch/sparc/include/asm/unaligned.h          |  11 --
 arch/x86/include/asm/unaligned.h            |  15 --
 arch/xtensa/include/asm/unaligned.h         |  29 ---
 block/partitions/ldm.h                      |   2 +-
 block/partitions/msdos.c                    |   2 +-
 drivers/net/wireless/marvell/mwifiex/pcie.c |  10 +-
 include/asm-generic/unaligned.h             | 149 ++++++++++++---
 include/linux/unaligned/access_ok.h         |  68 -------
 include/linux/unaligned/be_byteshift.h      |  71 -------
 include/linux/unaligned/be_memmove.h        |  37 ----
 include/linux/unaligned/be_struct.h         |  37 ----
 include/linux/unaligned/generic.h           | 115 -----------
 include/linux/unaligned/le_byteshift.h      |  71 -------
 include/linux/unaligned/le_memmove.h        |  37 ----
 include/linux/unaligned/le_struct.h         |  37 ----
 include/linux/unaligned/memmove.h           |  46 -----
 net/core/netpoll.c                          |   4 +-
 security/apparmor/policy_unpack.c           |   2 +-
 30 files changed, 137 insertions(+), 1000 deletions(-)
 delete mode 100644 arch/alpha/include/asm/unaligned.h
 delete mode 100644 arch/arm/include/asm/unaligned.h
 delete mode 100644 arch/ia64/include/asm/unaligned.h
 delete mode 100644 arch/m68k/include/asm/unaligned.h
 delete mode 100644 arch/microblaze/include/asm/unaligned.h
 delete mode 100644 arch/openrisc/include/asm/unaligned.h
 delete mode 100644 arch/powerpc/include/asm/unaligned.h
 delete mode 100644 arch/sh/include/asm/unaligned-sh4a.h
 delete mode 100644 arch/sh/include/asm/unaligned.h
 delete mode 100644 arch/sparc/include/asm/unaligned.h
 delete mode 100644 arch/x86/include/asm/unaligned.h
 delete mode 100644 arch/xtensa/include/asm/unaligned.h
 delete mode 100644 include/linux/unaligned/access_ok.h
 delete mode 100644 include/linux/unaligned/be_byteshift.h
 delete mode 100644 include/linux/unaligned/be_memmove.h
 delete mode 100644 include/linux/unaligned/be_struct.h
 delete mode 100644 include/linux/unaligned/generic.h
 delete mode 100644 include/linux/unaligned/le_byteshift.h
 delete mode 100644 include/linux/unaligned/le_memmove.h
 delete mode 100644 include/linux/unaligned/le_struct.h
 delete mode 100644 include/linux/unaligned/memmove.h

Cc: Amitkumar Karwar <amitkarwar@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ganapathi Bhat <ganapathi017@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: James Morris <jmorris@namei.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: John Johansen <john.johansen@canonical.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Rich Felker <dalias@libc.org>
Cc: "Richard Russon (FlatCap)" <ldm@flatcap.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Sharvari Harisangam <sharvari.harisangam@nxp.com>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Xinming Hu <huxinming820@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-crypto@vger.kernel.org
Cc: openrisc@lists.librecores.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-ntfs-dev@lists.sourceforge.net
Cc: linux-block@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: linux-security-module@vger.kernel.org

-- 
2.29.2

