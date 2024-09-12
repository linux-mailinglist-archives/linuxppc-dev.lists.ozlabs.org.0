Return-Path: <linuxppc-dev+bounces-1298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 388EB9772EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 22:51:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4V3f1lJsz2yXd;
	Fri, 13 Sep 2024 06:51:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726174302;
	cv=none; b=X3hg11mKCSBaG4jSUPGuUzs/6fpuY2OU1dmlXz9Vl2foX6zoFAnJJqxJAlZxcsdcAcuJUyNqNMqGaknGwZ7TOJ/x1bhkL0t29zTFkQbEHzWxMsxuidlFVt+1i9dcfzSxdUT35wsgvmjHb7C9LKUZ53C+1O10qsvMlx20/nahBTZurvVmDceDU7wfgaqfggzFugJLjuzjCj2FN1+ICMenOCeB5BHCTlvB6loRYGZsAqz7TKPnBPK9qUQ8aC37R6NZ2AJAMoDIz1qh1mCU5PwysyLjUUbAtZe0EyzusluIea5whWS75F2WrvP56jquBys1aeQnfRNt1Z9L5pGi3qWAhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726174302; c=relaxed/relaxed;
	bh=qgNa1Xt6FnUSigDEF0LKTlfU3qkapsIsHTMTckjKajA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SiXmT/OKYyyAOlDyDqqTBhU/zfdpDOvCsPhnrwVQQooBfnbr+Ki8Lw7Jb8OGxaRbMjvWbuRloBAxsK7+vWakWGa9eROkkVXPYhTqbaoc4BZPP6/5mMC2wTnapERfvReO2Z3FjPOe+mS+l7AuMnMOqYAmesXFHL1G1rUeRqnra4tpZ1Kw6CXBKJfMqN/raAlfiWv2j2K5vNl7K1fb2CdvS7GPJwjOOc5dEm11Z2X6JelCTQtOhIua5ECPCQmkvePLZbSeIPhZ+EHVNrKCR2g0/N/2kPKQZyI8UHp9d8SErIxv0hCasJy1OOGWjvwRO+mV+BXbZgvuV1Fu15b1sKmD3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wO1rPknp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3wvtjzgskdmwu63b653we0ay66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wO1rPknp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3wvtjzgskdmwu63b653we0ay66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com [IPv6:2607:f8b0:4864:20::d4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4V3d5g9Qz2yVZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 06:51:41 +1000 (AEST)
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-82cf30e0092so23856939f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 13:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726174297; x=1726779097; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qgNa1Xt6FnUSigDEF0LKTlfU3qkapsIsHTMTckjKajA=;
        b=wO1rPknpffyVlEYdpX5BB5fy7vO+4XG1RyRPpaXllN/4mJz7hCjEPGAjfjAlgOQUTf
         kTZBHAaW8/MY0R76FBHpD8FkNz2xEpYYyYNM50W+mdcmUiXlOXCEPx9qCxcrfybDzkrL
         IzVYR8uOHTGNPWIPvWW7I2St0QWn90DlV+MXoPNILI7ziqB2Fo/plCS6PCFHM42mtGE4
         23y4nc0wIwJJrql/w2WUdK+uM+1Wis0/2+x0UDzGw/ydTQSYljf7CeUqrPTGZDHytgO/
         APDMbawsLcSNrNEcFexz4eRjvouW4P/W6BXO4/ppyV15aGjIHAqBjjUAaWT2EMFhh5ef
         vEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174297; x=1726779097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgNa1Xt6FnUSigDEF0LKTlfU3qkapsIsHTMTckjKajA=;
        b=ER8Bob3OgvsvunMc+4H0Em5VIQNohkGlB2+pmiNlbVTdUeQ5Kniq52bHHF1jsdIgRK
         +MKI8AqgnVm3M6QTP76RX/6xIJRbqrWqH8I7d90UNe6c4bAjh5e2IuWZ30pzWYdhHtOt
         Nrf1gjdgdMHXVd+gPBQZ9dRiIh6HOEb/TfLw/JnRL/u0H2qbUiv9844MAy5XO8K6Qm7I
         ERXcnobVIk4WX7956413wSwzYsO0UT60sOXu1ttT37Ws2V26uWGLBNA7H3dAdJzcblUj
         BNMN2RzLURYBZ+iQMj1xxJSTJuC+/KSAgBXFpYKdpYC6Pp1oxrUSB/7Ae+uYuHia+oBR
         OHaA==
X-Forwarded-Encrypted: i=1; AJvYcCUjz/a89c6R0TWh6T8BcXgAy399Z7thnG0iQ3pbSTuV0Sk0HLEGOH/6qSdi6rb2xf1SThRewGuVU6qmH30=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHa0UZgFREKWfWtOqLA/VnIvDgp+LfEozq9tKVMJ4KpiFXt82h
	Ql0jeWDmFOzyvf1KrCD6Seuh1PnBM9xlFVvWz3W79lQ1+vI5OPelMvXKkxNhavDDgRlRDutEOq2
	TUw4sb1fKud9ecYVp5e9Sew==
X-Google-Smtp-Source: AGHT+IHFcuQ/5a/hhlw1GFJJYrc3if7U/QuDvmMiMeVXDMjRO3Gjmvd8L1tjO+zUGwBFmEAgEN40MjfIHW+YAT2pgQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6638:860c:b0:4d2:27c:18f8 with
 SMTP id 8926c6da1cb9f-4d36e33a768mr13751173.1.1726174297086; Thu, 12 Sep 2024
 13:51:37 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:51:29 +0000
In-Reply-To: <20240912205133.4171576-1-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20240912205133.4171576-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240912205133.4171576-2-coltonlewis@google.com>
Subject: [PATCH v3 1/5] arm: perf: Drop unused functions
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

For arm's implementation, perf_instruction_pointer() and
perf_misc_flags() are equivalent to the generic versions in
include/linux/perf_event.h so arch/arm doesn't need to provide its
own versions. Drop them here.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/perf_event.h |  7 -------
 arch/arm/kernel/perf_callchain.c  | 17 -----------------
 2 files changed, 24 deletions(-)

diff --git a/arch/arm/include/asm/perf_event.h b/arch/arm/include/asm/perf_event.h
index bdbc1e590891..c08f16f2e243 100644
--- a/arch/arm/include/asm/perf_event.h
+++ b/arch/arm/include/asm/perf_event.h
@@ -8,13 +8,6 @@
 #ifndef __ARM_PERF_EVENT_H__
 #define __ARM_PERF_EVENT_H__

-#ifdef CONFIG_PERF_EVENTS
-struct pt_regs;
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-#define perf_misc_flags(regs)	perf_misc_flags(regs)
-#endif
-
 #define perf_arch_fetch_caller_regs(regs, __ip) { \
 	(regs)->ARM_pc = (__ip); \
 	frame_pointer((regs)) = (unsigned long) __builtin_frame_address(0); \
diff --git a/arch/arm/kernel/perf_callchain.c b/arch/arm/kernel/perf_callchain.c
index 1d230ac9d0eb..a2601b1ef318 100644
--- a/arch/arm/kernel/perf_callchain.c
+++ b/arch/arm/kernel/perf_callchain.c
@@ -96,20 +96,3 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 	arm_get_current_stackframe(regs, &fr);
 	walk_stackframe(&fr, callchain_trace, entry);
 }
-
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
-{
-	return instruction_pointer(regs);
-}
-
-unsigned long perf_misc_flags(struct pt_regs *regs)
-{
-	int misc = 0;
-
-	if (user_mode(regs))
-		misc |= PERF_RECORD_MISC_USER;
-	else
-		misc |= PERF_RECORD_MISC_KERNEL;
-
-	return misc;
-}
--
2.46.0.662.g92d0881bb0-goog

