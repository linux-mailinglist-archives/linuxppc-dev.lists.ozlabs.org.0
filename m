Return-Path: <linuxppc-dev+bounces-17182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLVzN3/XnmkTXgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3304A19639F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWvz3vzPz3fCn;
	Wed, 25 Feb 2026 22:05:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772017519;
	cv=none; b=GLvD+Mp0q0GyFKSBApAtaYstpALZiFqM6nuB7RqaRKs/I6NTwF4Fz8uIjTN3MIHJcWZFtG/E839LFuNkXzE6OnGtW5naMCKpiJL/4+nDQ10C3kTGNlOnqzyC7Mlx34aZl41KeJ/6DHNfhKzRPnl535xgH+RvAEvIu7nttXX0/vUigFR7EB83bl1PSFIcjAPhNLuI01Ds0U6zkUBCxAQ2vaQmaIB0mQujCS7EynMpe5hNQoI4V2GDJADJbxDAKJzm07Ega6zIjbLxkhKnnUZT72sRhK/xlpiNW9qDUfXhjpd3HV6nLjGOX1cIPj/pSERIuvfBq34CQ6m2efC15TqUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772017519; c=relaxed/relaxed;
	bh=IYLULRhfZbKBR4o+fRX9v875nH1I/a89WdoHn6t4e60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QR7kELNBdjKfsPBzcB0Z5kKUWgWVEOyxkU+JZ3pkELpiRejtURmZHX99y2TN/r8LNJT0tFdqyx+Nz5A/N99My0eZ97tMhEdciLzdVJhuehTgoBqesvIupB2RHmm8A4+OuskMfveol8fCGukWclEL29N0VNS0plYAP38BB3PfWCSgxMOiEyTMXIKVDaMnSRcD3PVfGKGamZeZN/S5fN57bhy1AqBKrMOG8d2QxBVjil04l3rgMB16OEM1TlUy0SfCCyvUbdAQF8CcUfj7zHBpqewGgV5qRLByunrapAhrF8dEdaRH1ydMw0l9enObv4bbI99zS1JyKM6hYAv1s4IOHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Akpm5tpy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Akpm5tpy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWvy6MvMz3cnK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 22:05:18 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2addb31945aso2321205ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 03:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017516; x=1772622316; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYLULRhfZbKBR4o+fRX9v875nH1I/a89WdoHn6t4e60=;
        b=Akpm5tpyV8cwHYO2wwO8laNTMUzw1PYcDRLQd8awxaDlTdfEqBhqm7PSRijC+pGJ/s
         VkiUFp3O4Zwwvz+3YeVYdVCDBi6OsikIs0/+TeXu7iR2sXyV2c27iDnLLqqoQSSg37i6
         ohyeJL9+z4CNXQFwTOBEcYHsL8jM9HQq2Z+P7pHZTxCM1mOenGxvsk4sLcxQ3XLpnryp
         3Y8FKLCv0jm4u2ncQ5Dq3GQcVF4WdEf6CwaSjKOcOjksyWBv1ZZd5h1LuIeFP8Yqi7wR
         qYNyDe0lSWMAmoWauf41z3GNrsZujZhTbL8ehaoozWJmyLvUmQaMPR/OCVpvtvb+LFBQ
         QmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017516; x=1772622316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IYLULRhfZbKBR4o+fRX9v875nH1I/a89WdoHn6t4e60=;
        b=uTmK9bZWjmeTykCNGEN4jm7AP7AgOjjMMgWpU00ivnV+jvSSszsXN5VydgwfvjUZNt
         Kgi3ahx4rKTqT6ixHe1kQ13/7K1co46cQwJh5Dj0h4rD+rLm+UEzQW1UsxbdZx4sX9dN
         FxCCzqH5jsXjoeb25nkRpJpxxYLUdIctNT6dery+4QcddvrHB7L7s1qWnchOWr3b9LBz
         Uaj2+UB2SLp8g9UWxWhH9FCT3kNHT0W75BjplRg100hUaYvUEJ/hC2sNSZJlZMYMt8dV
         TkZ2TcS0r/WxWucZpvy42CsmyGUtAVc5v62soDR37KjsyezDAxLeH60K2unt/HYg2iQh
         7cyA==
X-Gm-Message-State: AOJu0Yz/X89EsL0ULddXSdtFJfED1JFjQgUGCf97BaWSwW0R8aGV4LLC
	m7HKz79jSA8HP4pV4+N6PZTsXEgpicINNK4CvF+DOEde0VlJJ/qdb/mrEYoOvw==
X-Gm-Gg: ATEYQzwFYH+3H6cTBrwgCV5981CGN9U8R5gqNc4paBgFKJv6nNaBBICyd8UoGH32jba
	seiT6Zq8eT57WZBXfC6LtEBaWIsVFKC/DevGGjN2gy9ZlqDVjUgcNWBnIvtBU5Kf6Z2WSTsFt82
	mnAb6o56FIEepSmPGS16vxNAB6k2SgQ7H6LnHz/fBay/w8s8xcWgvLudmq7JdzJt4DoXkc04qYR
	2igeye7UDEyKzq4AnwHjFeyK+NAnrn1RYAbpUUjrxuO6NF0wERwVhmOetL8OMRiLvjXRUU3o7RR
	J1UlWQmRf3ilTB1EdHXZho9TdLFgSHJ9G5DeClgm1cG1I3QcsG2/GheDhPiJzwSSuS0CaplDXwD
	2bnJACZTnX2P5pHD8pBRlz/OQE6KU161MSkScUjZOVwbtt9L8anOfI6U/j0dvJUYbV+hwtBzysp
	Sxt0lxemwwRm21MX6jMZ5JBD12TPeVm/g=
