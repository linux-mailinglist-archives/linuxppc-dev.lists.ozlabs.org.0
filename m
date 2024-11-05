Return-Path: <linuxppc-dev+bounces-2884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 725F49BD641
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 20:56:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjfHF370Vz2yZ6;
	Wed,  6 Nov 2024 06:56:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730836601;
	cv=none; b=EtCgsrqoHx6Q3mNqv+dDG6ymi/JOQRYodX44pjF8ZrVArkE0oXKNFw8qiqPGMC/LYIqvpVcTAXdBLo8+K2MAlAi6fLA8W3I9omyHd/3HK6J4lRaIbeihaKc9hgCBxOXwVUjYcU4IayZNavoYzEp1mOuCt47jd2JvYyB/xoamMau9A/5K0jnDdV6fIcYr8IXeJssImwvdDgXxXnMRZszAx2pT3CmuCprS6QixVxXAzY0WE+UoBXAWiDqFD0oor9Gd4kbR+ysocr+6BpGNmHMD0PXLLDbKGkLpZ420vV8xHKUE2Wt+x0D+YmxCeawX3hbM5b6FdzFf8YbSnKx942Cf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730836601; c=relaxed/relaxed;
	bh=EPb0hqOBb6kblWxXXARI3ocpeztWq9KwTirxTPs2l4Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Slwwa7ZEO4G28Iq6DqMaIuXM4SEXcojvhu3eRm1L1GYQEvyx2NT8QjMnP5g1ZJdLayQkNqpVv+mOQn+HTOlrJiRLgWITtq//cxW/VpKAqPt8v2Ww75NpBFxgY1i+AYmexox1FVZ9f502R4gC/mBNLIWojfn6u8E2r6hcsrcn9b2hR7sBPJNDfxTHTtnudAmt+JWhBzPlY47T61IrJS8x925nXjlhdzTh9p7olTOqoe5ai4wIvrtczm78a5LS4gk7sptAbb6Xm1Fv4FxDtQxW7t37eXiT00kWPL2/pWDtYogIgZrgb8br85ncwgZFEtkZmVuGDxVg3no1NkZGQ4LBcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=XKSXd2jh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::149; helo=mail-il1-x149.google.com; envelope-from=3bngqzwskdeknzw4zywp7t3rzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=XKSXd2jh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::149; helo=mail-il1-x149.google.com; envelope-from=3bngqzwskdeknzw4zywp7t3rzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com [IPv6:2607:f8b0:4864:20::149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjfHB5Hypz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 06:56:37 +1100 (AEDT)
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3a3c3ecaaabso73201825ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2024 11:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730836590; x=1731441390; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EPb0hqOBb6kblWxXXARI3ocpeztWq9KwTirxTPs2l4Y=;
        b=XKSXd2jhqd2HCnTZy1QFx3k6RnGtILzhttG0MNxV5PxNohy8izV/9NPeUv79o1eDQJ
         DX7lxMEAh43t/b+63G2fuf4iICCyX54Z6h3d2rCrPHzTnOzZHJIGhnLatd6mNUoxakfB
         DHGviI6OF51aI5iYmkzLho7kvRp6ofcoHgu4c+i5nRHTvZhz1Xp9gD8oMGkTxgXloyFM
         pOL61MoRPXL8gi6/o7w7JFo84HinOMGSErTlgB+0cly0lKA1MiLdfUl0tPoyNMIqYwL4
         73Uks/pCdGeyNTLfsGhn062eIgnwvBvHoCTzR+hhzu16BmwUk//mzzVtc7hjbzSRA1vf
         0QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730836590; x=1731441390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPb0hqOBb6kblWxXXARI3ocpeztWq9KwTirxTPs2l4Y=;
        b=a6UqTapyurgmuxFQ2PfULmLV9X6JhG6KfhhOdo2dRF1QdfGFq3sTc9Xx6zKOCQdx+H
         zmB6fZZw92BMmjAW/UuUG6kzV7lWehbJjqUqDELN7GpSr8VFI6EmLLgPyzeUj2EMPR7k
         Mg2EqiLG1yKS+LZ1DilquaNWRUh0X3rdoRvUTJOdqPeemYAubnnsOtJzY5dL+wESnYtf
         MHWI8Ba+fwa2PKdMeZXcW7wx0ftnZ5hEVt2KO4YliV6rgnUYmgthQHeDicsiJ/ySDvih
         p6vUkgo4tKFa07OU5T1d696xoYXB+xdXijN4LxeDnAIDus6wYvjGErxFm4OvFmWeMsEm
         X0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuWAuH1wowDjhvVW6HJ7lQ9Lf3d9rOEXTjA61W3ZEz2t5NWo5AhspeWlUDwA+oTZACxMmEGaK5kNIPiFY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/5OX4ONNpg069ZGatOHki4WZ44wHONC3K+HqsUskZz4ZCjuEG
	DpeXYQjn3c/7IrYkww2Xhsj2c2Wf9Oz+9fIUYTDvtkl43bSigfHNO4DF56qtwHqoxmihTa37m1q
	yTeK52dTqVzjEWxvvkkhGYg==
X-Google-Smtp-Source: AGHT+IHah6Nqgqq9N69ws0DKUP/HTUx1alzkcwBsGSQWk19UCQk0MEnTOVuN0lF159yK8HSXoS8zbdDz2TvwiOw9WA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a92:d702:0:b0:3a6:ca09:6d48 with SMTP
 id e9e14a558f8ab-3a6ca09715emr1563885ab.2.1730836590276; Tue, 05 Nov 2024
 11:56:30 -0800 (PST)
Date: Tue,  5 Nov 2024 19:55:58 +0000
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
Message-ID: <20241105195603.2317483-2-coltonlewis@google.com>
Subject: [PATCH v6 1/5] arm: perf: Drop unused functions
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

For arm's implementation, perf_instruction_pointer() and
perf_misc_flags() are equivalent to the generic versions in
include/linux/perf_event.h so arch/arm doesn't need to provide its
own versions. Drop them here.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
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
2.47.0.199.ga7371fff76-goog


