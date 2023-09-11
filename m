Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E50DB79DB05
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 23:37:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=leLQOR+7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlcP85g7gz3c58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 07:37:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=leLQOR+7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Tue, 12 Sep 2023 04:04:44 AEST
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RkvkN6ftvz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 04:04:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694455485; x=1725991485;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kxCm8IPxO4Adx3HaWS72d7S3asKhB+RqeSR07UfgL5Q=;
  b=leLQOR+7asKb1BCOi6UNmld0MqvkiEeoMHWCBrl0o2p46JH+hVefetbx
   /YF2EWwk5iMqDu+Tb5y5qiFiCn4SDCmAB0PfpcZYNIlMg+djmmgAPExuV
   3tc5pSdOl/ZehPlHk3WfmigxIY+naMbg9X17/ML8x359KHVf6kCBYNDtg
   b5TwZfmlkoMtr9DzNgTr4abZTlWqmeX9C9gVEE6swWFqfwgwNdpqVbbtU
   JhpGbzlZ08UsTY0S6m/N52+zLWDrQgzCNZoS5gdKndVZFNdQ1ZmeZtaTm
   p4ChGM9WhfcDg2FwmImpmfp9weVknpIrF92b25Co8KE0uc74GOqozc85T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368416950"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="368416950"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 11:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="808905950"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="808905950"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by fmsmga008.fm.intel.com with ESMTP; 11 Sep 2023 11:03:26 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 0/2] arch: Sync all syscall tables with 2 newly added system calls
Date: Mon, 11 Sep 2023 18:02:08 +0000
Message-Id: <20230911180210.1060504-1-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 13 Sep 2023 07:36:32 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
  Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, Mark Brown <broonie@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Sohil Mehta <sohil.mehta@intel.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Deepak Gupta <debug@rivosinc.com>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Randy Dunlap <rdunlap@infradead.org>, Adrian Hunter <adrian.hunter@
 intel.com>, linux-perf-users@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

6.6-rc1 has added support for 2 new system calls:
[1] fchmodat2()
[2] x86-specific map_shadow_stack()

This series mainly synchronizes the syscall tables arcoss the core kernel and
tools to reflect the recent updates.

For fchmodat2(), it fixes the missing entries in the tools directory.

For map_shadow_stack(), it reserves the syscall across the board. Since
map_shadow_stack() is x86 specific for now, it is marked as a conditional
syscall in sys_ni.c. Adding it to the syscall tables of other architectures is
harmless and would return ENOSYS when exercised.

Reserving arch-specific syscall numbers in the tables of all architectures is
good practice and would help avoid future conflicts.

[1]: https://lore.kernel.org/lkml/20230824-frohlocken-vorabend-725f6fdaad50@brauner/
[2]: https://lore.kernel.org/lkml/20230830234752.19858-1-dave.hansen@linux.intel.com/

Sohil Mehta (2):
  tools headers UAPI: Sync fchmodat2() syscall table entries
  arch: Reserve map_shadow_stack() syscall number for all architectures

 arch/alpha/kernel/syscalls/syscall.tbl              | 1 +
 arch/arm/tools/syscall.tbl                          | 1 +
 arch/arm64/include/asm/unistd.h                     | 2 +-
 arch/arm64/include/asm/unistd32.h                   | 2 ++
 arch/ia64/kernel/syscalls/syscall.tbl               | 1 +
 arch/m68k/kernel/syscalls/syscall.tbl               | 1 +
 arch/microblaze/kernel/syscalls/syscall.tbl         | 1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl           | 1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl           | 1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl           | 1 +
 arch/parisc/kernel/syscalls/syscall.tbl             | 1 +
 arch/powerpc/kernel/syscalls/syscall.tbl            | 1 +
 arch/s390/kernel/syscalls/syscall.tbl               | 1 +
 arch/sh/kernel/syscalls/syscall.tbl                 | 1 +
 arch/sparc/kernel/syscalls/syscall.tbl              | 1 +
 arch/x86/entry/syscalls/syscall_32.tbl              | 1 +
 arch/xtensa/kernel/syscalls/syscall.tbl             | 1 +
 include/uapi/asm-generic/unistd.h                   | 5 ++++-
 tools/include/uapi/asm-generic/unistd.h             | 8 +++++++-
 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl | 2 ++
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  | 2 ++
 tools/perf/arch/s390/entry/syscalls/syscall.tbl     | 2 ++
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl   | 2 ++
 23 files changed, 37 insertions(+), 3 deletions(-)


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.34.1

