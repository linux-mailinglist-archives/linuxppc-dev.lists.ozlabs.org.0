Return-Path: <linuxppc-dev+bounces-965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14F96B528
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:42:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGFL1X6Tz2yYf;
	Wed,  4 Sep 2024 18:41:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439318;
	cv=none; b=GMoKnfDH2gh/eDt5qaKpr0ZIZVhF706qrNuAQM1YjjMuW9EAfkROiF9ZL2/+alaKIAOptL0yvQqHI4omPGY1hZDkAsLMzr/6+3AaG0Kp/6BactEOIezVgziIKb60sx6lSMDobWMdJuEHR8pZZAEmULLeUO2pEoW3uNVBsXKBOR+m03+HsVJrdEnoqhQsDurSaK5uwpAqbvg4VWlks2duPvYhaBH6dbn2bcPvhSs+iFmk03q6wNlYxJC5D5E4aJCLUs03sfFWzWqyllfZdJeQaMM43NeksW5FxEC+/Dx9Drf7wMud7//ddXPr2C/qRyFe7PdEbwu2GijLroGmTVDREg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439318; c=relaxed/relaxed;
	bh=4PxEMdLIb7w0CeH690VB/ed9+hRnYGoSsqaGDg4GBd4=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=JxG1lNybjQ3wmV2RctD4UyRMg6Eu+Q01cQfzh6L+gGlQtP/B/qwOIldPk9trB2cGz/Mg2+a9QeJ2KaoUq+0KQbIP5sNB/0ymhEEioS//CWo5SC0XvTTiMq0ZhOFmI+cUaSFGaKyyZJemiWkxAE5pwY5re5rPNnuD7Mr/H+U1bbrsxah83yNrvfAZz2Sik/VyR4oZzD9LKHKQ+lpiKFNk+4hEFtWI6WRTV6gmAXt3WmZoj2w30q66+mdWzKa0Yfzyyq5EKaqgQqzzDqsIiv0I/iOuTbeargiOQzRxvbAxMw2E0jn3d0EJBemeLYkjc5g27M97psbfyX32Sz+E9h/w2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZDlgTysk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZDlgTysk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGFK6Ntmz2yY0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:41:57 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-206aee4073cso6775595ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439316; x=1726044116; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PxEMdLIb7w0CeH690VB/ed9+hRnYGoSsqaGDg4GBd4=;
        b=ZDlgTyskaqazQepugMUvKIoHyhQ4V+cTPQSR8LuRqRMGvQPBbdYRl0sXgcgPdjkJAx
         oFkVeHYiVfoWPvKrMEZ4G1ZlRusEJn/qpXb5zUZx4dJoOAkKEB1fQQp3Eq/RSAOVMzMC
         RKrcw64TkkiYrnYaxT18Bu+D+kZfy6ltDoTKjWQnswMtDvlXwtNmM5r9XhzHpDIInElo
         HGlOTRuAejLwM7MZqk9o8LS/SufvEVa1Y6FXDK+vuzEY9hwtg+f5JbHNTUKXGQBNJRiB
         pgzMtxQUMUdX3BPkUo+HITe/cfBqVn5Azy3zjytwAAzfmG3iNcAQZt4oJH1C0iNinxDL
         zsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439316; x=1726044116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PxEMdLIb7w0CeH690VB/ed9+hRnYGoSsqaGDg4GBd4=;
        b=R1oA5MrycWPZo91SwLhtoXddaWGeHFyksdcZG+wzIvNABzu9YIv8Ger5p4HPlJOB1B
         2WcIWwFXyvobqS3nyl7u/ntwVV8SpQo9Il23I2R7GNSLaG2gn+Kh0hFWqcEXuDrQTO+E
         Bczbkw2Ljg9XDQ4ICfEPcQPJt82qNtrYeB3bn8zocSuRCGesp9y3UHwibALS48gBK/Y7
         JarLZURgkfSTt2a/UfvvFl6gCFGxlIvPYrKbJZe3cgrWHv6uz7p+PTlXvWUh7Ex1Nx5H
         M6gFRUE3ly1K4ZJnXvrpVeJFOms+zdT1mGk7Slikln00xDRlztcrqS2fI9RF5z3Yiwhi
         omag==
X-Forwarded-Encrypted: i=1; AJvYcCXso+I+pweMK82rwbo8zbccyj5xzizF4KYAZdNNM/dylCvgU81efpXv1Y8j6e4L5e/1YpPUgfHrNamVjl4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5ECTla6DX6AO90buIlIXIf4QF/dNuznI/1UaHsNHZTQEBd+BK
	+G2QLQuImM1u3x2/G9Zrlfy24/h3BCu7xA2QzOpzcYgBJl1fFOphQEMmtzpn8aY=
X-Google-Smtp-Source: AGHT+IHUb0AH81Bf+t9sl3x8o3nWMR3fxDcIYnthyKOt2Ee/pQCOOrlcmsn4X1RsHo/HQ+Mvmo6mhg==
X-Received: by 2002:a17:902:f94c:b0:205:4273:7d65 with SMTP id d9443c01a7336-20546131866mr119665875ad.21.1725439316150;
        Wed, 04 Sep 2024 01:41:56 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:41:55 -0700 (PDT)
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
Subject: [PATCH v3 11/14] mm: userfaultfd: move_pages_pte() use pte_offset_map_rw_nolock()
Date: Wed,  4 Sep 2024 16:40:19 +0800
Message-Id: <20240904084022.32728-12-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
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
already do the pte_same() check, there is no need to get pmdval to do
pmd_same() check, just pass a dummy variable to it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
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


