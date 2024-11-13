Return-Path: <linuxppc-dev+bounces-3159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6A89C7BD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 20:02:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpXhf5XTwz2yk7;
	Thu, 14 Nov 2024 06:02:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731524530;
	cv=none; b=bIo2kkeQ/ZBQdwQGUdwaFdWwrCQh7ZqoMCWgB1f1syv+bl6jO2PjJLJ+no9Pqw88ppEK/j2t6iF+WKJr8L/ptBLLMKqbfEi5S++Lu+7bt7clSzTS0X6KD2AJA0TZxByQMayugs8kLRjMz9Q2KYDcLgLc5FkaUrshrkDZL7lMkP3RqZFT+dACwdgNvN/KHfq/kPCQB8BgFRM7Rcg36wTVCbIJD8VPnBbPYTYom89Dp2rXz3/ABZ2wbMd5ilI59YoZUIYiOI4ewh7kKycGbZ9+YzdJIIx49xff1DSd937XAUyLZWMzmrI8mbHj2znQi27YbYfdJZBVK7Yg9bah4zZp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731524530; c=relaxed/relaxed;
	bh=W3z9O4Nh1QIYeHjkTYeY8Uz2tjDm/EBln1nfLrKHjVI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TDqaQ/CjzBohxBo/7TgNsAi5E25N34mQxPDhlOFPi/ycK5g9slr1MnoGWFzfOxtarFPfpbErWdniS3bHZdSdUmFB4oVe0gJ9rVaB1lZRwBYP/FD5TdvvG1pio3ltz0U3dqtNVAShXdRbbNseGNJDwADsbTfgL6wloC5Ru6drojC9+lFeKaFMD9QGq8+TyQIgUx32zOW8tyLtYahYfU+mqQny5qa5kq9nxz2UQSO0IpcShjvLtfOBi572cJ1EnM9ev/UBDUvOBQUbuRDuEPbW8cQIVFjPXRsMy8LQaynS6w3nhuATtEj/aiOdGTo4Y1KOZdlXlrNnYylK8qUeQGRXXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4NiK4cqw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3r_c0zwskdliugdlgfdwoakyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4NiK4cqw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3r_c0zwskdliugdlgfdwoakyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpXhd5xVpz2ysf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:02:09 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e32ff6f578eso1365996276.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 11:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731524528; x=1732129328; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3z9O4Nh1QIYeHjkTYeY8Uz2tjDm/EBln1nfLrKHjVI=;
        b=4NiK4cqwD1H0NBqcpUa7oTJ9Bphfo6v51xJ1jzoWjJ4S5UF0V5RvUGRt09lzjVA8Br
         mnSIaMR7EcIyvzRC4jMORZpsoDiree6kwm5qdFTcZt4Mzptmzc4MqnBhTnDmh9K9TZ69
         az6OXbV2AF1bZlJzrSHmx19XakZczpSFk53MAEmTir20EIRhwbXct2z+iNLsSC4srzir
         8RbKKu+Ejnv6zkgBfGcXgNI381mIl5mwsSZEYrEZKPh2R0hHQlKZ7TvGzJiMSI7oT5OX
         GJw0TrXaCgfWSsKVfg+hUoqbBLulJfjOWIzPWhX83xvZwY/HKUGiMXkVre8AC/h6F+iI
         WT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731524528; x=1732129328;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3z9O4Nh1QIYeHjkTYeY8Uz2tjDm/EBln1nfLrKHjVI=;
        b=oIs4vIkVus2FlZFKDRTUC3ZNh2rCzHcPqXkyE2ojKivasgGeaiTAH/nJp3aFfL1fPt
         5/vUKJ6EPgwFH8b2VY01PTQ383FtyKaIGogUa6qtc+T9BKsqoq54NpV3WaIXoYijygwH
         yfg/YpNXejHB9XMed+qzCgsvtkMwqNgNMM173UA8ZI9HVnZviadnsX81E+8R6l7TxBP3
         SykGrz88+ZxsaCZfSs/sSaSStkxBEPcXqptTrcul/stdGZKgeSWoJSBTwTIcbCkTSRiW
         cfouhhmbpmXfyWM6sZKQX79mRvbWRJCIVlYuQXyBQI/HxvcXcqhc4/xW2NbIv8uMFDaL
         UWhg==
X-Forwarded-Encrypted: i=1; AJvYcCVewUsq0rEKD0F3als1C7MdfNwG2u9qPhWDfPX3xRCof65ea6b9G8o/IoYNO1OhqgpZV2HwoWQTOkG+Erk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1n1OgRx06t7suGdkhYlMKIe1uSTbKghe4UNm/tMrNwDpAUIqx
	7TNn348Ku4fYyKR2qk9yNzylLcSfgmZoIzz8Ryayg0unEq5emIYJ3I8Tfk01Qz559MDQ7ryY1io
	Nnn/V7rAveYr+KgNd3iVrkA==
X-Google-Smtp-Source: AGHT+IH+p6Jkhv80JbftlyPSva2V+XD4uDlfcpENEqpQ5lUMycdgk8CZBg1V5KJjBNXlSVJn+OptimsRTZOrtvSBNQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:ab07:0:b0:e26:3788:9ea2 with SMTP
 id 3f1490d57ef6-e380df137cemr10752276.0.1731524527798; Wed, 13 Nov 2024
 11:02:07 -0800 (PST)
Date: Wed, 13 Nov 2024 19:01:55 +0000
In-Reply-To: <20241113190156.2145593-1-coltonlewis@google.com>
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
References: <20241113190156.2145593-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241113190156.2145593-6-coltonlewis@google.com>
Subject: [PATCH v8 5/5] perf: Correct perf sampling with guest VMs
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
Acked-by: Kan Liang <kan.liang@linux.intel.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/perf_event.h |  4 ----
 arch/arm64/kernel/perf_callchain.c  | 28 ----------------------------
 arch/x86/events/core.c              |  3 ---
 include/linux/perf_event.h          | 21 +++++++++++++++++++--
 kernel/events/core.c                | 21 +++++++++++++++++----
 5 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
index 31a5584ed4232..ee45b4e773470 100644
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
index 01a9d08fc0090..9b7f26b128b51 100644
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
index bfc0a35fe3993..c75c482d4c52f 100644
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
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 772ad352856b6..368ea0e9577c7 100644
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
index 2c44ffd6f4d80..c62164a2ff23a 100644
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
2.47.0.338.g60cca15819-goog


