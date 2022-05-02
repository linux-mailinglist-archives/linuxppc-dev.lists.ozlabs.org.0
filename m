Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3693B517A75
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 01:09:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ksf120TrRz3bYT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 09:09:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AgFoaP/B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=AgFoaP/B; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsdxF5lQ7z3bZd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 09:05:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 758B5B81A4F;
 Mon,  2 May 2022 23:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8A1C385AC;
 Mon,  2 May 2022 23:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651532750;
 bh=/ct6k5jCOL9coh+Wgn3NQS0jsMqkOmvkRoD0OlovsjQ=;
 h=Subject:To:Cc:From:Date:From;
 b=AgFoaP/BpZ7Fse4gwTSV5tRx0+fw6FAFaD8uJix39vLYH+kBjGcaWxGeicTPJVD+z
 TVHoeT9foD9x+xfE4U0ZqV38ZR+dinhX/xg5gS+UOOq+juTW9jBgu6czmsgqo39DVG
 KiVQhY67r1p/gxbsvg4Ix9xLAHuz5Xu6ZJ/pA9jI=
Subject: Patch "perf symbol: Remove arch__symbols__fixup_end()" has been added
 to the 5.17-stable tree
To: acme@redhat.com, gregkh@linuxfoundation.org, hca@linux.ibm.com,
 irogers@google.com, john.garry@huawei.com, jolsa@kernel.org,
 leo.yan@linaro.org, linuxppc-dev@lists.ozlabs.org, mark.rutland@arm.com,
 mathieu.poirier@linaro.org, mhiramat@kernel.org, mingo@kernel.org,
 mpe@ellerman.id.au, mpetlan@redhat.com, namhyung@kernel.org,
 peterz@infradead.org, songliubraving@fb.com, will@kernel.org
From: <gregkh@linuxfoundation.org>
Date: Tue, 03 May 2022 01:05:41 +0200
Message-ID: <1651532741108141@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    perf symbol: Remove arch__symbols__fixup_end()

to the 5.17-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     perf-symbol-remove-arch__symbols__fixup_end.patch
and it can be found in the queue-5.17 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From a5d20d42a2f2dc2b2f9e9361912062732414090d Mon Sep 17 00:00:00 2001
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 15 Apr 2022 17:40:48 -0700
Subject: perf symbol: Remove arch__symbols__fixup_end()

From: Namhyung Kim <namhyung@kernel.org>

commit a5d20d42a2f2dc2b2f9e9361912062732414090d upstream.

Now the generic code can handle kallsyms fixup properly so no need to
keep the arch-functions anymore.

Fixes: 3cf6a32f3f2a4594 ("perf symbols: Fix symbol size calculation condition")
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
Acked-by: Ian Rogers <irogers@google.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Garry <john.garry@huawei.com>
Cc: Leo Yan <leo.yan@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael Petlan <mpetlan@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Song Liu <songliubraving@fb.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-s390@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/r/20220416004048.1514900-4-namhyung@kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/arch/arm64/util/machine.c   |   21 ---------------------
 tools/perf/arch/powerpc/util/Build     |    1 -
 tools/perf/arch/powerpc/util/machine.c |   25 -------------------------
 tools/perf/arch/s390/util/machine.c    |   16 ----------------
 tools/perf/util/symbol.c               |    5 -----
 tools/perf/util/symbol.h               |    1 -
 6 files changed, 69 deletions(-)
 delete mode 100644 tools/perf/arch/powerpc/util/machine.c

--- a/tools/perf/arch/arm64/util/machine.c
+++ b/tools/perf/arch/arm64/util/machine.c
@@ -8,27 +8,6 @@
 #include "callchain.h"
 #include "record.h"
 
