Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7BA51A688
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 18:52:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtjYh48P1z3c9r
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 02:52:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ByThSz51;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ByThSz51; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtjY333l2z3bfb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 02:52:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C828B827A4;
 Wed,  4 May 2022 16:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03F2C385A4;
 Wed,  4 May 2022 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651683123;
 bh=lxOCNLhoXuv1p/yYbOt/qn66HbF114gIdpkYgvRyQOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ByThSz51YQJeoKp3V3/apWHP8kEXspZgbCXW/bb5roYfo64bzWtNg3wXuBfEfnb81
 4DBpa4uBnd51gRLBRBtq9vEIdm4lnyGZ+F4q+8APh1hKNKOaHCcdehORKIdNaDHJxA
 V/WSEgevkZFoBtwI8lX7dJaUQRfO95bU1OWBGokI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.10 114/129] perf symbol: Update symbols__fixup_end()
Date: Wed,  4 May 2022 18:45:06 +0200
Message-Id: <20220504153030.353188622@linuxfoundation.org>
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

commit 8799ebce84d672aae1dc3170510f6a3e66f96b11 upstream.

Now arch-specific functions all do the same thing.  When it fixes the
symbol address it needs to check the boundary between the kernel image
and modules.  For the last symbol in the previous region, it cannot
know the exact size as it's discarded already.  Thus it just uses a
small page size (4096) and rounds it up like the last symbol.

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
Link: https://lore.kernel.org/r/20220416004048.1514900-3-namhyung@kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/util/symbol.c |   29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -217,8 +217,8 @@ again:
 	}
 }
 
-void symbols__fixup_end(struct rb_root_cached *symbols,
-			bool is_kallsyms __maybe_unused)
+/* Update zero-sized symbols using the address of the next symbol */
+void symbols__fixup_end(struct rb_root_cached *symbols, bool is_kallsyms)
 {
 	struct rb_node *nd, *prevnd = rb_first_cached(symbols);
 	struct symbol *curr, *prev;
@@ -232,8 +232,29 @@ void symbols__fixup_end(struct rb_root_c
 		prev = curr;
 		curr = rb_entry(nd, struct symbol, rb_node);
 
-		if (prev->end == prev->start || prev->end != curr->start)
-			arch__symbols__fixup_end(prev, curr);
+		/*
+		 * On some architecture kernel text segment start is located at
+		 * some low memory address, while modules are located at high
+		 * memory addresses (or vice versa).  The gap between end of
+		 * kernel text segment and beginning of first module's text
+		 * segment is very big.  Therefore do not fill this gap and do
+		 * not assign it to the kernel dso map (kallsyms).
+		 *
+		 * In kallsyms, it determines module symbols using '[' character
+		 * like in:
+		 *   ffffffffc1937000 T hdmi_driver_init  [snd_hda_codec_hdmi]
+		 */
+		if (prev->end == prev->start) {
+			/* Last kernel/module symbol mapped to end of page */
+			if (is_kallsyms && (!strchr(prev->name, '[') !=
+					    !strchr(curr->name, '[')))
+				prev->end = roundup(prev->end + 4096, 4096);
+			else
+				prev->end = curr->start;
+
+			pr_debug4("%s sym:%s end:%#" PRIx64 "\n",
+				  __func__, prev->name, prev->end);
+		}
 	}
 
 	/* Last entry */


