Return-Path: <linuxppc-dev+bounces-17928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE1gMlgOr2njNAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B5F23E726
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV4tf5gK0z3cC6;
	Tue, 10 Mar 2026 05:15:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773080122;
	cv=none; b=VMZnYlUPx4DoYc9lDL33oIl5HbivZNZ+Z1n5nySlBNYmJs7Lqa8puEUd0T9oaEipnB2nmlQytMAs0fBHBUqalNjQbvKNUjylnayIgVj4KNo3k+gyU/jC+Kb+U7xCgxs0xQwTZm7wbOES4p/K0xrO9x4FvhaBaEGO9eRqa2f5B6b0b+Qa8lm/onjAfUV1Oq3GYbSM7yr2N+ci37b/dEOrc8WIjIUff0fgndcj0W+bL/d4yoCSxKvdPrg5pLRKVXHcnK5wkSUMhKbg8XmnIgXOERvrSbiDYn8PUK9HwF4TZSaRqHMixr4tmiml7TMrkkFc7i9BUKt+2Tw1ujdeCuWcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773080122; c=relaxed/relaxed;
	bh=sf1808K4E1aj3snk4hWHuiCZb75Q1PzOGtds/ACRiq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOUQX6PCB+/qeD3vmdo8ffH5dYxA2nfhDJ8cNPnyRrEoZKiNIEfL+29mRnaU4KJf6JmafHb8lyEszEff2kaooYRiPHfrKqdVtLo0xRJr0m3EsmeUI7S64QGoQ8wlnsLgJ4ur3wzufP1PdLLdWAqp7X1TVNM/gZtsXoxyCqsVbbPzfpG+xaJwtvLsjIIGO6kmCGhz4jqXIKRqpbQGG7SUHTSi7t28SPZNNR3akXuefOOEO+PXxq9+d8maopS927zqrbtLIpJBsZzNImqgCOIuryZuiIYAh5cmlRRbgb5wO5QQ7lCSQHUSoqDnX2J+3WVaKwXO66p3F1Tz5qkXCaf4dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ahA9wfGM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ahA9wfGM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV4tf0TpNz3cBW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 05:15:21 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82990763921so4074282b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 11:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080120; x=1773684920; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf1808K4E1aj3snk4hWHuiCZb75Q1PzOGtds/ACRiq0=;
        b=ahA9wfGMQyzQp3qSpoa9QsOO9MzJ7iamvdWki5IX8RmCAvewqm/XzabWnyeGy5P8QO
         lR92S8mn3iqCbvuhGTjAw+Dc7DnFAu37hcgrKWbBvdm9xLHGFjpzwQo6Cm4xaahxwpsW
         F6gGVjOV139JkbfCg9eF+RRi6vWEO1MZxwURbPMbxx4KEL+N0P4kv7T9kuJgRWO2deI3
         gCgdVCAr2Lqf13I8Zo59xeatx6ZlyP2OQZZR7t+lcx7Smcpd7MbAQcDX3za+n1pcWT/6
         8MWs2Omws1gozhlGl5fv75Kc+SNYl4l6JHVMd0hb/6LkrtskhPdgDngiCGPocUhB5QzT
         geUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080120; x=1773684920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sf1808K4E1aj3snk4hWHuiCZb75Q1PzOGtds/ACRiq0=;
        b=bnZ257nj2sPF38VKqe4sJd3cyZAE2JBvBmNeAbf/kBbtwZq97XGLdp83ul2yHxMNOk
         irQJ1h/+MB5QwlxUtTeOt1niaWuySXhG8rhvrOcJ7GJjDODIn3byhSq2T36V+nRb8Yvy
         C4ykg+8jt9hcqL5J/232MT13meZ8VZ0dQlVAZLWYYJowi0+wOvhYTHUSwsiumenXalXu
         PgpCm+AfowD3gcsBv3bvvFRWjvgCmKec1dhCnDOAg+YCm+eR4/pVK+drjDMZxRczctCV
         LrEbsy2AP9Pb9pIrSvq+867o1cFinwn6xzfHWH/JQFWqve+z+RHPjfiY0mVwTqfIlnou
         lDCQ==
X-Gm-Message-State: AOJu0YxiIV0qvUqIbGmrvfdKcCifhU5Jc04eLYzVL7T3a5AkNYlihiei
	Btx76TkDN0RcrGjBrjisnJSNVTycOxG4hI1OQePkkuOL4/6RgLeotOpnQIb/7Uh6
