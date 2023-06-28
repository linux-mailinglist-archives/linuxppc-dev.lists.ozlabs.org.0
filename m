Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29220741D5F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 02:50:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=axY2Jpnp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qs0Hj0LSVz3bdV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 10:50:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=axY2Jpnp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 29 Jun 2023 09:11:56 AEST
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qry5S1B6Bz303d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 09:11:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687993916; x=1719529916;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lLpKBmAZR/lK6S9SB5nAtp44osjKMlgKn80ydUPtNxs=;
  b=axY2Jpnp25qVggggpzVNu97AKiJvkaROdHKu3nRntqG9YF1nMHwPJCW+
   skn8ex8AlXIUA1c+txIn6C5ZL1UhTyozgOuhoRXS48TcGixHYdKu0A17E
   JkzTlAva0ReyDv4hWS/LvLqyL0XvrKhPiUXzxBN0VimoNB/RF7zVg+gFG
   cEpaUnseQw4xnLn8byexLHA/4HfLzi471eHBgVTrcXWPTn2tKVwapN874
   C6IujcHJqO4hQir5jG0N2wm7v1NfbQLIEVSS+WEv9pQeqlu5QiukqITlR
   mDk37MXXCT4VTwVU1Rn4AKKjkZ7YlxKw8KPtuH1ru9rh904Dvh/QR2Z+e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="341564393"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="341564393"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 16:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="841256845"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="841256845"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orsmga004.jf.intel.com with ESMTP; 28 Jun 2023 16:10:45 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH] syscalls: Cleanup references to sys_lookup_dcookie()
Date: Wed, 28 Jun 2023 23:09:35 +0000
Message-Id: <20230628230935.1196180-1-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jun 2023 10:50:12 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Turner <mattst88@gmail.
 com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Sohil Mehta <sohil.mehta@intel.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Randy Dunlap <rdunlap@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Sven Schnelle <svens@li
 nux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 'be65de6b03aa ("fs: Remove dcookies support")' removed the
syscall definition for lookup_dcookie.  However, syscall tables still
point to the old sys_lookup_dcookie() definition. Update syscall tables
of all architectures to directly point to sys_ni_syscall() instead.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
This patch has a dependency on another patch that has been applied to the
asm-generic tree:
https://lore.kernel.org/lkml/20230621223600.1348693-1-sohil.mehta@intel.com/
---
 arch/alpha/kernel/syscalls/syscall.tbl              | 2 +-
 arch/arm/tools/syscall.tbl                          | 2 +-
 arch/arm64/include/asm/unistd32.h                   | 4 ++--
 arch/ia64/kernel/syscalls/syscall.tbl               | 2 +-
 arch/m68k/kernel/syscalls/syscall.tbl               | 2 +-
 arch/microblaze/kernel/syscalls/syscall.tbl         | 2 +-
 arch/mips/kernel/syscalls/syscall_n32.tbl           | 2 +-
 arch/mips/kernel/syscalls/syscall_n64.tbl           | 2 +-
 arch/mips/kernel/syscalls/syscall_o32.tbl           | 2 +-
 arch/parisc/kernel/syscalls/syscall.tbl             | 2 +-
 arch/powerpc/kernel/syscalls/syscall.tbl            | 2 +-
 arch/s390/kernel/syscalls/syscall.tbl               | 2 +-
 arch/sh/kernel/syscalls/syscall.tbl                 | 2 +-
 arch/sparc/kernel/syscalls/syscall.tbl              | 2 +-
 arch/x86/entry/syscalls/syscall_32.tbl              | 2 +-
 arch/x86/entry/syscalls/syscall_64.tbl              | 2 +-
 arch/xtensa/kernel/syscalls/syscall.tbl             | 2 +-
 include/linux/compat.h                              | 1 -
 include/linux/syscalls.h                            | 1 -
 include/uapi/asm-generic/unistd.h                   | 2 +-
 kernel/sys_ni.c                                     | 2 --
 tools/include/uapi/asm-generic/unistd.h             | 2 +-
 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl | 2 +-
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  | 2 +-
 tools/perf/arch/s390/entry/syscalls/syscall.tbl     | 2 +-
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl   | 2 +-
 26 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 8ebacf37a8cf..b299f877034e 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -334,7 +334,7 @@
 401	common	io_submit			sys_io_submit
 402	common	io_cancel			sys_io_cancel
 405	common	exit_group			sys_exit_group
