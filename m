Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3472464AF1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 06:10:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWRQf00Gsz3dvY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 16:10:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Hykjn0Yn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3aweyywckdpwmvskivwksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Hykjn0Yn;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWRFV62blz3cGR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 16:02:38 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id v195-20020a252fcc000000b007125383fe0dso15340116ybv.23
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 21:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zFoUQZBIucfBHAzpZJT/16yExsgKsGPFpGFVDTFI4pg=;
        b=Hykjn0YnZLB3e/W/M5ftjBk9hwanekR9hHKWeQOpHf9tKvhLm6AZNZDmkd4/NFAf25
         yaemlLwxvCESBXC9dGW4Zxgkyy+cv0vxBY5LiOeuFMR010snN1MowWY+jAByoeUdtNML
         iSME37bprX3dSNrQ/tBAHgzu7x1rvv7dkgO175shpNCH0tKrWkOAYCvsLbTDXeTHRe9i
         mLuWmua3QlI8w2jF6CC+jt6gNgnTxrVDaxvF8D9kUPLE6e1kliKN+Jpp/o0RzhtpodfJ
         4zj+o/5rBPzWkqyEUr7q2g3h1IL1nik+ahzHd4VL59+Kr3x+D6YSXu/n1jDOukXFC9Pe
         Bp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFoUQZBIucfBHAzpZJT/16yExsgKsGPFpGFVDTFI4pg=;
        b=n8D2bWeYzknPNUc2iEg+kfE0tv5hPjIBP00OnoZjcWmrikJ/pkw0p5g+YJlSO4wzZ6
         ouDS+g1cPBxQ60OEoE9hNnHb76oZOD92X+X0OyXwE0UHmUktRDEEryB9x9+I/A1YO4Ur
         wvnNb7MqVwAPWXTqlmHhC2eOUC3SuCRgxJQNQcdn4OIKKeB3vq5EcR5QmwkFLl0p8l78
         pHcxgbgUDLve695VVQbd3E+3jA11eJ+R6zwZ5pl+fCRd/MwNgze3AIApM5GFv5dHU8N4
         k3QQGZqnsr1PhRvZlHuwbXrp4adg0XCIakxgG3kovlxUSJJG6qRswVojTWojW4J6AfLZ
         Y9Og==
X-Gm-Message-State: ANoB5pmB0b5UBnLQGAcyQaHGHuRHsJMl5EAgUpZHH3aQKpERTXLW4ge1
	KImp8s6m3W4SSKQQrQQuBzcRiz48vWWc
X-Google-Smtp-Source: AA0mqf6VW0VD1o3v3B/fECqbV2MLOC6uD9t9z8sOMvlDeV6Poor8q8adLTZM2LUOhP9KIV9JrkilsnWjwDuv
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:6b9f:864c:28da:e99b])
 (user=irogers job=sendgmr) by 2002:a0d:e5c4:0:b0:388:7d2:566f with SMTP id
 o187-20020a0de5c4000000b0038807d2566fmr18942255ywe.346.1670907755509; Mon, 12
 Dec 2022 21:02:35 -0800 (PST)
Date: Mon, 12 Dec 2022 21:00:43 -0800
In-Reply-To: <20221213050043.1199380-1-irogers@google.com>
Message-Id: <20221213050043.1199380-10-irogers@google.com>
Mime-Version: 1.0
References: <20221213050043.1199380-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Subject: [PATCH v1 9/9] perf jevents: Add model list option
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

This allows the set of generated jevents events and metrics be limited
to a subset of the model names. Appropriate if trying to minimize the
binary size where only a set of models are possible.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/Build      | 3 ++-
 tools/perf/pmu-events/jevents.py | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
index 15b9e8fdbffa..a14de24ecb69 100644
--- a/tools/perf/pmu-events/Build
+++ b/tools/perf/pmu-events/Build
@@ -10,6 +10,7 @@ JEVENTS_PY	=  pmu-events/jevents.py
 ifeq ($(JEVENTS_ARCH),)
 JEVENTS_ARCH=$(SRCARCH)
 endif
+JEVENTS_MODEL ?= all
 
 #
 # Locate/process JSON files in pmu-events/arch/
@@ -23,5 +24,5 @@ $(OUTPUT)pmu-events/pmu-events.c: pmu-events/empty-pmu-events.c
 else
 $(OUTPUT)pmu-events/pmu-events.c: $(JSON) $(JSON_TEST) $(JEVENTS_PY) pmu-events/metric.py
 	$(call rule_mkdir)
-	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) $(JEVENTS_ARCH) pmu-events/arch $@
+	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) $(JEVENTS_ARCH) $(JEVENTS_MODEL) pmu-events/arch $@
 endif
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index c98443319145..e9eba51e8557 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -886,12 +886,16 @@ def main() -> None:
           action: Callable[[Sequence[str], os.DirEntry], None]) -> None:
     """Replicate the directory/file walking behavior of C's file tree walk."""
     for item in os.scandir(path):
+      if (len(parents) == 0 and item.is_dir() and _args.model != 'all' and
+          'test' not in item.name and item.name not in _args.model.split(',')):
+        continue
       action(parents, item)
       if item.is_dir():
         ftw(item.path, parents + [item.name], action)
 
   ap = argparse.ArgumentParser()
   ap.add_argument('arch', help='Architecture name like x86')
+  ap.add_argument('model', help='Model such as skylake, normally "all"', default='all')
   ap.add_argument(
       'starting_dir',
       type=dir_path,
-- 
2.39.0.rc1.256.g54fd8350bd-goog

