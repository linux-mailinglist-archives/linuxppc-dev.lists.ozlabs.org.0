Return-Path: <linuxppc-dev+bounces-1613-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 672E2986CCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:48:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkgh2FNFz2xjY;
	Thu, 26 Sep 2024 16:48:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333280;
	cv=none; b=UMJjwL/oxFhIhTl1nPCY7SKYZLI+EEIEPPABLHTVolmbIijJ4KEuAfEzi4C6uu6mUClcDdbdGYkv8FCRBamxqAb29KOUpJw/8uz8AflhpXlHKQTnFLwh7l0YMgkNkgF1iTw8Jq3+3PCNUSTZ2frpzEbuaMRWjFs2hpRwF0WzJXinXLM7niOBJSQS9PmKZdlcznQKs7AyL/ZIyiTGnBNYGiA+6hI51TdgQEv9yh2WL0vU3MUfuSZ10C13GDGUoxVC2uxOzgcneAzFcPBoNZFPFklL5Kwmb9WXIbFYbImGpdRt/yGMGAzWxE8xCzpMXv/qkW0Dyycjw7dLWi8LqssgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333280; c=relaxed/relaxed;
	bh=xHtLGGTaDvd+j7nlO+D4nlmKtDmH5wZnqdyAY1Z6B8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4CFERbpF9NlrjMD+rdQ1scXO4SuuF3fHuPRN5cl1ouAsbr3sYrDVRnCg62xGOkNb2Uh90mCLu9h495qeMEubjLczpZ0jOXs4LUlmNRDqwwKGq4wEZQg09/bC+Y+btjcCT+7J0f5cJwjsY3M1m4d2MBlQgcgW2i64uH6AX6F/YUUajcsXbkr07obNVqRZFXUWiEMRKwu9PlJk012XZ+Dop2L+xiQs7tsEMLU8w6MXtfgIpUC1NqbTHTFT0m/tnJ1WF3OhTXUlSs1JrMVGVuC6UNW8VFnXes3Rf/jeCg0R9LPCEYjtn8FPMsCTopFGGBEGCUXKbv3PNOtbhcz/4qE1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=G5th1lKo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=G5th1lKo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkgg6w0Mz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:47:59 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4581ec0e00eso4039221cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333277; x=1727938077; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHtLGGTaDvd+j7nlO+D4nlmKtDmH5wZnqdyAY1Z6B8s=;
        b=G5th1lKoDQXjQ2mMTMJWS9Wq+rLWCH31TkkzRhd0AfLMCEKFXp8/J0iJyFMPCVmRbs
         zqqIHMdDtqQMHxiYi/mHKzVXQfjCrbQWkvBV1gAauh2SPd0TMn+WcW5r7nhjHp6TpIDS
         h6iVmMriG+8pdEbm0mUqP0/o7fFxw7o9fDLqPyLLusmm5m/eD8MTaTuA9zUEJf8g8X1d
         Ndm8zCAqjCpYLKp4TO9GPS2zYGEgl5i/gWBcwHIgKmZmcyZfgCIQZCRpYXO33EB3/Y8N
         xKBjxBKKa/ajGGqVKYOcgQBREhTqDSHg4e1pfRQliUphTQ35XeB2Gmi9pgmg2+LtFCae
         Vn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333277; x=1727938077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHtLGGTaDvd+j7nlO+D4nlmKtDmH5wZnqdyAY1Z6B8s=;
        b=Gwr3Zo7oCDI5qFLUpPuA8EBAJZpSbdLiquoKDA7ntrgjzWF2k/pNFByQ09XF1kvU5g
         jfvvfs0TUE1QDobSgOKDGggj9HiegS5Jpm+hPs0kzB17TPzNjuGIgurl7884ekzd0/zP
         tGHPQwo8aT3DojHlJs0cNskBRP8zYTSYlor0eOp/gK7Ky8GMbzcVflO0BK2Lq7CzQyh5
         8nyMe8TbKSH1eZTKX13K8WhqSfkJlXoHLHp1PHt4755ggrhNz6TPe0/PxnC+HPDXlcG0
         7E7UyGVewZsiFwypTXf8k9u5VBu2e8G3IeZCpx0hrdm4NFkdBjJQiJzndPILsW52PHUh
         6bCw==
X-Forwarded-Encrypted: i=1; AJvYcCU7tZoevEh54ERkdsIM/TSZ0zyQA+x2b2j0RjZWShKNo1ZGHSFGH7XJvy6HHJrxu1Gc5TFJLix6mWjRR2M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyjA9CEUnSsJgx/bl2hwTkCeYqkxT4sBloomMy7GsMVJFzRMR3M
	9FK5EFn0bOyrl/AeGCkr/NnmzHQL6bPtOVWW125+DWIA72+K5uxNhocrKjI0W9I=
X-Google-Smtp-Source: AGHT+IGbo2MSjNAvLC3c2ApJAOpwKD09S+YUwBzMfKcY13i9YN/E+PXjNs0XRR1eOHqqnOUdrqUWyg==
X-Received: by 2002:ac8:7d42:0:b0:458:2ce1:26f8 with SMTP id d75a77b69052e-45b5e045ea9mr77074431cf.60.1727333276776;
        Wed, 25 Sep 2024 23:47:56 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:47:56 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: david@redhat.com,
	hughd@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	vishal.moola@gmail.com,
	peterx@redhat.com,
	ryan.roberts@arm.com,
	christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 09/13] mm: mremap: move_ptes() use pte_offset_map_rw_nolock()
Date: Thu, 26 Sep 2024 14:46:22 +0800
Message-Id: <9d582a09dbcf12e562ac5fe0ba05e9248a58f5e0.1727332572.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1727332572.git.zhengqi.arch@bytedance.com>
References: <cover.1727332572.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In move_ptes(), we may modify the new_pte after acquiring the new_ptl, so
convert it to using pte_offset_map_rw_nolock(). Now new_pte is none, so
hpage_collapse_scan_file() path can not find this by traversing
file->f_mapping, so there is no concurrency with retract_page_tables(). In
addition, we already hold the exclusive mmap_lock, so this new_pte page is
stable, so there is no need to get pmdval and do pmd_same() check.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/mremap.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 24712f8dbb6b5..9dffd4a5b4d18 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -143,6 +143,7 @@ static int move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 	spinlock_t *old_ptl, *new_ptl;
 	bool force_flush = false;
 	unsigned long len = old_end - old_addr;
+	pmd_t dummy_pmdval;
 	int err = 0;
 
 	/*
@@ -175,7 +176,15 @@ static int move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 		err = -EAGAIN;
 		goto out;
 	}
-	new_pte = pte_offset_map_nolock(mm, new_pmd, new_addr, &new_ptl);
+	/*
+	 * Now new_pte is none, so hpage_collapse_scan_file() path can not find
+	 * this by traversing file->f_mapping, so there is no concurrency with
+	 * retract_page_tables(). In addition, we already hold the exclusive
+	 * mmap_lock, so this new_pte page is stable, so there is no need to get
+	 * pmdval and do pmd_same() check.
+	 */
+	new_pte = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
+					   &new_ptl);
 	if (!new_pte) {
 		pte_unmap_unlock(old_pte, old_ptl);
 		err = -EAGAIN;
-- 
2.20.1


