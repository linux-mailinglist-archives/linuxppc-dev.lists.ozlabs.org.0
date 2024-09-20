Return-Path: <linuxppc-dev+bounces-1496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F98C97D959
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 19:47:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9Kbq12bgz2yV3;
	Sat, 21 Sep 2024 03:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726854471;
	cv=none; b=Be7JicVgJGsdOfFXTj4fBFp7oC42BZ3UXGxQ5dncwo8+wdldNnNjKfP1uhMVzd6wyMJ7c4SLlUX0ckV4JynNyzZN1D5K4ZaFwf2OlXvzdi3Cc7eVPpsgaen9jrOLrpIDH8MjjFG5RlBFqHSGDxjsWouOofmkE0CKVZiNp1AilKF2f4/wtuBbN/EKPRSu6yP1x88p3oQBGq17JFj0yqy/aEsyLtYKyJ0JS8DD2hMzVsSUGkoHIAoPDUaYsXhzcQs9I8SleEKfg4IS+U3XS6+pILZpGYEs2AqU42plv160DOspTemtn1YSiA/bSJJo4B7GEjY6nMw4zvSP4M2Y0YEkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726854471; c=relaxed/relaxed;
	bh=1u8+tIRQu1/+Yzznd3YfSwPNzKiT5HV8vjSuz+hJEoI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=di/k5zXq00x0xWgEhh3wxPwEXZuOfBVLRR5qlCECN8Ns4B9Ae2FYaYhnq5NlYiISxTKb9mb1ZuqqEftVERiU8lCz/5oF9bAKjUogj/YHlfpr/rwkq6Pz/2OxYydIDi1jpTkx5EPvcznIVkcuQv1N3lVdhbElwWzIBmSohJdnq5QKTomQPy3alIAFYOKjjjTKmJGV9XYxsAS/jJGDCwlO4h+qNSffEcya2BfFJQxMYTwEu5ixC/8mK38nxQ7xT1Nxw1OZvdXri4Ajydz4RUhF416G8298mtB2mXU9xaQSHY4bNA1Pbq6fnuFfX78IsDsH+R6Pl1yeO3LWsUa9V5+Wkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xmszmW0l; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3qbxtzgskdkacoltonlewisgoogle.comlinuxppc-devlists.ozlabs.org@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xmszmW0l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3qbxtzgskdkacoltonlewisgoogle.comlinuxppc-devlists.ozlabs.org@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9Kbp44hTz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 03:47:48 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e17bb508bb9so3659317276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726854465; x=1727459265; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1u8+tIRQu1/+Yzznd3YfSwPNzKiT5HV8vjSuz+hJEoI=;
        b=xmszmW0lgw1URzuyU9N4mCj3qHzgjvwMQr45gYyI5T40GkRlSxlRKOCEHl4+Wt2rYD
         osP0K9sZiK6qND/3O7zuNNiY2BkVQGQtDsfFJxAxXkzQFHMoqMozoxpXBcrqw0QsDB9V
         zBuSffI8PdO5If+B/g62sOkS9zbs9JXQFwQWPT4YkTJiK5ycy1YztZtkfqpx931OnodT
         lqXZOrCw/JA1PV760q6cv0Cr3st02HDxtoR4/CSbx5jE1S/aX0T+EjSMQhVdc9pKjHE5
         BpVtC81yEAUtuA0CvazHsfgc3J+g4HDpRSzqImFg3Qm8gXogEO4aCr5/jhjsAe/HhHnm
         iRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726854465; x=1727459265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1u8+tIRQu1/+Yzznd3YfSwPNzKiT5HV8vjSuz+hJEoI=;
        b=Mf8DRrtwd+Gd5CXvM7bcGp5QvqOaofsq3QpfNTX4xgcmIMDcXfqNXKxX2E8ikc/qDl
         nqvkLHjQGXFuMziygv4qhfzq8IuRjn+ylFkVcZQFoxG79EpptJ+Gii1/TKUtmVvUgxzv
         eECBfnjTPTJB0Yes6ejdvcDE5ffNMOD2QNZT7onbEVwCGVSm2GbvPVa8enr+DbK80Zeu
         oWKdoO89Onqr5MRzoEDSUHJEe5gUmsuj7X+sTkIgHo9Vvgh4vurC69czHaKkecyAkpGu
         fbwF5fCK7ev2QzZrwr0zoQF8bColCyKYatbQrQM8+MeMWurul+bz6UnV52F15YlFk/Xe
         DMVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwi7wwq/qlT+g61ScE10Yxq/WzuZcJ2neAQVRoCsx39dyxwdJ8nNRfZdCV3lbNS3/69hmpQZo3NaRWs0E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxN7Fkf7fEsdHUfH8E5rf4LSWIozAUSQSKT0xkqpyXhsIxafh/H
	yr771iPka+hmGaWINJLCsKJcgzRKxOL6hIDwzCpr5yzZaZojqbZ5wofUjl4HwPT/0UsNadNG2XG
	LaloGHy3BnO2L8dY05rmPjg==
