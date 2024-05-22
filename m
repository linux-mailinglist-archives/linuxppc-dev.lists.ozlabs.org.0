Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7488CB78B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 03:11:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pw3LlgZM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkY1j2XLJz3gLM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 11:02:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pw3LlgZM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--edliaw.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3-ennzgykdo0tsaxplvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--edliaw.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkY0y2TFpz3fsL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 11:01:52 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5ce12b4c1c9so9156409a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 18:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339705; x=1716944505; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AiMPkaHI6QhK2CJmpq8+zpj49LtomD4JDB1lxnZxnw8=;
        b=pw3LlgZMXkNJLvA/sriR2SD9zCY11HVqW8KI40rXAMNBK4TLWRsc9tNDHoo7w2xp8J
         j8mkpiA8XUNM8Z66o10P0xOXyy+e/mNHG7JWLfcnuwjCLATTKwEdO74k46cTmlqc/FDI
         WQ6NjsBL7aok7TYmnlhHQM3K7n5XGVPyWBFuiPMvjDYwgnIwpk0kWZNq7dmh5x8Gknfb
         0JEqugSoNCstxqpg5TWzOzMh1+6qXLGQuiEUaorRVcHV/66exWOS5IUQi4jTQTbsMYfp
         1Izt3d+Ue/rGXBDfzC4lWyXZ6LUYzbrc3zHVLe9MMuSyyeaPjIRBQAj5wviInySfW6WA
         NGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339705; x=1716944505;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AiMPkaHI6QhK2CJmpq8+zpj49LtomD4JDB1lxnZxnw8=;
        b=K1bjfvpAZkO8d+7l5LoF3U1fnLL+KnIP0pHNL1gxJz0vL9UNi47P7SBoPSRWJQiE8v
         0G4wjmFx5H4ocLaNtIAX3WhWjVJk7EAaHU8gJpl+4ZNdMdwGBI80vtp4bJu8r4LQhllV
         vXyptiZRRH3seGIxwS+HdPnh9MQvv0OeAf4Zbky4lIHP7SP5fkJ9qKKLhxogeFAz/Nr6
         +B2DViqN8zVhDxq/qXp9UsqkZF8aNp5SdYVyL8z2tRxdc13YDBleBQr5TG/XKTFJiyBs
         begQdyNY4Cs+8gVkB9gHPES/Qn+BkNA7r81krUcSQac22Kf+C/vPqlglY41i/ktzrvBt
         qyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXls6HRLTt4vKb+vfQoa/5UTWwCl1VQ8Jzf810LTNwRq5PFbQIX0NHKg4XozhE6AYLklmDBeWmi13mOAJ1dA63M2H4O5mJDZlle50cKDg==
X-Gm-Message-State: AOJu0YwlA1Jl9ZXIET3+X0inEzobxBRgBwtxV/ctKt1BmZQYlQZi/6SP
	jaGojWJW1qq9xTGn2SmjvbNRnT0qjChdZG0/EY2a8Euv4eDI5sdH18dF4QL36+xOVYzMcfKg3Vb
	C/w==
