Return-Path: <linuxppc-dev+bounces-4723-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EAAA030E0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 20:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRlC4055Yz30Vy;
	Tue,  7 Jan 2025 06:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736193007;
	cv=none; b=ExE6Q2R2SSGMQVr4HtS/Pd1We5fs8naIp3GzqOmDV5GYUkD6YwnNPp9Qj6TBE4EXrdyuCCktajzhSRSGfZjMVRGu2RNkE/z70BEkza1kEpYfcc7aC2wsPXjMT7TrnxGioWDXIt920sTrMPYf/rX6rP4nKhjHtCdIOlqKG+Qronsq1w7sGgZt6xhxKIkBoa7ye5fyEP2YJRPlznQDG1HGEkHZnOuteXB/6SnNz3K2VoM6CYx/1VNBXrF/PUSgec2KG58Uk3YlBkIbbqL0Sb6Yjqf4bop4Mo9z4Iu1wQnEN0LmXR1/5Dx6qh+qWnX6KdXtZCBJXT9gmq7a/5nkLgm6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736193007; c=relaxed/relaxed;
	bh=jBairKz0OlutBB0s4dQsnT7qqX9NRQXRiAhZx4LHspU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QFlpnmCZQLGqNxqW2Hq1eI6Pr1irBK19e8TTxA8gmEujPunvavs5cMC0Ny4gm/2YIz5+XmdU4BJGh+EYIisqD2t21Jgfv8L5aCXmjNytpUXoTrCyWn3Q8xPNjp5r4d5G/RdrVEQZGz3ZmhpN40A7xnFsyZ9p0DofYw9TZSxFsik8bYLEvqgudsNlCLx5vEW74ZSfjcyYZ8mB6ul/vVlSqw6a4KS4YEGc+VzdUjWo1BldOQuXXLGdHllo3BArKVYmoBugsxkzwurhUY5j2RTZWOinBaHGI4gtTt20njg2pfjnHgb9zuC34p/YLgn0lRiK7vEOO9L9Ze29LWmw/8iOgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRlC25tHSz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 06:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YRkxv6n3vz9sPd;
	Mon,  6 Jan 2025 20:38:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKx_Jm2wiraI; Mon,  6 Jan 2025 20:38:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YRkxv5kLsz9rvV;
	Mon,  6 Jan 2025 20:38:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D9658B783;
	Mon,  6 Jan 2025 20:38:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mIVVP_mbHxfa; Mon,  6 Jan 2025 20:38:43 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D62328B779;
	Mon,  6 Jan 2025 20:38:42 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Leo Yan <leo.yan@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [PATCH] libperf: Add back guard on MAX_NR_CPUS
Date: Mon,  6 Jan 2025 20:38:28 +0100
Message-ID: <8c8553387ebf904a9e5a93eaf643cb01164d9fb3.1736188471.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736192308; l=1656; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=3+psvv1FW635smGcByN8Qe9wt+QETupP25WW0yqawVU=; b=yko/4Jc9hGQmfj4ORKzOpyTJ1lzmpFG2w64CVvZBdzAO9y6YMRLRrmx91G0XjmHW+FsTFOVE/ yrGP3rnx1sHDovVwX0tdcvfbR4CQ2zIleaZB+GWxNAFtM7enoK/1d1v
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Building perf with EXTRA_CFLAGS="-DMAX_NR_CPUS=1" fails:

	  CC      /home/chleroy/linux-powerpc/tools/perf/libperf/cpumap.o
	cpumap.c:16: error: "MAX_NR_CPUS" redefined [-Werror]
	   16 | #define MAX_NR_CPUS 4096
	      |
	<command-line>: note: this is the location of the previous definition

Commit e8399d34d568 ("libperf cpumap: Hide/reduce scope of MAX_NR_CPUS")
moved definition of MAX_NR_CPUS from lib/perf/include/internal/cpumap.h
to lib/perf/cpumap.c but the guard surrounding that definition got lost
in the move.

See commit 21b8732eb447 ("perf tools: Allow overriding MAX_NR_CPUS at
compile time") to see why it is needed.

Note that MAX_NR_CPUS was initialy defined in perf/perf.h and a
redundant definition was added by commit 9c3516d1b850 ("libperf:
Add perf_cpu_map__new()/perf_cpu_map__read() functions").

A cleaner fix would be to remove that duplicate but for the time
being fix the problem by bringing back the guard for when MAX_NR_CPUS
is already defined.

Fixes: e8399d34d568 ("libperf cpumap: Hide/reduce scope of MAX_NR_CPUS")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/lib/perf/cpumap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
index fcc47214062a..12eaa6955121 100644
--- a/tools/lib/perf/cpumap.c
+++ b/tools/lib/perf/cpumap.c
@@ -13,7 +13,9 @@
 #include "internal.h"
 #include <api/fs/fs.h>
 
+#ifndef MAX_NR_CPUS
 #define MAX_NR_CPUS 4096
+#endif
 
 void perf_cpu_map__set_nr(struct perf_cpu_map *map, int nr_cpus)
 {
-- 
2.47.0


