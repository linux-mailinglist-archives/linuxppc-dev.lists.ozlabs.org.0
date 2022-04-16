Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E65D503215
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 02:43:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KgDvY0h0Cz3cFW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 10:43:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TTa2v/vC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=namhyung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TTa2v/vC; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KgDrx1HBgz3bYh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 10:41:05 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id k14so9136173pga.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 17:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SXoVsWrrvVTNRRN6nzP3JgGhrdX3aN2oduI58UStebw=;
 b=TTa2v/vCv9FbhRf5PLykRl5wJuGd+GB0FkIGtTg6Bu02tX8l6WG0kBqp8Nfp+JyqAC
 sIONB0kkIEWvAXZTljhL8sATHEsVpfgTk1jrZDcqiy72DQj5hKXI851orEfjLZsqbZT7
 daCw82iZWYwqcYiZG9lV/z+DSebzHrqBoERIYgXaeIpjfLSoC/W1hSnOVTvCnbm9IfUG
 o1NzkzK8iYoB3Ts3y0bT4L/MvGBVT3lIy7/tQUn9IWzP9ooYcwO9SnCvF5Z6/Ju9iEST
 iWlcGg67m4C+Ncp9ugGVYxZ9EEBCGwp5dmTtvZBJhWRA2CHZSLhzeEsAHI2JpcMLmu0Q
 R5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SXoVsWrrvVTNRRN6nzP3JgGhrdX3aN2oduI58UStebw=;
 b=1e8oyE1CXtnkyipUKqFBV8GnB5T2BbxhSc5oWThNWTTAScCZcB+BRcmqnz2EWDzImB
 7JfDZ5oPr/mxIeKmtnIzDE4zXCtt6y9sWueZsOL7i5cuXqUPURYS1E00nzpCMRB2feAI
 lbsOn07NOIbd+4isyX8MddPbDcvULK2CPuPTo6Bx1/XMb59stut+bJeDfnjKvovd6l6x
 W6wPQYnfHOMImb7RO7n7M8el7aVV4TCQCKAYWczRuHQojku5bPOjunxihPUCjJWt472/
 65TPLYsLJx864p4odhYG/Mh5NRSaqIOez1PsbvUYmIGmh0udKlL0eU/T0D/MDUMO2XDE
 QAwQ==
X-Gm-Message-State: AOAM530wm+06/uqpPs7xxHouy/Bbt5GOkENskR7nVOJabLzvC1KDfevK
 Nmrl4pCyZnmtbGCfoNa+nO0=
X-Google-Smtp-Source: ABdhPJwAy3vIuGOqGXEuKHQKtScI4nlcAtfNuxl7peC9v1lMweP6i+J/TEBILTTbRqj2F0hemcztAg==
X-Received: by 2002:a63:451b:0:b0:380:b9f8:13f4 with SMTP id
 s27-20020a63451b000000b00380b9f813f4mr1159993pga.367.1650069663050; 
 Fri, 15 Apr 2022 17:41:03 -0700 (PDT)
Received: from balhae.roam.corp.google.com
 ([2607:fb90:461:36d2:dba1:7530:2cda:19b1])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm3913537pfu.82.2022.04.15.17.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 17:41:02 -0700 (PDT)
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Ian Rogers <irogers@google.com>, Michael Petlan <mpetlan@redhat.com>
Subject: [PATCH 3/3] perf symbol: Remove arch__symbols__fixup_end()
Date: Fri, 15 Apr 2022 17:40:48 -0700
Message-Id: <20220416004048.1514900-4-namhyung@kernel.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220416004048.1514900-1-namhyung@kernel.org>
References: <20220416004048.1514900-1-namhyung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org,
 Song Liu <songliubraving@fb.com>, linuxppc-dev@lists.ozlabs.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linaro.org>,
 Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now the generic code can handle kallsyms fixup properly so no need to
keep the arch-functions anymore.

Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/arch/arm64/util/machine.c   | 21 ---------------------
 tools/perf/arch/powerpc/util/Build     |  1 -
 tools/perf/arch/powerpc/util/machine.c | 25 -------------------------
 tools/perf/arch/s390/util/machine.c    | 16 ----------------
 tools/perf/util/symbol.c               |  5 -----
 tools/perf/util/symbol.h               |  1 -
 6 files changed, 69 deletions(-)
 delete mode 100644 tools/perf/arch/powerpc/util/machine.c

diff --git a/tools/perf/arch/arm64/util/machine.c b/tools/perf/arch/arm64/util/machine.c
index d2ce31e28cd7..41c1596e5207 100644
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
diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
index 8a79c4126e5b..0115f3166568 100644
--- a/tools/perf/arch/powerpc/util/Build
+++ b/tools/perf/arch/powerpc/util/Build
@@ -1,5 +1,4 @@
 perf-y += header.o
-perf-y += machine.o
 perf-y += kvm-stat.o
 perf-y += perf_regs.o
 perf-y += mem-events.o
diff --git a/tools/perf/arch/powerpc/util/machine.c b/tools/perf/arch/powerpc/util/machine.c
deleted file mode 100644
index e652a1aa8132..000000000000
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
diff --git a/tools/perf/arch/s390/util/machine.c b/tools/perf/arch/s390/util/machine.c
index 7644a4f6d4a4..98bc3f39d5f3 100644
--- a/tools/perf/arch/s390/util/machine.c
+++ b/tools/perf/arch/s390/util/machine.c
@@ -35,19 +35,3 @@ int arch__fix_module_text_start(u64 *start, u64 *size, const char *name)
 
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
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 623094e866fd..f72baf636724 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -101,11 +101,6 @@ static int prefix_underscores_count(const char *str)
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
diff --git a/tools/perf/util/symbol.h b/tools/perf/util/symbol.h
index 5fcdd1f94c56..0b893dcc8ea6 100644
--- a/tools/perf/util/symbol.h
+++ b/tools/perf/util/symbol.h
@@ -241,7 +241,6 @@ const char *arch__normalize_symbol_name(const char *name);
 #define SYMBOL_A 0
 #define SYMBOL_B 1
 
-void arch__symbols__fixup_end(struct symbol *p, struct symbol *c);
 int arch__compare_symbol_names(const char *namea, const char *nameb);
 int arch__compare_symbol_names_n(const char *namea, const char *nameb,
 				 unsigned int n);
-- 
2.36.0.rc0.470.gd361397f0d-goog

