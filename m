Return-Path: <linuxppc-dev+bounces-1025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30896CA89
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:37:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzcmp5JB9z2yl1;
	Thu,  5 Sep 2024 08:36:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725482554;
	cv=none; b=HS6Hq3zsPyINNNriLxplUCvJPNNcLvyt9gp8zfWedmFS0I+eZZa/bbWQI3cmprBX2MLvamJXQjiBfUqXH48Sy7zEuYFKSsx3S4/rYe1fQARPnVo/hGdr4U2JueAFPAv8COlhUcddfoBTFE7eQYKjyVT3iWvGaNA0kETtSMXmcr389SMayI7TbagHHdu6oWn+mieBAV/vxvbV1vedxScIjTw1561PITTPa+0zV/ONC0Kxyf49mcgq47MbCQ45da+wojxh8HISALaHdqBddRoJubo06XRiHT+5gsKiFWMi0redtC7gRO0TvBO6SCg7+3qEWRKy8Jew1QnxvJg56FG3ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725482554; c=relaxed/relaxed;
	bh=ZQ6pbNS+V/v0w7+0Yvg7TstZGOzD6SJqSq8ykXuoLos=;
	h=DKIM-Signature:Date:In-Reply-To:Mime-Version:References:
	 Message-ID:Subject:From:To:Cc:Content-Type; b=H2iOmLpxycs5SSGyUnSTVxYx3RepCfwr9m4Ofj6CgkTw475dcYni/7mpOcNGqwDj8BcTAoG0Lu4+96f7KylAMjgwF0xMtnBFA6Miay+fa2k7Ii8FiEyR4Cw+ArBlvNrS5FnU8v0rt44Aas+vrwGZxMY08jJXVnA6PWPa9bAOU9DYkHTu5wyIe9rv6BDfWkKFcvXtZviEwaBYshaIu8ZmXRVxpkUvCAEcJiqakBvxsY9RmUfrmQmyb2BtgK11VWu1/tMPpZcEzuWfIum77xO88zrZDDcQsqXtfNZ4fz1HqLMh5K3w3YHQyRSwBbX9jKkeIfI6sMBx4xPO39yryEyK4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NMrxw7eV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3n8byzgskdgqeqnvqpngykuiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NMrxw7eV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3n8byzgskdgqeqnvqpngykuiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzZDp2bvwz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 06:42:34 +1000 (AEST)
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-82a36f1515cso696314439f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 13:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725482551; x=1726087351; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQ6pbNS+V/v0w7+0Yvg7TstZGOzD6SJqSq8ykXuoLos=;
        b=NMrxw7eVkkiaGHUGQS+29l5AmICfmTbkmbxkXaoOpjT8yvkGmf5TULQNDQ8cFL2cyC
         3DbbeN3UooeYHnasNDQMQLMs3rSgkcPQl8Tma/LBJs9Kc+prwSV9v0hotIG1P+MONCqK
         Zg69g38MDmSSnaJX9ZLZfdHlHNdgakJpOBKF9fjzRIJOTAmcOR4P5p0GkBb2sI3O6+Q3
         RdKFwReIT6YHZgkHJ4tiNRFfGV66cOHOqFA9+FutadZKT7eU+5Ry2kk1xj6UgMUdpY6K
         wkPXLiv1ZFdJnq5kYhFGXYdPSsvR/fH8rAze3Eu8maAQ5oHtuQqEPUgIgVFnT1UlCcUi
         tb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725482551; x=1726087351;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQ6pbNS+V/v0w7+0Yvg7TstZGOzD6SJqSq8ykXuoLos=;
        b=q8+wTfzL6EQYv7CAjPRABssiDxkX5sw+a17px5pM4UBxgMKD7bJyHY/mpZwsWv+O4i
         ove72amQJYunCfAKbLetUkTJ3XWBOTSqinKJKPT0tuCmQajui8hc879f0owHjXqQZLQB
         DVBiYCyoIRPKAu1Kh6E8fCuFaHVc926MGuEB6541zlIMu4dszideEZy9/89mUBzEWOvb
         as/q/pvASkUSXfOyvxwU9GFRCcbcUF9IsIv1T8TiX6gT/A15rPWkLiR9lVdX+leXqPPJ
         csk04nGm/pMgOExCtOuVImBaaqUyvVhLzB65LE8BNAlDPK5cEa8+0UMX1kwiBGWKOuhH
         YitQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnfbKL5KXQ9scnd1fIhZwrj4adnxUXFv24DfIP3S0X4IGUX6rpmPrFsCgTzMT/xuNWkRhEYAVCQLRM4RE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxoNK8vTkMdGlvcPKQKSiluFDf6oHilNmGh2kCSQ365g7Fpwgtm
	hAh1GJwTbgHQfGNxqut8qPy/flsqTL0VMC7TpO63Ic+7Xid81s+8EJikuZmoR/js2j7gigV21Hy
	nTbLYdDnQd5hH9efPHg8DQQ==
