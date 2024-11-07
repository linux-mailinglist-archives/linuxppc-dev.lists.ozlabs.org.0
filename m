Return-Path: <linuxppc-dev+bounces-3014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 748E49C0E45
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 20:04:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xks2D2tJwz3brP;
	Fri,  8 Nov 2024 06:04:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731006276;
	cv=none; b=Y8+G/bA/ywQ1bEuOBTSaUu1MLZUtTLyfTHeNymZ1MWyKc7x3kiqQN1dig7qQJ0AOyQvv8fy/oe5oT9cPljMLeZYJrKHRy6fANGFTpm7uJt3hVUsgRHiFzGWNCmLdU1fCri5Vpc0A9YPdiBX4qWtznA7M/rSOd7vYT4QnNIoQ3Z10Kum+9LU4GH+HJc4DUbRTZ4wyxh1lS/rIlhMR1cFhkUsoggkzP1oo39IScITMLgVMfO0yKuenTOk+nrjTd9Gk14RMrzDS2I5RpGJBnuuknV7o+gn+7U7CxrknIX8b1K1dUiV6m4LnL/f/hmI79uOTAi/jnI8Nm+QVBSoT0j+fUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731006276; c=relaxed/relaxed;
	bh=wi9gi3l/lEEfoRFVijXJDElnYTy8kzLmpCkQO/xthe0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oq94u2Yc2pHZjUCkNvnuLsUwtlcY/hcBWaP3TZJd64PfRVVUhirzqRk6GlW6LbpBxrx91pvFq+oUE6w2SWedeOuTUy+XW5UIqTy09ie7Ro2yzAAaPSiwR+2to2u8w7gssMQMZIFyoEVx9PNnSleSY02RBbsl/SN6TpFlA19BDUGnqfFFKnyA6rc14cZNDYA9YX+7stzxjiBqnRbw55kCT9iGN+GbFwYLT590WRu2dr4mJlmgB2bz+5nti5ltNihj7fqJzZH/cXredU7stBYR95WPT7nSXatuF4lWqvYnh7mhO+n5My+5npKOo5rgTjN+xnoPnokz+nLv2z2dWcpSVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Jg7FbIF+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3oa8tzwskdesp1y610yr9v5t11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Jg7FbIF+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3oa8tzwskdesp1y610yr9v5t11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xks2851Qdz3bq4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 06:04:31 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e29135d1d0cso2114909276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2024 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731006265; x=1731611065; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wi9gi3l/lEEfoRFVijXJDElnYTy8kzLmpCkQO/xthe0=;
        b=Jg7FbIF+ta52EAAE28TJnHCQS9Gbteg0+fo7K5joUYBkSnnYj1yU1iUxUoOa1nPMcO
         YilFWnWoVmx1MMryc13tdeRL91G/luGSfYY4o9Kmdq5hAQlzlnXWiQ4yRjtO/16inR8h
         hoyy9l7JgluObBXL0q5AlVArrHFwSR2ANZV+iJwsYd5KSmOUTk1OJwWGc8EkUbcKZ2nD
         +ddXjHOOQFJ9kK8RnDUZD3B2/C36QhVw89aKftydaLuZsU1bF2n9rJuThOyZXj4A/3Zw
         FSyKbku7vv1clpFh+Leup0750mrZ2+uzN1RBSSalHBbM4tJ+bdHuDbtlC2EONTVGOg50
         BMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731006265; x=1731611065;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wi9gi3l/lEEfoRFVijXJDElnYTy8kzLmpCkQO/xthe0=;
        b=rSEIH9NGIMuqXJY3KM51b5LKDxU9WsxphpGoQYRQNBsF42N+XeLjjN6jDCGdk0k9I7
         gq+YKaVe0EoTNS91PLbP4Iv+hZ1bM9m7+kGou4l/VKpQIHoNPXLVEwQd8Zv6YreeKnOR
         VHva8Yuny+mLQQtkoF8DpXSRdV6TM4S68LyT6NUjF3Sp0JFaPsFb3Re1tg/y802ygc6a
         jciNVymM8fwVLFWqe3qhC97NoE9qkEFzMcOWGjT01Yh3MlEsPCr4jQ7APfrA24yctdfs
         u+sXoatsCKjAcdVepijvBz8qZqkQavtyCn2mgTjKR+Rml3fn86ujjnbo+T1PyRZtIDfu
         pniA==
X-Forwarded-Encrypted: i=1; AJvYcCWqLijoalzyrpP+Q/nSvXPWLLeYb63Nz1UURg1cLj0sO5VYBDQE61y4Hx2zbEBrDnPj+zWY874f7VFUAms=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxngp5jpjp1k+YiWn7N90Ob72xGM3uIbiCMnXOHCxuZ3hTPpiNb
	5tv329Eb+kIq8yM/JzSd/eCFdMD+w0LPoDtWezio8wRVGDMW6p3YkW0MHIIPT7StvxDXQrgvqMx
	FEPS+Vt2B5Yr8K6XNR40yeA==
X-Google-Smtp-Source: AGHT+IEKv6NpZXqhvRfRHQ47kqAQcfmWLHCmkCefMOP8XuPLyyw7HdRAVBxL41mFzSkxgn/PcAHTCxi3L5lNVg+5sw==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:2905:0:b0:e28:e97f:538d with SMTP
 id 3f1490d57ef6-e337f8ca9famr44276.6.1731006264559; Thu, 07 Nov 2024 11:04:24
 -0800 (PST)
Date: Thu,  7 Nov 2024 19:03:32 +0000
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
Message-ID: <20241107190336.2963882-2-coltonlewis@google.com>
Subject: [PATCH v7 1/5] arm: perf: Drop unused functions
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
Acked-by: Will Deacon <will@kernel.org>
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
2.47.0.277.g8800431eea-goog