X-Gm-Gg: ATEYQzzTrCjzdLuKwjh4HiNI4HH7D6//LxpxoTVzdxMpp+CJ9PcIhdboHmCR0KEocxk
	TXqO2qwUdVUf83kUNtFcwJYOes0kegwH/6V1IVNWR1nfNpHqTimmqk+rh7WJhzXuceyVP9hEDSB
	8qfDj6LQi2fFLoWtZXjUwQ82vKIOxtCdaoda3L/EyJxuKPjlANTbOtfsC8Z13q8iPuYPgEyeNtt
	LPRNfmjE7p22WMlV9/0CJZZMBuHGC50bkotdHhXe234VfNzyF/vBHZvjftRJRfCgMUcUFZBZ8/0
	hS300dvZ03NlXXABaIlwz6QgrSlZvgb3ni6I3nHamcbU/MybpBKfIamODxraVJMWWMzHliquU2C
	JJMQVix6ALWqvOv0hf2QVKvM0OWT7astEIbta+h1j1eHR8TvtDpmTn7JyG6KtTeI0eQFUI5+VZv
	6tC4ZXf7Hag8ghNlpzGFYx/k9BGPbRwXLcB68vj5o2vnRgrdnPUkF3eN88dbSrIsPg
X-Received: by 2002:a05:6a00:3d98:b0:827:370b:2695 with SMTP id d2e1a72fcca58-829a2e9dec7mr8686752b3a.29.1773080119500;
        Mon, 09 Mar 2026 11:15:19 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:53c8:742c:4036:d7c6:9024])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm10775477b3a.29.2026.03.09.11.15.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Mar 2026 11:15:18 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sayali Patil <sayalip@linux.ibm.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 08/10] powerpc/64s: Rename tlbie_lpid_va to tlbie_va_lpid
Date: Mon,  9 Mar 2026 23:44:31 +0530
Message-ID: <8fadd2beb2f883c65ba0d797c87d238098cd13c8.1773078178.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773078178.git.ritesh.list@gmail.com>
References: <cover.1773078178.git.ritesh.list@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 04B5F23E726
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17928-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

In previous patch we renamed tlbie_va_lpid functions to
tlbie_va_pid_lpid() since those were working with PIDs as well.
This then allows us to rename tlbie_lpid_va to tlbie_va_lpid, which
finally makes all the tlbie function naming consistent.

No functional change in this patch.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 1adf20798ca6..6ce94eaefc1b 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -185,7 +185,7 @@ static __always_inline void __tlbie_va(unsigned long va, unsigned long pid,
 	trace_tlbie(0, 0, rb, rs, ric, prs, r);
 }
 
-static __always_inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid,
+static __always_inline void __tlbie_va_lpid(unsigned long va, unsigned long lpid,
 					    unsigned long ap, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
@@ -249,17 +249,17 @@ static inline void fixup_tlbie_pid(unsigned long pid)
 	}
 }
 
-static inline void fixup_tlbie_lpid_va(unsigned long va, unsigned long lpid,
+static inline void fixup_tlbie_va_lpid(unsigned long va, unsigned long lpid,
 				       unsigned long ap)
 {
 	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
 		asm volatile("ptesync": : :"memory");
-		__tlbie_lpid_va(va, 0, ap, RIC_FLUSH_TLB);
+		__tlbie_va_lpid(va, 0, ap, RIC_FLUSH_TLB);
 	}
 
 	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 		asm volatile("ptesync": : :"memory");
-		__tlbie_lpid_va(va, lpid, ap, RIC_FLUSH_TLB);
+		__tlbie_va_lpid(va, lpid, ap, RIC_FLUSH_TLB);
 	}
 }
 
@@ -278,7 +278,7 @@ static inline void fixup_tlbie_lpid(unsigned long lpid)
 
 	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 		asm volatile("ptesync": : :"memory");
-		__tlbie_lpid_va(va, lpid, mmu_get_ap(MMU_PAGE_64K), RIC_FLUSH_TLB);
+		__tlbie_va_lpid(va, lpid, mmu_get_ap(MMU_PAGE_64K), RIC_FLUSH_TLB);
 	}
 }
 
@@ -529,14 +529,14 @@ static void do_tlbiel_va_range(void *info)
 				    t->psize, t->also_pwc);
 }
 
-static __always_inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
+static __always_inline void _tlbie_va_lpid(unsigned long va, unsigned long lpid,
 			      unsigned long psize, unsigned long ric)
 {
 	unsigned long ap = mmu_get_ap(psize);
 
 	asm volatile("ptesync": : :"memory");
-	__tlbie_lpid_va(va, lpid, ap, ric);
-	fixup_tlbie_lpid_va(va, lpid, ap);
+	__tlbie_va_lpid(va, lpid, ap, ric);
+	fixup_tlbie_va_lpid(va, lpid, ap);
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
@@ -1147,7 +1147,7 @@ void radix__flush_tlb_lpid_page(unsigned int lpid,
 {
 	int psize = radix_get_mmu_psize(page_size);
 
-	_tlbie_lpid_va(addr, lpid, psize, RIC_FLUSH_TLB);
+	_tlbie_va_lpid(addr, lpid, psize, RIC_FLUSH_TLB);
 }
 EXPORT_SYMBOL_GPL(radix__flush_tlb_lpid_page);
 
-- 
2.50.1 (Apple Git-155)