-406	common	lookup_dcookie			sys_lookup_dcookie
+406	common	lookup_dcookie			sys_ni_syscall
 407	common	epoll_create			sys_epoll_create
 408	common	epoll_ctl			sys_epoll_ctl
 409	common	epoll_wait			sys_epoll_wait
diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
index ac964612d8b0..ef9424cebe79 100644
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@ -263,7 +263,7 @@
 246	common	io_submit		sys_io_submit
 247	common	io_cancel		sys_io_cancel
 248	common	exit_group		sys_exit_group
-249	common	lookup_dcookie		sys_lookup_dcookie
+249	common	lookup_dcookie		sys_ni_syscall
 250	common	epoll_create		sys_epoll_create
 251	common	epoll_ctl		sys_epoll_ctl		sys_oabi_epoll_ctl
 252	common	epoll_wait		sys_epoll_wait
diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/unistd32.h
index 604a2053d006..c2e37f6b7d86 100644
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@ -508,8 +508,8 @@ __SYSCALL(__NR_io_submit, compat_sys_io_submit)
 __SYSCALL(__NR_io_cancel, sys_io_cancel)
 #define __NR_exit_group 248
 __SYSCALL(__NR_exit_group, sys_exit_group)
-#define __NR_lookup_dcookie 249
-__SYSCALL(__NR_lookup_dcookie, compat_sys_lookup_dcookie)
+			/* 249 was lookup_dcookie */
+__SYSCALL(249, sys_ni_syscall)
 #define __NR_epoll_create 250
 __SYSCALL(__NR_epoll_create, sys_epoll_create)
 #define __NR_epoll_ctl 251
diff --git a/arch/ia64/kernel/syscalls/syscall.tbl b/arch/ia64/kernel/syscalls/syscall.tbl
index 72c929d9902b..e76e2dcd2f5a 100644
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@ -222,7 +222,7 @@
 210	common	fadvise64			sys_fadvise64_64
 211	common	tgkill				sys_tgkill
 212	common	exit_group			sys_exit_group
-213	common	lookup_dcookie			sys_lookup_dcookie
+213	common	lookup_dcookie			sys_ni_syscall
 214	common	io_setup			sys_io_setup
 215	common	io_destroy			sys_io_destroy
 216	common	io_getevents			sys_io_getevents
diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/syscalls/syscall.tbl
index b1f3940bc298..3b6070b664ea 100644
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@ -255,7 +255,7 @@
 245	common	io_cancel			sys_io_cancel
 246	common	fadvise64			sys_fadvise64
 247	common	exit_group			sys_exit_group
-248	common	lookup_dcookie			sys_lookup_dcookie
+248	common	lookup_dcookie			sys_ni_syscall
 249	common	epoll_create			sys_epoll_create
 250	common	epoll_ctl			sys_epoll_ctl
 251	common	epoll_wait			sys_epoll_wait
diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microblaze/kernel/syscalls/syscall.tbl
index 820145e47350..935f71c56f2f 100644
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@ -260,7 +260,7 @@
 250	common	fadvise64			sys_fadvise64
 # 251 is available for reuse (was briefly sys_set_zone_reclaim)
 252	common	exit_group			sys_exit_group
-253	common	lookup_dcookie			sys_lookup_dcookie
+253	common	lookup_dcookie			sys_ni_syscall
 254	common	epoll_create			sys_epoll_create
 255	common	epoll_ctl			sys_epoll_ctl
 256	common	epoll_wait			sys_epoll_wait
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index 253ff994ed2e..02d71b4726fe 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -214,7 +214,7 @@
 203	n32	io_submit			compat_sys_io_submit
 204	n32	io_cancel			sys_io_cancel
 205	n32	exit_group			sys_exit_group
