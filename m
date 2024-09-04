Return-Path: <linuxppc-dev+bounces-1020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A23696CA7F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:35:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzclF1MGNz2yGN;
	Thu,  5 Sep 2024 08:35:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725482551;
	cv=none; b=Ka63E20TctpfwLABjnfAIUW/lgvmlRJCp0VQyKwg3YcXW3xsqRTt2lOP4xwyhkm0PpmvUraQ4EblRJrEHfTC0GhpYnovMggRxwsViMkaq5X2BGXU++4RfUsyI9O2tjL3H+BVr1zSu3TQ/TiJ8H7GaSkTaPy5VT6fSCc737uM/8g8PCvME5n6l4lMZ7auP/PLqi5FK1PxrBidxUGfZLqmJc4X3Mj+zxPXfPJqbtlY75xqri6EjCymJPRBYaE4HnadlQsTC3KtdkCZUOqrEwbyqO3pKp4LrPoT+ByzPVTiIjt07UIj/aDw6vwzCrGyfJFvBAAz6SsoAiiKUCVoSdJ8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725482551; c=relaxed/relaxed;
	bh=da1VGWoVEM0srL8pak+5iYqVi4U1+WdMmmo+Uby7jLQ=;
	h=DKIM-Signature:Date:In-Reply-To:Mime-Version:References:
	 Message-ID:Subject:From:To:Cc:Content-Type; b=AtWuRqYREc8XI6gFsfkN4ND9EjyyQCiIHo9O+IO2ZJpqFA59uqbE3bavyS1WYpJivT4KwwVIh0GXJMTt04jXfpkJPy02DQNwOSz9BASi2EQVpJ0MIuye6+OPBcD+ihCkgsRUhmeJqpYExrBAfo5P8olTIdZV5N8XaVOH3wC04i4y+ktjZ2mo3oeWHxoKewS1XNI+74CDTKgwDoKeqktIuU8T6WrP4aDoNMsr6/BcFit67UH90bSbvY/UUPT5Re1ZLQFlXRCQA6jvMmzQ2egREewJf0AcnebM0DuPbji+YE/evBwcn+q/I1fcy++onBaEZILSp161N1Smx06v3JkH8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0gIcYf1I; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3m8byzgskdgaamjrmljcugqemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0gIcYf1I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com; envelope-from=3m8byzgskdgaamjrmljcugqemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com [IPv6:2607:f8b0:4864:20::d4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzZDk1KZzz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 06:42:29 +1000 (AEST)
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-82a2109c355so869695839f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 13:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725482547; x=1726087347; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=da1VGWoVEM0srL8pak+5iYqVi4U1+WdMmmo+Uby7jLQ=;
        b=0gIcYf1I/cO0/EGkjmC8+WPr9t3NVUW4y5Q/dU6VlycmsQ3fCEnFar8UeWx9rqYXGB
         A/yCA7z6depB+5ohqKTC3BiMpWVxWSXz4p3RTkHBRrwhCj6IbEGKKRbaW/+2Ww72FJHG
         d9F7x81c1in0k4iAzYUVGUtIMTObJwWz8rZ0ve72c3rxxNVPxFCy0d/ZWev3bYbsTOcr
         XxaanDGf4a7tKMqWNGapjYAfKMoPDUqp0ajcb3l3A2PR8ON6xC8JzZqqkaqTQaiDjIzD
         poqO8DXK9e2BxQHSo9NeNlWpAosETZ31oPm6BnyeT/FmadMtExJbmEo0iF2c8Nrf6W4R
         sgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725482547; x=1726087347;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=da1VGWoVEM0srL8pak+5iYqVi4U1+WdMmmo+Uby7jLQ=;
        b=UPwT8GU0MXOzDgJh+JGbYzted6VPK3ynwdkpZoF+oCbEDRviKzHbq8ffoq5wBYDXp7
         ycMVbevdTMBUaxzn2DtqwjAViRtM1c8csn4lsngCag7Xh/AjuAFH0nYDsuYDJ0Ro52Uy
         tOEvd6Pvnolbmsn8EupNO2MT//0OPjuCbdc2UNyEmnkAPMwC56tK7uPWA3Fq2z2nfV3F
         ytCa3BO2277hdjkdgUwxSAfWpxj5vK4DbiahjJr2zDb60cOyMdqJsSl8bUtOS6sWvHpP
         jfEONKJ4wLOIrdzZlGjUtrCQjhSmmSfHD62LGDS5oT41QoP63grdg2lnXhDvBzkzwP2r
         0fXA==
X-Forwarded-Encrypted: i=1; AJvYcCUVKvxlpK/VNVcShnp8oSwc4gB9HV2UbdsO0+j+hTU4QXR85kDPIPN3UBhFQb1KvY6VFQJdS0SdMD0LziY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySDk7bBDES3MA6bSqTQesd6sEVtHoV4MS2XxT3XwuvXW9BeRt8
	r/IoiCnLLVrr40OH8L15RvBtoag1UWFb0oFdKRjMG5AS/ydxr8X+gsyMnsWVAxIJ7GQbZfQsyvp
	QSy2eS0ey+FW7aL6Wa/2WWQ==
X-Google-Smtp-Source: AGHT+IF5VwhfDwFkkz0RNP4hdicHfuNY6pJqQwTSSeUmfbLEP1/IRR0I2ApAClPpKugjZhskT8IDcbh94c8otLZ8KA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:14ce])
 (user=coltonlewis job=sendgmr) by 2002:a05:6638:2396:b0:4c0:9a05:44d0 with
 SMTP id 8926c6da1cb9f-4d017d7b001mr570237173.1.1725482547230; Wed, 04 Sep
 2024 13:42:27 -0700 (PDT)
Date: Wed,  4 Sep 2024 20:41:29 +0000
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
Message-ID: <20240904204133.1442132-2-coltonlewis@google.com>
Subject: [PATCH 1/5] arm: perf: Drop unused functions
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

perf_instruction_pointer() and perf_misc_flags() aren't used anywhere
in this particular perf implementation. Drop them.

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
2.46.0.469.g59c65b2a67-goog


