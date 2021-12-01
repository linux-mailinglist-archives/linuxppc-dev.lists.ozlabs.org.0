Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25334465079
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:51:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J429H721Gz3dc7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:51:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nYbXHBn8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nYbXHBn8; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yl3gv3z3c7S
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:39 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id z6so17884256plk.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZP5Db5afe/1nH4DERQJgxve0hN/084nIqmOJzViCAlM=;
 b=nYbXHBn8Le2MZWOsGm4lReC+8xk4Wu4+6Yj6/m2qCDxQdH4nZxUN7Ctplp5ln5LgyY
 rmKpnvxmeUMHYy3EFsS7CCpxSJv2NL1o6sUHTI5V6zN/pCqwKEBYEhBL/iptdYtF6DPv
 9zi/9UGp4EdTI0vbOTMSF2tP5KRWfHpKsI7xTwo9XeWmxJkVMtdJjpI4+EamIBcopdmL
 ltGHWH31VhNKNw/LhACvUSbU9luEoabriG1gj36U0PmegDj1un1fdFM0h0mB6YrmlcRG
 pzp4sAgYcxkBFHRNWbbTK6+zEcGuMJEvsXX99ATwnG5gjOijWYgIcpwZPaz4Sw/5UYCK
 Wveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZP5Db5afe/1nH4DERQJgxve0hN/084nIqmOJzViCAlM=;
 b=BV0xGEBcOfrq/zNhgKltu2+wzAZxa2GzNN7Jwi+byNJV9qr0beUPp36lLinda04+nq
 p/KIWdN3QGbakpq5N4H1knTv3h67i9XR6mudEmqqXNWGaN1JH6cJWNv8ZO4xZYmHj4pZ
 8ZNG8Ddqtz/mT1h9+NFlDn8D/Q1laOc6vAaDZGxNWXGPZnA+Zm+oDq66D2ogfdYTi4WV
 6thhAufHtK3q70BukIZToKLIqNSlhIKZfWtMhtfoMYXWVOJjuMT2uPQPF7oGsNCq32FD
 7j9f1Gwz2DejOafrjwZwTGwIaFLPz3fN7b/oDfX51ER0DTYlXaVHoHIdpYawt7SCOAH9
 izJw==
X-Gm-Message-State: AOAM533Y02VxK1vIN8V/5EjPrJQnakcbIDgEYsb4QF1S2vazQnHOWqgV
 A971+UcfA3dZQJHooFN+EzSWJ0Swy7s=
X-Google-Smtp-Source: ABdhPJw5I6gOicMhDruFKh/ILtU8ibbUoyAcqA1Fu+x6Ty6igfKuhQWQgKFBNTr3h4XqcTwwrCN26w==
X-Received: by 2002:a17:902:8e85:b0:142:7621:e3b3 with SMTP id
 bg5-20020a1709028e8500b001427621e3b3mr8071571plb.84.1638369757335; 
 Wed, 01 Dec 2021 06:42:37 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 14/18] powerpc/64s: Fix radix MMU when MMU_FTR_HPTE_TABLE
 is clear
Date: Thu,  2 Dec 2021 00:41:49 +1000
Message-Id: <20211201144153.2456614-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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

