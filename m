Return-Path: <linuxppc-dev+bounces-1301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CADC59772F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 22:52:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4V3g0l5nz2ydW;
	Fri, 13 Sep 2024 06:51:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726174303;
	cv=none; b=NuUHD83JeU4Zw5na1kGuYiUh04uaoN/DEtxZA0+J5Lx/uZSeMxioyd57fObjJRoyHbqNr/i0u7sumuBogXJ+WuZEtcOxJKO0dGlMUREBPYO7fp/2P0OzNfqJTlcIU1cCB+ZPDNW912kj+cwgHdLeuRTep6icxIA5w4B+6MZvTsiw7BWDSBU6rHWKQMRmjOvl3feEftOJVu+nG5JQ2bDU8wLfU4o18Fy5r3L00rgkybXN/PSZfAAqfXNHiy/uPtf5yVxrpgYWOLjk8+hFNUYi6OMCvsMJG2vyNb2Phq2foDnczqxMTrfmp7U0lX7CVud1NY78t1HO2RzOKe2/BVsWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726174303; c=relaxed/relaxed;
	bh=2R8Y3DFBOrXpT6Dp+2pnByuz3JsPwrzU4P/6bkl9CfA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AAfUflVm1KBvbv7gPNcvDkPZBd5774w1OCNdr5EUeRndtGY1RIUFfETswGOdtdGv6aG86LPpllZlJpYxj/5Dm6K1Is/xEmdyCYmWKBl4FKrVMW1gnc75NxxkJXvi+Fm8yndEPy2v8RuiKzrPv4hVdECUPYZBpwPhmrnCMDTW/hHYW86rOhpCMk9h6diuYuAaaonj2bvlUETDZRXB8sqKsIwgjb/Vymnq2O4n3uTXYag2VOYz5uCTsuMy3wOPyKxbabwGcyKU2EgLQZdbeAH+BOF3V9QlLahCj6fPZnfZ138EqDTwFo7tlY6of7hUp9mi1G5OQhDtJa5JVT60RUo+DQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rlT0T+bU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3w1tjzgskdm4w85d875yg2c08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rlT0T+bU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3w1tjzgskdm4w85d875yg2c08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4V3f4QLCz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 06:51:42 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6d3aa5a672dso29383627b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 13:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726174299; x=1726779099; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2R8Y3DFBOrXpT6Dp+2pnByuz3JsPwrzU4P/6bkl9CfA=;
        b=rlT0T+bUzPgQtR0OONMzCS6mCt/kHqm5V6mwGGFEG/Whrz54uyX9Ve7iIfVOGPQ8Ef
         uKdRfpH9v1i0/+LQ8U1rktvgEQlNpqUpjN8rqWEsTmfJ6J9cnU5Tg2l6MNUE4tKW7UKD
         CxzLnLCX3HxrnGzVRcULls05dbx6/8YwsXbH3VA1/EtHXdCdW4Omqt8xaOf9a577mxwG
         HXsR4MRSWfVCuKwOUH2fo/Wf5uxLjA1iTCm/AJoNY8j7Y4qm9qJewbYyE25c7QetS2dJ
         +wtXEi8Ymsc1b+mf8UwzMCWWK6rRVTfBG7KvsZ3tC2ssOJs4tpbi40AhJpc0mQmlfso8
         iXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174299; x=1726779099;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2R8Y3DFBOrXpT6Dp+2pnByuz3JsPwrzU4P/6bkl9CfA=;
        b=wwl3ZnAcjzIJAI9faD+9YW3hlyDUqa1cslaNC0ROyFIczhobWMIODrX75eIcpWz+qP
         92bKywsXVU/xOEC6+lMtbehJvRUaLA9uvLK0bkAWEthATj7+fgFmYrOtimb4WvpbSuJ/
         s6XcRgoc1t3x7HW21RkWLmOxtKZTWZhQicL7rYgzhamyXKUI8xA8At7WuY4TlWBwnnPz
         E+5wuxIPCEmB4rnMGE7L/s0Krh+q0+ZoZ/IUURoseAB2+zyTuzGXFUb/VqbiJ/0ZwPDG
         LoOwsind8liWJO5GositEZe9/pDzSiRk7WCIGOevTUj0ZdIdrZSUkx7so9LGyPLC3doX
         OEdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6eamDuAsBHnpXAqj34WNDuFDgdjpXRY1aBBY7Fxl8SPqjK9FaepP2UHHj6TI1h9svqAjnLmdztCQvF8U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YznT+CruTAKuRvkwHi8j5bBQe9gGITczarYQblFRGQ7tmdsC0G0
	edqQKfFuSd3AZ86jTwjJ0Ab0JIfwuAIrNJvNKSiCMFsvm+SiQlkJjtEp1P+n7U66b6sLGaB6pGr
	GYezCKGHYoutfLHGbpygRTA==
X-Google-Smtp-Source: AGHT+IFV1m07CCTdDWX2FOgecLasTDjDmm3XH/XZUgTEGDR6/YrsS27OTSnLSt+SciKeVBgsQCat9dX1tnl2/VgIOw==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6902:1743:b0:e03:3cfa:1aa7 with
 SMTP id 3f1490d57ef6-e1d9db9e1b8mr5314276.1.1726174299130; Thu, 12 Sep 2024
 13:51:39 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:51:31 +0000
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
Message-ID: <20240912205133.4171576-4-coltonlewis@google.com>
Subject: [PATCH v3 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
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
2.46.0.662.g92d0881bb0-goog