X-Google-Smtp-Source: AGHT+IH9EBCT8+ykT+OpvYVmgAL1GejG/P9BrG7iuA2P0w+bQDK+bVWQxO99M8Ql2oemuKA/7xEPoMWRBeRAyi1Jng==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:14ce])
 (user=coltonlewis job=sendgmr) by 2002:a05:6638:40a3:b0:4b9:ad96:2adc with
 SMTP id 8926c6da1cb9f-4d017e9afc4mr1111520173.4.1725482551325; Wed, 04 Sep
 2024 13:42:31 -0700 (PDT)
Date: Wed,  4 Sep 2024 20:41:33 +0000
In-Reply-To: <20240904204133.1442132-1-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20240904204133.1442132-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240904204133.1442132-6-coltonlewis@google.com>
Subject: [PATCH 5/5] perf: Correct perf sampling with guest VMs
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

Reorganize that plumbing to record perf events correctly even when
VCPUs are loaded.

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
index 87457e5d7f65..2049b70c5af7 100644
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
 	unsigned long misc = common_misc_flags();
 
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
index 4384f6c49930..e1a66c9c3773 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6915,13 +6915,26 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
 #endif
 
-unsigned long perf_misc_flags(unsigned long pt_regs *regs)
+static bool is_guest_event(struct perf_event *event)
 {
+	return !event->attr.exclude_guest && perf_guest_state();
+}
+
+unsigned long perf_misc_flags(struct perf_event *event,
+			      struct pt_regs *regs)
+{
+	if (is_guest_event(event))
+		return perf_arch_guest_misc_flags(regs);
+
 	return perf_arch_misc_flags(regs);
 }
 
-unsigned long perf_instruction_pointer(unsigned long pt_regs *regs)
+unsigned long perf_instruction_pointer(struct perf_event *event,
+				       struct pt_regs *regs)
 {
+	if (is_guest_event(event))
+		return perf_guest_get_ip();
+
 	return perf_arch_instruction_pointer(regs);
 }
 
@@ -7737,7 +7750,7 @@ void perf_prepare_sample(struct perf_sample_data *data,
 	__perf_event_header__init_id(data, event, filtered_sample_type);
 
 	if (filtered_sample_type & PERF_SAMPLE_IP) {
-		data->ip = perf_instruction_pointer(regs);
+		data->ip = perf_instruction_pointer(event, regs);
 		data->sample_flags |= PERF_SAMPLE_IP;
 	}
 
@@ -7901,7 +7914,7 @@ void perf_prepare_header(struct perf_event_header *header,
 {
 	header->type = PERF_RECORD_SAMPLE;
 	header->size = perf_sample_data_size(data, event);
-	header->misc = perf_misc_flags(regs);
+	header->misc = perf_misc_flags(event, regs);
 
 	/*
 	 * If you're adding more sample types here, you likely need to do
-- 
2.46.0.469.g59c65b2a67-goog


