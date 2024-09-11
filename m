Return-Path: <linuxppc-dev+bounces-1268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB7975D19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 00:25:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3wB4300jz2y69;
	Thu, 12 Sep 2024 08:25:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726093516;
	cv=none; b=Atu4/zOgoKbQIoSi229NTeuJJCEAuQ75Tz6fugvoQRmtnO8jvZhbivDrIoAcuZG2oF/yc0/5R2PnmYIKj7iQZE/j8zFzC0dGJdPk4YbkSud60dERPn0G8h+v7ygtbaCkDboHoPsq7Zd5/CGU3uZ3o+A5tTkPxikl0Ggfc0JKldJAvzBqeDABWwrLiz3Vydhv4iwp7QNdvi089qNbcoL8KwoCfZVCSNi+MzitWPX+3HXd3ohT0GrLIgSFHl/k+CNBzFdab0N7Pc6STMPiy2bFk6rrsDSWnRPT3gAxUVTU45qYIdRhOZUH1+hq4gR89+xbp9xVPJBTbek7KcQXl+G4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726093516; c=relaxed/relaxed;
	bh=qY7jazBJP8pJhg0f/dQ9sIJIXrzux0tRJtWLf7xpCl4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hkt04rJE+Pzph2vTe+uGYVJ6v2vPqvaK7ICJ/x4mcLhB3FGPRy+YrKorZhoKhqL/E5+Q7cWchb3gdnljAayjPylkSIkRWbsbS2KTRYsxpqZdILV3SEXhCBethAMSnGukmejz+/yKkhdNCJRKanw8wloLaZFVgBb9IYrnPfi6QCcgy6iWFugJVp6ZM/ig8Sjy7zU1uK1EvyeHNm7pj/dL9tghwucJYC0QToQs1xLHZWe5M2Ug4QOngt3KIq3MJwQxIG7mZSYvdd0BU195Sh2Cx5hNXxzQMG7on0t0oma7MSlRF7U1b2Z1WYg7sqzDKJicOTc0gAQaw1tO6Z18WVOPYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=l6bl6bX8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3yrjizgskdmaiurzutrk2oymuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=l6bl6bX8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3yrjizgskdmaiurzutrk2oymuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3wB41DSCz2y8d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 08:25:15 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e1159fb161fso776491276.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 15:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726093514; x=1726698314; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qY7jazBJP8pJhg0f/dQ9sIJIXrzux0tRJtWLf7xpCl4=;
        b=l6bl6bX8XfIyLTscgvNNlDzXVT16JnGUJFYuwrCiHxUtKTIp+OcW3gh01IQB10iTES
         /PVM2NIYxknisxx7ePHsmVZtVsu/CaWzOl9nBA6XWylVwvSkAREbgGn5AonvRMA/gm3Y
         lk0H+DVPK5HWVfeWXP7nMdOtnmLzuABRINn8yvWsPYC3zW4hm/tAAe/5xmbg5yubiqml
         n0U9C91P1F+FmHeyknKRLRhVNx4pQ+3Jjisy1k/dq9CfK0iK89Cd5iDGShHXm19RgeuD
         sIuNxa6eLcP7ZSfCSleOuQLC5SPAkgkgOKZrn+YPo+seipukk838TyatUUVfR/SYV1zf
         DF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726093514; x=1726698314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qY7jazBJP8pJhg0f/dQ9sIJIXrzux0tRJtWLf7xpCl4=;
        b=LySyHZ+X5xozzgXja/OoBWR1z/Xs0vVw8ZmSuMX+AgOcCLVsyTwaLudDpvTM3QfHls
         ttVQY+9p5Cjdbblh80a4kLvKhnZPUMfkxOspWhStZquHY0jXdH69sO7LrUPFycjhuGGh
         DnYUv4va4choAPv9WB55yw4x6CVfOkF7In4zKZu1ZX1MhaE7tm51nfWEUTCPMzu7gXJ6
         6donDCI7YAybXO08ObAUnihWvm1l19lxwnR7cCgS05st2DNf4ZBm5A8/RB7P8WZ6ahWb
         EveAjucOXo9WmQsou4lpoSOXiJzyY3EVdrWspo5+tgPIMyncYPxBcyxMtWIBJG72IeUE
         IbMw==
X-Forwarded-Encrypted: i=1; AJvYcCXJncVtujkdeCXFqJFsmvW/sdxpDGKWgNR0HlSGmY1lSODYPi0FuV/3HJyLCNCswFWNlx0nRqqJe0g3rRw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzl/8BPBG5wA/sdCXHotZvza+mXEUWR8jM7nofihhPcweNz3PVY
	G6+jis7OM/kfgRpARVl9m3OCjdkhXMKXglUrGcpHgbSQCg+HSJLCBA4A3WkB48xKahnkH0fG1R6
	VsREJaIb9MCFtwh8k9fGTJw==
X-Google-Smtp-Source: AGHT+IEJ4qXFa/RnEyqgs+UMl0d9RUxwmlrJg7JrBYtR4wSiyNcS6y1wcbWXE0ormIQyuX+hDspZQAPbFzn+ORG1EA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6902:27c1:b0:e1a:22d5:d9eb with
 SMTP id 3f1490d57ef6-e1d9db894c5mr1072276.1.1726093513931; Wed, 11 Sep 2024
 15:25:13 -0700 (PDT)
Date: Wed, 11 Sep 2024 22:24:31 +0000
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
Message-ID: <20240911222433.3415301-5-coltonlewis@google.com>
Subject: [PATCH v2 4/5] x86: perf: Refactor misc flag assignments
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
2.46.0.598.g6f2099f65c-goog


