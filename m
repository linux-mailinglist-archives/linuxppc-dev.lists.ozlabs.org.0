Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB51EB38C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 04:59:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bcFF2FS0zDqQG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 12:58:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 49bcBJ1f9kzDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 12:56:23 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 4A920AE8021D;
 Mon,  1 Jun 2020 22:54:02 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/perf: Stop crashing with generic_compat_pmu
Date: Tue,  2 Jun 2020 12:56:12 +1000
Message-Id: <20200602025612.62707-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The bhrb_filter_map ("The  Branch  History  Rolling  Buffer") callback is
only defined in raw CPUs' power_pmu structs. The "architected" CPUs use
generic_compat_pmu which does not have this callback and crashed occur.

This add a NULL pointer check for bhrb_filter_map() which behaves as if
the callback returned an error.

This does not add the same check for config_bhrb() as the only caller
checks for cpuhw->bhrb_users which remains zero if bhrb_filter_map==0.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/perf/core-book3s.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 3dcfecf858f3..36870569bf9c 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1515,9 +1515,16 @@ static int power_pmu_add(struct perf_event *event, int ef_flags)
 	ret = 0;
  out:
 	if (has_branch_stack(event)) {
-		power_pmu_bhrb_enable(event);
-		cpuhw->bhrb_filter = ppmu->bhrb_filter_map(
-					event->attr.branch_sample_type);
+		u64 bhrb_filter = -1;
+
+		if (ppmu->bhrb_filter_map)
+			bhrb_filter = ppmu->bhrb_filter_map(
+				event->attr.branch_sample_type);
+
+		if (bhrb_filter != -1) {
+			cpuhw->bhrb_filter = bhrb_filter;
+			power_pmu_bhrb_enable(event); /* Does bhrb_users++ */
+		}
 	}
 
 	perf_pmu_enable(event->pmu);
@@ -1839,7 +1846,6 @@ static int power_pmu_event_init(struct perf_event *event)
 	int n;
 	int err;
 	struct cpu_hw_events *cpuhw;
-	u64 bhrb_filter;
 
 	if (!ppmu)
 		return -ENOENT;
@@ -1945,7 +1951,10 @@ static int power_pmu_event_init(struct perf_event *event)
 	err = power_check_constraints(cpuhw, events, cflags, n + 1);
 
 	if (has_branch_stack(event)) {
-		bhrb_filter = ppmu->bhrb_filter_map(
+		u64 bhrb_filter = -1;
+
+		if (ppmu->bhrb_filter_map)
+			bhrb_filter = ppmu->bhrb_filter_map(
 					event->attr.branch_sample_type);
 
 		if (bhrb_filter == -1) {
-- 
2.17.1

