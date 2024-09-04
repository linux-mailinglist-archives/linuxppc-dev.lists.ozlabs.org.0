Return-Path: <linuxppc-dev+bounces-1024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA5A96CA87
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzcmW4fRwz2xCj;
	Thu,  5 Sep 2024 08:36:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725482553;
	cv=none; b=HoA0plkifxO0GOW4ZR3r0pHwq0JfbEt817SZkTUVm8vktCRvYwl+KkjeYGJAcb01ReIDUZQNcypIHsDz7qorkb1fyIxCT7gQ54tQd/pyeOdFIOP7e0MxTxHE3RR/LgZYaAGBPJlcr8F8FS6wSIGS824EH+RIB+k8nLk+O48HibX8z7B3k2QWjVX79+QEoSHfVH3jkh49u1MXgqqo1X9v2rNzPxbpscC+/xUTZoJfvEA/yXjMtbq2FuWxCP+m6oPmAr/Vcb7mTpgrbxim5iHK2mmh5aGkVlhTkwFZdxZzwIaeRpVX8NZnWB5gcoRkBL2sRCkOBBgYScV0WY0+xAhctg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725482553; c=relaxed/relaxed;
	bh=yF63B/qB2C2mWkkN7Sev/IpM9OI4DaouC6axCITdljM=;
	h=DKIM-Signature:Date:In-Reply-To:Mime-Version:References:
	 Message-ID:Subject:From:To:Cc:Content-Type; b=LDhpauJdxsHt6S5tQvDmpW8c5nJU26lUq/54evp6GMIvkEyLJx7rmlt7knVRymob2WxjmHJQQ3WEcro5OAYozIQh1sZDW2zxsvPLCNBmZmrjwPRFU48sRvHxk9d0GNW9qKeZ++Bpo8UzKxoRyX8CM0VFRBHycIhTqLP7745bDX6kEDjVk8B+HLItCtwQh3uI3gAAu6FPyWdkXig1p4qpYaT8I1LRFDH7GCUn8SnCGyveVYVSu7Jto8pi6QZWuvt8glfXMvs7Rsg7N7qILZ4IEriblneR5vjKBiOViImhE4WoNBlJUdqhULKZG0DH+RcFveGAOlHamgXS9oeZUyEYOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bK3AwCgS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3ncbyzgskdgicoltonlewisgoogle.comlinuxppc-devlists.ozlabs.org@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bK3AwCgS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3ncbyzgskdgicoltonlewisgoogle.comlinuxppc-devlists.ozlabs.org@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzZDm5YFKz2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 06:42:32 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e1a74f824f9so163915276.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725482549; x=1726087349; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yF63B/qB2C2mWkkN7Sev/IpM9OI4DaouC6axCITdljM=;
        b=bK3AwCgSVd0unqz6bnppuhSzs9ir7EUwELyIEknhq1aUvzjzeWbbuEKGwsel/Nj41k
         vpjXF8+rSgfW36wVyGZPokjhlAxvjWqfp/78BMRu9ASjOdLzJckEg1KYXnPLkserJk4c
         vtmup7VrENchc/LmlMEqjqIZ7hHbALdmjuL5SM2cqahCNG0kuTlXJzrcKgLzsRtMEDsV
         y+YYAB8QC5rZsqLCBsOPevG1xVT46uhacRxhpbHSSGSdlt/t0XhfV+k++j+3mE4X/ueA
         aN+seJwyUisyDUUW3AnAMeb/fnHVE5kU9oKpU7XL+qaG1uUkxID3C+rOH8SoDCUgdbnt
         bHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725482549; x=1726087349;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yF63B/qB2C2mWkkN7Sev/IpM9OI4DaouC6axCITdljM=;
        b=tXSjfHA1pjQyZTLYr5D+LRivfevYbbULPP+1kUX+SQsUx6F3zF36KOPD8XowKPB8Sw
         M9u5ltpmzwOsaxAiAsI811F7kPljMzBqH01O5bV5KFXxue1SuXLU+KyjXoR65xGvvjLR
         388mdAF5RQ8otRu8DHcgBxbdgA9+8fVqhel7MfwjVj577alIVxN1kTDu8VF8v3lcsI20
         TXx4ukKIwhWXC0Wd7dFDSzUCEZjpq4wmy+3wWjF/nW36ts7ZkrUO5D0kQeUaTg3gwkxb
         mCxlEOfZAEcnsK0h5J5T4eWXd8TfK58oRGdHvQSFWj+M5/uhYctQcDDwFRNI2oCxiPKd
         oC0g==
X-Forwarded-Encrypted: i=1; AJvYcCXw5revb4kuCuDrhYIAKn+GeGahriuqelox6gHcFxBbseL7lh+utTzudMoKK1PMDDoSqp09SjRBu3lqPg4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVvYbYeaLt80xmhxI9z/dhPUbHL3+AZpQleYtl3S4ukgRK6xsR
	AW2CKYwyQbUxRyz0CfvHrWXKjW2OmsqsBtx0B8fBhDsOfcWZ/OL0Gxgg6MOHg/m9qVZ/p8kFqnr
	lUsCkWvNhWu4v51odYXcugw==
X-Google-Smtp-Source: AGHT+IHnCAVHhUCP2jsg9QIrX/diUprCN0SQ2aen+GiK4qTsvqjsoiEZxfc39AEm13a4QPmtILTk2j9/pAbTWP98xg==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:14ce])
 (user=coltonlewis job=sendgmr) by 2002:a25:b612:0:b0:e0e:499f:3d9b with SMTP
 id 3f1490d57ef6-e1a79fb4d7bmr28585276.1.1725482549203; Wed, 04 Sep 2024
 13:42:29 -0700 (PDT)
Date: Wed,  4 Sep 2024 20:41:31 +0000
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
Message-ID: <20240904204133.1442132-4-coltonlewis@google.com>
Subject: [PATCH 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
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

Make sure powerpc uses the arch-specific function now that those have
been reorganized.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/powerpc/perf/callchain.c    | 2 +-
 arch/powerpc/perf/callchain_32.c | 2 +-
 arch/powerpc/perf/callchain_64.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 6b4434dd0ff3..26aa26482c9a 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -51,7 +51,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 
 	lr = regs->link;
 	sp = regs->gpr[1];
-	perf_callchain_store(entry, perf_instruction_pointer(regs));
+	perf_callchain_store(entry, perf_arch_instruction_pointer(regs));
 
 	if (!validate_sp(sp, current))
 		return;
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index ea8cfe3806dc..ddcc2d8aa64a 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -139,7 +139,7 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
 	long level = 0;
 	unsigned int __user *fp, *uregs;
 
-	next_ip = perf_instruction_pointer(regs);
+	next_ip = perf_arch_instruction_pointer(regs);
 	lr = regs->link;
 	sp = regs->gpr[1];
 	perf_callchain_store(entry, next_ip);
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index 488e8a21a11e..115d1c105e8a 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -74,7 +74,7 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
 	struct signal_frame_64 __user *sigframe;
 	unsigned long __user *fp, *uregs;
 
-	next_ip = perf_instruction_pointer(regs);
+	next_ip = perf_arch_instruction_pointer(regs);
 	lr = regs->link;
 	sp = regs->gpr[1];
 	perf_callchain_store(entry, next_ip);
-- 
2.46.0.469.g59c65b2a67-goog