X-Received: by 2002:a17:903:41cb:b0:2ad:b957:e7fd with SMTP id d9443c01a7336-2adb957eeacmr39272785ad.50.1772017516378;
        Wed, 25 Feb 2026 03:05:16 -0800 (PST)
Received: from dw-tp.ibmuc.com ([203.81.242.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f9f5sm138365975ad.77.2026.02.25.03.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:05:15 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v1 07/10] powerpc: book3s64: Rename tlbie_va_lpid to tlbie_va_pid_lpid
Date: Wed, 25 Feb 2026 16:34:28 +0530
Message-ID: <465a2aac31f00d395be0d551574de37786ace094.1772013273.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772013273.git.ritesh.list@gmail.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
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
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17182-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 3304A19639F
X-Rspamd-Action: no action

It only make sense to rename these functions, so it's better reflect what
they are supposed to do. For e.g. __tlbie_va_pid_lpid name better reflect
that it is invalidating tlbie using VA, PID and LPID.

No functional change in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 339bd276840b..1adf20798ca6 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1411,7 +1411,7 @@ static __always_inline void __tlbie_pid_lpid(unsigned long pid,
 	trace_tlbie(0, 0, rb, rs, ric, prs, r);
 }
 
-static __always_inline void __tlbie_va_lpid(unsigned long va, unsigned long pid,
+static __always_inline void __tlbie_va_pid_lpid(unsigned long va, unsigned long pid,
 					    unsigned long lpid,
 					    unsigned long ap, unsigned long ric)
 {
@@ -1443,7 +1443,7 @@ static inline void fixup_tlbie_pid_lpid(unsigned long pid, unsigned long lpid)
 
 	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 		asm volatile("ptesync" : : : "memory");
-		__tlbie_va_lpid(va, pid, lpid, mmu_get_ap(MMU_PAGE_64K),
+		__tlbie_va_pid_lpid(va, pid, lpid, mmu_get_ap(MMU_PAGE_64K),
 				RIC_FLUSH_TLB);
 	}
 }
@@ -1474,7 +1474,7 @@ static inline void _tlbie_pid_lpid(unsigned long pid, unsigned long lpid,
 	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
 }
 
-static inline void fixup_tlbie_va_range_lpid(unsigned long va,
+static inline void fixup_tlbie_va_range_pid_lpid(unsigned long va,
 					     unsigned long pid,
 					     unsigned long lpid,
 					     unsigned long ap)
@@ -1486,11 +1486,11 @@ static inline void fixup_tlbie_va_range_lpid(unsigned long va,
 
 	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 		asm volatile("ptesync" : : : "memory");
-		__tlbie_va_lpid(va, pid, lpid, ap, RIC_FLUSH_TLB);
+		__tlbie_va_pid_lpid(va, pid, lpid, ap, RIC_FLUSH_TLB);
 	}
 }
 
-static inline void __tlbie_va_range_lpid(unsigned long start, unsigned long end,
+static inline void __tlbie_va_range_pid_lpid(unsigned long start, unsigned long end,
 					 unsigned long pid, unsigned long lpid,
 					 unsigned long page_size,
 					 unsigned long psize)
@@ -1499,12 +1499,12 @@ static inline void __tlbie_va_range_lpid(unsigned long start, unsigned long end,
 	unsigned long ap = mmu_get_ap(psize);
 
 	for (addr = start; addr < end; addr += page_size)
-		__tlbie_va_lpid(addr, pid, lpid, ap, RIC_FLUSH_TLB);
+		__tlbie_va_pid_lpid(addr, pid, lpid, ap, RIC_FLUSH_TLB);
 
-	fixup_tlbie_va_range_lpid(addr - page_size, pid, lpid, ap);
+	fixup_tlbie_va_range_pid_lpid(addr - page_size, pid, lpid, ap);
 }
 
-static inline void _tlbie_va_range_lpid(unsigned long start, unsigned long end,
+static inline void _tlbie_va_range_pid_lpid(unsigned long start, unsigned long end,
 					unsigned long pid, unsigned long lpid,
 					unsigned long page_size,
 					unsigned long psize, bool also_pwc)
@@ -1512,7 +1512,7 @@ static inline void _tlbie_va_range_lpid(unsigned long start, unsigned long end,
 	asm volatile("ptesync" : : : "memory");
 	if (also_pwc)
 		__tlbie_pid_lpid(pid, lpid, RIC_FLUSH_PWC);
-	__tlbie_va_range_lpid(start, end, pid, lpid, page_size, psize);
+	__tlbie_va_range_pid_lpid(start, end, pid, lpid, page_size, psize);
 	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
 }
 
@@ -1563,7 +1563,7 @@ void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
 			_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_TLB);
 			return;
 		}
-		_tlbie_va_range_lpid(start, end, pid, lpid,
+		_tlbie_va_range_pid_lpid(start, end, pid, lpid,
 				     (1UL << def->shift), psize, false);
 	}
 }
-- 
2.53.0


