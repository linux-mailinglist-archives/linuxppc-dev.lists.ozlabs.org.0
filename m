Return-Path: <linuxppc-dev+bounces-1269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC6975D1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 00:25:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3wB547xmz2yF1;
	Thu, 12 Sep 2024 08:25:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726093517;
	cv=none; b=b48EzrYFsvyATLipGf8jvIHFXlcEi6JUOqwJHBjTrF4JpeALKjPT3fxRVD2Jafzfzp7fgwq7V+QbNeruT3P4fxl3S9wUEDYdfwY2jkffovPfFm/7fTSos+WMXmP6aePyP/MPsn9WFaEmOjKzk+LuiAaQsM9Tapxw8WcCa9SlQLKggYJdfr3hOEw62mir4WBfsEvSZNnt6MxocSpyjc/w5wERyGpJkQLir4Jk36+K2VQQiV9cTMecVHFRyX1xvw8q7wnHX0Z3p4tLEPU1HCr3qgbH25p8yfR7/b13XmHen+jNtHD7pY7UltL2d6KI6VjDqGHRNkkF//RgrlUqwU21XA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726093517; c=relaxed/relaxed;
	bh=anqmPTOCFLWtYH4INX466EMjOxNIdwCN/nyhNcnm/nY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fc1APIVIJV1V0Qjr+Z43rSpAv/6ViPx6AHuzj5RQMLbaiJEjfmlPMONX3fNBiiLcxcZUc3ZFQ05RT9QU54jFK3i8DHAk3aBRUpwL3YBR2e1nBOZayi9VsK4veFw2iHfgyXq5M3HYmZrwGrDCPJtRVRKZQe1mtxgdzJ1yMITDLQ1zfGwqE0G/vQ09XgSE/u3gyQwoTHDXYtUOmNPiYuQQoNQq4JDojZBHwEJjenjtOmwwo+rjCDdBq6C7ila/U5woxT+xtjTL5/0pDnxvTt2DcgKACcEde7Ln92uZ0KdLbei42zF8LlyBw/cPxc9Z6GZ27TPIXGhKF5bBgLOkcufcvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=q8tVXwB9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3yxjizgskdmikwt1wvtm4q0owwotm.kwutqv25xxk-lm3tq010.w7tij0.wzo@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=q8tVXwB9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3yxjizgskdmikwt1wvtm4q0owwotm.kwutqv25xxk-lm3tq010.w7tij0.wzo@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3wB50wk8z2y8d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 08:25:17 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6d5235d1bcaso13568567b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 15:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726093515; x=1726698315; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=anqmPTOCFLWtYH4INX466EMjOxNIdwCN/nyhNcnm/nY=;
        b=q8tVXwB9dToXhJ3LxTo+8sOJk7EmPscaYR8dRpA2JZELs+wIJbB+B//XVtEGd1yrm8
         Exzir3DFPxP8Zzhy/2IT1K5rP0oOWngNGMmcxdIvepW6IgHiW69m2YFOUE+R6IRuTAZM
         5RGWvxpAH1mMf/uE95Fy1rqO7VuqE15PdLnlmAiECu81d4g23wbG6e6ACezMcfY96Aso
         RuEkhgWY+dbXvLFEH6i4XykO4qdx4DGE8RlKxxzgT0Lk+P4+4PvdXdm+qOWr4WiIef7j
         fPOLl+EBqKk9M/vF4BZZHnzFCywwO6T9oDZKZ0c0yLtXTBt3RMgQyjFqPn50mKq7rlv9
         J+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726093515; x=1726698315;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=anqmPTOCFLWtYH4INX466EMjOxNIdwCN/nyhNcnm/nY=;
        b=MhLwZ3jZRMAv5HSIUTR3MXC+clG4gMZntTa2TVBFeH6zLC8iz0nAO/MZ6akHoS4uDZ
         9QaaRtYIsH4ThWPw/R9L6bDRT6b+K90Q8OQlKxFAfchUgTSObCQiuM7AtyzgZB+enKAN
         N8OCL2v8iXa75J5I5wfaM+d09LrfE3piovKCFzDprInWp2oHtlxxaoGscXJPz2g0Nf/j
         dnmqzhd79DyFJ8vpRdQOvnPyvFisUCZJYn7qbHPRmB1efjjgbd44QXVCcpmE0rcxl5T7
         WkZqAg8cJW8ELGWnD+/hUIR6mgrtiB4Cn9MW6oHZX+zJDdCzmaye1M5EoSy3PhJATwrk
         nVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWINDtTgB3WHWBcrUjZv/dOCZ0R6AcLOHc4VdYHaOo3URprdoreaXnulynZ/l6nefQt3TK1T3Bq08cdvHs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyYj8bwoiNmWmGdVJ7O82L82lA0K+7n7RrmiKnb7LRWDXy6fVN/
	SyIi6bD+k9FM7kK0c0EUpuyBam0jAtAOpoubS90aGBMeHCEBsxmYWfDIVWFqPrbYma0l8I2oaxj
	9LsKWN8T8HM1UEs8JlMYa+w==
X-Google-Smtp-Source: AGHT+IG/v34+rc6eLaOGVWlOE43Zx45msmHQv1J2ivFD+GxJdG/Q3VFoefy68ei4cpHyCypXn3PaKYm2Ons1cxS0+w==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:e812:0:b0:e16:51f9:59da with SMTP
 id 3f1490d57ef6-e1d9dc1b42emr3306276.6.1726093515114; Wed, 11 Sep 2024
 15:25:15 -0700 (PDT)
Date: Wed, 11 Sep 2024 22:24:32 +0000
In-Reply-To: <20240911222433.3415301-1-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20240911222433.3415301-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911222433.3415301-6-coltonlewis@google.com>
Subject: [PATCH v2 5/5] perf: Correct perf sampling with guest VMs
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
exclude_guest clear. This way any host-only events with exclude_guest
set will never see unexpected guest samples. The behaviour of events
with exclude_guest clear is unchanged.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/perf_event.h |  4 ----
 arch/arm64/kernel/perf_callchain.c  | 28 ----------------------------
 arch/x86/events/core.c              | 15 ++++-----------
 include/linux/perf_event.h          | 21 +++++++++++++++++++--
 kernel/events/core.c                | 21 +++++++++++++++++----
 5 files changed, 40 insertions(+), 49 deletions(-)

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
index d51e5d24802b..5f119b9516dc 100644
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
 
@@ -2974,14 +2971,10 @@ unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 	unsigned int guest_state = perf_guest_state();
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
2.46.0.598.g6f2099f65c-goog


