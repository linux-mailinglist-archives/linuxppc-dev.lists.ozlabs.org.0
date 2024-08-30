Return-Path: <linuxppc-dev+bounces-822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1877396663B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 17:57:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwN835J11z30C5;
	Sat, 31 Aug 2024 01:57:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725033443;
	cv=none; b=Cwhnka95Q604YttrN82f6HUvYo3SINOIasddblzfueazhQbzuJszjnP9ciSnGDdKVCVXTUDfKPOuOQXrTEJveMzMpvdRUQMmsh/usjKfJP34os3JPF86eymT/jtXkVpFoFdu6v+0yUjCo+HlygB6sjhYJWgslLLZhvIqQEz81CLB9cSnzcr+eHSKlS14ULeT1RVAuLuHLQv0IwIJGEzXkzF5FTlT71h080v8TH39V7K2YQKVrNjW2fP+oO0FS1StDQEHAxeUu3dEslAcorFkFnMitxW3q8qTGCgCbMSsD+W8uyp9oVuRwHeeSOqtg4lhPM3MPDouGAIjX3H08JZr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725033443; c=relaxed/relaxed;
	bh=vjyCJEohfF8T6frh9+utcYWG5B1rPS3HHzOAAE4Yf8k=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding; b=XWkJHfc3Rhdr4DBo0co8VqhGfyeYDRHyFvCNA2FA5EJwTqP4LxoLgWdq0J9yXclAyW4/Rpqj2NUieHXEuyBJVizqOi7yTiaoXL6HRRfLRQsbHWQ9IxgLt5YnSzY9lXIpz4FFAEDqVM6HLMNWioNXjjueXBOML/PEkwgaMBn2+2ZKUoyxpRBe0pNg7ouMM8+GEc0V2jcMs6DUXYUkC9hwDzS4nyXmdQnyjzCS+N45SvcWFYpZwW1n0Z8J9sXegNx3/8eDgwqSCaqJhtbeYszFGx0nv1To62iJMaBkBN3yNJ2LhIrJFNeW/NBwFLf98XQmS++05oE2V7Y5YV8E4MJKXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwN832t12z2yw9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 01:57:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WwN7x0kQwz9sS8;
	Fri, 30 Aug 2024 17:57:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mymjIuAY4EBv; Fri, 30 Aug 2024 17:57:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WwN7w6rsfz9sS7;
	Fri, 30 Aug 2024 17:57:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D8B458B799;
	Fri, 30 Aug 2024 17:57:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CPmUjCYwGEVP; Fri, 30 Aug 2024 17:57:16 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A89FC8B764;
	Fri, 30 Aug 2024 17:57:15 +0200 (CEST)
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
Subject: [PATCH v3 0/5] Wire up getrandom() vDSO implementation on powerpc
Date: Fri, 30 Aug 2024 17:57:04 +0200
Message-ID: <cover.1725031952.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725033425; l=3371; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=y3iwLZ6Sa8VJum04nYQaErSpQ5CPdwViE691hLVfI+o=; b=NRHCstSidDvuiokedYQKGefeU1iTW0BD0L3KzlxjbIajJ3Ub+7iTxmRzio38XlxFBdVXoBJ9x Gr7YMgiPmZBCG4DIWRtCC1DzycecQa7YDwArX2NN0WmY3s+K89z/7l4
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

In order to run selftests, some fixes are needed, see
https://lore.kernel.org/linuxppc-dev/6c5da802e72befecfa09046c489aa45d934d611f.1725020674.git.christophe.leroy@csgroup.eu/

Those selftest fixes are independant and are not required to apply
and use this series.

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
 arch/powerpc/include/asm/asm-compat.h        |   8 +
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
 arch/powerpc/kernel/vdso/vgetrandom-chacha.S | 299 +++++++++++++++++++
 arch/powerpc/kernel/vdso/vgetrandom.c        |  14 +
 fs/proc/task_mmu.c                           |   4 +-
 include/linux/mm.h                           |   4 +-
 include/trace/events/mmflags.h               |   4 +-
 tools/arch/powerpc/vdso                      |   1 +
 tools/testing/selftests/vDSO/Makefile        |   4 +
 19 files changed, 492 insertions(+), 42 deletions(-)
 create mode 100644 arch/powerpc/include/asm/vdso/getrandom.h
 create mode 100644 arch/powerpc/kernel/vdso/getrandom.S
 create mode 100644 arch/powerpc/kernel/vdso/vgetrandom-chacha.S
 create mode 100644 arch/powerpc/kernel/vdso/vgetrandom.c
 create mode 120000 tools/arch/powerpc/vdso

-- 
2.44.0


