Return-Path: <linuxppc-dev+bounces-1550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3745983CC3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:11:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTym3xrlz2yY1;
	Tue, 24 Sep 2024 16:11:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158304;
	cv=none; b=oyo2AAnMHKZZ8wbOwQ8eUIk8GJXAHjHz00OAJ1+dlN8BMFiI5Zq3Cd0QqVwnkzyUewMItNXCjQHVLGGrYENmH84Du1ln2BdOiFSpGe/6UhAB09JbE4nZJAXjtgKjALsgvaMYwFFjPBFoLY846vcFGvE8fkdvTLtnukTaWwS5umdAgNaGp7AtzBhMl4AwAgcF2HmrJNCJS6z1UHM+VUPWU17t1tYFDjsCc41wdIcBZx3TuyJho53F8SVqZSXuSZKlOJWPJ4MRfdTIfMoyOh0swmeQzRAjbhAOv6+3u5rh0h3zKY7dqFf9w1SWoio3+HsY93WyjZRXnSTXmed7zNwUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158304; c=relaxed/relaxed;
	bh=fwq8DT6JeNdavhckGZI91GgKWXC+kbG6stmMQ1HgBAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KBYxVe5qqL7PJIFJQhYId161hvJBB3Zk38Zp7NwYFctLLnR9Vakmwn6eoQQeFduBCbCz+VObbJOBUUxCClzAHgUjTzptd7hVmLGcL5FsrQFdgfB9DuIOj9d7odS0s/aH6IMb8F/k5w16wEzv5chNX3BfhdcqBPdhDDXcHZqPWQUWnlKsvNbKNYHyfqB+1YifEOYzaxC5dRXPOx6tu5Oes91WLhgLDEmtEUZJY0sm1S2QO2bdvQYItKKNVYnSWZh3rwfYKTAcJBHFs7QHhcmvbaK1BL3EEpIMYFhxac/icNkhazyGMEnFKYXCLyit/sQqBQAH8aVLw5UPkBt/tPZAXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZpstK8c8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZpstK8c8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTym1mSjz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:11:44 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-206bd1c6ccdso48966145ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158303; x=1727763103; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwq8DT6JeNdavhckGZI91GgKWXC+kbG6stmMQ1HgBAg=;
        b=ZpstK8c8P1Hir9OaEloQZhBnV9LoAZbogF6kO0nSqFCm0AaH6Jnu9Zh00ldIhPmLtH
         XBQAhewSrJKukhM+IjMz0uthvWF1xtSkC/LxfKMtM4Rqww8p0DurKc0a5jKc1DlbJKYZ
         lVTtSeUUWQWKhHBYvu/SUztJhNUHZ5mOQL317J3HMJD40l9Qg0iuhTIAKmbPXsjtqJ++
         sGqZ+za7kfwbDU5k1z8vAD0BJId/H6mt8heoET/P4xa0uUY7qxKym4QKcrmAgF1X6FT3
         AwHHDRWmIKiZOC9HVSbI26EwMaDSSk2su4doRapz0dr+6P7eEbsrRcozULgMMrwyTTX6
         T+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158303; x=1727763103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwq8DT6JeNdavhckGZI91GgKWXC+kbG6stmMQ1HgBAg=;
        b=QbGGeEVZ0mRqdVUCO/oYwghpEEcHSQgfJHqWTSprbUDK0nl4qPy71KwV745QPtRCfL
         KDMrhHSzZobOyAIMBsxZtqqOOrlI3hQ9mu3HZLsbC0a/8OWVKcDKzICQztUinhzVFkD+
         RDPr5379ZKQbcFebcRns5MZYCd3sZdyWRzp/cytFsHbQ5NO878ja41uny95EIdbBUhak
         GnZrFjrDlotsdjdRBZiXLYGg0PtS3VnLkdMeXGGB/hWmwOA49QRcleNGdIfpWYX/oHwh
         tftikJ2Qvt/j3fx55bXNOXYKRSQ3l6IVwpByHy6jXyy9X1YPYyGE7iYJ3B7tIzRL0sAd
         WPTA==
X-Forwarded-Encrypted: i=1; AJvYcCWJpU/ZAi6EH97Yb3SPhs795+yFueOlpLV6CtbE8YKKL94L+whG/QJfcWUr1a1AjIHDhcd+dvbey26c2WE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxIV6YS9e7OdRe+F65y1cTW3jkBoRcYpIj7w1r5iqNJH4XJ8dmo
	/gpNX5+bGnL0x5/uKKMX0UDYfNhrgT/2tXe1ctjOvBSnw7pZSRDnIIMNflFM7d8=
X-Google-Smtp-Source: AGHT+IFl5AsK8a8BNnydzmhf2ct6wAj0Fi3O6gM7MY+2JS5/M4Off4jZQYnq6Yk2iDK5ETk+W1TbBw==
X-Received: by 2002:a17:902:ec87:b0:206:b915:58e with SMTP id d9443c01a7336-208d83af7b0mr191498925ad.22.1727158302727;
        Mon, 23 Sep 2024 23:11:42 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:11:42 -0700 (PDT)
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
Subject: [PATCH v4 12/13] mm: multi-gen LRU: walk_pte_range() use pte_offset_map_rw_nolock()
Date: Tue, 24 Sep 2024 14:10:04 +0800
Message-Id: <6efef5316d7468d13ed5f344452a0b872481972b.1727148662.git.zhengqi.arch@bytedance.com>
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

In walk_pte_range(), we may modify the pte entry after holding the ptl, so
convert it to using pte_offset_map_rw_nolock(). At this time, the
pte_same() check is not performed after the ptl held, so we should get
pmdval and do pmd_same() check to ensure the stability of pmd entry.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/vmscan.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 749cdc110c745..bdca94e663bc5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3375,8 +3375,10 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
 	DEFINE_MAX_SEQ(walk->lruvec);
 	int old_gen, new_gen = lru_gen_from_seq(max_seq);
+	pmd_t pmdval;
 
-	pte = pte_offset_map_nolock(args->mm, pmd, start & PMD_MASK, &ptl);
+	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval,
+				       &ptl);
 	if (!pte)
 		return false;
 	if (!spin_trylock(ptl)) {
@@ -3384,6 +3386,11 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		return false;
 	}
 
+	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
+		pte_unmap_unlock(pte, ptl);
+		return false;
+	}
+
 	arch_enter_lazy_mmu_mode();
 restart:
 	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
-- 
2.20.1


