Return-Path: <linuxppc-dev+bounces-1267-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0692975D17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 00:25:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3wB35wJ5z2xYl;
	Thu, 12 Sep 2024 08:25:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726093515;
	cv=none; b=oXswJ3qZ4WJfkydCNU1ZmqMhQjV8gXYhu22eRzBqZoMowcSHi224F8qfdMQLxJSvXk+AKXhi71OWUlPKTtEm5c46WLcN+aGgvXQzZwFObAr/ZY8GIHEIDvkq/hf26xq5f+OoPbq5zQPuASRrp5NhvBzwsdl0sm1f5Al6qidKsysQ/Y2k4nlIQuyAH8KVaHLpwjJ4t5RHw4NRI6Ohe19WpWiB6x7ckZx1gmwUDGrapQpxV7HNdpqwy8m+1l+prmxezTM7q/+dGiiF3uW7ekNJq8bgvJ0VOkF7dAlzxUhm98o1nvoUeJgxKlfNB5/GvW8/myCW6gjqpgXkDeN5Y1nDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726093515; c=relaxed/relaxed;
	bh=l4XmBjdboaUqTeMgRqbSdf4DSeJIVFEq/lNcpwN1ftE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WOhMc38yJpAOCfEx8/M0sGvEdFUGLmTD+KbLi6jp+Pdt8dayv9MXTDCNlCYiPSMaI/JF0wFoo3blOq/oyFt5jAF+vrOhnNR7tEnigmPWzMYJAoCUC9CIOXSsFb7jKRfU26eqI/K7wv8lrh6AlbPtjv5eJB+g3acs8FgXEfiMgP+nAitvpTjG2uVnWe4Z4bwg/qjCMQsOV9Uj8CANXBaCHY6PwaThL9MwlhDnQiErjNb1VOeEkuWDJIIXa/7FoE5aQx3oD9F/h0cGSM+VZXu7ZiBG4Iv58qDWQJ3v6IWeX4PFu4RcBWMjDUh2FJOLlSdlKcVX5+80DvxaYX3EOt+v/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BCeB9RwR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ybjizgskdl8htqytsqj1nxlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BCeB9RwR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ybjizgskdl8htqytsqj1nxlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3wB32py3z2y69
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 08:25:15 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6b47ff8a5c4so17001467b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 15:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726093513; x=1726698313; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4XmBjdboaUqTeMgRqbSdf4DSeJIVFEq/lNcpwN1ftE=;
        b=BCeB9RwRk0NtgISGxIBFTFJFfvfFAuZ6j9UJCDeA+G8DNqGAIesLfS0DUTurJ+SlPn
         ACNLmUEB0r2BKMWuGphXhe/Y32PAvsGRrmzhwSPa354BLMPkcqEuaQlyPj8Jn2wnMx9I
         aPT91xH5L5J+H1QhHgoF6jsxhRJJ+E7PiCwDXETSlpzTWfTZZy5MS3Y3NpzW/rZAp7Bx
         oPWj/68LD6JY/AmEMsTmAZ3WlRHANI8/OBXbpKAVbBHcivdEUYLiUyc5aFFdG0iWeASh
         IM4BOXdoBAJe9A3DFxtz0DRprWrT6ztGwvL3NTk8XtD0Ttg+mr/nsBUv3z93ORPFbpkH
         OfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726093513; x=1726698313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4XmBjdboaUqTeMgRqbSdf4DSeJIVFEq/lNcpwN1ftE=;
        b=m8k91SUr2TNpSTfjeER9eL/5NCFGANy1qCkh2FIIOeVJ61XDyeepL3tGULQCwx91/P
         UWb3g222u05jZJcYBp7TnizHpgM2X0raBG2EjuCQPCUyUihRuSQ+CXr0LSyARPYI78ZG
         6JT7sUDOa4l4A3H/vr+uhqocg+NfnUvXaUJAcjEWKQ17iaMb/biUqKpHRRQ/HEPTWf72
         mszaVjhlQaS+QL4sUeS+XwcSbmXQWY+iXmGm7AUv/0PwKmtxN0OyCMEK7Ra+91kKwDtm
         Ah6wxmYysmKsK22q90ISLly9wqMqNZJqOu7iWWqwg3F0Sj6S4VqKPgSHDZKOGXwzAHbD
         PpDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkBtlOWM7Knu1beHRPP97J5fMKH3ijuOc4+9G0UMqO9kYeX0inCj4J5nCiaPG9AXAZuhEZfIu+atwGISo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx8847JMbZMK3ZdDDCUPuTi/k2yCH9ItK+6Cgf2OlheHwgzQ2lC
	S5DNCXr+rEh5R3VrdJ9ff1FTtFJnVekHxAFwBj28zSBEni/99xS4XBepBaoRKEEpAHnq2AXfN1a
	4hwQ6i6iAnf35HY5AcNIoyA==
X-Google-Smtp-Source: AGHT+IHahPlfxq0OnDlBxbNh4kFfba2/NbBP9j+SjDxLZau6fx+NZ8cgucf9q6YqSrrkRp98eVZcQ/vy+HEi7ntE2A==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:6083:b0:6c3:e9e5:e6a with
 SMTP id 00721157ae682-6dbb6ba1041mr322647b3.8.1726093512763; Wed, 11 Sep 2024
 15:25:12 -0700 (PDT)
Date: Wed, 11 Sep 2024 22:24:30 +0000
In-Reply-To: <20240911222433.3415301-1-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20240911222433.3415301-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911222433.3415301-4-coltonlewis@google.com>
Subject: [PATCH v2 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
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
2.46.0.598.g6f2099f65c-goog


