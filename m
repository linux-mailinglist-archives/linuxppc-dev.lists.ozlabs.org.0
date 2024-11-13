Return-Path: <linuxppc-dev+bounces-3157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE139C7BD5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 20:02:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpXhb2Zmlz2ymr;
	Thu, 14 Nov 2024 06:02:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731524527;
	cv=none; b=IjSO2gcDbGkD6wZ1HMPsR3e0/b1G63SDvX9NKTh44HFd4UNUfEskjSR/EQ6JJ3DaqYA7MYs0RrbrSvBNPKtgetnAHw733pi1aBzcyQLScOya7oLHysHobvISyMKC/E69ZQ33VQzOZjrx1JHOqsjVk+kFF8Of9TsKnMhhvlDVyhxLePIoMGr/nkGeGkmINhPurbJf4NUns2RFYLsp87MA0pTuqkeF4gqrCpX5WyKAfDBBGZ3L/lrDJNikRY65jCs9eVex1en8rSOjo6AuevG2bQcalzdLAbdKzOqGtaWSEdyVzpY9mPgcFBIbrRwIfufBnLb2q437qUntH36EA9hqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731524527; c=relaxed/relaxed;
	bh=tgqFKvoVHXye/CyIJghap8jc4W684iliK9zLYmCZ1Zc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JDeNyJPLJfNGTOitUB7AUIsdlHm+HICTLe7oYnRWGkaoxCUTPbrz7VWaKQwSco4nBpNYPzlUc2YkMqMR96Z/fSOj0tHU3eI0R2mEoK/dIYuPHqrYO3qPhBAxuZ6JONQwPHDJJXJaEheRtXWb6evYF1W2hwztriGrQesFXEV6jShZUqtFB5phy7A6u3I8EzAXziAQ/oJ951u34HP0AaTZx82ONHl1gL7ZANGBMPHi0pwpP01CCoXbFr4O7W1BAcnbushFbrcwAWIUAFyDlhwpuUHPjigM9IcSMRliAdessDvDm0weeCGGF/M7+rvj3ANUjaBMDjboGwhpzQiY6iQs1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fSH5k/P9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3rpc0zwskdk8rdaidcatlxhvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fSH5k/P9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3rpc0zwskdk8rdaidcatlxhvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpXhZ0WHrz2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:02:06 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e3808d76206so762769276.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 11:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731524524; x=1732129324; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgqFKvoVHXye/CyIJghap8jc4W684iliK9zLYmCZ1Zc=;
        b=fSH5k/P9T0uTBb3DZwo90GcEy1VcnjgWw3NZVV+MAhVswfI197TFPYLop/HVJ/hOgU
         f6rmkCBao33byknZUsgOnVaCSFGw08DLWsEdNGCIjQ6y7ymznXELqOSGWXJFqSrpIT4u
         Ssr9iTBCNIWXUMHTBUoANyzUFlMiJQfOMdg+YN/Ue/RSAO3uhVG8CpekxQcg708vTAwM
         MyqhTkQAQl30bJcmfmUDUieqcS7eiXKyIdHbNoOkF0X1Zrv6DO07+pKDjd6P5yL38Ejx
         LU3BvPWWfISOzqllGRscttdf0TXl3mSwywnCXhb0fd/GjBZxCmJ95XekHo1jCzrhBhfq
         Er5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731524524; x=1732129324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tgqFKvoVHXye/CyIJghap8jc4W684iliK9zLYmCZ1Zc=;
        b=WTo9bCKfA4PbgKQ/LPNBXWMUORyauMsR45kW4FquJPXjF/DX97BGM9SoYrjrp952fG
         iKMJRwxPJUyvilHpKjZn+PJnhCAK8uuh9VEq872AnPk0Wcc2OufVgEh7UJkiIx+XOs1s
         Jr1lucRb4MXYTcFYU+aIADpgGCCF1MrpIOC6VqPOVY9LAKB0F2u00acSylDsvbM9wod5
         5P4xnbZKNlCotGxtyEqyzL8+Kceqz1Qz2foNUF4tlGP3fY416N66Q3/x+Xtmf67HOsFZ
         GV+Yj6OjjqA48R4EcLOwSqWYZbMASwdeglfdftZroN1Fzj+fJkNsoeP2ZhhjJ0bblEuY
         /98w==
X-Forwarded-Encrypted: i=1; AJvYcCWiE/zWvr0uG1JygLkjDWrgtJtlHZwvgdZ++HsqJJDbNBwM9PEG1u6sAtuO/dL7UPsFymdH7VVTOalGrpw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzr2doN3mCIf76R5D6jzaaY2rn3HUArXuvj7+AvRqLj8z27ha0d
	Nj2vUD/jxBzJmxAHLIMBz2frQ7d4+jaKzcWLYddK8UMdUwr1wLPf+TirGdIa43BG+M7/ijfCSwG
	k13hDtUyGhY7QKdFS52FQYg==
X-Google-Smtp-Source: AGHT+IFNr9w/0dGnK6PRtslGYFp20zZooyO9LSsLAArex0mr+uzyM7no72zQ+L4NJiH7IrVQOwJt58oXd0jflNUvgA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6902:2411:b0:e38:c40:380f with
 SMTP id 3f1490d57ef6-e380c4039bfmr33947276.3.1731524524115; Wed, 13 Nov 2024
 11:02:04 -0800 (PST)
Date: Wed, 13 Nov 2024 19:01:53 +0000
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
Message-ID: <20241113190156.2145593-4-coltonlewis@google.com>
Subject: [PATCH v8 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
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
	Colton Lewis <coltonlewis@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Make sure powerpc uses the arch-specific function now that those have
been reorganized.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/powerpc/perf/callchain.c    | 2 +-
 arch/powerpc/perf/callchain_32.c | 2 +-
 arch/powerpc/perf/callchain_64.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 6b4434dd0ff30..26aa26482c9ac 100644
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
index ea8cfe3806dce..ddcc2d8aa64a5 100644
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
index 488e8a21a11ea..115d1c105e8a8 100644
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
2.47.0.338.g60cca15819-goog


