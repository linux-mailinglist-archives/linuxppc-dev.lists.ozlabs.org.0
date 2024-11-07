Return-Path: <linuxppc-dev+bounces-3015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B00179C0E47
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 20:05:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xks2D5DBwz3brc;
	Fri,  8 Nov 2024 06:04:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731006276;
	cv=none; b=V6KIGvVLNwas0lACbtV+3Qgcbq9xGEDEBiIyUNgxWEe1YBHHHwI5XZT+PvmGWS/3XxWg3M5BQ/ibVGq0yezRZNq0buQRwh8kpUXoj//p/aD56AHD+Zx2yVc1DlhO+Ijd7RSPqF3nsFqJz7PAuur6UjkjXmu81dJbDAtItO+uuEViW9kjvb/lPZFsU4CARPHtX9WVG94C1EJ9/btn3Kjbv4RsBcVpYmLzNfuiSL9X4uQkI2B+X0UkBIV5b/hkrhpu+bdMcuxoQjbahSTP1eTC47Yvm+LmXz31/SSr32w5SqrbivExh9mP0TAFYZuDG9Rs54bk9dCNyJ4HJ4xhGNLVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731006276; c=relaxed/relaxed;
	bh=ZmIA3zzAwF29Of1RGzzoKivdDO9cfxtkZLWZ4k8wrj4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Su+agg/RljrsJjO4/95I9JiL97fVwuRosir9/a/nl3o+x6C+opyP4VWjNNth7pJQk5MHO0MjP6uk4zNcyvNX6cHBPccOSjeS4J0PAevsdA5QaljrQLxGT7lyerrgkqW3Sh6E4gz/7tVu1ezstnBaD9KoU7euXDuS+lIG1gWWJTiAosAn4e1FbIEhBIeQFLGYL7cxO3XdfBwWNZZYLBx4fbJfTnqKNKk4RfRRKl/QqCxLEhiq3cc68WYD+Wyt2W7nw2TbxRUNlhcryARnvzHNo/GlpZKnjBQ110nEQNFbo76PgabkTBVytIG1d085BFNqilUfbNXjO3YvemxKxdqcQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bgYpD/k6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ow8tzwskde4s419431ucy8w44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bgYpD/k6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ow8tzwskde4s419431ucy8w44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xks285Xdcz3bqQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 06:04:31 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea8a5e86e9so24070567b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2024 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731006268; x=1731611068; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmIA3zzAwF29Of1RGzzoKivdDO9cfxtkZLWZ4k8wrj4=;
        b=bgYpD/k6yWVc9w8NsWEzSbfBrjdk2wQWdCTMdn/K9iPTsqIZtoP9LyTg28fWA4BSOX
         fGAXMZiXlbw4kC3cZg8+lsVGOkzqFOVvcjkQXpbemFTYApAt/3a7XXhRUYSN7N0ePJdm
         4w3IVUFdmf+qyTkaVrryEmJP/Zkigr+vnaRAjaKc+yGq/jDbD5zz+qBEendmeylUCcvB
         j8gd1HdiqfN3J0pGk6w/aS8zwIBnBQ0aAW9s+nOixANhOW2R02uGNKmEppC/1xgZ7w0q
         FelLZRL/Sbp88ldkKI7NS5aI6S0KyC2gwTCKWBqZBstButyOF0Ya0oEd/V05Za1j9kJc
         GZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731006268; x=1731611068;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmIA3zzAwF29Of1RGzzoKivdDO9cfxtkZLWZ4k8wrj4=;
        b=GCiyxkeZBVFir3BxY75gLWNJMliy2zbB0X8JYNUYnTomNPaoYWHVfYqXfoVbBOvpm1
         dx5h1Oy4f6LMHDB9ukBpaFCcfmFAhiNYVvYEsjYfeS/5E01bcnd6482di8jQs1gcTA0j
         gs0BP8mKmo7areJoA3xhXfOxsa4OansmqfcIpu+FkMoa3ci5EfZhkIbnzIg/sD0bFjz6
         ethDSF8FjBxH0b5jhL3B1AfXm7xyWisGlW9VKaZiZAiZPJjt5lILPKTkYOMgZ5urTFqq
         4Rrcmz5EOfDFfbFPG+H8UVyxIuDbTVi8PMYPFgZwRPiwaHO8aM2F2Vvvtz+Hl4a7H02U
         QeLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWahxQtubM9KU+WJns/OdnGC4Y+DI2SFsR8mSTtkaUr7SWMvt1Lpgie2ckBE+lyVS3F3dsGPzGO+iRNm2g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4TsGcnTII8xXR4cpLIcT95stJ9OEwpDoXihFgr0CiKZ8Lip5t
	mL7lHZkOR1CyhZIEDLM39qO3grgZzKA8UWLV/aZ6dblcxj/Sx3RMS3c8Gfuui3uALhlG7yB18+M
	+nxkPy19uTCPoqtGXWV2QyA==
X-Google-Smtp-Source: AGHT+IEPatL83aR4PMUsob9OXifW5dvDcVQBE6blGQgqqGrE/g3o0tifuLtLw5ypjY27t+StHZULk6h1q6SQXWXUfw==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:968e:b0:6ea:34c5:1634 with
 SMTP id 00721157ae682-6eadb3f8a54mr13007b3.8.1731006267878; Thu, 07 Nov 2024
 11:04:27 -0800 (PST)
Date: Thu,  7 Nov 2024 19:03:35 +0000
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
Message-ID: <20241107190336.2963882-5-coltonlewis@google.com>
Subject: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
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
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Break the assignment logic for misc flags into their own respective
functions to reduce the complexity of the nested logic.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/x86/events/core.c            | 32 +++++++++++++++++++++++--------
 arch/x86/include/asm/perf_event.h |  2 ++
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index d19e939f3998..9fdc5fa22c66 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3011,16 +3011,35 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
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
+	if (!(guest_state & PERF_GUEST_ACTIVE))
+		return flags;
+
+	if (guest_state & PERF_GUEST_USER)
+		return flags & PERF_RECORD_MISC_GUEST_USER;
+	else
+		return flags & PERF_RECORD_MISC_GUEST_KERNEL;
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
@@ -3028,9 +3047,6 @@ unsigned long perf_arch_misc_flags(struct pt_regs *regs)
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
2.47.0.277.g8800431eea-goog


