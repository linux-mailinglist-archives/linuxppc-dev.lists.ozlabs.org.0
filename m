Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A887A399A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Sep 2023 21:52:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YSWLEe2z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpdqP5ybNz3cn0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 05:52:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YSWLEe2z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rpdkf4J02z3cC9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 05:47:54 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F191D60BD8;
	Sun, 17 Sep 2023 19:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E26C433C8;
	Sun, 17 Sep 2023 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694980071;
	bh=CAGdkPGWsMEpYXlokznD6ISLGy/gfriiqr63WthGK5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YSWLEe2zvqoGH0pKA1SpE2R80/LJbplgUkylyhv+ymJWzVtcxOGiU3ji9luIwkD1/
	 jKNHmtYFqNIjpOwRm2eFlszsTloyrR4sB3xpSszC7P7JoAKGPI1odU4Rj6tS67f0DA
	 5gs6O68kOolGMMwuHChhBRkg9Ppqe3mlSIAzBNI0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.5 088/285] perf vendor events: Update metric event names for power10 platform
Date: Sun, 17 Sep 2023 21:11:28 +0200
Message-ID: <20230917191054.752496408@linuxfoundation.org>
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

[ Upstream commit edd65d2bc55fb84d7b80c2ffe3b74d9b11ac4e2f ]

Update metric event name for some of the JSON/metric events for
power10 platform.

Fixes: 3ca3af7d1f230d1f ("perf vendor events power10: Add metric events JSON file for power10 platform")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Disha Goel <disgoel@linux.ibm.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/r/20230814112803.1508296-6-kjain@linux.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../arch/powerpc/power10/metrics.json         | 50 +++++++++----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
index e3087eb1ccff8..182369076d956 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
@@ -16,133 +16,133 @@
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled for any reason",
         "MetricExpr": "PM_DISP_STALL_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI;CPI_STALL_RATIO",
-        "MetricName": "DISPATCHED_CPI"
+        "MetricName": "DISPATCH_STALL_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled because there was a flush",
         "MetricExpr": "PM_DISP_STALL_FLUSH / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_FLUSH_CPI"
+        "MetricName": "DISPATCH_STALL_FLUSH_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled because the MMU was handling a translation miss",
         "MetricExpr": "PM_DISP_STALL_TRANSLATION / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_TRANSLATION_CPI"
+        "MetricName": "DISPATCH_STALL_TRANSLATION_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled waiting to resolve an instruction ERAT miss",
         "MetricExpr": "PM_DISP_STALL_IERAT_ONLY_MISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_IERAT_ONLY_MISS_CPI"
+        "MetricName": "DISPATCH_STALL_IERAT_ONLY_MISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled waiting to resolve an instruction TLB miss",
         "MetricExpr": "PM_DISP_STALL_ITLB_MISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_ITLB_MISS_CPI"
+        "MetricName": "DISPATCH_STALL_ITLB_MISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled due to an icache miss",
         "MetricExpr": "PM_DISP_STALL_IC_MISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_IC_MISS_CPI"
+        "MetricName": "DISPATCH_STALL_IC_MISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while the instruction was fetched from the local L2",
         "MetricExpr": "PM_DISP_STALL_IC_L2 / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_IC_L2_CPI"
+        "MetricName": "DISPATCH_STALL_IC_L2_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while the instruction was fetched from the local L3",
         "MetricExpr": "PM_DISP_STALL_IC_L3 / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_IC_L3_CPI"
+        "MetricName": "DISPATCH_STALL_IC_L3_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while the instruction was fetched from any source beyond the local L3",
         "MetricExpr": "PM_DISP_STALL_IC_L3MISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_IC_L3MISS_CPI"
+        "MetricName": "DISPATCH_STALL_IC_L3MISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled due to an icache miss after a branch mispredict",
         "MetricExpr": "PM_DISP_STALL_BR_MPRED_ICMISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_BR_MPRED_ICMISS_CPI"
+        "MetricName": "DISPATCH_STALL_BR_MPRED_ICMISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while instruction was fetched from the local L2 after suffering a branch mispredict",
         "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L2 / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_BR_MPRED_IC_L2_CPI"
+        "MetricName": "DISPATCH_STALL_BR_MPRED_IC_L2_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while instruction was fetched from the local L3 after suffering a branch mispredict",
         "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3 / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_BR_MPRED_IC_L3_CPI"
+        "MetricName": "DISPATCH_STALL_BR_MPRED_IC_L3_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while instruction was fetched from any source beyond the local L3 after suffering a branch mispredict",
         "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3MISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_BR_MPRED_IC_L3MISS_CPI"
+        "MetricName": "DISPATCH_STALL_BR_MPRED_IC_L3MISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled due to a branch mispredict",
         "MetricExpr": "PM_DISP_STALL_BR_MPRED / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_BR_MPRED_CPI"
+        "MetricName": "DISPATCH_STALL_BR_MPRED_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch for any reason",
         "MetricExpr": "PM_DISP_STALL_HELD_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because of a synchronizing instruction that requires the ICT to be empty before dispatch",
         "MetricExpr": "PM_DISP_STALL_HELD_SYNC_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISP_HELD_STALL_SYNC_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_SYNC_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch while waiting on the scoreboard",
         "MetricExpr": "PM_DISP_STALL_HELD_SCOREBOARD_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISP_HELD_STALL_SCOREBOARD_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_SCOREBOARD_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch due to issue queue full",
         "MetricExpr": "PM_DISP_STALL_HELD_ISSQ_FULL_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISP_HELD_STALL_ISSQ_FULL_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_ISSQ_FULL_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because the mapper/SRB was full",
         "MetricExpr": "PM_DISP_STALL_HELD_RENAME_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_RENAME_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_RENAME_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because the STF mapper/SRB was full",
         "MetricExpr": "PM_DISP_STALL_HELD_STF_MAPPER_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_STF_MAPPER_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_STF_MAPPER_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because the XVFC mapper/SRB was full",
         "MetricExpr": "PM_DISP_STALL_HELD_XVFC_MAPPER_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_XVFC_MAPPER_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_XVFC_MAPPER_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch for any other reason",
         "MetricExpr": "PM_DISP_STALL_HELD_OTHER_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_OTHER_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_OTHER_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction has been dispatched but not issued for any reason",
@@ -352,13 +352,13 @@
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled because fetch was being held, so there was nothing in the pipeline for this thread",
         "MetricExpr": "PM_DISP_STALL_FETCH / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_FETCH_CPI"
+        "MetricName": "DISPATCH_STALL_FETCH_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because of power management",
         "MetricExpr": "PM_DISP_STALL_HELD_HALT_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_HALT_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_HALT_CPI"
     },
     {
         "BriefDescription": "Percentage of flushes per completed instruction",
@@ -560,7 +560,7 @@
         "BriefDescription": "Average number of STCX instructions finshed per completed instruction",
         "MetricExpr": "PM_STCX_FIN / PM_RUN_INST_CMPL",
         "MetricGroup": "General",
-        "MetricName": "STXC_PER_INST"
+        "MetricName": "STCX_PER_INST"
     },
     {
         "BriefDescription": "Average number of LARX instructions finshed per completed instruction",
-- 
2.40.1



