Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AABA67C25F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 02:30:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2NS470kFz3fJr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 12:30:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=g5kNYx2i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ynxrywckdhcdmjbzmnbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=g5kNYx2i;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2NDy2qdVz3cgp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 12:20:34 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5065604854eso3777437b3.16
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 17:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYQmk36LwpH1amM5NS/JZnLvaK2yBpvx1p5Vz+enrHo=;
        b=g5kNYx2i/3N21JTuAlpQ2Fzr0z4yS5BF5bpwKl6uBD9aJAt61CO1Cxf2wOs6Z6Le4j
         woG9v16pTQyq6MRJ3l0+3Q8SwZomo4kn2dMJ78fwpX9TiUULdeKPKPQMgJLHQXfeSljh
         Tz8qAv3zT6uOZvOFT6MlpOMURNETaASAXkZOz5R0qIHG4KfR+qUenefEszI6IbhmlxAo
         DpbMgACRE0CV+GOVDn/CN0GOTKRfvezhoZgYafaFwo4iXRIsRJVYG9QTqaDNxbb/vvIh
         VahpBNlPSFCRJFvx7tii4AcdZRcpXXE8FeDomLyGIK6NHSUIJ2OeVzRVYe+oWOrxZQw+
         LZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYQmk36LwpH1amM5NS/JZnLvaK2yBpvx1p5Vz+enrHo=;
        b=le+gSKH/7FtbaXOcxVUWGeMo/Hp/taVhiOQmj3Nyh7Y9+sMEpLSMIdaVnyZ1mmMi9N
         OyuBUW9c5Jk8cm/DSC7XCt/ritKcV/S7BXuQ42K/4pjgQRMrx3EX1BCsJiL7qLE6n2p0
         3FdVXolHbIMnsOgPB2bJaBS8t1tPQQBiXiDUZ4JsU4MG5EA2VHjVGZrrnCUUlwU3ZXts
         0J+yk6pUAuPsyQDfaMfSJB70DsK+jY+Ddhz3hM6VxcTImGCWNkUY1C16+WeQBB7MUVG0
         6p/xHpBxlhVrPtV3CO1nkKSjtY4CdP80oiduqunRo38/HxW8t0ftl5zzj/QJN/cb+Mcp
         spOA==
X-Gm-Message-State: AFqh2koIrr4nVJx+UEPkZjx56eQR8bN0H0wPxY3NVsWfrEuMIgcbLfpY
	j1Qm8VRI0M6Yxwl0ey4DPEB1wOkmmiuu
X-Google-Smtp-Source: AMrXdXtJyXEuVpA/fKT4Gs+OHOHp62Ve2MgKmevUrheQ5iCrugGv01d4Et9NsO/jcVDyYhqORA5ZqbJKTjoZ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:568d:4d98:b468:b025])
 (user=irogers job=sendgmr) by 2002:a81:5c02:0:b0:4e2:db5a:2c2c with SMTP id
 q2-20020a815c02000000b004e2db5a2c2cmr4504216ywb.202.1674696032312; Wed, 25
 Jan 2023 17:20:32 -0800 (PST)
Date: Wed, 25 Jan 2023 17:18:53 -0800
In-Reply-To: <20230126011854.198243-1-irogers@google.com>
Message-Id: <20230126011854.198243-12-irogers@google.com>
Mime-Version: 1.0
References: <20230126011854.198243-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v4 11/12] perf jevents: Add model list option
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

