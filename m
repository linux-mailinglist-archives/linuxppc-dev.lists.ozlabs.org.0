Return-Path: <linuxppc-dev+bounces-1498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B41B97D95A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 19:47:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9Kbq1cGFz2yVD;
	Sat, 21 Sep 2024 03:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726854471;
	cv=none; b=WKattkBovwWG+MR/i4ehaYWXp+ctW/LkLuIDKZ5T6huEKsyGv1pYS1u/IOavZY9xydYWThLLqg5sJBOcyTC+VOvLecDQVGuVFnLup4RkOpe7nGo9QSw93LLtHodtmmhD+ep0FODTkUw6Cqj9ZjCydNa4ua1k3yMJBxPSFyly3PcYSvfOL2E8XovEMUPy6ZJDw7Yf6gm0Ab0wNG4snE7QwhXcPji2wqn4myZHdoqthJ5Ia1Xj47iXpv5pqOE/OgRNyPSnMVQcsKuMFLCVOOmNIUPr8qfxdVN4Uz0S0UCiOYjjXtDS3VYXNeOboL8daQtysDOhZvwAlEAWJxd0FaJm2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726854471; c=relaxed/relaxed;
	bh=FW4iFP5ZBMbOGiq4tZMyY2DvvdeOYa/h9JUOEaA5qpM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D4xRfvyW0fV+UACBHfEcgkwK9/TuD8sed5F6bXMdceIPxYqToSTQAyk5R65fJYj04DFfMOE5sj61DBqfST7XynLC4O+i2hIE9kO2Vqg2/TYH137G1SRLbih6FXWPy5QmGNf7+65AkJ9x2lxaM+eZgyyWqDlpQjOoZNJd8KgDJ1Q6rQ+glVspBsdnCiiqxjdpOU12QgC/pNlGh/KcmIREGQbiyA0Ki21jSYf0CDziTz6+AMobs2YBbMgqaAoH/nTVlh0jiWqEiwaoKi0gDQqR7h5xocVGi1uHVHTSoliCnI58qWKWWs42fRI0bV8zwS/FQanM/5ufoN38aUpENXWPRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nUIiVTBf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3qrxtzgskdkedpmupomfxjthpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nUIiVTBf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3qrxtzgskdkedpmupomfxjthpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9Kbp4VM3z2yR5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 03:47:49 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6d470831e3aso46011277b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726854466; x=1727459266; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FW4iFP5ZBMbOGiq4tZMyY2DvvdeOYa/h9JUOEaA5qpM=;
        b=nUIiVTBfNV5/AEYSjzbUpRKzHnXFqk7kg7rWydAIKKfgRYJZIiLPKS8JnG1aZXr5It
         +Q/LmmLAxLZpNU9kTFRqkWpYVrR6qHC0cRTz78mxg2bwmt49eQw8UIQCj8bP9Km9RCh7
         KRKftsla4C4SjlBMybWkN2TPjBPZPta6FY38crnkYMLiUsR8H4MBB2h6jDdhmd9AdQGv
         vBbpFNgDIxMzxWkciUN0IfYVJhXvQRcUzPzE+SeBdKMiX7Y9c8xya1rT+sx2GMxhDlnY
         4cicgTr87PklfOarJ/xsvsxylyb1ocyj3AAtWnd7vREMdC+Q40Mc2NK9ykrQ4crrkipk
         LWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726854466; x=1727459266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FW4iFP5ZBMbOGiq4tZMyY2DvvdeOYa/h9JUOEaA5qpM=;
        b=JSz+aHWPLzjQYZihcePCRCMKc+SInL153Jp9bp7cuYmc0SxyPade+ZTWJgENfKn0rP
         XqC4ynhdAR9hzqiid7+W4Axr2XQXJftl7VxpMS5i2qvMfleE9xGuwMZxCi5S7qFTlSBc
         qLcHjJWzNLFrGpZPT5cnNclRc1R4jDabsQsEENCyKIo3mxq9qykua8pFgE9C457h406q
         B6z1044rrWPcLo98gC9sM5DMRTnEYTsmbjYvH1hUUutUsZgGnW6qAcH24GjkqzDfJPgO
         R1M9nzMJUC5tAiiIR58VPMLwqPymNwtYBoU0FJ6g7/mGINxDVbco+5d3ZvFSkHVWQBD5
         H40g==
X-Forwarded-Encrypted: i=1; AJvYcCWYwBy05Hf19fFvs/+gfA1ut/V6gIQUSpal2Y3HwSkdNCjnQV/WrtD5+8+OttBQfoAWIHYDhf2agfvc1MM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhSTBP1eXhjv6xqzgfMf5qZr+i88t77o0RYhKQlcpG65dsRIUH
	L5f/wTBPN6Pm+ldPxfBe6ygdgB0VUuXnWF56+dpZt9QAvz44BTaDfiEHPYsit1LQPx/5iYYyv45
	BYJYDyTvZ+6JtjNy8zkcLAw==
X-Google-Smtp-Source: AGHT+IGHXA6NMK67BIaWbZPQpOPl9zCONw+mz5OtKhk2pVqeKgjT2HmI57oM1LEaLU0LirPJ1OPIODDf5GwBBRVhVA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a81:a88a:0:b0:68d:52a1:bed with SMTP
 id 00721157ae682-6dfeec11e0amr70757b3.1.1726854466429; Fri, 20 Sep 2024
 10:47:46 -0700 (PDT)
Date: Fri, 20 Sep 2024 17:47:37 +0000
In-Reply-To: <20240920174740.781614-1-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20240920174740.781614-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240920174740.781614-3-coltonlewis@google.com>
Subject: [PATCH v5 2/5] perf: Hoist perf_instruction_pointer() and perf_misc_flags()
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

For clarity, rename the arch-specific definitions of these functions
to perf_arch_* to denote they are arch-specifc. Define the
generic-named functions in one place where they can call the
arch-specific ones as needed.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
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
index eb7071c9eb34..31a5584ed423 100644
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
index e8ed5673f481..01a9d08fc009 100644
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
index 5995614e9062..af0f46e2373b 100644
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
index 42867469752d..dc01aa604cc1 100644
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
index 9917e2717b2b..f6c7b611a212 100644
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
index 5fff629b1a89..f9000ab49f4a 100644
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
index be01823b1bb4..760ad067527c 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2940,7 +2940,7 @@ static unsigned long code_segment_base(struct pt_regs *regs)
 	return 0;
 }
 
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
+unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 {
 	if (perf_guest_state())
 		return perf_guest_get_ip();
@@ -2948,7 +2948,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 	return regs->ip + code_segment_base(regs);
 }
 
-unsigned long perf_misc_flags(struct pt_regs *regs)
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	unsigned int guest_state = perf_guest_state();
 	int misc = 0;
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 91b73571412f..feb87bf3d2e9 100644
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
index 1a8942277dda..d061e327ad54 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1633,10 +1633,13 @@ extern void perf_tp_event(u16 event_type, u64 count, void *record,
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
index 8a6c6bbcd658..eeabbf791a8c 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6921,6 +6921,16 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
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
2.46.0.792.g87dc391469-goog


