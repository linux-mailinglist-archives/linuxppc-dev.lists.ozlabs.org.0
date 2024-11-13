Return-Path: <linuxppc-dev+bounces-3158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A9A9C7BD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 20:02:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpXhd3KZ9z2ysW;
	Thu, 14 Nov 2024 06:02:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731524529;
	cv=none; b=FxAvCIptb8+Cg/mYcga41GQG+6dRfwdGaHRhUqaG0x7ahtwCaOKproIR7jLfbEWsOZWqLQJAfClzXEymEjmqq9nvnGVjPtPcz3qPcOSn2RG/gsCR19GdFwMfGqbW8abhvChgpfQlVRpr9SZV3o1hfyWoJThKUgkGRe0M2DzUs9R7k3q//RIUv8A/L6PyHPrxkLIBdnL5QOHhL2mdKE2jDLvNJBhPK7TkPTtSF/0L3+Lo38lOZbzltP+ZGyelX5UjrGreO8pc08P/kESOAilKBSL89wOLGgZiH+VuzeTedQ5yZZkB59S9pSFaIqLeU4yEChZz9AZQJn+2r1HfuTLm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731524529; c=relaxed/relaxed;
	bh=QQFdXgHR/yBinKM9akC7F2JFw2+gnKw6F8HpNI5yy4Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YXIfpmoX9rWmciIoR/+giWh+o8Ys489Aq1keyV9ie3wBLIUg+CoqNWHWHSyPLDwRdx8U16u5uIHlrLB9ftftrbBK/RAVaFffMTutl1jWXpzo+QsH4+xPgSySZsIPadfFWR/CmSLHJX2RJM8Xt9Z3f9gNYLfeSfjKkYgHeYRmKIv4oAUGHTXSI+l9MZOfePbMYWvC2yCPwzRhlzVzf891bRiF4jiNhOFsT/F3dxLy/mUjRsJQV202bTMwP2Y6S0xRlLlQt1I2Yam/gkfvaoA8Pj7AE193jJWUm43iRS/fNR/ZaaRtn8dhVtywYDBUcbMv45QPAN1zNsSJj5XCzQGi9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BJ05xKar; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3rfc0zwskdlasebjedbumyiweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BJ05xKar;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3rfc0zwskdlasebjedbumyiweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpXhc34Vjz2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:02:08 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e32b43e053so93627057b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731524525; x=1732129325; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQFdXgHR/yBinKM9akC7F2JFw2+gnKw6F8HpNI5yy4Y=;
        b=BJ05xKarc0V/7oX3CLRWSes4zZKD44l9MjzqxZ64l6RKt5vum4oqVRE3aaw3euCars
         FEL5c60I3jZdEnflFj/mOqW86/rVH79syXaegTMmTcW1K3TFKPZWv2XFNQOlu5rl40SB
         zxzdykI3gshZTqm9eaAw3pha0OwP/cEXMmId9Xoo9lgPGJHJNRzbsKQ4cjeZxi94zAqs
         MOLB6TPk/watqfF9eUMec3NxaEC47il0TT2orTGC031A9bxklX454UczpNcbYxWss9NR
         66u+V7/dhEZ/qAgL6hrbs0W13gWgnwPO3OdoN80aWXzAo3Qjo0TywIfGc0xJfKBIxxRX
         p9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731524525; x=1732129325;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQFdXgHR/yBinKM9akC7F2JFw2+gnKw6F8HpNI5yy4Y=;
        b=MxuFBPROrJLQKSkt5EJSGdbT0W0X+WP/58VMc8wkp891ZlvqZnXd9/iV37sqlCu6MX
         EEWFXdXlM3Yc9LvtG0jmbE7zPzYbjNTGNmgxEmPpRLyB9CCT1qXEQ6MYurPBtIveafrr
         E/1pMUinvUtKMA85LX5CpjofXBIycEjD3pOFt4nCvV0jX0+pWbzdvW45mVv7PpXvdyIW
         eETYCFbf/r0CCwnChSr6Wzi1WorPklYJogo4z2voaVvg09p23IDFPIdQdZIRHxSh60Q3
         Hqod94V/JI27uwg+k6yrEJxmkqfQI2gGCkgBhFOwK68Q81MHUZbTw0rpxgLO6J7qaV+7
         +pyA==
