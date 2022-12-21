Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51306538C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 23:38:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcpHc4LZQz3f9Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 09:38:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KLo5zAIN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3coqjywckdm83c91zcd19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KLo5zAIN;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcpCw6vQdz3bh4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 09:34:52 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-3dfb9d11141so3923367b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 14:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6Ltg4f6uWL2k+LZiF466krcgS3aBizbqVelMESPLmU=;
        b=KLo5zAINtEhTy5AFiXvYhnTWFonz2gHXklS2cIgblZMzDqBGkvD/GjAhIbm8nbedAP
         G43TLqjfZ6HYOq6kQ3M6MlobEyHfYtBTwzBDWRY/dm++ym7mS1yUHPofAqRwrn2R9QTg
         ZUN2Z4vunBRPE/O73l2AeZy+wuvJR97b1giojICmxup/IQgwWU+JA9ojKBP2fkomqql7
         ScZmQ7bSmFvruZvR4ImWtFGVRKLnQvkCks8Yq4MAzbAYZrWkjagLKSOjUwM0JrgKJDd6
         x8JqtGCGq7mXrCezWgcnTJlXlDVc4lMkKIq32ZgeQ7x4oKx+RdEHJsX3QoiCzLZLgNCa
         iyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p6Ltg4f6uWL2k+LZiF466krcgS3aBizbqVelMESPLmU=;
        b=ueYjyp/NxwFKGAWa/QJMVI1yH4/HOlHKpNu/Qtqg6qHE2KbluS/+NJZrAeHp37Z+He
         HTqA/QjhOkKMVlarLKIbzE81zU1xwQ5pUYfsFXPNg8ouyd+uxphgqKZOoRWxftWpIkKR
         dKrrZCTavfM4712ptAXNS/88Kc9xfb3ij0lAQcga2nuPxNiye3ViJpD/4s8xe5ZU/Swg
         GV8Uu/74TnZTRFRlxCnjny8Nh7crxQdwWpYv0P0Ta+Q6sNXocfj6l+XZE/omo/DRCmQB
         DcE3fPLFxN0TOGjBaVa998rw8qTt/Utxb8Jh2Elci6VHbQnc0tqWbF2nEH2q2HPcd52l
         P/6w==
X-Gm-Message-State: AFqh2kqzXeqjGs10KV4lUHptXNkZhEHwIMTvJFo3/pPIt/apyIMrp1va
	7DXpcCn2TEklib05y50cDzWqkFms/Vu7
X-Google-Smtp-Source: AMrXdXsci0AMSF8Hr2DpdojcQrgVMbQ5l9lfm2lHEIIViWRShp+iXq7vcYMkxVW6Y3EwFrGoDRp5Su0CP7t4
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:62bd:f120:1fd8:1d21])
 (user=irogers job=sendgmr) by 2002:a81:b642:0:b0:373:6e8a:e7db with SMTP id
 h2-20020a81b642000000b003736e8ae7dbmr317784ywk.144.1671662090799; Wed, 21 Dec
 2022 14:34:50 -0800 (PST)
Date: Wed, 21 Dec 2022 14:34:14 -0800
In-Reply-To: <20221221223420.2157113-1-irogers@google.com>
Message-Id: <20221221223420.2157113-4-irogers@google.com>
Mime-Version: 1.0
References: <20221221223420.2157113-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Subject: [PATCH v2 3/9] perf jevents: Rewrite metrics in the same file with
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
index 4c398e0eeb2f..229402565425 100755
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
2.39.0.314.g84b9a713c41-goog

