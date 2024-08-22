Return-Path: <linuxppc-dev+bounces-320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640495AEAC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:16:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDwk4yXzz2xYl;
	Thu, 22 Aug 2024 17:14:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::36"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cs8MKNLk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDwj6pvtz2yp9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:45 +1000 (AEST)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2702ed1054fso295141fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310879; x=1724915679; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCwbwV/YmKb9rcRCZPyi2vEyGZwxl6QKnoBllHH347k=;
        b=cs8MKNLkGr7bmSr1XA06ECR8qdSnOuZnFbLP8OPOLQL3mY6rZ+ZWJaCIjINMuFTFFD
         K+Dc9m6ZP3k+99y2q4HOVnotrZXkBRY+Hj8MZg27SFKZjuDQ8SU1ym7ZLApfMEC8HZKY
         6tIRnct2xCOpRh8cuXv5XdzWydPHhIVEuC6c6GSiA9JaWT0M1UZBE2IYhWI+UA/qg6su
         RnXmD8Jza31vBpQZ/4ebNll+uW5BPUdyVhHxzC9Z4QKsfKLIvRYQeF8VI/Zq2FKF8ae6
         hj9oo6L6M568uyziduUmUg0RCrSg09IUAr/Chj3nznoPYypzRcEe30yeR4wDb32LsagJ
         0cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310879; x=1724915679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCwbwV/YmKb9rcRCZPyi2vEyGZwxl6QKnoBllHH347k=;
        b=kkNs1JqQH6WwRLwk2fIrITsc/keJ/zHSaY27ZwJ8PhonUM197nEWQWcd7r5Q2zNT+6
         4sP1VquS2C9A74N8H6KQZf1ze+Vj/bU0h1lLGux87r7DlborFNhZ9sBHQcxL3+GIjuwO
         zk3+ARk4GQ/KwQHGTS7dV9A47untcNPK0DBJPd/8eu4HZMWfaMG1ZU1Oqh8hTrAwtb/6
         tVvB+3gzqWSikGbjwRAPymJIeOucZdstN9bUVBhvGZzSNqc6l5jJhDUiV8LalOcrIo2j
         QiugJTGF2iIdGvLbwWWabVkghPWsGWR616QC6Qv0cLHq04dtnUQ7T8+3RJ/PhEZFDc6M
         /m6w==
X-Forwarded-Encrypted: i=1; AJvYcCWDW4kJac0/cdJoYRfe2OVNf3VwTKld55HdrV3Ald/6M1Jx6oG1272W52otJKCYCTgLIBemrISYCpUbCzg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPe0PX5p5DimddKcu9HhVhFoId7vK1zXuYK8aHxoZHO4FaNbCN
	8RqjyCDIgoLEBC0ycqVmJd52l5I6YCh62UbO/nUfFZZegIWVB0R3FeSKqEUvfhM=
X-Google-Smtp-Source: AGHT+IFsTn+Q5A1WOhbyPTAjHclYiOvt3nhLZV/Hi5KOu9NOtbxQa/3JykhMvHE3PrFxCVBhO2k7lw==
X-Received: by 2002:a05:6871:149:b0:268:afc3:648e with SMTP id 586e51a60fabf-273cffcb557mr1073020fac.42.1724310879532;
        Thu, 22 Aug 2024 00:14:39 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:14:39 -0700 (PDT)
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
Subject: [PATCH v2 09/14] mm: mremap: move_ptes() use pte_offset_map_rw_nolock()
Date: Thu, 22 Aug 2024 15:13:24 +0800
Message-Id: <12097a187fee5f21860d4f87e7aa103f822e298e.1724310149.git.zhengqi.arch@bytedance.com>
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

In move_ptes(), we may modify the new_pte after acquiring the new_ptl, so
convert it to using pte_offset_map_rw_nolock(). But since we already hold
the exclusive mmap_lock, there is no need to get pmdval to do pmd_same()
check, just pass a dummy variable to it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/mremap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 24712f8dbb6b5..f96b025c09079 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -143,6 +143,7 @@ static int move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 	spinlock_t *old_ptl, *new_ptl;
 	bool force_flush = false;
 	unsigned long len = old_end - old_addr;
+	pmd_t dummy_pmdval;
 	int err = 0;
 
 	/*
@@ -175,7 +176,13 @@ static int move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 		err = -EAGAIN;
 		goto out;
 	}
-	new_pte = pte_offset_map_nolock(mm, new_pmd, new_addr, &new_ptl);
+	/*
+	 * Use the maywrite version to indicate that new_pte will be modified,
+	 * but since we hold the exclusive mmap_lock, there is no need to
+	 * recheck pmd_same() after acquiring the new_ptl.
+	 */
+	new_pte = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
+					   &new_ptl);
 	if (!new_pte) {
 		pte_unmap_unlock(old_pte, old_ptl);
 		err = -EAGAIN;
-- 
2.20.1


