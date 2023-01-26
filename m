Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8741F67D9EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 00:48:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2y7r36K3z3fQT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 10:48:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mUVaju3n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=37a7tywckdhshqnfdqrfnnfkd.bnlkhmtwoob-cdukhrsr.nykzar.nqf@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mUVaju3n;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2xwX4SFzz3fJq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 10:38:20 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id c2-20020a25a2c2000000b008016611ca77so3545531ybn.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IwLDElolHzeZLKuISE9CI+5UsjDPN8soJqHYYoHyVfU=;
        b=mUVaju3nOKChRdBXbRrG511ZdgeydKkpFLygk8N9IPus6RUGwOirgTw3T6gdfTfzr2
         ri2wpt+PrZ42Xn071wp+LQhqH+elR/Nhbz7KYAQnHJlHyNNLoKZpCvvBG10Yl6WQp5aB
         c0RgZOrBDK8Uw0YakyZNIx9PANqn5sClNxkHQRGcotQ/ARkKa5jR0XxJTlVECLtXQWrB
         egfCOCLsUNdY589QTAYSBtfFFgAXhNKt8rbTYZVi6OPusPOvrIqGxaiKZ1+wMgAPfyFY
         7kjQdlvg8gkyYZkY2CDPI3EukUo8dYC249pP6eTQxENksi+EprnuE1duKfwv/RJUDlwJ
         NIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwLDElolHzeZLKuISE9CI+5UsjDPN8soJqHYYoHyVfU=;
        b=666umQXwVo94v3jueMk+G4FHu8TnSoF3/oQM6YcJYGojgZmyODyMTkb1HvT12mRYv4
         QSmTMXk7ZXQI7g9dSzQFl6jK5mvskeFiHVtfa0zlDMTUQ1u97YgM46nB0CzEIfXY7mpT
         YB6l/90xng3gCMHelPPpD4UFo/JlWy9z6UXIuHBfXw1i8OonlyyraFNRYES56T5S3LiI
         GFLkKiabt1HLFgWY5/PxGIIFaPssAKMHCN+wsj0XFK3bWT9XWS5vXkxtf9+nYRSYI6r9
         thckJuJZGMXY9rCB+SJZRfWOVZLYr6kyhC8wA1iFRVc6x/EweGs0cpZUK9CC0qlWl8lR
         D8Dg==
X-Gm-Message-State: AFqh2koAaS4PH9IG80szyBxYnuykkgUN8iCt6Mrm0Lgms7tOHCpyhrM/
	uPhTJKWzccL4nMJMpWgJXTV4GeW6WXM8
X-Google-Smtp-Source: AMrXdXurlT/MBprPyUf0wEkWYa4By5hnxMjN10TK8OtYnoQ9X72UaUExeqjlvkTePRgt8wZMr3APhFQ44gi9
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:b9b8:6de0:39b3:4cf7])
 (user=irogers job=sendgmr) by 2002:a0d:f047:0:b0:4e0:c054:9c60 with SMTP id
 z68-20020a0df047000000b004e0c0549c60mr4471856ywe.490.1674776300084; Thu, 26
 Jan 2023 15:38:20 -0800 (PST)
Date: Thu, 26 Jan 2023 15:36:41 -0800
In-Reply-To: <20230126233645.200509-1-irogers@google.com>
Message-Id: <20230126233645.200509-12-irogers@google.com>
Mime-Version: 1.0
References: <20230126233645.200509-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v5 11/15] perf jevents: Add model list option
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
---
 tools/perf/pmu-events/Build      |  3 ++-
 tools/perf/pmu-events/jevents.py | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

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
index 627ee817f57f..2bcd07ce609f 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -599,6 +599,8 @@ const struct pmu_events_map pmu_events_map[] = {
             else:
               metric_tblname = 'NULL'
               metric_size = '0'
+            if event_size == '0' and metric_size == '0':
+              continue
             cpuid = row[0].replace('\\', '\\\\')
             _args.output_file.write(f"""{{
 \t.arch = "{arch}",
@@ -888,12 +890,24 @@ def main() -> None:
           action: Callable[[Sequence[str], os.DirEntry], None]) -> None:
     """Replicate the directory/file walking behavior of C's file tree walk."""
     for item in os.scandir(path):
+      if _args.model != 'all' and item.is_dir():
+        # Check if the model matches one in _args.model.
+        if len(parents) == _args.model.split(',')[0].count('/'):
+          # We're testing the correct directory.
+          item_path = '/'.join(parents) + ('/' if len(parents) > 0 else '') + item.name
+          if 'test' not in item_path and item_path not in _args.model.split(','):
+            continue
       action(parents, item)
       if item.is_dir():
         ftw(item.path, parents + [item.name], action)
 
   ap = argparse.ArgumentParser()
   ap.add_argument('arch', help='Architecture name like x86')
+  ap.add_argument('model', help='''Select a model such as skylake to
+reduce the code size.  Normally set to "all". For architectures like
+ARM64 with an implementor/model, the model must include the implementor
+such as "arm/cortex-a34".''',
+                  default='all')
   ap.add_argument(
       'starting_dir',
       type=dir_path,
-- 
2.39.1.456.gfc5497dd1b-goog

