Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454FA517A72
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 01:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsdzX0xgYz3cGR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 09:07:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ELgW57Os;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ELgW57Os; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ksdx717fPz3bbr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 09:05:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8FD17612DC;
 Mon,  2 May 2022 23:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A4CC385A4;
 Mon,  2 May 2022 23:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651532743;
 bh=OlmGcfy/OW/O8NjsMZLS7DTFExTzGSULJFhd7Gvl8+o=;
 h=Subject:To:Cc:From:Date:From;
 b=ELgW57OsESzmitfneKckTVELF+mkGFCF9gW/6uDf7geG+pdOWdZV7VLt9eyF0UzxP
 SWvq7SilnvrZUPgccIcgkVMTvn2hDVqA4OQFD5Nqj+NsqowmGj4OHOYrI5VhPQNceL
 TtKgrAgAbyPsX52Aftd28it543d5bE5jY1ttd6Sk=
Subject: Patch "perf symbol: Update symbols__fixup_end()" has been added to
 the 5.15-stable tree
To: acme@redhat.com, gregkh@linuxfoundation.org, hca@linux.ibm.com,
 irogers@google.com, john.garry@huawei.com, jolsa@kernel.org,
 leo.yan@linaro.org, linuxppc-dev@lists.ozlabs.org, mark.rutland@arm.com,
 mathieu.poirier@linaro.org, mhiramat@kernel.org, mingo@kernel.org,
 mpe@ellerman.id.au, mpetlan@redhat.com, namhyung@kernel.org,
 peterz@infradead.org, songliubraving@fb.com, will@kernel.org
From: <gregkh@linuxfoundation.org>
Date: Tue, 03 May 2022 01:05:34 +0200
Message-ID: <165153273449183@kroah.com>
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

    perf symbol: Update symbols__fixup_end()

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     perf-symbol-update-symbols__fixup_end.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 8799ebce84d672aae1dc3170510f6a3e66f96b11 Mon Sep 17 00:00:00 2001
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 15 Apr 2022 17:40:47 -0700
Subject: perf symbol: Update symbols__fixup_end()

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


Patches currently in stable-queue which might be from namhyung@kernel.org are

queue-5.15/perf-arm-spe-fix-addresses-of-synthesized-spe-events.patch
queue-5.15/perf-symbol-update-symbols__fixup_end.patch
queue-5.15/perf-symbol-pass-is_kallsyms-to-symbols__fixup_end.patch