X-Google-Smtp-Source: AGHT+IEwhtcP2Wsrdw72dBNsjGFNbq5Xi2dgNZXJr6MvEmRavTI9gEBV8KtVsZkCMmfkVAyLe8n71LMPcBA=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90b:20d:b0:2b6:2079:7289 with SMTP id
 98e67ed59e1d1-2bd9f5c0f79mr1868a91.7.1716339704761; Tue, 21 May 2024 18:01:44
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:30 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-45-edliaw@google.com>
Subject: [PATCH v5 44/68] selftests/powerpc: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, kernel-team@android.com, bpf@vger.kernel.org, Edward Liaw <edliaw@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/powerpc/benchmarks/context_switch.c    | 2 --
 tools/testing/selftests/powerpc/benchmarks/exec_target.c       | 2 --
 tools/testing/selftests/powerpc/benchmarks/fork.c              | 2 --
 tools/testing/selftests/powerpc/benchmarks/futex_bench.c       | 3 ---
 tools/testing/selftests/powerpc/dexcr/hashchk_test.c           | 3 ---
 tools/testing/selftests/powerpc/dscr/dscr_default_test.c       | 3 ---
 tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c      | 3 ---
 tools/testing/selftests/powerpc/dscr/dscr_sysfs_thread_test.c  | 1 -
 tools/testing/selftests/powerpc/mm/exec_prot.c                 | 2 --
 tools/testing/selftests/powerpc/mm/pkey_exec_prot.c            | 2 --
 tools/testing/selftests/powerpc/mm/pkey_siginfo.c              | 2 --
 tools/testing/selftests/powerpc/mm/tlbie_test.c                | 2 --
 tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c            | 1 -
 tools/testing/selftests/powerpc/pmu/count_instructions.c       | 3 ---
 tools/testing/selftests/powerpc/pmu/count_stcx_fail.c          | 3 ---
 tools/testing/selftests/powerpc/pmu/ebb/ebb.c                  | 3 ---
 .../testing/selftests/powerpc/pmu/ebb/instruction_count_test.c | 3 ---
 tools/testing/selftests/powerpc/pmu/event.c                    | 2 --
 tools/testing/selftests/powerpc/pmu/lib.c                      | 3 ---
 tools/testing/selftests/powerpc/pmu/per_event_excludes.c       | 3 ---
 tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c          | 3 ---
 tools/testing/selftests/powerpc/ptrace/ptrace-syscall.c        | 2 --
 tools/testing/selftests/powerpc/signal/sig_sc_double_restart.c | 1 -
 tools/testing/selftests/powerpc/signal/sigreturn_kernel.c      | 3 ---
 tools/testing/selftests/powerpc/signal/sigreturn_vdso.c        | 3 ---
 tools/testing/selftests/powerpc/syscalls/ipc_unmuxed.c         | 2 --
 tools/testing/selftests/powerpc/tm/tm-exec.c                   | 2 --
 tools/testing/selftests/powerpc/tm/tm-poison.c                 | 2 --
 .../testing/selftests/powerpc/tm/tm-signal-context-force-tm.c  | 2 --
 tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c    | 2 --
 tools/testing/selftests/powerpc/tm/tm-tmspr.c                  | 2 --
 tools/testing/selftests/powerpc/tm/tm-trap.c                   | 2 --
 tools/testing/selftests/powerpc/tm/tm-unavailable.c            | 2 --
 tools/testing/selftests/powerpc/utils.c                        | 3 ---
 34 files changed, 79 deletions(-)

diff --git a/tools/testing/selftests/powerpc/benchmarks/context_switch.c b/tools/testing/selftests/powerpc/benchmarks/context_switch.c
index 96554e2794d1..0b245572bd45 100644
--- a/tools/testing/selftests/powerpc/benchmarks/context_switch.c
+++ b/tools/testing/selftests/powerpc/benchmarks/context_switch.c
@@ -4,8 +4,6 @@
  *
  * Copyright (C) 2015 Anton Blanchard <anton@au.ibm.com>, IBM
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <sched.h>
 #include <string.h>
diff --git a/tools/testing/selftests/powerpc/benchmarks/exec_target.c b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
index c14b0fc1edde..8646540037d8 100644
--- a/tools/testing/selftests/powerpc/benchmarks/exec_target.c
+++ b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
@@ -5,8 +5,6 @@
  *
  * Copyright 2018, Anton Blanchard, IBM Corp.
  */
-
-#define _GNU_SOURCE
 #include <unistd.h>
 #include <sys/syscall.h>
 
diff --git a/tools/testing/selftests/powerpc/benchmarks/fork.c b/tools/testing/selftests/powerpc/benchmarks/fork.c
index d312e638cb37..327231646a2a 100644
--- a/tools/testing/selftests/powerpc/benchmarks/fork.c
+++ b/tools/testing/selftests/powerpc/benchmarks/fork.c
@@ -5,8 +5,6 @@
  *
  * Copyright 2018, Anton Blanchard, IBM Corp.
  */
-
-#define _GNU_SOURCE
 #include <assert.h>
 #include <errno.h>
 #include <getopt.h>
diff --git a/tools/testing/selftests/powerpc/benchmarks/futex_bench.c b/tools/testing/selftests/powerpc/benchmarks/futex_bench.c
index 017057090490..0483a13c88f9 100644
--- a/tools/testing/selftests/powerpc/benchmarks/futex_bench.c
+++ b/tools/testing/selftests/powerpc/benchmarks/futex_bench.c
@@ -2,9 +2,6 @@
 /*
  * Copyright 2016, Anton Blanchard, Michael Ellerman, IBM Corp.
  */
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <sys/syscall.h>
 #include <time.h>
