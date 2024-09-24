Return-Path: <linuxppc-dev+bounces-1547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06799983CBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:11:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTyQ1n4wz2xnW;
	Tue, 24 Sep 2024 16:11:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158286;
	cv=none; b=U04KMNqijiqsDh08UP2btjgldfzNZgyDqg79G3O3v7x3qYBO8xUULlVF4XIyx7g73lUCvimuFcT6mJSk5s34qXK8cRmxGB5sWg54oFfM5rHau+rTEPG9Iu4/cu5+X91oVvUUXVL+7fz07v+moaOuC3NmabrqTvWk58r1pS84maq/c6lS9/bMTNesOqpPTM4ZWRxn+JskbYrCcoXtq3CDZ2yBFlFZJ9pZE/NL5LWc1iSg+Y2AJ/tVRoi+/RUg56091cw5Q7mOclwmYpT0JdoCSSo3n3T7J7rFyP8iqQwTbbqZeXN4VH0asrkZtAQwK0WMmFaUSs1nprvWzCuKcoAAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158286; c=relaxed/relaxed;
	bh=JYDx6olGBZytK5syFvtWNqesQWJmZ/VcuSiPjSyD9NM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DZCoi2eQKd9xXCgCfqtekJLqG8wSf9ydBFJlc3pMP89OIC2lYj0PV2jgyMMP+FFXFFxhjoUhYUXAno4j6d7s52NJtqqgeD6EZsYYA6RxieHlPoV86KRy6a4FckK5SVPFVqSNse0/be8HhZXr5Kjyu4owoMP0StTm6xwtWI/9SdMkdZK7VURIdH91WJUzy61QpHo8vJthcIb5W3gfRNX/s/W+1No/uDsVuUbmyUMf1qXbKA4Yy19oYJJ7jNnxaYxIDSwWdyx46d1xqFdJe59CuzTO16Yta3CWShk0BigJIw571L1WAPiQlD52gFARPRKR1ydwK2NonQMwN5WvR3tkaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=R52qkbps; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=R52qkbps;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTyP6cZ9z2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:11:25 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2053f6b8201so44771745ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158284; x=1727763084; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYDx6olGBZytK5syFvtWNqesQWJmZ/VcuSiPjSyD9NM=;
        b=R52qkbpsqEOxvHxY/dGb5vvPjNWqGzJv811yhLGl9y+UvVzSvgfMqy350t+KsmUQuo
         EvxqIaF4FLlRFNFD6qjRxmH9c5+XXWWhVkLo+PV5M1NPzDRbxNeqw2eG32fRdckg/APt
         qf6ZLybmNpZyuN8pcY4jbo9j10E42kjxH7tV6wcVeGif5KqemHI4N7+7+nmYDmukrSdK
         Ryk7gzn9oJiQLQHsg+QluLtyyGXAg1m+uU5fGEaRzpwSu4SxOY51747QuyXY/0lU5zE3
         4Gmd/Z8c9WIgmJXCtodN5kmx4D6upYPMDV6CCuURctm0x7FaC1BobsyIzucFaIO7Eoab
         QHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158284; x=1727763084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYDx6olGBZytK5syFvtWNqesQWJmZ/VcuSiPjSyD9NM=;
        b=J6M+L8lWB9zTX7vPAXfd6zFzeVgecPN+h7CAAalnJPD40+FJf2RhVcHv9fAP00ybuN
         RfEgsQh5wKPuPRbf1BgVH6QiwyMYJeK9GlUD/kDd0BrHlYQSiZL/KE+IDn4pcKZeV710
         CysmscxMjJLCPBhudqD02p4i9HPMPcQZOy9CW51kHgMolV/oot4TTr8wELIXut3QNXf3
         u/l+HV3EvRTAI0pGKk9l8A2uxobkPTAboY5ARZbsz0lnjpxnDAsoQKTiOofPq078faC6
         6owoqwi/4rplGeFnqomXa6rheSs1vgN/pe2ik/sRIpNH2eJdjx+zobwhNmlnr1nXObqk
         r2JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa+tRB2nxKRII9ymNOrBPUYl3wY+ydAdjpDUC5LReTi3Ge3a4i5iDtAWILdGdvraw5Ne/SQuLb2h8yq1U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx08q4Rrxb1wbvBcLxJiUh63z5ES5/mmQ+cVY3JZerTZRD3XOOU
	671Cof20V+OpCjXEJMfMAMEbQOwqbymbxWpjxovp7bkcS8uaVk74CY7zyaF0Yek=
X-Google-Smtp-Source: AGHT+IEhn+iGj1vkzgTAalYoZbG5psMaFd6djM60OU+3J7JbD8pdYTlvGGhg/wgUQ8cNcQFEVSSWnw==
X-Received: by 2002:a17:902:d483:b0:206:aac4:b844 with SMTP id d9443c01a7336-208d97e3f78mr215574535ad.6.1727158284398;
        Mon, 23 Sep 2024 23:11:24 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:11:24 -0700 (PDT)
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
Subject: [PATCH v4 09/13] mm: mremap: move_ptes() use pte_offset_map_rw_nolock()
Date: Tue, 24 Sep 2024 14:10:01 +0800
Message-Id: <c7b3ba9e8e58efe7bba9d52ce30a8ff4f4298e2f.1727148662.git.zhengqi.arch@bytedance.com>
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

In move_ptes(), we may modify the new_pte after acquiring the new_ptl, so
convert it to using pte_offset_map_rw_nolock(). Now new_pte is none, so
hpage_collapse_scan_file() path can not find this by traversing
file->f_mapping, so there is no concurrency with retract_page_tables(). In
addition, we already hold the exclusive mmap_lock, so this new_pte page is
stable, so there is no need to get pmdval and do pmd_same() check.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
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


