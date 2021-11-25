Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A7245DA94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 14:00:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0HzM1YMJz3fCW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 00:00:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EsD0jQfP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EsD0jQfP; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Hmx3xBJz3c70
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:51:13 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 200so5186145pga.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZP5Db5afe/1nH4DERQJgxve0hN/084nIqmOJzViCAlM=;
 b=EsD0jQfPvVKrzmhG1FZvi8HayL3gKujfQFMwYBoqzmUlkP+ehQ1dymDGTP3Bqc8x3X
 8y5LQglIadvvEvHMDZ64ILKCKkq8rkLdv08vgd7dqbd4rKK105n9tHqRtwgDox7yl7Wq
 ExyvpUd8pS6vF4LChSjFJIuugfeDEWaTBjmmFmz57lz2fXFS8NZK4OPtKTEh730eR6E+
 EAobESeXKe7qg7NCH958Ldrxtzodu850kfTZLZCDtnjC13+7Rnc6b5RCd00V7jUHrIRR
 PhLvuiutedFx1fFhwHcTISqgaMYSNqJRE0XiD7WA1S/rrfV/4j8fy75fkhKaI7Gt3zxb
 3sHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZP5Db5afe/1nH4DERQJgxve0hN/084nIqmOJzViCAlM=;
 b=4SZ8j6VIwEL1y/2Ln5sUEfGA63pevBVYQag/uKu3IJvjcmzz/4r5l50/CmceYtvJ4B
 JNFAi7QJk7A9M7/PIlUnnZXWUquVesepDxxrxyl2gdS0TXbpm9dTkYG71Igc6IazWnHH
 VLvz9knTC8CSvCyXCpXakRHFTesAj5NCzYb7jAQB7R8J3EIWBrjt7ydnZpCXsheLEHwl
 jyb4mnVPKuObrEPVsAJUNm8oOlt83vpMxcqLJu4w8gesRm4I/dVznYYrxsjjsMqVlauT
 CT33XW7uhsg7ADrYlna1vRuegUkgIQZWltcDftrRqyGTjVM23TQekzy+KYuczChExWM1
 odGQ==
X-Gm-Message-State: AOAM5310TXnMYy+KWolIZt3vOmHufiT7YYtEDfeja/qAt4zTjgOq4Xsg
 YxFdA5A22Gna7HVCCrSz/hG0ng5J+3A=
X-Google-Smtp-Source: ABdhPJwRsCWTll7VhJJ1d0YnAu1mU7cf/3jIyZL4ovHFhNYdAf73SIUUYH/e/XYlJmwfYF021atYSA==
X-Received: by 2002:a63:924e:: with SMTP id s14mr12616122pgn.282.1637844671386; 
 Thu, 25 Nov 2021 04:51:11 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:51:11 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 14/17] powerpc/64s: Fix radix MMU when MMU_FTR_HPTE_TABLE
 is clear
Date: Thu, 25 Nov 2021 22:50:22 +1000
Message-Id: <20211125125025.1472060-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are a few places that require MMU_FTR_HPTE_TABLE to be set even
when running in radix mode. Fix those up.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/pgtable.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index ce9482383144..abb3198bd277 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -81,9 +81,6 @@ static struct page *maybe_pte_to_page(pte_t pte)
 
 static pte_t set_pte_filter_hash(pte_t pte)
 {
-	if (radix_enabled())
-		return pte;
-
 	pte = __pte(pte_val(pte) & ~_PAGE_HPTEFLAGS);
 	if (pte_looks_normal(pte) && !(cpu_has_feature(CPU_FTR_COHERENT_ICACHE) ||
 				       cpu_has_feature(CPU_FTR_NOEXECUTE))) {
@@ -112,6 +109,9 @@ static inline pte_t set_pte_filter(pte_t pte)
 {
 	struct page *pg;
 
+	if (radix_enabled())
+		return pte;
+
 	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return set_pte_filter_hash(pte);
 
@@ -144,6 +144,9 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 {
 	struct page *pg;
 
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+		return pte;
+
 	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return pte;
 
-- 
2.23.0

