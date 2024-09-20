Return-Path: <linuxppc-dev+bounces-1497-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0112697D95C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 19:47:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9Kbq1Jqkz2yV8;
	Sat, 21 Sep 2024 03:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726854471;
	cv=none; b=jsBk9qdxNRaR5Ahw1vOXuaMjVpQ9qmqWcQ8Q1SuUF3WYsg+WyS/sTAiC7FRHMZKxrSxphcgf39+hE+cltgr/jZHmoJaKcHRUAdJVWC0lVcji2OlT1dP6DWarJRoJyuNULT1Y2C/Bnmb4WbGfk+quIPE8awX0+ZIhRo7yxwkCdlzQ+c4kuu5UhV2jif7Tv8PfDNTW7RnBkCeNvZrwc6pYU1RiQINAwkk7ajQXhTlsuy4yMZk/vzoL82wCsVxNo2f7e1ZkyInr/WK9kT5vgS3dzr+JRSeRW8sDJndGaFb/j8sSrD+pFPCzF0Dn9EOom8JxzCt8BOEyis5ciGnkHX/Zjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726854471; c=relaxed/relaxed;
	bh=i5Qt5np/Ap8e8S56AX/TaOyn++MQC/aFN8Qv/OewSh4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GhVO8FUNTJwoXH5Z4hyqwoW1KJy2x9k48W1VFT7U6elUkcasbws5Nwh4Zd+jjcb110Luv1db8I1WdWIDA41350WLnHDEHD6TqzDVbSSk85A3o69iKVVS4uJLxL1ynGHiN1/jTBtnRW48sfQIag7E2FFe9YMIThUpysiOiFZKjaCIdOvjFpn3QSd3Yb8eZzoiwg/kRn1arqGEAKmw2/x0aj0mtsro9XqWat3tpbpu1f5MtElxrw6PhbdzfjwxmG9Bk6qCoCK9xDA0Rkm/Vuk9o3kB0qFGuSIHoWPvZ53dBedNZ1BDCbPImYVHiUKA+PSjB03oPiWfLZFKBnhtFZUCBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=18EHvx47; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3q7xtzgskdkieqnvqpngykuiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=18EHvx47;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3q7xtzgskdkieqnvqpngykuiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9Kbp4l6Sz2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 03:47:49 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ddd90f09d9so32772647b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726854467; x=1727459267; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i5Qt5np/Ap8e8S56AX/TaOyn++MQC/aFN8Qv/OewSh4=;
        b=18EHvx47tevpQuDJ9E2gP2zAaDpkWGCPm072nvVhP6k3uRjq3FC1GWjyXsFiVNKPzY
         KCBcGzY6jLLpuPtea1ahXQi9Lo5ouONG70380qOePLThmm+Cx49/oeUsDcyXsXeZRpCL
         7pt7n80sH1WCwaQniy/QgPhdK8VGFRZDem6ESfD1U6uYmmQ2Nb4sMFP5GuOU9YS5rBky
         7+qfKYi3MPlNf7TS/in+8Zh7o75d/QNqWaX+zDcUIibDJ/8i6Kl2sZQQEjiH4AApNNyN
         O8TPxZxKOyK/A2DjEj/lIgJvKl7P5yhG2Eoy4WdUp1WHvY0IcKqAYutJIkxNXmnudxaF
         IEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726854467; x=1727459267;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5Qt5np/Ap8e8S56AX/TaOyn++MQC/aFN8Qv/OewSh4=;
        b=JIXRbBxmjiPMt+OI7FdZKYFRIVUYyJrw3gD8SRp7WsPq3wHyxnjcXcHjJI69FykOFm
         eDR0OXyeNKoo05YxfHW0SExGZr6LJ93WIeH+oCZjzy4QGvUw0j5OfwUDSxy1hYzuw6Ze
         pXd20WvuCYlS/8xN6clAnbHq8bcPkRqsjMtmgjvMPCIJ0C4L6xpBsLmvKIxVnGx4nOIF
         qraUH5TnOMNVgUcmgTDvdtzOMBXmkNDG56J+4s0AsYEu2qyyMBwD3XJh9Ax1Zrogol90
         Rk0k5+oNXgCIDYguNCcUg653Gyteg6uV40+hmh1DavecwGJMXPZBzzMXEQCCFrslwTr4
         pOEg==
X-Forwarded-Encrypted: i=1; AJvYcCVEFDdTSWENSAOoZW7rGnY54crdCYaMETTg01PXjyKWPjyD3eZQSbm4/mZUPI2cqEvsnUqxPe9kHxVzmns=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzswHQwNkNwaSE24tXIZbpuxwkSRSmOhfSn61soxIIySiZbx7iK
	z7sq0YWcGyraqOSYBDVgTvWM9HLhZFjRwfANI85pFOYWyX6ztSQKbUAFSWq/Lff63QTJYeVgkB0
	fh8Kr/zdgo/cd2CopU5rTng==
X-Google-Smtp-Source: AGHT+IHbJ+HRIEkO5u3cDhpGgKAhQ1szUZlm5tAMnmYkXHJJtXJeplzJtZCUnHcEvMXwbAUs2nrn0eCuaSMxzmED7g==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a81:c803:0:b0:6dc:97eb:ac51 with SMTP
 id 00721157ae682-6dfeeece207mr233927b3.3.1726854467532; Fri, 20 Sep 2024
 10:47:47 -0700 (PDT)
Date: Fri, 20 Sep 2024 17:47:38 +0000
In-Reply-To: <20240920174740.781614-1-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20240920174740.781614-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240920174740.781614-4-coltonlewis@google.com>
Subject: [PATCH v5 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
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

Make sure powerpc uses the arch-specific function now that those have
been reorganized.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
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
2.46.0.792.g87dc391469-goog


