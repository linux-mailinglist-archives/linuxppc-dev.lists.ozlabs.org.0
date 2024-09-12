Return-Path: <linuxppc-dev+bounces-1300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B55349772F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 22:51:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4V3f5hPJz2yZS;
	Fri, 13 Sep 2024 06:51:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726174302;
	cv=none; b=IHvXebEt2AjrsZy8M3sxHpvq8a/COXYdzNmGPpWgkUc7YMMcxBsSTzvPrSkfiq7ad/LRWEG79daKzyQ1Ak8y+i4HD4NlJPN6PfmWc9k4Gig1j9MMYtODNe+dyLscinVLObZ0viJQDjlD3ZN+R0Jc4/qqNbfmk72dFZyaeSA1dTzUMTwOKlqFIwT5JxXDcK3N5PqzNPAcxITtrCi0+dWREsg8I9LNH+CzuXTEPpXIrwTHOMhJNp50dTQ843J+oWo74MuYdw7sw5XOiRJU51IvYnI7lQ+tv3o+RpH65NqPCHygVvgvKgtGYYJnHL9Zz/mvEeLIRGHNZ5V5udWovKjbAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726174302; c=relaxed/relaxed;
	bh=3HOlQ/b1Vqnby1HRrJAa+4JPh1tcBF4UxpW0vveqy4M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NF075WRT/+QyZKuUiUZZmrPzoV1Qc/OlwfNj1/MDZKZ1XF2WlGqPwhmbEyYS/f2mkkWYl7OKVXuk0F8BGFpyv16haeR65OAuuIshCPWoSITatB9ICyhA4xxPAsQnPYkgUokqor0bzRB8unzYiw/RqHmIMGCJLrUonhLnWYxVQqjoX2R1h8wpfUNw2TCMS9gziVzKg6N4/8GAEzZW22uu7p9B5C3mdBDO3bKyajBAh0t7+H5u4uD9gpL97keuwRYp9ri4LGgn2svbAA6FvxbXOpewYOB3U69EsyWMePJil3nDFrikO5b2mnIAyrG7O5UEQ1PpsU5l/mYO6jj0WErgAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vMloIj7T; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3xftjzgskdm8x96e986zh3d19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vMloIj7T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3xftjzgskdm8x96e986zh3d19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com [IPv6:2607:f8b0:4864:20::d4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4V3f24Xcz2yYK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 06:51:42 +1000 (AEST)
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-82aad3fa5edso170087039f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 13:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726174300; x=1726779100; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HOlQ/b1Vqnby1HRrJAa+4JPh1tcBF4UxpW0vveqy4M=;
        b=vMloIj7TdOq/XX3Xy9ytmnC1H6BOVh9yM1sCaduz8JKBsFeW4pHkVlkQ2Z9g8+tG/S
         ddf5NR328PX5n1SFqogknU3QjrRLM70UDY4FzgyxkkpgtjhRQQS5sON82x4oM09qBtKt
         LLaEup3yqcckS7g6sLsRfNdamwoeZ5dzX1OtdANM7CYl2IERzvSt4Eyu+f8Rf7h8pJ6b
         i0JmxbrvX6hMfzT1CUD0p1sVtPXi72AdcG/5uPMBb47S82VV6Tpe6/SAjm698Amhy0us
         uAUqm2mNkbyD9CDXjXvHW6/jUs/Ec78N+yERWDB0U3G+UMAFWceyAVjc17HvFInTpqdu
         j99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174300; x=1726779100;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3HOlQ/b1Vqnby1HRrJAa+4JPh1tcBF4UxpW0vveqy4M=;
        b=SgCNDtYXleBD1nsl0jMDrqha5e5pR7PEKo1eAO8FpQw5T8CwaJM4WsTQyTv2lqEXIl
         oC8Ifb/c8IdAQ+H4GdBQ6osfA/fHiH8FBqQ4Kc7g/VIWmmVruna1WWMHj0BWNeXhm9rh
         JzfUrtu/B/h4cfeNida91KTq2SCRv2C/FQuTeSFQ8qk1NH0IuMUEJW8mMLnndclFpJlY
         gnClto5Bt2FoVi3bPf5XAy6pnaa+h+NxxwCyueTqbk/MeEXQc3R+Rl0twT+S7PftiJzl
         JNGVut8J0qPTimQjG6ufR2ZC7FdXJ5U+JqiSauqVn9RXtol8PTdgWiWS+lhqpN3jCZwy
         azXg==
X-Forwarded-Encrypted: i=1; AJvYcCWCDsq9zBFCFXFFxEoBWyot2Z+Ts7WFmbLvk4dHY9iNytzX+iGQ6bvPZQTQvPDlW/D01fEghZgxfZQxVE0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YziLxghFdZUO3dP5nZZLJKmKc7/8cpngzwi/eoKcEDFB5zpbNFo
	UOYeEqi64n75vrmG/b6JJAJwgcdzZsIyrkX8+N4npzj/k+SHX+zhK8oH+PBS0kcx1HgNqkeH9Kj
	g9eSRUNWASFmgsXudbLBvcA==
X-Google-Smtp-Source: AGHT+IH+tyLe1qQliN4X6ik9ZMj1aIgWQ7X0DXUSN8bntx8eM08UGo31hDfdaqtl4MXbxod/0+xFT0h7PePUGuXbpA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6602:2d86:b0:82c:eb15:1aae with
 SMTP id ca18e2360f4ac-82d1f8b0c0amr3300039f.1.1726174300197; Thu, 12 Sep 2024
 13:51:40 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:51:32 +0000
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
Message-ID: <20240912205133.4171576-5-coltonlewis@google.com>
Subject: [PATCH v3 4/5] x86: perf: Refactor misc flag assignments
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
2.46.0.662.g92d0881bb0-goog


