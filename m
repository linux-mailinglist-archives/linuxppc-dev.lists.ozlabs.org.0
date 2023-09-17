Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 994607A3969
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Sep 2023 21:49:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bP4YhOuJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpdmJ3xLRz3ccG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 05:49:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bP4YhOuJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpdkT5F37z300q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 05:47:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5915660BD8;
	Sun, 17 Sep 2023 19:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F3BC433C7;
	Sun, 17 Sep 2023 19:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694980060;
	bh=OygOJR705cS6XcI/eZZ/NTXOExTg7RDHLUzEX3v095M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bP4YhOuJ0UdAFBinG5b1iP+nCAfdhbrZYUWipvRZ+XYsMRYmHM0bR5e1Co63smYKT
	 vPlUzqWA1f7DokT8h4JxuQziJwf7bDBHhn83AlIHAkVLoVR4DzSuSnfj4ru+T8acON
	 5s7A2//LemCrQjpfUPlp2WPtenkN6/NZpaqdd4gU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.5 085/285] perf vendor events: Drop some of the JSON/events for power10 platform
Date: Sun, 17 Sep 2023 21:11:25 +0200
Message-ID: <20230917191054.651671546@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230917191051.639202302@linuxfoundation.org>
References: <20230917191051.639202302@linuxfoundation.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev, Arnaldo Carvalho de Melo <acme@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

6.5-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Kajol Jain <kjain@linux.ibm.com>

[ Upstream commit e104df97b8dcfbab2e42de634b99bf03f0805d85 ]

Drop some of the JSON/events for power10 platform due to counter
data mismatch.

Fixes: 32daa5d7899e0343 ("perf vendor events: Initial JSON/events list for power10 platform")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Disha Goel <disgoel@linux.ibm.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/r/20230814112803.1508296-2-kjain@linux.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../arch/powerpc/power10/floating_point.json           |  7 -------
 tools/perf/pmu-events/arch/powerpc/power10/marked.json | 10 ----------
 tools/perf/pmu-events/arch/powerpc/power10/others.json |  5 -----
 .../perf/pmu-events/arch/powerpc/power10/pipeline.json | 10 ----------
 .../pmu-events/arch/powerpc/power10/translation.json   |  5 -----
 5 files changed, 37 deletions(-)
 delete mode 100644 tools/perf/pmu-events/arch/powerpc/power10/floating_point.json

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json b/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json
deleted file mode 100644
index 54acb55e2c8c6..0000000000000
--- a/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json
+++ /dev/null
@@ -1,7 +0,0 @@
-[
-  {
-    "EventCode": "0x4016E",
-    "EventName": "PM_THRESH_NOT_MET",
-    "BriefDescription": "Threshold counter did not meet threshold."
-  }
-]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/marked.json b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
index 131f8d0e88317..f2436fc5537ce 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/marked.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
@@ -19,11 +19,6 @@
     "EventName": "PM_MRK_BR_TAKEN_CMPL",
     "BriefDescription": "Marked Branch Taken instruction completed."
   },
-  {
-    "EventCode": "0x20112",
-    "EventName": "PM_MRK_NTF_FIN",
-    "BriefDescription": "The marked instruction became the oldest in the pipeline before it finished. It excludes instructions that finish at dispatch."
-  },
   {
     "EventCode": "0x2C01C",
     "EventName": "PM_EXEC_STALL_DMISS_OFF_CHIP",
@@ -64,11 +59,6 @@
     "EventName": "PM_L1_ICACHE_MISS",
     "BriefDescription": "Demand instruction cache miss."
   },
-  {
-    "EventCode": "0x30130",
-    "EventName": "PM_MRK_INST_FIN",
-    "BriefDescription": "marked instruction finished. Excludes instructions that finish at dispatch. Note that stores always finish twice since the address gets issued to the LSU and the data gets issued to the VSU."
-  },
   {
     "EventCode": "0x34146",
     "EventName": "PM_MRK_LD_CMPL",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
index a5319cdba89b3..17c5424ef1ac1 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
@@ -29,11 +29,6 @@
     "EventName": "PM_DISP_SS0_2_INSTR_CYC",
     "BriefDescription": "Cycles in which Superslice 0 dispatches either 1 or 2 instructions."
   },
-  {
-    "EventCode": "0x1F15C",
-    "EventName": "PM_MRK_STCX_L2_CYC",
-    "BriefDescription": "Cycles spent in the nest portion of a marked Stcx instruction. It starts counting when the operation starts to drain to the L2 and it stops counting when the instruction retires from the Instruction Completion Table (ICT) in the Instruction Sequencing Unit (ISU)."
-  },
   {
     "EventCode": "0x10066",
     "EventName": "PM_ADJUNCT_CYC",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
index 449f57e8ba6af..799893c56f32b 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
@@ -194,11 +194,6 @@
     "EventName": "PM_TLBIE_FIN",
     "BriefDescription": "TLBIE instruction finished in the LSU. Two TLBIEs can finish each cycle. All will be counted."
   },
-  {
-    "EventCode": "0x3D058",
-    "EventName": "PM_SCALAR_FSQRT_FDIV_ISSUE",
-    "BriefDescription": "Scalar versions of four floating point operations: fdiv,fsqrt (xvdivdp, xvdivsp, xvsqrtdp, xvsqrtsp)."
-  },
   {
     "EventCode": "0x30066",
     "EventName": "PM_LSU_FIN",
@@ -269,11 +264,6 @@
     "EventName": "PM_IC_MISS_CMPL",
     "BriefDescription": "Non-speculative instruction cache miss, counted at completion."
   },
-  {
-    "EventCode": "0x4D050",
-    "EventName": "PM_VSU_NON_FLOP_CMPL",
-    "BriefDescription": "Non-floating point VSU instructions completed."
-  },
   {
     "EventCode": "0x4D052",
     "EventName": "PM_2FLOP_CMPL",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/translation.json b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
index 3e47b804a0a8f..961e2491e73f6 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/translation.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
@@ -4,11 +4,6 @@
     "EventName": "PM_MRK_START_PROBE_NOP_CMPL",
     "BriefDescription": "Marked Start probe nop (AND R0,R0,R0) completed."
   },
-  {
-    "EventCode": "0x20016",
-    "EventName": "PM_ST_FIN",
-    "BriefDescription": "Store finish count. Includes speculative activity."
-  },
   {
     "EventCode": "0x20018",
     "EventName": "PM_ST_FWD",
-- 
2.40.1



