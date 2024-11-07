Return-Path: <linuxppc-dev+bounces-3011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B29ED9C0E3D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 20:04:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xks2B3dDxz3bqq;
	Fri,  8 Nov 2024 06:04:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731006274;
	cv=none; b=jwje/aSylmKWh5ysrqBup6S3UaIeysvPhtWKX1yrkk/t6I80iplAnj3EcCnxA46eQwh2jKDmMO/JIsEaQ+XUCHINsjZhOqEsFcrunq8Qn4TqfAcWl7alx3qpFt5+NbQCB58Fbq4cZkQf5VhHjjNwwR9DtOPmTYI2in3ZIO8xgXmNj4ZXsEfmrRe5EfEhrTkeNJZLYKuh0IM/eGH6b5NMs5fB+r1WOBOTSJ1zf9VEuB5+3HrUJT1QlmIQJfKdJ+Soedu//TTsVVTD318k4QLU0UWn0CbZENZA4mjxMoeqa+8uEAuYKpRkscTYHOezg5aQd34VKUjYw3jUPUVMr0kkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731006274; c=relaxed/relaxed;
	bh=z8sUtURqCyFCOn8JOOFBrrh4KEoVslcfr90vq+LFgUg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bmnEG7orOiyKB3ZS/v3NkJnMC3ReHSIBlqhkW5eI9c4DZqvx4g+gG+Rwss0Al9ldUYYvWYlRO0rdgHjRNBdEVrKNgu/yCDrUPBUxgudHK3vMvLlKxS6B8W6H2h03yHpvTYDTo8GsjBWIdtk7HTFWX3zofoQ8YusRdiydaTIY49CT7y5ti8wJtftEtNWgvhcwuw5MUVdRWT/i3PpGxX+/rhDZejCwnm6JZ+1/BnSR4p2jRpm9lI64IVu8ztpz6BWNObfg1p27+ZzIOj2SmZ4cOYVToUAG2W+8MRWz/R0XGinKObY5+sNFCbauM9wSTez7S1os5W6wAGSMBD1NJyYrsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=t+H2x32v; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3og8tzwskde0r308320tbx7v33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=t+H2x32v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3og8tzwskde0r308320tbx7v33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xks28691Vz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 06:04:31 +1100 (AEDT)
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-83ae0af926dso139718239f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2024 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731006267; x=1731611067; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z8sUtURqCyFCOn8JOOFBrrh4KEoVslcfr90vq+LFgUg=;
        b=t+H2x32v/SSShiR4Td+vZetTf86rjNRQG++G6fUWhe9dFqOea0GSZU8sB2Dr/0PSMf
         1QWEvqqXywdUOxJAi7hfNG6FjCbk2s0uVuhSVBLhVmVB5/ebzJ7Pwo7WCpBHGShTrIZC
         novo5k1iLvfevCFZ0gf/L2bXM+NnndhgrmNGrNhaZEcoV2L9T35eoFd8kAPUU1B2C3uC
         8GtTZxpTjse8hVYJy5xIuloTS3eA6lyX2ONblugtcRdm8YV1LeUvDzHxXbCIEfjHs6XX
         iqoG47eVKT3j8UsCDq7w3nu1h0Zm2nYqB82znbDoPjiGz6ztp8fr1RWuD7Os0sY1+t/D
         chdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731006267; x=1731611067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8sUtURqCyFCOn8JOOFBrrh4KEoVslcfr90vq+LFgUg=;
        b=PEh35v5phUwZv1s7A5bP4KKIoQ/wvpeMQpZhst+Ec6RlWWRsqtriO0ZlCGjRB9qwZz
         T8TOFEvosrW1euL5uJG1CdhxJqjtLGb4bSKDvsjlMZJiijtTASIur4/e28WO6ZF//nMa
         trDR+HGdhGsqllc5PhvfozYl5xXaEofznEJmTqGQfT5LnW/5BbTO0tMKl5l5oTgwEcLE
         oegn9oR+rZLwh2zjz7mMvI8QToY0NHzZdg6GmTR7CG/q2/OEdDRzmISBtG76/+EAc/YT
         kkzKM2CzDboUjO3tj1WjqmZyGMLja8W2I0VsbLrZiN9PAaYrh6A3Hm1euTucBMZ0dAop
         puhA==
X-Forwarded-Encrypted: i=1; AJvYcCUEGlLbqq1UISOQhD6eIIH1vkXlCCUaiDcgCP0Q42MAQO6xZRXltX+dZZ+zgZLNc2SRIEZSsxWdZGwFV7I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzG6E0dB7m3uQL29LTdMcPitJPgcDEXSW4TUPlx3Li83lmyq9eS
	4m365U0a+g554r5mKpeMOsjktZtAplz0qnUIRiZBYuy9z5dXM/hVyA5XWH4Q9J6ZbqAjsBIjIIH
	AJ2q7p4c9e5193a1ds+33kA==
X-Google-Smtp-Source: AGHT+IEPRr/IQdodyqcpTfvB5PFu6DqvhssHdY7ZGS0GFH2h0T2KiHTqbilJA81LBD/MlyV7/G5K+PfGhK0HNCVbEQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6638:890d:b0:4db:e85c:f17 with
 SMTP id 8926c6da1cb9f-4de6a5fdc31mr24173.4.1731006266688; Thu, 07 Nov 2024
 11:04:26 -0800 (PST)
Date: Thu,  7 Nov 2024 19:03:34 +0000
In-Reply-To: <20241107190336.2963882-1-coltonlewis@google.com>
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
References: <20241107190336.2963882-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107190336.2963882-4-coltonlewis@google.com>
Subject: [PATCH v7 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
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
2.47.0.277.g8800431eea-goog


