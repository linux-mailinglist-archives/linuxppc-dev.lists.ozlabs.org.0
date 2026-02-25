Return-Path: <linuxppc-dev+bounces-17183-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN3IL4fXnmkTXgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17183-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB95D1963AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWw430fPz3dX4;
	Wed, 25 Feb 2026 22:05:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772017524;
	cv=none; b=Ym4TximXCUCHmLZBgcQ6llkukC1B1YUlOOwFd6yNncqPHQgaKu2spy7e3h37qkJ8RcqvOl0ApVqguXENZpHg8InNG+g95r74bYx2PmnZDI1Wb7VEbkB0VI0E0GCU3opF1Av30JsDt6aQ/sMcgZZNNasr0IexEWJ62Q98gfX0N373ttwTbyhaxrCkmji3H42/Gp4DS64EiYSbdiXdj6UUR6SDR7+eAYHqQl09ItxhA2+BOcR2TA1jo79MAVLT253W38mLjro6mC6nznshpeVa3ttIB2aQumXh5wIhotP3HGGSwlde7GQ7dIU9Uf5TlD1FMnYGK1zZ+IRyUAViacUJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772017524; c=relaxed/relaxed;
	bh=oY+WcCKwH30XQgtGlAXxD48kd5JWxreLKyCXwqlGHN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuWmD87hnUV+v/oVwIQevbI/iM0p8v09pZCrb+X502X5MvaM2tzQIZ9qkAK5uhHvm9GRyA6hE5Lq4zhZu6b1TWPc+AbkstPMmDMeHmzyn2IqKACeiMPBRhFhJMzeIwx8Au4m6tc+H+UNApAyOWNG66VNlC+H0ncEtQcBPDD+Zl3XyBH0bmMOc1JAV7r2oALImNjy7Ciq6hVKt7/rfMenWizlJArdXnsVz2dtT1GErNxVmpUCwnf6GlTsG24okmARuN18JmGFhoC7SaAszupaRAzcKesrI6nIwJODpy61RUZ4U5fnHBF18o6bNQtCe2NnH131rMZr+YxSfpL8dMULCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KB6Tsput; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KB6Tsput;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWw34QFnz3cJj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 22:05:23 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ab46931cf1so5004735ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 03:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017521; x=1772622321; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oY+WcCKwH30XQgtGlAXxD48kd5JWxreLKyCXwqlGHN4=;
        b=KB6Tsput0E6cTZeWBz/cpP1R0JX1Z5c1enaYZykIKTblhiUwz8g/ouPCwXIm/2jLrI
         zFYJPoXPljSkoALWb/ibjAlLn0ZTZ19ggoToiP7sbsXGpG3v2NEF3xIUmJMIShA24VTK
         lcD2V107v/B9FBUAUVmVLynWyKyKEiW5qGxq1JXF62lxTzpzNkkCnfyZ//msNt07Souj
         Zf+/ndV5wwEcQvuoicUrNCepF1w5nXSIrDkGE3cz94z8GOap6TI3TrvX+dqVIYuOYQ43
         w6higaziEAoCpN1fwaiQ6kfMF9ul/2FbPhrycPuzvFbNjMhoZDJnZVxR3qwGBujzvWLH
         gxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017521; x=1772622321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oY+WcCKwH30XQgtGlAXxD48kd5JWxreLKyCXwqlGHN4=;
        b=w3SeYJglm5UcKCePpYFqc/qo0KuFVsfDxhenCxHCjWY8yHOL00wlmQYRH+6M9hVrRS
         dD+1ZNBuEdu+sqmlra9WPSePVdXtpwdbGIp8rVdHEIfUcmIu2lvYHlQTOif2QfkW+379
         ir0A2Bzn76FyaUl41bfc7mBwyvcQG093uE9NO3H6v7ge/JqeM3G3HUdxt2i+ae1M2p1m
         Fulny4mEagGCN3rr2vb5WBi0382C7SgNNZNAYSFqw1Tv2kmBus2jzVYk7rXMyB1bmtWE
         3GRS6jR97xXR7bpFlKv+EZ21p2iCA2lFTMEjbU7czBvhSccQOmHlAZETekICO0IOUmrF
         Ncvw==
X-Gm-Message-State: AOJu0Yw0AxapGHd6TSW/P2ZmhTaYLS9kvu/lziV0+HEqEldHbIGHBi0m
	4T4Cv6Llfdp56Gq2yrtHsxQfLfhmqXCFVITZeDF7/dXmQ3idqBuBbjNVwIuwyA==
X-Gm-Gg: ATEYQzyL2sqJe+ZL83hmG8yqCsoeD7ZRQm6FFtrVFQr4qQklUpc+9TBdt9Ew0QHGUVI
	8mhkMB1Fq+QNqSXGpCr3rMyCAc7LVC0Av0brmg8K0UjXc3qRJOJGtwlhkMnlM/3lR65SN1oDOmN
	YRNH2bcnqSYB3t2vAHrQvAm169XA0yr+nV/x4BIaCChEb9untI/jTJ7AOdvh5zclibphOog3JP9
	/PZNwFn1ww7UT/hrEvx5dKU7cb4d+Ivsy3CCnkTOeP76j1AnGmzThdzxDXdbADtI5ezerIsAgw4
	cZN4tADBhYBDtF6kiwWTYqpsuAIg+NsxeR/ZZ78RZ4LgdwaGyfJEeEKabwgG/StfWRxZOzPxJA8
	hQrhvAFXppqm9V7bxvpxOHIGuWvSQyWRwXebpAmH0RwuiBDcxzMG8qFwyPr2b4xacl3jdBeiaUL
	o4bkdo9qAaWMnlYM5Fi/QQS8em67ZMUClZzt3RJd1PHg==
X-Received: by 2002:a17:902:f792:b0:2aa:e55b:22c4 with SMTP id d9443c01a7336-2adbdc4a59bmr27149245ad.9.1772017521044;
        Wed, 25 Feb 2026 03:05:21 -0800 (PST)
Received: from dw-tp.ibmuc.com ([203.81.242.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f9f5sm138365975ad.77.2026.02.25.03.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:05:20 -0800 (PST)
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
Subject: [RFC v1 08/10] powerpc: book3s64: Rename tlbie_lpid_va to tlbie_va_lpid
Date: Wed, 25 Feb 2026 16:34:29 +0530
Message-ID: <91a6be6c26145dd2ce94d6c1f65aae86d424857d.1772013273.git.ritesh.list@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17183-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: CB95D1963AF
X-Rspamd-Action: no action

In previous patch we renamed tlbie_va_lpid functions to
tlbie_va_pid_lpid() since those were working with PIDs as well.
This then allows us to rename tlbie_lpid_va to tlbie_va_lpid, which
finally makes all the tlbie function naming consistent.

No functional change in this patch.

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
2.53.0


