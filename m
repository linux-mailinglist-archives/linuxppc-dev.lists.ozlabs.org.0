Return-Path: <linuxppc-dev+bounces-9315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8072AAD74F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 17:00:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ5Ks2DR8z30HB;
	Fri, 13 Jun 2025 01:00:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749740401;
	cv=none; b=If0RpDGFaT7COC+22xLfKs1pomE1NVmy1sKkkHLwUlWMvcc6GQTHCOiGu4Axk/ap2+8Vpm0AURItVl83qflCK3azzR9iWgL9TmAAgOTQWMhtj1S730dalw6nHh3dm0gpGdCtyo+8SgmT2kIxSm7VHLvFFqpDupdfMCdqik7p8HsqsYg5cgpv5ptoRR+h8VTDI85JAoutwAayIa/lePvrXsDAd2xp1LRhdYKRQB2PgT9TXUZLci+ssH9H+p2Bc4OH5une0Kbn6sVHTxJmIU6Z72zLg1s55tlcmS0L7h3J+iviRw5WQGdcN54hIQ469pFpH3tLUgnLlkdZpDw6qwFBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749740401; c=relaxed/relaxed;
	bh=UX0uBGzlYwqJ9HwNNoxGaQobYMHALPAxPuzrX0Awh7g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Qobf6JtCblgUrNruewMpha9lpw6Rzf76QyZlkUvMAZ6eclJKY22p8gTE3e24vgGi/kvulQB8O3QLh2pJao1EVbJLihB6wwrdae4S6NrZA+EBimBuIqiDncZDm4hG8BQ67ucrZG8Xi9pE9DVif+Qafa1exeiiSYI5bRIizX28uM1PjRcz66OiL/r6VX/1Tsxgcv6M7tS/ojTmhYiYFn1w5tOFn8aReckMjsCZ86i/mURAFd1mpc+les8rXLQZNHpKlhrz6qtAYrYcxOXLhDyczbHGREngJ3CShVYU3b0bSqvg0D9jlc8mbcu8bEFLBirGCfCN9y70jGERG1gyDNTo1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=216.40.44.17; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org) smtp.mailfrom=goodmis.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=goodmis.org (client-ip=216.40.44.17; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org)
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ5Kr4RP6z309v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 01:00:00 +1000 (AEST)
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 4ED67141745;
	Thu, 12 Jun 2025 14:52:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: nevets@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 6037460011;
	Thu, 12 Jun 2025 14:52:32 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uPjJg-00000001lOc-0Dzh;
	Thu, 12 Jun 2025 10:54:08 -0400
Message-ID: <20250612145407.906308844@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 12 Jun 2025 10:53:11 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/4] PM: cpufreq: powernv/tracing: Move powernv_throttle trace event
References: <20250612145310.563358597@goodmis.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 6037460011
X-Stat-Signature: r5ktidiik4dohh3as5y7g1ua3nqsoqr6
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18SHSQxUEtgi1WSSlhtEFfwEslwEhqeQH4=
X-HE-Tag: 1749739952-861469
X-HE-Meta: U2FsdGVkX1+474gVuLLNZRbGAptp138LPUyuUdfvhTgcPcOpmqZmIs86sI8iiOGnd85w7Ubg9jaDDGsQf7ixxkSB5U9HQZC6OunilCrU613eP9T7FTtVAdkdu/MhdiRm8X5KFNF9WZcYRFxTWg0GvMRTqSA7IrN0vuc/jR+HNK+MzM31piX3ayX40JWpP4vuWZRp2rXQhBeeMRb4Gun+VwhEZz5J2tqSzv+dIJ6pjcOTorQXUTGIFTd23h8n7yvrznOr+sfb4t28smD8w19OMWaktZ+jpOZCGv6TVleowCN5LBdvqp1tbvYni0owxxnyr/UgF0DmJYrbqNxezBFnRrnUjX05rlQ//9vlD6YQyfUzzUhNxR/QUqjyy1zx4zRqHqbfbk3yII38N40UFpZpkA==
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Steven Rostedt <rostedt@goodmis.org>

As the trace event powernv_throttle is only used by the powernv code, move
it to a separate include file and have that code directly enable it.

Trace events can take up around 5K of memory when they are defined
regardless if they are used or not. It wastes memory to have them defined
in configurations where the tracepoint is not used.