X-Forwarded-Encrypted: i=1; AJvYcCWXvOHtA/iUO4mpx/F3WE8Bswe1lkuRepBjutqvPjDGTz5o/Gbk05yaHev98ZwH/HrEorUOq5nbkv4FncE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwRjEAnhoVV2zz4Oips/9sf/lXOwkrdCn+nH/5vTm2eF2JhGorX
	RPY2viI/a55DOr9bdc50W1lKijv+DA+hYQSng/RViprvCl/oj2YoP14pzTHWXeP4N6+MLUlTIke
	uUg4nxGmHF6r1Hnk0kmjnHw==
X-Google-Smtp-Source: AGHT+IFhulDvoY0sGq7EYnbunXmF/EqPCQ3tEG2uX7XcBCI6dgYlk8NlhbbJtWap3voWbgrqyi9w6iV13kRImFawvA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a81:8a44:0:b0:6ea:e011:f122 with SMTP
 id 00721157ae682-6eae011fd7cmr1805147b3.5.1731524525438; Wed, 13 Nov 2024
 11:02:05 -0800 (PST)
Date: Wed, 13 Nov 2024 19:01:54 +0000
In-Reply-To: <20241113190156.2145593-1-coltonlewis@google.com>
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
References: <20241113190156.2145593-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241113190156.2145593-5-coltonlewis@google.com>
Subject: [PATCH v8 4/5] x86: perf: Refactor misc flag assignments
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

Break the assignment logic for misc flags into their own respective
functions to reduce the complexity of the nested logic.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Acked-by: Kan Liang <kan.liang@linux.intel.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/x86/events/core.c            | 59 ++++++++++++++++++++++---------
 arch/x86/include/asm/perf_event.h |  2 ++
 2 files changed, 44 insertions(+), 17 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index d19e939f39983..bfc0a35fe3993 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3011,27 +3011,52 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 	return regs->ip + code_segment_base(regs);
 }
 
-unsigned long perf_arch_misc_flags(struct pt_regs *regs)
+static unsigned long common_misc_flags(struct pt_regs *regs)
 {
-	unsigned int guest_state = perf_guest_state();
-	int misc = 0;
+	if (regs->flags & PERF_EFLAGS_EXACT)
+		return PERF_RECORD_MISC_EXACT_IP;
 
-	if (guest_state) {
-		if (guest_state & PERF_GUEST_USER)
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
-	} else {
-		if (user_mode(regs))
-			misc |= PERF_RECORD_MISC_USER;
-		else
-			misc |= PERF_RECORD_MISC_KERNEL;
-	}
+	return 0;
+}
 
-	if (regs->flags & PERF_EFLAGS_EXACT)
-		misc |= PERF_RECORD_MISC_EXACT_IP;
+static unsigned long guest_misc_flags(struct pt_regs *regs)
+{
+	unsigned long guest_state = perf_guest_state();
+
+	if (!(guest_state & PERF_GUEST_ACTIVE))
+		return 0;
+
+	if (guest_state & PERF_GUEST_USER)
+		return PERF_RECORD_MISC_GUEST_USER;
+	else
+		return PERF_RECORD_MISC_GUEST_KERNEL;
+
+}
+
+static unsigned long host_misc_flags(struct pt_regs *regs)
+{
+	if (user_mode(regs))
+		return PERF_RECORD_MISC_USER;
+	else
+		return PERF_RECORD_MISC_KERNEL;
+}
+
+unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
+{
+	unsigned long flags = common_misc_flags(regs);
+
+	flags |= guest_misc_flags(regs);
+
+	return flags;
+}
+
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
+{
+	unsigned long flags = common_misc_flags(regs);
+
+	flags |= host_misc_flags(regs);
 
-	return misc;
+	return flags;
 }
 
 void perf_get_x86_pmu_capability(struct x86_pmu_capability *cap)
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index feb87bf3d2e9c..d95f902acc521 100644
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
2.47.0.338.g60cca15819-goog