-/* On arm64, kernel text segment starts at high memory address,
- * for example 0xffff 0000 8xxx xxxx. Modules start at a low memory
- * address, like 0xffff 0000 00ax xxxx. When only small amount of
- * memory is used by modules, gap between end of module's text segment
- * and start of kernel text segment may reach 2G.
- * Therefore do not fill this gap and do not assign it to the kernel dso map.
- */
-
-#define SYMBOL_LIMIT (1 << 12) /* 4K */
-
-void arch__symbols__fixup_end(struct symbol *p, struct symbol *c)
-{
-	if ((strchr(p->name, '[') && strchr(c->name, '[') == NULL) ||
-			(strchr(p->name, '[') == NULL && strchr(c->name, '[')))
-		/* Limit range of last symbol in module and kernel */
-		p->end += SYMBOL_LIMIT;
-	else
-		p->end = c->start;
-	pr_debug4("%s sym:%s end:%#" PRIx64 "\n", __func__, p->name, p->end);
-}
-
 void arch__add_leaf_frame_record_opts(struct record_opts *opts)
 {
 	opts->sample_user_regs |= sample_reg_masks[PERF_REG_ARM64_LR].mask;
--- a/tools/perf/arch/powerpc/util/Build
+++ b/tools/perf/arch/powerpc/util/Build
@@ -1,5 +1,4 @@
 perf-y += header.o
-perf-y += machine.o
 perf-y += kvm-stat.o
 perf-y += perf_regs.o
 perf-y += mem-events.o
--- a/tools/perf/arch/powerpc/util/machine.c
+++ /dev/null
@@ -1,25 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <inttypes.h>
-#include <stdio.h>
-#include <string.h>
-#include <internal/lib.h> // page_size
-#include "debug.h"
-#include "symbol.h"
-
-/* On powerpc kernel text segment start at memory addresses, 0xc000000000000000
- * whereas the modules are located at very high memory addresses,
- * for example 0xc00800000xxxxxxx. The gap between end of kernel text segment
- * and beginning of first module's text segment is very high.
- * Therefore do not fill this gap and do not assign it to the kernel dso map.
- */
-
-void arch__symbols__fixup_end(struct symbol *p, struct symbol *c)
-{
-	if (strchr(p->name, '[') == NULL && strchr(c->name, '['))
-		/* Limit the range of last kernel symbol */
-		p->end += page_size;
-	else
-		p->end = c->start;
-	pr_debug4("%s sym:%s end:%#" PRIx64 "\n", __func__, p->name, p->end);
-}
--- a/tools/perf/arch/s390/util/machine.c
+++ b/tools/perf/arch/s390/util/machine.c
@@ -35,19 +35,3 @@ int arch__fix_module_text_start(u64 *sta
 
 	return 0;
 }
-
-/* On s390 kernel text segment start is located at very low memory addresses,
- * for example 0x10000. Modules are located at very high memory addresses,
- * for example 0x3ff xxxx xxxx. The gap between end of kernel text segment
- * and beginning of first module's text segment is very big.
- * Therefore do not fill this gap and do not assign it to the kernel dso map.
- */
-void arch__symbols__fixup_end(struct symbol *p, struct symbol *c)
-{
-	if (strchr(p->name, '[') == NULL && strchr(c->name, '['))
-		/* Last kernel symbol mapped to end of page */
-		p->end = roundup(p->end, page_size);
-	else
-		p->end = c->start;
-	pr_debug4("%s sym:%s end:%#" PRIx64 "\n", __func__, p->name, p->end);
-}
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -101,11 +101,6 @@ static int prefix_underscores_count(cons
 	return tail - str;
 }
 
-void __weak arch__symbols__fixup_end(struct symbol *p, struct symbol *c)
-{
-	p->end = c->start;
-}
-
 const char * __weak arch__normalize_symbol_name(const char *name)
 {
 	return name;
--- a/tools/perf/util/symbol.h
+++ b/tools/perf/util/symbol.h
@@ -241,7 +241,6 @@ const char *arch__normalize_symbol_name(
 #define SYMBOL_A 0
 #define SYMBOL_B 1
 
-void arch__symbols__fixup_end(struct symbol *p, struct symbol *c);
 int arch__compare_symbol_names(const char *namea, const char *nameb);
 int arch__compare_symbol_names_n(const char *namea, const char *nameb,
 				 unsigned int n);


Patches currently in stable-queue which might be from namhyung@kernel.org are

queue-5.17/perf-symbol-remove-arch__symbols__fixup_end.patch
queue-5.17/perf-arm-spe-fix-addresses-of-synthesized-spe-events.patch
queue-5.17/perf-symbol-update-symbols__fixup_end.patch
queue-5.17/perf-symbol-pass-is_kallsyms-to-symbols__fixup_end.patch
