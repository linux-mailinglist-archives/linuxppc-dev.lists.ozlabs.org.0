Return-Path: <linuxppc-dev+bounces-1264-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD71975D10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 00:25:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3wB23p8Vz2xjQ;
	Thu, 12 Sep 2024 08:25:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726093514;
	cv=none; b=ZA2oYc+bqw0TffzkQu76PIUMRA3Oqh5hmDMITiOiB9Lw34rJP/Vu4k910GuN7wLGXjBpucu0HVFh/MPQqXX2LfRcA50FUJPcY58pfF8F2oIh3BysKl+azcMFPX2lsIslV12gzqFIOvPZEO0SZA7Y6qVKWPmPwdkg2khRPIhQKgy+KhiUW8nE52ni3x4JmwFoGXNMciGDdbRmagVeVoUsBOcjozQWhScUhIxizET4qHWIC2iMF+xD2hoXTLsPnD02Or3GY5PaLbNMVfw3uaRDxkk0345gZDxRsgOVJw4326cL3N6V6u0A+nk+rs2OKSy7WMHQmnqWc/1JwP4kJCGzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726093514; c=relaxed/relaxed;
	bh=98KHHfZAU1dotPbU8K3avps0YbHY8rCmN7CSHv68LAQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Teyy+3CSFv+XlzE5fHfSf5jkE7A7sp08gwsp9wLIDcmSVpv6umPBYc3EjYFhA/o3qupbDZWfdWSL2yjb4Y8PBWiYvTNTYmvN40RRG1C9PN+JF/FE51eh2kJdpwQ9Rl6guORWseYehm01LRhLmvCX4NcGWCvN0zLGP3fIBRXn/girwvwe/s1jSQHduVDKVjG+k+BferqE2LPjWRPJwRmBGPbsDjyc0wHb7PpLOQFA0qkiVcxEVj80oFuCqC3erXVWuXmh9ZgFArFG9l1c8BwZ9VfhDDN1WHVSfYkXxqwkRru9EmEMVf0RCUg9pO3dWGJWhPPfQVFfHmelMfg/7i+TRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BLL+lwzp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::149; helo=mail-il1-x149.google.com; envelope-from=3xhjizgskdl0frowrqohzlvjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BLL+lwzp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::149; helo=mail-il1-x149.google.com; envelope-from=3xhjizgskdl0frowrqohzlvjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com [IPv6:2607:f8b0:4864:20::149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3wB203Lyz2xHw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 08:25:13 +1000 (AEST)
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3a050af2717so7248235ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 15:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726093510; x=1726698310; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=98KHHfZAU1dotPbU8K3avps0YbHY8rCmN7CSHv68LAQ=;
        b=BLL+lwzprbBxc7YptR6qqFL1gT4DEhGATSl0B/z5ypMjnZbkpWu9d404uxmBjfSbSv
         Xdd+gJNsijOpdKOWhN6Lc00JgDkVR8JEHiSoaR5Q1q5JkZ3c3GcB5MaKCxCD5NZ3uagr
         ESAWhlbzQyg5NhFQPwu+iEC1Jf/QxqCLBmtOIiU6jVGX1F6wSBJK3YhyzajqKLu//mdK
         JHrLXCaaxFiAKLzd5HK0N6ipZEHqD5F+tTOl5RaYbdWP5878O9e7sA4L9mFIh0Umnw2n
         GdUq+ULHzm5iVxnLGGFT6dnqQDNhvRwAfUwMGz+xd2WPuR72MQbEQz35lgcjhF7gNc7O
         NfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726093510; x=1726698310;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98KHHfZAU1dotPbU8K3avps0YbHY8rCmN7CSHv68LAQ=;
        b=rzusVW2Y7/aItbna9jHE0kWPLUKPpXc8nvn239ZGDB3WSBYlllGl0MoqMEhBjH99WL
         ZgqkHlXNMevm6QB82Rv0B3CCxgv89kKxLuXwKunD3MPgkzYn7TcYdGhlyzBGcJlFVoqw
         qxkcaBNPVf5+og5GwJOLEyIK3s7PEpM5ugNM8zl4o8TU0sDwWDM36WmPKWIyxxRTOaAm
         UC7cMyheqDrmFPbTxLb1fXlcgGzFi53ifMHedfLV4shwUKCcm8HdIH3iB7aRYLxL8lMr
         azl+bpwu87SdkNhQfCst9M41yzVqF4VosgE5EXuNFmIiIAfltGxLHcDAn2yw4JyAFXQ7
         uMbA==
X-Forwarded-Encrypted: i=1; AJvYcCWEGeVOLHNXh0uuo6kNZ3DYL/nTHooe6Svvxataw1Z3U4srw2ZrOpXgaPt95hBgba8u+ABpntmxAtTd27o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzne7iT1SlJDdd6qUeUW43OFATjydA/jsvWtlD1QMbJXe0Q6Kr1
	6KLxa2kbz06tyUt2ZeDy6zRtKYOMZHtUtjG4VzfQuMm0Ite646koNLyWcr+LsWhp4862LO//t9v
	8vS74izXrpfa7FWjs3o4REA==
X-Google-Smtp-Source: AGHT+IHezO/FS6DrvjzqydPLEapvMWYoVJd9AX1NthmyW6WKSgM57sEvRhPyRtAfj2mQLXNB4v5VRUm4UvpIqG0BYA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6e02:1c48:b0:39f:549d:e39d with
 SMTP id e9e14a558f8ab-3a084967570mr302085ab.5.1726093510446; Wed, 11 Sep 2024
 15:25:10 -0700 (PDT)
Date: Wed, 11 Sep 2024 22:24:28 +0000
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
Message-ID: <20240911222433.3415301-2-coltonlewis@google.com>
Subject: [PATCH v2 1/5] arm: perf: Drop unused functions
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
2.46.0.598.g6f2099f65c-goog

