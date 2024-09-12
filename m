Return-Path: <linuxppc-dev+bounces-1302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B59772FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 22:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4V3h711wz2yhZ;
	Fri, 13 Sep 2024 06:51:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726174304;
	cv=none; b=jj8YUqvbAIm5TQBJd/UD6v5v18xSW4JQRVVvBNwOPF8k5pI7bGYXZMS4Bauppva2f6fD+CwMlOg8fPr17RQNR4naj/MJoE5kaZS5NkWjcBKo3tK5ER3Zmdu0s2plVCGv7gUQE3wqHffdAIZlSJaUB8H/KBz2wrkgwIu38EALNlwYJzbtTBhMBXGNvZbCuSnfM53nuXtIGT5Vp+FKKms8rdxkrJb09nPk5zctM6rmxJ6s1e6L/y/EhyQhfV7ZuWSXVaUShtqQymwkJgNhA/b13eqqppeHbIrx2q/hDbESXxnZHadi/wgVFasGgrG9MtDDwxpF/L/6SkXzauqCdciMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726174304; c=relaxed/relaxed;
	bh=pN3motQEuLoryG8c/qRFsCpEmHTVQN30TnUfjf1L05Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cK6Rt1H8pJx5PRwc/1RZqXq/pxhb8OKg9c7eXzjCFR64jguV+JUS9jVrnwyI3mK1qHhKIPQ9UAiGfQNvVz0ARXfQoPpUmNPKFzH/JDj2edBMFjTAm0rEuMLTwl0Z1lQ0oOZmalDPRErZWWUwOGutM1aVs+6eWYBbwxN0fmrwLjgNOtzDQUQadmHB0Zne6jl3TWgjH55nLqRmkD40+vw4wkbOb7hoIE9JbGsLqgJS3W0mHm74tozFEHGmg5XCI2zdgqeaX3rxAc2OGgtVuCb8IMKSyDsyX1Q5eK3VrpqBnd3POayB74P6BTrphwrE7AsoMu5JFrP0rGNvCoe1OVROmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hLmj5Hf3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::149; helo=mail-il1-x149.google.com; envelope-from=3xvtjzgskdnaya7fa970i4e2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hLmj5Hf3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::149; helo=mail-il1-x149.google.com; envelope-from=3xvtjzgskdnaya7fa970i4e2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com [IPv6:2607:f8b0:4864:20::149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4V3h3zRJz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 06:51:44 +1000 (AEST)
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-39f5605c674so3260145ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726174301; x=1726779101; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pN3motQEuLoryG8c/qRFsCpEmHTVQN30TnUfjf1L05Y=;
        b=hLmj5Hf3zKI24SGTTzszTNGZ4cFTY4KipWh1w87d6ksWBpDB1x7gqAl6qP6OEVG53k
         5aM3+8q/2YujW8UVAjL+k52EiWgPd6NYsFJpS9NDE72Lb6VFRkwSJpWlDqd57oRxxoXL
         NZ6tKdEBa0uAiQwJcs1HU5NbwJw0vXw7/kzK6F5eNh2pIbS4Ch8+sY7Qgrp+eEx1rkmA
         b6IrY8XA9tySy9v2CzeI37iIn5H7iq6JXAq5TN49I3hm1/xtmHonjIgeFMQ9GJ2GDIDB
         smG80YjwPf3+5p7P+Zo18wFvWr/6OUD6k1+rsh2SHkZY6zjMo8yCFYuwMd85qBWT0ZBt
         asXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174301; x=1726779101;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pN3motQEuLoryG8c/qRFsCpEmHTVQN30TnUfjf1L05Y=;
        b=RUhrNpcaepBwh0qcpGIenBRVolBh+K+3a6LYuxuvspObd6CukjA/62k4FNop4zwZ+6
         Bm/O2HNsCq4ZKX2ShwgHA5nqyaZeYegTK4r4yog3uKe+lyoD2/CzZy3G/V0jDVWmJNf9
         eGnTWKiGbL6YgDm8Untr9fiB0a92ryXmwgmvUXDaxbnRqQwyKeVJfFx4xIoHlNfzRh6J
         b9lhYE040abSRpkglTlX14ik2N5oMVyh2ZWlsu8RTrvh68Wt9epDMnzBvnKa/gIBPKRp
         Sa/jVkG+9YycreKGyqZ0E94jKFpnjVqIT9gXRBFRXgrzmLPeib4K2/BHAbO/WH+Jd2AK
         s5ow==
X-Forwarded-Encrypted: i=1; AJvYcCWkezIfd0C8ybj0lNdknwHt6J/B95bIsm3y12sKK3dSEb1FLEswCKykv2MRtnZbnzQJ9logok7bCTTtP5g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwuxjCgAcO4EtuGH7FvXx/4kw5sz2Qv/IFmx4v9XIwZKSd/oWGw
	iFijNKZsj8kUQHi8B+3098p872iTsTKiQTUZscEBtA+sKutTl6gRj8nwkOTNeWLlcRYUvVeX4ZI
	ItRd4VQwmijzu6qcCTthWOw==
X-Google-Smtp-Source: AGHT+IE5uBnbPCKzOwkMC48JVFthRmj9q9RybjWG1vwJiuOPIIxum8Gar8GGRDZP2nZfvTS3r0HkOT/glreBt/EPvw==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a92:cd83:0:b0:397:b509:6441 with SMTP
 id e9e14a558f8ab-3a08b72994amr15335ab.2.1726174301380; Thu, 12 Sep 2024
 13:51:41 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:51:33 +0000
In-Reply-To: <20240912205133.4171576-1-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20240912205133.4171576-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240912205133.4171576-6-coltonlewis@google.com>
Subject: [PATCH v3 5/5] perf: Correct perf sampling with guest VMs
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
index d51e5d24802b..3c5f512d2bcf 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2942,9 +2942,6 @@ static unsigned long code_segment_base(struct pt_regs *regs)
 
 unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 {
-	if (perf_guest_state())
-		return perf_guest_get_ip();
-
 	return regs->ip + code_segment_base(regs);
 }
 
@@ -2971,17 +2968,12 @@ unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
 
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
index d061e327ad54..968f3edd95e4 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1633,8 +1633,9 @@ extern void perf_tp_event(u16 event_type, u64 count, void *record,
 			  struct task_struct *task);
 extern void perf_bp_event(struct perf_event *event, void *data);
 
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_misc_flags(struct perf_event *event, struct pt_regs *regs);
+extern unsigned long perf_instruction_pointer(struct perf_event *event,
+					      struct pt_regs *regs);
 
 #ifndef perf_arch_misc_flags
 # define perf_arch_misc_flags(regs) \
@@ -1645,6 +1646,22 @@ extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
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
index eeabbf791a8c..c5e57c024d9a 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6921,13 +6921,26 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
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
 
@@ -7743,7 +7756,7 @@ void perf_prepare_sample(struct perf_sample_data *data,
 	__perf_event_header__init_id(data, event, filtered_sample_type);
 
 	if (filtered_sample_type & PERF_SAMPLE_IP) {
-		data->ip = perf_instruction_pointer(regs);
+		data->ip = perf_instruction_pointer(event, regs);
 		data->sample_flags |= PERF_SAMPLE_IP;
 	}
 
@@ -7907,7 +7920,7 @@ void perf_prepare_header(struct perf_event_header *header,
 {
 	header->type = PERF_RECORD_SAMPLE;
 	header->size = perf_sample_data_size(data, event);
-	header->misc = perf_misc_flags(regs);
+	header->misc = perf_misc_flags(event, regs);
 
 	/*
 	 * If you're adding more sample types here, you likely need to do
-- 
2.46.0.662.g92d0881bb0-goog


