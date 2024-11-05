Return-Path: <linuxppc-dev+bounces-2886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3AC9BD644
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 20:57:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjfHG1shkz2ywq;
	Wed,  6 Nov 2024 06:56:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730836602;
	cv=none; b=jEjT52XMJ/cjAGuWXms5RZpAg/DSM5PmAwCVEvlPM27Zm+DwzrDvv5SNVse4ASHYfU8KYOQu9hF+/WcM1GB8DhOooqAcHWE2MtTV8s09kD9HHxSmQlum0H/oA4VgPxoIEtDZ39bc8sax0h9rHZ1xWUbia+up6BbQTeSo5yqth7aW7fg5B41wmuLfu0qYKLt0KkIAyIoOMs9nPUAQ3it8mzzjZos1J9HRnHe4nAJ1tEiXQ/luVzxFtMkf93f2bPZHHb9Ic82mi4VjbTG21HQBBwa1Lka/WteB5wkYabAdPEH/KAplfKT4b0ZbE2k4L1Pj8+gIlJ6qWb8ddCquyWiDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730836602; c=relaxed/relaxed;
	bh=m4LSX7jp2Qk0unPMxnSvbmTUvnRmwzrHBbuAe/XVNyI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kf6uPtQ3Jk6UjeeJdBERtLY0bSvPcGdwCk2/t3KJ4IBCWl14UWQZ1UFmfc7Yx1C3Sqp/9cjNU7p4U7oLXN6Wf9OwOObHaVT2yo7OD68BSZhcIp9n0K/T4R/Hv1a3iCsObJk5lQl8Y7nUFJzsKHqGP2VsLCdgfJ29knVsLxPYk8Vgge2i+Utx7/6niTDzwSyg1YBY7bg6/oBf8PIe5X1+1wLK2H5Ikg8wlMHzDr+onflaGESthUShu4vaqPpjYCwKdfoFeyKgCFmLZemr/bTvNtyc+q6imZGDhXD8Fct9DdSkjqPoJErQz620AxQYmWaE46J5aDAG8vvjaMbc4+VgVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FdDcdSxU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3cngqzwskde0r308320tbx7v33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FdDcdSxU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3cngqzwskde0r308320tbx7v33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com [IPv6:2607:f8b0:4864:20::d4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjfHB5LTzz2yZ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 06:56:38 +1100 (AEDT)
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-8353599024bso585834339f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2024 11:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730836594; x=1731441394; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m4LSX7jp2Qk0unPMxnSvbmTUvnRmwzrHBbuAe/XVNyI=;
        b=FdDcdSxUsg83JuaaODCslvMlPq80Y+bn1Ia0c+EhimiuWYuLZhZrlvjhPyPTVKsBqd
         +dTWWwB1P28i1wJxb7XQK9brH3jkWnZgSUKg6EcmH1BVmJQPucWSMCa9ZzkQiYKlS2QF
         bcQMeCUEQnWK0qBl2WQmGTkOXL69CuY0YRCHNGw5vdocFF0iepnrFxnMGUBctL1QfOov
         pOkusbPmbZ2jCuK+tWFIs6+htI+RTWJx8Dkv86n8xG1CfFz4EYCHdSZy2dwRg5B0eurN
         GjRHWt1VGznWgwBUCY0XQOt9WrZ+AgwLYZDHeUgiRBgoYvIWVfmzVT2X2qyLQwNWnQMT
         Qkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730836594; x=1731441394;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4LSX7jp2Qk0unPMxnSvbmTUvnRmwzrHBbuAe/XVNyI=;
        b=Z/3OsoOtG7s4baW0dyTewoctIp1fFVwsA5h7NiwpwEDJagtl67od7YsFHCAUb5wogJ
         8jkbsi+tzxd3FGU3lB3ENz1tsRhMUBBW26WJ+EBSW4F5nvoHlTojd6aF9f7qdLD0PTmK
         T+YWxu4rN/ulT1bve+brtmXpWIgwQ2yMfaecCUqFp4coXHTXGWL19ZOtNuKGoW7WVTti
         reOpdp7hHVvezqwiiZnLhoTwR8GLQKa67lDZ5uQW481MIiaRoWBQOxLddydRm4yPOdku
         Nt2eJONNCDjFb1O1nKnqrRESDQL0eY4RZ+jmdiXDHPaFUyIi7hkl55ZJa0q9+VwUWvXZ
         pcwg==
X-Forwarded-Encrypted: i=1; AJvYcCWncZLueMrte1TRZDKsT3KUp63U8SZA5tGUJ0PR5xPrrpPZbV4Ei7L+NkYnlUDMcHfctCpwPtEpvO7HeWQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxmJn0OIXgkMV+Yoh0ckF4EOfXmhv1sUl1sT5J+zDoyqlDnRT4g
	FLHsWzZFWTCLGEqQKbIgky+ePdMjN9TaDX6OSKaHYezCpsV+0UdbUSOB1IoFriZIWoKZ0Z6HfJz
	sksxJ7Klh1nruviewz6JEfQ==
X-Google-Smtp-Source: AGHT+IGFWv6Kn3TvX6dXV3OFqthDQLbL+dvhQJb9vkUUge7jztFf2TETEHNZy98hndWREoqhSt0rcXIvqTH5LIwoGQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6602:3f81:b0:82d:821:96a7 with
 SMTP id ca18e2360f4ac-83b1c4c870cmr11455439f.3.1730836594061; Tue, 05 Nov
 2024 11:56:34 -0800 (PST)
Date: Tue,  5 Nov 2024 19:56:02 +0000
In-Reply-To: <20241105195603.2317483-1-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241105195603.2317483-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241105195603.2317483-6-coltonlewis@google.com>
Subject: [PATCH v6 5/5] perf: Correct perf sampling with guest VMs
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Previously any PMU overflow interrupt that fired while a VCPU was
loaded was recorded as a guest event whether it truly was or not. This
resulted in nonsense perf recordings that did not honor
perf_event_attr.exclude_guest and recorded guest IPs where it should
have recorded host IPs.

Rework the sampling logic to only record guest samples for events with
exclude_guest = 0. This way any host-only events with exclude_guest
set will never see unexpected guest samples. The behaviour of events
with exclude_guest = 0 is unchanged.

Note that events configured to sample both host and guest may still
misattribute a PMI that arrived in the host as a guest event depending
on KVM arch and vendor behavior.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/perf_event.h |  4 ----
 arch/arm64/kernel/perf_callchain.c  | 28 ----------------------------
 arch/x86/events/core.c              | 16 ++++------------
 include/linux/perf_event.h          | 21 +++++++++++++++++++--
 kernel/events/core.c                | 21 +++++++++++++++++----
 5 files changed, 40 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
index 31a5584ed423..ee45b4e77347 100644
--- a/arch/arm64/include/asm/perf_event.h
+++ b/arch/arm64/include/asm/perf_event.h
@@ -10,10 +10,6 @@
 #include <asm/ptrace.h>
 
 #ifdef CONFIG_PERF_EVENTS
-struct pt_regs;
-extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
-#define perf_arch_misc_flags(regs)	perf_misc_flags(regs)
 #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
 #endif
 
diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
index 01a9d08fc009..9b7f26b128b5 100644
--- a/arch/arm64/kernel/perf_callchain.c
+++ b/arch/arm64/kernel/perf_callchain.c
@@ -38,31 +38,3 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 
 	arch_stack_walk(callchain_trace, entry, current, regs);
 }
