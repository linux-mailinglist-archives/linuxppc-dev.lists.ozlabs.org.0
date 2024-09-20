Return-Path: <linuxppc-dev+bounces-1500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2233E97D960
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 19:48:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9Kbr4VC8z2yYy;
	Sat, 21 Sep 2024 03:47:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726854472;
	cv=none; b=H+xOGij/3nvJURdbmqmbnNa+f1TfUa0s8YpSMHGIDZqEQTbbTwkd1LjdFc1WkUbeyKFsJeNQYCHkhQ+3uKWsqkwwdz7V/am9OjE4ykZLJoH9BChZqLKp2m3GdhuiVn+DE7daLR/9J4Rmf3mGpNbjYjTChpxzPU+mqzeKjawJ5XLcREiVLZUganDpcgA2FG2xV1d/18GMByHHHzGVyhCmiKSZx66CYpM16DIvcwCzvUA2u3nPeo2w0EIDa6FxiaHzRtnuNT+aNHFm1ZWiZ3qanXkfV3mwZQk9QcD+LVzk2HCHXXf9wcxR/75ebmQF+69FqGjQ76IFL7F3OV/mNGbPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726854472; c=relaxed/relaxed;
	bh=os3Yqql37R8r3BEesV69Cp0Wu//D+lGOxICBFWLJF5s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i1gkHk7LBhhDPZozZ6QrgIOrfkxzqTRNSY6zmNGywjbGF5ZbVPA2U9e2UF2cxSJfngwdtb6GjEnFVJ+4s8S0ViFP7m+ioarwpHbbgCJMcoJBXikK98BxJrFvoH/vGtHjCXt7Fq4ZYwImZoAnbRb1wyZSbvatxPVPBG/uWf5mhGr4xcVFl7Hg+4wT1QmVGNWtus+98kNvFBxPNQdMYKoepWM7/hQQ5HNa+fCVyZ6gcXl+YOWg7ci4ANrRrkvjZ3gtEJ//5eL1shsS38FSi74L+Y/O6xEcIWq+PLAnXbzgqNHk/AMk3Kxu/9eGhGO1/ePg2nnhBV8zFgFmgZnSQMQLVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fuDfIHQk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::149; helo=mail-il1-x149.google.com; envelope-from=3rlxtzgskdkmfrowrqohzlvjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fuDfIHQk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::149; helo=mail-il1-x149.google.com; envelope-from=3rlxtzgskdkmfrowrqohzlvjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com [IPv6:2607:f8b0:4864:20::149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9Kbq4XKkz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 03:47:51 +1000 (AEST)
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-39f53b1932aso29632045ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 10:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726854468; x=1727459268; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=os3Yqql37R8r3BEesV69Cp0Wu//D+lGOxICBFWLJF5s=;
        b=fuDfIHQktCAXSm1vB+dXLxnY/ftkISP0LUHr+m4k4uc0C2sFedwhwzY6rhOZ3XJdVz
         oL15Lsc4Npgl7Lf+/Pf/SczsqsYiOD+rio4yJ1ZQGdi2hVrYQtrRlNs7Dvd5UVAKKPy9
         cZS2v8HaeJZiqWpkoHHvn/PfujI38+AG7oJHPVUB+UIKeuK5JVKx8JGDsW/wQLjTq13c
         WmLFU+5AT6QVZcyXa2kV14uRGiNGeISftZaHrqLKeLifRDppOc+lrPyorPAXOtzenZUs
         CRr+Yh3nXJl+CT2SM1rVx+kozR/dGt30LqTMJ8We5X8byQzS0eueHJEbuvi4Oe9/M0WP
         xtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726854468; x=1727459268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=os3Yqql37R8r3BEesV69Cp0Wu//D+lGOxICBFWLJF5s=;
        b=PkMGD2kv43qfBxS3umUhrf4kBV11DQogggOrtsyKcfsH/m1atgdmINyQkgJPlaZJRP
         Fpqd3rYFv8Ra4bwI9wn+pALD/IbqsmnGahGGW157ghkvB8l0HuWuf42tl3Ja+ZlfgrMJ
         GkKLupOQ23SyjTue831vslanQDM8WCnSFYeJY9fk12+w7oLghV3ESoknJWI6+Ze0k8N7
         dyyPXUxpjoRBjmOrgCQpg0Jy2AiCCCuPQL6IGwNEDEcH6mY6XarTaYOfFwJnWiwmAbB/
         FvKbdBdA2VK9znB1VXV3LbpVIixnDV8PGaKrblOSSeNkKkIg0512gxoXam8So+Fc4P56
         t+jg==
