Return-Path: <linuxppc-dev+bounces-6639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 224A3A4BE03
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:19:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5xCn5fySz30T9;
	Mon,  3 Mar 2025 22:19:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000757;
	cv=none; b=BJUH3+QNuBj7aLVIm/j78Ox96bDUM811/dgc45lsqufIxssnHGPjMTUNbDVeue4E0iC9HAqm9b7QCmuBZN5R7lqgm3zQvW9u5NAPXoGPRZeC3iWpE7ejrZDSWisyeNi+BC8zrIZVk4jZykvsOREX7xcbsArhbbPG+2o0d8zU4Wh5UAol34PVGmSYmNG91TwwLdVmg5PRXBkzFaPQ8r7ga2UqsXPlGDhsqcGVAL2RLvqm9JOtpkIEKAW1SJ+Kh6sEAnmRFF3tUrzv4HM0teLULffXzbLAoyyLeyIq3B97mAZoOYXSQUaHrHhv8Wkmt7kJ8UuwAlkcv55ba4rPkUsbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000757; c=relaxed/relaxed;
	bh=T7Hhiapw2mmxFdPBFgQ0Pi8GGY5rvQkPmyRPXzrBd2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A0xRWMTfPWOHYIkI5C0th37Kn9j1IDovpgdINPa0qS/bx8j4YWctpLaBOphSNaz28wfLGC35gufkDJGlrzhGg8GyWFmQ1UggfYcuJwC1gJ1FFW0w5VAGZuAMvMhzLJWpsIaqjj8JM0HESxWimr5Sman94keVCems7Yj5iOOgukjQn2ilaZCZQZsrzZVvWl1h87i81B1DbWP+MleqFCUzzGFP8kF+P4avkV0UlV6P8gc/Y+U+pzo2nKUsBJKMz/YPrf12vsXbfKjq3vA/NqNKuIVOaKZz2YzHwS50UIy5wmjqG4aqXKVWoVCTTklhA7XvUIhNgLd8VRtyOH+gYQhWkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5xCm2X77z30Kg
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:19:15 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 324F672C8CC;
	Mon,  3 Mar 2025 14:19:11 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 01EDE7CCB3B; Mon,  3 Mar 2025 13:19:10 +0200 (IST)
Date: Mon, 3 Mar 2025 13:19:10 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Helge Deller <deller@gmx.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, strace-devel@lists.strace.io,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH v7 0/6] ptrace: introduce PTRACE_SET_SYSCALL_INFO API
Message-ID: <20250303111910.GA24170@strace.io>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

PTRACE_SET_SYSCALL_INFO is a generic ptrace API that complements
PTRACE_GET_SYSCALL_INFO by letting the ptracer modify details of
system calls the tracee is blocked in.

This API allows ptracers to obtain and modify system call details in a
straightforward and architecture-agnostic way, providing a consistent way
of manipulating the system call number and arguments across architectures.

As in case of PTRACE_GET_SYSCALL_INFO, PTRACE_SET_SYSCALL_INFO also
does not aim to address numerous architecture-specific system call ABI
peculiarities, like differences in the number of system call arguments
for such system calls as pread64 and preadv.

The current implementation supports changing only those bits of system call
information that are used by strace system call tampering, namely, syscall
number, syscall arguments, and syscall return value.

Support of changing additional details returned by PTRACE_GET_SYSCALL_INFO,
such as instruction pointer and stack pointer, could be added later if
needed, by using struct ptrace_syscall_info.flags to specify the additional
details that should be set.  Currently, "flags" and "reserved" fields of
struct ptrace_syscall_info must be initialized with zeroes; "arch",
"instruction_pointer", and "stack_pointer" fields are currently ignored.

PTRACE_SET_SYSCALL_INFO currently supports only PTRACE_SYSCALL_INFO_ENTRY,
PTRACE_SYSCALL_INFO_EXIT, and PTRACE_SYSCALL_INFO_SECCOMP operations.
Other operations could be added later if needed.

Ideally, PTRACE_SET_SYSCALL_INFO should have been introduced along with
PTRACE_GET_SYSCALL_INFO, but it didn't happen.  The last straw that
convinced me to implement PTRACE_SET_SYSCALL_INFO was apparent failure
to provide an API of changing the first system call argument on riscv
architecture [1].

ptrace(2) man page:

long ptrace(enum __ptrace_request request, pid_t pid, void *addr, void *data);
...
PTRACE_SET_SYSCALL_INFO
       Modify information about the system call that caused the stop.
       The "data" argument is a pointer to struct ptrace_syscall_info
       that specifies the system call information to be set.
       The "addr" argument should be set to sizeof(struct ptrace_syscall_info)).

[1] https://lore.kernel.org/all/59505464-c84a-403d-972f-d4b2055eeaac@gmail.com/

