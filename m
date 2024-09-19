Return-Path: <linuxppc-dev+bounces-1474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B72197CDFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 21:08:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8lQy67r7z2yPG;
	Fri, 20 Sep 2024 05:08:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726772890;
	cv=none; b=m8gitI+LG3iQugXdIlM6meYmeJ+3syriGbq4jxWl8gJJveY5bFVElMEBIlo49A5rfTT5DfizYBjvZORw0HXBrqCMFmfAWSjx7i4UpmqaEOEIZASOGd1kGManLy+hjBfCPT8KLbzotGuyU6HmYEwWS1G84DPoZeGba4iEtR24aUNV/IufU9ieZ6mVRld5jHNGNJ0LPWtaxKkBi2QbDxIyiA+uqkjZ8KA05OKst/XKhNDvtp++QKUey5q56TOU8yptdc8EAkUac852RxwlGKtQNqN+7cVrCn/ldEv7i+LiFPapornAEd4MAVJrGal5/EjO637M4e5X55opI/nkyu+e3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726772890; c=relaxed/relaxed;
	bh=os3Yqql37R8r3BEesV69Cp0Wu//D+lGOxICBFWLJF5s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MQfIDeCb51r9HafXPB7weBqwZOhxDFqnEG6wVgy58I3H9D4Ml1Mb0rzZ88Tjd3SIDYWBrdAoUd6ln2DGRPWkn2EzB/ydNHQxaZG1TXVDO7fbyO7wMnkFOg5q/qhT2dlnEVt3lmdVjwfA5WxfGwmpuhFN0c9AoDAOyMatsg0F7vxhvjzAHWMU30Fk90XBukG15MPA4rTNWePDBc7fh/9esmFsL966yVm9/nWRr1HJpt45bJcS0dqHMleAMDYjg2MoGlUqJ7v2ZzZQF1YDxgXjKJIVFfFR8eJPHx+A2lz7g5mFDMATi2mEluilJriQ7n0EY0kYW8RiaYZyI95klmuDqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1Pu+4unF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3mhbszgskdhuvhemhgexpblzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1Pu+4unF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3mhbszgskdhuvhemhgexpblzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8lQy2zlFz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 05:08:10 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ddcb412e3bso21723197b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726772888; x=1727377688; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=os3Yqql37R8r3BEesV69Cp0Wu//D+lGOxICBFWLJF5s=;
        b=1Pu+4unFc6jDf0VvZNW9fINTtFEa+9snXVK+Mk6mvw19dsUAM/P1G3yOeR02YT2hdx
         Laa2jqOzG63ROMnv89TfExVfrn3C3AVbbZ5COtIwCItIomCZ8e/RuJSOjXVg/o5KbVNg
         AC21JSzBH3jOXAOxqOBM3cBY9BcVGprDVOQ/T/ygRt1t+aCE8TuvYQ3jTc5CSCD2wDkC
         T77Qp2gS+C5bkgTqk92dSTkKPnCGtaAki99vVmkc4Qr53mu8DRv2MoTXWRuCEBIYVetc
         WCA2iR9BkxNxHjxAGLQeE55fR8x6VbbHIEhZkiIJdPExHwy70il3t4SbH8YzsHsch5KB
         wFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726772888; x=1727377688;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=os3Yqql37R8r3BEesV69Cp0Wu//D+lGOxICBFWLJF5s=;
        b=KPYQ8/NaIrDZoueDrVliFOM8lTBaGF1dwajY9NOKndGOVq0i4DYDb+8+ITQ4vkZFxJ
         DgJvDppA7eJmr3QO8+WsfpQpbgsrpXdgE7Bh3NzeBuHtnCaW8h1tjdlZsEl8F5ygj/cU
         dyGfnVFQiAY8FJ+wxTS3pOMhfQoCRvzpzYmjLDVrDtIz9xtrIqTidxJg2hdXrxAtkDDg
         NXy9OKicyvPUabT/J8OJycBbSU62/YVza/GhRDCJLRqSeT2O88Gk+B41Jcduwj8vU8p/
         HD0t6hdI2Jtz8GmUMkUgSmpN17eqRBK9CKHG+h91aK88gRWOz/aCgnVpwp5iAWsOzbJZ
         8RNw==
X-Forwarded-Encrypted: i=1; AJvYcCW/wcbqn5tqgq4SB2gadr6HOr4Zl+6CzO7R6sHnqD9D60dzVm3dc2+aspmM9dObWO7ffuwwJ2Qw61hC2DU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMulnp06T91iNWKu1O6Mtas80xCLHd0RhkpEnhWnnYwguIhnRH
	Sx/q5/+1svHC9rn6qyoeXe98g/ro/uGPGyF6UC+ERpQDqgaXFAkdLq1eoxn1W89Rdfo71tRIx8D
	58SolRFtBrxfWETOjt5qaow==
X-Google-Smtp-Source: AGHT+IEWKocKtUeJyLcIg/Q0/lFfDEFCwNKFuqL4bh0kqfDWnkDMObP8hKFL4orR1R805yrNr96S1GsShGwKfOHrhQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:b20e:0:b0:e20:298c:541 with SMTP
 id 3f1490d57ef6-e2250cd4633mr337276.9.1726772888086; Thu, 19 Sep 2024
 12:08:08 -0700 (PDT)
Date: Thu, 19 Sep 2024 19:07:49 +0000
In-Reply-To: <20240919190750.4163977-1-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20240919190750.4163977-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240919190750.4163977-5-coltonlewis@google.com>
Subject: [PATCH v4 4/5] x86: perf: Refactor misc flag assignments
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