diff --git a/tools/testing/selftests/powerpc/dexcr/hashchk_test.c b/tools/testing/selftests/powerpc/dexcr/hashchk_test.c
index 645224bdc142..2499ab7fe563 100644
--- a/tools/testing/selftests/powerpc/dexcr/hashchk_test.c
+++ b/tools/testing/selftests/powerpc/dexcr/hashchk_test.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0+
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_default_test.c b/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
index 60ab02525b79..fe6aff1e5dad 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
@@ -9,9 +9,6 @@
  * Copyright 2012, Anton Blanchard, IBM Corporation.
  * Copyright 2015, Anshuman Khandual, IBM Corporation.
  */
-
-#define _GNU_SOURCE
-
 #include "dscr.h"
 
 #include <pthread.h>
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c b/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
index e2268e9183a8..93b6efdc2eef 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
@@ -15,9 +15,6 @@
  * Copyright 2012, Anton Blanchard, IBM Corporation.
  * Copyright 2015, Anshuman Khandual, IBM Corporation.
  */
-
-#define _GNU_SOURCE
-
 #include "dscr.h"
 #include "utils.h"
 
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_thread_test.c b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_thread_test.c
index 191ed126f118..ace7d23492c1 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_thread_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_thread_test.c
@@ -9,7 +9,6 @@
  *
  * Copyright 2015, Anshuman Khandual, IBM Corporation.
  */
-#define _GNU_SOURCE
 #include "dscr.h"
 
 static int test_thread_dscr(unsigned long val)
diff --git a/tools/testing/selftests/powerpc/mm/exec_prot.c b/tools/testing/selftests/powerpc/mm/exec_prot.c
index db75b2225de1..65712597cc68 100644
--- a/tools/testing/selftests/powerpc/mm/exec_prot.c
+++ b/tools/testing/selftests/powerpc/mm/exec_prot.c
@@ -6,8 +6,6 @@
  *
  * Test if applying execute protection on pages works as expected.
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
index 0af4f02669a1..5cf72cd9694d 100644
--- a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
+++ b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
@@ -6,8 +6,6 @@
  * Test if applying execute protection on pages using memory
  * protection keys works as expected.
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
index 2db76e56d4cb..fcaa591abf88 100644
--- a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
+++ b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
@@ -8,8 +8,6 @@
  * attempted to be protected by two different keys from two competing
  * threads at the same time.
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/testing/selftests/powerpc/mm/tlbie_test.c b/tools/testing/selftests/powerpc/mm/tlbie_test.c
index 48344a74b212..512cd405de92 100644
--- a/tools/testing/selftests/powerpc/mm/tlbie_test.c
+++ b/tools/testing/selftests/powerpc/mm/tlbie_test.c
@@ -14,8 +14,6 @@
  * and copy it back to the original area. This helps us to detect if any
  * store continued to happen after we marked the memory PROT_READ.
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <sys/mman.h>
 #include <sys/types.h>
diff --git a/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c b/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
index d6f99eb9be65..0b9b20668fa4 100644
--- a/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
+++ b/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <stdlib.h>
diff --git a/tools/testing/selftests/powerpc/pmu/count_instructions.c b/tools/testing/selftests/powerpc/pmu/count_instructions.c
index a3984ef1e96a..57d63ff75397 100644
--- a/tools/testing/selftests/powerpc/pmu/count_instructions.c
+++ b/tools/testing/selftests/powerpc/pmu/count_instructions.c
@@ -2,9 +2,6 @@
 /*
  * Copyright 2013, Michael Ellerman, IBM Corp.
  */
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <stdbool.h>
 #include <string.h>
diff --git a/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c b/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
index 2070a1e2b3a5..5d3bbd38528d 100644
--- a/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
+++ b/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
@@ -2,9 +2,6 @@
  * Copyright 2013, Michael Ellerman, IBM Corp.
  * Licensed under GPLv2.
  */
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <stdbool.h>
 #include <string.h>
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
index 21537d6eb6b7..e99a455e8c2e 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
@@ -2,9 +2,6 @@
 /*
  * Copyright 2014, Michael Ellerman, IBM Corp.
  */
-
-#define _GNU_SOURCE	/* For CPU_ZERO etc. */
-
 #include <sched.h>
 #include <sys/wait.h>
 #include <setjmp.h>
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/instruction_count_test.c b/tools/testing/selftests/powerpc/pmu/ebb/instruction_count_test.c
index eed338b18e11..ab3f888922d6 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/instruction_count_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/instruction_count_test.c
@@ -2,9 +2,6 @@
 /*
  * Copyright 2014, Michael Ellerman, IBM Corp.
  */
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <stdbool.h>
 #include <string.h>
