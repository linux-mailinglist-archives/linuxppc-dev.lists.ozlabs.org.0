Return-Path: <linuxppc-dev+bounces-1542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11604983CB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:11:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTxr3xQkz2yLJ;
	Tue, 24 Sep 2024 16:10:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158256;
	cv=none; b=X0wpqzFta2tIkNDmQ71M7cv43tD1vOz94gLDHMzG7ObMwEMuol7dtsPS7RSp2Pvup0PSN6ksnl0vYsqYtToP4JzxI8HpGCYWW6CpTFSEEEjB+lloUy1IZLZz8K5AS4ock+mmM/OsIV4vkoV9xfgsx+mwObpeS/Q24/wbzXEoiV8wq3zNR82PkZ6bf6PprVfUSZccUAfZdI6W4BS+2V/RWuHKMYTAmqaFo+sOLCEkmnLlxS6Mj/D3dyA0pH5d8tLOuqPaDbUQs8jI+3XDvhhlxgklfpC/ukHBPK0URqlby0TEF/seqTBkOuSjxQVBCG3UAK+w74ubYjc9ZceZRM5HKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158256; c=relaxed/relaxed;
	bh=C6e2rRMn75kFV6Fv258+yl1EB6KpOV48BOzHpMuHQ/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ilek6hB8gcBusT6oee/4f72rhL90eMp22fDOvbX0xgAxHFd9clUvyEirwNMXGWHewDZ4HsfUqMnKMtcPOMaVfLIPc6FrZd1f58cHtnPgPf/Umgdcvsms+SzTWZSlSOu/y3Pp0/7iWzCIMnKb6IuaSo4wzCQgBgW/DF++TH9INqo3vdXApgUFkzox4wRIHVl54LqGZ+TEs0JzYIihwoop+5DeeEtTHV4a+1GKbU5BcLoZWvsBcPuwoKaJrmeyUPkZ56DC/APhg80GWI3W02kUScSnl24D4qFasB8UbiNyxE68HXoHFo/kixkfayhH7A8CQ60ugj7xQx/w6fVPNIUodQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AIdU9bR/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AIdU9bR/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTxr1mRvz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:10:56 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2059112f0a7so45869425ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158253; x=1727763053; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6e2rRMn75kFV6Fv258+yl1EB6KpOV48BOzHpMuHQ/Y=;
        b=AIdU9bR/LeyKmAJGdSdlcaJvLQYB0SIyK1E7FpQzSyRCSFnt3YV6Ro1WPg99R6u5PE
         gyz9tFBLi9OvX1LSC2Oz7CvszGY9xdElgba6VbBAfyr9HbqiBVb7TYSmVq+Rgm19LorP
         JD4qpOG2yD0ALbd6iXKaUWShJfzxh0J9xLpdrdgb+fbd9p9kd72ra+2dIXPGUVZZUafB
         h6b5Wpgw80REpO4JZgrU8+WR29ywTAN8Xwq1r6V4Os6f6bWI+j8iw19+LYu7MUuQKPN2
         uMGpb+Ql7c+Ks45ZXzluGY/EJbZf8XzcsJ/cdoKhKF4qy1rnep9FwwrAyI9fodsdM1Jh
         8OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158253; x=1727763053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6e2rRMn75kFV6Fv258+yl1EB6KpOV48BOzHpMuHQ/Y=;
        b=O2W6GiWTevaBtbX3SRrnI3evUCgrPN6KcafkgeUZSzzEb5oVgrG/xuTtsnkvMa8V1M
         nnVlNv5lVJq/dbl3MG/4mEWtrHuQkApOLhQwJG8TJ9vnykIfRQjVWJydkTdqlP02QpI0
         dfHv/eDDTAOVbY8wRDkrVselON8LDta8hthzuV6gEkenXmSohq67oN5qCEgOF98f/se4
         T+fwSJ7Avifnitc1ulXu0wH42isqHH18dRkqJmTZK+TB7if0INMWsKSNLhOI4Op+Fsfu
         0zZrK+vgoa6tVAW77t6OI6EJ9odcXwiDGAR/n9QP7ePAkGfQ1R6TUAcPP8peYbErPU0i
         DixQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2Ajn8CskeiUrKKScDWViUeW10rkcp4H5k9xNKB4yvFH00TPy7eF+PLiFPKcDIAiSETHAoX5dy15QWp00=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhklLffvU7swA+O28BwdwwUeEqKAvp/o0g74mbONP5hNnDEhOx
	KzFI78quRJfmffHazv1s/ak+w5EYUPRKbc2/6pTz+MgtydnOvsW0eoOQzoMSnuk=
X-Google-Smtp-Source: AGHT+IEXIad82sT4qTFz/mgMdJh1108B7x8i2K/1dZJvW9IHButimBDIW5JZoOsyX1eaQQUsC7JSYg==
X-Received: by 2002:a17:902:c94c:b0:205:4a37:b2ac with SMTP id d9443c01a7336-208d83c8698mr211905735ad.34.1727158253643;
        Mon, 23 Sep 2024 23:10:53 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:10:53 -0700 (PDT)
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
Subject: [PATCH v4 04/13] mm: khugepaged: __collapse_huge_page_swapin() use pte_offset_map_ro_nolock()
Date: Tue, 24 Sep 2024 14:09:56 +0800
Message-Id: <69e1c4483c2d679d3e2c8446264e5878e5b52a97.1727148662.git.zhengqi.arch@bytedance.com>
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

In __collapse_huge_page_swapin(), we just use the ptl for pte_same() check
in do_swap_page(). In other places, we directly use pte_offset_map_lock(),
so convert it to using pte_offset_map_ro_nolock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/khugepaged.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index f9c39898eaff6..6498721d4783a 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1011,7 +1011,11 @@ static int __collapse_huge_page_swapin(struct mm_struct *mm,
 		};
 
 		if (!pte++) {
-			pte = pte_offset_map_nolock(mm, pmd, address, &ptl);
+			/*
+			 * Here the ptl is only used to check pte_same() in
+			 * do_swap_page(), so readonly version is enough.
+			 */
+			pte = pte_offset_map_ro_nolock(mm, pmd, address, &ptl);
 			if (!pte) {
 				mmap_read_unlock(mm);
 				result = SCAN_PMD_NULL;
-- 
2.20.1


