Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D3B679113
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:37:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1HM15F19z3fD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:37:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QtwP2zEN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=30nvpywckdc0raxpnabpxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QtwP2zEN;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1HHT08pSz3c7p
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 17:33:56 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id x188-20020a2531c5000000b00716de19d76bso15383248ybx.19
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 22:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZSaBnOGu/YbrmaTZVReqHf2hRiUdQmwsWkYLcRqpH4=;
        b=QtwP2zENUXWgyJHEws+BG/kFMb+DmxPDNYY8UIr0limSpS9S9IAP3MRKKOjLy68uHg
         YGu0i3Flajm+2md1xS3IJjuju2tpXjRb4jluoezQwdWH0WxzT2vAfZGoHeX+kjJMB28X
         N747+5LD0auc7KLvYdv8aPMiBliZwca8AvbduJUTnEq6voumSG0HC+zSttGSFFxgY02o
         EfloucCxpZkcpSRjpWvVoL6G1Y/SxMnciFfUu1u1H8mlD1E5yGXGuLwqfiQz29t6j0+o
         mTSadFJ33kvQRNes3Q36k1JwZu/FTbMEWmlmEBfxc0y8Ml2snp5tG3BUgZgRnrZqTBRE
         oWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZSaBnOGu/YbrmaTZVReqHf2hRiUdQmwsWkYLcRqpH4=;
        b=xm1cW34q04LZHgAPP17FFpZqH/y9cGnNjwx/UriHg3dwPeC7xDw4U/Guy8/d354ps0
         ePh5OvPH3Jzw31w83xzBr3hPoIuoFwGYdbNRS9clVLIcbAqPKb41coa1fOPBccLuRKbh
         anLFLASj45ZkxntDiaLySMQ9Znm/M47Apx32OAyiarxsRQfxrHU1wIAln81VJ9jGhP+b
         Dp1QcNVrVdf0lATQ5kFXnKBBl2XoymQqCKJ3ESVhdynlHyw45Bz8lMN+LgowJVm/a4ZT
         mOlhjdW/1gVMInu3jwTxyPFIx0zKF5Cc3CU7MqKKadxJiIiWp85KEAztgvitUtANiJ6K
         Lzdw==
X-Gm-Message-State: AFqh2ko7jIZvXFuy+jj/A/9FQAXwdisI2yFE2Te0DbYrQbkhc/TQtfZb
	9jYa8KtPeomKyL+nZndbC1k1jrL7cIew
X-Google-Smtp-Source: AMrXdXsJrxxO8jIp9f4xgEtR4Uc1j/O6uCmzm5bkzgsdb8o+F9xNdzJMgpeb8JqTnOypA/AiAzZUvpDGgAEA
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:460d:1b4a:acb8:ae9a])
 (user=irogers job=sendgmr) by 2002:a81:9848:0:b0:4d0:f843:c376 with SMTP id
 p69-20020a819848000000b004d0f843c376mr3009528ywg.63.1674542034884; Mon, 23
 Jan 2023 22:33:54 -0800 (PST)
Date: Mon, 23 Jan 2023 22:33:12 -0800
In-Reply-To: <20230124063320.668917-1-irogers@google.com>
Message-Id: <20230124063320.668917-4-irogers@google.com>
Mime-Version: 1.0
References: <20230124063320.668917-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Subject: [PATCH v3 03/11] perf jevents: Rewrite metrics in the same file with
 each other
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Kim Phillips <kim.phillips@amd.com>, 
	Florian Fischer <florian.fischer@muhq.space>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Xing Zhengjun <zhengjun.xing@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Kang Minchul <tegongkang@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sandipan Das <sandipan.das@amd.com>, Jing Zhang <renyu.zj@linux.alibaba.com>, 
	linuxppc-dev@lists.ozlabs.org, Kajol Jain <kjain@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Ian Rogers <irogers@google.com>, Perry Taylor <perry.taylor@intel.com>, Caleb Biggers <caleb.biggers@intel.com>, Stephane Eranian <eranian@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rewrite metrics within the same file in terms of each other. For example, o=
n Power8
other_stall_cpi is rewritten from:
"PM_CMPLU_STALL / PM_RUN_INST_CMPL - PM_CMPLU_STALL_BRU_CRU / PM_RUN_INST_C=
MPL - PM_CMPLU_STALL_FXU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_VSU / PM_RUN_I=
NST_CMPL - PM_CMPLU_STALL_LSU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NTCG_FLUS=
H / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NO_NTF / PM_RUN_INST_CMPL"
to:
"stall_cpi - bru_cru_stall_cpi - fxu_stall_cpi - vsu_stall_cpi - lsu_stall_=
cpi - ntcg_flush_cpi - no_ntf_stall_cpi"
Which more closely matches the definition on Power9.

To avoid recomputation decorate the function with a cache.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jeven=
ts.py
index 0416b7442171..15a1671740cc 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -3,6 +3,7 @@
 """Convert directories of JSON events to C code."""
 import argparse
 import csv
+from functools import lru_cache
 import json
 import metric
 import os
@@ -337,18 +338,28 @@ class JsonEvent:
     s =3D self.build_c_string()
     return f'{{ { _bcs.offsets[s] } }}, /* {s} */\n'
=20
-
+@lru_cache(maxsize=3DNone)
 def read_json_events(path: str, topic: str) -> Sequence[JsonEvent]:
   """Read json events from the specified file."""
-
   try:
-    result =3D json.load(open(path), object_hook=3DJsonEvent)
+    events =3D json.load(open(path), object_hook=3DJsonEvent)
   except BaseException as err:
     print(f"Exception processing {path}")
     raise
-  for event in result:
+  metrics: list[Tuple[str, metric.Expression]] =3D []
+  for event in events:
     event.topic =3D topic
-  return result
+    if event.metric_name and '-' not in event.metric_name:
+      metrics.append((event.metric_name, event.metric_expr))
+  updates =3D metric.RewriteMetricsInTermsOfOthers(metrics)
+  if updates:
+    for event in events:
+      if event.metric_name in updates:
+        # print(f'Updated {event.metric_name} from\n"{event.metric_expr}"\=
n'
+        #       f'to\n"{updates[event.metric_name]}"')
+        event.metric_expr =3D updates[event.metric_name]
+
+  return events
=20
 def preprocess_arch_std_files(archpath: str) -> None:
   """Read in all architecture standard events."""
--=20
2.39.0.246.g2a6d74b583-goog