diff --git a/tools/testing/selftests/powerpc/pmu/event.c b/tools/testing/selftests/powerpc/pmu/event.c
index 0c1c1bdba081..5468bd2c3c5b 100644
--- a/tools/testing/selftests/powerpc/pmu/event.c
+++ b/tools/testing/selftests/powerpc/pmu/event.c
@@ -2,8 +2,6 @@
 /*
  * Copyright 2013, Michael Ellerman, IBM Corp.
  */
-
-#define _GNU_SOURCE
 #include <unistd.h>
 #include <sys/syscall.h>
 #include <string.h>
diff --git a/tools/testing/selftests/powerpc/pmu/lib.c b/tools/testing/selftests/powerpc/pmu/lib.c
index 321357987408..fa208701dbdc 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.c
+++ b/tools/testing/selftests/powerpc/pmu/lib.c
@@ -2,9 +2,6 @@
 /*
  * Copyright 2014, Michael Ellerman, IBM Corp.
  */
-
-#define _GNU_SOURCE	/* For CPU_ZERO etc. */
-
 #include <errno.h>
 #include <sched.h>
 #include <setjmp.h>
diff --git a/tools/testing/selftests/powerpc/pmu/per_event_excludes.c b/tools/testing/selftests/powerpc/pmu/per_event_excludes.c
index ad32a09a6540..066e0c4799fd 100644
--- a/tools/testing/selftests/powerpc/pmu/per_event_excludes.c
+++ b/tools/testing/selftests/powerpc/pmu/per_event_excludes.c
@@ -2,9 +2,6 @@
 /*
  * Copyright 2014, Michael Ellerman, IBM Corp.
  */
-
-#define _GNU_SOURCE
-
 #include <elf.h>
 #include <limits.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
index e374c6b7ace6..1f7e3c63742d 100644
--- a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
@@ -16,9 +16,6 @@
  *
  * Copyright (C) 2018 Michael Neuling, IBM Corporation.
  */
-
-#define _GNU_SOURCE
-
 #include <unistd.h>
 #include <assert.h>
 #include <sched.h>
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-syscall.c b/tools/testing/selftests/powerpc/ptrace/ptrace-syscall.c
index 3353210dcdbd..6e5294c1b60b 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-syscall.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-syscall.c
@@ -8,8 +8,6 @@
  * test, and it was adapted to run on Powerpc by
  * Breno Leitao <leitao@debian.org>
  */
-#define _GNU_SOURCE
-
 #include <sys/ptrace.h>
 #include <sys/types.h>
 #include <sys/wait.h>
diff --git a/tools/testing/selftests/powerpc/signal/sig_sc_double_restart.c b/tools/testing/selftests/powerpc/signal/sig_sc_double_restart.c
index e3972264615b..8bad5e65bbb7 100644
--- a/tools/testing/selftests/powerpc/signal/sig_sc_double_restart.c
+++ b/tools/testing/selftests/powerpc/signal/sig_sc_double_restart.c
@@ -18,7 +18,6 @@
  *  that sucker at the same time.  Same for multiple signals of any kind
  *  interrupting that sucker on 64bit...
  */
-#define _GNU_SOURCE
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <sys/syscall.h>
diff --git a/tools/testing/selftests/powerpc/signal/sigreturn_kernel.c b/tools/testing/selftests/powerpc/signal/sigreturn_kernel.c
index 0a1b6e591eee..772c3373560f 100644
--- a/tools/testing/selftests/powerpc/signal/sigreturn_kernel.c
+++ b/tools/testing/selftests/powerpc/signal/sigreturn_kernel.c
@@ -2,9 +2,6 @@
 /*
  * Test that we can't sigreturn to kernel addresses, or to kernel mode.
  */
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <signal.h>
 #include <stdlib.h>
diff --git a/tools/testing/selftests/powerpc/signal/sigreturn_vdso.c b/tools/testing/selftests/powerpc/signal/sigreturn_vdso.c
index e282fff0fe25..d5aecd2c4b95 100644
--- a/tools/testing/selftests/powerpc/signal/sigreturn_vdso.c
+++ b/tools/testing/selftests/powerpc/signal/sigreturn_vdso.c
@@ -5,9 +5,6 @@
  *
  * See handle_rt_signal64() and setup_trampoline() in signal_64.c
  */
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <stdio.h>
 #include <signal.h>
