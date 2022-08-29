Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C00975A4C6A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 14:51:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGVgJ4PQDz3f7s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 22:51:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bkzY5qKI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::64a; helo=mail-ej1-x64a.google.com; envelope-from=3jlumywukdekpw6p2rzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bkzY5qKI;
	dkim-atps=neutral
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGVbg15gKz3c2v
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:48:14 +1000 (AEST)
Received: by mail-ej1-x64a.google.com with SMTP id qf22-20020a1709077f1600b00741638c5f3cso1154796ejc.23
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 05:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=xCb3PCmBWSP36RKUEWOlpZN7hfh85Z1tvKAaYcX0zpk=;
        b=bkzY5qKI18VWd4mlwWM1vsviFVP4q78HrnTxrdtR5mo9H6pfnRG17R5qugpXfL7a3C
         wCeY287TAp6qkMpaEvrmcs8dRYfSWwV8oWll0gU0C2+YoURGAMIxPu5xp4rjPy+bUaaA
         Pe7ln30jJ/atykyMBocwI9/fKS382484rx9GtCgqO1avY7pHIQ5SHOMiGbCVqPIvYzgc
         vum+2/Q5MVS6eBFJN4+hVCuVqfedsJUjTaeXPMQ2Z03LEk0tk/b+PnLwtSM5gTRlKVFJ
         4wj5vAGL/ISBuJFFNcV6QXU/h0GHjtdWdo2nTY8203whs27GL67Jq5Zsc5AZdNjCjL6M
         R2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=xCb3PCmBWSP36RKUEWOlpZN7hfh85Z1tvKAaYcX0zpk=;
        b=C/X+X51lZ/Tj9sf7V6HRXes6yrA8UyLUMISuPEe40/47N+N3iHi8n4tpO+5QX3n6bO
         7N/ZzzNCvkuEMNgU9lVCuyUlO+AkIScrAkd9WSRH62+fEmfFyJ7fg/oAjBGEiPILSdj6
         p+9gJ+RYuj1nbT4MO7cEO8UMKbkezWhlVv6JNj9oRRrgr020272qONvJM7eZFPjr3J2S
         1AB9IaAA+weD+S2KKsMS0ba1wm/Q2NpOzqVit7GtlT7KHiccs1Gh3JSnbi+2e5ZhsfW4
         B2HlW750g4JNSykTK4rx2d29RJEkVaaYcU1wye9to3z2DtWk6NZNmkYsyt1v+WN83MFf
         3Lzg==
X-Gm-Message-State: ACgBeo12Hp/6bAIzm+4zvbPBrXN1w2OGjOp4unwYejFKRyE74maqTz61
	LfqBylKqHKZjPbVUpCMXUyTqklpAmw==
X-Google-Smtp-Source: AA6agR7i/RJsfaE6+mHqdwn3xeEjB0tlbiv/szuLIYXZ6XN1jxpVHA+uSIe33NebngMb8iQE2cPcnN59JA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:196d:4fc7:fa9c:62e3])
 (user=elver job=sendgmr) by 2002:a17:906:ef90:b0:730:9d18:17b3 with SMTP id
 ze16-20020a170906ef9000b007309d1817b3mr13769351ejb.141.1661777292013; Mon, 29
 Aug 2022 05:48:12 -0700 (PDT)
Date: Mon, 29 Aug 2022 14:47:10 +0200
In-Reply-To: <20220829124719.675715-1-elver@google.com>
Mime-Version: 1.0
References: <20220829124719.675715-1-elver@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829124719.675715-6-elver@google.com>
Subject: [PATCH v4 05/14] perf/hw_breakpoint: Mark data __ro_after_init
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark read-only data after initialization as __ro_after_init.

While we are here, turn 'constraints_initialized' into a bool.

Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Acked-by: Ian Rogers <irogers@google.com>
---
 kernel/events/hw_breakpoint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 6d09edc80d19..7df46b276452 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -46,7 +46,7 @@ struct bp_cpuinfo {
 };
 
 static DEFINE_PER_CPU(struct bp_cpuinfo, bp_cpuinfo[TYPE_MAX]);
-static int nr_slots[TYPE_MAX];
+static int nr_slots[TYPE_MAX] __ro_after_init;
 
 static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
 {
@@ -62,7 +62,7 @@ static const struct rhashtable_params task_bps_ht_params = {
 	.automatic_shrinking = true,
 };
 
-static int constraints_initialized;
+static bool constraints_initialized __ro_after_init;
 
 /* Gather the number of total pinned and un-pinned bp in a cpuset */
 struct bp_busy_slots {
@@ -739,7 +739,7 @@ int __init init_hw_breakpoint(void)
 	if (ret)
 		goto err;
 
-	constraints_initialized = 1;
+	constraints_initialized = true;
 
 	perf_pmu_register(&perf_breakpoint, "breakpoint", PERF_TYPE_BREAKPOINT);
 
-- 
2.37.2.672.g94769d06f0-goog

