Return-Path: <linuxppc-dev+bounces-3012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2139C0E3F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 20:04:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xks2C12xrz3brD;
	Fri,  8 Nov 2024 06:04:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::14a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731006274;
	cv=none; b=RJTqm6ahhX6oZu5mrkrEoXw00Trny/gMk35MObuwzB09f/PdqYEHUONrIPM1W9vBoBwtCuTnuk84KajSlv98nHMC0KF5deNn4vl4sD+ZTl9q1B4H3MXesL7LK03z8NbaW3YNQFgz1GEprlVwFDu88JYDjzmSGD6eBOBmg5qEu8izmz8MshRYRnUVJPPwswTZ/MpYNnDFqKIo9qa0UKtWNzlwYi0uoiqsdGJYyMJqJqXy5AGuyDHuPg60aXF1gt+hxcsOGoDh3g6xbT88v1fvWoF4JsByjkeXbZfDs1O6kU1RopSYvtTAESGJItDWUSDkTtBaBFhLz+o2MbEHiZa48w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731006274; c=relaxed/relaxed;
	bh=nMMU6XVNr2hZZbXBXpeZIOveQYdt9smU5ZS15hc1ZTw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dy0xQnC/FVJkHhMFhDT2tU97ezQRDtS4+r8U5w7I2tNwTKOlG2VtVyqvw4kwbprFKe8Mzns8+N5hahYQe3DlV1eGNjPgtsFdHe+qPDpQagG5+h5hZAxiAGlXHzFnl5jPey7GcMgNB6S56aaOeGJpMSQvPHJXxYarJWAF2SZEZumNNITCNOTPse3I6HV0G1Bv1wNSxS8e7zvQNM24Jf9dJJ2i37SYFafarMs1QOYgDCDHepg0CWIvLCVL8vdzcuqq7VHUXzZZYfflg1mTt9ygOyzEjS7jroUOiHSuTjm3krfj5ofVT/J9HK1QyupuFYqIu1Bj9UqU36zMGzqN8EdOFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qe20zDvG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::14a; helo=mail-il1-x14a.google.com; envelope-from=3pa8tzwskde8t52a542vdz9x55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qe20zDvG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::14a; helo=mail-il1-x14a.google.com; envelope-from=3pa8tzwskde8t52a542vdz9x55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x14a.google.com (mail-il1-x14a.google.com [IPv6:2607:f8b0:4864:20::14a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xks285Vpcz3bqP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 06:04:31 +1100 (AEDT)
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3a3ba4fcf24so17027755ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2024 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731006269; x=1731611069; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nMMU6XVNr2hZZbXBXpeZIOveQYdt9smU5ZS15hc1ZTw=;
        b=qe20zDvGwyDo1tUf6K1YhoTsQhEHy+wmrDE70kDeG1xcNYpcdDuhiKNZ6QP9MsBkZH
         EDExeOd2DVO3NvftMiFe9/Io74sGfexyQcKEoG+6BLVtPDd8hW43eMqBcbevpSlEg3rT
         3dZ21PESfh31A1xVLw/6jqYzGTbpDapcOpJb8CviFxl6Xu5bdLxYRtVO1BrUjSY1U1Q7
         BCSj4xHUvTXhuhHMzqv865HsTHV16wREz/8wydjEIM0kYk1xTirBj12p+Hi2576dY5ej
         5bKtw1k/0W6WvuO056texBM/IRDqOTOgV6UWwBpzXmV9ozny1FFGmIxPjSxdJDu48Y6E
         6xBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731006269; x=1731611069;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMMU6XVNr2hZZbXBXpeZIOveQYdt9smU5ZS15hc1ZTw=;
        b=X0/mv7xVJCj5Py+Q/b8Dbhd2xHm806E8D5Po0rex58t/4FnYYMHu0SKlSsU2YOtD8N
         sbbUyV/cejy5VsELtrVSVmzHK/agWd2Q7rv/OyJqNPPA0mkHkO7ojcMYSREchBxhUFrA
         Et/s0U9tOy1fpG+HVm8fSymW/vRhhRfO3sNV9FCJbmcZh1Yd867TBmiiOlw3f9q5xSuh
         1d5sKg0LSQPd5xjD2EO5NDeIVADbj0mFWkHqk7ktmIXPaL0XesSeEibO+5vMAD1Qw4o0
         0XfwprV0Hz7PZ1sO7scWeZR8+CWOjDTY5mmJQgeWHaZgLWTokfES08/fsIiBOMLf+koS
         1eog==
X-Forwarded-Encrypted: i=1; AJvYcCVI1e6fqlO0lyErNOjk5YoAE0mxh+9niWkwS0oA6b10PainYHwqkKUuohPG6Qd6Re4QDYIrk/+mEP2e+3E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywk08K7UARwjVLFOgA0t/M3PoUNDJENiHIM4lPTDUObr92WqHdZ
	qpafV5lX7oDG6VUvfDXECIZ3dbO9ebpkPGLQ1za6sZKHigpkPDAZIBqcqS2dSSo9w6ur/YeznpA
	z6+2BoQw4OlBRlKr9bvXx9Q==
X-Google-Smtp-Source: AGHT+IGk8o1Kolvzif7abhodsa0UQDRBeg0LTLwxblT9qcEU5Wpk1+d5hb0oOxJJFfemEOegIAlQ+QjJB899aR6iQA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a92:c24a:0:b0:3a3:4377:bafd with SMTP
 id e9e14a558f8ab-3a6f1a71786mr28105ab.5.1731006268975; Thu, 07 Nov 2024
 11:04:28 -0800 (PST)
Date: Thu,  7 Nov 2024 19:03:36 +0000
In-Reply-To: <20241107190336.2963882-1-coltonlewis@google.com>
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
References: <20241107190336.2963882-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107190336.2963882-6-coltonlewis@google.com>
Subject: [PATCH v7 5/5] perf: Correct perf sampling with guest VMs
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
index 9fdc5fa22c66..d85e12ca4263 100644
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
 
@@ -3035,17 +3032,12 @@ unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
 
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
index 772ad352856b..368ea0e9577c 100644
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
+	if (!(guest_state & PERF_GUEST_ACTIVE))
+		return 0;
+
+	if (guest_state & PERF_GUEST_USER)
+		return PERF_RECORD_MISC_GUEST_USER;
+	else
+		return PERF_RECORD_MISC_GUEST_KERNEL;
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
2.47.0.277.g8800431eea-goog


