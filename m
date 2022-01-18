Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6098A491ECD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 06:21:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdHFR2Q2Kz30Qt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 16:21:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=home.drummond.us header.i=@home.drummond.us header.a=rsa-sha256 header.s=default header.b=HrfroqxJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=home.drummond.us (client-ip=74.95.14.229;
 helo=talisker.home.drummond.us; envelope-from=walt@home.drummond.us;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=home.drummond.us header.i=@home.drummond.us
 header.a=rsa-sha256 header.s=default header.b=HrfroqxJ; 
 dkim-atps=neutral
Received: from talisker.home.drummond.us (drummond.us [74.95.14.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdGZx0phKz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 15:51:52 +1100 (AEDT)
Received: from talisker.home.drummond.us (localhost [127.0.0.1])
 by talisker.home.drummond.us (8.15.2/8.15.2/Debian-20) with ESMTP id
 20I4hKxA765034; Mon, 17 Jan 2022 20:43:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=home.drummond.us;
 s=default; t=1642481000;
 bh=JFi+HKlyMuoco5DMezAYc0cpMIkALY2NRgqxQb8XaVQ=;
 h=From:To:Cc:Subject:Date:From;
 b=HrfroqxJrad3DzZ6FT4waFIt4MeHoVb4BxDueoszUUfOdgocQu4B3/GEGCbfH7j+4
 bCnukvS8DMk0QncCM+4cnd67oBI11AUaZSfyA1jy6TaXA3X5Kcb8WqFT1lOO/G4bU0
 sE937UadIfrwnyajiN2sClndEDW/LSMvKjwv+nnxvNZNZDwNa20sogsmB1xI0fuutp
 TyP5IwYKNFjesXLYErOM4Z88Ci8VqrvFMwxoLr+OAwdySfNxgdpWQg9mNN1heppfgk
 /c+IM2lyAghg9dy8t50eqPnrKRsXzAsmMkXQhyUwc1ZmqI7/AHP52rv9ZYELVdXPsV
 F6MVEFQaeeKrg==
Received: (from walt@localhost)
 by talisker.home.drummond.us (8.15.2/8.15.2/Submit) id 20I4hDNe765026;
 Mon, 17 Jan 2022 20:43:13 -0800
From: Walt Drummond <walt@drummond.us>
To: agordeev@linux.ibm.com, arnd@arndb.de, benh@kernel.crashing.org,
 borntraeger@linux.ibm.com, chris@zankel.net, davem@davemloft.net,
 gregkh@linuxfoundation.org, hca@linux.ibm.com, deller@gmx.de,
 ink@jurassic.park.msu.ru, James.Bottomley@HansenPartnership.com,
 jirislaby@kernel.org, mattst88@gmail.com, jcmvbkbc@gmail.com,
 mpe@ellerman.id.au, paulus@samba.org, rth@twiddle.net, dalias@libc.org,
 tsbogend@alpha.franken.de, gor@linux.ibm.com, ysato@users.osdn.me
Subject: [PATCH 0/3] status: TTY status message request
Date: Mon, 17 Jan 2022 20:42:57 -0800
Message-Id: <20220118044259.764945-1-walt@drummond.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Jan 2022 16:20:39 +1100
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org, walt@drummond.us,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, ar@cs.msu.ru,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset adds TTY status message request feature to the n_tty
line dicipline.  This feature prints a brief message containing basic
system and process group information to a user's TTY in response to a
new control character in the line dicipline (default Ctrl-T) or the
TIOCSTAT ioctl.  The message contains the current system load, the
name and PID of an interesting process in the forground process group,
it's run time, percent CPU usage and RSS.  An example of this message
is:

  load: 0.31  cmd: sleep 3616843 [sleeping] 0.36r 0.00u 0.00s 0% 696k

User API visible changes are limited to:
 - The addition of VSTATUS in termios.c_cc[]
 - The addition of NOKERNINFO bit in termios.l_cflags
 - The addition of the TIOCSTAT ioctl number

None of these changes break the existing kernel api as the termios
structure on all architectures has enough space in the control
character array (.c_cc) for the new character, and the other changes
are space agnostic.

This feature is in many other Unix-like systems, both current and
historical.  In other implementations, this feature would also send
SIGINFO to the process group; this implementation does not.

Walt Drummond (3):
  vstatus: Allow the n_tty line dicipline to write to a user tty
  vstatus: Add user space API definitions for VSTATUS, NOKERNINFO and
    TIOCSTAT
  status: Display an informational message when the VSTATUS character is
    pressed or TIOCSTAT ioctl is called.

 arch/alpha/include/asm/termios.h         |   4 +-
 arch/alpha/include/uapi/asm/ioctls.h     |   1 +
 arch/alpha/include/uapi/asm/termbits.h   |  34 ++---
 arch/ia64/include/asm/termios.h          |   4 +-
 arch/ia64/include/uapi/asm/termbits.h    |  34 ++---
 arch/mips/include/asm/termios.h          |   4 +-
 arch/mips/include/uapi/asm/ioctls.h      |   1 +
 arch/mips/include/uapi/asm/termbits.h    |  36 ++---
 arch/parisc/include/asm/termios.h        |   4 +-
 arch/parisc/include/uapi/asm/ioctls.h    |   1 +
 arch/parisc/include/uapi/asm/termbits.h  |  34 ++---
 arch/powerpc/include/asm/termios.h       |   4 +-
 arch/powerpc/include/uapi/asm/ioctls.h   |   2 +
 arch/powerpc/include/uapi/asm/termbits.h |  34 ++---
 arch/s390/include/asm/termios.h          |   4 +-
 arch/sh/include/uapi/asm/ioctls.h        |   1 +
 arch/sparc/include/uapi/asm/ioctls.h     |   1 +
 arch/sparc/include/uapi/asm/termbits.h   |  38 +++---
 arch/xtensa/include/uapi/asm/ioctls.h    |   1 +
 drivers/tty/Makefile                     |   2 +-
 drivers/tty/n_tty.c                      | 113 +++++++++++-----
 drivers/tty/n_tty_status.c               | 162 +++++++++++++++++++++++
 drivers/tty/tty_io.c                     |   2 +-
 include/asm-generic/termios.h            |   4 +-
 include/linux/tty.h                      | 123 ++++++++---------
 include/uapi/asm-generic/ioctls.h        |   1 +
 include/uapi/asm-generic/termbits.h      |  34 ++---
 27 files changed, 461 insertions(+), 222 deletions(-)
 create mode 100644 drivers/tty/n_tty_status.c

-- 
2.30.2

