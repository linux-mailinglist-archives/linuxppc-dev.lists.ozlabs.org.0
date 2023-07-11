Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4DD74F4C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:17:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0mHd1k9fz3hRX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:17:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=205.139.111.44; helo=us-smtp-delivery-44.mimecast.com; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0mGh1wh6z3cTl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:16:59 +1000 (AEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-imzzeDBEMu-0xqerZ7W6tg-1; Tue, 11 Jul 2023 12:16:53 -0400
X-MC-Unique: imzzeDBEMu-0xqerZ7W6tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B32529AB45B;
	Tue, 11 Jul 2023 16:16:49 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.45.225.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67B04200B406;
	Tue, 11 Jul 2023 16:16:36 +0000 (UTC)
From: Alexey Gladkov <legion@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v4 0/5] Add a new fchmodat2() syscall
Date: Tue, 11 Jul 2023 18:16:02 +0200
Message-Id: <cover.1689092120.git.legion@kernel.org>
In-Reply-To: <cover.1689074739.git.legion@kernel.org>
References: <cover.1689074739.git.legion@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, fweimer@redhat.com, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, James.Bottomley@HansenPartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org
 , peterz@infradead.org, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In glibc, the fchmodat(3) function has a flags argument according to the
POSIX specification [1], but kernel syscalls has no such argument.
Therefore, libc implementations do workarounds using /proc. However,
this requires procfs to be mounted and accessible.

This patch set adds fchmodat2(), a new syscall. The syscall allows to
pass the AT_SYMLINK_NOFOLLOW flag to disable LOOKUP_FOLLOW. In all other
respects, this syscall is no different from fchmodat().

[1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/chmod.html

Changes since v3 [cover.1689074739.git.legion@kernel.org]:

* Rebased to master because a new syscall has appeared in master.
* Increased __NR_compat_syscalls as pointed out by Arnd Bergmann.
* Syscall renamed fchmodat4 -> fchmodat2 as suggested by Christian Brauner.
* Returned do_fchmodat4() the original name. We don't need to version
  internal functions.
* Fixed warnings found by checkpatch.pl.

Changes since v2 [20190717012719.5524-1-palmer@sifive.com]:

* Rebased to master.
* The lookup_flags passed to sys_fchmodat4 as suggested by Al Viro.
* Selftest added.

Changes since v1 [20190531191204.4044-1-palmer@sifive.com]:

* All architectures are now supported, which support squashed into a
  single patch.
* The do_fchmodat() helper function has been removed, in favor of directly
  calling do_fchmodat4().
* The patches are based on 5.2 instead of 5.1.

---

Alexey Gladkov (2):
  fs: Add fchmodat2()
  selftests: Add fchmodat2 selftest

Palmer Dabbelt (3):
  Non-functional cleanup of a "__user * filename"
  arch: Register fchmodat2, usually as syscall 452
  tools headers UAPI: Sync files changed by new fchmodat2 syscall

 arch/alpha/kernel/syscalls/syscall.tbl        |   1 +
 arch/arm/tools/syscall.tbl                    |   1 +
 arch/arm64/include/asm/unistd.h               |   2 +-
 arch/arm64/include/asm/unistd32.h             |   2 +
 arch/ia64/kernel/syscalls/syscall.tbl         |   1 +
 arch/m68k/kernel/syscalls/syscall.tbl         |   1 +
 arch/microblaze/kernel/syscalls/syscall.tbl   |   1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl     |   1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl     |   1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl     |   1 +
 arch/parisc/kernel/syscalls/syscall.tbl       |   1 +
 arch/powerpc/kernel/syscalls/syscall.tbl      |   1 +
 arch/s390/kernel/syscalls/syscall.tbl         |   1 +
 arch/sh/kernel/syscalls/syscall.tbl           |   1 +
 arch/sparc/kernel/syscalls/syscall.tbl        |   1 +
 arch/x86/entry/syscalls/syscall_32.tbl        |   1 +
 arch/x86/entry/syscalls/syscall_64.tbl        |   1 +
 arch/xtensa/kernel/syscalls/syscall.tbl       |   1 +
 fs/open.c                                     |  18 +-
 include/linux/syscalls.h                      |   4 +-
 include/uapi/asm-generic/unistd.h             |   5 +-
 tools/include/uapi/asm-generic/unistd.h       |   5 +-
 .../arch/mips/entry/syscalls/syscall_n64.tbl  |   2 +
 .../arch/powerpc/entry/syscalls/syscall.tbl   |   2 +
 .../perf/arch/s390/entry/syscalls/syscall.tbl |   2 +
 .../arch/x86/entry/syscalls/syscall_64.tbl    |   2 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/fchmodat2/.gitignore  |   2 +
 tools/testing/selftests/fchmodat2/Makefile    |   6 +
 .../selftests/fchmodat2/fchmodat2_test.c      | 162 ++++++++++++++++++
 30 files changed, 223 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/fchmodat2/.gitignore
 create mode 100644 tools/testing/selftests/fchmodat2/Makefile
 create mode 100644 tools/testing/selftests/fchmodat2/fchmodat2_test.c

-- 
2.33.8