-206	n32	lookup_dcookie			sys_lookup_dcookie
+206	n32	lookup_dcookie			sys_ni_syscall
 207	n32	epoll_create			sys_epoll_create
 208	n32	epoll_ctl			sys_epoll_ctl
 209	n32	epoll_wait			sys_epoll_wait
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 3f1886ad9d80..23a72075987d 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -214,7 +214,7 @@
 203	n64	io_submit			sys_io_submit
 204	n64	io_cancel			sys_io_cancel
 205	n64	exit_group			sys_exit_group
-206	n64	lookup_dcookie			sys_lookup_dcookie
+206	n64	lookup_dcookie			sys_ni_syscall
 207	n64	epoll_create			sys_epoll_create
 208	n64	epoll_ctl			sys_epoll_ctl
 209	n64	epoll_wait			sys_epoll_wait
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 8f243e35a7b2..588ccfcfa1ea 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -258,7 +258,7 @@
 244	o32	io_submit			sys_io_submit			compat_sys_io_submit
 245	o32	io_cancel			sys_io_cancel
 246	o32	exit_group			sys_exit_group
-247	o32	lookup_dcookie			sys_lookup_dcookie		compat_sys_lookup_dcookie
+247	o32	lookup_dcookie			sys_ni_syscall
 248	o32	epoll_create			sys_epoll_create
 249	o32	epoll_ctl			sys_epoll_ctl
 250	o32	epoll_wait			sys_epoll_wait
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
index 0e42fceb2d5e..444328e937e7 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -245,7 +245,7 @@
 # 220 was alloc_hugepages
 # 221 was free_hugepages
 222	common	exit_group		sys_exit_group
-223	common	lookup_dcookie		sys_lookup_dcookie		compat_sys_lookup_dcookie
+223	common	lookup_dcookie		sys_ni_syscall
 224	common	epoll_create		sys_epoll_create
 225	common	epoll_ctl		sys_epoll_ctl
 226	common	epoll_wait		sys_epoll_wait
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index a0be127475b1..2c8db9708ec8 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -294,7 +294,7 @@
 233	32	fadvise64			sys_ppc32_fadvise64		compat_sys_ppc32_fadvise64
 233	64	fadvise64			sys_fadvise64
 234	nospu	exit_group			sys_exit_group
-235	nospu	lookup_dcookie			sys_lookup_dcookie		compat_sys_lookup_dcookie
+235	nospu	lookup_dcookie			sys_ni_syscall
 236	common	epoll_create			sys_epoll_create
 237	common	epoll_ctl			sys_epoll_ctl
 238	common	epoll_wait			sys_epoll_wait
diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
index b68f47541169..85b45b49756e 100644
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@ -100,7 +100,7 @@
 106  common	stat			sys_newstat			compat_sys_newstat
 107  common	lstat			sys_newlstat			compat_sys_newlstat
 108  common	fstat			sys_newfstat			compat_sys_newfstat
-110  common	lookup_dcookie		sys_lookup_dcookie		compat_sys_lookup_dcookie
+110  common	lookup_dcookie		-				-
 111  common	vhangup			sys_vhangup			sys_vhangup
 112  common	idle			-				-
 114  common	wait4			sys_wait4			compat_sys_wait4
diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
index 2de85c977f54..7e284e718325 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -260,7 +260,7 @@
 250	common	fadvise64			sys_fadvise64
 # 251 is unused
 252	common	exit_group			sys_exit_group
