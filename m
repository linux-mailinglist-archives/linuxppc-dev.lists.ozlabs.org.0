Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9824531549
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 19:30:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6PW23rMYz3bl7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 03:30:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=OxnMitZ6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=OxnMitZ6; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6PVM725mz2yph
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 03:30:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF14D6126E;
 Mon, 23 May 2022 17:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187A6C385A9;
 Mon, 23 May 2022 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1653327017;
 bh=lxYW3mkhaz99pmAtcNmmuE12bsbVyXiI8wvqBE9mi0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OxnMitZ6uuHXzztfzENz5EFFIhds1P1OPAsEjb+zICWMGbvBuXWVCMsH9oXQrFzIt
 PXGQ+CqUPKMRR7LyhHPIvLhHl8m1UGTPm6IVNDVbJBetHEPr6xft32gW9NcEnSxi/k
 FIPzwP0A0TcL/7L2zhN4QQxGy4ggSd9xz+09nH6Q=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.17 129/158] perf test: Fix "all PMU test" to skip
 hv_24x7/hv_gpci tests on powerpc
Date: Mon, 23 May 2022 19:04:46 +0200
Message-Id: <20220523165851.912540965@linuxfoundation.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220523165830.581652127@linuxfoundation.org>
References: <20220523165830.581652127@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>,
 Athira Jajeev <atrajeev@linux.vnet.ibm.com>,
 Nageswara R Sastry <rnsastry@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 Kajol Jain <kjain@linux.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

[ Upstream commit 451ed8058c69a3fee29fa9e2967a4e22a221fe75 ]

"perf all PMU test" picks the input events from "perf list --raw-dump
pmu" list and runs "perf stat -e" for each of the event in the list. In
case of powerpc, the PowerVM environment supports events from hv_24x7
and hv_gpci PMU which is of example format like below:

- hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/
- hv_gpci/event,partition_id=?/

The value for "?" needs to be filled in depending on system and
respective event. CPM_ADJUNCT_INST needs have core value and domain
value. hv_gpci event needs partition_id.  Similarly, there are other
events for hv_24x7 and hv_gpci having "?" in event format. Hence skip
these events on powerpc platform since values like partition_id, domain
is specific to system and event.

Fixes: 3d5ac9effcc640d5 ("perf test: Workload test of all PMUs")
Signed-off-by: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
Acked-by: Ian Rogers <irogers@google.com>
Cc: Disha Goel <disgoel@linux.vnet.ibm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nageswara R Sastry <rnsastry@linux.ibm.com>
Link: https://lore.kernel.org/r/20220520101236.17249-1-atrajeev@linux.vnet.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/tests/shell/stat_all_pmu.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/perf/tests/shell/stat_all_pmu.sh b/tools/perf/tests/shell/stat_all_pmu.sh
index b30dba455f36..9c9ef33e0b3c 100755
--- a/tools/perf/tests/shell/stat_all_pmu.sh
+++ b/tools/perf/tests/shell/stat_all_pmu.sh
@@ -5,6 +5,16 @@
 set -e
 
 for p in $(perf list --raw-dump pmu); do
+  # In powerpc, skip the events for hv_24x7 and hv_gpci.
+  # These events needs input values to be filled in for
+  # core, chip, partition id based on system.
+  # Example: hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/
+  # hv_gpci/event,partition_id=?/
+  # Hence skip these events for ppc.
+  if echo "$p" |grep -Eq 'hv_24x7|hv_gpci' ; then
+    echo "Skipping: Event '$p' in powerpc"
+    continue
+  fi
   echo "Testing $p"
   result=$(perf stat -e "$p" true 2>&1)
   if ! echo "$result" | grep -q "$p" && ! echo "$result" | grep -q "<not supported>" ; then
-- 
2.35.1



