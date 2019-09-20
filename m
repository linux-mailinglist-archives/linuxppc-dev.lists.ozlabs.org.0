Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC99B9367
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 16:51:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zc9q0SZlzDrK0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 00:51:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=acme@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="pkr7o92y"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zbdl67h0zF3H2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 00:27:21 +1000 (AEST)
Received: from quaco.ghostprotocols.net (unknown [179.97.35.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17EED217F5;
 Fri, 20 Sep 2019 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568989639;
 bh=7fWIorHVOy9v2BBGll8uHew7FHCf2wQc2SZa2u3BLJY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pkr7o92yK4w+GC93syWdsyfsMLopgiHgP7dzTKiyGyTfyJ32jIzqBIe2md0Fl5h65
 BBKDyqLL/vkgcJZ2GxKjEgJggyP4QYoLXrfehuEe9bURevWbCKg2eC+qi7pTmyM7ym
 mKjZVDa/QbtirizGjpOzpDLKw+OF35GbIgRJwwSM=
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 30/31] perf kvm: Add arch neutral function to choose event for
 perf kvm record
Date: Fri, 20 Sep 2019 11:25:41 -0300
Message-Id: <20190920142542.12047-31-acme@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190920142542.12047-1-acme@kernel.org>
References: <20190920142542.12047-1-acme@kernel.org>
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Clark Williams <williams@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anju T Sudhakar <anju@linux.vnet.ibm.com>

'perf kvm record' uses 'cycles'(if the user did not specify any event)
as the default event to profile the guest.

This will not provide any proper samples from the guest incase of
powerpc architecture, since in powerpc the PMUs are controlled by the
guest rather than the host.

Patch adds a function to pick an arch specific event for 'perf kvm
record', instead of selecting 'cycles' as a default event for all
architectures.

For powerpc this function checks for any user specified event, and if
there isn't any it returns invalid instead of proceeding with 'cycles'
event.

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Reviewed-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linuxppc-dev@lists.ozlabs.org
Link: http://lore.kernel.org/lkml/20190718181749.30612-2-anju@linux.vnet.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/arch/powerpc/util/kvm-stat.c | 37 +++++++++++++++++++++++++
 tools/perf/builtin-kvm.c                | 12 +++++++-
 tools/perf/util/kvm-stat.h              |  1 +
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/powerpc/util/kvm-stat.c b/tools/perf/arch/powerpc/util/kvm-stat.c
index f0dbf7b075c8..ec5b771029e4 100644
--- a/tools/perf/arch/powerpc/util/kvm-stat.c
+++ b/tools/perf/arch/powerpc/util/kvm-stat.c
@@ -8,6 +8,7 @@
 
 #include "book3s_hv_exits.h"
 #include "book3s_hcalls.h"
+#include <subcmd/parse-options.h>
 
 #define NR_TPS 4
 
@@ -172,3 +173,39 @@ int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid __maybe_unused)
 
 	return ret;
 }
+
+/*
+ * Incase of powerpc architecture, pmu registers are programmable
+ * by guest kernel. So monitoring guest via host may not provide
+ * valid samples. It is better to fail the "perf kvm record"
+ * with default "cycles" event to monitor guest in powerpc.
+ *
+ * Function to parse the arguments and return appropriate values.
+ */
+int kvm_add_default_arch_event(int *argc, const char **argv)
+{
+	const char **tmp;
+	bool event = false;
+	int i, j = *argc;
+
+	const struct option event_options[] = {
+		OPT_BOOLEAN('e', "event", &event, NULL),
+		OPT_END()
+	};
+
+	tmp = calloc(j + 1, sizeof(char *));
+	if (!tmp)
+		return -EINVAL;
+
+	for (i = 0; i < j; i++)
+		tmp[i] = argv[i];
+
+	parse_options(j, tmp, event_options, NULL, PARSE_OPT_KEEP_UNKNOWN);
+	if (!event) {
+		free(tmp);
+		return -EINVAL;
+	}
+
+	free(tmp);
+	return 0;
+}
diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
index 2b822be87673..6e3e36658900 100644
--- a/tools/perf/builtin-kvm.c
+++ b/tools/perf/builtin-kvm.c
@@ -1514,11 +1514,21 @@ static int kvm_cmd_stat(const char *file_name, int argc, const char **argv)
 }
 #endif /* HAVE_KVM_STAT_SUPPORT */
 
+int __weak kvm_add_default_arch_event(int *argc __maybe_unused,
+					const char **argv __maybe_unused)
+{
+	return 0;
+}
+
 static int __cmd_record(const char *file_name, int argc, const char **argv)
 {
-	int rec_argc, i = 0, j;
+	int rec_argc, i = 0, j, ret;
 	const char **rec_argv;
 
+	ret = kvm_add_default_arch_event(&argc, argv);
+	if (ret)
+		return -EINVAL;
+
 	rec_argc = argc + 2;
 	rec_argv = calloc(rec_argc + 1, sizeof(char *));
 	rec_argv[i++] = strdup("record");
diff --git a/tools/perf/util/kvm-stat.h b/tools/perf/util/kvm-stat.h
index 8fd6ec20662c..6f0fa05b62b6 100644
--- a/tools/perf/util/kvm-stat.h
+++ b/tools/perf/util/kvm-stat.h
@@ -148,4 +148,5 @@ extern const char *kvm_entry_trace;
 extern const char *kvm_exit_trace;
 #endif /* HAVE_KVM_STAT_SUPPORT */
 
+extern int kvm_add_default_arch_event(int *argc, const char **argv);
 #endif /* __PERF_KVM_STAT_H */
-- 
2.21.0

