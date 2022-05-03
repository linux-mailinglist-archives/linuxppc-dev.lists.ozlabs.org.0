Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D48517B49
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 02:43:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ksh5Z1gSnz3bcy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 10:43:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Tfr3MWYt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=namhyung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Tfr3MWYt; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ksh4y0tw5z2yhD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 10:42:42 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id p12so13603274pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 May 2022 17:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z6SbXsprQLOiqwaC6PZW9LYNv33UTf7Rzrgeep2Yrzw=;
 b=Tfr3MWYtyNj6k0jjfWdSkBf5DEtonztrmR7vYz0crnSoOXpnvPP+UxjlvU4CWZxNCk
 IczE0YCSTnOBGyNsnBSgY4uu+04H8ZKgFpGvgrb0yAxoaN0LKphArPpDoj+EjdJ/2caO
 fYCXFiMV3CgD+4Vd+yfDNnQKpqYFfR1eoia0y4IOoBE1p4oNCdv8RyHZ/AP7rJLbR8uN
 I3+4DN755uz5DDFXVZ4Eq6ZtUIliblbq31AVTpBz5hsrymUVL2hob361vbHSWu0iGJqA
 bgQxzDp0+XcltNZ5gkPZ5MywZEcxq7iiYl5yPFzF8GiREAXYCB6lypVp5p1r7fEdxBxL
 mjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=z6SbXsprQLOiqwaC6PZW9LYNv33UTf7Rzrgeep2Yrzw=;
 b=ZhWU4HifFFfayxZKzQRC82+c3Q5gZfcgwkoaCoNKToROtBXHlLmeHyHyYaV2GBsY7B
 QB5nwyRXMzi+NX8CkzrnAicQaUx8xdvGfY69PwOLfGUz3JIbuv0H2zLCRVYmirvHEOM5
 Lk256720w36bsESFKp1oNxMu48ss94asoU/QqTI386H6lm70qH/mJm6VsATG8FwiUG2Y
 bjq57CqxzhJs+NXYTguYlsUNZ3n6BwFpBgVzzRZV2DrIhdaU1yXI+jLhtmMFwis/VF6c
 qxHYQk4uEgzPyiIntyJTE5FYkXxXnnZJU3Ph8zA6HeghHHGsHtYTOgsQpPATWx7JAoSF
 ojjA==
X-Gm-Message-State: AOAM530PLiXwtg1ukM1EROg/q342d7FfHPyDJtqKK7hNSCIbYdC+o24S
 uX5aRl0qlPDMB3BB0LpHRzSl3WhB/Ko=
X-Google-Smtp-Source: ABdhPJznfXwUKn70bLgk2uXJZR9xIknHNS7cZLBfurSF8+hscprxf+Ex1WEXpOnlut38fMa44HtXgA==
X-Received: by 2002:a63:2309:0:b0:398:d3fe:1c41 with SMTP id
 j9-20020a632309000000b00398d3fe1c41mr11808733pgj.131.1651538559219; 
 Mon, 02 May 2022 17:42:39 -0700 (PDT)
Received: from balhae.hsd1.ca.comcast.net
 ([2601:647:4f00:3590:4f92:5746:ebb:6bda])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a170903240300b0015e8d4eb28fsm5193686plo.217.2022.05.02.17.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 17:42:38 -0700 (PDT)
From: Namhyung Kim <namhyung@kernel.org>
To: stable@vger.kernel.org
Subject: [PATCH for v5.10] perf symbol: Remove arch__symbols__fixup_end()
Date: Mon,  2 May 2022 17:42:36 -0700
Message-Id: <20220503004236.712241-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Song Liu <songliubraving@fb.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-s390@vger.kernel.org, Michael Petlan <mpetlan@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, John Garry <john.garry@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@linaro.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now the generic code can handle kallsyms fixup properly so no need to
keep the arch-functions anymore.

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
---
The original commit id is a5d20d42a2f2dc2b2f9e9361912062732414090d
 tools/perf/arch/arm64/util/Build     |  1 -
 tools/perf/arch/arm64/util/machine.c | 27 ---------------------------
 tools/perf/arch/s390/util/machine.c  | 16 ----------------
 tools/perf/util/symbol.c             |  5 -----
 tools/perf/util/symbol.h             |  1 -
 5 files changed, 50 deletions(-)
 delete mode 100644 tools/perf/arch/arm64/util/machine.c

diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/util/Build
index b53294d74b01..eddaf9bf5729 100644
--- a/tools/perf/arch/arm64/util/Build
+++ b/tools/perf/arch/arm64/util/Build
@@ -1,5 +1,4 @@
 perf-y += header.o
-perf-y += machine.o
 perf-y += perf_regs.o
 perf-y += tsc.o
 perf-$(CONFIG_DWARF)     += dwarf-regs.o
diff --git a/tools/perf/arch/arm64/util/machine.c b/tools/perf/arch/arm64/util/machine.c
deleted file mode 100644
index d41b27e781d3..000000000000
--- a/tools/perf/arch/arm64/util/machine.c
+++ /dev/null
@@ -1,27 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <stdio.h>
-#include <string.h>
-#include "debug.h"
-#include "symbol.h"
-
-/* On arm64, kernel text segment start at high memory address,
- * for example 0xffff 0000 8xxx xxxx. Modules start at a low memory
- * address, like 0xffff 0000 00ax xxxx. When only samll amount of
- * memory is used by modules, gap between end of module's text segment
- * and start of kernel text segment may be reach 2G.
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
-	pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
-}
diff --git a/tools/perf/arch/s390/util/machine.c b/tools/perf/arch/s390/util/machine.c
index 724efb2d842d..7219ecdb8423 100644
--- a/tools/perf/arch/s390/util/machine.c
+++ b/tools/perf/arch/s390/util/machine.c
@@ -34,19 +34,3 @@ int arch__fix_module_text_start(u64 *start, u64 *size, const char *name)
 
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
-	pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
-}
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 8f63cf8d0669..33954835c823 100644
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
index 66d5b732bb7a..28721d761d91 100644
--- a/tools/perf/util/symbol.h
+++ b/tools/perf/util/symbol.h
@@ -230,7 +230,6 @@ const char *arch__normalize_symbol_name(const char *name);
 #define SYMBOL_A 0
 #define SYMBOL_B 1
 
-void arch__symbols__fixup_end(struct symbol *p, struct symbol *c);
 int arch__compare_symbol_names(const char *namea, const char *nameb);
 int arch__compare_symbol_names_n(const char *namea, const char *nameb,
 				 unsigned int n);
-- 
2.36.0.464.gb9c8b46e94-goog

