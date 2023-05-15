Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9C270383F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 19:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKmc25cW7z3bxt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 03:30:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Qf9F3WqU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Qf9F3WqU;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKmb94jv0z3bxL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 03:29:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 840EA62D23;
	Mon, 15 May 2023 17:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D00FC433D2;
	Mon, 15 May 2023 17:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1684171794;
	bh=CQLT/bsvAJd2jCdkCfQb3EdAHZfQbieJuhsfPHb1y0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qf9F3WqU761emn4JK5OlBHuprw7BmCA27BYVS/Qli2rRlQXLS535KqBAYTDID8NHV
	 ItMhyCWw8ISoFMxXDza2caRAbfRtlEe57qymfy3rkvcH4ppDb85vOL8So6xTZzvDCp
	 UmbIrKKwSAvX0MNLINCdBpz1VuVEtwCk5VmkB070=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 5.15 050/134] perf vendor events power9: Remove UTF-8 characters from JSON files
Date: Mon, 15 May 2023 18:28:47 +0200
Message-Id: <20230515161704.811283068@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515161702.887638251@linuxfoundation.org>
References: <20230515161702.887638251@linuxfoundation.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev, Arnaldo Carvalho de Melo <acme@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kajol Jain <kjain@linux.ibm.com>

[ Upstream commit 5d9df8731c0941f3add30f96745a62586a0c9d52 ]

Commit 3c22ba5243040c13 ("perf vendor events powerpc: Update POWER9
events") added and updated power9 PMU JSON events. However some of the
JSON events which are part of other.json and pipeline.json files,
contains UTF-8 characters in their brief description.  Having UTF-8
character could breaks the perf build on some distros.

Fix this issue by removing the UTF-8 characters from other.json and
pipeline.json files.

Result without the fix:

  [command]# file -i pmu-events/arch/powerpc/power9/*
  pmu-events/arch/powerpc/power9/cache.json:          application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/floating-point.json: application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/frontend.json:       application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/marked.json:         application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/memory.json:         application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/metrics.json:        application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/nest_metrics.json:   application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/other.json:          application/json; charset=utf-8
  pmu-events/arch/powerpc/power9/pipeline.json:       application/json; charset=utf-8
  pmu-events/arch/powerpc/power9/pmc.json:            application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/translation.json:    application/json; charset=us-ascii
  [command]#

Result with the fix:

  [command]# file -i pmu-events/arch/powerpc/power9/*
  pmu-events/arch/powerpc/power9/cache.json:          application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/floating-point.json: application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/frontend.json:       application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/marked.json:         application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/memory.json:         application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/metrics.json:        application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/nest_metrics.json:   application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/other.json:          application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/pipeline.json:       application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/pmc.json:            application/json; charset=us-ascii
  pmu-events/arch/powerpc/power9/translation.json:    application/json; charset=us-ascii
  [command]#

Fixes: 3c22ba5243040c13 ("perf vendor events powerpc: Update POWER9 events")
Reported-by: Arnaldo Carvalho de Melo <acme@kernel.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Acked-by: Ian Rogers <irogers@google.com>
Tested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Disha Goel <disgoel@linux.ibm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/lkml/ZBxP77deq7ikTxwG@kernel.org/
Link: https://lore.kernel.org/r/20230328112908.113158-1-kjain@linux.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/pmu-events/arch/powerpc/power9/other.json    | 4 ++--
 tools/perf/pmu-events/arch/powerpc/power9/pipeline.json | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power9/other.json b/tools/perf/pmu-events/arch/powerpc/power9/other.json
index 3f69422c21f99..f10bd554521a0 100644
--- a/tools/perf/pmu-events/arch/powerpc/power9/other.json
+++ b/tools/perf/pmu-events/arch/powerpc/power9/other.json
@@ -1417,7 +1417,7 @@
   {
     "EventCode": "0x45054",
     "EventName": "PM_FMA_CMPL",
-    "BriefDescription": "two flops operation completed (fmadd, fnmadd, fmsub, fnmsub) Scalar instructions only. "
+    "BriefDescription": "two flops operation completed (fmadd, fnmadd, fmsub, fnmsub) Scalar instructions only."
   },
   {
     "EventCode": "0x201E8",
@@ -2017,7 +2017,7 @@
   {
     "EventCode": "0xC0BC",
     "EventName": "PM_LSU_FLUSH_OTHER",
-    "BriefDescription": "Other LSU flushes including: Sync (sync ack from L2 caused search of LRQ for oldest snooped load, This will either signal a Precise Flush of the oldest snooped loa or a Flush Next PPC); Data Valid Flush Next (several cases of this, one example is store and reload are lined up such that a store-hit-reload scenario exists and the CDF has already launched and has gotten bad/stale data); Bad Data Valid Flush Next (might be a few cases of this, one example is a larxa (D$ hit) return data and dval but can't allocate to LMQ (LMQ full or other reason). Already gave dval but can't watch it for snoop_hit_larx. Need to take the “bad dval” back and flush all younger ops)"
+    "BriefDescription": "Other LSU flushes including: Sync (sync ack from L2 caused search of LRQ for oldest snooped load, This will either signal a Precise Flush of the oldest snooped loa or a Flush Next PPC); Data Valid Flush Next (several cases of this, one example is store and reload are lined up such that a store-hit-reload scenario exists and the CDF has already launched and has gotten bad/stale data); Bad Data Valid Flush Next (might be a few cases of this, one example is a larxa (D$ hit) return data and dval but can't allocate to LMQ (LMQ full or other reason). Already gave dval but can't watch it for snoop_hit_larx. Need to take the 'bad dval' back and flush all younger ops)"
   },
   {
     "EventCode": "0x5094",
diff --git a/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json b/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
index d0265f255de2b..723bffa41c448 100644
--- a/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
+++ b/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
@@ -442,7 +442,7 @@
   {
     "EventCode": "0x4D052",
     "EventName": "PM_2FLOP_CMPL",
-    "BriefDescription": "DP vector version of fmul, fsub, fcmp, fsel, fabs, fnabs, fres ,fsqrte, fneg "
+    "BriefDescription": "DP vector version of fmul, fsub, fcmp, fsel, fabs, fnabs, fres ,fsqrte, fneg"
   },
   {
     "EventCode": "0x1F142",
-- 
2.39.2