-
-unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
-{
-	if (perf_guest_state())
-		return perf_guest_get_ip();
-
-	return instruction_pointer(regs);
-}
-
-unsigned long perf_arch_misc_flags(struct pt_regs *regs)
-{
-	unsigned int guest_state = perf_guest_state();
-	int misc = 0;
-
-	if (guest_state) {
-		if (guest_state & PERF_GUEST_USER)
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
-	} else {
-		if (user_mode(regs))
-			misc |= PERF_RECORD_MISC_USER;
-		else
-			misc |= PERF_RECORD_MISC_KERNEL;
-	}
-
-	return misc;
-}
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 24910c625e3d..aae0c5eabf09 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3005,9 +3005,6 @@ static unsigned long code_segment_base(struct pt_regs *regs)
 
 unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 {
-	if (perf_guest_state())
-		return perf_guest_get_ip();
-
 	return regs->ip + code_segment_base(regs);
 }
 
@@ -3034,17 +3031,12 @@ unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
 
 unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
-	unsigned int guest_state = perf_guest_state();
 	unsigned long misc = common_misc_flags(regs);
 
-	if (guest_state) {
-		misc |= perf_arch_guest_misc_flags(regs);
-	} else {
-		if (user_mode(regs))
-			misc |= PERF_RECORD_MISC_USER;
-		else
-			misc |= PERF_RECORD_MISC_KERNEL;
-	}
+	if (user_mode(regs))
+		misc |= PERF_RECORD_MISC_USER;
+	else
+		misc |= PERF_RECORD_MISC_KERNEL;
 
 	return misc;
 }
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 772ad352856b..e207acdd9e73 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1655,8 +1655,9 @@ extern void perf_tp_event(u16 event_type, u64 count, void *record,
 			  struct task_struct *task);
 extern void perf_bp_event(struct perf_event *event, void *data);
 
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_misc_flags(struct perf_event *event, struct pt_regs *regs);
+extern unsigned long perf_instruction_pointer(struct perf_event *event,
+					      struct pt_regs *regs);
 
 #ifndef perf_arch_misc_flags
 # define perf_arch_misc_flags(regs) \
