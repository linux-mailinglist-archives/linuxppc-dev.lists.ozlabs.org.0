Return-Path: <linuxppc-dev+bounces-959-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C443796B516
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGDZ74K1z2yFP;
	Wed,  4 Sep 2024 18:41:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439278;
	cv=none; b=WBrzPhk6J6VBzuxdlukMFJwJ6LIYbqsVtMvu0Dsba5stdoVaxDk4Jx2YZMyx8flS1ej2zWlUwwROs/f1iUpfVFs3vQKUOl7Q+7Y7wlokUMe5YHr/ITWXkUV1datujjb4DVgllVg2W2lfuGAjHTEplaxUfIo650urUe62uzMIxhYqHLM3rGxlo24gU1DYqICYMjxVUkZl68fpfwX8ImeSs/TcJPl62xSRF3PWe5ojrleG9kXS6KmI/QFCzsc2/xEcthl5bzLr3bf7DkwNXDHM9W/wd4iG9j47w7fOY0p/QHoHfn+vF83N3D4MkhX9iXaCb/89tR3RL6GKk4hyZl1fWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439278; c=relaxed/relaxed;
	bh=C6e2rRMn75kFV6Fv258+yl1EB6KpOV48BOzHpMuHQ/Y=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=kDQwTAb/crI2xm+MV8S4suKOTSfJ/vsRoKn1614l2oO3dkuxZG7yF4iyPbBF6HjIPFJ3uwdAmULTQP5cJSGoWXCMw2JMfHxWGa5mMTMTlegnmPdKApbGLJrLf1gbga5znzbv3M42KhmfTTFDywnZhS+zm+IR1AUtbqSn0T1tVGrYNOVP2qEAGURXT9DZI3mEAJvsvIVkP9zud0j/lQWCeYdoQ6mHVlMID5/vMgAlISAIeGwdYe83HYE/6MRSaPCuDSvD9IpTWSaLXMN83EHMwCta/Kk5TRErEqLmB26OUzmXOflI8qKXZ9pg74BlFJA2R3eIead3hKd7qZUXxyVohg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fkNQ8Bi1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fkNQ8Bi1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGDZ5Wp8z2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:41:18 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7cd8afc9ff3so369767a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439276; x=1726044076; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6e2rRMn75kFV6Fv258+yl1EB6KpOV48BOzHpMuHQ/Y=;
        b=fkNQ8Bi1aLxMnQ4qN9uDDmKOaXe9CHd4j6CvpA2XCg4AR3hAEKjNOzZLbngyQwd5aX
         hir6IOduAcCxzUrPUDqJcws9IkKO4rw1GnPoWlKjvmE5uej+Y7hVh9oMEueYvqbflT2r
         qCgX00MG8BJb4EDTT/Ljp3a0gcXtN1IXEHC+xAkWrkoepWgAPJvphoApi8GgZu852rug
         sLLt1xg+Wn116M7HwBNNGrpOKvCP+7MvLCYzVcO05Ve3rmhSU0eGdZik06n/H0kKepvp
         zsneocIYnC/FrZg0WNWN+JETeZdJ9C4AtgqFyBN4mMwEJBtv52lidnbxnYmKp6TdaCgN
         AGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439276; x=1726044076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6e2rRMn75kFV6Fv258+yl1EB6KpOV48BOzHpMuHQ/Y=;
        b=d9B3m8RYdeOmr5xFiOThPlCmOQteqlZIsL+f5593kS5CkJBqxDCzVF+m4m8jvBuOiE
         aCCf4t0g7clxMVs4uID6Qtju8ds3sFprfDhIeOPOGtP9zPUoKbbcOcA67kkWDyQVw7Dh
         3wgJyNZsJVO7OUbneIkkeHZWylC/B5cdrForo/KZzayY4X41cv+XwSNO+WDK/YiLOGyj
         vdecm0mY490R67gdj/co+oHIbUpURYBAoeMbbLUCH/yprHIyEiXDiaSzvn05BzGQmODh
         2WZ1PPY3vcHyOHRALkzqqroBTNbIFaCSBjWYpGvRMmaHhiKO8LQ8e+INmnAMSSwDMXWw
         C8RA==
X-Forwarded-Encrypted: i=1; AJvYcCXiq9os3Sik0UGpQIGWQZ6l+S5ocBDVDCDH2xiTdEdr2fjreIsJ0HjacYgh/fJjkZ2Aexfx6OB5321K5Cs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJiRCtLT/cZ2Uyffa5KILtojstV5mYqllv6n4W8JswQC2saeP3
	LXsehco8qsl8DNXYIHlywLMdRivHYbswKitRt8MDtYjZ94kzGE9SCpKMz6yFyd8=
X-Google-Smtp-Source: AGHT+IEy+qEnEqpj3sReiKH3tPFUkwjqR7spuVkWXeQJodyHWsfCM0cenE/z+pCdCppofQTZA+ekKQ==
X-Received: by 2002:a17:903:283:b0:205:76c1:3742 with SMTP id d9443c01a7336-206b7d00d3amr22901025ad.3.1725439276249;
        Wed, 04 Sep 2024 01:41:16 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:41:15 -0700 (PDT)
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
Subject: [PATCH v3 05/14] mm: khugepaged: __collapse_huge_page_swapin() use pte_offset_map_ro_nolock()
Date: Wed,  4 Sep 2024 16:40:13 +0800
Message-Id: <20240904084022.32728-6-zhengqi.arch@bytedance.com>
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


