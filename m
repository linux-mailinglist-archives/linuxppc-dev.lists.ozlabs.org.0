Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7808966861A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:50:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtJBh1yNHz3g6p
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:50:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XVZvrxt5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=namhyung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XVZvrxt5;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtHz06F2dz3gBy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 08:40:28 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id n12so20481370pjp.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 13:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2i4YuMUlvMifEh3T6Lz7Q3wr3VQ+FCqQlCzw4xiZBo=;
        b=XVZvrxt5WGZOPzCt8LDpJrjmv8glK3D9y2YETiG2e3W2V/XenVy70B5SsLUdUe6CJ8
         6UgFVCsd19ClkBttPp76iWnpqwbRld6K+1rrvX+x9usSAFx1KN7utwRemqy3mMwTmp6i
         5cIWZz8dg9F0eAoq/zcIdGiS3VORcbs8cCb4JomvOU9cgHxbaciaubTAB20K8GMEwTQq
         MJdb8q+EzilmfWBLgqGkIx7KJB29oIvaJikSM88/5xfyS5xqym3zjVixXkS7zTg9eFl7
         o7akxkNjflSS2M4HHWEl0/ZiBHnHkOsFAevM0mBz/DuNeGqPICmdmB474dv8ZGASPWIl
         ryjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l2i4YuMUlvMifEh3T6Lz7Q3wr3VQ+FCqQlCzw4xiZBo=;
        b=JOOqRiGr9Hmumd6d1XJS4UGwn18c1GsFuItS4x0LG+utsTBH39M/eLxzo9YOCU2eHA
         YQ+M6hgrr58Bv9T126YrG/Omy6UjWx1GAIMhPkX5wYbw1HCznSM4eWhgm084Jcr9X4cQ
         +Nr8R4tVSspmDO+/l/xm3hklaQPYViMjMr9se1X231QZNwSg9rLgRQp+9Tlztr/agPj1
         9FqYywnfkgbbb8yb1E+w5PBUIQSxfcGBtoM2owf5ppfL3B1hUVTQWyWaK0TX/9PimYHx
         cypDZsPP/Ya21JXpHeB3k7DtETFVzYJ25LqCRBMTBoEDd7/JiJKy06Xrk3yl4NOPwD/a
         2IAQ==
X-Gm-Message-State: AFqh2kp0D6/3RQqhtashhBhVkOfx+02rHqau5AA2IsyKFaJEVzlvhleI
	RPNc5TKt1NZdByAziGcB+Hs=
X-Google-Smtp-Source: AMrXdXtikgEbLuS8PBAUlCH+VVw6Z27M5RL43urXbD+xL9SIzYFLx8fvlzFWjsI5cE+0fsN85JeXnw==
X-Received: by 2002:a05:6a20:aa9f:b0:af:7762:3c29 with SMTP id ck31-20020a056a20aa9f00b000af77623c29mr9348181pzb.10.1673559624771;
        Thu, 12 Jan 2023 13:40:24 -0800 (PST)
Received: from youngsil.svl.corp.google.com ([2620:15c:2d4:203:b71e:23d4:aa6a:47c0])
        by smtp.gmail.com with ESMTPSA id q20-20020aa79834000000b0058134d2df41sm11344605pfl.146.2023.01.12.13.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 13:40:24 -0800 (PST)
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 4/8] perf/core: Add perf_sample_save_brstack() helper
Date: Thu, 12 Jan 2023 13:40:11 -0800
Message-Id: <20230112214015.1014857-5-namhyung@kernel.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230112214015.1014857-1-namhyung@kernel.org>
References: <20230112214015.1014857-1-namhyung@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Song Liu <song@kernel.org>, Jiri Olsa <jolsa@kernel.org>, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When it saves the branch stack to the perf sample data, it needs to
update the sample flags and the dynamic size.  To make sure this,
add the perf_sample_save_brstack() helper and convert all call sites.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 arch/powerpc/perf/core-book3s.c |  3 +-
 arch/x86/events/amd/core.c      |  6 +--
 arch/x86/events/intel/core.c    |  6 +--
 arch/x86/events/intel/ds.c      |  9 ++---
 include/linux/perf_event.h      | 66 ++++++++++++++++++++-------------
 kernel/events/core.c            | 16 +++-----
 6 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index bf318dd9b709..8c1f7def596e 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2313,8 +2313,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 			struct cpu_hw_events *cpuhw;
 			cpuhw = this_cpu_ptr(&cpu_hw_events);
 			power_pmu_bhrb_read(event, cpuhw);
