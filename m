Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D8EB95E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 18:43:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zffb26nPzF3dS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 02:43:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tip-bot2@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zf9F0MGnzDrHm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 02:21:20 +1000 (AEST)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1iBLeT-00040d-PU; Fri, 20 Sep 2019 18:20:57 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id BFAD71C0DAE;
 Fri, 20 Sep 2019 18:20:56 +0200 (CEST)
Date: Fri, 20 Sep 2019 16:20:56 -0000
From: "tip-bot2 for Anju T Sudhakar" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf kvm stat: Set 'trace_cycles' as default event
 for 'perf kvm record' in powerpc
In-Reply-To: <20190718181749.30612-3-anju@linux.vnet.ibm.com>
References: <20190718181749.30612-3-anju@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-ID: <156899645662.24167.1538786694550700474.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     2bff2b828502b5e5d5ea5a52643d3542053df03f
Gitweb:        https://git.kernel.org/tip/2bff2b828502b5e5d5ea5a52643d3542053df03f
Author:        Anju T Sudhakar <anju@linux.vnet.ibm.com>
AuthorDate:    Thu, 18 Jul 2019 23:47:49 +05:30
Committer:     Arnaldo Carvalho de Melo <acme@redhat.com>
CommitterDate: Fri, 20 Sep 2019 10:28:26 -03:00

perf kvm stat: Set 'trace_cycles' as default event for 'perf kvm record' in powerpc

Use 'trace_imc/trace_cycles' as the default event for 'perf kvm record'
in powerpc.

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Reviewed-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linuxppc-dev@lists.ozlabs.org
Link: http://lore.kernel.org/lkml/20190718181749.30612-3-anju@linux.vnet.ibm.com
[ Add missing pmu.h header, needed because this patch uses pmu_have_event() ]
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/arch/powerpc/util/kvm-stat.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/powerpc/util/kvm-stat.c b/tools/perf/arch/powerpc/util/kvm-stat.c
index ec5b771..9cc1c4a 100644
--- a/tools/perf/arch/powerpc/util/kvm-stat.c
+++ b/tools/perf/arch/powerpc/util/kvm-stat.c
@@ -5,6 +5,7 @@
 #include "util/debug.h"
 #include "util/evsel.h"
 #include "util/evlist.h"
+#include "util/pmu.h"
 
 #include "book3s_hv_exits.h"
 #include "book3s_hcalls.h"
@@ -177,8 +178,9 @@ int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid __maybe_unused)
 /*
  * Incase of powerpc architecture, pmu registers are programmable
  * by guest kernel. So monitoring guest via host may not provide
- * valid samples. It is better to fail the "perf kvm record"
- * with default "cycles" event to monitor guest in powerpc.
+ * valid samples with default 'cycles' event. It is better to use
+ * 'trace_imc/trace_cycles' event for guest profiling, since it
+ * can track the guest instruction pointer in the trace-record.
  *
  * Function to parse the arguments and return appropriate values.
  */
@@ -202,8 +204,14 @@ int kvm_add_default_arch_event(int *argc, const char **argv)
 
 	parse_options(j, tmp, event_options, NULL, PARSE_OPT_KEEP_UNKNOWN);
 	if (!event) {
-		free(tmp);
-		return -EINVAL;
+		if (pmu_have_event("trace_imc", "trace_cycles")) {
+			argv[j++] = strdup("-e");
+			argv[j++] = strdup("trace_imc/trace_cycles/");
+			*argc += 2;
+		} else {
+			free(tmp);
+			return -EINVAL;
+		}
 	}
 
 	free(tmp);
