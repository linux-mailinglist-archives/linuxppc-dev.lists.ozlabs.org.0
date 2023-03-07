Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F886AEF0B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 19:19:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWNyV6w6Cz3chJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 05:19:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Wb7La1YK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Wb7La1YK;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWNx40Btjz3cgq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 05:18:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EA201B81851;
	Tue,  7 Mar 2023 18:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7DCC433D2;
	Tue,  7 Mar 2023 18:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678213106;
	bh=SibYQp57NS7jPG0XJfh0C067YW6BJeRZPyxGP2VFcxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wb7La1YKd1MXLtnQSK2sNMutMXfxqfccCiKAUfsOF1sTEp2ZYxsVR3s5lymRwXBaO
	 sr8On6LiLU2jCNQNAbbggKgLw34gsdjYDGEcj7gaokYZqBuZ90vYKKfWDWi+nw8ElP
	 LVOHPY8Wii3OXGtoNKsKIIqPe+cu8dxNoCnoYf+I=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.1 400/885] perf tests stat_all_metrics: Change true workload to sleep workload for system wide check
Date: Tue,  7 Mar 2023 17:55:34 +0100
Message-Id: <20230307170019.783375647@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307170001.594919529@linuxfoundation.org>
References: <20230307170001.594919529@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev, Arnaldo Carvalho de Melo <acme@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kajol Jain <kjain@linux.ibm.com>

[ Upstream commit f9fa0778ee7349a9aa3d2ea10e9f2ab843a0b44e ]

Testcase stat_all_metrics.sh fails in powerpc:

98: perf all metrics test : FAILED!

Logs with verbose:

  [command]# ./perf test 98 -vv
   98: perf all metrics test                                           :
   --- start ---
  test child forked, pid 13262
  Testing BRU_STALL_CPI
  Testing COMPLETION_STALL_CPI
   ----
  Testing TOTAL_LOCAL_NODE_PUMPS_P23
  Metric 'TOTAL_LOCAL_NODE_PUMPS_P23' not printed in:
  Error:
  Invalid event (hv_24x7/PM_PB_LNS_PUMP23,chip=3/) in per-thread mode, enable system wide with '-a'.
  Testing TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01
  Metric 'TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01' not printed in:
  Error:
  Invalid event (hv_24x7/PM_PB_RTY_LNS_PUMP01,chip=3/) in per-thread mode, enable system wide with '-a'.
   ----

Based on above logs, we could see some of the hv-24x7 metric events
fails, and logs suggest to run the metric event with -a option.  This
change happened after the commit a4b8cfcabb1d90ec ("perf stat: Delay
metric parsing"), which delayed the metric parsing phase and now before
metric parsing phase perf tool identifies, whether target is system-wide
or not. With this change, perf_event_open will fails with workload
monitoring for uncore events as expected.

The perf all metric test case fails as some of the hv-24x7 metric events
may need bigger workload with system wide monitoring to get the data.
Fix this issue by changing current system wide check from true workload
to sleep 0.01 workload.

Result with the patch changes in powerpc:

  98: perf all metrics test : Ok

Fixes: a4b8cfcabb1d90ec ("perf stat: Delay metric parsing")
Suggested-by: Ian Rogers <irogers@google.com>
Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Tested-by: Disha Goel <disgoel@linux.ibm.com>
Tested-by: Ian Rogers <irogers@google.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Nageswara R Sastry <rnsastry@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/r/20230215093827.124921-1-kjain@linux.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/tests/shell/stat_all_metrics.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
index 6e79349e42bef..22e9cb294b40e 100755
--- a/tools/perf/tests/shell/stat_all_metrics.sh
+++ b/tools/perf/tests/shell/stat_all_metrics.sh
@@ -11,7 +11,7 @@ for m in $(perf list --raw-dump metrics); do
     continue
   fi
   # Failed so try system wide.
-  result=$(perf stat -M "$m" -a true 2>&1)
+  result=$(perf stat -M "$m" -a sleep 0.01 2>&1)
   if [[ "$result" =~ "${m:0:50}" ]]
   then
     continue
-- 
2.39.2



