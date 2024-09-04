Return-Path: <linuxppc-dev+bounces-1023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E848196CA84
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:36:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzcmM6fqxz2yn9;
	Thu,  5 Sep 2024 08:36:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725482552;
	cv=none; b=NDFwKLhlF49XguDz+0HkP+A/50zz3dVAhkiB9zs12KicB4f36IxQo+kt7PQRJ96FGJ6Zk0VdK4TTqrQko5ltcl5QWmUcnyeNeUieP/+6L/9/AY/BudRIFZ8kClwYJFzbt4DVeX1el8vWzKB0iLbqemXKJ6Cafu/CUS8RopQC01r6i9YXKuTTmfwF4kkgjz7Pj1DO7Xx+Rq7oMJTEcmtEd22JfPNEF3JcIaIrkMNY6SpcKHhQ1+a9AOnld/28/UgJnnaTswbVT4jvhzvVUrfQkTWnFKEDPZvrRm/wRA4M1tCEc6fyyD0e44PwBHQvPiECOfX6snam3lO0a9j4tZ47qA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725482552; c=relaxed/relaxed;
	bh=i72PSOIXWhCeY4HgM9YgFlmZggdii21Cl4McUfu+68c=;
	h=DKIM-Signature:Date:In-Reply-To:Mime-Version:References:
	 Message-ID:Subject:From:To:Cc:Content-Type; b=dAIsmLOphS09pPJf5kUtJ4qO05SaLRkVZLtKv6fGwDPLT8VCgTbkzShsNNRaLTbQJJ7RGHebQoQZUcRDBk6vPbmBtRoZTwtELWC9wVGdJVprGu34UJ139eJ8mCzmM/4h8AHbWfABs8zrwnx0lChOvkbyLm1rZTHMmx7wXjqwfJ2+vKPv7tV5wp6MsyYOK7YU6mlAgmCciZezRu4iARdrM60NezCBar/chcX/AKqgY+7EYzYo/wRmwCIufUKKSR5YvmVquGd26jtN8qR2KQGk5zjaJ3LzdKABD9PaaKwVgKHbPnUO2uShv5WK1ifkxNNRxjNv1ORxQTAhjWMGK8JWxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LsxfWjjf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3nsbyzgskdgmdpmupomfxjthpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LsxfWjjf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3nsbyzgskdgmdpmupomfxjthpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzZDm5WMDz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 06:42:32 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e1a892d8438so184255276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725482550; x=1726087350; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i72PSOIXWhCeY4HgM9YgFlmZggdii21Cl4McUfu+68c=;
        b=LsxfWjjfNa+1LJxZ/rAoonXtwYe5Jyp2nLTL2vzkJrgEvuf6shkqwyifOE3YKn+zNl
         JPn+w0V1g4pNi9XTJ7hQygtGwhgAOsY/HBuaWwJkgso9nO47VNNnIGDtUlDQFLh/5xqy
         TsStGAW5uXFxZcUy9VHa9FVTgsSI0cReGCWtlT0rjQvRlaAiixg/xv1KDv8K7q2S64Aq
         O7PXmYKS5Uzb193lbTKnUwlRE4hTK3gSQdtfh7OWwsnlhSElvfTiF8a9xaGhyrxoXb1a
         KNAc50LjjpG21V0Km5HaD/uDHQQgmhrslKW6CTa83B+wK55ZfLFMgMviWmM8jC2uw99I
         gAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725482550; x=1726087350;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i72PSOIXWhCeY4HgM9YgFlmZggdii21Cl4McUfu+68c=;
        b=ehTEOymNg00ECqOukyk+EY3Y2y/QlUSGQh2JPkAd3zIaRjzPminO+6MbTL4gfAxiRY
         pisQ15hI4eGztqnh2hiQoAEqpS6WK7xxByafBOPyY9X9hZSM8zgMZokD7T5M9f2r7tDO
         VjG80+pBh+DMLX4CRa0FpRF82r/ykUX6A2ywWc9a65GjQWikPO7N4T4m0YgteUtftB8u
         li+LppPLJCDf4qbHa+OE89i+I//V/p2FPgjjoJnWCXROPP3Pz60HBvEx913ZzQQ2CaVm
         j5CFKKpAqyHOMl79eLZnGNvQzUJuc1EOlpKlWtXTPbBzdc7MoGP8mEYZeAKAeNDb8AXY
         znqg==
X-Forwarded-Encrypted: i=1; AJvYcCVT2wEuj0ch4DPv3bIrULEYgApxeVIgI78g/pujUIoL54S/xtMmKiBNVqwvKBCTagXmp0zMWumKY3gHvEg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxlixDNwkv9aDpvNyhWXep4g8zFoSVOrY6kEQoeTynjAWdsyIzf
	EdY4IUzjwG1fMSq1T+xcekYBzimMpZJj0JKueblRaOgncLVzd0Gu8zWOHwaqVZEPCSDFlHOuZwt
	NnCbnd/ougx+w9Y86ZOhbgg==
X-Google-Smtp-Source: AGHT+IFmR24uVrOJthtOJz6K2WVb+jtHXjG+hacdDNR8Ql4EFrmp0GPrZ3zw2M5BxgYPY6TLAf+W8lj+BLe1iw09KQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:14ce])
 (user=coltonlewis job=sendgmr) by 2002:a25:361a:0:b0:e0e:445b:606 with SMTP
 id 3f1490d57ef6-e1d0e58575emr4988276.0.1725482550264; Wed, 04 Sep 2024
 13:42:30 -0700 (PDT)
Date: Wed,  4 Sep 2024 20:41:32 +0000
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
Message-ID: <20240904204133.1442132-5-coltonlewis@google.com>
Subject: [PATCH 4/5] x86: perf: Refactor misc flag assignments
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
index 760ad067527c..87457e5d7f65 100644
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
+	unsigned long flags = common_misc_flags();
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
+	unsigned long misc = common_misc_flags();
 
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
2.46.0.469.g59c65b2a67-goog


