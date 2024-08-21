Return-Path: <linuxppc-dev+bounces-275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F387E9597F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:43:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpjbq63Vrz2yTs;
	Wed, 21 Aug 2024 20:43:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hY8g6DfC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfRQ3RSVz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:20:50 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2d439572aeaso379997a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228448; x=1724833248; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8nsSUZs0Rgdiv42AW7Io4vKbgKEW01jAKVQTF6mEcw=;
        b=hY8g6DfC3A0gVZXI3GqfPMSCioVJDLkG4mPu014MePtOEc178nemzmmAN44EUleeCv
         VX2cCkynDOWPShBtQzyu/zU8dl0Q6Rer/5501ufTf6QvrHeus3RcO2CxR3g0c8kiKETL
         BOTVVhIjPoWg4m0G0OCOci5RmqKrKamdgFzzl+gZdzTgoIf7DCucEQKa5pf0kB+MTJmC
         d/dvskqsD9LLYu4bVkvoR2ApAmLz2ph3vI/Xay6w4YPbN3VK/bW07ahO5cpA320eGSYJ
         TtjTNVX7e+kCaLvc6evvwPfaILUN0cH+c0FRi8rghMq2Qgz5syzRTV/UKdiBvh/r2yVt
         E8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228448; x=1724833248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8nsSUZs0Rgdiv42AW7Io4vKbgKEW01jAKVQTF6mEcw=;
        b=lDDxY9dgGcECKXc/H1JkejVrlJh9CRys8TZ1MnG9nv0oAtrC4yU3MIR9SlkZDWvg6l
         1WDCGqkuoJpqk4PDgkpTiOUCZxgDGgtEatIpffk2goAjRVuIkJdiSPbt86Au1q5cJ5uA
         0k3K06Dt4fTX1KgUHWhJXbMKIq8+Ugn+kLBVOp9w5Wc7QHYJPinKozgTuYzTe5wjlsxH
         A69xRXwq0IO5s/pXa0TFr82WPWyvUG1nmzJXdLPbulShEO8nEFrdVoTGiATdksHIanZy
         vBJjHwusZtjOJMLmiD5Jw0jYyyogpbTH/noMFMu94SJ8fdhbFxjdMTJ+ghaKuBOCjmEw
         490g==
X-Forwarded-Encrypted: i=1; AJvYcCWFG1Ii8ZfjywLm0zvyfCLxMLFHrqh5pl39Pn/zwJcsMwgf1aXhDMQTbAQaEV4QayWHpb58fn7M5PJ6h1c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDyvSmSDmkCZKApFDYCho+Htk7Pq+qu4i9AaQjPo0ikfCPPTXA
	uRVjfARBAjZ8AwotNHITSoqJioM+fZoZsaRX8dQULw7cA8c4MO5pR6ChpvLgwP8=
X-Google-Smtp-Source: AGHT+IFBw9G+gRGiVw886HN5nxLIybNKSDx7re7KNY7nJCh1bBtNFP6GTlUB4MiVeFJVy0IWyCdYMw==
X-Received: by 2002:a17:90a:d987:b0:2cf:fd50:a2d8 with SMTP id 98e67ed59e1d1-2d5e997c3demr2593063a91.7.1724228447873;
        Wed, 21 Aug 2024 01:20:47 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:20:47 -0700 (PDT)
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
	ryan.roberts@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 12/14] mm: multi-gen LRU: walk_pte_range() use pte_offset_map_maywrite_nolock()
Date: Wed, 21 Aug 2024 16:18:55 +0800
Message-Id: <1bdb1ec4a30acf6b3a376f746c96236328904768.1724226076.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724226076.git.zhengqi.arch@bytedance.com>
References: <cover.1724226076.git.zhengqi.arch@bytedance.com>
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
convert it to using pte_offset_map_maywrite_nolock(). At this time, the
write lock of mmap_lock is not held, and the pte_same() check is not
performed after the ptl held, so we should get pmdval and do pmd_same()
check to ensure the stability of pmd entry.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/vmscan.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 5dc96a843466a..a6620211f138a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3396,8 +3396,10 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
 	DEFINE_MAX_SEQ(walk->lruvec);
 	int old_gen, new_gen = lru_gen_from_seq(max_seq);
+	pmd_t pmdval;
 
-	pte = pte_offset_map_nolock(args->mm, pmd, start & PMD_MASK, &ptl);
+	pte = pte_offset_map_maywrite_nolock(args->mm, pmd, start & PMD_MASK,
+					     &pmdval, &ptl);
 	if (!pte)
 		return false;
 	if (!spin_trylock(ptl)) {
@@ -3405,6 +3407,11 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
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


