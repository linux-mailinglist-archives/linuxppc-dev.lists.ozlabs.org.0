Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F934837932
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 01:32:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kDIrg2hM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJp2Q3J1Sz3c12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 11:32:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kDIrg2hM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJp1d1bS8z3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 11:31:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8119AB815B8;
	Tue, 23 Jan 2024 00:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F79FC433C7;
	Tue, 23 Jan 2024 00:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705969903;
	bh=/VFijyGUyqLRqtlhxMy5svCwoF1Y6febeOHzpKCwrKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kDIrg2hMnxpOGmtPW0GWWYHrCsyq9AXN7XpE9D0PLpUR23azQhemFJtpL/OEBWFF/
	 GrkD92mjwC/sZhBIIuVfAjuRbxrBfqvrpJcWkT3vKlyKf5B3t2cGQLX32GpiB6tXaS
	 D/Uv1CacADLXRSalP2awwcFNdHRZGgzb5PRgDqxk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.7 517/641] perf vendor events powerpc: Update datasource event name to fix duplicate events
Date: Mon, 22 Jan 2024 15:57:01 -0800
Message-ID: <20240122235834.268643936@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122235818.091081209@linuxfoundation.org>
References: <20240122235818.091081209@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev, Disha Goel <disgoel@linux.vnet.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

6.7-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

[ Upstream commit 9eef41014fe01287dae79fe208b9b433b13040bb ]

Running "perf list" on powerpc fails with segfault as below:

   $ ./perf list
   Segmentation fault (core dumped)
   $

This happens because of duplicate events in the JSON list.  The powerpc
JSON event list contains some event with same event name, but different
event code. They are:

- PM_INST_FROM_L3MISS (Present in datasource and frontend)
- PM_MRK_DATA_FROM_L2MISS (Present in datasource and marked)
- PM_MRK_INST_FROM_L3MISS (Present in datasource and marked)
- PM_MRK_DATA_FROM_L3MISS (Present in datasource and marked)

pmu_events_table__num_events() uses the value from table_pmu->num_entries
which includes duplicate events as well. This causes issue during "perf
list" and results in a segmentation fault.

Since both event codes are valid, append _DSRC to the Data Source events
(datasource.json), so that they would have a unique name.

Also add PM_DATA_FROM_L2MISS_DSRC and PM_DATA_FROM_L3MISS_DSRC events.

With the fix, 'perf list' works as expected.

Fixes: fc143580753348c6 ("perf vendor events power10: Update JSON/events")
Signed-off-by: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
Tested-by: Disha Goel <disgoel@linux.ibm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Disha Goel <disgoel@linux.vnet.ibm.com>
Cc: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@arm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Link: https://lore.kernel.org/r/20231123160110.94090-1-atrajeev@linux.vnet.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../arch/powerpc/power10/datasource.json       | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
index 6b0356f2d301..0eeaaf1a95b8 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
@@ -99,6 +99,11 @@
     "EventName": "PM_INST_FROM_L2MISS",
     "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L2 due to a demand miss."
   },
+  {
+    "EventCode": "0x0003C0000000C040",
+    "EventName": "PM_DATA_FROM_L2MISS_DSRC",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss."
+  },
   {
     "EventCode": "0x000380000010C040",
     "EventName": "PM_INST_FROM_L2MISS_ALL",
@@ -161,9 +166,14 @@
   },
   {
     "EventCode": "0x000780000000C040",
-    "EventName": "PM_INST_FROM_L3MISS",
+    "EventName": "PM_INST_FROM_L3MISS_DSRC",
     "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss."
   },
+  {
+    "EventCode": "0x0007C0000000C040",
+    "EventName": "PM_DATA_FROM_L3MISS_DSRC",
+    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss."
+  },
   {
     "EventCode": "0x000780000010C040",
     "EventName": "PM_INST_FROM_L3MISS_ALL",
@@ -981,7 +991,7 @@
   },
   {
     "EventCode": "0x0003C0000000C142",
-    "EventName": "PM_MRK_DATA_FROM_L2MISS",
+    "EventName": "PM_MRK_DATA_FROM_L2MISS_DSRC",
     "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss for a marked instruction."
   },
   {
@@ -1046,12 +1056,12 @@
   },
   {
     "EventCode": "0x000780000000C142",
-    "EventName": "PM_MRK_INST_FROM_L3MISS",
+    "EventName": "PM_MRK_INST_FROM_L3MISS_DSRC",
     "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
   },
   {
     "EventCode": "0x0007C0000000C142",
-    "EventName": "PM_MRK_DATA_FROM_L3MISS",
+    "EventName": "PM_MRK_DATA_FROM_L3MISS_DSRC",
     "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
   },
   {
-- 
2.43.0



