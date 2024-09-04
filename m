Return-Path: <linuxppc-dev+bounces-956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8243B96B50D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:41:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGDC3yKlz2yRF;
	Wed,  4 Sep 2024 18:40:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439259;
	cv=none; b=XqIDZr4DAyNMTf8On9SkH/39HooIoeq3ZQsTcdGy6BDP0X+6zsGkctIw4o31s+stFiFuueSsWzYagWPEcC2uHVsVs/hQ0Mf1IUDaOeNH/WfBa6Fn72L/5EZeXOxzf7kNV7kchEMSCITgtYrbCo53Utf04s42xox9w+R/PJawW1xvBIfK4zU12RycGJ7fgdDBseZuSDarihjAJjtxGUrMWJ1pCEnYPFfJwFkhSwc5vDBciv7hSIilgO7ouLHH0za9HbQxYploQot+XzAbwkqhvAaceNv6n+hssKUAJCR5vmr8JAd4NFLZwsnAjGtTS5KaGaa/dvtQufGtU/sP0zSZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439259; c=relaxed/relaxed;
	bh=H/kyF9mn9oESktxWYdr3s8d2VJ5iyYEZZY3E5BXrvv8=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=fW0G4QuKSd5ygxzAocfK4i8exImKD2q3uLFOMIyVd+JFfWShoVJcGBrjvGcqGpSkmBpqXCWR4B7h9gJBO+r3Y/nMUh3mmyzY/iCBzba7VjTxBvuXcK5q/3F1Of2Ff16Eq1lKRnGHB/7yCZ2ER//7FOgnAMrzNkHkz/XhZj0BRsygaclpU6Q/blJ4lR3hHcWtItE77XKw9A8mW/94tLC3/mUSnrxpKz5X9zD4RVbCagL6KgliwB/NNc1tfBaghnhAjEkKXE1MQuvjKUND1ngKztMUSJT13Ah3vArt+GmmF6GryrtNlR6JptnDCg+H9aibkPgW9GqtMzsa5KNE7evZZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HoKg7pjX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HoKg7pjX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGDC1kK8z2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:40:59 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-201d5af11a4so54906595ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439256; x=1726044056; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/kyF9mn9oESktxWYdr3s8d2VJ5iyYEZZY3E5BXrvv8=;
        b=HoKg7pjXlMHah6W/AxEsG6Yw8US832iwUYnUJOjSRSilvP14AUS6ECzeX3L/jMJ4km
         o9FqK643B8Pq5u0d7fe3hedM4cbhBsvfKszrjhCSr0nyyg9GIrPt7HXeLYd/+pCoAk50
         AN+DtbafrKuBVhTXQ6FifiKBLVkyabc2pjdbK1qLEs9wnztgbthQeWzX3AeqAZtJ2v4b
         eSWmclUtqRN/98qIp8FYmhfEa9w+ofsJpkJeqI2iUELR3oxFcqKO9e46mdTpYEi+jBN4
         Fk2e2vChBJaExbS+90wfmB2nj+SVfUOdYa/eX64N0qxrnjqHkxUa0dJSPjrG3Y0hh2sq
         nnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439256; x=1726044056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/kyF9mn9oESktxWYdr3s8d2VJ5iyYEZZY3E5BXrvv8=;
        b=C5azjvPI0gNQ+4AB0gcLFixWm7Sq13HuKVm4HrEixGNJO7VelCK+QqapDQf8Vdm0iv
         kypt2ZeCI0P32S+XaPdlW+rHMkf6lKxxgyy80tb83/7ebo3qPOQ28e3W+Kwn44jXyx7p
         6y5RcQ/u+q5FaiqdTjG6NJeOHFFgoIgY2AayE+uWsW5UXniUukneC0FForwfjHBszEnY
         lmqwQehFH6GcMwGDefkEOfQ/LlejTsiViQ9/Z3UJhQHEyvBMsg3xhZgeMj4vXnckOFdA
         vLhKZN5GUZmJiLLj/kN23mTm7kTOPzhEt2MFDsYLCLXnuGZ3t0BCnn2U2SG/p8xZccAm
         jefQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcdDo55J3y5xiLLuJWLrTuSqUU4OHlQM6yy7Mq0FmwG7ZF85awmokN+MAMl8i8mby5mEymLRsPL62nMWM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwlLjbkQoQ/++xBf/QKUHSCblREywLy0PpaPROfEixsuI1hlzAc
	uScE0AKRVvJPJb7enLP95t6zoqnN8qyF0u7KeBzjenCbsO1MSTqcYq7iagJbWB8=
X-Google-Smtp-Source: AGHT+IEEdhBdCGQBBk6sF5V8bi+PhpxKTNotIZgwSj7kMgQxLZV/04loActQGvyTL5xDqZZl1Kbj6A==
X-Received: by 2002:a17:902:f547:b0:206:b618:1d7f with SMTP id d9443c01a7336-206b61824c9mr14802495ad.37.1725439256381;
        Wed, 04 Sep 2024 01:40:56 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:40:56 -0700 (PDT)
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
Subject: [PATCH v3 02/14] arm: adjust_pte() use pte_offset_map_rw_nolock()
Date: Wed,  4 Sep 2024 16:40:10 +0800
Message-Id: <20240904084022.32728-3-zhengqi.arch@bytedance.com>
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

In do_adjust_pte(), we may modify the pte entry. The corresponding pmd
entry may have been modified concurrently. Therefore, in order to ensure
the stability if pmd entry, use pte_offset_map_rw_nolock() to replace
pte_offset_map_nolock(), and do pmd_same() check after holding the PTL.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 arch/arm/mm/fault-armv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 831793cd6ff94..de6c7d8a2ddfc 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -94,6 +94,7 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	pmd_t pmdval;
 	int ret;
 
 	pgd = pgd_offset(vma->vm_mm, address);
@@ -112,16 +113,22 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	if (pmd_none_or_clear_bad(pmd))
 		return 0;
 
+again:
 	/*
 	 * This is called while another page table is mapped, so we
 	 * must use the nested version.  This also means we need to
 	 * open-code the spin-locking.
 	 */
-	pte = pte_offset_map_nolock(vma->vm_mm, pmd, address, &ptl);
+	pte = pte_offset_map_rw_nolock(vma->vm_mm, pmd, address, &pmdval, &ptl);
 	if (!pte)
 		return 0;
 
 	do_pte_lock(ptl);
+	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
+		do_pte_unlock(ptl);
+		pte_unmap(pte);
+		goto again;
+	}
 
 	ret = do_adjust_pte(vma, address, pfn, pte);
 
-- 
2.20.1