X-Forwarded-Encrypted: i=1; AJvYcCXWBl/9FOr7ye9Tc36csPogFUhUVi9hWredq5ZGp9prqSaJhzpMqmlMErKNykcoRT609OxchDxg9tpvTKc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwfoT5ITvF+iqUdRREsyQdujEMh1aV2yEY6NMyyzv9cdzMI/Gw1
	CntRRLmTUHXLOJwkwfXkM55kmzvXQzBingYrSXzleYkECnYCV+ggO2z8c8eyV/kkPPogYV1NJHJ
	1Bz2aDFHiZf5lKdsI6S/1jQ==
X-Google-Smtp-Source: AGHT+IFnhhl9BCVqz7UHoFG7yjq72HDbwzVFbb4MeEheIBAhExRul8dePWOtmi+TJc2JiJ2AJgNwLAkuPyQFmMIgfQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a92:c268:0:b0:3a0:9cbe:d246 with SMTP
 id e9e14a558f8ab-3a0c8c9d4cfmr286865ab.2.1726854468526; Fri, 20 Sep 2024
 10:47:48 -0700 (PDT)
Date: Fri, 20 Sep 2024 17:47:39 +0000
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
Message-ID: <20240920174740.781614-5-coltonlewis@google.com>
Subject: [PATCH v5 4/5] x86: perf: Refactor misc flag assignments
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

Break the assignment logic for misc flags into their own respective
functions to reduce the complexity of the nested logic.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/x86/events/core.c            | 31 +++++++++++++++++++++++--------
 arch/x86/include/asm/perf_event.h |  2 ++
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 760ad067527c..d51e5d24802b 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2948,16 +2948,34 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 	return regs->ip + code_segment_base(regs);
 }
 
+static unsigned long common_misc_flags(struct pt_regs *regs)
+{
+	if (regs->flags & PERF_EFLAGS_EXACT)
+		return PERF_RECORD_MISC_EXACT_IP;
+
+	return 0;
+}
+
+unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
+{
+	unsigned long guest_state = perf_guest_state();
+	unsigned long flags = common_misc_flags(regs);
+
+	if (guest_state & PERF_GUEST_USER)
+		flags |= PERF_RECORD_MISC_GUEST_USER;
+	else if (guest_state & PERF_GUEST_ACTIVE)
+		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
+
+	return flags;
+}
+
 unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	unsigned int guest_state = perf_guest_state();
-	int misc = 0;
+	unsigned long misc = common_misc_flags(regs);
 
 	if (guest_state) {
-		if (guest_state & PERF_GUEST_USER)
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
+		misc |= perf_arch_guest_misc_flags(regs);
 	} else {
 		if (user_mode(regs))
 			misc |= PERF_RECORD_MISC_USER;
@@ -2965,9 +2983,6 @@ unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 			misc |= PERF_RECORD_MISC_KERNEL;
 	}
 
-	if (regs->flags & PERF_EFLAGS_EXACT)
-		misc |= PERF_RECORD_MISC_EXACT_IP;
-
 	return misc;
 }
 
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index feb87bf3d2e9..d95f902acc52 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -538,7 +538,9 @@ struct x86_perf_regs {
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
 extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+extern unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs);
 #define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
+#define perf_arch_guest_misc_flags(regs)	perf_arch_guest_misc_flags(regs)
 
 #include <asm/stacktrace.h>
 
-- 
2.46.0.792.g87dc391469-goog