-			data.br_stack = &cpuhw->bhrb_stack;
-			data.sample_flags |= PERF_SAMPLE_BRANCH_STACK;
+			perf_sample_save_brstack(&data, event, &cpuhw->bhrb_stack);
 		}
 
 		if (event->attr.sample_type & PERF_SAMPLE_DATA_SRC &&
diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index d6f3703e4119..463f3eb8bbd7 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -928,10 +928,8 @@ static int amd_pmu_v2_handle_irq(struct pt_regs *regs)
 		if (!x86_perf_event_set_period(event))
 			continue;
 
-		if (has_branch_stack(event)) {
-			data.br_stack = &cpuc->lbr_stack;
-			data.sample_flags |= PERF_SAMPLE_BRANCH_STACK;
-		}
+		if (has_branch_stack(event))
+			perf_sample_save_brstack(&data, event, &cpuc->lbr_stack);
 
 		if (perf_event_overflow(event, &data, regs))
 			x86_pmu_stop(event, 0);
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 29d2d0411caf..14f0a746257d 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3036,10 +3036,8 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 
 		perf_sample_data_init(&data, 0, event->hw.last_period);
 
-		if (has_branch_stack(event)) {
-			data.br_stack = &cpuc->lbr_stack;
-			data.sample_flags |= PERF_SAMPLE_BRANCH_STACK;
-		}
+		if (has_branch_stack(event))
+			perf_sample_save_brstack(&data, event, &cpuc->lbr_stack);
 
 		if (perf_event_overflow(event, &data, regs))
 			x86_pmu_stop(event, 0);
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 158cf845fc80..07c8a2cdc3ee 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -1720,10 +1720,8 @@ static void setup_pebs_fixed_sample_data(struct perf_event *event,
 		data->sample_flags |= PERF_SAMPLE_TIME;
 	}
 
-	if (has_branch_stack(event)) {
-		data->br_stack = &cpuc->lbr_stack;
-		data->sample_flags |= PERF_SAMPLE_BRANCH_STACK;
-	}
+	if (has_branch_stack(event))
+		perf_sample_save_brstack(data, event, &cpuc->lbr_stack);
 }
 
 static void adaptive_pebs_save_regs(struct pt_regs *regs,
@@ -1883,8 +1881,7 @@ static void setup_pebs_adaptive_sample_data(struct perf_event *event,
 
 		if (has_branch_stack(event)) {
 			intel_pmu_store_pebs_lbrs(lbr);
-			data->br_stack = &cpuc->lbr_stack;
-			data->sample_flags |= PERF_SAMPLE_BRANCH_STACK;
+			perf_sample_save_brstack(data, event, &cpuc->lbr_stack);
 		}
 	}
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 569dfac5887f..7db0e9cc2682 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1102,6 +1102,31 @@ extern u64 perf_event_read_value(struct perf_event *event,
 
 extern struct perf_callchain_entry *perf_callchain(struct perf_event *event, struct pt_regs *regs);
 
+static inline bool branch_sample_no_flags(const struct perf_event *event)
+{
+	return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
+}
+
+static inline bool branch_sample_no_cycles(const struct perf_event *event)
+{
+	return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
+}
+
+static inline bool branch_sample_type(const struct perf_event *event)
+{
+	return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
+}
+
+static inline bool branch_sample_hw_index(const struct perf_event *event)
+{
+	return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
+}
+
+static inline bool branch_sample_priv(const struct perf_event *event)
+{
+	return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
+}
+
 
 struct perf_sample_data {
 	/*
@@ -1210,6 +1235,21 @@ static inline void perf_sample_save_raw_data(struct perf_sample_data *data,
 	data->sample_flags |= PERF_SAMPLE_RAW;
 }
 
+static inline void perf_sample_save_brstack(struct perf_sample_data *data,
+					    struct perf_event *event,
+					    struct perf_branch_stack *brs)
+{
+	int size = sizeof(u64); /* nr */
+
+	if (branch_sample_hw_index(event))
+		size += sizeof(u64);
+	size += brs->nr * sizeof(struct perf_branch_entry);
+
+	data->br_stack = brs;
+	data->dyn_size += size;
+	data->sample_flags |= PERF_SAMPLE_BRANCH_STACK;
+}
+
 /*
  * Clear all bitfields in the perf_branch_entry.
  * The to and from fields are not cleared because they are
@@ -1827,30 +1867,4 @@ static inline void perf_lopwr_cb(bool mode)
 }
 #endif
 
-#ifdef CONFIG_PERF_EVENTS
-static inline bool branch_sample_no_flags(const struct perf_event *event)
-{
-	return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
-}
-
-static inline bool branch_sample_no_cycles(const struct perf_event *event)
-{
-	return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
-}
-
-static inline bool branch_sample_type(const struct perf_event *event)
-{
-	return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
-}
-
-static inline bool branch_sample_hw_index(const struct perf_event *event)
-{
-	return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
-}
-
-static inline bool branch_sample_priv(const struct perf_event *event)
-{
-	return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
-}
-#endif /* CONFIG_PERF_EVENTS */
 #endif /* _LINUX_PERF_EVENT_H */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 133894ae5e30..0218b6ffaf36 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7317,7 +7317,7 @@ void perf_output_sample(struct perf_output_handle *handle,
 	}
 
 	if (sample_type & PERF_SAMPLE_BRANCH_STACK) {
-		if (data->sample_flags & PERF_SAMPLE_BRANCH_STACK) {
+		if (data->br_stack) {
 			size_t size;
 
 			size = data->br_stack->nr
@@ -7594,16 +7594,10 @@ void perf_prepare_sample(struct perf_event_header *header,
 		data->sample_flags |= PERF_SAMPLE_RAW;
 	}
 
-	if (sample_type & PERF_SAMPLE_BRANCH_STACK) {
-		int size = sizeof(u64); /* nr */
-		if (data->sample_flags & PERF_SAMPLE_BRANCH_STACK) {
-			if (branch_sample_hw_index(event))
-				size += sizeof(u64);
-
-			size += data->br_stack->nr
-			      * sizeof(struct perf_branch_entry);
-		}
-		data->dyn_size += size;
+	if (filtered_sample_type & PERF_SAMPLE_BRANCH_STACK) {
+		data->br_stack = NULL;
+		data->dyn_size += sizeof(u64);
+		data->sample_flags |= PERF_SAMPLE_BRANCH_STACK;
 	}
 
 	if (sample_type & (PERF_SAMPLE_REGS_USER | PERF_SAMPLE_STACK_USER))
-- 
2.39.0.314.g84b9a713c41-goog

