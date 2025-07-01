Return-Path: <linuxppc-dev+bounces-10010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7464AEFB51
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 15:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWl2Y4ssQz2xHT;
	Tue,  1 Jul 2025 23:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751378229;
	cv=none; b=X9i6aIEVVxOFBOAmSBJhWJu7fZoc4XTb+k1NhIBMLfk4bRiNPk2cwGQK+qMkEGhDMdutEHw3ABDDhiGbfnlvRXE9F/w19JBoipY3iSFpbAJAx1ibvDEI1gACWiTj1WM4Pm1Y/Zq/fLB4FI7FHWpEVTb71Ox33Ww/11v5J+Q6nvsF/gVPTBFDaqSDcI2YN8Yg4LSws6PBqqdLr8C0IKvd6U+l0S7kKB1cVPmcNSqxSc/dyod42ClbivC7qynfTc3xjYqPQRveLFZ9PKvMkuW5Y9vNem1k6ps5JfIE9eguHLF9/vD80vg+XvW1M0vLrH+wAOI+IpcuYwmvlBoNUSdQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751378229; c=relaxed/relaxed;
	bh=Z+ycC8VMqDRdTxmVTZEG6lFYLS1Cbyrp7bI8bIheStU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NyJerrTyZlktdZEs7Qu10DWaoH1kEeBtCiOWwtzQCQmbIk0lN54Ve3GMkETOci1rWCVgJvGl5L1y8vrlPT4RVMSC+T4hLmLm5JXQ/tIiG0Vf8tuwqF/cl6TishNl5sz/MJjwNVnzGf25H3RCgaU85e07FX2jnpqsX5YHw0xbnWv1xiw/2tEqAyu0TwmujTqBVKICIm3WTrjd8dRSJ3WcfwuseV+a1l9T2Z5lonR7IDQ8bWKvgjq7mg4vFaWXVPGGOaTRPQLzpSowoHMu87YO+QyEZpxOWNKWLZz7mx4kuHwdeMOhGvtP0c2OM9xr7YF835yj7EntWE97rfYInvm8pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWl2X3PTzz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 23:57:06 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C6151515;
	Tue,  1 Jul 2025 06:56:18 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE12C3F58B;
	Tue,  1 Jul 2025 06:56:23 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andreas Larsson <andreas@gaisler.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chris Zankel <chris@zankel.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>,
	Kees Cook <kees@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rich Felker <dalias@libc.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 00/23] binfmt_elf,arch/*: Use elf.h for coredump note names
Date: Tue,  1 Jul 2025 14:55:53 +0100
Message-Id: <20250701135616.29630-1-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=FILL_THIS_FORM,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series aims to clean up an aspect of coredump generation:

ELF coredumps contain a set of notes describing the state of machine
registers and other information about the dumped process.

Notes are identified by a numeric identifier n_type and a "name"
string, although this terminology is somewhat misleading.  Officially,
the "name" of a note is really an "originator" or namespace identifier
that indicates how to interpret n_type [1], although in practice it is
often used more loosely.

Either way, each kind of note needs _both_ a specific "name" string and
a specific n_type to identify it robustly.

To centralise this knowledge in one place and avoid the need for ad-hoc
code to guess the correct name for a given note, commit 7da8e4ad4df0
("elf: Define note name macros") [2] added an explicit NN_<foo> #define
in elf.h to give the name corresponding to each named note type
NT_<foo>.

Now that the note name for each note is specified explicitly, the
remaining guesswork for determining the note name for common and
arch-specific regsets in ELF core dumps can be eliminated.

This series aims to do just that:

 * Patch 2 adds a user_regset field to specify the note name, and a
   helper macro to populate it correctly alongside the note type.

 * Patch 3 ports away the ad-hoc note names in the common coredump
   code.

 * Patches 4-22 make the arch-specific changes.  (This is pretty
   mechanical for most arches.)

 * The final patch adds a WARN() when no note name is specified,
   and simplifies the fallback guess.  This should only be applied
   when all arches have ported across.

See the individual patches for details.


Testing:

 * x86, arm64: Booted in a VM and triggered a core dump with no WARN(),
   and verified that the dumped notes are the same.

 * arm: Build-tested only (for now).

 * Other arches: not tested yet

Any help with testing is appreciated.  If the following generates the
same notes (as dumped by readelf -n core) and doesn't trigger a WARN,
then we are probably good.

$ sleep 60 &
$ kill -QUIT $!

(Register content might differ between runs, but it should be safe to
ignore that -- this series only deals with the note names and types.)

Cheers
---Dave


[1] System V Application Binary Interface, Edition 4.1,
Section 5 (Program Loading and Dynamic Linking) -> "Note Section"

https://refspecs.linuxfoundation.org/elf/gabi41.pdf

[2] elf: Define note name macros

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/uapi/linux/elf.h?id=7da8e4ad4df0dd12f37357af62ce1b63e75ae2e6


Dave Martin (23):
  regset: Fix kerneldoc for struct regset_get() in user_regset
  regset: Add explicit core note name in struct user_regset
  binfmt_elf: Dump non-arch notes with strictly matching name and type
  ARC: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
  ARM: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
  arm64: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
    names
  csky: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
  hexagon: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
    names
  LoongArch: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
    names
  m68k: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
  MIPS: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
  nios2: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
    names
  openrisc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
    names
  parisc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
    names
  powerpc/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
    names
  riscv: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
    names
  s390/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
  sh: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
  sparc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
    names
  x86/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
  um: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
  xtensa: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
    names
  binfmt_elf: Warn on missing or suspicious regset note names

 arch/arc/kernel/ptrace.c                 |  4 +-
 arch/arm/kernel/ptrace.c                 |  6 +-
 arch/arm64/kernel/ptrace.c               | 52 ++++++++---------
 arch/csky/kernel/ptrace.c                |  4 +-
 arch/hexagon/kernel/ptrace.c             |  2 +-
 arch/loongarch/kernel/ptrace.c           | 16 ++---
 arch/m68k/kernel/ptrace.c                |  4 +-
 arch/mips/kernel/ptrace.c                | 20 +++----
 arch/nios2/kernel/ptrace.c               |  2 +-
 arch/openrisc/kernel/ptrace.c            |  4 +-
 arch/parisc/kernel/ptrace.c              |  8 +--
 arch/powerpc/kernel/ptrace/ptrace-view.c | 74 ++++++++++++------------
 arch/riscv/kernel/ptrace.c               | 12 ++--
 arch/s390/kernel/ptrace.c                | 42 +++++++-------
 arch/sh/kernel/ptrace_32.c               |  4 +-
 arch/sparc/kernel/ptrace_32.c            |  4 +-
 arch/sparc/kernel/ptrace_64.c            |  8 +--
 arch/x86/kernel/ptrace.c                 | 22 +++----
 arch/x86/um/ptrace.c                     | 10 ++--
 arch/xtensa/kernel/ptrace.c              |  4 +-
 fs/binfmt_elf.c                          | 36 +++++++-----
 fs/binfmt_elf_fdpic.c                    | 17 +++---
 include/linux/regset.h                   | 12 +++-
 23 files changed, 194 insertions(+), 173 deletions(-)


base-commit: 86731a2a651e58953fc949573895f2fa6d456841
-- 
2.34.1


