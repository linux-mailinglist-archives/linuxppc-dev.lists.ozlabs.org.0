Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB76056595F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:07:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc8LL4cYbz3cJC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 01:07:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c7LZpgpH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::549; helo=mail-ed1-x549.google.com; envelope-from=32qhdygukdaykr1kxmuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c7LZpgpH;
	dkim-atps=neutral
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc8JX2t9Nz30Lp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 01:06:04 +1000 (AEST)
Received: by mail-ed1-x549.google.com with SMTP id v16-20020a056402349000b00435a1c942a9so7412410edc.15
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul 2022 08:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0mVGJO2my8t1HZTqH29Koygvc/XGcDZ6vWpb1jdDT4o=;
        b=c7LZpgpHCMEBj4kEkGYT6bIghj7rNP9OT0wV7natbn5wuqgLWU/zG9DSmlQ3UoI0nM
         MI4O6Yh+OcLIuk2ut/UkMTguYgLY7CRzA22Nl6fr3P2zFMYeTmGQmVqsEFwVmEbhQ6OK
         fzW4NNfl1lbwaGdyJPbQTgrp78RaKY7f6kZBMtyl+6RXzcPxksBXHu63hC9eFKG/bMPV
         RaIopRqFLF6DUEH5O1JW3to4T/kOCMvFYMeqTdSydrxqLwRnWOFUO0Df8H0K5KNdjHHJ
         tfKLT8izTPB0q+KzUVb+TsNCU3Ae+1Iq/NAZaHYQYOFNSHtTznzKAwdaMHkQ3wSbp6QS
         l/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0mVGJO2my8t1HZTqH29Koygvc/XGcDZ6vWpb1jdDT4o=;
        b=BpPy5qgyHTfKApl0Kbic1fFRIym2A397MbooSLwInJcbJNwbC6xPFAA24+tUQVTHha
         iIu1VkU5Jfex4jngc8qSnXsuMX1bf/JzvfCtonoJFYxxJnxchq028n06qpvJLjuaViQr
         jBgmhdM3KB6ZeUiNfwkEti7YdIiNX798tUYda2RLW0dHgaiM/ilszomkyXyZOiJkTNpw
         seum0JRW50JMXN5PMZLi1ppjc38ZtHVXem5hdkV23Z3WnsO1xUt5gg0HWprCl8KaoQ0r
         hB1YhyUjaYHWQCDg2VaTY97lakeLIhfJgCwQWF2ayfWE529Wd3okxLjaw5ktaFTsilHN
         zApw==
X-Gm-Message-State: AJIora8ppQJWLhuRa6Ht7pYi3ggo9UpVUHV95w5QYBVeIDL/ShVsZR5j
	e4tTuDCqRbblANtX67ry6v8SL3ed6g==
X-Google-Smtp-Source: AGRyM1u1tV984VAUKT5L9i/jwt0YX43hTGCtQ8Dkdr+VsujPNvT+0VKdHYhVoQYNC2BBRUvkHBjcbLjtmw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:6edf:e1bc:9a92:4ad0])
 (user=elver job=sendgmr) by 2002:aa7:cd17:0:b0:435:bd7e:2efb with SMTP id
 b23-20020aa7cd17000000b00435bd7e2efbmr40768145edw.180.1656947161289; Mon, 04
 Jul 2022 08:06:01 -0700 (PDT)
Date: Mon,  4 Jul 2022 17:05:02 +0200
In-Reply-To: <20220704150514.48816-1-elver@google.com>
Message-Id: <20220704150514.48816-3-elver@google.com>
Mime-Version: 1.0
References: <20220704150514.48816-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 02/14] perf/hw_breakpoint: Provide hw_breakpoint_is_used()
 and use in test
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide hw_breakpoint_is_used() to check if breakpoints are in use on
the system.

Use it in the KUnit test to verify the global state before and after a
test case.

Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* New patch.
---
 include/linux/hw_breakpoint.h      |  3 +++
 kernel/events/hw_breakpoint.c      | 29 +++++++++++++++++++++++++++++
 kernel/events/hw_breakpoint_test.c | 12 +++++++++++-
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
index 78dd7035d1e5..a3fb846705eb 100644
--- a/include/linux/hw_breakpoint.h
+++ b/include/linux/hw_breakpoint.h
@@ -74,6 +74,7 @@ register_wide_hw_breakpoint(struct perf_event_attr *attr,
 extern int register_perf_hw_breakpoint(struct perf_event *bp);
 extern void unregister_hw_breakpoint(struct perf_event *bp);
 extern void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events);
+extern bool hw_breakpoint_is_used(void);
 
 extern int dbg_reserve_bp_slot(struct perf_event *bp);
 extern int dbg_release_bp_slot(struct perf_event *bp);
@@ -121,6 +122,8 @@ register_perf_hw_breakpoint(struct perf_event *bp)	{ return -ENOSYS; }
 static inline void unregister_hw_breakpoint(struct perf_event *bp)	{ }
 static inline void
 unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events)	{ }
+static inline bool hw_breakpoint_is_used(void)		{ return false; }
+
 static inline int
 reserve_bp_slot(struct perf_event *bp)			{return -ENOSYS; }
 static inline void release_bp_slot(struct perf_event *bp) 		{ }
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index f32320ac02fd..fd5cd1f9e7fc 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -604,6 +604,35 @@ void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events)
 }
 EXPORT_SYMBOL_GPL(unregister_wide_hw_breakpoint);
 
+/**
+ * hw_breakpoint_is_used - check if breakpoints are currently used
+ *
+ * Returns: true if breakpoints are used, false otherwise.
+ */
+bool hw_breakpoint_is_used(void)
+{
+	int cpu;
+
+	if (!constraints_initialized)
+		return false;
+
+	for_each_possible_cpu(cpu) {
+		for (int type = 0; type < TYPE_MAX; ++type) {
+			struct bp_cpuinfo *info = get_bp_info(cpu, type);
+
+			if (info->cpu_pinned)
+				return true;
+
+			for (int slot = 0; slot < nr_slots[type]; ++slot) {
+				if (info->tsk_pinned[slot])
+					return true;
+			}
+		}
+	}
+
+	return false;
+}
+
 static struct notifier_block hw_breakpoint_exceptions_nb = {
 	.notifier_call = hw_breakpoint_exceptions_notify,
 	/* we need to be notified first */
diff --git a/kernel/events/hw_breakpoint_test.c b/kernel/events/hw_breakpoint_test.c
index 433c5c45e2a5..5ced822df788 100644
--- a/kernel/events/hw_breakpoint_test.c
+++ b/kernel/events/hw_breakpoint_test.c
@@ -294,7 +294,14 @@ static struct kunit_case hw_breakpoint_test_cases[] = {
 static int test_init(struct kunit *test)
 {
 	/* Most test cases want 2 distinct CPUs. */
-	return num_online_cpus() < 2 ? -EINVAL : 0;
+	if (num_online_cpus() < 2)
+		return -EINVAL;
+
+	/* Want the system to not use breakpoints elsewhere. */
+	if (hw_breakpoint_is_used())
+		return -EBUSY;
+
+	return 0;
 }
 
 static void test_exit(struct kunit *test)
@@ -308,6 +315,9 @@ static void test_exit(struct kunit *test)
 		kthread_stop(__other_task);
 		__other_task = NULL;
 	}
+
+	/* Verify that internal state agrees that no breakpoints are in use. */
+	KUNIT_EXPECT_FALSE(test, hw_breakpoint_is_used());
 }
 
 static struct kunit_suite hw_breakpoint_test_suite = {
-- 
2.37.0.rc0.161.g10f37bed90-goog