Fixes: 0306e481d479a ("cpufreq: powernv/tracing: Add powernv_throttle tracepoint")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 drivers/cpufreq/Makefile          |  1 +
 drivers/cpufreq/powernv-cpufreq.c |  4 ++-
 drivers/cpufreq/powernv-trace.h   | 44 +++++++++++++++++++++++++++++++
 include/trace/events/power.h      | 22 ----------------
 kernel/trace/power-traces.c       |  1 -
 5 files changed, 48 insertions(+), 24 deletions(-)
 create mode 100644 drivers/cpufreq/powernv-trace.h

diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index d38526b8e063..681d687b5a18 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_CPUFREQ_VIRT)		+= virtual-cpufreq.o
 
 # Traces
 CFLAGS_amd-pstate-trace.o               := -I$(src)
+CFLAGS_powernv-cpufreq.o                := -I$(src)
 amd_pstate-y				:= amd-pstate.o amd-pstate-trace.o
 
 ##################################################################################
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index a8943e2a93be..7d9a5f656de8 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -21,7 +21,6 @@
 #include <linux/string_choices.h>
 #include <linux/cpu.h>
 #include <linux/hashtable.h>
-#include <trace/events/power.h>
 
 #include <asm/cputhreads.h>
 #include <asm/firmware.h>
@@ -30,6 +29,9 @@
 #include <asm/opal.h>
 #include <linux/timer.h>
 
+#define CREATE_TRACE_POINTS
+#include "powernv-trace.h"
+
 #define POWERNV_MAX_PSTATES_ORDER  8
 #define POWERNV_MAX_PSTATES	(1UL << (POWERNV_MAX_PSTATES_ORDER))
 #define PMSR_PSAFE_ENABLE	(1UL << 30)
diff --git a/drivers/cpufreq/powernv-trace.h b/drivers/cpufreq/powernv-trace.h
new file mode 100644
index 000000000000..8cadb7c9427b
--- /dev/null
+++ b/drivers/cpufreq/powernv-trace.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#if !defined(_POWERNV_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _POWERNV_TRACE_H
+
+#include <linux/cpufreq.h>
+#include <linux/tracepoint.h>
+#include <linux/trace_events.h>
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM power
+
+TRACE_EVENT(powernv_throttle,
+
+	TP_PROTO(int chip_id, const char *reason, int pmax),
+
+	TP_ARGS(chip_id, reason, pmax),
+
+	TP_STRUCT__entry(
+		__field(int, chip_id)
+		__string(reason, reason)
+		__field(int, pmax)
+	),
+
+	TP_fast_assign(
+		__entry->chip_id = chip_id;
+		__assign_str(reason);
+		__entry->pmax = pmax;
+	),
+
+	TP_printk("Chip %d Pmax %d %s", __entry->chip_id,
+		  __entry->pmax, __get_str(reason))
+);
+
+#endif /* _POWERNV_TRACE_H */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE powernv-trace
+
+#include <trace/define_trace.h>
diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index 6c631eec23e3..913181cebfe9 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -99,28 +99,6 @@ DEFINE_EVENT(psci_domain_idle, psci_domain_idle_exit,
 	TP_ARGS(cpu_id, state, s2idle)
 );
 
-TRACE_EVENT(powernv_throttle,
-
-	TP_PROTO(int chip_id, const char *reason, int pmax),
-
-	TP_ARGS(chip_id, reason, pmax),
-
-	TP_STRUCT__entry(
-		__field(int, chip_id)
-		__string(reason, reason)
-		__field(int, pmax)
-	),
-
-	TP_fast_assign(
-		__entry->chip_id = chip_id;
-		__assign_str(reason);
-		__entry->pmax = pmax;
-	),
-
-	TP_printk("Chip %d Pmax %d %s", __entry->chip_id,
-		  __entry->pmax, __get_str(reason))
-);
-
 TRACE_EVENT(pstate_sample,
 
 	TP_PROTO(u32 core_busy,
diff --git a/kernel/trace/power-traces.c b/kernel/trace/power-traces.c
index 21bb161c2316..f2fe33573e54 100644
--- a/kernel/trace/power-traces.c
+++ b/kernel/trace/power-traces.c
@@ -17,5 +17,4 @@
 EXPORT_TRACEPOINT_SYMBOL_GPL(suspend_resume);
 EXPORT_TRACEPOINT_SYMBOL_GPL(cpu_idle);
 EXPORT_TRACEPOINT_SYMBOL_GPL(cpu_frequency);
-EXPORT_TRACEPOINT_SYMBOL_GPL(powernv_throttle);
 
-- 
2.47.2