@@ -1667,6 +1668,22 @@ extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
 # define perf_arch_bpf_user_pt_regs(regs) regs
 #endif
 
+#ifndef perf_arch_guest_misc_flags
+static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
+{
+	unsigned long guest_state = perf_guest_state();
+
+	if (guest_state & PERF_GUEST_USER)
+		return PERF_RECORD_MISC_GUEST_USER;
+
+	if (guest_state & PERF_GUEST_ACTIVE)
+		return PERF_RECORD_MISC_GUEST_KERNEL;
+
+	return 0;
+}
+# define perf_arch_guest_misc_flags(regs)	perf_arch_guest_misc_flags(regs)
+#endif
+
 static inline bool has_branch_stack(struct perf_event *event)
 {
 	return event->attr.sample_type & PERF_SAMPLE_BRANCH_STACK;
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2c44ffd6f4d8..c62164a2ff23 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7022,13 +7022,26 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
 #endif
 
-unsigned long perf_misc_flags(struct pt_regs *regs)
+static bool should_sample_guest(struct perf_event *event)
 {
+	return !event->attr.exclude_guest && perf_guest_state();
+}
+
+unsigned long perf_misc_flags(struct perf_event *event,
+			      struct pt_regs *regs)
+{
+	if (should_sample_guest(event))
+		return perf_arch_guest_misc_flags(regs);
+
 	return perf_arch_misc_flags(regs);
 }
 
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
+unsigned long perf_instruction_pointer(struct perf_event *event,
+				       struct pt_regs *regs)
 {
+	if (should_sample_guest(event))
+		return perf_guest_get_ip();
+
 	return perf_arch_instruction_pointer(regs);
 }
 
@@ -7849,7 +7862,7 @@ void perf_prepare_sample(struct perf_sample_data *data,
 	__perf_event_header__init_id(data, event, filtered_sample_type);
 
 	if (filtered_sample_type & PERF_SAMPLE_IP) {
-		data->ip = perf_instruction_pointer(regs);
+		data->ip = perf_instruction_pointer(event, regs);
 		data->sample_flags |= PERF_SAMPLE_IP;
 	}
 
@@ -8013,7 +8026,7 @@ void perf_prepare_header(struct perf_event_header *header,
 {
 	header->type = PERF_RECORD_SAMPLE;
 	header->size = perf_sample_data_size(data, event);
-	header->misc = perf_misc_flags(regs);
+	header->misc = perf_misc_flags(event, regs);
 
 	/*
 	 * If you're adding more sample types here, you likely need to do
-- 
2.47.0.199.ga7371fff76-goog


