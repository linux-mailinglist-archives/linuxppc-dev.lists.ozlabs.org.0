Return-Path: <linuxppc-dev+bounces-1297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E3E9772EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 22:51:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4V3f0v8cz2yVd;
	Fri, 13 Sep 2024 06:51:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726174302;
	cv=none; b=FkcxUqhowwDWa2KQ3C1CsXeDkVDO6dgfSnzdk3pc7PyETvCEXxfwPB5wib5vUnDTGsuMBs2mNRoRY38QjeW/yej8S1Pn9w2VRSKuC5QkKQGSyfxwCNqFMy6FzvpcQAtS8AKc5rp8xLeF07b1jOOUlqybLD/TWZaUU2FFeVgRGy6Z7w2AVF0xoON/R51+AhMi6lFOIrtiI+xqcErEoipUy6sXgNzUzHt5ctaRVU67xN11JgO0//BMjN3adHecrtt50Rlucd+mRMUthRqHTeKmT3MXg0Q/WuhBdKafp8WlvD1nWLf0U8VTpIB4kHoGjC1AYy6ztAprq9hHWoEpAqibog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726174302; c=relaxed/relaxed;
	bh=bBuBduG209Jab8XMLtuQHzsmOY9s44tUcmK5TPfdVN4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bDo+o3ro8IgZwiVjIj0KGdyF/pGohyJsDcL0KvaifeFQxEyc+h66EOqqiAsaCjTIHHnn+spknWcwN0WzFl2Am64wPVB2dyh53mqdi/B0YnLTxE/XyobdM3wTacPy7HPQ2A4mmaS4A6XJXfEQFAq2GcNJRWIrlMXdpKMiaN03p8pYs/oUQE+WZP97/vKH4K2qEEWSpyffolRfzwJhPwiZu0db2DOxRZ5p69xGnnlIcncy4lKjmCxeEwrrTp2Y47RCXjniFu1LXM7vWe8qNVFeVkaR4XttV8Zf85XMqPisQ1X16ccTTlaiK+LAcS5IG5fFxIgI/Mrc3P8/NCVVhTUsHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NbnBwwWb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3wltjzgskdm0v74c764xf1bz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NbnBwwWb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3wltjzgskdm0v74c764xf1bz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4V3d34FDz2yGh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 06:51:39 +1000 (AEST)
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-82a32368e13so221937439f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 13:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726174298; x=1726779098; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bBuBduG209Jab8XMLtuQHzsmOY9s44tUcmK5TPfdVN4=;
        b=NbnBwwWbb+3jc9VHXXORcny2ASXVg2gMYXxfVya2pbtxZABKzqPyrSpJegibJ334ct
         Bm4TpBRKsxoKPbxVJ8NvreQb53/zfZjwyvo7qzY7msyYrHCrV1DJRaBjdvrmC83iGtDD
         1XSqk0A9mEBmkDQ3ENZslrtf3W25cNobsaOaOYZ3+jEEFe71d2PnzoJ9E8BxAu2SSq7O
         QEi3d5aYDp7pgDnhlnU6r26Xl4yWwLJJOSLAhWzf0IjMWL4Dq0JwaQ2XjLHUVBnniW3B
         ch8o6jrg942KS2hk7hF29GvACc7xQSj3gVe3fetImFJuuVcKQNmIalUUXFAQp7ArxaT5
         3g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174298; x=1726779098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBuBduG209Jab8XMLtuQHzsmOY9s44tUcmK5TPfdVN4=;
        b=abTI1UeOiBw71vwBBeqdd2NxOrXUfs6EHBB/NZg6xtsBOIoUFPNQO8KBLc/5WSizq6
         +Ha6aeLw5Rc7kjoEDU5V18lpJ3saeZNkSf1zyhd4YjDE9myy+YDjwRz1eV+UL47WnsIk
         ZQ3I3vttqbx38evOHRMR60Q8ZUCM4+0UN9lVWiJ1BRwWR5zglnhP0HOnUZNC2mcGX4ez
         QcPO8JzjzeETGmFvKf/sRLj/L7jnliHF2Jw0Fnn01RFID9JebEfI9GD9vsKU8M2fWH63
         QWCMISSYcOIc9nTiFtMFWLwKFn97u3WIuUmKoRMEffwNuUhBTjDcmaDEr6/jxtUe/Dtb
         mpGA==
X-Forwarded-Encrypted: i=1; AJvYcCWEF3+RVWSiXILv5F6vaurn05A7EtY27ncxoqu/U9roRyo+OrJ/4CfJ2WUeYaArkYVJpAEQ3HHVkvf9g/s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuXn+niUblU2x7uAg6CrO5x0nU1Id6N4mUbQk4dIZfEmZ/VwnA
	hIB4dgLZ+dmpZPYDPHLaKtOYE39zznH4GSDSgcJRvg7FuK12QsSV9WpcqNF8P4POCblUeuI2C1p
	PgL5/pnRrjHxqqznoV+Ya7Q==
X-Google-Smtp-Source: AGHT+IHuyxoF1O+4DvTuzFh/ZZP8349qH8nbD/zqC3/tkxgPNCvBr0r1+e3VqEUG1lpnklg0vGHAk+SStZ+us7ma2A==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6602:60c8:b0:82d:581:8867 with
 SMTP id ca18e2360f4ac-82d1f980157mr5857639f.3.1726174298132; Thu, 12 Sep 2024
 13:51:38 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:51:30 +0000
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
Message-ID: <20240912205133.4171576-3-coltonlewis@google.com>
Subject: [PATCH v3 2/5] perf: Hoist perf_instruction_pointer() and perf_misc_flags()
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
index 5995614e9062..41587d3f8446 100644
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
+#define perf_arch_misc_flags(regs)	perf_misc_flags(regs)
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
index 9917e2717b2b..f2d83289ec7a 100644
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
+#define perf_arch_misc_flags(regs) perf_misc_flags(regs)
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
2.46.0.662.g92d0881bb0-goog


