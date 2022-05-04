Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E126851A68F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 18:53:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtjZN5Ph9z3cCx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 02:53:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LHSGODLy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=LHSGODLy; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtjY34rRpz3bff
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 02:52:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A275F61794;
 Wed,  4 May 2022 16:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85D4C385AF;
 Wed,  4 May 2022 16:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651683122;
 bh=B3OU/Dc5PItCyg7JoGSjeRsJh2nM50qhJ13FxIdp3lY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LHSGODLy+CSA5K6g/bn13r9/COaFzSZBHyftxdqza+ToK3p/HVbXBCGTACk1qBrOe
 AcoDqjj+AJpwrixSrXHLse4Je0ceeiwdSQtXjWiiur0hNOO/JAN6B/QMWK34F7aSXR
 YouNCvIGaiOQicSpPTD52xAQZoyoGzVU2GNq8YFI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.10 113/129] perf symbol: Pass is_kallsyms to
 symbols__fixup_end()
Date: Wed,  4 May 2022 18:45:05 +0200
Message-Id: <20220504153030.273179134@linuxfoundation.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504153021.299025455@linuxfoundation.org>
References: <20220504153021.299025455@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 linux-s390@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <hca@linux.ibm.com>, John Garry <john.garry@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Michael Petlan <mpetlan@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Leo Yan <leo.yan@linaro.org>, Namhyung Kim <namhyung@kernel.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Namhyung Kim <namhyung@kernel.org>

commit 838425f2defe5262906b698752d28fd2fca1aac2 upstream.

The symbol fixup is necessary for symbols in kallsyms since they don't
have size info.  So we use the next symbol's address to calculate the
size.  Now it's also used for user binaries because sometimes they miss
size for hand-written asm functions.

There's a arch-specific function to handle kallsyms differently but
currently it cannot distinguish kallsyms from others.  Pass this
information explicitly to handle it properly.  Note that those arch
functions will be moved to the generic function so I didn't added it to
the arch-functions.

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
Link: https://lore.kernel.org/r/20220416004048.1514900-2-namhyung@kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/util/symbol-elf.c |    2 +-
 tools/perf/util/symbol.c     |    7 ++++---
 tools/perf/util/symbol.h     |    2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -1245,7 +1245,7 @@ int dso__load_sym(struct dso *dso, struc
 	 * For misannotated, zeroed, ASM function sizes.
 	 */
 	if (nr > 0) {
-		symbols__fixup_end(&dso->symbols);
+		symbols__fixup_end(&dso->symbols, false);
 		symbols__fixup_duplicate(&dso->symbols);
 		if (kmap) {
 			/*
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -217,7 +217,8 @@ again:
 	}
 }
 
-void symbols__fixup_end(struct rb_root_cached *symbols)
+void symbols__fixup_end(struct rb_root_cached *symbols,
+			bool is_kallsyms __maybe_unused)
 {
 	struct rb_node *nd, *prevnd = rb_first_cached(symbols);
 	struct symbol *curr, *prev;
@@ -1456,7 +1457,7 @@ int __dso__load_kallsyms(struct dso *dso
 	if (kallsyms__delta(kmap, filename, &delta))
 		return -1;
 
-	symbols__fixup_end(&dso->symbols);
+	symbols__fixup_end(&dso->symbols, true);
 	symbols__fixup_duplicate(&dso->symbols);
 
 	if (dso->kernel == DSO_SPACE__KERNEL_GUEST)
@@ -1651,7 +1652,7 @@ int dso__load_bfd_symbols(struct dso *ds
 #undef bfd_asymbol_section
 #endif
 
-	symbols__fixup_end(&dso->symbols);
+	symbols__fixup_end(&dso->symbols, false);
 	symbols__fixup_duplicate(&dso->symbols);
 	dso->adjust_symbols = 1;
 
--- a/tools/perf/util/symbol.h
+++ b/tools/perf/util/symbol.h
@@ -192,7 +192,7 @@ void __symbols__insert(struct rb_root_ca
 		       bool kernel);
 void symbols__insert(struct rb_root_cached *symbols, struct symbol *sym);
 void symbols__fixup_duplicate(struct rb_root_cached *symbols);
-void symbols__fixup_end(struct rb_root_cached *symbols);
+void symbols__fixup_end(struct rb_root_cached *symbols, bool is_kallsyms);
 void maps__fixup_end(struct maps *maps);
 
 typedef int (*mapfn_t)(u64 start, u64 len, u64 pgoff, void *data);


