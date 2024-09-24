Return-Path: <linuxppc-dev+bounces-1549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F194C983CC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:11:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTyg1scNz2yWr;
	Tue, 24 Sep 2024 16:11:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158299;
	cv=none; b=nGsuHN4OeduTd2q549UU8wI126bMWCTES94cL+QXGUlw8b7ghVNI4ANxFsZlqbRx9EMkZM4qA/HOcWoo5o2iolSQ/jqGk1F20les05R1xW0x0eqRBfpMVxrIplHV/EVA/UnGb4tEYBEZI9N7b8WDyw4bW5fIButCCjrdMhM0OVHLhvZT4RlZ/FlYNpzxZGf7cNDVC14ksu/jzbCKUBHZNYQFHPVulqN+AfCyNyAbUGGhF4poEkn9g5joeOygTANnuhfJfv/mGLZKB8skizuT90wlpU1U0WCuiwbG4PqZlIZfdtelkFg/B6d8B/Sx1lK38ryMfjfNUoG6EqcySIXP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158299; c=relaxed/relaxed;
	bh=RnMCKwBqnYl3LJbu0M9HQTu7wcymlNTkAYqiZlfWQ7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IiyMMWuu4GmTAdjYBu12XPRy2vKZD6gokCeRdF06jJ5K1d78Du9B9LPbigbmpUq89/qtRYz19gnHPK1eziPfVjOVhE8SydY6DlrdsCeQyTIbO+a6BDENlVKpCjU/89kvKBdCaORuh+2jEam1w0RfgLH6J5SU+hb69Luc57frTkHzsDAg7gOLks7ThL9zYIk+CecWBGMQ8+wRQdypu5QxuJFVZtH7EE8gMTz9oZPWkZvabOeNwlD2bV7cKGr4s43IKTrEqDVabawy14OPr2rlLvyuqxvHUxA9W5YNWMkI46/Ym3utlpKOOU3w+B7K4kl4hPC5X2HOTxtrmyQWJDR7dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DoBB7Hm5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DoBB7Hm5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTyg0GlQz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:11:38 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20551eeba95so44279745ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158297; x=1727763097; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnMCKwBqnYl3LJbu0M9HQTu7wcymlNTkAYqiZlfWQ7I=;
        b=DoBB7Hm5mPKq4GsOE8UFJ/v7MtaTmOxo26f/mfdXqxMez+JSMcsgqf3/5OXj1zorvw
         c4nyUAbdL+FkuF89d+BFLxLbvif+XZGA0Oec18N0GsOicCP4IofJYNTZ5BzDXPDQeYGb
         C2iRcfXbuQn7Ht8iPO557nQM6fFWsJYB52hUjLQgBHXCHFrPGrB1weH64gjLHGf+58bH
         TMvdDnDX6t5VH+UDerRANuk9CfIlvqlniZnsC4KvDojBNtSdH8tSbeP6iSn59jB0V98j
         AJWP8pRrCfXhRlUL8TcB/a+qlikV4PD7IrlGTc84EqpsqU06a3Prj/DTGEU72HIVftEr
         zUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158297; x=1727763097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnMCKwBqnYl3LJbu0M9HQTu7wcymlNTkAYqiZlfWQ7I=;
        b=dBBW0g1KVJzbeYxMc1Y+wOwxLs+fX4CGgDLgnmzXQAgHEpNddusE4ZrqWBCpIHSNxz
         SVn0mvZGJ6KYqEKWnLk/9lxyh8JacGh4gYouKkvkIquPUciFUWAMyldUAF60TgFV+58M
         ISXuOqZgE4frikkIWNcmwtOSFdESIUMihNSAwa2rTHCXOk6/bQ/TVOJoqXnZTiwDgGA6
         jMqQ/oeezxJRZe7UHRwnv0W5J1Z60P/NkHuOotmnrGvHzDu1DtYDufiZy8+/9/5bE8w9
         Guq0ZmopMB7LnJoAtkX3K9rC9bdpnmvGRM1V4ynmeCjgednVCiw01AwhpIsZ6MjAW+8i
         Smxg==
X-Forwarded-Encrypted: i=1; AJvYcCWb4RXbvRFhTxbVNgkOFPo84mfEm7sl60e1rRV+zZCnqcF7bpOJLhPNYwfcsYTVKOsTRidipUlO4c0af/A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwTQo9HvT14CTMoR7JyqaxZwHZAVO/yBLVY13QqywZjpuC0yvZp
	mnwyXxae/rhpxgMo7PNwBfSBELecHt+Z+VqmeBhdfovmgt8o5UUlhG4m+KbB+Gg=
X-Google-Smtp-Source: AGHT+IFBI5Ned/vbTuuRRzdnv79MFASKoi0/m2fLpf4am0H6y8GNq4qW/RgfzVT9no9zcYiBkg/Xzw==
X-Received: by 2002:a17:902:ea07:b0:20a:f013:ddb5 with SMTP id d9443c01a7336-20af013e29dmr19152265ad.59.1727158296610;
        Mon, 23 Sep 2024 23:11:36 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:11:36 -0700 (PDT)
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
Subject: [PATCH v4 11/13] mm: userfaultfd: move_pages_pte() use pte_offset_map_rw_nolock()
Date: Tue, 24 Sep 2024 14:10:03 +0800
Message-Id: <c55fd0511ef5bfc3ec4fbe36b34ce19c7903f6c5.1727148662.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1727148662.git.zhengqi.arch@bytedance.com>
References: <cover.1727148662.git.zhengqi.arch@bytedance.com>
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

In move_pages_pte(), we may modify the dst_pte and src_pte after acquiring
the ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
will use pte_same() to detect the change of the pte entry, there is no
need to get pmdval, so just pass a dummy variable to it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/userfaultfd.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index ce13c40626472..48b87c62fc3dd 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1135,7 +1135,7 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 	spinlock_t *src_ptl, *dst_ptl;
 	pte_t *src_pte = NULL;
 	pte_t *dst_pte = NULL;
-
+	pmd_t dummy_pmdval;
 	struct folio *src_folio = NULL;
 	struct anon_vma *src_anon_vma = NULL;
 	struct mmu_notifier_range range;
@@ -1146,7 +1146,14 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 				src_addr, src_addr + PAGE_SIZE);
 	mmu_notifier_invalidate_range_start(&range);
 retry:
-	dst_pte = pte_offset_map_nolock(mm, dst_pmd, dst_addr, &dst_ptl);
+	/*
+	 * Use the maywrite version to indicate that dst_pte will be modified,
+	 * but since we will use pte_same() to detect the change of the pte
+	 * entry, there is no need to get pmdval, so just pass a dummy variable
+	 * to it.
+	 */
+	dst_pte = pte_offset_map_rw_nolock(mm, dst_pmd, dst_addr, &dummy_pmdval,
+					   &dst_ptl);
 
 	/* Retry if a huge pmd materialized from under us */
 	if (unlikely(!dst_pte)) {
@@ -1154,7 +1161,9 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 		goto out;
 	}
 
-	src_pte = pte_offset_map_nolock(mm, src_pmd, src_addr, &src_ptl);
+	/* same as dst_pte */
+	src_pte = pte_offset_map_rw_nolock(mm, src_pmd, src_addr, &dummy_pmdval,
+					   &src_ptl);
 
 	/*
 	 * We held the mmap_lock for reading so MADV_DONTNEED
-- 
2.20.1


