Return-Path: <linuxppc-dev+bounces-3156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6F9C7BD4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 20:02:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpXhZ5XLhz2yn4;
	Thu, 14 Nov 2024 06:02:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731524526;
	cv=none; b=cmXHEJCQL2dqlJxLwoQF/qRu2VZJYNA+XuCoieMAzt/Ob6iRaGfd7TSRDCpfyciGaji/ze/tMkVB6/OYzSYMHYs8/qVxrUFqttpeHd4pYZ9vEpJy6wd++6lLdklJz7JhCGsF0s0Jyu+C6OV/Vcami41GyvvJavjcfgrTC9SEBxhqDgylFMJUQuVq+VqbtCTSJzWE2OkgrZWwoEsaFLe75lzq/WqFAvxL+vqfny2PJr00H4GlCiXO7OlQlep5kmrK9+ktTDxd1F0fpmNgcD9tM5KEGBAAJ3FFU1YeyZCTwEdBc8ADWWoQaOMed0ds3SNo63YYf3xfNvDLeBJPHtFAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731524526; c=relaxed/relaxed;
	bh=NyYNjbjk4/qmDmP3x+G8tnYKw5xPTbyL8J59cvk1BGk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QMZL/0Xjyx9Em2V94PtL4uxn0kiswUDYFvni+vYdFlentaPixDlduAli++9lG4SF5LtYjFWBRKZEkLC0KKmy6gg3OcG34SUY7SqUfmC8iIxyPTIeb62DmT+HLUM0LzeLPbXvMepGIl9ndA+qER3eFxCNLCUOrBWiP3SsEV3JanmFgD2LN+av+hTTX8YCFkMvr6k4bHr4nhg68CaNXiZHAmXUl9wY32ClYGaptgBJ8D8Yrz6Db6bcLy/9K/lgOC0aYes2NgpE37O/7XfSLNueI8DTt2KHY0FCtmvmz+nCmzGE5YHDCvMoUt/y7hd3gV8Jx4qI0zAQJP0M9k+pOHBJfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=acvZ+GSy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3qfc0zwskdkwoaxfazxqiuesaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=acvZ+GSy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3qfc0zwskdkwoaxfazxqiuesaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpXhY38CPz2ymr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:02:04 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea258fe4b6so132548897b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 11:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731524522; x=1732129322; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NyYNjbjk4/qmDmP3x+G8tnYKw5xPTbyL8J59cvk1BGk=;
        b=acvZ+GSyVC/lIfDOgvGl3PIM477qHxGzkliEt63DHUIrUHkmc51XWNY04hySG96f2j
         /2WC10LApPkQXGpcGrWbal+EKJ1ks4kkvmuEDcWRI252aBENjQmalG3r7u72eFK1L4E0
         oGQNGqF8L+IMjBE0n95gMEWDrgVOjfUMhVea3m8Kd7RGRDCK7HxOBHo6z2S/XY5ALuAa
         CkQkLnYANZYuW9W2S7r2DtD5WvP9rTcQ/GRJLUIgeZ2vgRJK9rdogzT+yc9zafPtXjp4
         gSPyaEorqGJ/82+I5AnShxfq/PxGGrx3HQaj9Wp2ek958Dn4n1CcmAiZaH5FZMa4qYgB
         2j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731524522; x=1732129322;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyYNjbjk4/qmDmP3x+G8tnYKw5xPTbyL8J59cvk1BGk=;
        b=Pw5JRRMqmaoh7sflCUXc8fYPu2+qp/waagkbFnazju+QCWfH2z8yPBzVII5eh2/KBK
         Qo4zPzZN1Tbqt/bW5nxcr5YZloL5BMEubx4nsgcnDchWSC3ymDxDBiPR1Iagtdl9X5H8
         oNdAbtOABBmzyFzQBCi2PzinhUhc6N3RwK73L8soNBxzaHWIV5yX7TOv2h3RhnxfVH++
         qR8LA376ZcQ/M8OGe4UrkPeVBFzKJIZshBmygJT5RoWzAl24RpVlVl+SoZOzkKNeyPEX
         OSY8484WQ63D0wXmWjGT5LEPttWS43aU8220phjgVEVRB6A+NIul8KZCIiYP+uif2WRB
         FWjw==