-253	common	lookup_dcookie			sys_lookup_dcookie
+253	common	lookup_dcookie			sys_ni_syscall
 254	common	epoll_create			sys_epoll_create
 255	common	epoll_ctl			sys_epoll_ctl
 256	common	epoll_wait			sys_epoll_wait
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/syscalls/syscall.tbl
index 4398cc6fb68d..0b8dd4728f82 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -249,7 +249,7 @@
 205	common	readahead		sys_readahead			compat_sys_readahead
 206	common	socketcall		sys_socketcall			sys32_socketcall
 207	common	syslog			sys_syslog
-208	common	lookup_dcookie		sys_lookup_dcookie		compat_sys_lookup_dcookie
+208	common	lookup_dcookie		sys_ni_syscall
 209	common	fadvise64		sys_fadvise64			compat_sys_fadvise64
 210	common	fadvise64_64		sys_fadvise64_64		compat_sys_fadvise64_64
 211	common	tgkill			sys_tgkill
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index 320480a8db4f..2b9c86445c57 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -264,7 +264,7 @@
 250	i386	fadvise64		sys_ia32_fadvise64
 # 251 is available for reuse (was briefly sys_set_zone_reclaim)
 252	i386	exit_group		sys_exit_group
-253	i386	lookup_dcookie		sys_lookup_dcookie		compat_sys_lookup_dcookie
+253	i386	lookup_dcookie
 254	i386	epoll_create		sys_epoll_create
 255	i386	epoll_ctl		sys_epoll_ctl
 256	i386	epoll_wait		sys_epoll_wait
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index c84d12608cd2..da2643738262 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -220,7 +220,7 @@
 209	64	io_submit		sys_io_submit
 210	common	io_cancel		sys_io_cancel
 211	64	get_thread_area
-212	common	lookup_dcookie		sys_lookup_dcookie
+212	common	lookup_dcookie
 213	common	epoll_create		sys_epoll_create
 214	64	epoll_ctl_old
 215	64	epoll_wait_old
diff --git a/arch/xtensa/kernel/syscalls/syscall.tbl b/arch/xtensa/kernel/syscalls/syscall.tbl
index 52c94ab5c205..c969734e9b53 100644
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@ -273,7 +273,7 @@
 252	common	timer_getoverrun		sys_timer_getoverrun
 # System
 253	common	reserved253			sys_ni_syscall
-254	common	lookup_dcookie			sys_lookup_dcookie
+254	common	lookup_dcookie			sys_ni_syscall
 255	common	available255			sys_ni_syscall
 256	common	add_key				sys_add_key
 257	common	request_key			sys_request_key
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 1cfa4f0f490a..233f61ec8afc 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -581,7 +581,6 @@ asmlinkage long compat_sys_io_pgetevents_time64(compat_aio_context_t ctx_id,
 					struct io_event __user *events,
 					struct __kernel_timespec __user *timeout,
 					const struct __compat_aio_sigset __user *usig);