X-Google-Smtp-Source: AGHT+IEMZpgFL+UVav7e6/78nxxqsZh8RtB34P8KhO4E9lrAtqCCPkLcHN7A2NJ63pZVH3cqvvVs3DKnxU1JZod0ig==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:c503:0:b0:e17:8e4f:981a with SMTP
 id 3f1490d57ef6-e2250cd6079mr6801276.11.1726854465133; Fri, 20 Sep 2024
 10:47:45 -0700 (PDT)
Date: Fri, 20 Sep 2024 17:47:36 +0000
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
Message-ID: <20240920174740.781614-2-coltonlewis@google.com>
Subject: [PATCH v5 1/5] arm: perf: Drop unused functions
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

For arm's implementation, perf_instruction_pointer() and
perf_misc_flags() are equivalent to the generic versions in
include/linux/perf_event.h so arch/arm doesn't need to provide its
own versions. Drop them here.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/perf_event.h |  7 -------
 arch/arm/kernel/perf_callchain.c  | 17 -----------------
 2 files changed, 24 deletions(-)

diff --git a/arch/arm/include/asm/perf_event.h b/arch/arm/include/asm/perf_event.h
index bdbc1e590891..c08f16f2e243 100644
--- a/arch/arm/include/asm/perf_event.h
+++ b/arch/arm/include/asm/perf_event.h
@@ -8,13 +8,6 @@
 #ifndef __ARM_PERF_EVENT_H__
 #define __ARM_PERF_EVENT_H__
 
-#ifdef CONFIG_PERF_EVENTS
-struct pt_regs;
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-#define perf_misc_flags(regs)	perf_misc_flags(regs)
-#endif
-
 #define perf_arch_fetch_caller_regs(regs, __ip) { \
 	(regs)->ARM_pc = (__ip); \
 	frame_pointer((regs)) = (unsigned long) __builtin_frame_address(0); \
diff --git a/arch/arm/kernel/perf_callchain.c b/arch/arm/kernel/perf_callchain.c
index 1d230ac9d0eb..a2601b1ef318 100644
--- a/arch/arm/kernel/perf_callchain.c
+++ b/arch/arm/kernel/perf_callchain.c
@@ -96,20 +96,3 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 	arm_get_current_stackframe(regs, &fr);
 	walk_stackframe(&fr, callchain_trace, entry);
 }
-
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
-{
-	return instruction_pointer(regs);
-}
-
-unsigned long perf_misc_flags(struct pt_regs *regs)
-{
-	int misc = 0;
-
-	if (user_mode(regs))
-		misc |= PERF_RECORD_MISC_USER;
-	else
-		misc |= PERF_RECORD_MISC_KERNEL;
-
-	return misc;
-}
-- 
2.46.0.792.g87dc391469-goog


