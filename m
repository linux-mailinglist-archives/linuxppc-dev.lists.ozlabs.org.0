Return-Path: <linuxppc-dev+bounces-4797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07961A04DF7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 00:59:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSShr2fgHz305G;
	Wed,  8 Jan 2025 10:59:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736291509;
	cv=none; b=Q2019VOk8PMq4atSc1bo0aQCRGwnwZYxR+vtjNLu4VbYB0NXG5WEsy3TKWwEg7xPOGtqC0SDb37C1jwgSeq00Dvcu+zhRkuULm7RIjueJyl6jOfNYxm1BMz6bc7KGehP0pSsThcrKUSWz2oI5eDunm2kLKLghmCXK2muwHtYM7ZSErBkq51smwBp0pkJWLNlLJ2sc73hOJYdvHPg0E88o00J8S87aOkDGvZ1/1eyCL4zfamTxTDHPHMX6neq1M8CohgzdtUxTOBusMLOTuPzVEjnprHMmiBH1KrAPaKMx+KSnt9iPUyMkUTZhfKpOqu/RHrZDNAltdI0EWb/+l3crA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736291509; c=relaxed/relaxed;
	bh=u6a2n4baT+UcQEFDgg56G5JJMoO2eqY95Qi7M1LETbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a76fv3plst4yxJkMq+NOoJ5eEKw3cii3FT2SGKpWcFbpTNy7UCKbKJSAXblS2v7I28SNo9rn+OYXYVfevJ/+wClHjDsm5CmeZXskFCHXyIEMSeiAYKKbWySBvol9YjT1H9CTDUcZtBeXDXBoA9ZVJ2bhvmMdRQ4+U6GlQop48BspN8sqxbvKRa9qHjmOUDa9xvHZnGUQrdYK0CSHY3otI8C8yymhw0UmSRU+dJUh5l65hC1rGhbYiZo9+R/LCkN3TmR1Zy7Hjzu9f0ZyGchZBzzzTmtU38mPF0BFVrTnJSNJTBDYhC/zJqAHXZMvf9oiSwH5beM36/D3f0aY89/otg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSRdJ4Qd9z2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 10:11:48 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 3EEAD72C8CC;
	Wed,  8 Jan 2025 02:01:53 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 2CA007CCB3A; Wed,  8 Jan 2025 01:01:53 +0200 (IST)
Date: Wed, 8 Jan 2025 01:01:53 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
	Shuah Khan <shuah@kernel.org>, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/6] ptrace: introduce PTRACE_SET_SYSCALL_INFO API
Message-ID: <20250107230153.GA30560@strace.io>
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
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

PTRACE_SET_SYSCALL_INFO is a generic ptrace API that complements
PTRACE_GET_SYSCALL_INFO by letting the ptracer modify details of
system calls the tracee is blocked in.

This API allows ptracers to obtain and modify system call details
in a straightforward and architecture-agnostic way.

Current implementation supports changing only those bits of system call
information that are used by strace, namely, syscall number, syscall
arguments, and syscall return value.

Support of changing additional details returned by PTRACE_GET_SYSCALL_INFO,
such as instruction pointer and stack pointer, could be added later
if needed, by re-using struct ptrace_syscall_info.reserved to specify
the additional details that should be set.  Currently, the reserved
field of struct ptrace_syscall_info must be initialized with zeroes;
arch, instruction_pointer, and stack_pointer fields are ignored.

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

Dmitry V. Levin (6):
  Revert "arch: remove unused function syscall_set_arguments()"
  syscall.h: add syscall_set_arguments() on remaining
    HAVE_ARCH_TRACEHOOK arches
  syscall.h: introduce syscall_set_nr()
  ptrace_get_syscall_info: factor out ptrace_get_syscall_info_op
  ptrace: introduce PTRACE_SET_SYSCALL_INFO request
  selftests/ptrace: add a test case for PTRACE_SET_SYSCALL_INFO

 arch/arc/include/asm/syscall.h                |  20 +
 arch/arm/include/asm/syscall.h                |  25 +
 arch/arm64/include/asm/syscall.h              |  20 +
 arch/csky/include/asm/syscall.h               |  13 +
 arch/hexagon/include/asm/syscall.h            |  14 +
 arch/loongarch/include/asm/syscall.h          |  15 +
 arch/m68k/include/asm/syscall.h               |   7 +
 arch/microblaze/include/asm/syscall.h         |   7 +
 arch/mips/include/asm/syscall.h               |  53 +++
 arch/nios2/include/asm/syscall.h              |  16 +
 arch/openrisc/include/asm/syscall.h           |  13 +
 arch/parisc/include/asm/syscall.h             |  19 +
 arch/powerpc/include/asm/syscall.h            |  15 +
 arch/riscv/include/asm/syscall.h              |  16 +
 arch/s390/include/asm/syscall.h               |  19 +
 arch/sh/include/asm/syscall_32.h              |  19 +
 arch/sparc/include/asm/syscall.h              |  17 +
 arch/um/include/asm/syscall-generic.h         |  19 +
 arch/x86/include/asm/syscall.h                |  43 ++
 arch/xtensa/include/asm/syscall.h             |  18 +
 include/asm-generic/syscall.h                 |  30 ++
 include/linux/ptrace.h                        |   3 +
 include/uapi/linux/ptrace.h                   |   3 +-
 kernel/ptrace.c                               | 154 ++++++-
 tools/testing/selftests/ptrace/Makefile       |   2 +-
 .../selftests/ptrace/set_syscall_info.c       | 436 ++++++++++++++++++
 26 files changed, 994 insertions(+), 22 deletions(-)
 create mode 100644 tools/testing/selftests/ptrace/set_syscall_info.c

-- 
ldv