-asmlinkage long compat_sys_lookup_dcookie(u32, u32, char __user *, compat_size_t);
 asmlinkage long compat_sys_epoll_pwait(int epfd,
 			struct epoll_event __user *events,
 			int maxevents, int timeout,
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 8c37cf91c12d..f5ca303c9f53 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -369,7 +369,6 @@ asmlinkage long sys_lremovexattr(const char __user *path,
 				 const char __user *name);
 asmlinkage long sys_fremovexattr(int fd, const char __user *name);
 asmlinkage long sys_getcwd(char __user *buf, unsigned long size);
-asmlinkage long sys_lookup_dcookie(u64 cookie64, char __user *buf, size_t len);
 asmlinkage long sys_eventfd2(unsigned int count, int flags);
 asmlinkage long sys_epoll_create1(int flags);
 asmlinkage long sys_epoll_ctl(int epfd, int op, int fd,
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index dd7d8e10f16d..652537342a47 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -71,7 +71,7 @@ __SYSCALL(__NR_fremovexattr, sys_fremovexattr)
 #define __NR_getcwd 17
 __SYSCALL(__NR_getcwd, sys_getcwd)
 #define __NR_lookup_dcookie 18
-__SC_COMP(__NR_lookup_dcookie, sys_lookup_dcookie, compat_sys_lookup_dcookie)
+__SYSCALL(__NR_lookup_dcookie, sys_ni_syscall)
 #define __NR_eventfd2 19
 __SYSCALL(__NR_eventfd2, sys_eventfd2)
 #define __NR_epoll_create1 20
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index f207236002e9..31431f139208 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -51,8 +51,6 @@ COND_SYSCALL_COMPAT(io_pgetevents);
 COND_SYSCALL(io_uring_setup);
 COND_SYSCALL(io_uring_enter);
 COND_SYSCALL(io_uring_register);
-COND_SYSCALL(lookup_dcookie);
-COND_SYSCALL_COMPAT(lookup_dcookie);
 COND_SYSCALL(eventfd2);
 COND_SYSCALL(epoll_create1);
 COND_SYSCALL(epoll_ctl);
diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
index dd7d8e10f16d..652537342a47 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
@@ -71,7 +71,7 @@ __SYSCALL(__NR_fremovexattr, sys_fremovexattr)
 #define __NR_getcwd 17
 __SYSCALL(__NR_getcwd, sys_getcwd)
 #define __NR_lookup_dcookie 18
-__SC_COMP(__NR_lookup_dcookie, sys_lookup_dcookie, compat_sys_lookup_dcookie)
+__SYSCALL(__NR_lookup_dcookie, sys_ni_syscall)
 #define __NR_eventfd2 19
 __SYSCALL(__NR_eventfd2, sys_eventfd2)
 #define __NR_epoll_create1 20
diff --git a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
index 3f1886ad9d80..23a72075987d 100644
--- a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
+++ b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
@@ -214,7 +214,7 @@
 203	n64	io_submit			sys_io_submit
 204	n64	io_cancel			sys_io_cancel
 205	n64	exit_group			sys_exit_group
-206	n64	lookup_dcookie			sys_lookup_dcookie
+206	n64	lookup_dcookie			sys_ni_syscall
 207	n64	epoll_create			sys_epoll_create
 208	n64	epoll_ctl			sys_epoll_ctl
 209	n64	epoll_wait			sys_epoll_wait
diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index a0be127475b1..2c8db9708ec8 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -294,7 +294,7 @@
 233	32	fadvise64			sys_ppc32_fadvise64		compat_sys_ppc32_fadvise64
 233	64	fadvise64			sys_fadvise64
 234	nospu	exit_group			sys_exit_group
-235	nospu	lookup_dcookie			sys_lookup_dcookie		compat_sys_lookup_dcookie
+235	nospu	lookup_dcookie			sys_ni_syscall
 236	common	epoll_create			sys_epoll_create
 237	common	epoll_ctl			sys_epoll_ctl
 238	common	epoll_wait			sys_epoll_wait
diff --git a/tools/perf/arch/s390/entry/syscalls/syscall.tbl b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
index b68f47541169..85b45b49756e 100644
--- a/tools/perf/arch/s390/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
@@ -100,7 +100,7 @@
 106  common	stat			sys_newstat			compat_sys_newstat
 107  common	lstat			sys_newlstat			compat_sys_newlstat
 108  common	fstat			sys_newfstat			compat_sys_newfstat
-110  common	lookup_dcookie		sys_lookup_dcookie		compat_sys_lookup_dcookie
+110  common	lookup_dcookie		-				-
 111  common	vhangup			sys_vhangup			sys_vhangup
 112  common	idle			-				-
 114  common	wait4			sys_wait4			compat_sys_wait4
diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
index c84d12608cd2..da2643738262 100644
--- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
@@ -220,7 +220,7 @@
 209	64	io_submit		sys_io_submit
 210	common	io_cancel		sys_io_cancel
 211	64	get_thread_area
-212	common	lookup_dcookie		sys_lookup_dcookie
+212	common	lookup_dcookie
 213	common	epoll_create		sys_epoll_create
 214	64	epoll_ctl_old
 215	64	epoll_wait_old
-- 
2.34.1