diff --git a/tools/testing/selftests/powerpc/syscalls/ipc_unmuxed.c b/tools/testing/selftests/powerpc/syscalls/ipc_unmuxed.c
index 4c582524aeb3..a49c699d86d4 100644
--- a/tools/testing/selftests/powerpc/syscalls/ipc_unmuxed.c
+++ b/tools/testing/selftests/powerpc/syscalls/ipc_unmuxed.c
@@ -5,8 +5,6 @@
  * This test simply tests that certain syscalls are implemented. It doesn't
  * actually exercise their logic in any way.
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <stdio.h>
 #include <unistd.h>
diff --git a/tools/testing/selftests/powerpc/tm/tm-exec.c b/tools/testing/selftests/powerpc/tm/tm-exec.c
index c59919d6710d..8cfc859dcf37 100644
--- a/tools/testing/selftests/powerpc/tm/tm-exec.c
+++ b/tools/testing/selftests/powerpc/tm/tm-exec.c
@@ -8,8 +8,6 @@
  * It makes little sense for after an exec() call for the previously
  * suspended transaction to still exist.
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <inttypes.h>
 #include <libgen.h>
diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c b/tools/testing/selftests/powerpc/tm/tm-poison.c
index a7bbf034b5bb..1b3a596a6a51 100644
--- a/tools/testing/selftests/powerpc/tm/tm-poison.c
+++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
@@ -11,8 +11,6 @@
  * present child's poison will leak into parent's f31 or vr31 registers,
  * otherwise, poison will never leak into parent's f31 and vr31 registers.
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
index 421cb082f6be..f28ba2828df6 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
@@ -15,8 +15,6 @@
  * This test never fails (as returning EXIT_FAILURE). It either succeeds,
  * or crash the kernel (on a buggy kernel).
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <signal.h>
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c b/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
index 06b801906f27..73f8e7dd5a1a 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
@@ -8,8 +8,6 @@
  * It returns from the signal handler with the CPU at suspended state, but
  * without setting usercontext MSR Transaction State (TS) fields.
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <signal.h>
diff --git a/tools/testing/selftests/powerpc/tm/tm-tmspr.c b/tools/testing/selftests/powerpc/tm/tm-tmspr.c
index dd5ddffa28b7..01118f7db1b2 100644
--- a/tools/testing/selftests/powerpc/tm/tm-tmspr.c
+++ b/tools/testing/selftests/powerpc/tm/tm-tmspr.c
@@ -22,8 +22,6 @@
  *    	(b) abort transaction
  *	(c) check TEXASR to see if FS has been corrupted
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
diff --git a/tools/testing/selftests/powerpc/tm/tm-trap.c b/tools/testing/selftests/powerpc/tm/tm-trap.c
index 97cb74768e30..164b345b5bd3 100644
--- a/tools/testing/selftests/powerpc/tm/tm-trap.c
+++ b/tools/testing/selftests/powerpc/tm/tm-trap.c
@@ -26,8 +26,6 @@
  * the endianness is verified on subsequent traps to determine if the
  * endianness "flipped back" to the native endianness (BE).
  */
-
-#define _GNU_SOURCE
 #include <error.h>
 #include <stdio.h>
 #include <stdlib.h>
diff --git a/tools/testing/selftests/powerpc/tm/tm-unavailable.c b/tools/testing/selftests/powerpc/tm/tm-unavailable.c
index 6bf1b65b020d..712267831112 100644
--- a/tools/testing/selftests/powerpc/tm/tm-unavailable.c
+++ b/tools/testing/selftests/powerpc/tm/tm-unavailable.c
@@ -13,8 +13,6 @@
  * corruption, but only for registers vs0 and vs32, which are respectively
  * representatives of FP and VEC/Altivec reg sets.
  */
-
-#define _GNU_SOURCE
 #include <error.h>
 #include <stdio.h>
 #include <stdlib.h>
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index e5f2d8735c64..664722a01636 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -2,9 +2,6 @@
 /*
  * Copyright 2013-2015, Michael Ellerman, IBM Corp.
  */
-
-#define _GNU_SOURCE	/* For CPU_ZERO etc. */
-
 #include <elf.h>
 #include <errno.h>
 #include <fcntl.h>
-- 
2.45.1.288.g0e0cd299f1-goog