X-Forwarded-Encrypted: i=1; AJvYcCXYMqLaeVAcqQFh44y0zlSSVyztWg10HS62LcwO01aR6v2c5Ywm52XuiPi60lSuR4c2/FsaJzA/8LsdQ5g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyazADWKw9qjMpv5fxlwWR935ZOiuG99xS1mQS9ib7HRdiL0ckg
	4yrMOHDhp7rpyXbJ0yWS7+PPkkwj+9oQbaNQWDYir0Vm78ZF5dAZXXwLphednblxGMSlwasj/D8
	tZrNwX+JOmv2eBq8lvvCZXQ==
X-Google-Smtp-Source: AGHT+IExTyQGT4C3MPyRboq/16qqGXa8dkz1c00ponu+1+51Vjwoch0YQlT9YqzaiyonVF1EDUg5DExNp4MKKVOOnA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:3505:b0:69b:c01:82a5 with
 SMTP id 00721157ae682-6eaddff0e00mr3606317b3.7.1731524521813; Wed, 13 Nov
 2024 11:02:01 -0800 (PST)
Date: Wed, 13 Nov 2024 19:01:52 +0000
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
Message-ID: <20241113190156.2145593-3-coltonlewis@google.com>
Subject: [PATCH v8 2/5] perf: Hoist perf_instruction_pointer() and perf_misc_flags()
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
	Colton Lewis <coltonlewis@google.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

For clarity, rename the arch-specific definitions of these functions
to perf_arch_* to denote they are arch-specifc. Define the
generic-named functions in one place where they can call the
arch-specific ones as needed.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Acked-by: Thomas Richter <tmricht@linux.ibm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Acked-by: Kan Liang <kan.liang@linux.intel.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/perf_event.h          |  6 +++---
 arch/arm64/kernel/perf_callchain.c           |  4 ++--
 arch/powerpc/include/asm/perf_event_server.h |  6 +++---
 arch/powerpc/perf/core-book3s.c              |  4 ++--
 arch/s390/include/asm/perf_event.h           |  6 +++---
 arch/s390/kernel/perf_event.c                |  4 ++--
 arch/x86/events/core.c                       |  4 ++--
 arch/x86/include/asm/perf_event.h            | 10 +++++-----
 include/linux/perf_event.h                   |  9 ++++++---
 kernel/events/core.c                         | 10 ++++++++++
 10 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
index eb7071c9eb343..31a5584ed4232 100644
--- a/arch/arm64/include/asm/perf_event.h
+++ b/arch/arm64/include/asm/perf_event.h
@@ -11,9 +11,9 @@
 
 #ifdef CONFIG_PERF_EVENTS
 struct pt_regs;
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-#define perf_misc_flags(regs)	perf_misc_flags(regs)
+extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+#define perf_arch_misc_flags(regs)	perf_misc_flags(regs)
 #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
 #endif
 
diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
index e8ed5673f4817..01a9d08fc0090 100644
--- a/arch/arm64/kernel/perf_callchain.c
+++ b/arch/arm64/kernel/perf_callchain.c
@@ -39,7 +39,7 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 	arch_stack_walk(callchain_trace, entry, current, regs);
 }
 
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
+unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 {
 	if (perf_guest_state())
 		return perf_guest_get_ip();
@@ -47,7 +47,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 	return instruction_pointer(regs);
 }
 
-unsigned long perf_misc_flags(struct pt_regs *regs)
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	unsigned int guest_state = perf_guest_state();
 	int misc = 0;
diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index 5995614e90629..af0f46e2373bd 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -102,8 +102,8 @@ struct power_pmu {
 int __init register_power_pmu(struct power_pmu *pmu);
 
 struct pt_regs;
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
 extern unsigned long int read_bhrb(int n);
 
 /*
@@ -111,7 +111,7 @@ extern unsigned long int read_bhrb(int n);
  * if we have hardware PMU support.
  */
 #ifdef CONFIG_PPC_PERF_CTRS
-#define perf_misc_flags(regs)	perf_misc_flags(regs)
+#define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
 #endif
 
 /*
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 42867469752d7..dc01aa604cc1e 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2332,7 +2332,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
  * Called from generic code to get the misc flags (i.e. processor mode)
  * for an event_id.
  */
-unsigned long perf_misc_flags(struct pt_regs *regs)
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	u32 flags = perf_get_misc_flags(regs);
 
@@ -2346,7 +2346,7 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
  * Called from generic code to get the instruction pointer
  * for an event_id.
  */
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
+unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 {
 	unsigned long siar = mfspr(SPRN_SIAR);
 
diff --git a/arch/s390/include/asm/perf_event.h b/arch/s390/include/asm/perf_event.h
index 29ee289108c56..e53894cedf088 100644
--- a/arch/s390/include/asm/perf_event.h
+++ b/arch/s390/include/asm/perf_event.h
@@ -37,9 +37,9 @@ extern ssize_t cpumf_events_sysfs_show(struct device *dev,
 
 /* Perf callbacks */
 struct pt_regs;
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-#define perf_misc_flags(regs) perf_misc_flags(regs)
+extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+#define perf_arch_misc_flags(regs) perf_arch_misc_flags(regs)
 #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
 
 /* Perf pt_regs extension for sample-data-entry indicators */
diff --git a/arch/s390/kernel/perf_event.c b/arch/s390/kernel/perf_event.c
index 5fff629b1a898..f9000ab49f4ad 100644
--- a/arch/s390/kernel/perf_event.c
+++ b/arch/s390/kernel/perf_event.c
@@ -57,7 +57,7 @@ static unsigned long instruction_pointer_guest(struct pt_regs *regs)
 	return sie_block(regs)->gpsw.addr;
 }
 
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
+unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 {
 	return is_in_guest(regs) ? instruction_pointer_guest(regs)
 				 : instruction_pointer(regs);
@@ -84,7 +84,7 @@ static unsigned long perf_misc_flags_sf(struct pt_regs *regs)
 	return flags;
 }
 
-unsigned long perf_misc_flags(struct pt_regs *regs)
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	/* Check if the cpum_sf PMU has created the pt_regs structure.
 	 * In this case, perf misc flags can be easily extracted.  Otherwise,
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 65ab6460aed4d..d19e939f39983 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3003,7 +3003,7 @@ static unsigned long code_segment_base(struct pt_regs *regs)
 	return 0;
 }
 
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
+unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 {
 	if (perf_guest_state())
 		return perf_guest_get_ip();
@@ -3011,7 +3011,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 	return regs->ip + code_segment_base(regs);
 }
 
-unsigned long perf_misc_flags(struct pt_regs *regs)
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	unsigned int guest_state = perf_guest_state();
 	int misc = 0;
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 91b73571412f1..feb87bf3d2e9c 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -536,15 +536,15 @@ struct x86_perf_regs {
 	u64		*xmm_regs;
 };
 
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-#define perf_misc_flags(regs)	perf_misc_flags(regs)
+extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+#define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
 
 #include <asm/stacktrace.h>
 
 /*
- * We abuse bit 3 from flags to pass exact information, see perf_misc_flags
- * and the comment with PERF_EFLAGS_EXACT.
+ * We abuse bit 3 from flags to pass exact information, see
+ * perf_arch_misc_flags() and the comment with PERF_EFLAGS_EXACT.
  */
 #define perf_arch_fetch_caller_regs(regs, __ip)		{	\
 	(regs)->ip = (__ip);					\
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index fb908843f2092..772ad352856b6 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1655,10 +1655,13 @@ extern void perf_tp_event(u16 event_type, u64 count, void *record,
 			  struct task_struct *task);
 extern void perf_bp_event(struct perf_event *event, void *data);
 
-#ifndef perf_misc_flags
-# define perf_misc_flags(regs) \
+extern unsigned long perf_misc_flags(struct pt_regs *regs);
+extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
+
+#ifndef perf_arch_misc_flags
+# define perf_arch_misc_flags(regs) \
 		(user_mode(regs) ? PERF_RECORD_MISC_USER : PERF_RECORD_MISC_KERNEL)
-# define perf_instruction_pointer(regs)	instruction_pointer(regs)
+# define perf_arch_instruction_pointer(regs)	instruction_pointer(regs)
 #endif
 #ifndef perf_arch_bpf_user_pt_regs
 # define perf_arch_bpf_user_pt_regs(regs) regs
diff --git a/kernel/events/core.c b/kernel/events/core.c
index df27d08a72326..2c44ffd6f4d80 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7022,6 +7022,16 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
 #endif
 
+unsigned long perf_misc_flags(struct pt_regs *regs)
+{
+	return perf_arch_misc_flags(regs);
+}
+
+unsigned long perf_instruction_pointer(struct pt_regs *regs)
+{
+	return perf_arch_instruction_pointer(regs);
+}
+
 static void
 perf_output_sample_regs(struct perf_output_handle *handle,
 			struct pt_regs *regs, u64 mask)
-- 
2.47.0.338.g60cca15819-goog


