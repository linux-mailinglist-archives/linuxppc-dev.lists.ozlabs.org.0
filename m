Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F3B460D21
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:17:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2VsL72RPz3dqt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:17:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lAfklT3c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lAfklT3c; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vg24hb8z3bjR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:46 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id b68so15296228pfg.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZP5Db5afe/1nH4DERQJgxve0hN/084nIqmOJzViCAlM=;
 b=lAfklT3cSlJDS0ev8yr5+0x5wUyg16sJ0qZ7aIHwzbmBZT+GHMyM3d69dzru6U5iL4
 O8ln/iLCdrOaNV67Rfq/1hNltdqIjHNBAHVR/M063iWB8+zg/8vHnaW9QM3gXRv3MgAN
 ozlzk/t902UKgrCkXCKmG18BHWPcqYML/nGcbFYZl3/QzGiSuRsobVa1cckGAxhZQsh+
 UlXL2BpWlyFi98CJMaK5bflHG7wqj/vuBdvL/Uag3efCvANiTkhKX6/g9ftXz50lLgi8
 Ww1mXieFM3xmnMo9uGCwLC0/0GICTMrZ8DvspCHugFNucGtt3pGPvqruhtItSGxtr4PS
 Twjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZP5Db5afe/1nH4DERQJgxve0hN/084nIqmOJzViCAlM=;
 b=b9A07XS+aNzCayzVxJjInaxdyws39iR+ixQsLmAdfDQb+xLqOgqMojlu2e6usTrVnM
 GvOb9L4zFh8bnnImQ05oVMIz7ZPtwUnd11Mvu+MgVPFI8br/lkTsQkKeKYa8ys8IJYHy
 u5ZvSfbH1YxKZ9FHG/TSZgdsVQ2+Cj9AeXi8okJ3c7SYfu7GVwaPNfgREF1Kp/9cWqS1
 CrLYXpSCM9TgbE/GvL4f4XdrPQ0PoKpakc8F35t0QYU5XjKCVry6tGlhWq633Z3csCiT
 dG8eVyjWy1HicPa5Pr2OC86MG3gRxk/vvxUtZZAXZ17zAK08VPGUUu7485IkYuZJAzu/
 Hkfw==
X-Gm-Message-State: AOAM531VQs/zGzBZo01ghBKefNFS85ZDdFw2MxGOKJPDbv+ZcbcZo+u9
 VfMJTCZObr86CWmoClmw18wWYDS2/Pc=
X-Google-Smtp-Source: ABdhPJxFUcqSFbK8RFg+c5M5Z8m4k4c2Itw3B/BBSIDYPEB6spBEm7iXzB9jV4C5BxBHU8D5Df+JGg==
X-Received: by 2002:a63:d44:: with SMTP id 4mr32579159pgn.135.1638155324432;
 Sun, 28 Nov 2021 19:08:44 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:44 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 14/17] powerpc/64s: Fix radix MMU when MMU_FTR_HPTE_TABLE
 is clear
Date: Mon, 29 Nov 2021 13:08:00 +1000
Message-Id: <20211129030803.1888161-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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

