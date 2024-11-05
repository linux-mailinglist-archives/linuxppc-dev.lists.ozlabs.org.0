Return-Path: <linuxppc-dev+bounces-2885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00C29BD643
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 20:56:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjfHF68Rrz2yst;
	Wed,  6 Nov 2024 06:56:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730836601;
	cv=none; b=N88ib3Icx6e+WtB2qvW5C9Ko0l9c2b4UxBF01gyCPQA47bNMRKC3ix8JnDhfMZC40JxlsVW3A5QfhCMmZQjY2YD6HREeXNJzuaISLPFYu1b1MArNknfGScxEtzMZYPflkeQdlNY+pyHONmpAwpSXX+W8YENNUsnv82k6SlZbQofg9CRMJ2ANDwM6tDzDzgme3HacNr+aOi6ey/PBxd9cRRg4BAs9jOSbqduzwsLe7hF2ktWgWDwKCshMMTiKqXdPAvMubgxuZtGrTlI4EGmGqXezBMgK7R/YS40JVQUwWDbSR9sSVr17/A4XCfcm4R/NG7M41Kt2noJTqVF7W1gnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730836601; c=relaxed/relaxed;
	bh=sW1pAHD8RX7fvQhBgDL/ivZoJ4MMiFBudzlwbhbqZhM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gvmVx8xc6HaAvOEWa8bwr+R1bdr09S+HcbGchGTm40/tCORPmAa7s1l0DPIYmSBDKvH7qIYw4k5lu37SRR9WeNb2LmmG+4FsdRe3+CnE+rOS+8lNjU/dRpKpi73GaL2D/B9iKAReejfNAj4H9dbTIPPTk/vVPbkw5aaZprA6FwBK/DAGuuEBg/kwBxVAa31q4+NS+98T02yonYojrLfL+GT2O7DWv7nfsXFdZ/K93+9sa/MePfPEfR2V/6wjGlbzrZwAsyRT7OnI3fq9RuwH3jz+6OMRH4qQzk7BqgCaU2tWxSA2Jno3z4Oibs6JUVqBpVb4ZDGMmvzVpIH5UF7kEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tY6r4nP9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3chgqzwskdesp1y610yr9v5t11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tY6r4nP9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3chgqzwskdesp1y610yr9v5t11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjfHB58sMz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 06:56:37 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea9618de40so43428777b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2024 11:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730836592; x=1731441392; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sW1pAHD8RX7fvQhBgDL/ivZoJ4MMiFBudzlwbhbqZhM=;
        b=tY6r4nP92f8dLeMHUrczWS8WBJgGi+QDKvH9OB06t+GUQeHDmcwTCva4gf8BURURgO
         YMHEvNXh7mjm7Vz4tyTV1/+alVCAUUQV2sfBYOlBt96Tm0xtaIGL/yQHVPyDbziABbfw
         gvF8KGE7m3C8ovwu436mHgtbPhq9/mhLKUBitPuNQzU56c4C2Me3IzwbRzok4UpmLIsS
         l/ghAZAQUatfdncFjiy0/JjzWTXqCpeedBuUmmA1Y0KZ+gwma20DXzENm5f7dTF7VUxD
         d7UawUQKj8M1wL0Fk3AwocIUOfAR3iU1vzuyf3Geq28m1yUe0k5kXcWxri4mbQPuP2NX
         qgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730836592; x=1731441392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sW1pAHD8RX7fvQhBgDL/ivZoJ4MMiFBudzlwbhbqZhM=;
        b=AhovrL7MmMjD9Nf0W81n5UWt646hSSLjmBzfVlKtx57Ipo/H/s1v8D2hZ9sMo/+1Zz
         lWJBsYoREGHaNYmqKkfsh5456ukuxOWSEJOQhLx/GU3btyPTAQ2gkuCq1KzxXwyvTqtx
         eLkOKLNGisVqX9IX0CsYcPolg4nhZ5rGc7Z9tOU2O7C6TYI/FYImiYJaLaKkPAz1Nh+I
         a+TtQ2X91KOHByFvGGw6UWZohWY/ZI4m84TVjlto2eF9HhvoZwmTalBT47ngFhFaLLhP
         yGs0eTepQFN8ktvU9h+pt9vBu5A3gzeqDx5tBTK/TIYS20TM/1YTXdt8RTHzKrHyGEAy
         PoQw==
X-Forwarded-Encrypted: i=1; AJvYcCWV0mchIbI8l0Q/uSLeNOLufTtkA21cZGfwhq+f4WfjNlRfAA5UodVHOLy0aGRLkRsXj/duL5BVeBDcMn8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyI1o+NyK+E1JBMruhiPdOfycRSI5hddbCcCf560p7cyEz7nck9
	ftn2MUQF8a//usqPRo8FiQ/D8Xkhb3RJIMdRf+c/X1GHicfP4tKhjCQu22I8prx+8+b7M98+dt+
	MctNNLfdRtbq/+VxI+RMwlw==
X-Google-Smtp-Source: AGHT+IFe5esZfmV8PpNtTKhf67GNSznritdlgCuivBreGx7Lwrw/eQ/PIB8HLPh/Mq6jxCM85J+7ZrWnfVuJw3jbsg==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:4489:b0:6db:c6eb:bae9 with
 SMTP id 00721157ae682-6e9d898f08bmr17263797b3.2.1730836592357; Tue, 05 Nov
 2024 11:56:32 -0800 (PST)
Date: Tue,  5 Nov 2024 19:56:00 +0000
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
Message-ID: <20241105195603.2317483-4-coltonlewis@google.com>
Subject: [PATCH v6 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
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
	Colton Lewis <coltonlewis@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Make sure powerpc uses the arch-specific function now that those have
been reorganized.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/powerpc/perf/callchain.c    | 2 +-
 arch/powerpc/perf/callchain_32.c | 2 +-
 arch/powerpc/perf/callchain_64.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 6b4434dd0ff3..26aa26482c9a 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -51,7 +51,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 
 	lr = regs->link;
 	sp = regs->gpr[1];
-	perf_callchain_store(entry, perf_instruction_pointer(regs));
+	perf_callchain_store(entry, perf_arch_instruction_pointer(regs));
 
 	if (!validate_sp(sp, current))
 		return;
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index ea8cfe3806dc..ddcc2d8aa64a 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -139,7 +139,7 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
 	long level = 0;
 	unsigned int __user *fp, *uregs;
 
-	next_ip = perf_instruction_pointer(regs);
+	next_ip = perf_arch_instruction_pointer(regs);
 	lr = regs->link;
 	sp = regs->gpr[1];
 	perf_callchain_store(entry, next_ip);
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index 488e8a21a11e..115d1c105e8a 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -74,7 +74,7 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
 	struct signal_frame_64 __user *sigframe;
 	unsigned long __user *fp, *uregs;
 
-	next_ip = perf_instruction_pointer(regs);
+	next_ip = perf_arch_instruction_pointer(regs);
 	lr = regs->link;
 	sp = regs->gpr[1];
 	perf_callchain_store(entry, next_ip);
-- 
2.47.0.199.ga7371fff76-goog


