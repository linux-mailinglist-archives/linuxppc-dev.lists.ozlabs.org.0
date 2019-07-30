Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA69579F6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 05:05:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yLyV3snLzDqKT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 13:05:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yLvW2WJFzDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 13:02:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="rmdn8grV"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45yLvW0DYGz8syV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 13:02:31 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45yLvV6hTZz9sPj; Tue, 30 Jul 2019 13:02:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=acme@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="rmdn8grV"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45yLvV2n1Xz9sPW
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Jul 2019 13:02:29 +1000 (AEST)
Received: from quaco.ghostprotocols.net (unknown [179.97.35.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D12D0216C8;
 Tue, 30 Jul 2019 03:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564455747;
 bh=PSjU/J96qYUTgZJWl8A6gS6FjJ45nEybaQnrKlCX67c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rmdn8grVj1phifwIbh16XgDIzUW3+r80oAhC4eT8EKQOjIOkzi7bveZkBLINxL7oA
 cE1HBygCe2kJjp2azFWkYXid9BwFEPMDKhvr+q2wHixPqItpX6F+n6yxh6sElweC93
 I2N3OdvpPMQHB1B10GSpUecX6qsSAk1hzqzUw47Q=
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 107/107] perf vendor events power9: Added missing event
 descriptions
Date: Mon, 29 Jul 2019 23:56:10 -0300
Message-Id: <20190730025610.22603-108-acme@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190730025610.22603-1-acme@kernel.org>
References: <20190730025610.22603-1-acme@kernel.org>
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
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org,
 Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Michael Petlan <mpetlan@redhat.com>,
 Paul Clarke <pc@us.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, Carl Love <cel@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Petlan <mpetlan@redhat.com>

Documentation source:

https://wiki.raptorcs.com/w/images/6/6b/POWER9_PMU_UG_v12_28NOV2018_pub.pdf

Signed-off-by: Michael Petlan <mpetlan@redhat.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>
Cc: Carl Love <cel@us.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Cc: Paul Clarke <pc@us.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Cc: linuxppc-dev@ozlabs.org
LPU-Reference: 20190719100837.7503-1-mpetlan@redhat.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/pmu-events/arch/powerpc/power9/memory.json | 2 +-
 tools/perf/pmu-events/arch/powerpc/power9/other.json  | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power9/memory.json b/tools/perf/pmu-events/arch/powerpc/power9/memory.json
index 2e2ebc700c74..c3bb283e37e9 100644
--- a/tools/perf/pmu-events/arch/powerpc/power9/memory.json
+++ b/tools/perf/pmu-events/arch/powerpc/power9/memory.json
@@ -52,7 +52,7 @@
   {,
     "EventCode": "0x4D02C",
     "EventName": "PM_PMC1_REWIND",
-    "BriefDescription": ""
+    "BriefDescription": "PMC1 rewind event"
   },
   {,
     "EventCode": "0x15158",
diff --git a/tools/perf/pmu-events/arch/powerpc/power9/other.json b/tools/perf/pmu-events/arch/powerpc/power9/other.json
index 48cf4f920b3f..62b864269623 100644
--- a/tools/perf/pmu-events/arch/powerpc/power9/other.json
+++ b/tools/perf/pmu-events/arch/powerpc/power9/other.json
@@ -237,7 +237,7 @@
   {,
     "EventCode": "0xD0B0",
     "EventName": "PM_HWSYNC",
-    "BriefDescription": ""
+    "BriefDescription": "A hwsync instruction was decoded and transferred"
   },
   {,
     "EventCode": "0x168B0",
@@ -1232,7 +1232,7 @@
   {,
     "EventCode": "0xD8AC",
     "EventName": "PM_LWSYNC",
-    "BriefDescription": ""
+    "BriefDescription": "An lwsync instruction was decoded and transferred"
   },
   {,
     "EventCode": "0x2094",
@@ -1747,7 +1747,7 @@
   {,
     "EventCode": "0xD8B0",
     "EventName": "PM_PTESYNC",
-    "BriefDescription": ""
+    "BriefDescription": "A ptesync instruction was counted when the instruction is decoded and transmitted"
   },
   {,
     "EventCode": "0x26086",
@@ -2107,7 +2107,7 @@
   {,
     "EventCode": "0xF080",
     "EventName": "PM_LSU_STCX_FAIL",
-    "BriefDescription": ""
+    "BriefDescription": "The LSU detects the condition that a stcx instruction failed. No requirement to wait for a response from the nest"
   },
   {,
     "EventCode": "0x30038",
-- 
2.21.0

