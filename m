Return-Path: <linuxppc-dev+bounces-311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F9995AE92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:15:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDwC2LKrz2yPj;
	Thu, 22 Aug 2024 17:14:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::22d"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hkhjhs1w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDwB6l4bz2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:18 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3db1d0fca58so279838b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310857; x=1724915657; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toohyZrQNwk2kNUrhQFlaPWHYnggLi3YB3M65Yq8QzA=;
        b=hkhjhs1wVytFCBaYErD756Jzgt+B6ppJIz5j15FWmjx8WPntZDghQ0Szbe6pUC+GUy
         Og0V+ww+fGjGzDgnmtdhZWieE4I7YJT7jKjCrwteRuWCWPQOO3XLK+ABx9B6S6YTAaPT
         DT1qp18hGKnOuj8EY6C4TQ0JkAab8jpsYGDgRAAZx5LxI3noRB4V4cO29frUO3r0TwD9
         t+EHRbYG/WpkNAEQbIF/Rv1Rv9F0uKASrh7t2jThtuA08zT6hRkPB9jGfP+AsbSPW9UQ
         wuu1ODG8Yb8FJtJxEBgmoNR1yE5aAMeAjBGY1Qq9xwordWS2k7o0e/nISosp+RV1BHvA
         lmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310857; x=1724915657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=toohyZrQNwk2kNUrhQFlaPWHYnggLi3YB3M65Yq8QzA=;
        b=tIY1VtN+24tkSlJNz7L064CUrZkjUomFVe+FiCSkqFHAVXDC36pzqiN9OJLz0QtpZY
         k+cXdlP1zBbE4MjoveTn/RKY3CIy88X/XhmjRDbVZk2KY+NmL5eApP94lm2v4dpfmerg
         cvAkN3bANQJgyCetLCz9uDPhLodH2gjBJ+O5snZt6UFxIFfmtnxE20/pTg4VzxfxMybx
         p7kGD7+JYctnr5FyXv7yjRYaOMVj7/vnwADfScTAojRz5gOcOL2N0nVoxD8oS5Ep8Fot
         PgWnfWX8jZbtIUXE7sijKyKcZpvIBKohfTF8ia20sgMVS4lhB5JXOtrM3kdgwb/O8vFV
         U0BA==
X-Forwarded-Encrypted: i=1; AJvYcCVRv/QwyMNyAydXdoWN1QrPTgPXtnIfZ/Tr8WtyKo8vwfbMiHq3TRxnO1CSEAMZSnwe5B5J/NB5tLyH3G8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx8HF0GjQfduEyG9odszlml/dy7mqQzgYZzyfX0pR/vl2B8Fr6C
	YuLXzd8aAK+uTVLWuOxM3XVv/zsKypByUU0wOLQ7JObFAnp1h1KGaW+MVnoAX/E=
X-Google-Smtp-Source: AGHT+IGgjighdWtbrKc2Se12Iutexgq8AwJLXy8Rdygo/b6qt6ZS1aEL6K5S14xFU0XlAJpbImifsA==
X-Received: by 2002:a05:6808:179b:b0:3d9:38e2:5392 with SMTP id 5614622812f47-3de195c380emr6158328b6e.36.1724310857179;
        Thu, 22 Aug 2024 00:14:17 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:14:16 -0700 (PDT)
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
Subject: [PATCH v2 05/14] mm: khugepaged: __collapse_huge_page_swapin() use pte_offset_map_ro_nolock()
Date: Thu, 22 Aug 2024 15:13:20 +0800
Message-Id: <2b7dceaa12da273c6decf92e3bf2ebc4f4e85ec5.1724310149.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724310149.git.zhengqi.arch@bytedance.com>
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
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
---
 mm/khugepaged.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 4a83c40d90538..53bfa7f4b7f82 100644
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


