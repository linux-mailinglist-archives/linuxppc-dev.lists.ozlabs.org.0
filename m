Return-Path: <linuxppc-dev+bounces-866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0C09686F6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 14:04:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy6rL12k8z2xcw;
	Mon,  2 Sep 2024 22:04:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725278690;
	cv=none; b=P+8h9jLCIe5pTRI2ktnBibZ8VlhgEOuJ3pYVuizN6Ptf5552nUds9U8sDgUJjOsWvrHyG849DDL++tvAtXjbcNZwdYRqJrLmW0fX9qyi9lLwlhBjbecvlmGmCR/7wspBjo4MlDY0TKVscBXtk5wAG5zlPP6U0dOZaTLI0u1Qt41Aj5NRbm9Bgd3VaHpjzsiPmklcskn13kJfTKj46jPHzmaAAs9y5iDfYA/zAFw7iHfH3DDrTfkyHXrt4IPO8h3Jrgd7LjTM/bF2DBF6rvTI4/C4AFlJTADc8L6XTYtqX/jjHImp+ZCtBwvqdFwXdYe8EMDu/U+ILWcRwZckYBXSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725278690; c=relaxed/relaxed;
	bh=LjHMEt846IW9aLaYIYwEYTaIvvYR0XhxSzJN1jZ4iew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SU8jN45uahCsE3zatyAr0EqYF7IcjjUalZubGx+AD6+sZDNz1piRzj2aAO113zt5TCE5MPcG5uvkfKmf7VACRKt31S2DE0ay+V7zJYlfCkY+kgqyi3MUYo8KtLMDHB/Ya7D4YQcpbK11JWkWwdbS5n9hUuwytuWQJO/HRIwjZKAeUnKBqFuDjCuUNS9VmkBAkZfZSGZJMRuSLyNHZkz9aM6E8owN4gqGucdzeZz064EZVXWOJj2dfg0fQqS5rzKBKkI1SbgKWB2flQ6KcwDQ/Rd66vBIP9dqevPmKXh4vGpi6DxZqlnnHdUySx347f2nkrw5+7pK6oEqElpqihtV0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy6rK5lvfz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 22:04:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wy6rF4LfZz9sSN;
	Mon,  2 Sep 2024 14:04:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yk9NbO304bBT; Mon,  2 Sep 2024 14:04:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wy6rF35r3z9sS7;
	Mon,  2 Sep 2024 14:04:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5422D8B76D;
	Mon,  2 Sep 2024 14:04:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 52TK7Nj36tHo; Mon,  2 Sep 2024 14:04:45 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.167])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 524D28B763;
	Mon,  2 Sep 2024 14:04:44 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <shuah@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v4 0/5] Wire up getrandom() vDSO implementation on powerpc
Date: Mon,  2 Sep 2024 14:04:37 +0200
Message-ID: <cover.1725278148.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725278679; l=3360; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=6QJA22qLgaef3fSOvlKvx8xuZHLDNXZ+/mQjcDCzEMY=; b=rkRd0PJANyDxoARin8UZaDw85VDVM67JUNJRPKtg/l5osHwVfNdLo2rqVgI+mMAut8vXZ2bwB KXoGERc0HRoCjQSpBMuxuW9ZLqlOAtlY/8R4T+eTO3MO/rpoaIMyeN7
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

This series wires up getrandom() vDSO implementation on powerpc.

Tested on PPC32 on real hardware.
Tested on PPC64 (both BE and LE) on QEMU:

Performance on powerpc 885:
	~# ./vdso_test_getrandom bench-single
	   vdso: 25000000 times in 62.938002291 seconds
	   libc: 25000000 times in 535.581916866 seconds
	syscall: 25000000 times in 531.525042806 seconds

Performance on powerpc 8321:
	~# ./vdso_test_getrandom bench-single
	   vdso: 25000000 times in 16.899318858 seconds
	   libc: 25000000 times in 131.050596522 seconds
	syscall: 25000000 times in 129.794790389 seconds

Performance on QEMU pseries:
	~ # ./vdso_test_getrandom bench-single
	   vdso: 25000000 times in 4.977777162 seconds
	   libc: 25000000 times in 75.516749981 seconds
	syscall: 25000000 times in 86.842242014 seconds

Changes in v4:
- Rebased on recent random git tree (963233ff0133) (The new tree includes selftests fixes)
- Read/write counter in native byte order
- Don't use anymore compat macros to write output
- Fixed selftests build failure with patch 4 (without patch 5) on little endian on PPC64
- Implement a __kernel_getrandom() stub returning ENOSYS on ppc64 in patch 4 (without patch 5) to make selftests happy.

Changes in v3:
- Rebased on recent random git tree (0c7e00e22c21)
- Fixed build failures reported by robots around VM_DROPPABLE
- Fixed crash on PPC64 due to clobbered r13 by not using r13 anymore (saving it was not enough for signals).
- Split final patch in two, first for PPC32, second for PPC64
- Moved selftest fixes out of this series

Changes in v2:
- Define VM_DROPPABLE for powerpc/32
- Fixes generic vDSO getrandom headers to enable CONFIG_COMPAT build.
- Fixed size of generation counter
- Fixed selftests to work on non x86 architectures

Christophe Leroy (5):
  mm: Define VM_DROPPABLE for powerpc/32
  powerpc/vdso32: Add crtsavres
  powerpc/vdso: Refactor CFLAGS for CVDSO build
  powerpc/vdso: Wire up getrandom() vDSO implementation on PPC32
  powerpc/vdso: Wire up getrandom() vDSO implementation on PPC64

 arch/powerpc/Kconfig                         |   1 +
 arch/powerpc/include/asm/mman.h              |   2 +-
 arch/powerpc/include/asm/vdso/getrandom.h    |  54 ++++
 arch/powerpc/include/asm/vdso/vsyscall.h     |   6 +
 arch/powerpc/include/asm/vdso_datapage.h     |   2 +
 arch/powerpc/kernel/asm-offsets.c            |   1 +
 arch/powerpc/kernel/vdso/Makefile            |  57 ++--
 arch/powerpc/kernel/vdso/getrandom.S         |  58 ++++
 arch/powerpc/kernel/vdso/gettimeofday.S      |  13 -
 arch/powerpc/kernel/vdso/vdso32.lds.S        |   1 +
 arch/powerpc/kernel/vdso/vdso64.lds.S        |   1 +
 arch/powerpc/kernel/vdso/vgetrandom-chacha.S | 320 +++++++++++++++++++
 arch/powerpc/kernel/vdso/vgetrandom.c        |  14 +
 fs/proc/task_mmu.c                           |   4 +-
 include/linux/mm.h                           |   4 +-
 include/trace/events/mmflags.h               |   4 +-
 tools/testing/selftests/vDSO/Makefile        |   2 +-
 17 files changed, 501 insertions(+), 43 deletions(-)
 create mode 100644 arch/powerpc/include/asm/vdso/getrandom.h
 create mode 100644 arch/powerpc/kernel/vdso/getrandom.S
 create mode 100644 arch/powerpc/kernel/vdso/vgetrandom-chacha.S
 create mode 100644 arch/powerpc/kernel/vdso/vgetrandom.c

-- 
2.44.0


