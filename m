Return-Path: <linuxppc-dev+bounces-3154-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 546EC9C7BCF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 20:02:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpXhX5z8Sz2ykX;
	Thu, 14 Nov 2024 06:02:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731524524;
	cv=none; b=KBgbLCDkGYruZT7P86CsWpkOhriDwbyNX5NWrhqnTstcqN1iKQazifi3Axa0mtK8aoG2nTY4Hq92zBFP6RrKW82jmqzVEpTk58pTO0E67rp/jLPYQqDla9GC0JMfpv1LSNKrcmG9uHqeezpHtwHvL5CeWfF9QRXfJzIVYYXmBtacpqmE31pfx9FbJzCjxcQrX/PWsHHD7M0L5NspdOL66T/nrxliaXni0XpPYscvsvqkqiJw9Th6pe53kZEfNazpv1pCWOjRYdvm0AViRI3Iore8I+aEzhpZzniyDFxS8suG0QRQmst/hv520pKa0gYkpcUpa7IGF+mA3ETpj/g6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731524524; c=relaxed/relaxed;
	bh=Ps8myr2QRGzBkspMaTCSz6a/NGAbW5KYOWNi6Q8v63A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eI8O3dkXPQxlTguopo8eBtfH6et1HI8scuGvObSiX/Fvid5bn2lPXrWsaf+UKI3BxfcgoKhN1OmJPcDOrF5dH3fhGhjLfrRGNbCNWLbQnpnBaWR7R4i1V/FI/4tZBWHguFi44JGEy+6XXnYbg2guMHqRyR8uCaTh9v2QwGlyh0dZynQoem0koZX+NZXCJs26rbqHUs55c8mBy/TXEe7j6qPGNFqph5rU+Xv6C/BC3RlfmdGDCQNYW/8+MLBt7ROcpq6FF/t1SyiywuJ3FY9LiiAj2EnUe1/T/CP4fDc/aDeLnfvVgKzrWgIhaakW/yhIa9y5O5TT7HZHD55V3/Q7iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=grEFUzUK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3qpc0zwskdksnzwezywphtdrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=grEFUzUK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3qpc0zwskdksnzwezywphtdrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpXhW4B2Nz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:02:02 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e3807654d0fso891762276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 11:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731524520; x=1732129320; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ps8myr2QRGzBkspMaTCSz6a/NGAbW5KYOWNi6Q8v63A=;
        b=grEFUzUKN2MxkRFWDrwtYcJ0Mu7JfHY3GKImz2oUt27VKpQgSUtrlt4o30wK5sazgi
         MZ3EGq1TFtQJIXe5BroWmtlLY2A4oLrjaf1BAQSUQ1m2hUy+EATHYjNOE/ySnkvSXcCe
         qGUP2bDK47CyCpbyDP9AgO4fHykov6UmdwwuoaVHM3tfvMTXFNZpqzbslhxMVkNnNNjW
         KTwQ8Yr9krBK49jhf/oCSc1WWCG8gwaqic0b86utgtDIkv707ZKp+x4SVw8h5q0J2xx2
         Zrw+WA4Dk1k44qmeACpoafBiVNqLUPAbZLUXzgqNd70QTpD/CVxPy/d0Pp8W1vOLSR4y
         JxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731524520; x=1732129320;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ps8myr2QRGzBkspMaTCSz6a/NGAbW5KYOWNi6Q8v63A=;
        b=eu2mm7eOvxbXOsKlZ4g9n2DS2FN446J3ehzZ+dAtt09AsP78oAtNabXYQpqLkXdPLp
         qihKuXaEmEfnPIg+4h0mN/8adTaDz8O3pxAiEiNducUyHW7bYzCe2A3Ey2yHHCzhSyF7
         K4J3jj0zauRIyf+7lsww15WXaDo51+2FXMyz9QistJ5DvI5Bss/leAuRYSzD8d/lvtvJ
         uG1R6+X+A8J5tPdleIbuYYtewUAHrHpEeDOgjMSWEkvPpcrl1zYcy16afLn+uuD+th5N
         pd3AclvOZgkyQsooF1qIMYcBo6j7/ZmW+v5A7KtYTqZmsOv/UoTKfVBCuhVDSfkVDav5
         /kPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdlPoMyam51n6Ezelg3VmS3LYpwcJbaxzXorrERXQtm5WKaNdCiJOdxLwt3nVvkYMQ83BEMy8OmxX1z9s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxw4fve8rdA2HcxDO0vkuuh+ATeJx89ASH622pCUYnSY/hJsmgK
	yhNWN2mcVx4yEGEsxGpiEtIiWQqVdJQe/oVEXxhVi4wLoqvUkU+BAU3WM/enXN15/4oBdlcIZ5I
	wcOc/oQJXcIK+B7toQGoiaQ==
X-Google-Smtp-Source: AGHT+IGMwJxojcrbV2XaWtAxjGZhIMKLD/TWp2TYO47jqONg2YGViPdlhPH/gu+8jwib2jMpO8Gmgpa+P/L1ZLf8OA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:3349:b0:6e3:d670:f62a with
 SMTP id 00721157ae682-6ecb343d0b9mr2033797b3.3.1731524520358; Wed, 13 Nov
 2024 11:02:00 -0800 (PST)
Date: Wed, 13 Nov 2024 19:01:51 +0000
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
Message-ID: <20241113190156.2145593-2-coltonlewis@google.com>
Subject: [PATCH v8 1/5] arm: perf: Drop unused functions
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
index bdbc1e590891e..c08f16f2e2435 100644
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
index 1d230ac9d0eb5..a2601b1ef3182 100644
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
2.47.0.338.g60cca15819-goog


