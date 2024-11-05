Return-Path: <linuxppc-dev+bounces-2882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 854CA9BD63B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 20:56:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjfHD2rDCz2yZN;
	Wed,  6 Nov 2024 06:56:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730836600;
	cv=none; b=TObS4YOa1cqQkQfljljvVWJrdft/v6cwERPdslzbMt88HSP9ViRcXdPxNx4fDluylj+PuYC3DsFPJ1ZtkAYvzs90jepubIUQr6dBlVbYr4xJUhdRSE3WsrrW3tlBLDZDgtzUf/16FguKrSl5pAN5GZuRyZJMxw8k+UGFr1Q2pCoOaQYXTfnFX1ys8XCdigxfJmeWDwJ3xe07ZqkQD8MSR7MuUDBOpKZkPcp0fkFyd6fvdVDfLXI0/iVU07ipPqixWO87tRMRracV5abZeAI4FHlZ5ORnZk5mcqiukhwx65OltyO4TMycfLBaIyk/CguBw5IsWmrWnfydDdewNAlmuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730836600; c=relaxed/relaxed;
	bh=g+A/E6dh30+B+DuVgwcV18/qvNhG5j8MCeVP9K0OnPU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ClGqspHGYNcQx632M6NRTP5YEjudcK2Lu9QPrHxppNeA8xow4uNeJxCcaBi56C5GoX+3CjnTAqtRenUNT2t5gf3RWWt1K/nX2+R8D3QIMTNLDwnY7WNZvBDfCmCGmHuyvVHTB/mpxD9MKVaOb54LvmRz2B0FITCFV1IlviF6aa/jcR5Tzqmi9yMEq8qniBsHA21x9dHdSc01GCVdhYKIhyg2Qev+4zabFqkka6TUoL8CboljhVldENG917vmzMnPUIKcm++ofMIBUkPk0eGXwFO/c+xSz51EEbU+1n7aHwMJIme1jhXbAlgEg8az0LvEnmMa1lELassMWz11ZxEyng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cMb+vcdF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3cxgqzwskdewq2z721zsaw6u22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cMb+vcdF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3cxgqzwskdewq2z721zsaw6u22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjfHB4wkFz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 06:56:37 +1100 (AEDT)
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-83abb2b6d42so568515139f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2024 11:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730836593; x=1731441393; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g+A/E6dh30+B+DuVgwcV18/qvNhG5j8MCeVP9K0OnPU=;
        b=cMb+vcdFZ1lFwaQv3bF4AooY9LhaZGp0ErVaVEi/NFGJLHx/cgZdnsDFdWjfn72VJ9
         u3w9rYdeiHAd7pfj4iQkubbZMGIQw0U0Z6pNi7UtKOWFX8qN+oLjDo7NRI0g+m3K8gDo
         XhU6lc9tvq0QXH/QIJ4gashiULf4g5FtyATQWup9C6kvLckmWC5mnsDcdRIeXDO7eaMe
         uXju7RUvBFoWwwxlzTHoJH0ol6epUUsvxuETCWMy+ffdlhGzcBfQEX5tRCGHXJgAFRtZ
         26S1axS5fMsyd1YYZwEblifSlO7guWluaIpQ2sm8wm5UgG0fr0s70FqxvtNDac/jNQt7
         PdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730836593; x=1731441393;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+A/E6dh30+B+DuVgwcV18/qvNhG5j8MCeVP9K0OnPU=;
        b=WC5ix3/HEL8AXRRdnCEhFx2sA9ekq96K/9t021vN9GieJuSs0KyCk4hc1ZdXcwgzln
         zovXZsaeu5XCV2Jt/iA5+tY54Yv3VXLYeftphGGgQDtquPQhlHtBMrlN7Llcto6/TZyc
         AMho+1iGSoXQEZc8bT9DomglnJ30U8lIagPwSnZov/boBZ5HYyYzgvEpADkWW1aTAKhe
         T1THbV0B1qlCxNsaOcaNWj8WM+mIvN3lwyIpG5laZZsn0wm3YImldmQ3YWYybADEZR+x
         tHbofAODZlDpDvD9b/HYljY0r/O7YKRgT3Bkru9ZcPOxbakFpwK8qnGNpO7tniV3IzOP
         srYA==
X-Forwarded-Encrypted: i=1; AJvYcCUK7To5bUy9iTfSljgnys3LoPUxD0oXrY7BhsyyFXi2KC6jU60R1uCeMOyqMqEpMWcGmu6A/BiLP0QHKoQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMUTcdw1/kruqbDHmCzYEFr+BkUONOQUwYd5HzlQOmQI7K0pzM
	oB+sESvaqOrE6eR+LiO2oobmUTWwr8jBUFbHQh7+6WGTP8Tm2TLlDtcJPg1aMkdnoOTmsovI/dH
	7m4RqJfMSu7NVFw+Q0DsZ5w==
X-Google-Smtp-Source: AGHT+IHwq3hF4ElsT4RerqS5KSh2j8l+o/SOi33LC2KdnD9j/u2Nkb6pf++GYEETuSfSuC1nI4Yu4HiUAJoPcaH3GQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6638:210d:b0:4db:e5f0:ceaf with
 SMTP id 8926c6da1cb9f-4de0257ba11mr134988173.0.1730836593213; Tue, 05 Nov
 2024 11:56:33 -0800 (PST)
Date: Tue,  5 Nov 2024 19:56:01 +0000
In-Reply-To: <20241105195603.2317483-1-coltonlewis@google.com>
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
References: <20241105195603.2317483-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241105195603.2317483-5-coltonlewis@google.com>
Subject: [PATCH v6 4/5] x86: perf: Refactor misc flag assignments
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
 arch/x86/events/core.c            | 31 +++++++++++++++++++++++--------
 arch/x86/include/asm/perf_event.h |  2 ++
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index d19e939f3998..24910c625e3d 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3011,16 +3011,34 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
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
@@ -3028,9 +3046,6 @@ unsigned long perf_arch_misc_flags(struct pt_regs *regs)
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
2.47.0.199.ga7371fff76-goog


