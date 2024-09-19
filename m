Return-Path: <linuxppc-dev+bounces-1473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BC097CDFD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 21:08:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8lQx4Mdhz2yNP;
	Fri, 20 Sep 2024 05:08:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726772889;
	cv=none; b=W2iDvpigsnH9yqqS63WFfRURvSL2PVeMJj9+DFa+fqM3uMWt7AupJJIJS1XVrWUZNlWnqCjiOQKJKWQCo4oloqo5et796JN+QhBES6t5revR4PKJbeUeA1h7LCvM6uvI8xihD+OM59DCe+45HALPo2yMAFDl+m9xRVURHumJgyHBylU/jJOMOpHhTOgl5W6WN2qirfGMXGGNNs11gvAmmmYoOyNCwlK1sUAUIiGCBLGY8VZSMQnBm/J9Noba7EXgCgP2IR0QwOz+BBxiVZwnT2BaGpwmUkgJZpS2RifOFN0OHEAd9Jv++acHFy7YrPdlzPCw3BXEySIofWBfmAMlyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726772889; c=relaxed/relaxed;
	bh=i5Qt5np/Ap8e8S56AX/TaOyn++MQC/aFN8Qv/OewSh4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ApLUaqbLBobVAh0zY9zzfFgRLGW06Od6KiTNw4MqDfOMmSCE/JswMjn3EE/1eqT05G/mkY8l51vNjqT6MvzHp0xOO6LEwqjdtncj6/1nA2C4YiFRS2w2SZjyRVlBzk2YD3bjQTYf4kUYFil/Pu3EmfkqATX+RYRM70Kc6UkJppka1/AyuDw7iTLQSMvWDdg7kscfZI5oBFtIY4EL3G0EKbaLCLqNmMp39hg+LUeZ98nzNDzoIMUS9sk8AKosE8RsphLYDez8L3/5SnT3seKs1xCMKgNwqH/ZrMmzvOKxW7dgaF7vhDYm8ksNmGL5Iu9741f45AoiJMp2XJ70JszQqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2c0rUCjt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3lnbszgskdhmtfckfecvnzjxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2c0rUCjt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3lnbszgskdhmtfckfecvnzjxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8lQx1XJCz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 05:08:09 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ddd7800846so28773267b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726772887; x=1727377687; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i5Qt5np/Ap8e8S56AX/TaOyn++MQC/aFN8Qv/OewSh4=;
        b=2c0rUCjtK7m+a2d3ubCeBydEsgHVhKTGOGUZGOY+3rzWQEGQ/2G57xLA0QP4eLsrgS
         GwNy3XBA5y7f5TAOg2ryej0MF+/copxwX7izvrIJI/9wRal4yhEu1mifAkTWnpm/d0DS
         TjKMz2b2Uehd8G4xju7TdJDmlCRDm70RRYGQJRU/0+oRRhi+/IV3jo8twTsEuFb1Ox2a
         Nv+DtzM+V8YAKLmzptFjQVvN3V4Gce0/ev45MvY00C4LwgAh+2K9ZYOYUC4BTq6dAxtt
         WYIak2+UxwxNzhhQTumUMjJzYMCQQqPpmct1Pym/mfDcMGwu0Kmz4a0x04CnaiulkifL
         wOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726772887; x=1727377687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5Qt5np/Ap8e8S56AX/TaOyn++MQC/aFN8Qv/OewSh4=;
        b=S2FWUm8V3IKtBR2MjujTZOwiZwCsL+JVlgscvApaFqV0IaTCZaoKUXZ/eVoLt8faDv
         TNkRKfsZAKNOKJDVXmn2MltFZKlUMe9UH7VZXG8AzbWTnoMEZ7Ou0cQr9kRMLYvp76vy
         Nxsk6uXISQrrEgGKiuGPH9r1MBLtz7y3J7YrsZwCXhsTL/HwBtzHB4AKDbXejCMA5CWU
         wq7IMHla7C/q/qJwcL6s5+iyhJkI2puJF4Rf6YmUBT5QLsCMT2fnVwfZ4BCZvfZA4kA+
         YewIeiIqKx0P+hC/k31ieLTnPbxGNFp58dn4HqHIWxrsfgJsGQ6lIw/oMYHQIDIoLKE3
         Gm1A==
X-Forwarded-Encrypted: i=1; AJvYcCVkGLOBs1eLRhtkWP6xJSi4Kh+0rHrX/5gTJpqmanSvKF1/vgPjiOovCoc4kLy8+yQFDjdVoOTjdX+YYcY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw6rV0zKFX7nybp7Nztmgs8rRaunyD1MjXy6xXkoNT+oxKBP53v
	wJGJLRrzStAjBdta0YrKnnRlRTO/ig3Ir6yMuC1Xh4dOuvJQVkTHSGJ3POWyGkCllTQ4XYAk41R
	qRjmDYaUWu9PEQQO2e69M+g==
X-Google-Smtp-Source: AGHT+IG+gWtFXvOjppbknvofQy7F475eldlmwCdDkPmmKXe3fWWYdIxyDCZn7gT+ZyDPYmZ3bf2GZI0Klu7wUcLEaA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a81:a88a:0:b0:68d:52a1:bed with SMTP
 id 00721157ae682-6dfeec11e0amr8827b3.1.1726772886738; Thu, 19 Sep 2024
 12:08:06 -0700 (PDT)
Date: Thu, 19 Sep 2024 19:07:48 +0000
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
Message-ID: <20240919190750.4163977-4-coltonlewis@google.com>
Subject: [PATCH v4 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
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
2.46.0.792.g87dc391469-goog


