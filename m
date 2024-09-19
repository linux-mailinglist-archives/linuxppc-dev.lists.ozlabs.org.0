Return-Path: <linuxppc-dev+bounces-1471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D14F197CDF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 21:08:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8lQw3s01z2yM6;
	Fri, 20 Sep 2024 05:08:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726772888;
	cv=none; b=PxwhYd4Bukqldd4/m+vPLNiiqvwX1PVCKq3k196pfzWJLBGR56od4+5sLw+HIubh78nTOU/cAQA3gzZKEIqOUkqUPr/l0hDweHcKq6AXg8LJx+vXXFiydZOuyWzNLv19fBZx1i+DD9dajUuDyta7kj1wpf09FZSe2oNRXg8/Wh+1YDtdGYipabgkSEYSplAH/YyRe9zU9PHCF7KbgP4HZ0Xl5y1lGPFpoFg5ElHBVyNghzRKcpH95WAJCui9qEekV6IRQK/HYKdNyWhp4mzhxOW3lk0ymL5g405wY/lTWMAgEoIzi6JDgdCIcz9MOlDtpVXeeBqwwN2BL2LzHdVbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726772888; c=relaxed/relaxed;
	bh=1u8+tIRQu1/+Yzznd3YfSwPNzKiT5HV8vjSuz+hJEoI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q4oEYNx8zFn+Kbaerv4eKMQQV0PqaGSm/w5Adn5QbPCDNO6VF2KK0GiTqs4gJD9t9xHeIGU50qD/5Fu/8WHkAurlTgHDNJU4z8Xmtf7Q9vHDqF36h9q112mARa3StkwMalC0IFtVbCArPSqvOi/q8KSeJr2a9EtV6+6jYi2KffGzD/9bJ4lgGoeUBpafQCJjuZmJYPCCXgRZQdLbKZZJAwYMGY7VgrSPpDddJ6KqiVNpRcnbNofHNSWtNsgbM6RZyv1I0G1FdS578MGWySLyH8sXY2yiHLWv0d1QqznbqG12pK45N4QMWPwzCHYtEt29X9FpigOz95qkNsCk0Yw3Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hCWLs3as; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3lhbszgskdherdaidcatlxhvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hCWLs3as;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3lhbszgskdherdaidcatlxhvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8lQv6T1tz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 05:08:07 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6dd76da165bso21667777b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726772884; x=1727377684; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1u8+tIRQu1/+Yzznd3YfSwPNzKiT5HV8vjSuz+hJEoI=;
        b=hCWLs3as3QBxtj3IKtCZ4AjAVortqsJM2qa5CvcF2MqUE4HSWnYsidXtJw2G/eIvJf
         606XNjaxZlKyrkHOoFFw8UxDeXVn/uc6r1PPfSOM4y4YuaV+YSMdNOMbuJ6MRvyELYwH
         5rCTADctDsBgCJ44RUF34KK8x6qTBD0ffxaIGrw71KHnpb7X1z/wiFtiJfgRm7PUrwW0
         tVLbtGysnI+wIQLsTB98AVZWpGQZ2ffYfDfT9iVKyX3kWE9EFwuiNdhezMV6CjZZ6oPY
         Z5xaAxTx0HGbr1dU+R/A+v3ZJlGoyr9nY8KzcPZ9ShL9qscamJgKWzOw4jIdiPgAQkGb
         dzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726772884; x=1727377684;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1u8+tIRQu1/+Yzznd3YfSwPNzKiT5HV8vjSuz+hJEoI=;
        b=sPchHz6AUgSi2dl7XeFlPmfdTkayIN+QfXR/Ip7SEc7Zer9GHA/AEv0I1XPPjW2F4C
         m0LZbC+ByLiud5H7qEKREayRvgwuX++BfzMMxJzmOBB+0VQZbkJEyPuzmDbbsnxD/HqQ
         qo40MCzgzbLJPo1X9bCgb3ZMU92ExXXhN21b19zTxwLzyfBYqq9FsrEaLrIjtM4MnZZU
         200X695QKVfDzU7VnsXBCo3WKk4Xype98Vj5ciCnxI8Xg0jhsxNY79jyqCObRKDiFGY1
         e4XgI1AlGsm3ftl5WeDpFLBapUCMDv3RngqUyXRV8v1LcUjRp34maU70n4k0Tay89Sq4
         UUEw==
X-Forwarded-Encrypted: i=1; AJvYcCW70idvni0XvehMAJiXHEBlmkY6ViQSV4L1rMyuAnfOgC8Ev58SgnqqsEZICHR0M8pKdkgj3bC0NNL190Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzHbvMKuQAEjBDMRcoO8COrHyCSMTUxYO3Cf9cNn0YQ60RKyFfp
	Varw7mBOkr14CdtI+Pkqpnqyhd2LUoXxwcaAvLTL15vGQXkuyfWHs8ZVHlHiepwfoPwqkwfVEww
	Zt6dD2uxMiRFLynDz1X6yeA==
X-Google-Smtp-Source: AGHT+IGDiKrctQsFm0erPBgmwBCKnufFRGsSs3qB+YNCGyJVR/2h6144NBut+d+5hRqNGNQ/pKN4LdcbFv0AmZEt/Q==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a81:a88a:0:b0:6db:c6eb:bae9 with SMTP
 id 00721157ae682-6dfeed1dec3mr31057b3.2.1726772884551; Thu, 19 Sep 2024
 12:08:04 -0700 (PDT)
Date: Thu, 19 Sep 2024 19:07:46 +0000
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
Message-ID: <20240919190750.4163977-2-coltonlewis@google.com>
Subject: [PATCH v4 1/5] arm: perf: Drop unused functions
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
2.46.0.792.g87dc391469-goog