Notes:
    v7:
    * csky: Fix typo in comment
    * mips: syscall_set_arguments: Remove mips_syscall_is_indirect check
    * mips: syscall_set_nr: Reword comment
    * mips: Add Reviewed-by
    * v6: https://lore.kernel.org/all/20250217090834.GA18175@strace.io/

    v6:
    * mips: Submit mips_get_syscall_arg() o32 fix via mips tree
      to get it merged into v6.14-rc3
    * Rebase to v6.14-rc3
    * v5: https://lore.kernel.org/all/20250210113336.GA887@strace.io/

    v5:
    * ptrace: Extend the commit message to say that the new API does not aim
      to address numerous architecture-specific syscall ABI peculiarities
    * selftests: Add a workaround for s390 16-bit syscall numbers
    * parisc: Add Acked-by
    * v4: https://lore.kernel.org/all/20250203065849.GA14120@strace.io/

    v4:
    * Split out syscall_set_return_value() for hexagon into a separate patch
    * s390: Change the style of syscall_set_arguments() implementation as
      requested
    * ptrace: Add Reviewed-by
    * v3: https://lore.kernel.org/all/20250128091445.GA8257@strace.io/

    v3:
    * powerpc: Submit syscall_set_return_value() fix for "sc" case separately
    * mips: Do not introduce erroneous argument truncation on mips n32,
      add a detailed description to the commit message of the
      mips_get_syscall_arg() change
    * ptrace: Add explicit padding to the end of struct ptrace_syscall_info,
      simplify obtaining of user ptrace_syscall_info,
      do not introduce PTRACE_SYSCALL_INFO_SIZE_VER0
    * ptrace: Change the return type of ptrace_set_syscall_info_* functions
      from "unsigned long" to "int"
    * ptrace: Add -ERANGE check to ptrace_set_syscall_info_exit(),
      add comments to -ERANGE checks
    * ptrace: Update comments about supported syscall stops
    * selftests: Extend set_syscall_info test, fix for mips n32
    * riscv: Add Tested-by and Reviewed-by

    v2:
    * Add patch to fix syscall_set_return_value() on powerpc
    * Add patch to fix mips_get_syscall_arg() on mips
    * Add syscall_set_return_value() implementation on hexagon
    * Add syscall_set_return_value() invocation to syscall_set_nr()
      on arm and arm64.
    * Fix syscall_set_nr() and mips_set_syscall_arg() on mips
    * Add a comment to syscall_set_nr() on arc, powerpc, s390, sh,
      and sparc
    * Remove redundant ptrace_syscall_info.op assignments in
      ptrace_get_syscall_info_*
    * Minor style tweaks in ptrace_get_syscall_info_op()
    * Remove syscall_set_return_value() invocation from
      ptrace_set_syscall_info_entry()
    * Skip syscall_set_arguments() invocation in case of syscall number -1
      in ptrace_set_syscall_info_entry() 
    * Split ptrace_syscall_info.reserved into ptrace_syscall_info.reserved
      and ptrace_syscall_info.flags
    * Use __kernel_ulong_t instead of unsigned long in set_syscall_info test

Dmitry V. Levin (6):
  hexagon: add syscall_set_return_value()
  syscall.h: add syscall_set_arguments()
  syscall.h: introduce syscall_set_nr()
  ptrace_get_syscall_info: factor out ptrace_get_syscall_info_op
  ptrace: introduce PTRACE_SET_SYSCALL_INFO request
  selftests/ptrace: add a test case for PTRACE_SET_SYSCALL_INFO

 arch/arc/include/asm/syscall.h                |  25 +
 arch/arm/include/asm/syscall.h                |  37 ++
 arch/arm64/include/asm/syscall.h              |  29 +
 arch/csky/include/asm/syscall.h               |  13 +
 arch/hexagon/include/asm/syscall.h            |  21 +
 arch/loongarch/include/asm/syscall.h          |  15 +
 arch/m68k/include/asm/syscall.h               |   7 +
 arch/microblaze/include/asm/syscall.h         |   7 +
 arch/mips/include/asm/syscall.h               |  43 ++
 arch/nios2/include/asm/syscall.h              |  16 +
 arch/openrisc/include/asm/syscall.h           |  13 +
 arch/parisc/include/asm/syscall.h             |  19 +
 arch/powerpc/include/asm/syscall.h            |  20 +
 arch/riscv/include/asm/syscall.h              |  16 +
 arch/s390/include/asm/syscall.h               |  21 +
 arch/sh/include/asm/syscall_32.h              |  24 +
 arch/sparc/include/asm/syscall.h              |  22 +
 arch/um/include/asm/syscall-generic.h         |  19 +
 arch/x86/include/asm/syscall.h                |  43 ++
 arch/xtensa/include/asm/syscall.h             |  18 +
 include/asm-generic/syscall.h                 |  30 +
 include/uapi/linux/ptrace.h                   |   7 +-
 kernel/ptrace.c                               | 179 +++++-
 tools/testing/selftests/ptrace/Makefile       |   2 +-
 .../selftests/ptrace/set_syscall_info.c       | 519 ++++++++++++++++++
 25 files changed, 1138 insertions(+), 27 deletions(-)
 create mode 100644 tools/testing/selftests/ptrace/set_syscall_info.c


base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6

-- 
ldv

