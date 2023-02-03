Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A9268979E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 12:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Y943KgQz3f8N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 22:20:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e/Ohsw5d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e/Ohsw5d;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Y634M8vz3f6L
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 22:17:31 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id v23so4903151plo.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 03:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0/ElOy4og40E/sgS0rJoL1iS6ffRA2WFEnT5Pdlkrw=;
        b=e/Ohsw5dd9hY1JKjcmDQc4pC/ncOsNN8FEksS9QWLnPEePgEXZnpdq9Cn608ez0vLm
         Wfl/yHu28PDjsz1viBF+ukzYbtZnr0W2QrEqR+VNKYNCHan4zQzbPNHCtNO0J5d7vr/C
         yir1LJcQlmWpQFhia2RDY93mRMgnvnebAkgM9xZ/7YfZUMKEvkxDyCg3RC0tzv6UIDgm
         pGzhbQCdZQncT3PzaVFPwjj2ThaLGlQh4cPoG5KkWBInCJJ5GK7ztQmO8U4AfRO3WbI4
         pBfA5r9I9WS1zHmmBAGQQ8Rz/VLh98w4sxqIqkkl3KWlz6Gfohe6myX1TAW8hQoidtTT
         0JBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0/ElOy4og40E/sgS0rJoL1iS6ffRA2WFEnT5Pdlkrw=;
        b=YLidmxC5zZELS2K7QybtDhNf+Klpd0+qj19dT+jDuBF+n8HG8jvuRKemVmGpaqGlM3
         +LIuZrGkR6wpslYp3BWgyB23jBhxV1ki9gAwTAY0rV5BVKqz7l7KVDeCTxhwWS1gd0q7
         iNHLDH8AtQUrwUSdnw6L/+nsa90ZZYzBzvGvUw/EnhdGQj2nT041UUzt9FiVVSpGljBc
         bzD6zHEHCn1SDgSj7aMNF/Ag18Z5VvuZI4zAGfrloQ6Gynr7HXwJjwfp4jZkfTkJsDdi
         SlRKhZton6SgaP94zULZl/zhU9HvQm3/NDXjldAO/txxRydbNj36Nrxto+mgh4oCwp82
         5Iyg==
X-Gm-Message-State: AO0yUKV9EmOXn36PyuxVGWy+9p4jdkZ/xkKnDHrswDqD6kH181RBScu6
	4p2iOMtSMqT4VKpIGUAEGlOk2MR1FY4=
X-Google-Smtp-Source: AK7set+sHsfWROcWN4HAO7M/EZHAfBJEzMgDdlXRrTDDvAqq9B3Lk61uF2SxWUvwLeStDQkuWpmzAQ==
X-Received: by 2002:a17:90b:4c84:b0:22b:eb46:7d2 with SMTP id my4-20020a17090b4c8400b0022beb4607d2mr10016489pjb.47.1675423048967;
        Fri, 03 Feb 2023 03:17:28 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id i15-20020a63bf4f000000b004f2c088328bsm1285151pgo.43.2023.02.03.03.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 03:17:28 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/64s/radix: mm->context.id should always be valid
Date: Fri,  3 Feb 2023 21:17:17 +1000
Message-Id: <20230203111718.1149852-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203111718.1149852-1-npiggin@gmail.com>
References: <20230203111718.1149852-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The MMU_NO_CONTEXT checks are an unnecessary complication. Make
these warn to prepare to remove them in future.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 39 +++++++++++++++-------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 1e451184cba4..27aa5b0fbb3f 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -700,12 +700,13 @@ static inline void _tlbiel_va_range_multicast(struct mm_struct *mm,
  */
 void radix__local_flush_tlb_mm(struct mm_struct *mm)
 {
-	unsigned long pid;
+	unsigned long pid = mm->context.id;
+
+	if (WARN_ON_ONCE(pid == MMU_NO_CONTEXT))
+		return;
 
 	preempt_disable();
-	pid = mm->context.id;
-	if (pid != MMU_NO_CONTEXT)
-		_tlbiel_pid(pid, RIC_FLUSH_TLB);
+	_tlbiel_pid(pid, RIC_FLUSH_TLB);
 	preempt_enable();
 }
 EXPORT_SYMBOL(radix__local_flush_tlb_mm);
@@ -713,12 +714,13 @@ EXPORT_SYMBOL(radix__local_flush_tlb_mm);
 #ifndef CONFIG_SMP
 void radix__local_flush_all_mm(struct mm_struct *mm)
 {
-	unsigned long pid;
+	unsigned long pid = mm->context.id;
+
+	if (WARN_ON_ONCE(pid == MMU_NO_CONTEXT))
+		return;
 
 	preempt_disable();
-	pid = mm->context.id;
-	if (pid != MMU_NO_CONTEXT)
-		_tlbiel_pid(pid, RIC_FLUSH_ALL);
+	_tlbiel_pid(pid, RIC_FLUSH_ALL);
 	preempt_enable();
 }
 EXPORT_SYMBOL(radix__local_flush_all_mm);
@@ -732,12 +734,13 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 void radix__local_flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 				       int psize)
 {
-	unsigned long pid;
+	unsigned long pid = mm->context.id;
+
+	if (WARN_ON_ONCE(pid == MMU_NO_CONTEXT))
+		return;
 
 	preempt_disable();
-	pid = mm->context.id;
-	if (pid != MMU_NO_CONTEXT)
-		_tlbiel_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
+	_tlbiel_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
 	preempt_enable();
 }
 
@@ -945,7 +948,7 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 	enum tlb_flush_type type;
 
 	pid = mm->context.id;
-	if (unlikely(pid == MMU_NO_CONTEXT))
+	if (WARN_ON_ONCE(pid == MMU_NO_CONTEXT))
 		return;
 
 	preempt_disable();
@@ -985,7 +988,7 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 	enum tlb_flush_type type;
 
 	pid = mm->context.id;
-	if (unlikely(pid == MMU_NO_CONTEXT))
+	if (WARN_ON_ONCE(pid == MMU_NO_CONTEXT))
 		return;
 
 	preempt_disable();
@@ -1024,7 +1027,7 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 	enum tlb_flush_type type;
 
 	pid = mm->context.id;
-	if (unlikely(pid == MMU_NO_CONTEXT))
+	if (WARN_ON_ONCE(pid == MMU_NO_CONTEXT))
 		return;
 
 	preempt_disable();
@@ -1130,7 +1133,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 	enum tlb_flush_type type;
 
 	pid = mm->context.id;
-	if (unlikely(pid == MMU_NO_CONTEXT))
+	if (WARN_ON_ONCE(pid == MMU_NO_CONTEXT))
 		return;
 
 	preempt_disable();
@@ -1330,7 +1333,7 @@ static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 	enum tlb_flush_type type;
 
 	pid = mm->context.id;
-	if (unlikely(pid == MMU_NO_CONTEXT))
+	if (WARN_ON_ONCE(pid == MMU_NO_CONTEXT))
 		return;
 
 	fullmm = (end == TLB_FLUSH_ALL);
@@ -1406,7 +1409,7 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 	enum tlb_flush_type type;
 
 	pid = mm->context.id;
-	if (unlikely(pid == MMU_NO_CONTEXT))
+	if (WARN_ON_ONCE(pid == MMU_NO_CONTEXT))
 		return;
 
 	/* 4k page size, just blow the world */
-- 
2.37.2

