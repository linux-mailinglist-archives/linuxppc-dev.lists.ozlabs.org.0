Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE7181AE9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 07:04:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swfyj1P71z3cRK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 17:04:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.97; helo=out30-97.freemail.mail.aliyun.com; envelope-from=renyu.zj@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwfyC1LCmz309c
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 17:04:00 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R301e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=renyu.zj@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VywbA6j_1703138595;
Received: from srmbuffer011165236051.sqa.net(mailfrom:renyu.zj@linux.alibaba.com fp:SMTPD_---0VywbA6j_1703138595)
          by smtp.aliyun-inc.com;
          Thu, 21 Dec 2023 14:03:55 +0800
From: Jing Zhang <renyu.zj@linux.alibaba.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [PATCH] perf vendor events: Remove UTF-8 characters from cmn.json
Date: Thu, 21 Dec 2023 14:03:13 +0800
Message-Id: <1703138593-50486-1-git-send-email-renyu.zj@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Ian Rogers <irogers@google.com>, kajoljain <kjain@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cmn.json contains UTF-8 characters in brief description which
could break the perf build on some distros.

Fix this issue by removing the UTF-8 characters from cmn.json.

without the fix:
$find tools/perf/pmu-events/ -name "*.json" | xargs file -i | grep -v us-ascii
tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json:                   application/json; charset=utf-8

with the fix:
$file -i tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json: text/plain; charset=us-ascii

Fixes: 0b4de7bdf46c5215 ("perf jevents: Add support for Arm CMN PMU aliasing")
Reported-by: Arnaldo Carvalho de Melo <acme@kernel.com>
Signed-off-by: Jing Zhang <renyu.zj@linux.alibaba.com>
---
 tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json b/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
index 428605c..5ec157c 100644
--- a/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
+++ b/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
@@ -107,7 +107,7 @@
 		"EventName": "hnf_qos_hh_retry",
 		"EventidCode": "0xe",
 		"NodeType": "0x5",
-		"BriefDescription": "Counts number of times a HighHigh priority request is protocolretried at the HN‑F.",
+		"BriefDescription": "Counts number of times a HighHigh priority request is protocolretried at the HN-F.",
 		"Unit": "arm_cmn",
 		"Compat": "(434|436|43c|43a).*"
 	},
-- 
1.8.3.1

